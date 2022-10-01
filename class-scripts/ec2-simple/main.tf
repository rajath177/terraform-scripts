resource "aws_instance" "ec2_create" {
    ami = "ami-024c319d5d14b463e"
    count = 2 
    instance_type = "t2.micro"
    tags = {
        Name = "terraform_ec2"
    }
}
