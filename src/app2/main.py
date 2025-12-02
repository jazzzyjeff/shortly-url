import os
import boto3

def lambda_handler(event, context):
    dynamodb = boto3.client('dynamodb')
    table_name = os.getenv("TABLE_NAME")

    shortcode = event["pathParameters"].get("code")

    response = dynamodb.get_item(
        TableName=table_name,
        Key={"shortcode": {"S": shortcode}}
    )

    if "Item" in response:
        return {
            "statusCode": 301,
            "headers": {
                "Location": response["Item"]["long_url"]["S"]
            }
        }
    else:
        return {
            "statusCode": 404,
            "body": "Short URL not found"
        }
