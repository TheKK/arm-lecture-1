#include "greatest.h"

extern int fibonacci(int x);

TEST
test_fib()
{
	ASSERT_EQ(0, fibonacci(0));
	ASSERT_EQ(1, fibonacci(1));
	/*ASSERT_EQ(6, fibonacci(8));*/
	/*ASSERT_EQ(15, fibonacci(610));*/
	/*ASSERT_EQ(20, fibonacci(6765));*/

	PASS();
}

SUITE(fibonacii_suite)
{
	RUN_TEST(test_fib);
}
