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

## Pipeline 

- The web server generates log data for forex exchange rates, stock prices, and a stock news feed. This data is typically generated in real-time, as the web server receives requests from users and generates the appropriate log data in response.
- The web server puts the log data into a Kinesis stream. This allows the data to be ingested into the pipeline for processing.
- The SQS queue polls for new data from the Kinesis stream. This is done by periodically sending a request to the Kinesis stream to check for new data, and retrieving any data that is found.
- When new data is found in the Kinesis stream, the SQS queue triggers a processing Lambda function. This function is responsible for processing the log data, which typically involves parsing the data and transforming it into a format that is suitable for storage in the S3 bucket.
- After the Lambda function has processed the log data, it is stored in the S3 bucket. This allows the data to be accessed and analyzed by other parts of the pipeline, or by external applications.
- SNS sends notifications when new data is processed and stored in the S3 bucket. This allows other parts of the pipeline, or external applications, to be notified whenever new data is available for analysis.
   
This sequence of events describes how the pipeline ingests log data from the web server, processes it using the Lambda function, and stores it in the S3 bucket. The SQS queue and SNS play important roles in coordinating the flow of data and triggering the necessary processing steps.


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

# Architectual Components 

S3: This is the object storage service that would be used to store the processed log data.
Kinesis: This is the real-time data streaming service that would be used to ingest log data from the web server.
SQS: This is the managed message queue service that would be used to receive data from the Kinesis stream and trigger the processing Lambda functions.
Lambda: This is the serverless computing service that would be used to implement the various processing steps for the log data.
SNS: This is the managed publish/subscribe messaging service that would be used to send notifications when new data is processed and stored in the S3 bucket.