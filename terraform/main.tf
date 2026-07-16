module "ecs_service" {
  source = "github.com/cailleach-devops/terraform-aws-ecs-service"

  naming = module.naming
  
  profile = "node.js"
  
  health_path = "/"
  
  providers = {
    aws = aws
	  aws.admin = aws.admin
  }
}
