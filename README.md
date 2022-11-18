<div align="center">

# asdf-fabric [![Build](https://github.com/hyperledgendary/asdf-fabric/actions/workflows/build.yml/badge.svg)](https://github.com/hyperledgendary/asdf-fabric/actions/workflows/build.yml) [![Lint](https://github.com/hyperledgendary/asdf-fabric/actions/workflows/lint.yml/badge.svg)](https://github.com/hyperledgendary/asdf-fabric/actions/workflows/lint.yml)


[fabric](https://github.com/hyperledgendary/asdf-fabric) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`
- `docker` for pulling the docker images
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add fabric https://github.com/hyperledgendary/asdf-fabric.git
```

Hyperledger Fabric:

The main commands are

```shell
# Install specific version eg 2.4.6
asdf install fabric 2.4.6

# Set shells current version of the Fabric commands to 2.4.6
asdf shell fabric 2.4.6

# Set the docker images for the current selected verion as 'latest'
asdf fabric tag
```

Other useful commands are:

```shell
# Show all installable versions
asdf list-all fabric

# Install specific version
asdf install fabric latest

# Tag the docker images at version 2.4.5 as 'latest'
asdf fabric tag 2.4.5

# Set a version globally (on your ~/.tool-versions file)
asdf global fabric latest

# Now fabric commands are available
peer version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.


# TODO
- validate this work on ARM
- help commands
- support configuring the level of ca
# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).



# License

See [LICENSE](LICENSE) 