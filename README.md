<div align="center">

# asdf-fabric [![Build](https://github.com/mbwhite/asdf-fabric/actions/workflows/build.yml/badge.svg)](https://github.com/mbwhite/asdf-fabric/actions/workflows/build.yml) [![Lint](https://github.com/mbwhite/asdf-fabric/actions/workflows/lint.yml/badge.svg)](https://github.com/mbwhite/asdf-fabric/actions/workflows/lint.yml)


[fabric](https://github.com/hyperledgendary/asdf-fabric) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add fabric
# or
asdf plugin add fabric https://github.com/mbwhite/asdf-fabric.git
```

fabric:

```shell
# Show all installable versions
asdf list-all fabric

# Install specific version
asdf install fabric latest

# Set a version globally (on your ~/.tool-versions file)
asdf global fabric latest

# Now fabric commands are available
peer version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/mbwhite/asdf-fabric/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Matthew B White](https://github.com/mbwhite/)
