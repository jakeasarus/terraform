## Purpose

Creates an EC2 instance using the latest ami for windows server 2019. Creates a data drive and attaches it. Then creates a cloudwatch metric alarm to monitor the cpu and alert if over 80%.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zone | Variable for AZ | `string` | `"us-east-1a"` | no |

## Outputs

No output.