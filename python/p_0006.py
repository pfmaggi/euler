#!/usr/bin/env python3

"""Find the difference between the sum of the squares of the first one hundred
   natural numbers and the square of the sum."""


def sum_of_squares(limit):
    """The sum of the squares of the natural numbers up to limit."""
    total = 0
    for num in range(limit+1):
        total += num ** 2

    return total


def square_of_sum(limit):
    """The square of the sum of the natural numbers up to limit."""
    total = 0
    for num in range(limit+1):
        total += num

    return total ** 2


def compute_difference(limit):
    """Find the difference between the sum of the squares and
       the square of the sum."""
    return square_of_sum(limit) - sum_of_squares(limit)
