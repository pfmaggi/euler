#!/usr/bin/env python3

"""
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
"""


from math import sqrt


def is_pythagorean_triplet(a, b):
    """
    a: first number
    b: second number
    return: (bool, c) bool is True if a**2+b**2=c**2
    """

    c = int(sqrt(a**2 + b**2))
    return (((a**2 + b**2) == c**2) and a < b, c)


def euler_0009():
    """
    Find Pythogorean triplet for which a + b + c = 1000
    """

    for a in range(1, 1000):
        for b in range(a, 1000):
            (is_triplet, c) = is_pythagorean_triplet(a, b)
            if is_triplet:
                if a + b + c == 1000:
                    print("Pythagorean Triplet:", a, b, c)
                    product = a * b * c
                    print("product:", product)
                    return product


if __name__ == '__main__':
    euler_0009()
