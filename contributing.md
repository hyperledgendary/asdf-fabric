# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test fabric https://github.com/mbwhite/asdf-fabric.git "peer version"
```

Tests are automatically run in GitHub Actions on push and PR.
