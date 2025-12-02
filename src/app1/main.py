import json, os, string, random
import boto3

def generate_shortcode(length=8):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def lambda_handler(event, context):
    dynamodb = boto3.client("dynamodb")
    api_endpoint = os.getenv("API_ENDPOINT")
    table_name = os.getenv("TABLE_NAME")

    body = json.loads(event.get("body", "{}"))
    long_url = body.get("url")

    if not long_url:
        return { "statusCode": 400, "body": json.dumps({"error": "URL required"}) }

    shortcode = generate_shortcode()
    dynamodb.put_item(
        TableName=table_name,
        Item={
            "shortcode": {"S": shortcode},
            "long_url": {"S": long_url}
        }
    )

    return {
        "statusCode": 200,
        "body": json.dumps({
            "short_url": f"{api_endpoint}/{shortcode}"
        })
    }
