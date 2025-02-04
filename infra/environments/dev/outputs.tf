output "function_name" {
  description = "Name of the Lambda function."
  value       = module.lambda_function.lambda_function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function."
  value       = module.lambda_function.lambda_function_arn
}

output "lambda_function_image_uri" {
  description = "The ECR URI for the Lambda function image."
  value       = module.lambda_function.lambda_image_uri
}

output "base_url" {
  description = "Base URL for API Gateway stage."
  value       = module.api_gateway.api_gateway_url
}
# output "lambda_function_image_uri" {
 # description = "The ECR URI for the Lambda function image."
 # value       = module.lambda_function.lambda_image_uri  # This should work after the output is defined in the module
# }
