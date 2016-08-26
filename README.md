# tf-aws-sft-win
Terraform to create a Windows Server r2012 node on AWS with ScaleFT Agent installed

# Usage

0. Until I add enrollment token support to this repo, use [ScaleFT Cloud Account integration](https://www.scaleft.com/docs/setup/enrolling-a-server/#associating-an-aws-account-with-a-scaleft-project)  with your AWS account to enroll
1. Create a `terraform.tfvars` file like example below
2. `# terraform apply`
3. `sft list-servers` to see the server name or ID; Alternately just use the AWS instance id
4. `sft rdp <name, id, or instance id>`

# terraform.tfvars

```
access_key = "<IAM access key here>"
secret_key = "<IAM access key secret here>"
aws_key_path = "~/.ssh/aws-demo-rsa.pub"
```

Just use `ssh-keygen` to make a new keypair (with no passphrase) for this purpose.
