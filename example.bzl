def _impl(ctx):
    out = ctx.actions.declare_file("dummy")
    ctx.actions.run(
        executable = ctx.executable.binary_to_run,
        outputs = [out],
    )

    return [DefaultInfo(files = depset(direct = [out]))]

example_cfg_exec = rule(
    implementation = _impl,
    attrs = {
        "binary_to_run": attr.label(default = Label("//foo:binary"), executable = True, cfg = "exec"),
    },
)

example_cfg_target = rule(
    implementation = _impl,
    attrs = {
        "binary_to_run": attr.label(default = Label("//foo:binary"), executable = True, cfg = "target"),
    },
)
