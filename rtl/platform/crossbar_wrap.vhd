library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.crossbar_pack.crossbar;
use work.crossbar_wrap_pack.all;

entity crossbar_wrap is
	generic(
		axi_address_width       : integer := 32;
		axi_data_width          : integer := 32;
		axi_slave_id_width      : integer := 0;
		axi_master_amount       : integer := 3;
		axi_slave_amount        : integer := 1;
		axi_master_base_address : std_logic_vector := X"200000001000000000000000";   -- uart; ram; bram
		axi_master_high_address : std_logic_vector := X"2000ffff11ffffff00001fff"    -- uart; ram; bram
	);
	port(
		aclk                    : in std_logic;
		aresetn                 : in std_logic;
		cpu_s_axi_awid          : in  std_logic_vector(0 downto 0);
		cpu_s_axi_awaddr        : in  std_logic_vector(axi_address_width-1 downto 0);
		cpu_s_axi_awlen         : in  std_logic_vector(7 downto 0);
		cpu_s_axi_awsize        : in  std_logic_vector(2 downto 0);
		cpu_s_axi_awburst       : in  std_logic_vector(1 downto 0);
		cpu_s_axi_awlock        : in  std_logic;
		cpu_s_axi_awcache       : in  std_logic_vector(3 downto 0);
		cpu_s_axi_awprot        : in  std_logic_vector(2 downto 0);
		cpu_s_axi_awqos         : in  std_logic_vector(3 downto 0);
		cpu_s_axi_awregion      : in  std_logic_vector(3 downto 0);
		cpu_s_axi_awvalid       : in  std_logic;
		cpu_s_axi_awready       : out std_logic;
		cpu_s_axi_wdata         : in  std_logic_vector(axi_data_width-1 downto 0);
		cpu_s_axi_wstrb         : in  std_logic_vector(axi_data_width/8-1 downto 0);
		cpu_s_axi_wlast         : in  std_logic;
		cpu_s_axi_wvalid        : in  std_logic;
		cpu_s_axi_wready        : out std_logic;
		cpu_s_axi_bid           : out std_logic_vector(0 downto 0);
		cpu_s_axi_bresp         : out std_logic_vector(1 downto 0);
		cpu_s_axi_bvalid        : out std_logic;
		cpu_s_axi_bready        : in  std_logic;
		cpu_s_axi_arid          : in  std_logic_vector(0 downto 0);
		cpu_s_axi_araddr        : in  std_logic_vector(axi_address_width-1 downto 0);
		cpu_s_axi_arlen         : in  std_logic_vector(7 downto 0);
		cpu_s_axi_arsize        : in  std_logic_vector(2 downto 0);
		cpu_s_axi_arburst       : in  std_logic_vector(1 downto 0);
		cpu_s_axi_arlock        : in  std_logic;
		cpu_s_axi_arcache       : in  std_logic_vector(3 downto 0);
		cpu_s_axi_arprot        : in  std_logic_vector(2 downto 0);
		cpu_s_axi_arqos         : in  std_logic_vector(3 downto 0);
		cpu_s_axi_arregion      : in  std_logic_vector(3 downto 0);
		cpu_s_axi_arvalid       : in  std_logic;
		cpu_s_axi_arready       : out std_logic;
		cpu_s_axi_rid           : out std_logic_vector(0 downto 0);
		cpu_s_axi_rdata         : out std_logic_vector(axi_data_width-1 downto 0);
		cpu_s_axi_rresp         : out std_logic_vector(1 downto 0);
		cpu_s_axi_rlast         : out std_logic;
		cpu_s_axi_rvalid        : out std_logic;
		cpu_s_axi_rready        : in  std_logic;
	
		bram_m_axi_awid         : out  std_logic_vector(0 downto 0);
		bram_m_axi_awaddr       : out  std_logic_vector(axi_address_width-1 downto 0);
		bram_m_axi_awlen        : out  std_logic_vector(7 downto 0);
		bram_m_axi_awsize       : out  std_logic_vector(2 downto 0);
		bram_m_axi_awburst      : out  std_logic_vector(1 downto 0);
		bram_m_axi_awlock       : out  std_logic;
		bram_m_axi_awcache      : out  std_logic_vector(3 downto 0);
		bram_m_axi_awprot       : out  std_logic_vector(2 downto 0);
		bram_m_axi_awqos        : out  std_logic_vector(3 downto 0);
		bram_m_axi_awregion     : out  std_logic_vector(3 downto 0);
		bram_m_axi_awvalid      : out  std_logic;
		bram_m_axi_awready      : in   std_logic;
		bram_m_axi_wdata        : out  std_logic_vector(axi_data_width-1 downto 0);
		bram_m_axi_wstrb        : out  std_logic_vector(axi_data_width/8-1 downto 0);
		bram_m_axi_wlast        : out  std_logic;
		bram_m_axi_wvalid       : out  std_logic;
		bram_m_axi_wready       : in   std_logic;
		bram_m_axi_bid          : in   std_logic_vector(0 downto 0);
		bram_m_axi_bresp        : in   std_logic_vector(1 downto 0);
		bram_m_axi_bvalid       : in   std_logic;
		bram_m_axi_bready       : out  std_logic;
		bram_m_axi_arid         : out  std_logic_vector(0 downto 0);
		bram_m_axi_araddr       : out  std_logic_vector(axi_address_width-1 downto 0);
		bram_m_axi_arlen        : out  std_logic_vector(7 downto 0);
		bram_m_axi_arsize       : out  std_logic_vector(2 downto 0);
		bram_m_axi_arburst      : out  std_logic_vector(1 downto 0);
		bram_m_axi_arlock       : out  std_logic;
		bram_m_axi_arcache      : out  std_logic_vector(3 downto 0);
		bram_m_axi_arprot       : out  std_logic_vector(2 downto 0);
		bram_m_axi_arqos        : out  std_logic_vector(3 downto 0);
		bram_m_axi_arregion     : out  std_logic_vector(3 downto 0);
		bram_m_axi_arvalid      : out  std_logic;
		bram_m_axi_arready      : in   std_logic;
		bram_m_axi_rid          : in   std_logic_vector(0 downto 0);
		bram_m_axi_rdata        : in   std_logic_vector(axi_data_width-1 downto 0);
		bram_m_axi_rresp        : in   std_logic_vector(1 downto 0);
		bram_m_axi_rlast        : in   std_logic;
		bram_m_axi_rvalid       : in   std_logic;
		bram_m_axi_rready       : out  std_logic;

		ram_m_axi_awid          : out  std_logic_vector(0 downto 0);
		ram_m_axi_awaddr        : out  std_logic_vector(axi_address_width-1 downto 0);
		ram_m_axi_awlen         : out  std_logic_vector(7 downto 0);
		ram_m_axi_awsize        : out  std_logic_vector(2 downto 0);
		ram_m_axi_awburst       : out  std_logic_vector(1 downto 0);
		ram_m_axi_awlock        : out  std_logic;
		ram_m_axi_awcache       : out  std_logic_vector(3 downto 0);
		ram_m_axi_awprot        : out  std_logic_vector(2 downto 0);
		ram_m_axi_awqos         : out  std_logic_vector(3 downto 0);
		ram_m_axi_awregion      : out  std_logic_vector(3 downto 0);
		ram_m_axi_awvalid       : out  std_logic;
		ram_m_axi_awready       : in  std_logic;
		ram_m_axi_wdata         : out  std_logic_vector(axi_data_width-1 downto 0);
		ram_m_axi_wstrb         : out  std_logic_vector(axi_data_width/8-1 downto 0);
		ram_m_axi_wlast         : out  std_logic;
		ram_m_axi_wvalid        : out  std_logic;
		ram_m_axi_wready        : in  std_logic;
		ram_m_axi_bid           : in  std_logic_vector(0 downto 0);
		ram_m_axi_bresp         : in  std_logic_vector(1 downto 0);
		ram_m_axi_bvalid        : in  std_logic;
		ram_m_axi_bready        : out  std_logic;
		ram_m_axi_arid          : out  std_logic_vector(0 downto 0);
		ram_m_axi_araddr        : out  std_logic_vector(axi_address_width-1 downto 0);
		ram_m_axi_arlen         : out  std_logic_vector(7 downto 0);
		ram_m_axi_arsize        : out  std_logic_vector(2 downto 0);
		ram_m_axi_arburst       : out  std_logic_vector(1 downto 0);
		ram_m_axi_arlock        : out  std_logic;
		ram_m_axi_arcache       : out  std_logic_vector(3 downto 0);
		ram_m_axi_arprot        : out  std_logic_vector(2 downto 0);
		ram_m_axi_arqos         : out  std_logic_vector(3 downto 0);
		ram_m_axi_arregion      : out  std_logic_vector(3 downto 0);
		ram_m_axi_arvalid       : out  std_logic;
		ram_m_axi_arready       : in  std_logic;
		ram_m_axi_rid           : in  std_logic_vector(0 downto 0);
		ram_m_axi_rdata         : in  std_logic_vector(axi_data_width-1 downto 0);
		ram_m_axi_rresp         : in  std_logic_vector(1 downto 0);
		ram_m_axi_rlast         : in  std_logic;
		ram_m_axi_rvalid        : in  std_logic;
		ram_m_axi_rready        : out  std_logic;
		
		uart_m_axi_awid         : out  std_logic_vector(0 downto 0);
		uart_m_axi_awaddr       : out  std_logic_vector(axi_address_width-1 downto 0);
		uart_m_axi_awlen        : out  std_logic_vector(7 downto 0);
		uart_m_axi_awsize       : out  std_logic_vector(2 downto 0);
		uart_m_axi_awburst      : out  std_logic_vector(1 downto 0);
		uart_m_axi_awlock       : out  std_logic;
		uart_m_axi_awcache      : out  std_logic_vector(3 downto 0);
		uart_m_axi_awprot       : out  std_logic_vector(2 downto 0);
		uart_m_axi_awqos        : out  std_logic_vector(3 downto 0);
		uart_m_axi_awregion     : out  std_logic_vector(3 downto 0);
		uart_m_axi_awvalid      : out  std_logic;
		uart_m_axi_awready      : in  std_logic;
		uart_m_axi_wdata        : out  std_logic_vector(axi_data_width-1 downto 0);
		uart_m_axi_wstrb        : out  std_logic_vector(axi_data_width/8-1 downto 0);
		uart_m_axi_wlast        : out  std_logic;
		uart_m_axi_wvalid       : out  std_logic;
		uart_m_axi_wready       : in  std_logic;
		uart_m_axi_bid          : in  std_logic_vector(0 downto 0);
		uart_m_axi_bresp        : in  std_logic_vector(1 downto 0);
		uart_m_axi_bvalid       : in  std_logic;
		uart_m_axi_bready       : out  std_logic;
		uart_m_axi_arid         : out  std_logic_vector(0 downto 0);
		uart_m_axi_araddr       : out  std_logic_vector(axi_address_width-1 downto 0);
		uart_m_axi_arlen        : out  std_logic_vector(7 downto 0);
		uart_m_axi_arsize       : out  std_logic_vector(2 downto 0);
		uart_m_axi_arburst      : out  std_logic_vector(1 downto 0);
		uart_m_axi_arlock       : out  std_logic;
		uart_m_axi_arcache      : out  std_logic_vector(3 downto 0);
		uart_m_axi_arprot       : out  std_logic_vector(2 downto 0);
		uart_m_axi_arqos        : out  std_logic_vector(3 downto 0);
		uart_m_axi_arregion     : out  std_logic_vector(3 downto 0);
		uart_m_axi_arvalid      : out  std_logic;
		uart_m_axi_arready      : in  std_logic;
		uart_m_axi_rid          : in  std_logic_vector(0 downto 0);
		uart_m_axi_rdata        : in  std_logic_vector(axi_data_width-1 downto 0);
		uart_m_axi_rresp        : in  std_logic_vector(1 downto 0);
		uart_m_axi_rlast        : in  std_logic;
		uart_m_axi_rvalid       : in  std_logic;
		uart_m_axi_rready       : out  std_logic
	);
