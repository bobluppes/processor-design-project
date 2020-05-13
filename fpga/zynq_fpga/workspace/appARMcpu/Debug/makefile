################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
appARMcpu.elf.size \


# All Target
all:
	$(MAKE) --no-print-directory pre-build
	$(MAKE) --no-print-directory main-build

# Main-build Target
main-build: appARMcpu.elf secondary-outputs

# Tool invocations
appARMcpu.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM v7 gcc linker'
	arm-none-eabi-gcc -LC:/Users/boblu/Documents/TuD/MSc_Computer_Engineering/PDP/fpga/zynq_fpga/workspace/design_2_wrapper/export/design_2_wrapper/sw/design_2_wrapper/standalone_domain/bsplib/lib -L"C:\Users\boblu\Documents\TuD\MSc_Computer_Engineering\PDP\fpga\zynq_fpga\workspace\design_2_wrapper\ps7_cortexa9_0\standalone_domain\bsp\ps7_cortexa9_0\lib" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -Wl,-build-id=none -specs=Xilinx.spec -Wl,-T -Wl,../src/lscript.ld -LC:/Users/boblu/Documents/TuD/MSc_Computer_Engineering/PDP/fpga/zynq_fpga/workspace/design_2_wrapper/export/design_2_wrapper/sw/design_2_wrapper/standalone_domain/bsplib/lib -o "appARMcpu.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

appARMcpu.elf.size: appARMcpu.elf
	@echo 'Invoking: ARM v7 Print Size'
	arm-none-eabi-size appARMcpu.elf  |tee "appARMcpu.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) appARMcpu.elf
	-@echo ' '

pre-build:
	-a9-linaro-pre-build-step
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents main-build pre-build

-include ../makefile.targets
