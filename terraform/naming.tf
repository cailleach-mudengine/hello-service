data "aws_region" "main" {
}

data "aws_region" "admin" {
  provider = aws.admin
}

module "naming" {
  source = "github.com/cailleach-devops/terraform-aws-common.git"
  
  git_organization = var.git_organization
  initiative = var.initiative
  environment = var.environment
  main_region = data.aws_region.main.region
  admin_region = data.aws_region.admin.region
  
  service_name = var.service_name
}