# terraform-cloud-test

This repo is to provide an example implementation of Runway with a [remote Terraform backend](https://www.terraform.io/docs/backends/types/remote.html) while developing support for the functionality.

To use this with any other account, edit the [runway.yml](./runway.yml) to substitute in the appropriate `hostname` and `organization` (backend config files located in module directories will also need to be updated if they exist).
The `namespace` variable will also need to be updated if deploying the control module and its s3 backend.

Runway is being installed directly from GitHub to demonstrate new functionality.
To install from the same source, run `pipenv install` then use `pipenv run runway <command>` to execute commands.

## Modules

- tf-state.cfn: Deploys an S3 Bucket and DynamoDB table for `test-module-control.tf` to use.
- test-module-01.tf: Showcases the use of `options` to configure the backend and automatically writing `parameters` to a `runway-parameters.auto.tfvars.json` file. This uses a `workspaces.prefix` to allow Runway to set the appropriate workspace as needed.
- test-module-02.tf: Showcases the use of a `.hcl` file to configure the backend and automatically writing `parameters` to a `runway-parameters.auto.tfvars.json` file. This uses a `workspaces.name` means that Runway will never set a workspace and always use `default`.
- test-module-control.tf: A modules that worked before any changes were made and uses an `s3` backend. Used to ensure that current functionality is not broken.

## Caveats

- environment variables are not passed to the remote runners of a remote backend so they either need to be passed as Runway parameters into a Terraform variable or create the workspace ahead of time and pre-populate it's environment variables with credentials.
