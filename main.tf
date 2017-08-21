provider "aws" {
  region      = "eu-west-1"
}

resource "aws_vpc" "list-var-example-vpc" {
  cidr_block  = "10.0.0.0/16"
}

resource "aws_security_group" "list-var-example-sg" {
  name        = "list-var-example-sg"
  vpc_id      = "${aws_vpc.list-var-example-vpc.id}"
}

module "list-var-example" {
  source                = "./list-var-example"

  security_group_ids    = ["${aws_security_group.list-var-example-sg.id}"]
  # However, if the list is constructed using literal syntax (without variables)
  # the following works even without surrounding brackets (`[...]`) inside the module
#   security_group_ids    = ["some_security_group_id_1"]
}