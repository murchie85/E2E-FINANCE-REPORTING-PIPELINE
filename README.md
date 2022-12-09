# Project Description 

![Generic finance image](http://pipelinefinancialservices.com/wp-content/uploads/2012/05/Factoring-Benefits.jpg)    

This project involves a data pipeline that ingests log data from a web server that generates data for forex exchange rates, stock prices, and a stock news feed. The pipeline will process the data and store it in an S3 bucket for analysis. The pipeline will use Kinesis for data ingestion, SQS for data processing, S3 for data storage, SNS for notifications, and Lambda functions to implement the various processing steps.  

1. [Webserver Delivery Plan](WEBSERVER_DELIVERYPLAN.md)



## High-Level Steps  

1. Set up a web server to generate log data for forex exchange rates, stock prices, and a stock news feed.
2. Set up an S3 bucket to store the processed log data.
3. Create a Kinesis stream to ingest log data from the web server.
4. Set up an SQS queue to receive data from the Kinesis stream and trigger the processing Lambda functions.
5. Create a Lambda function to process the log data and store it in the S3 bucket.
6. Set up SNS to send notifications when new data is processed and stored in the S3 bucket.
7. Test the pipeline by sending sample log data to the Kinesis stream and verifying that it is processed and stored in the S3 bucket.  

## Acceptance Criteria:  

- The pipeline is able to ingest log data from the web server and store it in the S3 bucket.
- The Lambda function processes the log data and stores it in the correct format in the S3 bucket.
- SNS notifications are sent when new data is processed and stored in the S3 bucket.
  
## Deliverables:  

- Web server for generating log data for forex exchange rates, stock prices, and a stock news feed
- S3 bucket for storing processed log data
- Kinesis stream for ingesting log data
- SQS queue for triggering the processing Lambda function
- Lambda function for processing log data
- SNS notifications for data processing and storage events
- Documentation and instructions for using and testing the pipeline.