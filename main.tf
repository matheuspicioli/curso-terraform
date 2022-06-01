provider "aws" {
    profile = "default"
    region = "us-east-1"
}

provider "aws" {
    alias = "us-east-2"
    profile = "default"
    region = "us-east-2"
}

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-09d56f8956ab235b3"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
    ami = "ami-09d56f8956ab235b3"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev4"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
    depends_on = [
      aws_s3_bucket.dev4
    ]
}

resource "aws_instance" "dev5" {
    ami = "ami-09d56f8956ab235b3"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev5"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev6" {
    provider = aws.us-east-2
    ami = "ami-0fa49cc9dc8d62c84"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev6"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
    depends_on = [
      aws_dynamodb_table.dynamodb-homolog
    ]
}

resource "aws_s3_bucket" "dev4" {
    bucket = "development-dev4"
    acl = "private"

    tags = {
        Name = "development-dev4"
    }
}

resource "aws_dynamodb_table" "dynamodb-homolog" {
    provider = aws.us-east-2
    name = "GameScores"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "UserId"
    range_key = "GameTitle"

    attribute {
      name = "UserId"
      type = "S"
    }

    attribute {
      name = "GameTitle"
      type = "S"
    }
}