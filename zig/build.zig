const std = @import("std");

pub fn build(b: *std.Build) !void {
    // Standard target options allow the person running `zig build` to choose
    // what target to build for.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const optimize = b.standardOptimizeOption(.{});

    // 1. Maintain the original 'euler' runner which runs all solutions sequentially.
    // This is useful for running the full suite in a single pass.
    const exe = b.addExecutable(.{
        .name = "euler",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const test_step = b.step("test", "Run unit tests");

    // 2. Dynamically find all p_XXXX.zig files in src/ and create parallel build/test steps for them.
    // This allows the Zig build runner to compile these independent artifacts using all available cores.
    var dir = try std.fs.cwd().openDir("src", .{ .iterate = true });
    defer dir.close();

    var walker = dir.iterate();
    while (try walker.next()) |entry| {
        // Filter for files matching the pattern p_*.zig
        if (entry.kind == .file and std.mem.startsWith(u8, entry.name, "p_") and std.mem.endsWith(u8, entry.name, ".zig")) {
            const name = entry.name[0 .. entry.name.len - 4]; // remove .zig extension
            const source_path = try std.fmt.allocPrint(b.allocator, "src/{s}", .{entry.name});

            // Create a standalone executable for this problem
            // This enables parallel compilation of the problems.
            const p_exe = b.addExecutable(.{
                .name = name,
                .root_module = b.createModule(.{
                    .root_source_file = b.path(source_path),
                    .target = target,
                    .optimize = optimize,
                }),
            });
            b.installArtifact(p_exe);

            // Create a standalone test for this problem
            // This enables parallel execution of tests.
            const p_test = b.addTest(.{
                .root_module = b.createModule(.{
                    .root_source_file = b.path(source_path),
                    .target = target,
                    .optimize = optimize,
                }),
            });
            const run_p_test = b.addRunArtifact(p_test);
            test_step.dependOn(&run_p_test.step);
        }
    }

    // Also include the main test suite (optional, but ensures main.zig integration is tested)
    const main_tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    const run_main_tests = b.addRunArtifact(main_tests);
    test_step.dependOn(&run_main_tests.step);
}

//
// const std = @import("std");
//
// pub fn build(b: *std.Build) void {
//     // Standard target options allows the person running `zig build` to choose
//     // what target to build for. Here we do not override the defaults, which
//     // means any target is allowed, and the default is native. Other options
//     // for restricting supported target set are available.
//     const target = b.standardTargetOptions(.{});
//
//     // Standard optimization options allow the person running `zig build` to select
//     // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
//     // set a preferred release mode, allowing the user to decide how to optimize.
//     const optimize = b.standardOptimizeOption(.{});
//
//     const exe = b.addExecutable(.{ .name = "euler", .root_module = b.createModule(.{
//         .root_source_file = b.path("src/main.zig"),
//         .target = target,
//         .optimize = optimize,
//     }) });
//
//     // This declares intent for the executable to be installed into the
//     // standard location when the user invokes the "install" step (the default
//     // step when running `zig build`).
//     b.installArtifact(exe);
//
//     // This *creates* a Run step in the build graph, to be executed when another
//     // step is evaluated that depends on it. The next line below will establish
//     // such a dependency.
//     const run_cmd = b.addRunArtifact(exe);
//
//     // By making the run step depend on the install step, it will be run from the
//     // installation directory rather than directly from within the cache directory.
//     // This is not necessary, however, if the application depends on other installed
//     // files, this ensures they will be present and in the expected location.
//     run_cmd.step.dependOn(b.getInstallStep());
//
//     // This allows the user to pass arguments to the application in the build
//     // command itself, like this: `zig build run -- arg1 arg2 etc`
//     if (b.args) |args| {
//         run_cmd.addArgs(args);
//     }
//
//     // This creates a build step. It will be visible in the `zig build --help` menu,
//     // and can be selected like this: `zig build run`
//     // This will evaluate the `run` step rather than the default, which is "install".
//     const run_step = b.step("run", "Run the app");
//     run_step.dependOn(&run_cmd.step);
//
//     // Creates a step for unit testing. This only builds the test executable
//     // but does not run it.
//     const lib_unit_tests = b.addTest(.{ .root_module = b.createModule(.{
//         .root_source_file = b.path("src/main.zig"),
//         .target = target,
//         .optimize = optimize,
//     }) });
//
//     const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);
//
//     const exe_unit_tests = b.addTest(.{ .root_module = b.createModule(.{
//         .root_source_file = b.path("src/main.zig"),
//         .target = target,
//         .optimize = optimize,
//     }) });
//
//     const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);
//
//     // Similar to creating the run step earlier, this exposes a `test` step to
//     // the `zig build --help` menu, providing a way for the user to request
//     // running the unit tests.
//     const test_step = b.step("test", "Run unit tests");
//     test_step.dependOn(&run_lib_unit_tests.step);
//     test_step.dependOn(&run_exe_unit_tests.step);
// }
