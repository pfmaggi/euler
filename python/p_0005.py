#!/usr/bin/env python3

"""What is the smallest positive number that is evenly divisible by
 all of the numbers from 1 to 20?"""

from functools import reduce

def gcd(a: int, b: int) -> int:
  """Calculates the greatest common divisor (GCD) of two integers."""
  if b == 0:
    return a
  else:
    return gcd(b, a % b)

def lcm(a: int, b: int) -> int:
  """Calculates the least common multiple (LCM) of two integers."""
  return a * b // gcd(a, b)

if __name__ == "__main__":
  result = reduce(lcm, range(1, 21))
  print(result)
