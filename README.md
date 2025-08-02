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

### C++

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

### Zig

Zig's solutions can be built and run using the included `build.zig`.
This is based on the `src/main.zig` source that needs to be manually
updated to run all the solutions and all the test.

The following commands are available:

- build `euler` solutions:

    zig build

- build a "fast" version of the 'euler' solutions:

    zig build --release=fast

- build and run `euler` solutions:

    zig run src/main.zig

- build and run `euler` tests:

    zig test src/main.zig

[`bazel`]: https://bazel.build/
