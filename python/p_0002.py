#!/usr/bin/env python3


"""By considering the terms in the Fibonacci sequence whose values do not
 exceed four million, find the sum of the even-valued terms."""


def sum_even_fibonacci(limit):
    """Return the sum of the even-valued terms."""
    total = 0
    first = 1
    second = 2
    while second < limit:
        if second % 2 == 0:
            total += second
        (first, second) = (second, first + second)

    return total


if __name__ == '__main__':
    print(sum_even_fibonacci(4000000))
