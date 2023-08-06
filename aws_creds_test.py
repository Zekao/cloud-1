import boto3
import os

os.environ['AWS_PROFILE'] = "default"
os.environ['AWS_DEFAULT_REGION'] = "eu-west-2"

s3 = boto3.client('s3', region_name='eu-west-2')
print("[INFO:] Connecting to cloud")

# Retrieves all regions/endpoints that work with S3

response = s3.list_buckets()
print('Regions:', response)