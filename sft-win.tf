variable "aws_key_path" {}

// Use the private key in the AWS console to decrypt the password after downloading the .rdp file
resource "aws_key_pair" "sftdeployer" {
  key_name   = "sft-deployer-key"
  public_key = "${file("${var.aws_key_path}")}"
}

resource "template_file" "userdata" {
  // TODO: conditionally include enrollment token from vars as per https://www.scaleft.com/docs/sftd-windows/
  template = "${file("${path.module}/scaleft-init.ps1")}"
}

resource "aws_instance" "sft-win-vm" {
  count                  = 1
  ami                    = "ami-1712d877"                       // Microsoft Windows Server 2012 R2 Base - ami-1712d877
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  source_dest_check      = false
  user_data              = "${template_file.userdata.rendered}"
  key_name               = "sft-deployer-key"

  tags = {
    Name = "sft-win-vm"
  }

  lifecycle {
    ignore_changes = ["user_data"]
  }
}
