"""Find the sum of all the multiples of 3 or 5 below 1000."""


def euler_0001(limit):
    """Return the sum of all the multiples of 3 or 5 below limit"""

    total = sum(x for x in range(limit) if (x % 3 == 0) or (x % 5 == 0))

    return total


if __name__ == '__main__':
    print(f"Problem 0001: Sum of multiples of 3 and 5 below 1000 is: {
          euler_0001(1000)}")
