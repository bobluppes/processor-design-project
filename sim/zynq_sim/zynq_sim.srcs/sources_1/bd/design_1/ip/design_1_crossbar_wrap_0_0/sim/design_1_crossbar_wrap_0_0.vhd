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

-- IP VLNV: xilinx.com:module_ref:crossbar_wrap:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_crossbar_wrap_0_0 IS
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    cpu_s_axi_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    cpu_s_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    cpu_s_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    cpu_s_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    cpu_s_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    cpu_s_axi_awlock : IN STD_LOGIC;
    cpu_s_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cpu_s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    cpu_s_axi_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cpu_s_axi_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cpu_s_axi_awvalid : IN STD_LOGIC;
    cpu_s_axi_awready : OUT STD_LOGIC;
    cpu_s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    cpu_s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cpu_s_axi_wlast : IN STD_LOGIC;
    cpu_s_axi_wvalid : IN STD_LOGIC;
    cpu_s_axi_wready : OUT STD_LOGIC;
    cpu_s_axi_bid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    cpu_s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    cpu_s_axi_bvalid : OUT STD_LOGIC;
    cpu_s_axi_bready : IN STD_LOGIC;
    cpu_s_axi_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    cpu_s_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    cpu_s_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    cpu_s_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    cpu_s_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    cpu_s_axi_arlock : IN STD_LOGIC;
    cpu_s_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cpu_s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    cpu_s_axi_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cpu_s_axi_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cpu_s_axi_arvalid : IN STD_LOGIC;
    cpu_s_axi_arready : OUT STD_LOGIC;
    cpu_s_axi_rid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    cpu_s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    cpu_s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    cpu_s_axi_rlast : OUT STD_LOGIC;
    cpu_s_axi_rvalid : OUT STD_LOGIC;
    cpu_s_axi_rready : IN STD_LOGIC;
    bram_m_axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    bram_m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bram_m_axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    bram_m_axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    bram_m_axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    bram_m_axi_awlock : OUT STD_LOGIC;
    bram_m_axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    bram_m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    bram_m_axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    bram_m_axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    bram_m_axi_awvalid : OUT STD_LOGIC;
    bram_m_axi_awready : IN STD_LOGIC;
    bram_m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bram_m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    bram_m_axi_wlast : OUT STD_LOGIC;
    bram_m_axi_wvalid : OUT STD_LOGIC;
    bram_m_axi_wready : IN STD_LOGIC;
    bram_m_axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    bram_m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    bram_m_axi_bvalid : IN STD_LOGIC;
    bram_m_axi_bready : OUT STD_LOGIC;
    bram_m_axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    bram_m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bram_m_axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    bram_m_axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    bram_m_axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    bram_m_axi_arlock : OUT STD_LOGIC;
    bram_m_axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    bram_m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    bram_m_axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    bram_m_axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    bram_m_axi_arvalid : OUT STD_LOGIC;
    bram_m_axi_arready : IN STD_LOGIC;
    bram_m_axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    bram_m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    bram_m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    bram_m_axi_rlast : IN STD_LOGIC;
    bram_m_axi_rvalid : IN STD_LOGIC;
    bram_m_axi_rready : OUT STD_LOGIC;
    ram_m_axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ram_m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ram_m_axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ram_m_axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ram_m_axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ram_m_axi_awlock : OUT STD_LOGIC;
    ram_m_axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ram_m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ram_m_axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ram_m_axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ram_m_axi_awvalid : OUT STD_LOGIC;
    ram_m_axi_awready : IN STD_LOGIC;
    ram_m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ram_m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ram_m_axi_wlast : OUT STD_LOGIC;
    ram_m_axi_wvalid : OUT STD_LOGIC;
    ram_m_axi_wready : IN STD_LOGIC;
    ram_m_axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ram_m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    ram_m_axi_bvalid : IN STD_LOGIC;
    ram_m_axi_bready : OUT STD_LOGIC;
    ram_m_axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ram_m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ram_m_axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ram_m_axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ram_m_axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ram_m_axi_arlock : OUT STD_LOGIC;
    ram_m_axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ram_m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    ram_m_axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ram_m_axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ram_m_axi_arvalid : OUT STD_LOGIC;
    ram_m_axi_arready : IN STD_LOGIC;
    ram_m_axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ram_m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ram_m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    ram_m_axi_rlast : IN STD_LOGIC;
    ram_m_axi_rvalid : IN STD_LOGIC;
    ram_m_axi_rready : OUT STD_LOGIC;
    uart_m_axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    uart_m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    uart_m_axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    uart_m_axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    uart_m_axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    uart_m_axi_awlock : OUT STD_LOGIC;
    uart_m_axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    uart_m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    uart_m_axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    uart_m_axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    uart_m_axi_awvalid : OUT STD_LOGIC;
    uart_m_axi_awready : IN STD_LOGIC;
    uart_m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    uart_m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    uart_m_axi_wlast : OUT STD_LOGIC;
    uart_m_axi_wvalid : OUT STD_LOGIC;
    uart_m_axi_wready : IN STD_LOGIC;
    uart_m_axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    uart_m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    uart_m_axi_bvalid : IN STD_LOGIC;
    uart_m_axi_bready : OUT STD_LOGIC;
    uart_m_axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    uart_m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    uart_m_axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    uart_m_axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    uart_m_axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    uart_m_axi_arlock : OUT STD_LOGIC;
    uart_m_axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    uart_m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    uart_m_axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    uart_m_axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    uart_m_axi_arvalid : OUT STD_LOGIC;
    uart_m_axi_arready : IN STD_LOGIC;
    uart_m_axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    uart_m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    uart_m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    uart_m_axi_rlast : IN STD_LOGIC;
    uart_m_axi_rvalid : IN STD_LOGIC;
    uart_m_axi_rready : OUT STD_LOGIC
  );
