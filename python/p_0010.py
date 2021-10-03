#!/usr/bin/env python3

"""
Euler problem 10:

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"""


import argparse


def compute_primes_sum(limit):
    """
    limit: upper limits for the prime numbers to compute
    return: list of prime numbers
    """
    primes = [2]
    primes_sum = 2
    for candidate in range(3, limit, 2):
        is_prime = True
        # for i in range(2, int(candidate/2)+1):
        for i in primes:
            if candidate % i == 0:
                is_prime = False
                break
        if is_prime:
            primes.append(candidate)
            primes_sum += candidate
    return primes_sum


if __name__ == '__main__':
    """
    Find the sum of all the primes below limit.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("limit", help="Upper limit for the primes to sum", type=int)
    args = parser.parse_args()
    print("Find the sum of the primes below", args.limit)
    print("Sum:", compute_primes_sum(args.limit))
