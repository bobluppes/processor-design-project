library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.crossbar_pack.all; 
                
entity crossbar_axi_wr_cntrl is
    generic (
        axi_slave_no          : integer := 2;
        axi_master_no         : integer := 4
    );
    port (
        aclk                  : in  std_logic;
        aresetn               : in  std_logic;
        axi_write_master_id   : in  std_logic_vector(axi_slave_no*clogb2(axi_master_no)-1 downto 0);
        axi_write_slave_id    : in  std_logic_vector(axi_master_no*clogb2(axi_slave_no)-1 downto 0);
        axi_address_write_en  : out std_logic_vector(axi_slave_no*axi_master_no-1 downto 0);
        axi_data_write_en     : out std_logic_vector(axi_slave_no*axi_master_no-1 downto 0);
        axi_response_write_en : out std_logic_vector(axi_slave_no*axi_master_no-1 downto 0);
        s_axi_awvalid         : in  std_logic_vector(axi_slave_no*1-1 downto 0);
        s_axi_wvalid          : in  std_logic_vector(axi_slave_no*1-1 downto 0);
        s_axi_wlast           : in  std_logic_vector(axi_slave_no*1-1 downto 0);
        s_axi_bready          : in  std_logic_vector(axi_slave_no*1-1 downto 0);
        m_axi_awready         : in  std_logic_vector(axi_master_no*1-1 downto 0);
        m_axi_wready          : in  std_logic_vector(axi_master_no*1-1 downto 0);
        m_axi_bvalid          : in  std_logic_vector(axi_master_no*1-1 downto 0)
    );
end crossbar_axi_wr_cntrl;

