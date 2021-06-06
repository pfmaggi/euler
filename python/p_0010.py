#!/usr/bin/env python3

"""
Euler problem 10:

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"""


def find_primes(limit):
    """
    limit: upper limits for the prime numbers to compute
    return: list of prime numbers
    """
    primes = list()
    for candidate in range(2, limit):
        is_prime = True
        # for i in range(2, int(candidate/2)+1):
        for i in primes:
            if candidate % i == 0:
                is_prime = False
                break
        if is_prime:
            primes.append(candidate)
    return primes


if __name__ == '__main__':
    """
    Find the sum of all the primes below two million.
    """
    primes = find_primes(2000000)
    print(sum(primes))
