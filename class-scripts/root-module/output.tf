output "ami_id" {
    value = data.aws_ami.get_k8s_master_ami.image_id
}

output "ami_arn" {
    value = data.aws_ami.get_k8s_master_ami.arn
}