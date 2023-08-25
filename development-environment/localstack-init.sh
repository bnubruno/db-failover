#!/bin/sh
# Buckets
awslocal s3api create-bucket --bucket local.user-data --acl public-read-write

# topics
awslocal sns create-topic --name TRANSMISSION_PROCESS-ISSUE_SERVICE-INVOICE
awslocal sns create-topic --name TRANSMISSION_PROCESS-CANCEL_SERVICE-INVOICE
awslocal sns create-topic --name TRANSMISSION_ISSUE_SERVICE-INVOICE
awslocal sns create-topic --name TRANSMISSION_CANCEL_SERVICE-INVOICE
awslocal sns create-topic --name TRANSMISSION_RETURN-SUCCESS_SERVICE-INVOICE
awslocal sns create-topic --name TRANSMISSION_RETURN-ERROR_SERVICE-INVOICE
awslocal sns create-topic --name TRANSMISSION_SERVICE-INVOICE_FINISHED
awslocal sns create-topic --name TRANSMISSION_SERVICE-INVOICE_REJECTED
awslocal sns create-topic --name ENOTAS-ISSUER_INVOICE_ISSUED
awslocal sns create-topic --name ENOTAS-ISSUER_INVOICE_CANCELED
awslocal sns create-topic --name MIGRATE-ISSUER_ISSUE_TRANSMISSION
awslocal sns create-topic --name MIGRATE-ISSUER_CANCEL_TRANSMISSION
awslocal sns create-topic --name CONTAAZUL_REQUEST-ISSUE_SERVICE-INVOICE
awslocal sns create-topic --name CONTAAZUL_REQUEST-CANCEL_SERVICE-INVOICE
awslocal sns create-topic --name CONTAAZUL_SERVICE-INVOICE_RPS-PROCESSOR

# Queues
awslocal sqs create-queue --queue-name TRANSMISSION_PROCESS-ISSUE_SERVICE-INVOICE_TRANSMISSION
awslocal sqs create-queue --queue-name TRANSMISSION_PROCESS-CANCEL_SERVICE-INVOICE_TRANSMISSION
awslocal sqs create-queue --queue-name TRANSMISSION_ISSUE_SERVICE-INVOICE_TRANSMISSION
awslocal sqs create-queue --queue-name TRANSMISSION_CANCEL_SERVICE-INVOICE_TRANSMISSION
awslocal sqs create-queue --queue-name TRANSMISSION_RETURN-SUCCESS_SERVICE-INVOICE_TRANSMISSION
awslocal sqs create-queue --queue-name TRANSMISSION_RETURN-ERROR_SERVICE-INVOICE_TRANSMISSION
awslocal sqs create-queue --queue-name TRANSMISSION_SERVICE-INVOICE_FINISHED_CONTAAZUL
awslocal sqs create-queue --queue-name TRANSMISSION_SERVICE-INVOICE_REJECTED_CONTAAZUL
awslocal sqs create-queue --queue-name ENOTAS-ISSUER_EMISSION_SEND
awslocal sqs create-queue --queue-name ENOTAS-ISSUER_CANCEL_SEND
awslocal sqs create-queue --queue-name MIGRATE-ISSUER_ISSUE_TRANSMISSION_MIGRATE-ISSUER
awslocal sqs create-queue --queue-name MIGRATE-ISSUER_CANCEL_TRANSMISSION_MIGRATE-ISSUER

# subscriptions
awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:TRANSMISSION_PROCESS-ISSUE_SERVICE-INVOICE \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:TRANSMISSION_PROCESS-ISSUE_SERVICE-INVOICE_TRANSMISSION

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:TRANSMISSION_PROCESS-CANCEL_SERVICE-INVOICE \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:TRANSMISSION_PROCESS-CANCEL_SERVICE-INVOICE_TRANSMISSION

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:TRANSMISSION_ISSUE_SERVICE-INVOICE \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:TRANSMISSION_ISSUE_SERVICE-INVOICE_TRANSMISSION

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:TRANSMISSION_CANCEL_SERVICE-INVOICE \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:TRANSMISSION_CANCEL_SERVICE-INVOICE_TRANSMISSION

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:TRANSMISSION_RETURN-SUCCESS_SERVICE-INVOICE \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:TRANSMISSION_RETURN-SUCCESS_SERVICE-INVOICE_TRANSMISSION

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:TRANSMISSION_RETURN-ERROR_SERVICE-INVOICE \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:TRANSMISSION_RETURN-ERROR_SERVICE-INVOICE_TRANSMISSION

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:TRANSMISSION_SERVICE-INVOICE_FINISHED \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:TRANSMISSION_SERVICE-INVOICE_FINISHED_CONTAAZUL

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:TRANSMISSION_SERVICE-INVOICE_REJECTED \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:TRANSMISSION_SERVICE-INVOICE_REJECTED_CONTAAZUL

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:ENOTAS-ISSUER_INVOICE_ISSUED \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:ENOTAS-ISSUER_EMISSION_SEND

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:ENOTAS-ISSUER_INVOICE_CANCELED \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:ENOTAS-ISSUER_CANCEL_SEND

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:MIGRATE-ISSUER_ISSUE_TRANSMISSION \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:MIGRATE-ISSUER_ISSUE_TRANSMISSION_MIGRATE-ISSUER

awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:123456789012:MIGRATE-ISSUER_CANCEL_TRANSMISSION \
  --protocol sqs \
  --notification-endpoint arn:aws:sqs:us-east-1:queue:MIGRATE-ISSUER_CANCEL_TRANSMISSION_MIGRATE-ISSUER
