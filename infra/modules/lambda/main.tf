resource "aws_lambda_function" "hello_world2" {
  function_name = var.lambda_function_name

  package_type = "Image"
  image_uri    = var.lambda_image_uri

  role = var.lambda_role_arn
}

resource "aws_cloudwatch_log_group" "hello_world2" {
  name              = "/aws/lambda/${aws_lambda_function.hello_world2.function_name}-v2"
  retention_in_days = var.log_group_retention_days
}
