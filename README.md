# Project Euler Solutions in multiple languages

These are solutions to the various
[Project Euler](http://projecteuler.net/) problems in multiple languages,
updated as I feel like it. These are not necessarily the fastest
solutions but rather simple, clean solutions that run in under a
minute on modest hardware. The purpose is to play with different
languages using different paradigms.

## Format

Each solution is provided in it's own file, `p_000x.*`, providing
a single function named `euler-000x`, which takes no arguments and
returns an integer representing the answer.

Functions useful to multiple problems can be found in
`common.*`.

## C

You can use [`CMake`] to build, run and test the C solutions.

To build the executables, from the `c/build` folder, run the `cmake ..`
command. This will generate the required build files. You can then
build all the problems using the command:

    cmake --build .

to build only a single solutions (p_0003 in this example), use the command:

    cmake --build . --target p_0003

## C++

You can use [`bazel`] to build, run and test the C++ solutions.

To build `euler` executable that include all the solutions use:

    bazel build //src:euler

To build an optimized version of the solutions use:

    bazel build -c opt //src:euler

To build and run all the solutions you can use:

    bazel run //src:euler

To test all the solutions you can use:

    bazel test //test:euler

To see the details of all the tests use:

    bazel test --test_output=all test:euler

## Zig

Zig's solutions can be built and run using the included `build.zig`.
This is based on the `src/main.zig` source that needs to be manually
updated to run all the solutions and all the test.

The following commands are available:

To build `euler` solutions (and also all the solutions executables):

    zig build

To build a "fast" version of the solutions:

    zig build --release=fast

To test the solutions

    $ zig build test
    # (No output means success!)

To explicitly see which tests ran and passed, use the `--summary all` flag:

    zig build test --summary all

This will print a tree of all the build steps and test results.

To build and run `euler` solutions:

    zig run src/main.zig

To build and run `euler` tests:

    zig test src/main.zig

## Rust

This project contains solutions to various [Project Euler][euler] problems,
implemented in idiomatic Rust. It uses a centralized runner architecture to
measure execution time and manage multiple solutions within a single binary.

### 🚀 Quick Start

Ensure you have [Rust and Cargo](https://rustup.rs/) installed.

#### Run All Solutions

To execute every implemented problem sequentially and see the total execution time:

```bash
cargo run all

```

#### Run a Specific Problem

To run a single problem by its ID:

```bash
cargo run 1

```

### ⚡ Performance & Release Mode

Project Euler problems often involve heavy mathematical computations. By default, `cargo run` compiles in **Debug mode**, which includes many runtime checks and no optimizations.

#### Compiling for Speed

To get the "true" timing of a solution, you **must** use the release flag:

```bash
cargo run --release all

```

#### Why use `--release`?

Rust's compiler is incredibly powerful but conservative in debug mode. In release mode:

* **Optimization Level 3:** The compiler rewrites your logic to be as fast as possible.
* **LTO (Link Time Optimization):** Optimizes across module boundaries.
* **Loop Unrolling:** Speeds up the intensive loops common in these problems.

| Mode | Performance | Best For |
| --- | --- | --- |
| **Debug** | Slow execution, fast compilation | Initial coding and debugging |
| **Release** | **10x - 100x faster**, slower compilation | Final answers and benchmarking |

### ⏱️ Understanding the Timing

Each problem is wrapped in a timer using `std::time::Instant`.

* **Execution Time:** The time taken for the `solve()` function to find the answer.
* **The One Minute Rule:** Project Euler is designed so that every problem can be solved in under one minute on a standard computer. Using the `Runner` trait ensures you are keeping your algorithms efficient.

### 🧪 Testing

Each problem includes unit tests with the known correct answers. To verify all solutions are still working correctly:

```bash
cargo test

```

[`bazel`]: https://bazel.build/
[`CMake`]: https://cmake.org/
[euler]: https://projecteuler.net/
