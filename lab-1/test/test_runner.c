#include "greatest.h"

extern SUITE(fibonacii_suite);

GREATEST_MAIN_DEFS();

int
main(int argc, char* argv[])
{
	GREATEST_MAIN_BEGIN();

	RUN_SUITE(fibonacii_suite);

	GREATEST_MAIN_END();
}
