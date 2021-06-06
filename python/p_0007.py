#!/usr/bin/env python3

"""What is the 10 001st prime number?"""


def find_prime_number(count):
    """Find `count`th prime number."""
    prime_num = 0
    candidate = 1
    primes = list()
    while prime_num < count:
        candidate += 1
        is_prime = True
        # for i in range(2, int(candidate/2)+1):
        for i in primes:
            if candidate % i == 0:
                is_prime = False
                break
        if is_prime:
            primes.append(candidate)
            prime_num += 1
    print(count, "th prime:", candidate)
    # print(primes)


if __name__ == '__main__':
    print(find_prime_number(10001))
