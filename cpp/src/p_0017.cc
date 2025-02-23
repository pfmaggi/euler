#include "euler.h"
#include "iota_view.h"

// Function to convert a number (1-999) to its word representation
std::string number_to_words(int num) {
    static const std::vector<std::string> units = {
        "",     "one", "two",   "three", "four",
        "five", "six", "seven", "eight", "nine"};
    static const std::vector<std::string> teens = {
        "ten",     "eleven",  "twelve",    "thirteen", "fourteen",
        "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
    static const std::vector<std::string> tens = {
        "",      "",      "twenty",  "thirty", "forty",
        "fifty", "sixty", "seventy", "eighty", "ninety"};

    if (num == 0) {
        return "";
    }

    std::string result;

    // Thousand place
    if (num >= 1000) {
        result += units[num / 1000] + "thousand";
        num %= 1000;
        if (num > 0) {
            result += "and";
        }
    }

    // Hundreds place
    if (num >= 100) {
        result += units[num / 100] + "hundred";
        num %= 100;
        if (num > 0) {
            result += "and";
        }
    }

    // Tens place
    if (num >= 20) {
        result += tens[num / 10];
        num %= 10;
    } else if (num >= 10) {
        result += teens[num - 10];
        num = 0;
    }

    // Units place
    if (num > 0 && num < 10) {
        result += units[num];
    }

    return result;
}

int euler_0017(int limit) {
    auto numbers = iota_view{1, limit + 1};
    return std::accumulate(numbers.begin(), numbers.end(), 0,
                           [](int result, int x) {
                               std::string word{number_to_words(x)};
                               return result + word.length();
                           });
}
