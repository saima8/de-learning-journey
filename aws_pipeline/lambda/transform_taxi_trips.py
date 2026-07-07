import boto3
import csv
import io
import urllib.parse

s3 = boto3.client('s3')

PROCESSED_BUCKET = 'nyc-taxi-processed-saima'

def lambda_handler(event, context):
    raw_bucket = event['Records'][0]['s3']['bucket']['name']
    raw_key = urllib.parse.unquote_plus(
        event['Records'][0]['s3']['object']['key']
    )
    
    print(f"Triggered by: s3://{raw_bucket}/{raw_key}")
    
    response = s3.get_object(Bucket=raw_bucket, Key=raw_key)
    raw_content = response['Body'].read().decode('utf-8')
    
    reader = csv.DictReader(io.StringIO(raw_content))
    clean_rows = [
        row for row in reader
        if float(row.get('fare_amount', 0)) > 0
    ]
    
    print(f"Raw rows: {raw_content.count(chr(10))} | Clean rows: {len(clean_rows)}")
    
    filename = raw_key.split('/')[-1]
    output_key = f"processed/clean_{filename}"
    
    if clean_rows:
        output = io.StringIO()
        writer = csv.DictWriter(output, fieldnames=clean_rows[0].keys())
        writer.writeheader()
        writer.writerows(clean_rows)
        
        s3.put_object(
            Bucket=PROCESSED_BUCKET,
            Key=output_key,
            Body=output.getvalue().encode('utf-8'),
            ContentType='text/csv'
        )
        print(f"Written to s3://{PROCESSED_BUCKET}/{output_key}")
    
    return {
        'statusCode': 200,
        'body': f"Done. {len(clean_rows)} clean rows written to {output_key}"
    }
