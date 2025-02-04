output "api_gateway_url" {
  description = "The URL of the deployed API Gateway."
  value       = aws_apigatewayv2_api.lambda.api_endpoint
}
