<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api_gateway"></a> [api\_gateway](#module\_api\_gateway) | ../../modules/api | n/a |
| <a name="module_iam_lambda"></a> [iam\_lambda](#module\_iam\_lambda) | ../../modules/iam | n/a |
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | ../../modules/lambda | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | Name of the Lambda function. |
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | ARN of the Lambda function. |
| <a name="output_lambda_function_image_uri"></a> [lambda\_function\_image\_uri](#output\_lambda\_function\_image\_uri) | The ECR URI for the Lambda function image. |
<!-- END_TF_DOCS -->