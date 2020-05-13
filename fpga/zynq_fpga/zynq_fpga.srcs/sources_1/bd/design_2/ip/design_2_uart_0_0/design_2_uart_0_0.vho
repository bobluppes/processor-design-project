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

-- IP VLNV: xilinx.com:module_ref:uart:1.0
-- IP Revision: 1

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT design_2_uart_0_0
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    axi_awaddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_awvalid : IN STD_LOGIC;
    axi_awready : OUT STD_LOGIC;
    axi_wvalid : IN STD_LOGIC;
    axi_wready : OUT STD_LOGIC;
    axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_bvalid : OUT STD_LOGIC;
    axi_bready : IN STD_LOGIC;
    axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_araddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_arvalid : IN STD_LOGIC;
    axi_arready : OUT STD_LOGIC;
    axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_rvalid : OUT STD_LOGIC;
    axi_rready : IN STD_LOGIC;
    axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    tx : OUT STD_LOGIC;
    uart_tx_cpu_pause : OUT STD_LOGIC;
    clk_debug : OUT STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : design_2_uart_0_0
  PORT MAP (
    aclk => aclk,
    aresetn => aresetn,
    axi_awaddr => axi_awaddr,
    axi_awprot => axi_awprot,
    axi_awvalid => axi_awvalid,
    axi_awready => axi_awready,
    axi_wvalid => axi_wvalid,
    axi_wready => axi_wready,
    axi_wdata => axi_wdata,
    axi_wstrb => axi_wstrb,
    axi_bvalid => axi_bvalid,
    axi_bready => axi_bready,
    axi_bresp => axi_bresp,
    axi_araddr => axi_araddr,
    axi_arprot => axi_arprot,
    axi_arvalid => axi_arvalid,
    axi_arready => axi_arready,
    axi_rdata => axi_rdata,
    axi_rvalid => axi_rvalid,
    axi_rready => axi_rready,
    axi_rresp => axi_rresp,
    tx => tx,
    uart_tx_cpu_pause => uart_tx_cpu_pause,
    clk_debug => clk_debug
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file design_2_uart_0_0.vhd when simulating
-- the core, design_2_uart_0_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