END design_1_crossbar_wrap_0_0;

ARCHITECTURE design_1_crossbar_wrap_0_0_arch OF design_1_crossbar_wrap_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_crossbar_wrap_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT crossbar_wrap IS
    GENERIC (
      axi_address_width : INTEGER;
      axi_data_width : INTEGER;
      axi_slave_id_width : INTEGER;
      axi_master_amount : INTEGER;
      axi_slave_amount : INTEGER;
      axi_master_base_address : STD_LOGIC_VECTOR;
      axi_master_high_address : STD_LOGIC_VECTOR
    );
    PORT (
      aclk : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      cpu_s_axi_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      cpu_s_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cpu_s_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      cpu_s_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      cpu_s_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      cpu_s_axi_awlock : IN STD_LOGIC;
      cpu_s_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cpu_s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      cpu_s_axi_awqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cpu_s_axi_awregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cpu_s_axi_awvalid : IN STD_LOGIC;
      cpu_s_axi_awready : OUT STD_LOGIC;
      cpu_s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cpu_s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cpu_s_axi_wlast : IN STD_LOGIC;
      cpu_s_axi_wvalid : IN STD_LOGIC;
      cpu_s_axi_wready : OUT STD_LOGIC;
      cpu_s_axi_bid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      cpu_s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      cpu_s_axi_bvalid : OUT STD_LOGIC;
      cpu_s_axi_bready : IN STD_LOGIC;
      cpu_s_axi_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      cpu_s_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cpu_s_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      cpu_s_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      cpu_s_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      cpu_s_axi_arlock : IN STD_LOGIC;
      cpu_s_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cpu_s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      cpu_s_axi_arqos : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cpu_s_axi_arregion : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cpu_s_axi_arvalid : IN STD_LOGIC;
      cpu_s_axi_arready : OUT STD_LOGIC;
      cpu_s_axi_rid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      cpu_s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      cpu_s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      cpu_s_axi_rlast : OUT STD_LOGIC;
      cpu_s_axi_rvalid : OUT STD_LOGIC;
      cpu_s_axi_rready : IN STD_LOGIC;
      bram_m_axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      bram_m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_m_axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      bram_m_axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      bram_m_axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      bram_m_axi_awlock : OUT STD_LOGIC;
      bram_m_axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bram_m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      bram_m_axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bram_m_axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bram_m_axi_awvalid : OUT STD_LOGIC;
      bram_m_axi_awready : IN STD_LOGIC;
      bram_m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bram_m_axi_wlast : OUT STD_LOGIC;
      bram_m_axi_wvalid : OUT STD_LOGIC;
      bram_m_axi_wready : IN STD_LOGIC;
      bram_m_axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      bram_m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      bram_m_axi_bvalid : IN STD_LOGIC;
      bram_m_axi_bready : OUT STD_LOGIC;
      bram_m_axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      bram_m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_m_axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      bram_m_axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      bram_m_axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      bram_m_axi_arlock : OUT STD_LOGIC;
      bram_m_axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bram_m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      bram_m_axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bram_m_axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bram_m_axi_arvalid : OUT STD_LOGIC;
      bram_m_axi_arready : IN STD_LOGIC;
      bram_m_axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      bram_m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      bram_m_axi_rlast : IN STD_LOGIC;
      bram_m_axi_rvalid : IN STD_LOGIC;
      bram_m_axi_rready : OUT STD_LOGIC;
      ram_m_axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      ram_m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ram_m_axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      ram_m_axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      ram_m_axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      ram_m_axi_awlock : OUT STD_LOGIC;
      ram_m_axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ram_m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      ram_m_axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ram_m_axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ram_m_axi_awvalid : OUT STD_LOGIC;
      ram_m_axi_awready : IN STD_LOGIC;
      ram_m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ram_m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ram_m_axi_wlast : OUT STD_LOGIC;
      ram_m_axi_wvalid : OUT STD_LOGIC;
      ram_m_axi_wready : IN STD_LOGIC;
      ram_m_axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      ram_m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      ram_m_axi_bvalid : IN STD_LOGIC;
      ram_m_axi_bready : OUT STD_LOGIC;
      ram_m_axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      ram_m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ram_m_axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      ram_m_axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      ram_m_axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      ram_m_axi_arlock : OUT STD_LOGIC;
      ram_m_axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ram_m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      ram_m_axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ram_m_axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ram_m_axi_arvalid : OUT STD_LOGIC;
      ram_m_axi_arready : IN STD_LOGIC;
      ram_m_axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      ram_m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      ram_m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      ram_m_axi_rlast : IN STD_LOGIC;
      ram_m_axi_rvalid : IN STD_LOGIC;
      ram_m_axi_rready : OUT STD_LOGIC;
      uart_m_axi_awid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      uart_m_axi_awaddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      uart_m_axi_awlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      uart_m_axi_awsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      uart_m_axi_awburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      uart_m_axi_awlock : OUT STD_LOGIC;
      uart_m_axi_awcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      uart_m_axi_awprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      uart_m_axi_awqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      uart_m_axi_awregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      uart_m_axi_awvalid : OUT STD_LOGIC;
      uart_m_axi_awready : IN STD_LOGIC;
      uart_m_axi_wdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      uart_m_axi_wstrb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      uart_m_axi_wlast : OUT STD_LOGIC;
      uart_m_axi_wvalid : OUT STD_LOGIC;
      uart_m_axi_wready : IN STD_LOGIC;
      uart_m_axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      uart_m_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      uart_m_axi_bvalid : IN STD_LOGIC;
      uart_m_axi_bready : OUT STD_LOGIC;
      uart_m_axi_arid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      uart_m_axi_araddr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      uart_m_axi_arlen : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      uart_m_axi_arsize : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      uart_m_axi_arburst : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      uart_m_axi_arlock : OUT STD_LOGIC;
      uart_m_axi_arcache : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      uart_m_axi_arprot : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      uart_m_axi_arqos : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      uart_m_axi_arregion : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      uart_m_axi_arvalid : OUT STD_LOGIC;
      uart_m_axi_arready : IN STD_LOGIC;
      uart_m_axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      uart_m_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      uart_m_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      uart_m_axi_rlast : IN STD_LOGIC;
      uart_m_axi_rvalid : IN STD_LOGIC;
      uart_m_axi_rready : OUT STD_LOGIC
    );
  END COMPONENT crossbar_wrap;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_crossbar_wrap_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi RID";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi ARID";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi BID";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF uart_m_axi_awid: SIGNAL IS "XIL_INTERFACENAME uart_m_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 49400000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS" & 
