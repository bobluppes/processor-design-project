library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package cpu_pack is

    -- default mlite params
    constant default_mult_type            : string  := "DEFAULT";   -- AREA_OPTIMIZED
    constant default_shifter_type         : string  := "DEFAULT";   -- AREA_OPTIMIZED
    constant default_alu_type             : string  := "DEFAULT";   -- AREA_OPTIMIZED

    -- default cache params
    constant default_cache_way_width      : integer := 0;
    constant default_cache_index_width    : integer := 9;
    constant default_cache_offset_width   : integer := 2;
    constant default_cache_address_width  : integer := 21;
    constant default_cache_replace_policy : string  := "RR";
    constant default_cache_enable         : string  := "True";  -- False
    
    -- functions declaration
    function clogb2(bit_depth : in integer ) return integer;
    function flogb2(bit_depth : in natural ) return integer;
    
    -- components declaration
    component cpu is
        generic(            
            shifter_type         : string  := default_shifter_type;
            alu_type             : string  := default_alu_type;
            mult_type            : string  := default_mult_type;
            cache_enable         : string  := default_cache_enable;
            cache_way_width      : integer := default_cache_way_width;
            cache_index_width    : integer := default_cache_index_width;
            cache_offset_width   : integer := default_cache_offset_width;
            cache_address_width  : integer := default_cache_address_width;
            cache_replace_policy : string  := default_cache_replace_policy            
        ); 
        port(
            aclk              : in  std_logic;
            aresetn           : in  std_logic;
            axi_awid          : out std_logic_vector( 0 downto 0);
            axi_awaddr        : out std_logic_vector(31 downto 0);
            axi_awlen         : out std_logic_vector( 7 downto 0);
            axi_awsize        : out std_logic_vector( 2 downto 0);
            axi_awburst       : out std_logic_vector( 1 downto 0);
            axi_awlock        : out std_logic;
            axi_awcache       : out std_logic_vector( 3 downto 0);
            axi_awprot        : out std_logic_vector( 2 downto 0);
            axi_awqos         : out std_logic_vector( 3 downto 0);
            axi_awregion      : out std_logic_vector( 3 downto 0);
            axi_awvalid       : out std_logic;
            axi_awready       : in  std_logic;
            axi_wdata         : out std_logic_vector(31 downto 0);
            axi_wstrb         : out std_logic_vector( 3 downto 0);
            axi_wlast         : out std_logic;
            axi_wvalid        : out std_logic;
            axi_wready        : in  std_logic;
            axi_bid           : in  std_logic_vector( 0 downto 0);
            axi_bresp         : in  std_logic_vector( 1 downto 0);
            axi_bvalid        : in  std_logic;
            axi_bready        : out std_logic;
            axi_arid          : out std_logic_vector( 0 downto 0);
            axi_araddr        : out std_logic_vector(31 downto 0);
            axi_arlen         : out std_logic_vector( 7 downto 0);
            axi_arsize        : out std_logic_vector( 2 downto 0);
            axi_arburst       : out std_logic_vector( 1 downto 0);
            axi_arlock        : out std_logic;
            axi_arcache       : out std_logic_vector( 3 downto 0);
            axi_arprot        : out std_logic_vector( 2 downto 0);
            axi_arqos         : out std_logic_vector( 3 downto 0);
            axi_arregion      : out std_logic_vector( 3 downto 0);
            axi_arvalid       : out std_logic;
            axi_arready       : in  std_logic;
            axi_rid           : in  std_logic_vector( 0 downto 0);
            axi_rdata         : in  std_logic_vector(31 downto 0);
            axi_rresp         : in  std_logic_vector( 1 downto 0);
            axi_rlast         : in  std_logic;
            axi_rvalid        : in  std_logic;
            axi_rready        : out std_logic;
            uart_tx_cpu_pause : in  std_logic
        );
    end component;
end;

package body cpu_pack is
    -- 
    function flogb2(bit_depth : in natural ) return integer is
        variable result         : integer := 0;
        variable bit_depth_buff : integer := bit_depth;
	begin
		while bit_depth_buff>1 loop
            bit_depth_buff := bit_depth_buff/2;
            result         := result+1;
		end loop; 
		return result;
	end function flogb2; 
	
    -- 
	function clogb2 (bit_depth : in natural ) return natural is
        variable result : integer := 0;
    begin
        result := flogb2(bit_depth);
        if (bit_depth > (2**result)) then
            return(result + 1);
        else
            return result;
        end if;
    end function clogb2;
	
    -- 
    function bv_inc(a : in std_logic_vector) return std_logic_vector is
        variable carry_in : std_logic;
        variable result   : std_logic_vector(a'length-1 downto 0);
    begin
        carry_in := '1';
        for index in 0 to a'length-1 loop
            result(index) := a(index) xor carry_in;
            carry_in      := a(index) and carry_in;
        end loop;
        return result;
    end; 

end; 
