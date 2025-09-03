module "stackgen_153c49ed-abf2-422e-9d5d-60cf2d5c22ad" {
  source                             = "./modules/aws_nat_gateway"
  allocation_id                      = null
  connectivity_type                  = null
  private_ip                         = null
  secondary_allocation_ids           = null
  secondary_private_ip_address_count = null
  secondary_private_ip_addresses     = null
  subnet_id                          = module.stackgen_827520c9-7a62-4cae-972b-38b52e2aedd8.id
  tags = {
    Name = "AppStack-NAT-Gateway"
  }
  timeouts = null
}

module "stackgen_161ccb09-23ff-49e3-9d20-58b6e7b9ac60" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Effect\": \"Allow\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Action\": \"sts:AssumeRole\"\n    }\n  ]\n}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = null
  path                  = null
  permissions_boundary  = null
  tags                  = {}
}

module "stackgen_1c9f9326-82eb-4ac0-badd-5b07386c736d" {
  source      = "./modules/aws_sg"
  description = "Managed by Terraform."
  egress      = []
  ingress     = []
  name        = "AppStack-SecurityGroup"
  tags = {
    Name = "AppStack-SecurityGroup"
  }
  vpc_id = null
}

module "stackgen_2d39ca6d-d88a-4278-b829-979c71e361d1" {
  source      = "./modules/aws_iam_instance_profile"
  name        = null
  name_prefix = null
  path        = "/"
  role        = module.stackgen_161ccb09-23ff-49e3-9d20-58b6e7b9ac60.name
  tags        = null
}

module "stackgen_3d546c4c-f8c2-46ce-96e0-e3bf322cf287" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Name = "dj-vpc"
  }
}

module "stackgen_4a9b55c9-433c-4a52-9098-150c121a7aae" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "abc"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags                         = {}
  website_error_document       = "404.html"
  website_index_document       = "index.html"
}

module "stackgen_827520c9-7a62-4cae-972b-38b52e2aedd8" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags = {
    Environment = "dev"
    Name        = "MySubnet"
  }
  vpc_id = module.stackgen_850b257b-aa33-42bc-86de-cd4b0b9a3d85.id
}

module "stackgen_850b257b-aa33-42bc-86de-cd4b0b9a3d85" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Name = "dj-vpc"
  }
}

module "stackgen_c0b3170b-622b-4482-ad8d-1c795f37b503" {
  source = "./modules/aws_internet_gateway"
  tags = {
    Name = "true"
  }
  vpc_id = module.stackgen_850b257b-aa33-42bc-86de-cd4b0b9a3d85.id
}

module "stackgen_c909c256-985f-41a3-935d-826a045fc301" {
  source                               = "./modules/aws_instance"
  ami                                  = null
  associate_public_ip_address          = false
  availability_zone                    = null
  capacity_reservation_specification   = []
  cpu_options                          = []
  credit_specification                 = []
  disable_api_stop                     = null
  disable_api_termination              = null
  ebs_block_device                     = []
  ebs_optimized                        = null
  enable_primary_ipv6                  = null
  enclave_options                      = []
  ephemeral_block_device               = []
  get_password_data                    = null
  hibernation                          = null
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = "2d39ca6d-d88a-4278-b829-979c71e361d1"
  instance_initiated_shutdown_behavior = null
  instance_market_options              = []
  instance_type                        = null
  ipv6_address_count                   = null
  ipv6_addresses                       = null
  key_name                             = null
  launch_template                      = []
  maintenance_options                  = []
  metadata_options                     = []
  monitoring                           = true
  network_interface                    = []
  placement_group                      = null
  placement_partition_number           = null
  private_dns_name_options             = []
  private_ip                           = null
  root_block_device                    = []
  secondary_private_ips                = null
  security_groups                      = null
  source_dest_check                    = true
  subnet_id                            = module.stackgen_827520c9-7a62-4cae-972b-38b52e2aedd8.id
  tags = {
    Name = "AppStack-Instance-1"
  }
  tenancy                     = null
  timeouts                    = null
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = false
  volume_tags                 = null
  vpc_security_group_ids      = ["${module.stackgen_1c9f9326-82eb-4ac0-badd-5b07386c736d.id}"]
}

