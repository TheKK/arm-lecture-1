CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

SRC_DIR = .
BUILD_DIR = build

SRCS = $(wildcard $(SRC_DIR)/*.c)
SRCS += $(wildcard $(SRC_DIR)/*.s)
OBJS = $(addprefix $(BUILD_DIR)/, $(SRCS))
OBJS := $(OBJS:.c=.o)
OBJS := $(OBJS:.s=.o)

MAIN_OBJ = $(BUILD_DIR)/$(SRC_DIR)/fibseq.o

GCC_PATH = ../../gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/libc
QEMU_CMD = qemu-arm -L $(GCC_PATH) $(1)

default: fibseq

include mk/test.mk

.PHONY: default clean qemu

fibseq: $(OBJS)
	@$(CC) $(LDFLAGS) -o $@ $^
	@echo "     LD     $(notdir $@)"

$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@$(CC) -c $(CFLAGS) -o $@ $<
	@echo "     CC     $(notdir $@)"

$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	@$(CC) -c $(CFLAGS) -o $@ $<
	@echo "     CC     $(notdir $@)"

clean:
	@rm -frv $(BUILD_DIR) fibseq test_runner

qemu: fibseq
	@$(call QEMU_CMD, $<)
