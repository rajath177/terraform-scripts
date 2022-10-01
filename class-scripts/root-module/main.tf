module "s3_backend_create" {
    source = "./modules/s3_bucket"
    bucket_name = "s3-backend-bucket-5687654867"
}

module "dynamodb_locking_create" {
   source = "./modules/dynamo_db"
   dynamo_name = "my_dynamo_locking_table"
   hash_key = "LockID"
   bill_mode = "PAY_PER_REQUEST"
}

data "aws_ami" "get_k8s_master_ami" {
    most_recent = true
    owners = ["376271725454"]
    tags = {
      Name = "K8S"
    }

    filter {
      name = "state"
      values = ["available"]
    }

    filter {
      name = "tag:Name"
      values = ["K8S"]
    }
}

module "create_k8s_master_node" {
    source = "./modules/ec2_instance"
    k8s_ami = data.aws_ami.get_k8s_master_ami.image_id
    k8s_instance_type = var.module_k8s_instance_type
    count = 1 
}
