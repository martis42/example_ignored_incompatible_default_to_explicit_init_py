# Summary

This is an example for repdoducing a bug in Bazel regarding the flag `incompatible_default_to_explicit_init_py` being
ignored under certain circumstances.

**Bug**\
A Python binary which is being used by `ctx.actions.run` in the `exec` config will ignore the flag
`incompatible_default_to_explicit_init_py`

# Commands for reproducing

Exammple for automatically generating an `__init__.py` file although the flag `--incompatible_default_to_explicit_init_py`
is set in the `.bazelrc`:\
`bazel build //:cfg_exec_with_binary_without_explicit_legacy_create_init`

The following commands work as expected and will not generate a `__init__.py` file:
- `bazel build //:cfg_target_with_binary_without_explicit_legacy_create_init` - The `target` config works as expected.
- `bazel build //:cfg_exec_with_binary_setting_legacy_create_init` - Explicitly setting `legacy_create_init = False,` in
  the py_binary circumvents the bug.
- `bazel build //:cfg_target_with_binary_setting_legacy_create_init` - Examples for completeness. Combines both working
  cases from above and works as expected as well.

# Notes

- The binary which is used by `actions.run` has to be in sub directory. An `__init__.py` file is not generated for targets
  which live at the repository root.
- One cannot run `bazel build //...` in this example repo. The targets have to be executed exclusively, due to the
  example rule implementation being over simplified and not guarding against multipe outputs being generated with the same name.
