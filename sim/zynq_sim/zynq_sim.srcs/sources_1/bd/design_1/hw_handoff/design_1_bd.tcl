
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# axi_full2lite_converter, bram, bram, cpu, crossbar_wrap, uart

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk_100MHz [ create_bd_port -dir I -type clk -freq_hz 100000000 clk_100MHz ]
  set reset_rtl [ create_bd_port -dir I -type rst reset_rtl ]
  set tx [ create_bd_port -dir O tx ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_bram_ctrl_1, and set properties
  set axi_bram_ctrl_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_1 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_1

  # Create instance: axi_full2lite_conver_0, and set properties
  set block_name axi_full2lite_converter
  set block_cell_name axi_full2lite_conver_0
  if { [catch {set axi_full2lite_conver_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axi_full2lite_conver_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: bram_0, and set properties
  set block_name bram
  set block_cell_name bram_0
  if { [catch {set bram_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.select_app {simb} \
 ] $bram_0

  # Create instance: bram_1, and set properties
  set block_name bram
  set block_cell_name bram_1
  if { [catch {set bram_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.select_app {main} \
 ] $bram_1

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {313.516} \
   CONFIG.CLKOUT1_PHASE_ERROR {275.507} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {49.400} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {30.875} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {15.625} \
   CONFIG.MMCM_DIVCLK_DIVIDE {4} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_0

  # Create instance: cpu_0, and set properties
  set block_name cpu
  set block_cell_name cpu_0
  if { [catch {set cpu_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $cpu_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.alu_type {DEFAULT} \
   CONFIG.cache_enable {True} \
   CONFIG.cache_replace_policy {RR} \
   CONFIG.mult_type {DEFAULT} \
   CONFIG.shifter_type {DEFAULT} \
 ] $cpu_0

  # Create instance: crossbar_wrap_0, and set properties
  set block_name crossbar_wrap
  set block_cell_name crossbar_wrap_0
  if { [catch {set crossbar_wrap_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $crossbar_wrap_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH {0} \
 ] $proc_sys_reset_0

  # Create instance: uart_0, and set properties
  set block_name uart
  set block_cell_name uart_0
  if { [catch {set uart_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $uart_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.clock_frequency {49400000} \
   CONFIG.log_file {uart_output.txt} \
 ] $uart_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_full2lite_conver_0_m_axi [get_bd_intf_pins axi_full2lite_conver_0/m_axi] [get_bd_intf_pins uart_0/axi]
  connect_bd_intf_net -intf_net cpu_0_axi [get_bd_intf_pins cpu_0/axi] [get_bd_intf_pins crossbar_wrap_0/cpu_s_axi]
  connect_bd_intf_net -intf_net crossbar_wrap_0_bram_m_axi [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins crossbar_wrap_0/bram_m_axi]
  connect_bd_intf_net -intf_net crossbar_wrap_0_ram_m_axi [get_bd_intf_pins axi_bram_ctrl_1/S_AXI] [get_bd_intf_pins crossbar_wrap_0/ram_m_axi]
  connect_bd_intf_net -intf_net crossbar_wrap_0_uart_m_axi [get_bd_intf_pins axi_full2lite_conver_0/s_axi] [get_bd_intf_pins crossbar_wrap_0/uart_m_axi]

  # Create port connections
  connect_bd_net -net axi_bram_ctrl_0_bram_addr_a [get_bd_pins axi_bram_ctrl_0/bram_addr_a] [get_bd_pins bram_0/bram_addr_a]
  connect_bd_net -net axi_bram_ctrl_0_bram_clk_a [get_bd_pins axi_bram_ctrl_0/bram_clk_a] [get_bd_pins bram_0/bram_clk_a]
  connect_bd_net -net axi_bram_ctrl_0_bram_en_a [get_bd_pins axi_bram_ctrl_0/bram_en_a] [get_bd_pins bram_0/bram_en_a]
  connect_bd_net -net axi_bram_ctrl_0_bram_rst_a [get_bd_pins axi_bram_ctrl_0/bram_rst_a] [get_bd_pins bram_0/bram_rst_a]
  connect_bd_net -net axi_bram_ctrl_0_bram_we_a [get_bd_pins axi_bram_ctrl_0/bram_we_a] [get_bd_pins bram_0/bram_we_a]
  connect_bd_net -net axi_bram_ctrl_0_bram_wrdata_a [get_bd_pins axi_bram_ctrl_0/bram_wrdata_a] [get_bd_pins bram_0/bram_wrdata_a]
  connect_bd_net -net axi_bram_ctrl_1_bram_addr_a [get_bd_pins axi_bram_ctrl_1/bram_addr_a] [get_bd_pins bram_1/bram_addr_a]
  connect_bd_net -net axi_bram_ctrl_1_bram_clk_a [get_bd_pins axi_bram_ctrl_1/bram_clk_a] [get_bd_pins bram_1/bram_clk_a]
  connect_bd_net -net axi_bram_ctrl_1_bram_en_a [get_bd_pins axi_bram_ctrl_1/bram_en_a] [get_bd_pins bram_1/bram_en_a]
  connect_bd_net -net axi_bram_ctrl_1_bram_rst_a [get_bd_pins axi_bram_ctrl_1/bram_rst_a] [get_bd_pins bram_1/bram_rst_a]
  connect_bd_net -net axi_bram_ctrl_1_bram_we_a [get_bd_pins axi_bram_ctrl_1/bram_we_a] [get_bd_pins bram_1/bram_we_a]
  connect_bd_net -net axi_bram_ctrl_1_bram_wrdata_a [get_bd_pins axi_bram_ctrl_1/bram_wrdata_a] [get_bd_pins bram_1/bram_wrdata_a]
  connect_bd_net -net bram_0_bram_rddata_a [get_bd_pins axi_bram_ctrl_0/bram_rddata_a] [get_bd_pins bram_0/bram_rddata_a]
  connect_bd_net -net bram_1_bram_rddata_a [get_bd_pins axi_bram_ctrl_1/bram_rddata_a] [get_bd_pins bram_1/bram_rddata_a]
  connect_bd_net -net clk_100MHz_1 [get_bd_ports clk_100MHz] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_bram_ctrl_1/s_axi_aclk] [get_bd_pins axi_full2lite_conver_0/aclk] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins cpu_0/aclk] [get_bd_pins crossbar_wrap_0/aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins uart_0/aclk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net ext_reset_in_0_1 [get_bd_ports reset_rtl] [get_bd_pins clk_wiz_0/resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins crossbar_wrap_0/aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_1/s_axi_aresetn] [get_bd_pins axi_full2lite_conver_0/aresetn] [get_bd_pins cpu_0/aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins uart_0/aresetn]
  connect_bd_net -net uart_0_tx [get_bd_ports tx] [get_bd_pins uart_0/tx]
  connect_bd_net -net uart_0_uart_tx_cpu_pause [get_bd_pins cpu_0/uart_tx_cpu_pause] [get_bd_pins uart_0/uart_tx_cpu_pause]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces crossbar_wrap_0/bram_m_axi] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x10000000 -range 0x02000000 -target_address_space [get_bd_addr_spaces crossbar_wrap_0/ram_m_axi] [get_bd_addr_segs axi_bram_ctrl_1/S_AXI/Mem0] -force
  assign_bd_address -offset 0x20000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces crossbar_wrap_0/uart_m_axi] [get_bd_addr_segs axi_full2lite_conver_0/s_axi/reg0] -force

  # Exclude Address Segments
  exclude_bd_addr_seg -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_full2lite_conver_0/m_axi] [get_bd_addr_segs uart_0/axi/reg0]
  exclude_bd_addr_seg -offset 0x00000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces cpu_0/axi] [get_bd_addr_segs crossbar_wrap_0/cpu_s_axi/reg0]


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


