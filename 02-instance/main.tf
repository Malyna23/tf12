resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.subnet
}
