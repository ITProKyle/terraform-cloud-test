# terraform-cloud-test

This repo is to provide an example implementation of Runway with a [remote Terraform backend](https://www.terraform.io/docs/backends/types/remote.html) while developing support for the functionality.

To use this with any other account, edit the [runway.yml](./runway.yml) to substitute in the appropriate `hostname` and `organization`.

Runway is being installed directly from GitHub to demonstrate new functionality.
To install from the same source, run `pipenv install` then use `pipenv run runway <command>` to execute commands.
