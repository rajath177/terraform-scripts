provider "aws" {
    access_key = ""
    secret_key = ""
    region = ""
}
resource "aws_ebs_volume" "test_volume" {
    availability_zone = "ap-south-1a"
    size = 50
    tags = {
        Name = "test_vol"
    }
}