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