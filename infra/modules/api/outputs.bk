output "api_gateway_id" {
  description = "The ID of the API Gateway."
  value       = aws_apigatewayv2_api.lambda.id
}

output "api_gateway_url" {
  description = "The URL of the deployed API Gateway."
  value       = aws_apigatewayv2_api.lambda.api_endpoint
}

output "stage_name" {
  description = "The name of the API Gateway stage."
  value       = aws_apigatewayv2_stage.lambda.name
}

output "log_group_arn" {
  description = "The ARN of the CloudWatch Log Group."
  value       = aws_cloudwatch_log_group.api_gw.arn
}

output "lambda_permission_id" {
  description = "The ID of the Lambda Permission allowing API Gateway to invoke the Lambda function."
  value       = aws_lambda_permission.api_gw.id
}