architecture Behavioral of crossbar_axi_wr_cntrl is

    constant axi_slave_id_width  : integer := clogb2(axi_slave_no);
    constant axi_master_id_width : integer := clogb2(axi_master_no);
    
    function reduce_master_en(
        en : in std_logic_vector(axi_slave_no*axi_master_no-1 downto 0) ) return
        std_logic_vector is
        variable or_reduced : std_logic;
        variable reduce_en : std_logic_vector(axi_master_no-1 downto 0);
    begin
        for each_master in 0 to axi_master_no-1 loop
            or_reduced := '0';
            for each_slave in 0 to axi_slave_no-1 loop
                or_reduced := or_reduced or en(each_slave+each_master*axi_slave_no);
            end loop;
            reduce_en(each_master) := or_reduced;
        end loop;
        return reduce_en;
    end;
    
    function get_slave_handshakes ( 
        valid : in std_logic_vector(axi_slave_no-1 downto 0);
        ready : in std_logic_vector(axi_master_no-1 downto 0);
        master_id : in std_logic_vector(axi_slave_no*axi_master_id_width-1 downto 0) ) 
        return std_logic_vector is
        variable master_id_buff : integer range 0 to axi_master_no-1;
        variable slave_handshakes : std_logic_vector(axi_slave_no-1 downto 0) := (others=>'0');
    begin
        for each_slave in 0 to axi_slave_no-1 loop
            master_id_buff := to_integer(unsigned(master_id((1+each_slave)*axi_master_id_width-1 downto each_slave*axi_master_id_width)));
            if valid(each_slave)='1' and ready(master_id_buff)='1' then
                slave_handshakes(each_slave) := '1';
            end if;
        end loop;
        return slave_handshakes;
    end;
    
    function get_slave_permissions (
        slave_valid : in std_logic_vector(axi_slave_no-1 downto 0);
        master_id : in std_logic_vector(axi_slave_no*axi_master_id_width-1 downto 0);
        reduced_data_en : in std_logic_vector(axi_master_no-1 downto 0) ) return
        std_logic_vector is
        variable master_id_buff : integer range 0 to axi_master_no-1;
        variable slave_permissions : std_logic_vector(axi_slave_no-1 downto 0) := (others=>'0');
    begin
        for each_master in 0 to axi_master_no-1 loop
            for each_slave in 0 to axi_slave_no-1 loop
                master_id_buff := to_integer(unsigned(master_id((1+each_slave)*axi_master_id_width-1 downto each_slave*axi_master_id_width)));
                if each_master=master_id_buff and slave_valid(each_slave)='1' and reduced_data_en(master_id_buff)='0' then
                    slave_permissions(each_slave) := '1';
                    exit;
                end if;
            end loop;
        end loop;
        return slave_permissions;
    end;
    
    function set_slave_en_ff(
        slave_permissions : in std_logic_vector(axi_slave_no-1 downto 0);
        slave_handshakes : in std_logic_vector(axi_slave_no-1 downto 0);
        slave_last : in std_logic_vector(axi_slave_no-1 downto 0);
        master_id : in std_logic_vector(axi_slave_no*axi_master_id_width-1 downto 0);
        slave_en : in std_logic_vector(axi_slave_no*axi_master_no-1 downto 0) ) return
        std_logic_vector is
        variable master_id_buff : integer range 0 to axi_master_no-1;
        variable slave_en_buff : std_logic_vector(axi_slave_no*axi_master_no-1 downto 0);
    begin
        slave_en_buff := slave_en;
        for each_slave in 0 to axi_slave_no-1 loop
            master_id_buff := to_integer(unsigned(master_id((1+each_slave)*axi_master_id_width-1 downto each_slave*axi_master_id_width)));
            if slave_permissions(each_slave)='1' then
                slave_en_buff(each_slave+master_id_buff*axi_slave_no) := '1';
            elsif slave_handshakes(each_slave)='1' and slave_last(each_slave)='1' then
                for each_master in 0 to axi_master_no-1 loop
                    slave_en_buff(each_slave+each_master*axi_slave_no) := '0';
                end loop;
            end if;
        end loop;
        return slave_en_buff;
    end;
    
    function reduce_slave_en(
        en : in std_logic_vector(axi_slave_no*axi_master_no-1 downto 0) ) return
        std_logic_vector is
        variable or_reduced : std_logic;
        variable reduce_en : std_logic_vector(axi_slave_no-1 downto 0);
    begin
        for each_slave in 0 to axi_slave_no-1 loop
            or_reduced := '0';
                for each_master in 0 to axi_master_no-1 loop
                or_reduced := or_reduced or en(each_slave+each_master*axi_slave_no);
            end loop;
            reduce_en(each_slave) := or_reduced;
        end loop;
        return reduce_en;
    end;
    
    function get_master_handshakes ( 
        valid : in std_logic_vector(axi_master_no-1 downto 0);
        ready : in std_logic_vector(axi_slave_no-1 downto 0);
        slave_id : in std_logic_vector(axi_master_no*axi_slave_id_width-1 downto 0) ) 
        return std_logic_vector is
        variable slave_id_buff : integer range 0 to axi_slave_no-1;
        variable master_handshakes : std_logic_vector(axi_master_no-1 downto 0) := (others=>'0');
    begin
        for each_master in 0 to axi_master_no-1 loop
            slave_id_buff := to_integer(unsigned(slave_id((1+each_master)*axi_slave_id_width-1 downto each_master*axi_slave_id_width)));
            if valid(each_master)='1' and ready(slave_id_buff)='1' then
                master_handshakes(each_master) := '1';
            end if;
        end loop;
        return master_handshakes;
    end;
    
    function get_master_permissions (
        master_valid : in std_logic_vector(axi_master_no-1 downto 0);
        slave_id : in std_logic_vector(axi_master_no*axi_slave_id_width-1 downto 0);
        reduced_response_en : in std_logic_vector(axi_slave_no-1 downto 0) ) return
        std_logic_vector is
        variable slave_id_buff : integer range 0 to axi_slave_no-1;
        variable master_permissions : std_logic_vector(axi_master_no-1 downto 0) := (others=>'0');
    begin
        for each_master in 0 to axi_master_no-1 loop
            slave_id_buff := to_integer(unsigned(slave_id((1+each_master)*axi_slave_id_width-1 downto each_master*axi_slave_id_width)));
            for each_slave in 0 to axi_slave_no-1 loop
                if each_slave=slave_id_buff and master_valid(each_master)='1' and reduced_response_en(slave_id_buff)='0' then
                    master_permissions(each_master) := '1';
                    exit;
                end if;
            end loop;
        end loop;
        return master_permissions;
    end;
    
    function set_master_enables_ff (
        master_permissions : in std_logic_vector(axi_master_no-1 downto 0);
        master_handshakes : in std_logic_vector(axi_master_no-1 downto 0);
        slave_id : in std_logic_vector(axi_master_no*axi_slave_id_width-1 downto 0);
        master_en : in std_logic_vector(axi_slave_no*axi_master_no-1 downto 0) ) return
        std_logic_vector is
        variable slave_id_buff : integer range 0 to axi_slave_no-1;
        variable master_en_buff : std_logic_vector(axi_slave_no*axi_master_no-1 downto 0);
    begin
        master_en_buff := master_en;
        for each_master in 0 to axi_master_no-1 loop
            slave_id_buff := to_integer(unsigned(slave_id((1+each_master)*axi_slave_id_width-1 downto each_master*axi_slave_id_width)));
            if master_permissions(each_master)='1' then
                master_en_buff(slave_id_buff+each_master*axi_slave_no) := '1';
            elsif master_handshakes(each_master)='1' then
                for each_slave in 0 to axi_slave_no-1 loop
                    master_en_buff(each_slave+each_master*axi_slave_no) := '0';
                end loop;
            end if;
        end loop;
        return master_en_buff;
    end;
    
    signal address_slave_handshakes : std_logic_vector(axi_slave_no-1 downto 0) := (others=>'0');
    signal data_slave_handshakes : std_logic_vector(axi_slave_no-1 downto 0) := (others=>'0');
    signal axi_address_write_en_buff : std_logic_vector(axi_slave_no*axi_master_no-1 downto 0) := (others=>'0');
    signal axi_data_write_en_buff : std_logic_vector(axi_slave_no*axi_master_no-1 downto 0) := (others=>'0');
    signal reduced_data_write_en : std_logic_vector(axi_master_no-1 downto 0) := (others=>'0');
    signal slave_permissions : std_logic_vector(axi_slave_no-1 downto 0) := (others=>'0');    
    signal response_master_handshakes : std_logic_vector(axi_master_no-1 downto 0) := (others=>'0');
    signal axi_response_write_en_buff : std_logic_vector(axi_slave_no*axi_master_no-1 downto 0) := (others=>'0');
    signal reduced_response_write_en : std_logic_vector(axi_slave_no-1 downto 0) := (others=>'0');
    signal master_permissions : std_logic_vector(axi_master_no-1 downto 0) := (others=>'0');
