#!/usr/bin/env python3

"""What is the largest prime factor of the number 600851475143?"""
import math


def find_largest_prime_factor(number):
    """Return largest prime factor"""
    result = 0

    while number % 2 == 0:
        result = 2
        number = number / 2

    for i in range(3, int(math.sqrt(number))+1, 2):
        while number % i == 0:
            result = i
            number = number / i

    if number > 2:
        result = number

    return result


if __name__ == '__main__':
    print(find_largest_prime_factor(600851475143))
