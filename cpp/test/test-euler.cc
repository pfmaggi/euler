#include "../src/euler.h"
#include "gtest/gtest.h"

TEST(EulerTest, Problem0001) { EXPECT_EQ(euler_0001(10), 23); }
TEST(EulerTest, Problem0002) { EXPECT_EQ(euler_0002(100), 44); }
TEST(EulerTest, Problem0003) { EXPECT_EQ(euler_0003(13195), 29); }
TEST(EulerTest, Problem0004) {
    auto [i, j] = euler_0004(2);
    EXPECT_EQ(i * j, 9009);
}
TEST(EulerTest, Problem0005) { EXPECT_EQ(euler_0005(10), 2520); }
TEST(EulerTest, Problem0006) { EXPECT_EQ(euler_0006(10), 2640); }
TEST(EulerTest, Problem0007) { EXPECT_EQ(euler_0007(6), 13); }
TEST(EulerTest, Problem0008) { EXPECT_EQ(euler_0008(4), 5832); }
TEST(EulerTest, Problem0009) {
    if (auto result = euler_0009(25)) {
        int a, b, c;
        std::tie(a, b, c) = result.value();

        EXPECT_EQ(a, 3);
        EXPECT_EQ(b, 4);
        EXPECT_EQ(c, 5);
    }
}
TEST(EulerTest, Problem0010) { EXPECT_EQ(euler_0010(10), 17); }
// There's no test for Problem 11
TEST(EulerTest, Problem0012) { EXPECT_EQ(euler_0012(5), 28); }
TEST(EulerTest, Problem0013) {
    EXPECT_EQ(euler_0013(),
              "5537376230390876637302048746832985971773659831892672");
}
TEST(EulerTest, Problem0014) { EXPECT_EQ(euler_0014(13), 9); }
