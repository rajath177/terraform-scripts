module "ec2_create" {
    source = "./modules/ec2_instance"
    ec2_ami = "ami-024c319d5d14b463e"
    ec2_instance_type = "t2.micro"
    ec2_pem = "Devops-rajath177"	
}

module "file" {
    source = "./modules/file"
    ec2_user = "ubuntu"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

module "local_exec" {
    source = "./modules/local_exec"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

module "remote_exec" {
    source = "./modules/remote_exec"
    ec2_user = "ubuntu"
    ec2_public_ip = module.ec2_create.ec2_public_ip    
}