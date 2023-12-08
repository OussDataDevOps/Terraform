import json

def lambda_handler(event, context):
    print('Hello! This function is triggered by SQS and pulls the code from S3!')
    return{
        'statusCode':200,
        'body':json.dumps('Hello from Lambda!')
    }