#include "euler.h"

#include <cassert>
#include <iostream>

int main(void) {
    std::cout << "Problem 0001: Sum of multiples of 3 and 5 below 1000 is: "
              << euler_0001(1000) << '\n';
    std::cout
        << "Problem 0002: Sum of even-valued fibonacci terms below 4000000 is: "
        << euler_0002(4000000) << '\n';
    std::cout << "Problem 0003: The largest prime factor of the number "
                 "600851475143 is: "
              << euler_0003(600851475143) << '\n';
    auto [i, j] = euler_0004(3);
    std::cout << "Problem 0004: The largest palindrome made from the product "
                 "of two 3-digit numbers is: "
              << i << " x " << j << " = " << i * j << "\n";
    std::cout << "Problem 0005: The smallest positive number that is divisible "
                 "by all of the numbers up to 20: "
              << euler_0005(20) << '\n';
    std::cout << "Problem 0006: Difference between the squares of sums and the "
                 "sum of squares: "
              << euler_0006(100) << '\n';
    std::cout << "Problem 0007: The 10001st prime number is: "
              << euler_0007(10001) << '\n';
    std::cout << "Problem 0008: What is the value of the greatest product of "
                 "thirteen adjacent digits in the number? "
              << euler_0008(13) << '\n';
    if (auto result = euler_0009(1000)) {
        int a, b, c;
        std::tie(a, b, c) = result.value();
        std::cout << "Problem 0009: The product of the Pythagorean triplet ("
                  << a << ", " << b << ", " << c << ") is: " << a * b * c
                  << '\n';
    } else {
        std::cout << "No Pythagorean triplet found." << '\n';
    }
    std::cout
        << "Problem 0010: The sum of all the primes below two million is: "
        << euler_0010(2'000'000) << '\n';
    std::cout << "Problem 0011: The greatest product of four adjacent numbers "
                 "in the same direction is: "
              << euler_0011() << '\n';
    std::cout << "Problem 0012: The first triangular number with over 500 "
                 "divisors is: "
              << euler_0012(500) << '\n';
    std::string euler_13 = euler_0013();
    std::cout << "Problem 0013: The first ten digits of the sum are: "
              << euler_13.substr(0, 10) << '\n';
    std::cout << "Problem 0014: The starting number, under one million, that "
                 "produces the longest chain is: "
              << euler_0014(1'000'000) << '\n';
    std::cout << "Problem 0015: In a 20 x 20 grid the number of available "
                 "routes are: "
              << euler_0015(20) << '\n';
    std::cout << "Problem 0016: The sum of the digits of 2^1000 is: "
              << euler_0016(1'000) << '\n';
    std::cout << "Problem 0017: Total number of letters used for numbers from "
                 "1 to 1000 is: "
              << euler_0017(1'000) << '\n';
}