" 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF uart_m_axi_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 uart_m_axi AWID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi RID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi ARID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi BID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ram_m_axi_awid: SIGNAL IS "XIL_INTERFACENAME ram_m_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 49400000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS " & 
"1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ram_m_axi_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 ram_m_axi AWID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi RID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi ARID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi BID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF bram_m_axi_awid: SIGNAL IS "XIL_INTERFACENAME bram_m_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 49400000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS" & 
" 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF bram_m_axi_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 bram_m_axi AWID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi RID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi ARID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi BID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awregion: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awqos: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF cpu_s_axi_awid: SIGNAL IS "XIL_INTERFACENAME cpu_s_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 49400000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS " & 
"1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF cpu_s_axi_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 cpu_s_axi AWID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aresetn: SIGNAL IS "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aclk: SIGNAL IS "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF bram_m_axi:cpu_s_axi:ram_m_axi:uart_m_axi, ASSOCIATED_RESET aresetn, FREQ_HZ 49400000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 aclk CLK";
BEGIN
  U0 : crossbar_wrap
    GENERIC MAP (
      axi_address_width => 32,
      axi_data_width => 32,
      axi_slave_id_width => 0,
      axi_master_amount => 3,
      axi_slave_amount => 1,
      axi_master_base_address => X"200000001000000000000000",
      axi_master_high_address => X"2000FFFF11FFFFFF00001FFF"
    )
    PORT MAP (
      aclk => aclk,
      aresetn => aresetn,
      cpu_s_axi_awid => cpu_s_axi_awid,
      cpu_s_axi_awaddr => cpu_s_axi_awaddr,
      cpu_s_axi_awlen => cpu_s_axi_awlen,
      cpu_s_axi_awsize => cpu_s_axi_awsize,
      cpu_s_axi_awburst => cpu_s_axi_awburst,
      cpu_s_axi_awlock => cpu_s_axi_awlock,
      cpu_s_axi_awcache => cpu_s_axi_awcache,
      cpu_s_axi_awprot => cpu_s_axi_awprot,
      cpu_s_axi_awqos => cpu_s_axi_awqos,
      cpu_s_axi_awregion => cpu_s_axi_awregion,
      cpu_s_axi_awvalid => cpu_s_axi_awvalid,
      cpu_s_axi_awready => cpu_s_axi_awready,
      cpu_s_axi_wdata => cpu_s_axi_wdata,
      cpu_s_axi_wstrb => cpu_s_axi_wstrb,
      cpu_s_axi_wlast => cpu_s_axi_wlast,
      cpu_s_axi_wvalid => cpu_s_axi_wvalid,
      cpu_s_axi_wready => cpu_s_axi_wready,
      cpu_s_axi_bid => cpu_s_axi_bid,
      cpu_s_axi_bresp => cpu_s_axi_bresp,
      cpu_s_axi_bvalid => cpu_s_axi_bvalid,
      cpu_s_axi_bready => cpu_s_axi_bready,
      cpu_s_axi_arid => cpu_s_axi_arid,
      cpu_s_axi_araddr => cpu_s_axi_araddr,
      cpu_s_axi_arlen => cpu_s_axi_arlen,
      cpu_s_axi_arsize => cpu_s_axi_arsize,
      cpu_s_axi_arburst => cpu_s_axi_arburst,
      cpu_s_axi_arlock => cpu_s_axi_arlock,
      cpu_s_axi_arcache => cpu_s_axi_arcache,
      cpu_s_axi_arprot => cpu_s_axi_arprot,
      cpu_s_axi_arqos => cpu_s_axi_arqos,
      cpu_s_axi_arregion => cpu_s_axi_arregion,
      cpu_s_axi_arvalid => cpu_s_axi_arvalid,
      cpu_s_axi_arready => cpu_s_axi_arready,
      cpu_s_axi_rid => cpu_s_axi_rid,
      cpu_s_axi_rdata => cpu_s_axi_rdata,
      cpu_s_axi_rresp => cpu_s_axi_rresp,
      cpu_s_axi_rlast => cpu_s_axi_rlast,
      cpu_s_axi_rvalid => cpu_s_axi_rvalid,
      cpu_s_axi_rready => cpu_s_axi_rready,
      bram_m_axi_awid => bram_m_axi_awid,
      bram_m_axi_awaddr => bram_m_axi_awaddr,
      bram_m_axi_awlen => bram_m_axi_awlen,
      bram_m_axi_awsize => bram_m_axi_awsize,
      bram_m_axi_awburst => bram_m_axi_awburst,
      bram_m_axi_awlock => bram_m_axi_awlock,
      bram_m_axi_awcache => bram_m_axi_awcache,
      bram_m_axi_awprot => bram_m_axi_awprot,
      bram_m_axi_awqos => bram_m_axi_awqos,
      bram_m_axi_awregion => bram_m_axi_awregion,
      bram_m_axi_awvalid => bram_m_axi_awvalid,
      bram_m_axi_awready => bram_m_axi_awready,
      bram_m_axi_wdata => bram_m_axi_wdata,
      bram_m_axi_wstrb => bram_m_axi_wstrb,
      bram_m_axi_wlast => bram_m_axi_wlast,
      bram_m_axi_wvalid => bram_m_axi_wvalid,
      bram_m_axi_wready => bram_m_axi_wready,
      bram_m_axi_bid => bram_m_axi_bid,
      bram_m_axi_bresp => bram_m_axi_bresp,
      bram_m_axi_bvalid => bram_m_axi_bvalid,
      bram_m_axi_bready => bram_m_axi_bready,
      bram_m_axi_arid => bram_m_axi_arid,
      bram_m_axi_araddr => bram_m_axi_araddr,
      bram_m_axi_arlen => bram_m_axi_arlen,
      bram_m_axi_arsize => bram_m_axi_arsize,
      bram_m_axi_arburst => bram_m_axi_arburst,
      bram_m_axi_arlock => bram_m_axi_arlock,
      bram_m_axi_arcache => bram_m_axi_arcache,
      bram_m_axi_arprot => bram_m_axi_arprot,
      bram_m_axi_arqos => bram_m_axi_arqos,
      bram_m_axi_arregion => bram_m_axi_arregion,
      bram_m_axi_arvalid => bram_m_axi_arvalid,
      bram_m_axi_arready => bram_m_axi_arready,
      bram_m_axi_rid => bram_m_axi_rid,
      bram_m_axi_rdata => bram_m_axi_rdata,
      bram_m_axi_rresp => bram_m_axi_rresp,
      bram_m_axi_rlast => bram_m_axi_rlast,
      bram_m_axi_rvalid => bram_m_axi_rvalid,
      bram_m_axi_rready => bram_m_axi_rready,
      ram_m_axi_awid => ram_m_axi_awid,
      ram_m_axi_awaddr => ram_m_axi_awaddr,
      ram_m_axi_awlen => ram_m_axi_awlen,
      ram_m_axi_awsize => ram_m_axi_awsize,
      ram_m_axi_awburst => ram_m_axi_awburst,
      ram_m_axi_awlock => ram_m_axi_awlock,
      ram_m_axi_awcache => ram_m_axi_awcache,
      ram_m_axi_awprot => ram_m_axi_awprot,
      ram_m_axi_awqos => ram_m_axi_awqos,
      ram_m_axi_awregion => ram_m_axi_awregion,
      ram_m_axi_awvalid => ram_m_axi_awvalid,
      ram_m_axi_awready => ram_m_axi_awready,
      ram_m_axi_wdata => ram_m_axi_wdata,
      ram_m_axi_wstrb => ram_m_axi_wstrb,
      ram_m_axi_wlast => ram_m_axi_wlast,
      ram_m_axi_wvalid => ram_m_axi_wvalid,
      ram_m_axi_wready => ram_m_axi_wready,
      ram_m_axi_bid => ram_m_axi_bid,
      ram_m_axi_bresp => ram_m_axi_bresp,
      ram_m_axi_bvalid => ram_m_axi_bvalid,
      ram_m_axi_bready => ram_m_axi_bready,
      ram_m_axi_arid => ram_m_axi_arid,
      ram_m_axi_araddr => ram_m_axi_araddr,
      ram_m_axi_arlen => ram_m_axi_arlen,
      ram_m_axi_arsize => ram_m_axi_arsize,
      ram_m_axi_arburst => ram_m_axi_arburst,
      ram_m_axi_arlock => ram_m_axi_arlock,
      ram_m_axi_arcache => ram_m_axi_arcache,
      ram_m_axi_arprot => ram_m_axi_arprot,
      ram_m_axi_arqos => ram_m_axi_arqos,
      ram_m_axi_arregion => ram_m_axi_arregion,
      ram_m_axi_arvalid => ram_m_axi_arvalid,
      ram_m_axi_arready => ram_m_axi_arready,
      ram_m_axi_rid => ram_m_axi_rid,
      ram_m_axi_rdata => ram_m_axi_rdata,
      ram_m_axi_rresp => ram_m_axi_rresp,
      ram_m_axi_rlast => ram_m_axi_rlast,
      ram_m_axi_rvalid => ram_m_axi_rvalid,
      ram_m_axi_rready => ram_m_axi_rready,
      uart_m_axi_awid => uart_m_axi_awid,
      uart_m_axi_awaddr => uart_m_axi_awaddr,
      uart_m_axi_awlen => uart_m_axi_awlen,
      uart_m_axi_awsize => uart_m_axi_awsize,
      uart_m_axi_awburst => uart_m_axi_awburst,
      uart_m_axi_awlock => uart_m_axi_awlock,
      uart_m_axi_awcache => uart_m_axi_awcache,
      uart_m_axi_awprot => uart_m_axi_awprot,
      uart_m_axi_awqos => uart_m_axi_awqos,
      uart_m_axi_awregion => uart_m_axi_awregion,
      uart_m_axi_awvalid => uart_m_axi_awvalid,
      uart_m_axi_awready => uart_m_axi_awready,
      uart_m_axi_wdata => uart_m_axi_wdata,
      uart_m_axi_wstrb => uart_m_axi_wstrb,
      uart_m_axi_wlast => uart_m_axi_wlast,
      uart_m_axi_wvalid => uart_m_axi_wvalid,
      uart_m_axi_wready => uart_m_axi_wready,
      uart_m_axi_bid => uart_m_axi_bid,
      uart_m_axi_bresp => uart_m_axi_bresp,
      uart_m_axi_bvalid => uart_m_axi_bvalid,
      uart_m_axi_bready => uart_m_axi_bready,
      uart_m_axi_arid => uart_m_axi_arid,
      uart_m_axi_araddr => uart_m_axi_araddr,
      uart_m_axi_arlen => uart_m_axi_arlen,
      uart_m_axi_arsize => uart_m_axi_arsize,
      uart_m_axi_arburst => uart_m_axi_arburst,
      uart_m_axi_arlock => uart_m_axi_arlock,
      uart_m_axi_arcache => uart_m_axi_arcache,
      uart_m_axi_arprot => uart_m_axi_arprot,
      uart_m_axi_arqos => uart_m_axi_arqos,
      uart_m_axi_arregion => uart_m_axi_arregion,
      uart_m_axi_arvalid => uart_m_axi_arvalid,
      uart_m_axi_arready => uart_m_axi_arready,
      uart_m_axi_rid => uart_m_axi_rid,
      uart_m_axi_rdata => uart_m_axi_rdata,
      uart_m_axi_rresp => uart_m_axi_rresp,
      uart_m_axi_rlast => uart_m_axi_rlast,
      uart_m_axi_rvalid => uart_m_axi_rvalid,
      uart_m_axi_rready => uart_m_axi_rready
    );
END design_1_crossbar_wrap_0_0_arch;
