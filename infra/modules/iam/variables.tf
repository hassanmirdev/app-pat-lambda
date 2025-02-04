variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda execution."
  type        = string
  default     = "serverless_lambda"
}

variable "lambda_policy_arn" {
  description = "The ARN of the IAM policy to attach to the Lambda execution role."
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
