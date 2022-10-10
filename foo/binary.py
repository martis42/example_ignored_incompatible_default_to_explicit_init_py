import subprocess

# Create dummy output to satisfy actions.run
with open("bazel-out/k8-fastbuild/bin/dummy", "a"):
    pass

# Analyze runfiles tree
subprocess.run(["echo", "=== Init files in runfiles tree ==="])
subprocess.run(["find", "-type", "f", "-iname", "*ini*"])
subprocess.run(["echo", "==================================="])
subprocess.run(["echo", "===== Runfiles tree overview ====="])
subprocess.run(["tree"])
subprocess.run(["echo", "==================================="])
