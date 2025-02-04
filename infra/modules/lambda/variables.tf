variable "lambda_function_name" {
  description = "The name of the Lambda function."
  type        = string
  default     = "hello-world2"
}

variable "lambda_image_uri" {
  description = "The URI of the Lambda function's image stored in Amazon ECR."
  type        = string
  default     = "677276078111.dkr.ecr.us-east-1.amazonaws.com/app-pat-repo:latest"
}

variable "log_group_retention_days" {
  description = "Retention period (in days) for the CloudWatch Log Group."
  type        = number
  default     = 30
}

variable "lambda_role_arn" {
  description = "The ARN of the IAM role for Lambda execution."
  type        = string
}
