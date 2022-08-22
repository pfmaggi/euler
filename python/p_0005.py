#!/usr/bin/env python3

"""What is the smallest positive number that is evenly divisible by
 all of the numbers from 1 to 20?"""


from collections import Counter, defaultdict


def compute_factors(num):
    """Compute factors of num."""

    remainder = num
    factors = []
    for i in range(2, num+1):
        while remainder % i == 0:
            remainder = remainder / i
            factors.append(i)
    return Counter(factors)


def common_factors(limit):
    """Compute smallest positive number that is divisible by
    all of the numbers from 1 to limit."""

    factors = defaultdict(list)
    result = 1
    for i in range(2, limit+1):
        # factors.append(compute_factors(i).elements())
        # print(i, compute_factors(i))
        elements = compute_factors(i).most_common()
        for k, v in elements:
            factors[k].append(v)

    # print(factors.items())
    for k, v in factors.items():
        # print(k, max(v))
        result *= (k ** max(v))
    return result


if __name__ == '__main__':
    print(common_factors(20))
