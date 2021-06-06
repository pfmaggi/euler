#!/usr/bin/env python3

"""Find the largest palindrome made from the product of two 3-digit numbers."""


def is_number_palindrome(num):
    """Return True if num is palindrome, False if not."""
    value = str(num)
    for i in range(int(len(value)/2)+1):
        if value[i] != value[-(i+1)]:
            return False
    return True


def search_largest_palindrome(limit):
    """Print largest palindrome product of two numbers
       with limit number of digits. """
    upper = 10**limit
    largest_palindrome = 0
    factors = (0, 0)
    for i in range(upper):
        for j in range(upper):
            value = i * j
            if is_number_palindrome(value) and value > largest_palindrome:
                largest_palindrome = value
                factors = (i, j)
    print(
        "Largest palindrome is: ",
        factors[0], "*", factors[1],
        "=", largest_palindrome
    )
