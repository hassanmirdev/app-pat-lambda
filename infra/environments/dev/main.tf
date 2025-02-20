
# Call the IAM module for creating Lambda execution role..
module "iam_lambda" {
  source = "../../modules/iam"  # Path to the IAM module

  lambda_role_name = "serverless_lambda" 
}


# Call the Lambda module for creating a Lambda function
module "lambda_function" {
  source = "../../modules/lambda"

  lambda_function_name = "hello-world2"  
  lambda_image_uri     = "677276078111.dkr.ecr.us-east-1.amazonaws.com/my-app-repo:appointment-service-latest"  
  lambda_role_arn      = module.iam_lambda.lambda_role_arn  
}

# Call the API Gateway module for creating an API Gateway
module "api_gateway" {
  source = "../../modules/api"  # Path to the API Gateway module

  api_name        = "serverless_lambda_gw"
  route_key       = "GET /health"
  lambda_invoke_arn = module.lambda_function.lambda_function_arn
  lambda_function_name = module.lambda_function.lambda_function_name
  log_group_name  = "/aws/api_gw/hello-world2"
  retention_days  = 30
  stage_name      = "prod"
}

# Call the ECR module for creating an ECR repository, it is commited for now.
# module "ecr_repository" {
 # source = "../../modules/ecr"  # Path to the ECR module

 # ecr_repository_name = "hello-world-repo" 
#}
