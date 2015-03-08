TEST_DIR = test
TEST_SRCS = $(wildcard $(TEST_DIR)/*.c)
TEST_OBJS = $(addprefix $(BUILD_DIR)/, $(TEST_SRCS:.c=.o))

GREATEST_DIR = greatest

TEST_RUNNER_EXE = test_runner

CFLAGS += -I $(GREATEST_DIR)

.PHONY: doTest
doTest: $(TEST_RUNNER_EXE)
	@$(call QEMU_CMD, $<)

$(TEST_RUNNER_EXE): $(filter-out $(MAIN_OBJ), $(OBJS)) $(TEST_OBJS)
	@$(CC) $(CFLAGS) -o $@ $^
	@echo "     LD     $(notdir $@)"