end crossbar_wrap;

architecture Behavioral of crossbar_wrap is
	constant axi_master_id_width : integer := clogb2(axi_slave_amount)+axi_slave_id_width;
	signal s_axi_awid                 : std_logic_vector(0 downto 0);
	signal s_axi_awaddr               : std_logic_vector(axi_slave_amount*axi_address_width-1 downto 0);
	signal s_axi_awlen                : std_logic_vector(axi_slave_amount*8-1 downto 0);
	signal s_axi_awsize               : std_logic_vector(axi_slave_amount*3-1 downto 0);
	signal s_axi_awburst              : std_logic_vector(axi_slave_amount*2-1 downto 0);
	signal s_axi_awlock               : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_awcache              : std_logic_vector(axi_slave_amount*4-1 downto 0);
	signal s_axi_awprot               : std_logic_vector(axi_slave_amount*3-1 downto 0);
	signal s_axi_awqos                : std_logic_vector(axi_slave_amount*4-1 downto 0);
	signal s_axi_awregion             : std_logic_vector(axi_slave_amount*4-1 downto 0);
	signal s_axi_awvalid              : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_awready              : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_wdata                : std_logic_vector(axi_slave_amount*axi_data_width-1 downto 0);
	signal s_axi_wstrb                : std_logic_vector(axi_slave_amount*axi_data_width/8-1 downto 0);
	signal s_axi_wlast                : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_wvalid               : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_wready               : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_bid                  : std_logic_vector(0 downto 0);
	signal s_axi_bresp                : std_logic_vector(axi_slave_amount*2-1 downto 0);
	signal s_axi_bvalid               : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_bready               : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_arid                 : std_logic_vector(0 downto 0);
	signal s_axi_araddr               : std_logic_vector(axi_slave_amount*axi_address_width-1 downto 0);
	signal s_axi_arlen                : std_logic_vector(axi_slave_amount*8-1 downto 0);
	signal s_axi_arsize               : std_logic_vector(axi_slave_amount*3-1 downto 0);
	signal s_axi_arburst              : std_logic_vector(axi_slave_amount*2-1 downto 0);
	signal s_axi_arlock               : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_arcache              : std_logic_vector(axi_slave_amount*4-1 downto 0);
	signal s_axi_arprot               : std_logic_vector(axi_slave_amount*3-1 downto 0);
	signal s_axi_arqos                : std_logic_vector(axi_slave_amount*4-1 downto 0);
	signal s_axi_arregion             : std_logic_vector(axi_slave_amount*4-1 downto 0);
	signal s_axi_arvalid              : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_arready              : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_rid                  : std_logic_vector(0 downto 0);
	signal s_axi_rdata                : std_logic_vector(axi_slave_amount*axi_data_width-1 downto 0);
	signal s_axi_rresp                : std_logic_vector(axi_slave_amount*2-1 downto 0);
	signal s_axi_rlast                : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_rvalid               : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal s_axi_rready               : std_logic_vector(axi_slave_amount*1-1 downto 0);
	signal m_axi_awid                 : std_logic_vector(axi_master_amount*axi_master_id_width-1 downto 0);
	signal m_axi_awaddr               : std_logic_vector(axi_master_amount*axi_address_width-1 downto 0);
	signal m_axi_awlen                : std_logic_vector(axi_master_amount*8-1 downto 0);
	signal m_axi_awsize               : std_logic_vector(axi_master_amount*3-1 downto 0);
	signal m_axi_awburst              : std_logic_vector(axi_master_amount*2-1 downto 0);
	signal m_axi_awlock               : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_awcache              : std_logic_vector(axi_master_amount*4-1 downto 0);
	signal m_axi_awprot               : std_logic_vector(axi_master_amount*3-1 downto 0);
	signal m_axi_awqos                : std_logic_vector(axi_master_amount*4-1 downto 0);
	signal m_axi_awregion             : std_logic_vector(axi_master_amount*4-1 downto 0);
	signal m_axi_awvalid              : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_awready              : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_wdata                : std_logic_vector(axi_master_amount*axi_data_width-1 downto 0);
	signal m_axi_wstrb                : std_logic_vector(axi_master_amount*axi_data_width/8-1 downto 0);
	signal m_axi_wlast                : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_wvalid               : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_wready               : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_bid                  : std_logic_vector(axi_master_amount*axi_master_id_width-1 downto 0);
	signal m_axi_bresp                : std_logic_vector(axi_master_amount*2-1 downto 0);
	signal m_axi_bvalid               : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_bready               : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_arid                 : std_logic_vector(axi_master_amount*axi_master_id_width-1 downto 0);
	signal m_axi_araddr               : std_logic_vector(axi_master_amount*axi_address_width-1 downto 0);
	signal m_axi_arlen                : std_logic_vector(axi_master_amount*8-1 downto 0);
	signal m_axi_arsize               : std_logic_vector(axi_master_amount*3-1 downto 0);
	signal m_axi_arburst              : std_logic_vector(axi_master_amount*2-1 downto 0);
	signal m_axi_arlock               : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_arcache              : std_logic_vector(axi_master_amount*4-1 downto 0);
	signal m_axi_arprot               : std_logic_vector(axi_master_amount*3-1 downto 0);
	signal m_axi_arqos                : std_logic_vector(axi_master_amount*4-1 downto 0);
	signal m_axi_arregion             : std_logic_vector(axi_master_amount*4-1 downto 0);
	signal m_axi_arvalid              : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_arready              : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_rid                  : std_logic_vector(axi_master_amount*axi_master_id_width-1 downto 0);
	signal m_axi_rdata                : std_logic_vector(axi_master_amount*axi_data_width-1 downto 0);
	signal m_axi_rresp                : std_logic_vector(axi_master_amount*2-1 downto 0);
	signal m_axi_rlast                : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_rvalid               : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal m_axi_rready               : std_logic_vector(axi_master_amount*1-1 downto 0);
	signal s_address_write_connected  : std_logic_vector(axi_slave_amount-1 downto 0);
	signal s_data_write_connected     : std_logic_vector(axi_slave_amount-1 downto 0);
	signal s_response_write_connected : std_logic_vector(axi_slave_amount-1 downto 0);
	signal s_address_read_connected   : std_logic_vector(axi_slave_amount-1 downto 0);
	signal s_data_read_connected      : std_logic_vector(axi_slave_amount-1 downto 0);
	signal m_address_write_connected  : std_logic_vector(axi_master_amount-1 downto 0);
	signal m_data_write_connected     : std_logic_vector(axi_master_amount-1 downto 0);
	signal m_response_write_connected : std_logic_vector(axi_master_amount-1 downto 0);
	signal m_address_read_connected   : std_logic_vector(axi_master_amount-1 downto 0);
	signal m_data_read_connected      : std_logic_vector(axi_master_amount-1 downto 0);

	signal s_axi_awid_UNCONNECTED     : std_logic_vector(-1 downto 0);
	signal s_axi_bid_UNCONNECTED      : std_logic_vector(-1 downto 0);
	signal s_axi_arid_UNCONNECTED     : std_logic_vector(-1 downto 0);
	signal s_axi_rid_UNCONNECTED      : std_logic_vector(-1 downto 0);

