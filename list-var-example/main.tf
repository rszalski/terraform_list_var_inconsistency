resource "aws_instance" "list-example-ec2" {
  ami                       = "ami-d7b9a2b1"
  instance_type             = "t2.nano"
  vpc_security_group_ids    = "${var.security_group_ids}"
  # However the following works (notice the surrounding square brackets)
  # vpc_security_group_ids    = ["${var.security_group_ids}"]
}