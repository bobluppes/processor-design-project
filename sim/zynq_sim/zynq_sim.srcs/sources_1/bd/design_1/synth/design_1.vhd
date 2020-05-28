--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
--Date        : Thu May 28 16:43:25 2020
--Host        : DESKTOP-RM4BOS7 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    clk_100MHz : in STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    tx : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=7,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_proc_sys_reset_0_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_proc_sys_reset_0_0;
  component design_1_crossbar_wrap_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    cpu_s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    cpu_s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cpu_s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cpu_s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cpu_s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cpu_s_axi_awlock : in STD_LOGIC;
    cpu_s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cpu_s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cpu_s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cpu_s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cpu_s_axi_awvalid : in STD_LOGIC;
    cpu_s_axi_awready : out STD_LOGIC;
    cpu_s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cpu_s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cpu_s_axi_wlast : in STD_LOGIC;
    cpu_s_axi_wvalid : in STD_LOGIC;
    cpu_s_axi_wready : out STD_LOGIC;
    cpu_s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpu_s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cpu_s_axi_bvalid : out STD_LOGIC;
    cpu_s_axi_bready : in STD_LOGIC;
    cpu_s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    cpu_s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cpu_s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cpu_s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cpu_s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cpu_s_axi_arlock : in STD_LOGIC;
    cpu_s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cpu_s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cpu_s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cpu_s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cpu_s_axi_arvalid : in STD_LOGIC;
    cpu_s_axi_arready : out STD_LOGIC;
    cpu_s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpu_s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cpu_s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cpu_s_axi_rlast : out STD_LOGIC;
    cpu_s_axi_rvalid : out STD_LOGIC;
    cpu_s_axi_rready : in STD_LOGIC;
    bram_m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    bram_m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bram_m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bram_m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    bram_m_axi_awlock : out STD_LOGIC;
    bram_m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bram_m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_m_axi_awvalid : out STD_LOGIC;
    bram_m_axi_awready : in STD_LOGIC;
    bram_m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_m_axi_wlast : out STD_LOGIC;
    bram_m_axi_wvalid : out STD_LOGIC;
    bram_m_axi_wready : in STD_LOGIC;
    bram_m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    bram_m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    bram_m_axi_bvalid : in STD_LOGIC;
    bram_m_axi_bready : out STD_LOGIC;
    bram_m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    bram_m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bram_m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bram_m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    bram_m_axi_arlock : out STD_LOGIC;
    bram_m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bram_m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_m_axi_arvalid : out STD_LOGIC;
    bram_m_axi_arready : in STD_LOGIC;
    bram_m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    bram_m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    bram_m_axi_rlast : in STD_LOGIC;
    bram_m_axi_rvalid : in STD_LOGIC;
    bram_m_axi_rready : out STD_LOGIC;
    ram_m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ram_m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ram_m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ram_m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ram_m_axi_awlock : out STD_LOGIC;
    ram_m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ram_m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_m_axi_awvalid : out STD_LOGIC;
    ram_m_axi_awready : in STD_LOGIC;
    ram_m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ram_m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_m_axi_wlast : out STD_LOGIC;
    ram_m_axi_wvalid : out STD_LOGIC;
    ram_m_axi_wready : in STD_LOGIC;
    ram_m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    ram_m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ram_m_axi_bvalid : in STD_LOGIC;
    ram_m_axi_bready : out STD_LOGIC;
    ram_m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ram_m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ram_m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ram_m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ram_m_axi_arlock : out STD_LOGIC;
    ram_m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ram_m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_m_axi_arvalid : out STD_LOGIC;
    ram_m_axi_arready : in STD_LOGIC;
    ram_m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    ram_m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ram_m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ram_m_axi_rlast : in STD_LOGIC;
    ram_m_axi_rvalid : in STD_LOGIC;
    ram_m_axi_rready : out STD_LOGIC;
    uart_m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    uart_m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    uart_m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    uart_m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    uart_m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    uart_m_axi_awlock : out STD_LOGIC;
    uart_m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    uart_m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    uart_m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    uart_m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    uart_m_axi_awvalid : out STD_LOGIC;
    uart_m_axi_awready : in STD_LOGIC;
    uart_m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    uart_m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    uart_m_axi_wlast : out STD_LOGIC;
    uart_m_axi_wvalid : out STD_LOGIC;
    uart_m_axi_wready : in STD_LOGIC;
    uart_m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    uart_m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    uart_m_axi_bvalid : in STD_LOGIC;
    uart_m_axi_bready : out STD_LOGIC;
    uart_m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    uart_m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    uart_m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    uart_m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    uart_m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    uart_m_axi_arlock : out STD_LOGIC;
    uart_m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    uart_m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    uart_m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    uart_m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    uart_m_axi_arvalid : out STD_LOGIC;
    uart_m_axi_arready : in STD_LOGIC;
    uart_m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    uart_m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    uart_m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    uart_m_axi_rlast : in STD_LOGIC;
    uart_m_axi_rvalid : in STD_LOGIC;
    uart_m_axi_rready : out STD_LOGIC
  );
  end component design_1_crossbar_wrap_0_0;
  component design_1_axi_full2lite_conver_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axi_full2lite_conver_0_0;
  component design_1_bram_0_0 is
  port (
    bram_rst_a : in STD_LOGIC;
    bram_clk_a : in STD_LOGIC;
    bram_en_a : in STD_LOGIC;
    bram_we_a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_a : in STD_LOGIC_VECTOR ( 12 downto 0 );
    bram_wrdata_a : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_rddata_a : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_bram_0_0;
  component design_1_bram_1_0 is
  port (
    bram_rst_a : in STD_LOGIC;
    bram_clk_a : in STD_LOGIC;
    bram_en_a : in STD_LOGIC;
    bram_we_a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_a : in STD_LOGIC_VECTOR ( 12 downto 0 );
    bram_wrdata_a : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_rddata_a : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_bram_1_0;
  component design_1_axi_bram_ctrl_0_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    bram_rst_a : out STD_LOGIC;
    bram_clk_a : out STD_LOGIC;
    bram_en_a : out STD_LOGIC;
    bram_we_a : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_a : out STD_LOGIC_VECTOR ( 12 downto 0 );
    bram_wrdata_a : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_rddata_a : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axi_bram_ctrl_0_1;
  component design_1_axi_bram_ctrl_1_1 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 24 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 24 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    bram_rst_a : out STD_LOGIC;
    bram_clk_a : out STD_LOGIC;
    bram_en_a : out STD_LOGIC;
    bram_we_a : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_a : out STD_LOGIC_VECTOR ( 24 downto 0 );
    bram_wrdata_a : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_rddata_a : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axi_bram_ctrl_1_1;
  component design_1_clk_wiz_0_0 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_0_0;
  component design_1_uart_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    axi_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_awvalid : in STD_LOGIC;
    axi_awready : out STD_LOGIC;
    axi_wvalid : in STD_LOGIC;
    axi_wready : out STD_LOGIC;
    axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_bvalid : out STD_LOGIC;
    axi_bready : in STD_LOGIC;
    axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_arvalid : in STD_LOGIC;
    axi_arready : out STD_LOGIC;
    axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_rvalid : out STD_LOGIC;
    axi_rready : in STD_LOGIC;
    axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tx : out STD_LOGIC;
    uart_tx_cpu_pause : out STD_LOGIC;
    clk_debug : out STD_LOGIC
  );
  end component design_1_uart_0_0;
  component design_1_cpu_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_awlock : out STD_LOGIC;
    axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_awvalid : out STD_LOGIC;
    axi_awready : in STD_LOGIC;
    axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_wlast : out STD_LOGIC;
    axi_wvalid : out STD_LOGIC;
    axi_wready : in STD_LOGIC;
    axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_bvalid : in STD_LOGIC;
    axi_bready : out STD_LOGIC;
    axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_arlock : out STD_LOGIC;
    axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_arvalid : out STD_LOGIC;
    axi_arready : in STD_LOGIC;
    axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_rlast : in STD_LOGIC;
    axi_rvalid : in STD_LOGIC;
    axi_rready : out STD_LOGIC;
    uart_tx_cpu_pause : in STD_LOGIC
  );
  end component design_1_cpu_0_0;
  signal axi_bram_ctrl_0_bram_addr_a : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal axi_bram_ctrl_0_bram_clk_a : STD_LOGIC;
  signal axi_bram_ctrl_0_bram_en_a : STD_LOGIC;
  signal axi_bram_ctrl_0_bram_rst_a : STD_LOGIC;
  signal axi_bram_ctrl_0_bram_we_a : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_bram_ctrl_0_bram_wrdata_a : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_bram_ctrl_1_bram_addr_a : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal axi_bram_ctrl_1_bram_clk_a : STD_LOGIC;
  signal axi_bram_ctrl_1_bram_en_a : STD_LOGIC;
  signal axi_bram_ctrl_1_bram_rst_a : STD_LOGIC;
  signal axi_bram_ctrl_1_bram_we_a : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_bram_ctrl_1_bram_wrdata_a : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_full2lite_conver_0_m_axi_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_full2lite_conver_0_m_axi_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_full2lite_conver_0_m_axi_ARREADY : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_ARVALID : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_full2lite_conver_0_m_axi_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_full2lite_conver_0_m_axi_AWREADY : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_AWVALID : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_BREADY : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_full2lite_conver_0_m_axi_BVALID : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_full2lite_conver_0_m_axi_RREADY : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_full2lite_conver_0_m_axi_RVALID : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_full2lite_conver_0_m_axi_WREADY : STD_LOGIC;
  signal axi_full2lite_conver_0_m_axi_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_full2lite_conver_0_m_axi_WVALID : STD_LOGIC;
  signal bram_0_bram_rddata_a : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal bram_1_bram_rddata_a : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal clk_100MHz_1 : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal cpu_0_axi_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cpu_0_axi_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal cpu_0_axi_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal cpu_0_axi_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cpu_0_axi_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal cpu_0_axi_ARLOCK : STD_LOGIC;
  signal cpu_0_axi_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal cpu_0_axi_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal cpu_0_axi_ARREADY : STD_LOGIC;
  signal cpu_0_axi_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal cpu_0_axi_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal cpu_0_axi_ARVALID : STD_LOGIC;
  signal cpu_0_axi_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cpu_0_axi_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal cpu_0_axi_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal cpu_0_axi_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cpu_0_axi_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal cpu_0_axi_AWLOCK : STD_LOGIC;
  signal cpu_0_axi_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal cpu_0_axi_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal cpu_0_axi_AWREADY : STD_LOGIC;
  signal cpu_0_axi_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal cpu_0_axi_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal cpu_0_axi_AWVALID : STD_LOGIC;
  signal cpu_0_axi_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cpu_0_axi_BREADY : STD_LOGIC;
  signal cpu_0_axi_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal cpu_0_axi_BVALID : STD_LOGIC;
  signal cpu_0_axi_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cpu_0_axi_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cpu_0_axi_RLAST : STD_LOGIC;
  signal cpu_0_axi_RREADY : STD_LOGIC;
  signal cpu_0_axi_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal cpu_0_axi_RVALID : STD_LOGIC;
  signal cpu_0_axi_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cpu_0_axi_WLAST : STD_LOGIC;
  signal cpu_0_axi_WREADY : STD_LOGIC;
  signal cpu_0_axi_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal cpu_0_axi_WVALID : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_bram_m_axi_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_ARLOCK : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_ARREADY : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_ARVALID : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_bram_m_axi_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_AWLOCK : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_AWREADY : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_AWVALID : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_bram_m_axi_BREADY : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_BVALID : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_bram_m_axi_RLAST : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_RREADY : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_RVALID : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_WLAST : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_WREADY : STD_LOGIC;
  signal crossbar_wrap_0_bram_m_axi_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_bram_m_axi_WVALID : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_ram_m_axi_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_ARLOCK : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_ARREADY : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_ARVALID : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_ram_m_axi_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_AWLOCK : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_AWREADY : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_AWVALID : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_ram_m_axi_BREADY : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_BVALID : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_ram_m_axi_RLAST : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_RREADY : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_RVALID : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_WLAST : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_WREADY : STD_LOGIC;
  signal crossbar_wrap_0_ram_m_axi_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_ram_m_axi_WVALID : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_uart_m_axi_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_ARLOCK : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_ARREADY : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_ARVALID : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_uart_m_axi_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_AWLOCK : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_AWREADY : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_AWVALID : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_uart_m_axi_BREADY : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_BVALID : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal crossbar_wrap_0_uart_m_axi_RLAST : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_RREADY : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_RVALID : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_WLAST : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_WREADY : STD_LOGIC;
  signal crossbar_wrap_0_uart_m_axi_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal crossbar_wrap_0_uart_m_axi_WVALID : STD_LOGIC;
  signal ext_reset_in_0_1 : STD_LOGIC;
  signal proc_sys_reset_0_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_0_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal uart_0_tx : STD_LOGIC;
  signal uart_0_uart_tx_cpu_pause : STD_LOGIC;
  signal NLW_crossbar_wrap_0_bram_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_crossbar_wrap_0_bram_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_crossbar_wrap_0_bram_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_crossbar_wrap_0_bram_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_crossbar_wrap_0_ram_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_crossbar_wrap_0_ram_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_crossbar_wrap_0_ram_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_crossbar_wrap_0_ram_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_proc_sys_reset_0_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_uart_0_clk_debug_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_100MHz : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_100MHz : signal is "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN design_1_clk_100MHz, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of reset_rtl : signal is "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST";
  attribute X_INTERFACE_PARAMETER of reset_rtl : signal is "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_100MHz_1 <= clk_100MHz;
  ext_reset_in_0_1 <= reset_rtl;
  tx <= uart_0_tx;
