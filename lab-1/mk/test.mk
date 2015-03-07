TEST_DIR = test
TEST_SRCS = $(wildcard $(TEST_DIR)/*.c)
TEST_OBJS = $(addprefix $(BUILD_DIR)/, $(TEST_SRCS:.c=.o))

TEST_RUNNER_DIR = test/runner
TEST_RUNNER_SRCS = $(wildcard $(TEST_RUNNER_DIR)/*.c)
TEST_RUNNER_OBJS = $(addprefix $(BUILD_DIR)/, $(TEST_RUNNER_SRCS:.c=.o))
TEST_RUNNER_EXES = $(TEST_RUNNER_OBJS:.o=)

UNITY_DIR = Unity
UNITY_SRCS = $(wildcard $(UNITY_DIR)/*.c)
UNITY_OBJS = $(addprefix $(BUILD_DIR)/, $(UNITY_SRCS:.c=.o))

CFLAGS	+= -I Unity

doTest: $(TEST_RUNNER_EXES)
	@$(foreach test, $^, echo "[$(notdir $(test))]";  $(call QEMU_CMD, $(test)))

%_test_Runner: $(filter-out $(MAIN_OBJ), $(OBJS)) %_test_Runner.o $(UNITY_OBJS) $(TEST_OBJS)
	@$(CC) $(CFLAGS) -o $@ $^
	@echo "     LD     $(notdir $@)"