begin
	s_axi_awid          <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awid;
	s_axi_awaddr        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awaddr;
	s_axi_awlen         <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awlen;
	s_axi_awsize        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awsize;
	s_axi_awburst       <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awburst;
	s_axi_awlock        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awlock;
	s_axi_awcache       <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awcache;
	s_axi_awprot        <= std_logic_vector(to_unsigned(0,0))  & cpu_s_axi_awprot;
	s_axi_awqos         <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awqos;
	s_axi_awregion      <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awregion;
	s_axi_awvalid       <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_awvalid;
	s_axi_wdata         <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_wdata;
	s_axi_wstrb         <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_wstrb;
	s_axi_wlast         <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_wlast;
	s_axi_wvalid        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_wvalid;
	s_axi_bready        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_bready;
	s_axi_arid          <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arid;
	s_axi_araddr        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_araddr;
	s_axi_arlen         <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arlen;
	s_axi_arsize        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arsize;
	s_axi_arburst       <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arburst;
	s_axi_arlock        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arlock;
	s_axi_arcache       <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arcache;
	s_axi_arprot        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arprot;
	s_axi_arqos         <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arqos;
	s_axi_arregion      <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arregion;
	s_axi_arvalid       <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_arvalid;
	s_axi_rready        <= std_logic_vector(to_unsigned(0,0)) & cpu_s_axi_rready;
	m_axi_awready       <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_awready & ram_m_axi_awready & bram_m_axi_awready;
	m_axi_wready        <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_wready & ram_m_axi_wready & bram_m_axi_wready;
	m_axi_bid           <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_bid & ram_m_axi_bid & bram_m_axi_bid;
	m_axi_bresp         <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_bresp & ram_m_axi_bresp & bram_m_axi_bresp;
	m_axi_bvalid        <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_bvalid & ram_m_axi_bvalid & bram_m_axi_bvalid;
	m_axi_arready       <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_arready & ram_m_axi_arready & bram_m_axi_arready;
	m_axi_rid           <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_rid & ram_m_axi_rid & bram_m_axi_rid;
	m_axi_rdata         <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_rdata & ram_m_axi_rdata & bram_m_axi_rdata;
	m_axi_rresp         <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_rresp & ram_m_axi_rresp & bram_m_axi_rresp;
	m_axi_rlast         <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_rlast & ram_m_axi_rlast & bram_m_axi_rlast;
	m_axi_rvalid        <= std_logic_vector(to_unsigned(0,0)) & uart_m_axi_rvalid & ram_m_axi_rvalid & bram_m_axi_rvalid;
	
	cpu_s_axi_awready   <= '0' when s_address_write_connected(0)='0' else s_axi_awready(0);
	cpu_s_axi_wready    <= '0' when s_data_write_connected(0)='0' else s_axi_wready(0);
	cpu_s_axi_bid       <= (others=>'0') when s_response_write_connected(0)='0' else s_axi_bid(0 downto 0);
	cpu_s_axi_bresp     <= (others=>'0') when s_response_write_connected(0)='0' else s_axi_bresp((1+0)*2-1 downto 0*2);
	cpu_s_axi_bvalid    <= '0' when s_response_write_connected(0)='0' else s_axi_bvalid(0);
	cpu_s_axi_arready   <= '0' when s_address_read_connected(0)='0' else s_axi_arready(0);
	cpu_s_axi_rid       <= (others=>'0') when s_data_read_connected(0)='0' else s_axi_rid(0 downto 0);
	cpu_s_axi_rdata     <= (others=>'0') when s_data_read_connected(0)='0' else s_axi_rdata(axi_data_width-1 downto 0*axi_data_width);	
	cpu_s_axi_rresp     <= (others=>'0') when s_data_read_connected(0)='0' else s_axi_rresp(1 downto 0);
	cpu_s_axi_rlast     <= '0' when s_data_read_connected(0)='0' else s_axi_rlast(0);
	cpu_s_axi_rvalid    <= '0' when s_data_read_connected(0)='0' else s_axi_rvalid(0);
	
	bram_m_axi_awid     <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awid(1*axi_master_id_width-1 downto 0*axi_master_id_width);
	ram_m_axi_awid      <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awid(2*axi_master_id_width-1 downto 1*axi_master_id_width);
	uart_m_axi_awid     <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awid(3*axi_master_id_width-1 downto 2*axi_master_id_width);	

	bram_m_axi_awaddr   <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awaddr(1*axi_address_width-1 downto 0*axi_address_width);
	ram_m_axi_awaddr    <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awaddr(2*axi_address_width-1 downto 1*axi_address_width);
	uart_m_axi_awaddr   <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awaddr(3*axi_address_width-1 downto 2*axi_address_width);
	
	bram_m_axi_awlen    <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awlen(1*8-1 downto 0*8);
	ram_m_axi_awlen     <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awlen(2*8-1 downto 1*8);
	uart_m_axi_awlen    <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awlen(3*8-1 downto 2*8);
	
	bram_m_axi_awsize   <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awsize(1*3-1 downto 0*3);
	ram_m_axi_awsize    <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awsize(2*3-1 downto 1*3);
	uart_m_axi_awsize   <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awsize(3*3-1 downto 2*3);
	
	bram_m_axi_awburst  <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awburst(1*2-1 downto 0*2);
	ram_m_axi_awburst   <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awburst(2*2-1 downto 1*2);
	uart_m_axi_awburst  <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awburst(3*2-1 downto 2*2);
	
	bram_m_axi_awlock   <= '0' when m_address_write_connected(0)='0' else m_axi_awlock(0);
	ram_m_axi_awlock    <= '0' when m_address_write_connected(1)='0' else m_axi_awlock(1);
	uart_m_axi_awlock   <= '0' when m_address_write_connected(2)='0' else m_axi_awlock(2);
	
	bram_m_axi_awcache  <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awcache(1*4-1 downto 0*4);
	ram_m_axi_awcache   <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awcache(2*4-1 downto 1*4);
	uart_m_axi_awcache  <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awcache(3*4-1 downto 2*4);
	
	bram_m_axi_awprot   <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awprot(1*3-1 downto 0*3);
	ram_m_axi_awprot    <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awprot(2*3-1 downto 1*3);
	uart_m_axi_awprot   <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awprot(3*3-1 downto 2*3);
	
	bram_m_axi_awqos    <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awqos(1*4-1 downto 0*4);
	ram_m_axi_awqos     <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awqos(2*4-1 downto 1*4);
	uart_m_axi_awqos    <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awqos(3*4-1 downto 2*4);
	
	bram_m_axi_awregion <= (others=>'0') when m_address_write_connected(0)='0' else m_axi_awregion(1*4-1 downto 0*4);
	ram_m_axi_awregion  <= (others=>'0') when m_address_write_connected(1)='0' else m_axi_awregion(2*4-1 downto 1*4);
	uart_m_axi_awregion <= (others=>'0') when m_address_write_connected(2)='0' else m_axi_awregion(3*4-1 downto 2*4);
	
	bram_m_axi_awvalid  <= '0' when m_address_write_connected(0)='0' else m_axi_awvalid(0);
	ram_m_axi_awvalid   <= '0' when m_address_write_connected(1)='0' else m_axi_awvalid(1);
	uart_m_axi_awvalid  <= '0' when m_address_write_connected(2)='0' else m_axi_awvalid(2);
	
	bram_m_axi_wdata    <= (others=>'0') when m_data_write_connected(0)='0' else m_axi_wdata(1*axi_data_width-1 downto 0*axi_data_width);
	ram_m_axi_wdata     <= (others=>'0') when m_data_write_connected(1)='0' else m_axi_wdata(2*axi_data_width-1 downto 1*axi_data_width);
	uart_m_axi_wdata    <= (others=>'0') when m_data_write_connected(2)='0' else m_axi_wdata(3*axi_data_width-1 downto 2*axi_data_width);
	
	bram_m_axi_wstrb    <= (others=>'0') when m_data_write_connected(0)='0' else m_axi_wstrb(1*axi_data_width/8-1 downto 0*axi_data_width/8);
	ram_m_axi_wstrb     <= (others=>'0') when m_data_write_connected(1)='0' else m_axi_wstrb(2*axi_data_width/8-1 downto 1*axi_data_width/8);
	uart_m_axi_wstrb    <= (others=>'0') when m_data_write_connected(2)='0' else m_axi_wstrb(3*axi_data_width/8-1 downto 2*axi_data_width/8);
	
	bram_m_axi_wlast    <= '0' when m_data_write_connected(0)='0' else m_axi_wlast(0);
	ram_m_axi_wlast     <= '0' when m_data_write_connected(1)='0' else m_axi_wlast(1);
	uart_m_axi_wlast    <= '0' when m_data_write_connected(2)='0' else m_axi_wlast(2);
	
	bram_m_axi_wvalid   <= '0' when m_data_write_connected(0)='0' else m_axi_wvalid(0);
	ram_m_axi_wvalid    <= '0' when m_data_write_connected(1)='0' else m_axi_wvalid(1);
	uart_m_axi_wvalid   <= '0' when m_data_write_connected(2)='0' else m_axi_wvalid(2);
	
	bram_m_axi_bready   <= '0' when m_response_write_connected(0)='0' else m_axi_bready(0);
	ram_m_axi_bready    <= '0' when m_response_write_connected(1)='0' else m_axi_bready(1);
	uart_m_axi_bready   <= '0' when m_response_write_connected(2)='0' else m_axi_bready(2);
	
	bram_m_axi_arid     <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_arid(1*axi_master_id_width-1 downto 0*axi_master_id_width);
	ram_m_axi_arid      <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_arid(2*axi_master_id_width-1 downto 1*axi_master_id_width);
	uart_m_axi_arid     <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_arid(3*axi_master_id_width-1 downto 2*axi_master_id_width);
	
	bram_m_axi_araddr   <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_araddr(1*axi_address_width-1 downto 0*axi_address_width);
	ram_m_axi_araddr    <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_araddr(2*axi_address_width-1 downto 1*axi_address_width);
	uart_m_axi_araddr   <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_araddr(3*axi_address_width-1 downto 2*axi_address_width);
	
	bram_m_axi_arlen    <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_arlen(1*8-1 downto 0*8);
	ram_m_axi_arlen     <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_arlen(2*8-1 downto 1*8);
	uart_m_axi_arlen    <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_arlen(3*8-1 downto 2*8);
	
	bram_m_axi_arsize   <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_arsize(1*3-1 downto 0*3);
	ram_m_axi_arsize    <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_arsize(2*3-1 downto 1*3);
	uart_m_axi_arsize   <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_arsize(3*3-1 downto 2*3);
	
	bram_m_axi_arburst  <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_arburst(1*2-1 downto 0*2);
	ram_m_axi_arburst   <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_arburst(2*2-1 downto 1*2);
	uart_m_axi_arburst  <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_arburst(3*2-1 downto 2*2);
	
	bram_m_axi_arlock   <= '0' when m_address_read_connected(0)='0' else m_axi_arlock(0);
	ram_m_axi_arlock    <= '0' when m_address_read_connected(1)='0' else m_axi_arlock(1);
	uart_m_axi_arlock   <= '0' when m_address_read_connected(2)='0' else m_axi_arlock(2);
	
	bram_m_axi_arcache  <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_arcache(1*4-1 downto 0*4);
	ram_m_axi_arcache   <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_arcache(2*4-1 downto 1*4);
	uart_m_axi_arcache  <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_arcache(3*4-1 downto 2*4);
	
	bram_m_axi_arprot   <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_arprot(1*3-1 downto 0*3);
	ram_m_axi_arprot    <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_arprot(2*3-1 downto 1*3);
	uart_m_axi_arprot   <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_arprot(3*3-1 downto 2*3);
	
	bram_m_axi_arqos    <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_arqos(1*4-1 downto 0*4);
	ram_m_axi_arqos     <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_arqos(2*4-1 downto 1*4);
	uart_m_axi_arqos    <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_arqos(3*4-1 downto 2*4);
	
	bram_m_axi_arregion <= (others=>'0') when m_address_read_connected(0)='0' else m_axi_arregion(1*4-1 downto 0*4);
	ram_m_axi_arregion  <= (others=>'0') when m_address_read_connected(1)='0' else m_axi_arregion(2*4-1 downto 1*4);
	uart_m_axi_arregion <= (others=>'0') when m_address_read_connected(2)='0' else m_axi_arregion(3*4-1 downto 2*4);
	
	bram_m_axi_arvalid  <= '0' when m_address_read_connected(0)='0' else m_axi_arvalid(0);
	ram_m_axi_arvalid   <= '0' when m_address_read_connected(1)='0' else m_axi_arvalid(1);
	uart_m_axi_arvalid  <= '0' when m_address_read_connected(2)='0' else m_axi_arvalid(2);
	
	bram_m_axi_rready   <= '0' when m_data_read_connected(0)='0' else m_axi_rready(0);
	ram_m_axi_rready    <= '0' when m_data_read_connected(1)='0' else m_axi_rready(1);
	uart_m_axi_rready   <= '0' when m_data_read_connected(2)='0' else m_axi_rready(2);

	crossbar_inst : crossbar
		generic map
		(
			axi_address_width          => axi_address_width,
			axi_data_width             => axi_data_width,
			axi_master_no              => axi_master_amount,
			axi_slave_id_width         => axi_slave_id_width,
			axi_slave_no               => axi_slave_amount,
			axi_master_base_address    => axi_master_base_address,
			axi_master_high_address    => axi_master_high_address
		)
		port map
		(
			aclk                       => aclk,
			aresetn                    => aresetn,
			s_address_write_connected  => s_address_write_connected,
			s_data_write_connected     => s_data_write_connected,
			s_response_write_connected => s_response_write_connected,
			s_address_read_connected   => s_address_read_connected,
			s_data_read_connected      => s_data_read_connected,
			m_address_write_connected  => m_address_write_connected,
			m_data_write_connected     => m_data_write_connected,
			m_response_write_connected => m_response_write_connected,
			m_address_read_connected   => m_address_read_connected,
			m_data_read_connected      => m_data_read_connected,
			s_axi_awid                 => s_axi_awid_UNCONNECTED,
			s_axi_awaddr               => s_axi_awaddr,
			s_axi_awlen                => s_axi_awlen,
			s_axi_awsize               => s_axi_awsize,
			s_axi_awburst              => s_axi_awburst,
			s_axi_awlock               => s_axi_awlock,
			s_axi_awcache              => s_axi_awcache,
			s_axi_awprot               => s_axi_awprot,
			s_axi_awqos                => s_axi_awqos,
			s_axi_awregion             => s_axi_awregion,
			s_axi_awvalid              => s_axi_awvalid,
			s_axi_awready              => s_axi_awready,
			s_axi_wdata                => s_axi_wdata,
			s_axi_wstrb                => s_axi_wstrb,
			s_axi_wlast                => s_axi_wlast,
			s_axi_wvalid               => s_axi_wvalid,
			s_axi_wready               => s_axi_wready,
			s_axi_bid                  => s_axi_bid_UNCONNECTED,
			s_axi_bresp                => s_axi_bresp,
			s_axi_bvalid               => s_axi_bvalid,
			s_axi_bready               => s_axi_bready,
			s_axi_arid                 => s_axi_arid_UNCONNECTED,
			s_axi_araddr               => s_axi_araddr,
			s_axi_arlen                => s_axi_arlen,
			s_axi_arsize               => s_axi_arsize,
			s_axi_arburst              => s_axi_arburst,
			s_axi_arlock               => s_axi_arlock,
			s_axi_arcache              => s_axi_arcache,
			s_axi_arprot               => s_axi_arprot,
			s_axi_arqos                => s_axi_arqos,
			s_axi_arregion             => s_axi_arregion,
			s_axi_arvalid              => s_axi_arvalid,
			s_axi_arready              => s_axi_arready,
			s_axi_rid                  => s_axi_rid_UNCONNECTED,
			s_axi_rdata                => s_axi_rdata,
			s_axi_rresp                => s_axi_rresp,
			s_axi_rlast                => s_axi_rlast,
			s_axi_rvalid               => s_axi_rvalid,
			s_axi_rready               => s_axi_rready,
			m_axi_awid                 => m_axi_awid,
			m_axi_awaddr               => m_axi_awaddr,
			m_axi_awlen                => m_axi_awlen,
			m_axi_awsize               => m_axi_awsize,
			m_axi_awburst              => m_axi_awburst,
			m_axi_awlock               => m_axi_awlock,
			m_axi_awcache              => m_axi_awcache,
			m_axi_awprot               => m_axi_awprot,
			m_axi_awqos                => m_axi_awqos,
			m_axi_awregion             => m_axi_awregion,
			m_axi_awvalid              => m_axi_awvalid,
			m_axi_awready              => m_axi_awready,
			m_axi_wdata                => m_axi_wdata,
			m_axi_wstrb                => m_axi_wstrb,
			m_axi_wlast                => m_axi_wlast,
			m_axi_wvalid               => m_axi_wvalid,
			m_axi_wready               => m_axi_wready,
			m_axi_bid                  => m_axi_bid,
			m_axi_bresp                => m_axi_bresp,
			m_axi_bvalid               => m_axi_bvalid,
			m_axi_bready               => m_axi_bready,
			m_axi_arid                 => m_axi_arid,
			m_axi_araddr               => m_axi_araddr,
			m_axi_arlen                => m_axi_arlen,
			m_axi_arsize               => m_axi_arsize,
			m_axi_arburst              => m_axi_arburst,
			m_axi_arlock               => m_axi_arlock,
			m_axi_arcache              => m_axi_arcache,
			m_axi_arprot               => m_axi_arprot,
			m_axi_arqos                => m_axi_arqos,
			m_axi_arregion             => m_axi_arregion,
			m_axi_arvalid              => m_axi_arvalid,
			m_axi_arready              => m_axi_arready,
			m_axi_rid                  => m_axi_rid,
			m_axi_rdata                => m_axi_rdata,
			m_axi_rresp                => m_axi_rresp,
			m_axi_rlast                => m_axi_rlast,
			m_axi_rvalid               => m_axi_rvalid,
			m_axi_rready               => m_axi_rready
	);
end Behavioral;
