#!/usr/bin/env python3

"""What is the largest prime factor of the number 600851475143?"""


def find_largest_prime_factor(number):
    """Return largest prime factor"""
    result = 0

    while number % 2 == 0:
        result = 2
        number = number / 2

    i = 3
    while i < number:
        while number % i == 0:
            result = i
            number = number / i
        i = i + 2

    if number > 2:
        result = number

    return result


if __name__ == '__main__':
    print(find_largest_prime_factor(600851475143))
