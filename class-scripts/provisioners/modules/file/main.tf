resource "null_resource" "ec2_provisioner_1" {
    connection {
        type = "ssh"
        user = var.ec2_user
        agent = false
        host = "${var.ec2_public_ip}"
        private_key = file("keys/Devops-rajath177.pem")
    } 

    provisioner "file" {
        source = "dir1/test1"
        destination = "/home/ubuntu/test1"
    }  
}