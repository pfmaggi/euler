#include "euler.h"

uint64_t euler_0015(int size) {
    std::vector<std::vector<uint64_t>> grid(size + 1,
                                            std::vector<uint64_t>(size + 1, 0));

    // Initialize the top row and left column
    for (int i = 0; i <= size; ++i) {
        grid[i][0] = 1;
        grid[0][i] = 1;
    }

    // Fill the grid
    for (int i = 1; i <= size; ++i) {
        for (int j = 1; j <= size; ++j) {
            grid[i][j] = grid[i - 1][j] + grid[i][j - 1];
        }
    }

    return grid[size][size];
}
