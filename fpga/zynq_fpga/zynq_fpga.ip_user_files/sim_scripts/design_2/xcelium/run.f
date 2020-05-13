-makelib xcelium_lib/xilinx_vip -sv \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/tools/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_6 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_8 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2d50/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_processing_system7_0_0/sim/design_2_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_proc_sys_reset_0_0/sim/design_2_proc_sys_reset_0_0.vhd" \
  "../../../bd/design_2/ip/design_2_crossbar_wrap_0_0/sim/design_2_crossbar_wrap_0_0.vhd" \
  "../../../bd/design_2/ip/design_2_bram_0_0/sim/design_2_bram_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_bram_ctrl_v4_1_2 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/a002/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_axi_bram_ctrl_0_0/sim/design_2_axi_bram_ctrl_0_0.vhd" \
  "../../../bd/design_2/ip/design_2_axi_full2lite_conver_0_0/sim/design_2_axi_full2lite_conver_0_0.vhd" \
  "../../../bd/design_2/ip/design_2_uart_0_0/sim/design_2_uart_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/sim/bd_ebcc.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_6 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_0/sim/bd_ebcc_one_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_1/sim/bd_ebcc_psr_aclk_0.vhd" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/2508/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_2/sim/bd_ebcc_s00mmu_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_3/sim/bd_ebcc_s00tr_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/9d43/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_4/sim/bd_ebcc_s00sic_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_5/sim/bd_ebcc_s00a2s_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_6/sim/bd_ebcc_sarn_0.sv" \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_7/sim/bd_ebcc_srn_0.sv" \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_8/sim/bd_ebcc_sawn_0.sv" \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_9/sim/bd_ebcc_swn_0.sv" \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_10/sim/bd_ebcc_sbn_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_11/sim/bd_ebcc_m00s2a_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/901a/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/design_2/ip/design_2_axi_smc_0/bd_0/ip/ip_12/sim/bd_ebcc_m00e_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_20 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_axi_smc_0/sim/design_2_axi_smc_0.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_22 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/f71e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_axi_gpio_0_0/sim/design_2_axi_gpio_0_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_19 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_21 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_xbar_0/sim/design_2_xbar_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_conv_funs_pkg.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_proc_common_pkg.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_ipif_pkg.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_family_support.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_family.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_soft_reset.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_pselect_f.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_address_decoder.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_slave_attachment.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_interrupt_control.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/design_2_xadc_wiz_0_0_axi_lite_ipif.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/design_2_xadc_wiz_0_0_xadc_core_drp.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/design_2_xadc_wiz_0_0_axi_xadc.vhd" \
  "../../../bd/design_2/ip/design_2_xadc_wiz_0_0/design_2_xadc_wiz_0_0.vhd" \
  "../../../bd/design_2/sim/design_2.vhd" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_20 \
  "../../../../zynq_fpga.srcs/sources_1/bd/design_2/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_2/ip/design_2_auto_pc_0/sim/design_2_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

