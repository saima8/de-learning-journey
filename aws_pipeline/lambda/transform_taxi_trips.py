import boto3
import csv
import io

s3 = boto3.client('s3')

RAW_BUCKET = 'nyc-taxi-raw-saima'
PROCESSED_BUCKET = 'nyc-taxi-processed-saima'
INPUT_KEY = 'landing/sample_trips.csv'
OUTPUT_KEY = 'processed/clean_trips.csv'

def lambda_handler(event, context):
    print(f"Reading from s3://{RAW_BUCKET}/{INPUT_KEY}")
    
    response = s3.get_object(Bucket=RAW_BUCKET, Key=INPUT_KEY)
    raw_content = response['Body'].read().decode('utf-8')
    
    reader = csv.DictReader(io.StringIO(raw_content))
    clean_rows = [
        row for row in reader
        if float(row.get('fare_amount', 0)) > 0
    ]
    
    print(f"Raw rows: {raw_content.count(chr(10))} | Clean rows: {len(clean_rows)}")
    
    if clean_rows:
        output = io.StringIO()
        writer = csv.DictWriter(output, fieldnames=clean_rows[0].keys())
        writer.writeheader()
        writer.writerows(clean_rows)
        
        s3.put_object(
            Bucket=PROCESSED_BUCKET,
            Key=OUTPUT_KEY,
            Body=output.getvalue().encode('utf-8'),
            ContentType='text/csv'
        )
        print(f"Written to s3://{PROCESSED_BUCKET}/{OUTPUT_KEY}")
    
    return {
        'statusCode': 200,
        'body': f"Done. {len(clean_rows)} clean rows written."
    }
