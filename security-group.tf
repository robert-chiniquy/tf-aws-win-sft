resource "aws_security_group" "default" {
  description = "Minimum functional ACLs for a ScaleFT Windows node"

  tags {
    Name = "SFT-WIN"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ScaleFT
  ingress {
    from_port   = 0
    to_port     = 4421
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # NTP
  egress {
    from_port   = 123
    to_port     = 123
    protocol    = "UDP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
