-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:cpu:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_2_cpu_0_0 IS
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_awlock : OUT STD_LOGIC;
    axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_awvalid : OUT STD_LOGIC;
    axi_awready : IN STD_LOGIC;
    axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_wlast : OUT STD_LOGIC;
    axi_wvalid : OUT STD_LOGIC;
    axi_wready : IN STD_LOGIC;
    axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_bvalid : IN STD_LOGIC;
    axi_bready : OUT STD_LOGIC;
    axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_arlock : OUT STD_LOGIC;
    axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_arvalid : OUT STD_LOGIC;
    axi_arready : IN STD_LOGIC;
    axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_rlast : IN STD_LOGIC;
    axi_rvalid : IN STD_LOGIC;
    axi_rready : OUT STD_LOGIC;
    uart_tx_cpu_pause : IN STD_LOGIC
  );
END design_2_cpu_0_0;

ARCHITECTURE design_2_cpu_0_0_arch OF design_2_cpu_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_2_cpu_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT cpu IS
    GENERIC (
      shifter_type : STRING;
      alu_type : STRING;
      mult_type : STRING;
      cache_enable : STRING;
      cache_way_width : INTEGER;
      cache_index_width : INTEGER;
      cache_offset_width : INTEGER;
      cache_address_width : INTEGER;
      cache_replace_policy : STRING
    );
    PORT (
      aclk : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      axi_awlock : OUT STD_LOGIC;
      axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_awvalid : OUT STD_LOGIC;
      axi_awready : IN STD_LOGIC;
      axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_wlast : OUT STD_LOGIC;
      axi_wvalid : OUT STD_LOGIC;
      axi_wready : IN STD_LOGIC;
      axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      axi_bvalid : IN STD_LOGIC;
      axi_bready : OUT STD_LOGIC;
      axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      axi_arlock : OUT STD_LOGIC;
      axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_arvalid : OUT STD_LOGIC;
      axi_arready : IN STD_LOGIC;
      axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      axi_rlast : IN STD_LOGIC;
      axi_rvalid : IN STD_LOGIC;
      axi_rready : OUT STD_LOGIC;
      uart_tx_cpu_pause : IN STD_LOGIC
    );
  END COMPONENT cpu;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_2_cpu_0_0_arch: ARCHITECTURE IS "cpu,Vivado 2019.2.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_2_cpu_0_0_arch : ARCHITECTURE IS "design_2_cpu_0_0,cpu,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_2_cpu_0_0_arch: ARCHITECTURE IS "design_2_cpu_0_0,cpu,{x_ipProduct=Vivado 2019.2.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=cpu,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,shifter_type=DEFAULT,alu_type=DEFAULT,mult_type=DEFAULT,cache_enable=True,cache_way_width=1,cache_index_width=9,cache_offset_width=4,cache_address_width=25,cache_replace_policy=RR}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_2_cpu_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi RID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi ARID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF axi_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi BID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_awid: SIGNAL IS "XIL_INTERFACENAME axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 50000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, " & 
"NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 axi AWID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aresetn: SIGNAL IS "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aclk: SIGNAL IS "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF axi, ASSOCIATED_RESET aresetn, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_2_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 aclk CLK";
BEGIN
  U0 : cpu
    GENERIC MAP (
      shifter_type => "DEFAULT",
      alu_type => "DEFAULT",
      mult_type => "DEFAULT",
      cache_enable => "True",
      cache_way_width => 1,
      cache_index_width => 9,
      cache_offset_width => 4,
      cache_address_width => 25,
      cache_replace_policy => "RR"
    )
    PORT MAP (
      aclk => aclk,
      aresetn => aresetn,
      axi_awid => axi_awid,
      axi_awaddr => axi_awaddr,
      axi_awlen => axi_awlen,
      axi_awsize => axi_awsize,
      axi_awburst => axi_awburst,
      axi_awlock => axi_awlock,
      axi_awcache => axi_awcache,
      axi_awprot => axi_awprot,
      axi_awqos => axi_awqos,
      axi_awregion => axi_awregion,
      axi_awvalid => axi_awvalid,
      axi_awready => axi_awready,
      axi_wdata => axi_wdata,
      axi_wstrb => axi_wstrb,
      axi_wlast => axi_wlast,
      axi_wvalid => axi_wvalid,
      axi_wready => axi_wready,
      axi_bid => axi_bid,
      axi_bresp => axi_bresp,
      axi_bvalid => axi_bvalid,
      axi_bready => axi_bready,
      axi_arid => axi_arid,
      axi_araddr => axi_araddr,
      axi_arlen => axi_arlen,
      axi_arsize => axi_arsize,
      axi_arburst => axi_arburst,
      axi_arlock => axi_arlock,
      axi_arcache => axi_arcache,
      axi_arprot => axi_arprot,
      axi_arqos => axi_arqos,
      axi_arregion => axi_arregion,
      axi_arvalid => axi_arvalid,
      axi_arready => axi_arready,
      axi_rid => axi_rid,
      axi_rdata => axi_rdata,
      axi_rresp => axi_rresp,
      axi_rlast => axi_rlast,
      axi_rvalid => axi_rvalid,
      axi_rready => axi_rready,
      uart_tx_cpu_pause => uart_tx_cpu_pause
    );
END design_2_cpu_0_0_arch;
