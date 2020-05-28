-makelib ies_lib/xpm -sv \
  "E:/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../zynq_sim.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../zynq_sim.srcs/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_cpu_0_0/sim/design_1_cpu_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_crossbar_wrap_0_0/sim/design_1_crossbar_wrap_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_axi_full2lite_conver_0_0/sim/design_1_axi_full2lite_conver_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_uart_0_0/sim/design_1_uart_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_bram_0_0/sim/design_1_bram_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_bram_1_0/sim/design_1_bram_1_0.vhd" \
-endlib
-makelib ies_lib/axi_bram_ctrl_v4_1_2 \
  "../../../../zynq_sim.srcs/sources_1/bd/design_1/ipshared/a002/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_1/sim/design_1_axi_bram_ctrl_0_1.vhd" \
  "../../../bd/design_1/ip/design_1_axi_bram_ctrl_1_1/sim/design_1_axi_bram_ctrl_1_1.vhd" \
  "../../../bd/design_1/sim/design_1.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

