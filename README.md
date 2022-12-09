# Project Description 

![Generic finance image](http://pipelinefinancialservices.com/wp-content/uploads/2012/05/Factoring-Benefits.jpg)    

This project involves a data pipeline that ingests log data from a web server that generates data for forex exchange rates, stock prices, and a stock news feed. The pipeline will process the data and store it in an S3 bucket for analysis. The pipeline will use Kinesis for data ingestion, SQS for data processing, S3 for data storage, SNS for notifications, and Lambda functions to implement the various processing steps.  


## TABLE OF CONTENTS 

- [High-Level Steps](#high-level-steps)
- [Pipeline](#pipeline)
- [Acceptance Criteria](#acceptance-criteria)
- [Deliverables](#deliverables)
- [Architectural Components](#architectural-components)
- [Web Server Design Plan](#web-server-design-plan)
- [Infrastructure](#infrastructure)
  - [data_pipeline.tf](#data_pipelinetf)
  - [data_pipeline.yml](#data_pipelineyml)
- [Resiliency and Redundancy](#resiliency-and-redundancy)
- [Infrastructure](#Infrastructure)
    -[terraform code](#data_pipeline.tf)
    -[Cloudformation code](#data_pipeline.yml)

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


# WEBSERVER DESIGN PLAN

# Deliverable: Web Server for Generating Log Data  

The web server will be responsible for generating log data for forex exchange rates, stock prices, and a stock news feed. The log data will be sent to the Kinesis stream for ingestion into the pipeline.

## Features Required:  

- The web server must be able to generate log data for forex exchange rates, stock prices, and a stock news feed.
- The log data must be in a format that can be ingested by the Kinesis stream.
- The web server must be able to send the log data to the Kinesis stream in real-time.
- The web server must be scalable and able to handle a high volume of log data.
  

## Possible Solutions: 

- Use a managed web server solution such as Amazon EC2 or Google Compute Engine to host the web server.
- Use a web framework such as Flask or Express.js to implement the web server and generate the log data.
- Use a database solution such as Amazon RDS or Google Cloud SQL to store the log data and retrieve it for generating the logs.
- Use the AWS Kinesis Client Library or the Google Cloud Client Library to send the log data to the Kinesis stream or Google Pub/Sub.  

## Timeline:   

- Week 1: Research and select a managed web server solution and web framework.
- Week 2: Implement the web server and generate log data for forex exchange rates and stock prices.
- Week 3: Implement the log data storage and retrieval system using a database solution.
- Week 4: Integrate the web server with the Kinesis stream or Google Pub/Sub to send log data in real-time.
- Week 5: Test and optimize the web server for scalability and performance.
- Week 6: Finalize the web server and prepare for delivery.  


## Automating the Log Generation 
  
One way to generate the log data every minute is to use a background task or worker that runs the generate_logs function on a regular schedule. There are several ways you could implement this, depending on the specific requirements and constraints of your application.
  
One approach is to use a cron job or a similar scheduling mechanism to run the generate_logs function every minute. This would involve setting up a cron job that runs the generate_logs function on a schedule, such as every minute, using a command like curl to make a request to the /logs endpoint of the Flask app. This approach would require setting up the cron job on the server where the Flask app is running, and it may not be the most efficient way to run the task on a regular schedule.
  
Another approach is to use a task queue or a message queue to manage the background tasks that generate the log data. This would involve adding the generate_logs function to a task queue, and setting up a worker process or service that monitors the queue and executes the tasks on a regular schedule. This approach would allow you to run the generate_logs function asynchronously and on a regular schedule, without having to manage the scheduling and execution of the tasks manually. Some popular task queue libraries that you could use with Flask include Celery, RQ, and Huey.
  
Regardless of the approach you choose, it is important to ensure that the generate_logs function is designed to be efficient and to handle failures gracefully. This may involve implementing retry logic, error handling, and other techniques to ensure that the function can run reliably and without impacting the performance of the application.

# WEB SERVER CONSIDERATIONS 

- Performance: The web server should be able to handle a high volume of requests and deliver the data quickly and efficiently. This may require optimizing the implementation of the server, using caching or other techniques to reduce the amount of time required to generate and serve the data.
- Reliability: The web server should be able to withstand failures and continue serving data even in the face of unexpected errors or downtime. This may require implementing - - - - - redundancy and backup mechanisms, such as load balancing or backup servers, to ensure that the server remains available even if individual components fail.
- Security: The web server should be secure, protecting the data it serves and preventing unauthorized access or modifications. This may require implementing authentication and - authorization mechanisms, as well as encryption and other security measures to protect the data from being accessed or tampered with.
- Scalability: The web server should be able to scale up or down as needed to accommodate changes in the volume or type of requests it receives. This may require implementing mechanisms to automatically adjust the number of servers or other resources used by the server, or to add or remove servers as needed to ensure that the server can continue serving data effectively.
  
By taking these factors into account and implementing the web server in a way that addresses these concerns, you can ensure that the server is able to deliver the data efficiently, reliably, and securely.




## SAMPLE CODE

```python
# Import the necessary libraries
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import boto3

# Set up the Flask app
app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "RDS_URI"

# Set up the SQLAlchemy database
db = SQLAlchemy(app)

# Set up the Kinesis client
kinesis_client = boto3.client("kinesis")

# Define the Forex Exchange Rates model
class ForexExchangeRates(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    currency_pair = db.Column(db.String(255))
    rate = db.Column(db.Float)

# Define the Stock Prices model
class StockPrices(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    stock_symbol = db.Column(db.String(255))
    price = db.Column(db.Float)

# Define the Stock News Feed model
class StockNewsFeed(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    stock_symbol = db.Column(db.String(255))
    news_item = db.Column(db.Text)

# Define the route for generating the log data
@app.route("/logs")
def generate_logs():
    # Retrieve the forex exchange rates from the database
    forex_exchange_rates = ForexExchangeRates.query.all()
    forex_logs = []
    for rate in forex_exchange_rates:
        forex_logs.append({"currency_pair": rate.currency_pair, "rate": rate.rate})

    # Retrieve the stock prices from the database
    stock_prices = StockPrices.query.all()
    stock_price_logs = []
    for price in stock_prices:
        stock_price_logs.append({"stock_symbol": price.stock_symbol, "price": price.price})

    # Retrieve the stock news feed items from the database
    stock_news_feed = StockNewsFeed.query.all()
    stock_news_feed_logs = []
    for news_item in stock_news_feed:
        stock_news_feed_logs.append({"stock_symbol": news_item.stock_symbol, "news_item": news_item.news_item})

    # Generate the log data as a JSON object
    logs = {
        "forex_exchange_rates": forex_logs,
        "stock_prices": stock_price_logs,
        "stock_news_feed": stock_news_feed_logs
    }

    # Send the log data to the Kinesis stream
    kinesis_client.put_record(
        StreamName="kinesis_stream_name",
        Data=json.dumps(logs),
        PartitionKey="log_data_partition_key"
    )

```


# RESILIENCY AND REDUNDANCY

Updating the original plan to include writing webserver log data to an RDS instance is a good idea, as it will provide a persistent and structured store for the log data. This can be useful for a variety of purposes, such as analyzing the data to understand usage patterns or trends, or for auditing or compliance purposes.

To implement this change, you could modify the web server to write the log data to an RDS instance whenever a request is received. The log data could include a timestamp for each request, along with any other relevant information, such as the client IP address, the URL of the request, and the response status code.

To monitor the health of the server and ensure that it does not fall over, you could use Amazon CloudWatch. CloudWatch is a monitoring service that allows you to track a variety of metrics and logs for your AWS resources, including EC2 instances and RDS databases. You can use CloudWatch to monitor the performance and availability of the web server and RDS instance, and to set alarms that will notify you if any problems are detected.

For example, you could use CloudWatch to monitor the CPU and memory usage of the web server, and to set an alarm that will trigger if the server becomes overloaded or unresponsive. You could also use CloudWatch to monitor the availability of the RDS instance, and to set an alarm that will trigger if the instance becomes unavailable or encounters any other problems.

Overall, by writing the webserver log data to an RDS instance and using CloudWatch to monitor the health of the server, you can ensure that the server is able to deliver data reliably and efficiently, and that you are alerted if any problems are detected.  



# Infrastructure

## data_pipeline.tf

This code sets up the necessary infrastructure to implement the data pipeline, including an S3 bucket for storing the processed log data, a Kinesis stream for ingesting the log data, an SQS queue for triggering the Lambda function that processes the log data, and an SNS topic for sending notifications. The Lambda function is also configured to be triggered by the SQS queue when new data is available.

To test the pipeline, you can use the aws_kinesis_put_record Terraform resource to send sample log data to the Kinesis stream, and verify that the data is processed and stored in the S3 bucket. You can also use the aws_sns_topic_subscription resource to subscribe to the SNS notifications and verify that you receive notifications when new data is processed and stored in the S3 bucket.  


## data_pipeline.yml


This CloudFormation template defines all the necessary resources to implement the data pipeline, including the S3 bucket, Kinesis stream, SQS queue, Lambda function, and SNS topic. It also configures the Lambda function to be triggered by the SQS queue and subscribed to the SNS topic.

To test the pipeline using this CloudFormation template, you can use the aws_cloudformation_stack Terraform resource to create the stack and deploy the resources, and then use the aws_kinesis_put_record resource to send sample log data to the Kinesis stream. You can also use the aws_sns_topic_subscription resource to subscribe to the SNS notifications and verify that you receive notifications when new data is processed and stored in the S3 bucket.