resource "aws_apigatewayv2_api" "lambda" {
  name          = var.api_name
  protocol_type = "HTTP"
}

# API Gateway Stage with CloudWatch logging configuration
resource "aws_apigatewayv2_stage" "lambda" {
  api_id     = aws_apigatewayv2_api.lambda.id
  name       = var.stage_name
  auto_deploy = true

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_gw.arn

    format = jsonencode({
      requestId               = "$context.requestId"
      sourceIp                = "$context.identity.sourceIp"
      requestTime             = "$context.requestTime"
      protocol                = "$context.protocol"
      httpMethod              = "$context.httpMethod"
      resourcePath            = "$context.resourcePath"
      routeKey                = "$context.routeKey"
      status                  = "$context.status"
      responseLength          = "$context.responseLength"
      integrationErrorMessage = "$context.integrationErrorMessage"
    })
  }
}

# Integration of Lambda function with API Gateway
resource "aws_apigatewayv2_integration" "hello_world" {
  api_id             = aws_apigatewayv2_api.lambda.id
  integration_uri    = var.lambda_invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

# Route to trigger Lambda
resource "aws_apigatewayv2_route" "hello_world" {
  api_id   = aws_apigatewayv2_api.lambda.id
  route_key = var.route_key
  target   = "integrations/${aws_apigatewayv2_integration.hello_world.id}"
}

# CloudWatch Log Group for API Gateway
resource "aws_cloudwatch_log_group" "api_gw" {
  name              = var.log_group_name
  retention_in_days = var.retention_days
}

# Lambda permission to allow API Gateway to invoke Lambda
resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.lambda.execution_arn}/*/*"
}

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
