variable "secret_key" {}

variable "access_key" {}

provider "aws" {
  region     = "us-west-2"
  secret_key = "${var.secret_key}"
  access_key = "${var.access_key}"
}