axi_bram_ctrl_0: component design_1_axi_bram_ctrl_0_1
     port map (
      bram_addr_a(12 downto 0) => axi_bram_ctrl_0_bram_addr_a(12 downto 0),
      bram_clk_a => axi_bram_ctrl_0_bram_clk_a,
      bram_en_a => axi_bram_ctrl_0_bram_en_a,
      bram_rddata_a(31 downto 0) => bram_0_bram_rddata_a(31 downto 0),
      bram_rst_a => axi_bram_ctrl_0_bram_rst_a,
      bram_we_a(3 downto 0) => axi_bram_ctrl_0_bram_we_a(3 downto 0),
      bram_wrdata_a(31 downto 0) => axi_bram_ctrl_0_bram_wrdata_a(31 downto 0),
      s_axi_aclk => clk_wiz_0_clk_out1,
      s_axi_araddr(12 downto 0) => crossbar_wrap_0_bram_m_axi_ARADDR(12 downto 0),
      s_axi_arburst(1 downto 0) => crossbar_wrap_0_bram_m_axi_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => crossbar_wrap_0_bram_m_axi_ARCACHE(3 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arid(0) => crossbar_wrap_0_bram_m_axi_ARID(0),
      s_axi_arlen(7 downto 0) => crossbar_wrap_0_bram_m_axi_ARLEN(7 downto 0),
      s_axi_arlock => crossbar_wrap_0_bram_m_axi_ARLOCK,
      s_axi_arprot(2 downto 0) => crossbar_wrap_0_bram_m_axi_ARPROT(2 downto 0),
      s_axi_arready => crossbar_wrap_0_bram_m_axi_ARREADY,
      s_axi_arsize(2 downto 0) => crossbar_wrap_0_bram_m_axi_ARSIZE(2 downto 0),
      s_axi_arvalid => crossbar_wrap_0_bram_m_axi_ARVALID,
      s_axi_awaddr(12 downto 0) => crossbar_wrap_0_bram_m_axi_AWADDR(12 downto 0),
      s_axi_awburst(1 downto 0) => crossbar_wrap_0_bram_m_axi_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => crossbar_wrap_0_bram_m_axi_AWCACHE(3 downto 0),
      s_axi_awid(0) => crossbar_wrap_0_bram_m_axi_AWID(0),
      s_axi_awlen(7 downto 0) => crossbar_wrap_0_bram_m_axi_AWLEN(7 downto 0),
      s_axi_awlock => crossbar_wrap_0_bram_m_axi_AWLOCK,
      s_axi_awprot(2 downto 0) => crossbar_wrap_0_bram_m_axi_AWPROT(2 downto 0),
      s_axi_awready => crossbar_wrap_0_bram_m_axi_AWREADY,
      s_axi_awsize(2 downto 0) => crossbar_wrap_0_bram_m_axi_AWSIZE(2 downto 0),
      s_axi_awvalid => crossbar_wrap_0_bram_m_axi_AWVALID,
      s_axi_bid(0) => crossbar_wrap_0_bram_m_axi_BID(0),
      s_axi_bready => crossbar_wrap_0_bram_m_axi_BREADY,
      s_axi_bresp(1 downto 0) => crossbar_wrap_0_bram_m_axi_BRESP(1 downto 0),
      s_axi_bvalid => crossbar_wrap_0_bram_m_axi_BVALID,
      s_axi_rdata(31 downto 0) => crossbar_wrap_0_bram_m_axi_RDATA(31 downto 0),
      s_axi_rid(0) => crossbar_wrap_0_bram_m_axi_RID(0),
      s_axi_rlast => crossbar_wrap_0_bram_m_axi_RLAST,
      s_axi_rready => crossbar_wrap_0_bram_m_axi_RREADY,
      s_axi_rresp(1 downto 0) => crossbar_wrap_0_bram_m_axi_RRESP(1 downto 0),
      s_axi_rvalid => crossbar_wrap_0_bram_m_axi_RVALID,
      s_axi_wdata(31 downto 0) => crossbar_wrap_0_bram_m_axi_WDATA(31 downto 0),
      s_axi_wlast => crossbar_wrap_0_bram_m_axi_WLAST,
      s_axi_wready => crossbar_wrap_0_bram_m_axi_WREADY,
      s_axi_wstrb(3 downto 0) => crossbar_wrap_0_bram_m_axi_WSTRB(3 downto 0),
      s_axi_wvalid => crossbar_wrap_0_bram_m_axi_WVALID
    );
axi_bram_ctrl_1: component design_1_axi_bram_ctrl_1_1
     port map (
      bram_addr_a(24 downto 0) => axi_bram_ctrl_1_bram_addr_a(24 downto 0),
      bram_clk_a => axi_bram_ctrl_1_bram_clk_a,
      bram_en_a => axi_bram_ctrl_1_bram_en_a,
      bram_rddata_a(31 downto 0) => bram_1_bram_rddata_a(31 downto 0),
      bram_rst_a => axi_bram_ctrl_1_bram_rst_a,
      bram_we_a(3 downto 0) => axi_bram_ctrl_1_bram_we_a(3 downto 0),
      bram_wrdata_a(31 downto 0) => axi_bram_ctrl_1_bram_wrdata_a(31 downto 0),
      s_axi_aclk => clk_wiz_0_clk_out1,
      s_axi_araddr(24 downto 0) => crossbar_wrap_0_ram_m_axi_ARADDR(24 downto 0),
      s_axi_arburst(1 downto 0) => crossbar_wrap_0_ram_m_axi_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => crossbar_wrap_0_ram_m_axi_ARCACHE(3 downto 0),
      s_axi_aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      s_axi_arid(0) => crossbar_wrap_0_ram_m_axi_ARID(0),
      s_axi_arlen(7 downto 0) => crossbar_wrap_0_ram_m_axi_ARLEN(7 downto 0),
      s_axi_arlock => crossbar_wrap_0_ram_m_axi_ARLOCK,
      s_axi_arprot(2 downto 0) => crossbar_wrap_0_ram_m_axi_ARPROT(2 downto 0),
      s_axi_arready => crossbar_wrap_0_ram_m_axi_ARREADY,
      s_axi_arsize(2 downto 0) => crossbar_wrap_0_ram_m_axi_ARSIZE(2 downto 0),
      s_axi_arvalid => crossbar_wrap_0_ram_m_axi_ARVALID,
      s_axi_awaddr(24 downto 0) => crossbar_wrap_0_ram_m_axi_AWADDR(24 downto 0),
      s_axi_awburst(1 downto 0) => crossbar_wrap_0_ram_m_axi_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => crossbar_wrap_0_ram_m_axi_AWCACHE(3 downto 0),
      s_axi_awid(0) => crossbar_wrap_0_ram_m_axi_AWID(0),
      s_axi_awlen(7 downto 0) => crossbar_wrap_0_ram_m_axi_AWLEN(7 downto 0),
      s_axi_awlock => crossbar_wrap_0_ram_m_axi_AWLOCK,
      s_axi_awprot(2 downto 0) => crossbar_wrap_0_ram_m_axi_AWPROT(2 downto 0),
      s_axi_awready => crossbar_wrap_0_ram_m_axi_AWREADY,
      s_axi_awsize(2 downto 0) => crossbar_wrap_0_ram_m_axi_AWSIZE(2 downto 0),
      s_axi_awvalid => crossbar_wrap_0_ram_m_axi_AWVALID,
      s_axi_bid(0) => crossbar_wrap_0_ram_m_axi_BID(0),
      s_axi_bready => crossbar_wrap_0_ram_m_axi_BREADY,
      s_axi_bresp(1 downto 0) => crossbar_wrap_0_ram_m_axi_BRESP(1 downto 0),
      s_axi_bvalid => crossbar_wrap_0_ram_m_axi_BVALID,
      s_axi_rdata(31 downto 0) => crossbar_wrap_0_ram_m_axi_RDATA(31 downto 0),
      s_axi_rid(0) => crossbar_wrap_0_ram_m_axi_RID(0),
      s_axi_rlast => crossbar_wrap_0_ram_m_axi_RLAST,
      s_axi_rready => crossbar_wrap_0_ram_m_axi_RREADY,
      s_axi_rresp(1 downto 0) => crossbar_wrap_0_ram_m_axi_RRESP(1 downto 0),
      s_axi_rvalid => crossbar_wrap_0_ram_m_axi_RVALID,
      s_axi_wdata(31 downto 0) => crossbar_wrap_0_ram_m_axi_WDATA(31 downto 0),
      s_axi_wlast => crossbar_wrap_0_ram_m_axi_WLAST,
      s_axi_wready => crossbar_wrap_0_ram_m_axi_WREADY,
      s_axi_wstrb(3 downto 0) => crossbar_wrap_0_ram_m_axi_WSTRB(3 downto 0),
      s_axi_wvalid => crossbar_wrap_0_ram_m_axi_WVALID
    );
axi_full2lite_conver_0: component design_1_axi_full2lite_conver_0_0
     port map (
      aclk => clk_wiz_0_clk_out1,
      aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_full2lite_conver_0_m_axi_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => axi_full2lite_conver_0_m_axi_ARPROT(2 downto 0),
      m_axi_arready => axi_full2lite_conver_0_m_axi_ARREADY,
      m_axi_arvalid => axi_full2lite_conver_0_m_axi_ARVALID,
      m_axi_awaddr(31 downto 0) => axi_full2lite_conver_0_m_axi_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => axi_full2lite_conver_0_m_axi_AWPROT(2 downto 0),
      m_axi_awready => axi_full2lite_conver_0_m_axi_AWREADY,
      m_axi_awvalid => axi_full2lite_conver_0_m_axi_AWVALID,
      m_axi_bready => axi_full2lite_conver_0_m_axi_BREADY,
      m_axi_bresp(1 downto 0) => axi_full2lite_conver_0_m_axi_BRESP(1 downto 0),
      m_axi_bvalid => axi_full2lite_conver_0_m_axi_BVALID,
      m_axi_rdata(31 downto 0) => axi_full2lite_conver_0_m_axi_RDATA(31 downto 0),
      m_axi_rready => axi_full2lite_conver_0_m_axi_RREADY,
      m_axi_rresp(1 downto 0) => axi_full2lite_conver_0_m_axi_RRESP(1 downto 0),
      m_axi_rvalid => axi_full2lite_conver_0_m_axi_RVALID,
      m_axi_wdata(31 downto 0) => axi_full2lite_conver_0_m_axi_WDATA(31 downto 0),
      m_axi_wready => axi_full2lite_conver_0_m_axi_WREADY,
      m_axi_wstrb(3 downto 0) => axi_full2lite_conver_0_m_axi_WSTRB(3 downto 0),
      m_axi_wvalid => axi_full2lite_conver_0_m_axi_WVALID,
      s_axi_araddr(31 downto 0) => crossbar_wrap_0_uart_m_axi_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => crossbar_wrap_0_uart_m_axi_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => crossbar_wrap_0_uart_m_axi_ARCACHE(3 downto 0),
      s_axi_arid(0) => crossbar_wrap_0_uart_m_axi_ARID(0),
      s_axi_arlen(7 downto 0) => crossbar_wrap_0_uart_m_axi_ARLEN(7 downto 0),
      s_axi_arlock => crossbar_wrap_0_uart_m_axi_ARLOCK,
      s_axi_arprot(2 downto 0) => crossbar_wrap_0_uart_m_axi_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => crossbar_wrap_0_uart_m_axi_ARQOS(3 downto 0),
      s_axi_arready => crossbar_wrap_0_uart_m_axi_ARREADY,
      s_axi_arregion(3 downto 0) => crossbar_wrap_0_uart_m_axi_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => crossbar_wrap_0_uart_m_axi_ARSIZE(2 downto 0),
      s_axi_arvalid => crossbar_wrap_0_uart_m_axi_ARVALID,
      s_axi_awaddr(31 downto 0) => crossbar_wrap_0_uart_m_axi_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => crossbar_wrap_0_uart_m_axi_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => crossbar_wrap_0_uart_m_axi_AWCACHE(3 downto 0),
      s_axi_awid(0) => crossbar_wrap_0_uart_m_axi_AWID(0),
      s_axi_awlen(7 downto 0) => crossbar_wrap_0_uart_m_axi_AWLEN(7 downto 0),
      s_axi_awlock => crossbar_wrap_0_uart_m_axi_AWLOCK,
      s_axi_awprot(2 downto 0) => crossbar_wrap_0_uart_m_axi_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => crossbar_wrap_0_uart_m_axi_AWQOS(3 downto 0),
      s_axi_awready => crossbar_wrap_0_uart_m_axi_AWREADY,
      s_axi_awregion(3 downto 0) => crossbar_wrap_0_uart_m_axi_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => crossbar_wrap_0_uart_m_axi_AWSIZE(2 downto 0),
      s_axi_awvalid => crossbar_wrap_0_uart_m_axi_AWVALID,
      s_axi_bid(0) => crossbar_wrap_0_uart_m_axi_BID(0),
      s_axi_bready => crossbar_wrap_0_uart_m_axi_BREADY,
      s_axi_bresp(1 downto 0) => crossbar_wrap_0_uart_m_axi_BRESP(1 downto 0),
      s_axi_bvalid => crossbar_wrap_0_uart_m_axi_BVALID,
      s_axi_rdata(31 downto 0) => crossbar_wrap_0_uart_m_axi_RDATA(31 downto 0),
      s_axi_rid(0) => crossbar_wrap_0_uart_m_axi_RID(0),
      s_axi_rlast => crossbar_wrap_0_uart_m_axi_RLAST,
      s_axi_rready => crossbar_wrap_0_uart_m_axi_RREADY,
      s_axi_rresp(1 downto 0) => crossbar_wrap_0_uart_m_axi_RRESP(1 downto 0),
      s_axi_rvalid => crossbar_wrap_0_uart_m_axi_RVALID,
      s_axi_wdata(31 downto 0) => crossbar_wrap_0_uart_m_axi_WDATA(31 downto 0),
      s_axi_wlast => crossbar_wrap_0_uart_m_axi_WLAST,
      s_axi_wready => crossbar_wrap_0_uart_m_axi_WREADY,
      s_axi_wstrb(3 downto 0) => crossbar_wrap_0_uart_m_axi_WSTRB(3 downto 0),
      s_axi_wvalid => crossbar_wrap_0_uart_m_axi_WVALID
    );
bram_0: component design_1_bram_0_0
     port map (
      bram_addr_a(12 downto 0) => axi_bram_ctrl_0_bram_addr_a(12 downto 0),
      bram_clk_a => axi_bram_ctrl_0_bram_clk_a,
      bram_en_a => axi_bram_ctrl_0_bram_en_a,
      bram_rddata_a(31 downto 0) => bram_0_bram_rddata_a(31 downto 0),
      bram_rst_a => axi_bram_ctrl_0_bram_rst_a,
      bram_we_a(3 downto 0) => axi_bram_ctrl_0_bram_we_a(3 downto 0),
      bram_wrdata_a(31 downto 0) => axi_bram_ctrl_0_bram_wrdata_a(31 downto 0)
    );
bram_1: component design_1_bram_1_0
     port map (
      bram_addr_a(12 downto 0) => axi_bram_ctrl_1_bram_addr_a(12 downto 0),
      bram_clk_a => axi_bram_ctrl_1_bram_clk_a,
      bram_en_a => axi_bram_ctrl_1_bram_en_a,
      bram_rddata_a(31 downto 0) => bram_1_bram_rddata_a(31 downto 0),
      bram_rst_a => axi_bram_ctrl_1_bram_rst_a,
      bram_we_a(3 downto 0) => axi_bram_ctrl_1_bram_we_a(3 downto 0),
      bram_wrdata_a(31 downto 0) => axi_bram_ctrl_1_bram_wrdata_a(31 downto 0)
    );
clk_wiz_0: component design_1_clk_wiz_0_0
     port map (
      clk_in1 => clk_100MHz_1,
      clk_out1 => clk_wiz_0_clk_out1,
      locked => clk_wiz_0_locked,
      resetn => ext_reset_in_0_1
    );
cpu_0: component design_1_cpu_0_0
     port map (
      aclk => clk_wiz_0_clk_out1,
      aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      axi_araddr(31 downto 0) => cpu_0_axi_ARADDR(31 downto 0),
      axi_arburst(1 downto 0) => cpu_0_axi_ARBURST(1 downto 0),
      axi_arcache(3 downto 0) => cpu_0_axi_ARCACHE(3 downto 0),
      axi_arid(0) => cpu_0_axi_ARID(0),
      axi_arlen(7 downto 0) => cpu_0_axi_ARLEN(7 downto 0),
      axi_arlock => cpu_0_axi_ARLOCK,
      axi_arprot(2 downto 0) => cpu_0_axi_ARPROT(2 downto 0),
      axi_arqos(3 downto 0) => cpu_0_axi_ARQOS(3 downto 0),
      axi_arready => cpu_0_axi_ARREADY,
      axi_arregion(3 downto 0) => cpu_0_axi_ARREGION(3 downto 0),
      axi_arsize(2 downto 0) => cpu_0_axi_ARSIZE(2 downto 0),
      axi_arvalid => cpu_0_axi_ARVALID,
      axi_awaddr(31 downto 0) => cpu_0_axi_AWADDR(31 downto 0),
      axi_awburst(1 downto 0) => cpu_0_axi_AWBURST(1 downto 0),
      axi_awcache(3 downto 0) => cpu_0_axi_AWCACHE(3 downto 0),
      axi_awid(0) => cpu_0_axi_AWID(0),
      axi_awlen(7 downto 0) => cpu_0_axi_AWLEN(7 downto 0),
      axi_awlock => cpu_0_axi_AWLOCK,
      axi_awprot(2 downto 0) => cpu_0_axi_AWPROT(2 downto 0),
      axi_awqos(3 downto 0) => cpu_0_axi_AWQOS(3 downto 0),
      axi_awready => cpu_0_axi_AWREADY,
      axi_awregion(3 downto 0) => cpu_0_axi_AWREGION(3 downto 0),
      axi_awsize(2 downto 0) => cpu_0_axi_AWSIZE(2 downto 0),
      axi_awvalid => cpu_0_axi_AWVALID,
      axi_bid(0) => cpu_0_axi_BID(0),
      axi_bready => cpu_0_axi_BREADY,
      axi_bresp(1 downto 0) => cpu_0_axi_BRESP(1 downto 0),
      axi_bvalid => cpu_0_axi_BVALID,
      axi_rdata(31 downto 0) => cpu_0_axi_RDATA(31 downto 0),
      axi_rid(0) => cpu_0_axi_RID(0),
      axi_rlast => cpu_0_axi_RLAST,
      axi_rready => cpu_0_axi_RREADY,
      axi_rresp(1 downto 0) => cpu_0_axi_RRESP(1 downto 0),
      axi_rvalid => cpu_0_axi_RVALID,
      axi_wdata(31 downto 0) => cpu_0_axi_WDATA(31 downto 0),
      axi_wlast => cpu_0_axi_WLAST,
      axi_wready => cpu_0_axi_WREADY,
      axi_wstrb(3 downto 0) => cpu_0_axi_WSTRB(3 downto 0),
      axi_wvalid => cpu_0_axi_WVALID,
      uart_tx_cpu_pause => uart_0_uart_tx_cpu_pause
    );
crossbar_wrap_0: component design_1_crossbar_wrap_0_0
     port map (
      aclk => clk_wiz_0_clk_out1,
      aresetn => proc_sys_reset_0_interconnect_aresetn(0),
      bram_m_axi_araddr(31 downto 0) => crossbar_wrap_0_bram_m_axi_ARADDR(31 downto 0),
      bram_m_axi_arburst(1 downto 0) => crossbar_wrap_0_bram_m_axi_ARBURST(1 downto 0),
      bram_m_axi_arcache(3 downto 0) => crossbar_wrap_0_bram_m_axi_ARCACHE(3 downto 0),
      bram_m_axi_arid(0) => crossbar_wrap_0_bram_m_axi_ARID(0),
      bram_m_axi_arlen(7 downto 0) => crossbar_wrap_0_bram_m_axi_ARLEN(7 downto 0),
      bram_m_axi_arlock => crossbar_wrap_0_bram_m_axi_ARLOCK,
      bram_m_axi_arprot(2 downto 0) => crossbar_wrap_0_bram_m_axi_ARPROT(2 downto 0),
      bram_m_axi_arqos(3 downto 0) => NLW_crossbar_wrap_0_bram_m_axi_arqos_UNCONNECTED(3 downto 0),
      bram_m_axi_arready => crossbar_wrap_0_bram_m_axi_ARREADY,
      bram_m_axi_arregion(3 downto 0) => NLW_crossbar_wrap_0_bram_m_axi_arregion_UNCONNECTED(3 downto 0),
      bram_m_axi_arsize(2 downto 0) => crossbar_wrap_0_bram_m_axi_ARSIZE(2 downto 0),
      bram_m_axi_arvalid => crossbar_wrap_0_bram_m_axi_ARVALID,
      bram_m_axi_awaddr(31 downto 0) => crossbar_wrap_0_bram_m_axi_AWADDR(31 downto 0),
      bram_m_axi_awburst(1 downto 0) => crossbar_wrap_0_bram_m_axi_AWBURST(1 downto 0),
      bram_m_axi_awcache(3 downto 0) => crossbar_wrap_0_bram_m_axi_AWCACHE(3 downto 0),
      bram_m_axi_awid(0) => crossbar_wrap_0_bram_m_axi_AWID(0),
      bram_m_axi_awlen(7 downto 0) => crossbar_wrap_0_bram_m_axi_AWLEN(7 downto 0),
      bram_m_axi_awlock => crossbar_wrap_0_bram_m_axi_AWLOCK,
      bram_m_axi_awprot(2 downto 0) => crossbar_wrap_0_bram_m_axi_AWPROT(2 downto 0),
      bram_m_axi_awqos(3 downto 0) => NLW_crossbar_wrap_0_bram_m_axi_awqos_UNCONNECTED(3 downto 0),
      bram_m_axi_awready => crossbar_wrap_0_bram_m_axi_AWREADY,
      bram_m_axi_awregion(3 downto 0) => NLW_crossbar_wrap_0_bram_m_axi_awregion_UNCONNECTED(3 downto 0),
      bram_m_axi_awsize(2 downto 0) => crossbar_wrap_0_bram_m_axi_AWSIZE(2 downto 0),
      bram_m_axi_awvalid => crossbar_wrap_0_bram_m_axi_AWVALID,
      bram_m_axi_bid(0) => crossbar_wrap_0_bram_m_axi_BID(0),
      bram_m_axi_bready => crossbar_wrap_0_bram_m_axi_BREADY,
      bram_m_axi_bresp(1 downto 0) => crossbar_wrap_0_bram_m_axi_BRESP(1 downto 0),
      bram_m_axi_bvalid => crossbar_wrap_0_bram_m_axi_BVALID,
      bram_m_axi_rdata(31 downto 0) => crossbar_wrap_0_bram_m_axi_RDATA(31 downto 0),
      bram_m_axi_rid(0) => crossbar_wrap_0_bram_m_axi_RID(0),
      bram_m_axi_rlast => crossbar_wrap_0_bram_m_axi_RLAST,
      bram_m_axi_rready => crossbar_wrap_0_bram_m_axi_RREADY,
      bram_m_axi_rresp(1 downto 0) => crossbar_wrap_0_bram_m_axi_RRESP(1 downto 0),
      bram_m_axi_rvalid => crossbar_wrap_0_bram_m_axi_RVALID,
      bram_m_axi_wdata(31 downto 0) => crossbar_wrap_0_bram_m_axi_WDATA(31 downto 0),
      bram_m_axi_wlast => crossbar_wrap_0_bram_m_axi_WLAST,
      bram_m_axi_wready => crossbar_wrap_0_bram_m_axi_WREADY,
      bram_m_axi_wstrb(3 downto 0) => crossbar_wrap_0_bram_m_axi_WSTRB(3 downto 0),
      bram_m_axi_wvalid => crossbar_wrap_0_bram_m_axi_WVALID,
      cpu_s_axi_araddr(31 downto 0) => cpu_0_axi_ARADDR(31 downto 0),
      cpu_s_axi_arburst(1 downto 0) => cpu_0_axi_ARBURST(1 downto 0),
      cpu_s_axi_arcache(3 downto 0) => cpu_0_axi_ARCACHE(3 downto 0),
      cpu_s_axi_arid(0) => cpu_0_axi_ARID(0),
      cpu_s_axi_arlen(7 downto 0) => cpu_0_axi_ARLEN(7 downto 0),
      cpu_s_axi_arlock => cpu_0_axi_ARLOCK,
      cpu_s_axi_arprot(2 downto 0) => cpu_0_axi_ARPROT(2 downto 0),
      cpu_s_axi_arqos(3 downto 0) => cpu_0_axi_ARQOS(3 downto 0),
      cpu_s_axi_arready => cpu_0_axi_ARREADY,
      cpu_s_axi_arregion(3 downto 0) => cpu_0_axi_ARREGION(3 downto 0),
      cpu_s_axi_arsize(2 downto 0) => cpu_0_axi_ARSIZE(2 downto 0),
      cpu_s_axi_arvalid => cpu_0_axi_ARVALID,
      cpu_s_axi_awaddr(31 downto 0) => cpu_0_axi_AWADDR(31 downto 0),
      cpu_s_axi_awburst(1 downto 0) => cpu_0_axi_AWBURST(1 downto 0),
      cpu_s_axi_awcache(3 downto 0) => cpu_0_axi_AWCACHE(3 downto 0),
      cpu_s_axi_awid(0) => cpu_0_axi_AWID(0),
      cpu_s_axi_awlen(7 downto 0) => cpu_0_axi_AWLEN(7 downto 0),
      cpu_s_axi_awlock => cpu_0_axi_AWLOCK,
      cpu_s_axi_awprot(2 downto 0) => cpu_0_axi_AWPROT(2 downto 0),
      cpu_s_axi_awqos(3 downto 0) => cpu_0_axi_AWQOS(3 downto 0),
      cpu_s_axi_awready => cpu_0_axi_AWREADY,
      cpu_s_axi_awregion(3 downto 0) => cpu_0_axi_AWREGION(3 downto 0),
      cpu_s_axi_awsize(2 downto 0) => cpu_0_axi_AWSIZE(2 downto 0),
      cpu_s_axi_awvalid => cpu_0_axi_AWVALID,
      cpu_s_axi_bid(0) => cpu_0_axi_BID(0),
      cpu_s_axi_bready => cpu_0_axi_BREADY,
      cpu_s_axi_bresp(1 downto 0) => cpu_0_axi_BRESP(1 downto 0),
      cpu_s_axi_bvalid => cpu_0_axi_BVALID,
      cpu_s_axi_rdata(31 downto 0) => cpu_0_axi_RDATA(31 downto 0),
      cpu_s_axi_rid(0) => cpu_0_axi_RID(0),
      cpu_s_axi_rlast => cpu_0_axi_RLAST,
      cpu_s_axi_rready => cpu_0_axi_RREADY,
      cpu_s_axi_rresp(1 downto 0) => cpu_0_axi_RRESP(1 downto 0),
      cpu_s_axi_rvalid => cpu_0_axi_RVALID,
      cpu_s_axi_wdata(31 downto 0) => cpu_0_axi_WDATA(31 downto 0),
      cpu_s_axi_wlast => cpu_0_axi_WLAST,
      cpu_s_axi_wready => cpu_0_axi_WREADY,
      cpu_s_axi_wstrb(3 downto 0) => cpu_0_axi_WSTRB(3 downto 0),
      cpu_s_axi_wvalid => cpu_0_axi_WVALID,
      ram_m_axi_araddr(31 downto 0) => crossbar_wrap_0_ram_m_axi_ARADDR(31 downto 0),
      ram_m_axi_arburst(1 downto 0) => crossbar_wrap_0_ram_m_axi_ARBURST(1 downto 0),
      ram_m_axi_arcache(3 downto 0) => crossbar_wrap_0_ram_m_axi_ARCACHE(3 downto 0),
      ram_m_axi_arid(0) => crossbar_wrap_0_ram_m_axi_ARID(0),
      ram_m_axi_arlen(7 downto 0) => crossbar_wrap_0_ram_m_axi_ARLEN(7 downto 0),
      ram_m_axi_arlock => crossbar_wrap_0_ram_m_axi_ARLOCK,
      ram_m_axi_arprot(2 downto 0) => crossbar_wrap_0_ram_m_axi_ARPROT(2 downto 0),
      ram_m_axi_arqos(3 downto 0) => NLW_crossbar_wrap_0_ram_m_axi_arqos_UNCONNECTED(3 downto 0),
      ram_m_axi_arready => crossbar_wrap_0_ram_m_axi_ARREADY,
      ram_m_axi_arregion(3 downto 0) => NLW_crossbar_wrap_0_ram_m_axi_arregion_UNCONNECTED(3 downto 0),
      ram_m_axi_arsize(2 downto 0) => crossbar_wrap_0_ram_m_axi_ARSIZE(2 downto 0),
      ram_m_axi_arvalid => crossbar_wrap_0_ram_m_axi_ARVALID,
      ram_m_axi_awaddr(31 downto 0) => crossbar_wrap_0_ram_m_axi_AWADDR(31 downto 0),
      ram_m_axi_awburst(1 downto 0) => crossbar_wrap_0_ram_m_axi_AWBURST(1 downto 0),
      ram_m_axi_awcache(3 downto 0) => crossbar_wrap_0_ram_m_axi_AWCACHE(3 downto 0),
      ram_m_axi_awid(0) => crossbar_wrap_0_ram_m_axi_AWID(0),
      ram_m_axi_awlen(7 downto 0) => crossbar_wrap_0_ram_m_axi_AWLEN(7 downto 0),
      ram_m_axi_awlock => crossbar_wrap_0_ram_m_axi_AWLOCK,
      ram_m_axi_awprot(2 downto 0) => crossbar_wrap_0_ram_m_axi_AWPROT(2 downto 0),
      ram_m_axi_awqos(3 downto 0) => NLW_crossbar_wrap_0_ram_m_axi_awqos_UNCONNECTED(3 downto 0),
      ram_m_axi_awready => crossbar_wrap_0_ram_m_axi_AWREADY,
      ram_m_axi_awregion(3 downto 0) => NLW_crossbar_wrap_0_ram_m_axi_awregion_UNCONNECTED(3 downto 0),
      ram_m_axi_awsize(2 downto 0) => crossbar_wrap_0_ram_m_axi_AWSIZE(2 downto 0),
      ram_m_axi_awvalid => crossbar_wrap_0_ram_m_axi_AWVALID,
      ram_m_axi_bid(0) => crossbar_wrap_0_ram_m_axi_BID(0),
      ram_m_axi_bready => crossbar_wrap_0_ram_m_axi_BREADY,
      ram_m_axi_bresp(1 downto 0) => crossbar_wrap_0_ram_m_axi_BRESP(1 downto 0),
      ram_m_axi_bvalid => crossbar_wrap_0_ram_m_axi_BVALID,
      ram_m_axi_rdata(31 downto 0) => crossbar_wrap_0_ram_m_axi_RDATA(31 downto 0),
      ram_m_axi_rid(0) => crossbar_wrap_0_ram_m_axi_RID(0),
      ram_m_axi_rlast => crossbar_wrap_0_ram_m_axi_RLAST,
      ram_m_axi_rready => crossbar_wrap_0_ram_m_axi_RREADY,
      ram_m_axi_rresp(1 downto 0) => crossbar_wrap_0_ram_m_axi_RRESP(1 downto 0),
      ram_m_axi_rvalid => crossbar_wrap_0_ram_m_axi_RVALID,
      ram_m_axi_wdata(31 downto 0) => crossbar_wrap_0_ram_m_axi_WDATA(31 downto 0),
      ram_m_axi_wlast => crossbar_wrap_0_ram_m_axi_WLAST,
      ram_m_axi_wready => crossbar_wrap_0_ram_m_axi_WREADY,
      ram_m_axi_wstrb(3 downto 0) => crossbar_wrap_0_ram_m_axi_WSTRB(3 downto 0),
      ram_m_axi_wvalid => crossbar_wrap_0_ram_m_axi_WVALID,
      uart_m_axi_araddr(31 downto 0) => crossbar_wrap_0_uart_m_axi_ARADDR(31 downto 0),
      uart_m_axi_arburst(1 downto 0) => crossbar_wrap_0_uart_m_axi_ARBURST(1 downto 0),
      uart_m_axi_arcache(3 downto 0) => crossbar_wrap_0_uart_m_axi_ARCACHE(3 downto 0),
      uart_m_axi_arid(0) => crossbar_wrap_0_uart_m_axi_ARID(0),
      uart_m_axi_arlen(7 downto 0) => crossbar_wrap_0_uart_m_axi_ARLEN(7 downto 0),
      uart_m_axi_arlock => crossbar_wrap_0_uart_m_axi_ARLOCK,
      uart_m_axi_arprot(2 downto 0) => crossbar_wrap_0_uart_m_axi_ARPROT(2 downto 0),
      uart_m_axi_arqos(3 downto 0) => crossbar_wrap_0_uart_m_axi_ARQOS(3 downto 0),
      uart_m_axi_arready => crossbar_wrap_0_uart_m_axi_ARREADY,
      uart_m_axi_arregion(3 downto 0) => crossbar_wrap_0_uart_m_axi_ARREGION(3 downto 0),
      uart_m_axi_arsize(2 downto 0) => crossbar_wrap_0_uart_m_axi_ARSIZE(2 downto 0),
      uart_m_axi_arvalid => crossbar_wrap_0_uart_m_axi_ARVALID,
      uart_m_axi_awaddr(31 downto 0) => crossbar_wrap_0_uart_m_axi_AWADDR(31 downto 0),
      uart_m_axi_awburst(1 downto 0) => crossbar_wrap_0_uart_m_axi_AWBURST(1 downto 0),
      uart_m_axi_awcache(3 downto 0) => crossbar_wrap_0_uart_m_axi_AWCACHE(3 downto 0),
      uart_m_axi_awid(0) => crossbar_wrap_0_uart_m_axi_AWID(0),
      uart_m_axi_awlen(7 downto 0) => crossbar_wrap_0_uart_m_axi_AWLEN(7 downto 0),
      uart_m_axi_awlock => crossbar_wrap_0_uart_m_axi_AWLOCK,
      uart_m_axi_awprot(2 downto 0) => crossbar_wrap_0_uart_m_axi_AWPROT(2 downto 0),
      uart_m_axi_awqos(3 downto 0) => crossbar_wrap_0_uart_m_axi_AWQOS(3 downto 0),
      uart_m_axi_awready => crossbar_wrap_0_uart_m_axi_AWREADY,
      uart_m_axi_awregion(3 downto 0) => crossbar_wrap_0_uart_m_axi_AWREGION(3 downto 0),
      uart_m_axi_awsize(2 downto 0) => crossbar_wrap_0_uart_m_axi_AWSIZE(2 downto 0),
      uart_m_axi_awvalid => crossbar_wrap_0_uart_m_axi_AWVALID,
      uart_m_axi_bid(0) => crossbar_wrap_0_uart_m_axi_BID(0),
      uart_m_axi_bready => crossbar_wrap_0_uart_m_axi_BREADY,
      uart_m_axi_bresp(1 downto 0) => crossbar_wrap_0_uart_m_axi_BRESP(1 downto 0),
      uart_m_axi_bvalid => crossbar_wrap_0_uart_m_axi_BVALID,
      uart_m_axi_rdata(31 downto 0) => crossbar_wrap_0_uart_m_axi_RDATA(31 downto 0),
      uart_m_axi_rid(0) => crossbar_wrap_0_uart_m_axi_RID(0),
      uart_m_axi_rlast => crossbar_wrap_0_uart_m_axi_RLAST,
      uart_m_axi_rready => crossbar_wrap_0_uart_m_axi_RREADY,
      uart_m_axi_rresp(1 downto 0) => crossbar_wrap_0_uart_m_axi_RRESP(1 downto 0),
      uart_m_axi_rvalid => crossbar_wrap_0_uart_m_axi_RVALID,
      uart_m_axi_wdata(31 downto 0) => crossbar_wrap_0_uart_m_axi_WDATA(31 downto 0),
      uart_m_axi_wlast => crossbar_wrap_0_uart_m_axi_WLAST,
      uart_m_axi_wready => crossbar_wrap_0_uart_m_axi_WREADY,
      uart_m_axi_wstrb(3 downto 0) => crossbar_wrap_0_uart_m_axi_WSTRB(3 downto 0),
      uart_m_axi_wvalid => crossbar_wrap_0_uart_m_axi_WVALID
    );
proc_sys_reset_0: component design_1_proc_sys_reset_0_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_0_locked,
      ext_reset_in => ext_reset_in_0_1,
      interconnect_aresetn(0) => proc_sys_reset_0_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_0_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_0_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_0_clk_out1
    );
