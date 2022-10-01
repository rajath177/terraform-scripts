provider "aws" {
    access_key = ""
    secret_key = ""
    region = ""
}
variable "k8s_instance_type" {
    default = "t2.medium"
}
output "ami_id" {
    value = data.aws_ami.get_k8s_master_ami.image_id
}
data "aws_ami" "get_k8s_master_ami" {
    most_recent = true
    owners = ["self"]
    tags = {
        Name = "K8S"
    }
    filter {
        name = "state"
        values = ["available"]
    }
}
resource "aws_instance" "k8s_master_node" {
    ami = data.aws_ami.get_k8s_master_ami.image_id
    instance_type = var.k8s_instance_type
    count = 1
    tags = {
        Name = "K8S_MASTER"
    }
}