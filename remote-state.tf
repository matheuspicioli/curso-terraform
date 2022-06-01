terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "matheuslabs"

        workspaces {
            name = "aws-matheusicloud"
        }
    }
}