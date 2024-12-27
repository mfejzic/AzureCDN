# AzureCDN
Terraform Multi-Region Azure Setup with AWS Failover and Monitoring

Overview

This repository contains Terraform scripts to configure a multi-region infrastructure setup on Azure with failover mechanisms and monitoring through AWS services. The primary objective is to ensure high availability, reliability, and performance of a static website hosted on Azure, with automatic failover using AWS Route 53 in case of regional outages.

Services Used

Azure

Resource Groups

Organize and manage related Azure resources.

Storage Accounts

Two Azure Storage Accounts for hosting static websites (one in US West and one in US East).

Enabled static website hosting.

Configured storage blobs for HTML files and media assets.

CDN (Content Delivery Network)

Azure CDN Profile with two endpoints:

Primary endpoint pointing to the US West storage account.

Secondary endpoint pointing to the US East storage account.

Log Analytics Workspace

Collects metrics and diagnostic logs for storage accounts and CDN endpoints.

Monitor Diagnostic Settings

Enables monitoring of CDN and storage accounts, sending logs and metrics to the Log Analytics Workspace.

AWS

Route 53

Hosted Zone for managing the DNS records of the domain (e.g., fejzic37.com).

Failover routing policy with health checks:

Primary CNAME pointing to the Azure CDN primary endpoint.

Secondary CNAME pointing to the Azure CDN secondary endpoint.

SNS (Simple Notification Service)

SNS topic and email subscription to receive alerts when health checks fail.

CloudWatch

Metric alarm monitoring the Route 53 health check status.

Other Services

Random ID

Generates unique IDs for globally unique resource names.

How It Works

1. Multi-Region Azure Storage Accounts

Two storage accounts are created in different Azure regions (US West and US East).

Static website hosting is enabled on both accounts.

HTML files and media assets (e.g., .jpg, .gif) are uploaded as blobs.

Each storage account is monitored for metrics and logs through Azure Monitor and Log Analytics.

2. Azure CDN Integration

A single Azure CDN Profile is created.

Two endpoints are defined:

Primary Endpoint: Points to the US West storage account.

Secondary Endpoint: Points to the US East storage account.

Custom domains are configured for the CDN endpoints, enabling HTTPS access.

3. AWS Route 53 DNS Failover

Route 53 Hosted Zone is configured with failover routing policies:

Primary Record: CNAME pointing to the primary Azure CDN endpoint.

Secondary Record: CNAME pointing to the secondary Azure CDN endpoint.

Health checks monitor the availability of the CDN endpoints.

If the primary endpoint fails, traffic is automatically routed to the secondary endpoint.

4. Monitoring and Alerts

Azure Monitor: Captures metrics and logs from storage accounts and CDN endpoints.

AWS CloudWatch: Metric alarms are set up to monitor Route 53 health checks.

AWS SNS: Sends email notifications when health checks fail, alerting about potential outages.

5. Static Asset Upload

Media files (e.g., .jpg, .gif) are uploaded to the $web container in each storage account.

Content types are dynamically set based on file extensions.
