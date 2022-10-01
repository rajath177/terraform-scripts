output "ec2_public_ip" {
    value = resource.aws_instance.ec2_provisioner.public_ip
}