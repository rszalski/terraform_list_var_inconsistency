## About

This MWE illustrates a problem with parsing lists passed as variables to modules. The problem is evident if lists are first created from module or data outputs (not literals).

According to the docs, surrounding square brackes should not be used: https://www.terraform.io/docs/configuration/interpolation.html#user-list-variables

Relevant GH issue: https://github.com/hashicorp/terraform/issues/13869

## Expected behavior

List variable should be correctly parsed *inside* the module *without* additional pair of surrounding square brackets (`[...]`).

## Requirements:

* Terraform v0.10.2 (however as reported in the mentioned issue, v0.9.2 also has this behavior)

## How to reproduce

1. Run `terraform init` in this dir
1. Run `terraform plan` -> should error out with:

        module.list-var-example.aws_instance.list-example: vpc_security_group_ids: should be a list
1. Uncomment either `list-var-example/main.tf:6` or `main.tf:20`
1. Re run `terraform plan` -> no errors