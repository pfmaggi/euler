"""Find the sum of all the multiples of 3 or 5 below 1000."""


def multiples_of_three_and_five(limit):
    """Return the sum of all the multiples of 3 or 5 below limit"""

    total = 0
    for i in range(limit):
        if i % 3 == 0:
            total += i
        else:
            if i % 5 == 0:
                total += i

    return total


if __name__ == '__main__':
    print(multiples_of_three_and_five(1000))
