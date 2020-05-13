# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "alu_type" -parent ${Page_0}
  ipgui::add_param $IPINST -name "cache_address_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "cache_enable" -parent ${Page_0}
  ipgui::add_param $IPINST -name "cache_index_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "cache_offset_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "cache_replace_policy" -parent ${Page_0}
  ipgui::add_param $IPINST -name "cache_way_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "mult_type" -parent ${Page_0}
  ipgui::add_param $IPINST -name "shifter_type" -parent ${Page_0}


}

proc update_PARAM_VALUE.alu_type { PARAM_VALUE.alu_type } {
	# Procedure called to update alu_type when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.alu_type { PARAM_VALUE.alu_type } {
	# Procedure called to validate alu_type
	return true
}

proc update_PARAM_VALUE.cache_address_width { PARAM_VALUE.cache_address_width } {
	# Procedure called to update cache_address_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.cache_address_width { PARAM_VALUE.cache_address_width } {
	# Procedure called to validate cache_address_width
	return true
}

proc update_PARAM_VALUE.cache_enable { PARAM_VALUE.cache_enable } {
	# Procedure called to update cache_enable when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.cache_enable { PARAM_VALUE.cache_enable } {
	# Procedure called to validate cache_enable
	return true
}

proc update_PARAM_VALUE.cache_index_width { PARAM_VALUE.cache_index_width } {
	# Procedure called to update cache_index_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.cache_index_width { PARAM_VALUE.cache_index_width } {
	# Procedure called to validate cache_index_width
	return true
}

proc update_PARAM_VALUE.cache_offset_width { PARAM_VALUE.cache_offset_width } {
	# Procedure called to update cache_offset_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.cache_offset_width { PARAM_VALUE.cache_offset_width } {
	# Procedure called to validate cache_offset_width
	return true
}

proc update_PARAM_VALUE.cache_replace_policy { PARAM_VALUE.cache_replace_policy } {
	# Procedure called to update cache_replace_policy when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.cache_replace_policy { PARAM_VALUE.cache_replace_policy } {
	# Procedure called to validate cache_replace_policy
	return true
}

proc update_PARAM_VALUE.cache_way_width { PARAM_VALUE.cache_way_width } {
	# Procedure called to update cache_way_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.cache_way_width { PARAM_VALUE.cache_way_width } {
	# Procedure called to validate cache_way_width
	return true
}

proc update_PARAM_VALUE.mult_type { PARAM_VALUE.mult_type } {
	# Procedure called to update mult_type when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.mult_type { PARAM_VALUE.mult_type } {
	# Procedure called to validate mult_type
	return true
}

proc update_PARAM_VALUE.shifter_type { PARAM_VALUE.shifter_type } {
	# Procedure called to update shifter_type when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.shifter_type { PARAM_VALUE.shifter_type } {
	# Procedure called to validate shifter_type
	return true
}


proc update_MODELPARAM_VALUE.shifter_type { MODELPARAM_VALUE.shifter_type PARAM_VALUE.shifter_type } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.shifter_type}] ${MODELPARAM_VALUE.shifter_type}
}

proc update_MODELPARAM_VALUE.alu_type { MODELPARAM_VALUE.alu_type PARAM_VALUE.alu_type } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.alu_type}] ${MODELPARAM_VALUE.alu_type}
}

proc update_MODELPARAM_VALUE.mult_type { MODELPARAM_VALUE.mult_type PARAM_VALUE.mult_type } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.mult_type}] ${MODELPARAM_VALUE.mult_type}
}

proc update_MODELPARAM_VALUE.cache_enable { MODELPARAM_VALUE.cache_enable PARAM_VALUE.cache_enable } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cache_enable}] ${MODELPARAM_VALUE.cache_enable}
}

proc update_MODELPARAM_VALUE.cache_way_width { MODELPARAM_VALUE.cache_way_width PARAM_VALUE.cache_way_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cache_way_width}] ${MODELPARAM_VALUE.cache_way_width}
}

proc update_MODELPARAM_VALUE.cache_index_width { MODELPARAM_VALUE.cache_index_width PARAM_VALUE.cache_index_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cache_index_width}] ${MODELPARAM_VALUE.cache_index_width}
}

proc update_MODELPARAM_VALUE.cache_offset_width { MODELPARAM_VALUE.cache_offset_width PARAM_VALUE.cache_offset_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cache_offset_width}] ${MODELPARAM_VALUE.cache_offset_width}
}

proc update_MODELPARAM_VALUE.cache_address_width { MODELPARAM_VALUE.cache_address_width PARAM_VALUE.cache_address_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cache_address_width}] ${MODELPARAM_VALUE.cache_address_width}
}

proc update_MODELPARAM_VALUE.cache_replace_policy { MODELPARAM_VALUE.cache_replace_policy PARAM_VALUE.cache_replace_policy } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cache_replace_policy}] ${MODELPARAM_VALUE.cache_replace_policy}
}