begin

    axi_address_write_en  <= axi_address_write_en_buff;
    axi_data_write_en     <= axi_data_write_en_buff;
    axi_response_write_en <= axi_response_write_en_buff;

    process (s_axi_awvalid,m_axi_awready,axi_write_master_id)
    begin
        address_slave_handshakes <= get_slave_handshakes(s_axi_awvalid,m_axi_awready,axi_write_master_id);
    end process;
    process (s_axi_wvalid,m_axi_wready,axi_write_master_id)
    begin
        data_slave_handshakes <= get_slave_handshakes(s_axi_wvalid,m_axi_wready,axi_write_master_id);
    end process;
    process (axi_data_write_en_buff)
    begin
        reduced_data_write_en <= reduce_master_en(axi_data_write_en_buff);
    end process;
    process (s_axi_awvalid,axi_write_master_id,reduced_data_write_en)
    begin
        slave_permissions <= get_slave_permissions(s_axi_awvalid,axi_write_master_id,reduced_data_write_en);
    end process;
    
    process (m_axi_bvalid,s_axi_bready,axi_write_slave_id)
    begin
        response_master_handshakes <= get_master_handshakes(m_axi_bvalid,s_axi_bready,axi_write_slave_id);
    end process;
    process (axi_response_write_en_buff)
    begin
        reduced_response_write_en <= reduce_slave_en(axi_response_write_en_buff);
    end process;
    process (m_axi_bvalid,axi_write_slave_id,reduced_response_write_en)
    begin
        master_permissions <= get_master_permissions(m_axi_bvalid,axi_write_slave_id,reduced_response_write_en);
    end process;
    
    process (aclk)
    begin
        if rising_edge(aclk) then
            if aresetn='0' then
                axi_address_write_en_buff  <= (others=>'0');
                axi_data_write_en_buff     <= (others=>'0');
                axi_response_write_en_buff <= (others=>'0');
            else
                axi_address_write_en_buff  <= set_slave_en_ff(slave_permissions,address_slave_handshakes,(others=>'1'),axi_write_master_id,axi_address_write_en_buff);
                axi_data_write_en_buff     <= set_slave_en_ff(slave_permissions,data_slave_handshakes,s_axi_wlast,axi_write_master_id,axi_data_write_en_buff);
                axi_response_write_en_buff <= set_master_enables_ff(master_permissions,response_master_handshakes,axi_write_slave_id,axi_response_write_en_buff);
            end if;
        end if;
    end process;
    

end Behavioral;