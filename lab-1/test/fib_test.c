#include "greatest.h"

extern int fibonacci(int x);

TEST
test_fib()
{
	ASSERT_EQ(fibonacci(0), 0);
	ASSERT_EQ(fibonacci(1), 1);
	ASSERT_EQ(fibonacci(6), 8);
	ASSERT_EQ(fibonacci(15), 610);
	ASSERT_EQ(fibonacci(20), 6765);

	ASSERT_EQ(fibonacci(-123), 0);

	PASS();
}

SUITE(fibonacii_suite)
{
	RUN_TEST(test_fib);
}
