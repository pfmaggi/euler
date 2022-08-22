#!/usr/bin/env python3

"""
Euler problem 10:

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"""


import argparse


def compute_primes_sum_sieve(limit):
    """
    limit: upper limits for the prime numbers to compute
    return: sum of the prime numbers found below the limit
    """
    marked = [0] * limit
    value = 3
    s = 2
    while value < limit:
        if marked[value] == 0:
            s += value
            i = value
            while i < limit:
                marked[i] = 1
                i += value
        value += 2
    return s


if __name__ == '__main__':
    """
    Find the sum of all the primes below limit.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("limit", help="Upper limit for the primes to sum", type=int)
    args = parser.parse_args()
    print("Find the sum of the primes below", args.limit)
    print("Sum:", compute_primes_sum_sieve(args.limit))
