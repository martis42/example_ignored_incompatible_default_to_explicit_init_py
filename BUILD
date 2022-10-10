load("//:example.bzl", "example_cfg_exec", "example_cfg_target")

example_cfg_exec(
    name = "cfg_exec_with_binary_without_explicit_legacy_create_init",
    binary_to_run = "//foo:binary_without_explicit_legacy_create_init",
)

example_cfg_target(
    name = "cfg_target_with_binary_without_explicit_legacy_create_init",
    binary_to_run = "//foo:binary_without_explicit_legacy_create_init",
)

example_cfg_exec(
    name = "cfg_exec_with_binary_setting_legacy_create_init",
    binary_to_run = "//foo:binary_setting_legacy_create_init",
)

example_cfg_target(
    name = "cfg_target_with_binary_setting_legacy_create_init",
    binary_to_run = "//foo:binary_setting_legacy_create_init",
)
