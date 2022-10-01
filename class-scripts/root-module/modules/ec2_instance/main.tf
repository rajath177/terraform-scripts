resource "aws_instance" "k8s_master" {
    ami = var.k8s_ami
    instance_type = var.k8s_instance_type
    tags = {
        Name = "K8S_MASTER"
    }
}