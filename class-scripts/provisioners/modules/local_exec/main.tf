resource "null_resource" "ec2_provisioner_2" {
    provisioner "local-exec" {
        command = "echo ${var.ec2_public_ip} >> dir1/public_ips.txt" 
    } 
}