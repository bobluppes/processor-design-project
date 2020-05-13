-- cpu memory controller (when cache is disabled)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.cpu_pack.all;

entity mem_cntrl is
    generic (
        -- cpu params
        cpu_addr_width : integer := 32;
        cpu_data_width : integer := 32
	);
    port (
        aclk           : in  std_logic;
        aresetn        : in  std_logic;
        -- cpu
        cpu_address    : in  std_logic_vector(cpu_addr_width-1 downto 0);
        cpu_in_data    : in  std_logic_vector(cpu_data_width-1 downto 0);
        cpu_out_data   : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
        cpu_strobe     : in  std_logic_vector(cpu_data_width/8-1 downto 0);
        cpu_pause      : out std_logic;
        -- cache
        mem_cache_line : out std_logic;
        -- memory read
        mem_in_en      : out std_logic;
        mem_in_addr    : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
        mem_in_data    : in  std_logic_vector(cpu_data_width-1 downto 0);
        mem_in_ready   : out std_logic;
        mem_in_valid   : in  std_logic;
        -- memory write
        mem_out_en     : out std_logic := '0';
        mem_out_addr   : out std_logic_vector(cpu_addr_width-1 downto 0) := (others=>'0');
        mem_out_data   : out std_logic_vector(cpu_data_width-1 downto 0) := (others=>'0');
        mem_out_strobe : out std_logic_vector(cpu_data_width/8-1 downto 0) := (others=>'0');
        mem_out_ready  : in  std_logic;
        mem_out_valid  : out std_logic
	);
end mem_cntrl;

architecture Behavioral of mem_cntrl is
    subtype address_type is std_logic_vector(cpu_addr_width-1 downto 0);
    subtype strobe_type  is std_logic_vector(cpu_data_width/8-1 downto 0);
    subtype flag_type    is std_logic;
    signal cpu_pause_enable   : boolean := False;
    signal cpu_write_access   : boolean;
    signal mem_in_ready_buff  : std_logic := '0';
    signal mem_out_valid_buff : std_logic := '0';
begin
    mem_cache_line   <= '0';
    cpu_pause        <= '1' when cpu_pause_enable else '0';
    cpu_write_access <= True when or_reduce(cpu_strobe)/='0' else False;
    mem_in_ready     <= mem_in_ready_buff;
    mem_out_valid    <= mem_out_valid_buff;

    process (aclk)
        variable write_occurred : boolean;
        variable read_occurred  : boolean;
    begin
        if rising_edge(aclk) then
            if aresetn='0' then
                mem_in_ready_buff  <= '0';
                mem_out_valid_buff <= '0';
                mem_out_en         <= '0';
                mem_in_en          <= '0';
                cpu_pause_enable   <= False;
            else
                if not cpu_pause_enable then
                    cpu_pause_enable <= True;
                    if cpu_write_access then
                        mem_out_addr       <= cpu_address;
                        mem_out_strobe     <= cpu_strobe;
                        mem_out_en         <= '1';
                        mem_out_valid_buff <= '1';
                        mem_out_data       <= cpu_in_data;
                    else
                        mem_in_addr       <= cpu_address;
                        mem_in_en         <= '1';
                        mem_in_ready_buff <= '1';
                    end if;
                else
                    write_occurred := mem_out_valid_buff='1' and mem_out_ready='1';
                    read_occurred  := mem_in_valid='1' and mem_in_ready_buff='1';
                    if not cpu_write_access and read_occurred then
                        cpu_out_data <= mem_in_data;
                    end if;
                    if write_occurred or read_occurred then
                        mem_in_ready_buff  <= '0';
                        mem_out_valid_buff <= '0';
                        mem_out_en         <= '0';
                        mem_in_en          <= '0';
                        cpu_pause_enable   <= False;
                    end if;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
