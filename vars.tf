variable "amis" {
    type = map
    default = {
        "us-east-1" = "ami-09d56f8956ab235b3"
        "us-east-2" = "ami-0fa49cc9dc8d62c84"
    }
}

variable "cidrs_ssh" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
    default = "terraform-aws"
}