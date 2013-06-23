# Golang
Chef cookbook for installing and configuring the [Go](golang.org) programming
language.

## Recipes
The Golang cookbook ships with the following recipes:

#### Default
Chooses which type of Go to install based on `install_flavor` attribute.

#### Package
Installs Go from a package.

#### Source
Installs Go from source. Computes the URL and filename as late as possible so
that overriding in wrapper cookbooks is easy.

## Author
Simple Finance <ops@simple.com>

## License
Apache License, Version 2.0

