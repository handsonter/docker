import boto3
import os

# Set the AWS credentials
aws_access_key_id = os.environ['AWS_ACCESS_KEY_ID']
aws_secret_access_key = os.environ['AWS_SECRET_ACCESS_KEY']

# Create a client for the STS service
sts_client = boto3.client(
    'sts',
    aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key,
)

# Call the get_caller_identity method to get the caller's identity
identity = sts_client.get_caller_identity()

# Print the caller's identity
print(identity)

