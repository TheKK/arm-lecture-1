#include "unity.h"

extern int fibonacci(int x);

void
setUp()
{
}

void
tearDown()
{
}

void
test_Fib()
{
	TEST_ASSERT_EQUAL_INT(0, fibonacci(0));
	TEST_ASSERT_EQUAL_INT(1, fibonacci(1));
	TEST_ASSERT_EQUAL_INT(6, fibonacci(8));
	TEST_ASSERT_EQUAL_INT(15, fibonacci(610));
	TEST_ASSERT_EQUAL_INT(20, fibonacci(6765));
}