uart_0: component design_1_uart_0_0
     port map (
      aclk => clk_wiz_0_clk_out1,
      aresetn => proc_sys_reset_0_peripheral_aresetn(0),
      axi_araddr(15 downto 0) => axi_full2lite_conver_0_m_axi_ARADDR(15 downto 0),
      axi_arprot(2 downto 0) => axi_full2lite_conver_0_m_axi_ARPROT(2 downto 0),
      axi_arready => axi_full2lite_conver_0_m_axi_ARREADY,
      axi_arvalid => axi_full2lite_conver_0_m_axi_ARVALID,
      axi_awaddr(15 downto 0) => axi_full2lite_conver_0_m_axi_AWADDR(15 downto 0),
      axi_awprot(2 downto 0) => axi_full2lite_conver_0_m_axi_AWPROT(2 downto 0),
      axi_awready => axi_full2lite_conver_0_m_axi_AWREADY,
      axi_awvalid => axi_full2lite_conver_0_m_axi_AWVALID,
      axi_bready => axi_full2lite_conver_0_m_axi_BREADY,
      axi_bresp(1 downto 0) => axi_full2lite_conver_0_m_axi_BRESP(1 downto 0),
      axi_bvalid => axi_full2lite_conver_0_m_axi_BVALID,
      axi_rdata(31 downto 0) => axi_full2lite_conver_0_m_axi_RDATA(31 downto 0),
      axi_rready => axi_full2lite_conver_0_m_axi_RREADY,
      axi_rresp(1 downto 0) => axi_full2lite_conver_0_m_axi_RRESP(1 downto 0),
      axi_rvalid => axi_full2lite_conver_0_m_axi_RVALID,
      axi_wdata(31 downto 0) => axi_full2lite_conver_0_m_axi_WDATA(31 downto 0),
      axi_wready => axi_full2lite_conver_0_m_axi_WREADY,
      axi_wstrb(3 downto 0) => axi_full2lite_conver_0_m_axi_WSTRB(3 downto 0),
      axi_wvalid => axi_full2lite_conver_0_m_axi_WVALID,
      clk_debug => NLW_uart_0_clk_debug_UNCONNECTED,
      tx => uart_0_tx,
      uart_tx_cpu_pause => uart_0_uart_tx_cpu_pause
    );
end STRUCTURE;
