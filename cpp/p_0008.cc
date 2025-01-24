#include <algorithm>
#include <cassert>
#include <cstddef>
#include <cstdio>
#include <iostream>
#include <numeric>
#include <ostream>
#include <string>

auto calculate_product(const std::string& str, size_t start, size_t digits) {
    auto begin = str.begin() + start;
    return std::accumulate(
        begin, begin + digits, 1ul,
        [](unsigned long product, char c) { return product * atol(&c); });
}

auto find_greatest_product(const std::string& number, size_t digits) {
    unsigned long greatest_product{0};
    for (size_t i = 0; i < number.size() - digits; ++i) {
        unsigned long current_product = calculate_product(number, i, digits);
        greatest_product = std::max(greatest_product, current_product);
    }
    return greatest_product;
}

int main() {
    std::string number =
        "73167176531330624919225119674426574742355349194934"
        "96983520312774506326239578318016984801869478851843"
        "85861560789112949495459501737958331952853208805511"
        "12540698747158523863050715693290963295227443043557"
        "66896648950445244523161731856403098711121722383113"
        "62229893423380308135336276614282806444486645238749"
        "30358907296290491560440772390713810515859307960866"
        "70172427121883998797908792274921901699720888093776"
        "65727333001053367881220235421809751254540594752243"
        "52584907711670556013604839586446706324415722155397"
        "53697817977846174064955149290862569321978468622482"
        "83972241375657056057490261407972968652414535100474"
        "82166370484403199890008895243450658541227588666881"
        "16427171479924442928230863465674813919123162824586"
        "17866458359124566529476545682848912883142607690042"
        "24219022671055626321111109370544217506941658960408"
        "07198403850962455444362981230987879927244284909188"
        "84580156166097919133875499200524063689912560717606"
        "05886116467109405077541002256983155200055935729725"
        "71636269561882670428252483600823257530420752963450";

    assert(find_greatest_product(number, 4) == 5832);
    auto result = find_greatest_product(number, 13);
    std::cout << "Problem 0008: What is the value of the greatest product of "
                 "thirteen adjacent digits in the number? "
              << result << std::endl;
    return 0;
}
