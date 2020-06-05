# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "axi_address_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "axi_data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "baud" -parent ${Page_0}
  ipgui::add_param $IPINST -name "clock_frequency" -parent ${Page_0}
  ipgui::add_param $IPINST -name "fifo_depth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "log_file" -parent ${Page_0}


}

proc update_PARAM_VALUE.axi_address_width { PARAM_VALUE.axi_address_width } {
	# Procedure called to update axi_address_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.axi_address_width { PARAM_VALUE.axi_address_width } {
	# Procedure called to validate axi_address_width
	return true
}

proc update_PARAM_VALUE.axi_data_width { PARAM_VALUE.axi_data_width } {
	# Procedure called to update axi_data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.axi_data_width { PARAM_VALUE.axi_data_width } {
	# Procedure called to validate axi_data_width
	return true
}

proc update_PARAM_VALUE.baud { PARAM_VALUE.baud } {
	# Procedure called to update baud when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.baud { PARAM_VALUE.baud } {
	# Procedure called to validate baud
	return true
}

proc update_PARAM_VALUE.clock_frequency { PARAM_VALUE.clock_frequency } {
	# Procedure called to update clock_frequency when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.clock_frequency { PARAM_VALUE.clock_frequency } {
	# Procedure called to validate clock_frequency
	return true
}

proc update_PARAM_VALUE.fifo_depth { PARAM_VALUE.fifo_depth } {
	# Procedure called to update fifo_depth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.fifo_depth { PARAM_VALUE.fifo_depth } {
	# Procedure called to validate fifo_depth
	return true
}

proc update_PARAM_VALUE.log_file { PARAM_VALUE.log_file } {
	# Procedure called to update log_file when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.log_file { PARAM_VALUE.log_file } {
	# Procedure called to validate log_file
	return true
}


proc update_MODELPARAM_VALUE.log_file { MODELPARAM_VALUE.log_file PARAM_VALUE.log_file } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.log_file}] ${MODELPARAM_VALUE.log_file}
}

proc update_MODELPARAM_VALUE.fifo_depth { MODELPARAM_VALUE.fifo_depth PARAM_VALUE.fifo_depth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.fifo_depth}] ${MODELPARAM_VALUE.fifo_depth}
}

proc update_MODELPARAM_VALUE.axi_address_width { MODELPARAM_VALUE.axi_address_width PARAM_VALUE.axi_address_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.axi_address_width}] ${MODELPARAM_VALUE.axi_address_width}
}

proc update_MODELPARAM_VALUE.axi_data_width { MODELPARAM_VALUE.axi_data_width PARAM_VALUE.axi_data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.axi_data_width}] ${MODELPARAM_VALUE.axi_data_width}
}

proc update_MODELPARAM_VALUE.baud { MODELPARAM_VALUE.baud PARAM_VALUE.baud } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.baud}] ${MODELPARAM_VALUE.baud}
}

proc update_MODELPARAM_VALUE.clock_frequency { MODELPARAM_VALUE.clock_frequency PARAM_VALUE.clock_frequency } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.clock_frequency}] ${MODELPARAM_VALUE.clock_frequency}
}

