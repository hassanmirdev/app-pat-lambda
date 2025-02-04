FROM public.ecr.aws/lambda/nodejs:22

# Copy the Lambda function code
COPY index.js ${LAMBDA_TASK_ROOT}

# Set the CMD to the Lambda handler function
CMD [ "index.handler" ]
