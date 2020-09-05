## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | The AMI to use for the instance. | `string` | `""` | no |
| cloudwatch\_encryption\_enabled | Specify true to indicate that encryption for CloudWatch Logs enabled. | `bool` | `true` | no |
| cloudwatch\_log\_group\_name | The name of the log group. | `string` | `""` | no |
| description | The description of the all resources. | `string` | `"Managed by Terraform"` | no |
| iam\_path | Path in which to create the IAM Role and the IAM Policy. | `string` | `"/"` | no |
| iam\_policy | The policy document. This is a JSON formatted string. | `string` | `""` | no |
| name | The name of the Session Manager. | `string` | `"thinkstack"` | no |
| s3\_bucket\_name | The name of the bucket. | `string` | `""` | no |
| s3\_encryption\_enabled | Specify true to indicate that encryption for S3 Bucket enabled. | `bool` | `true` | no |
| s3\_key\_prefix | The prefix for the specified S3 bucket. | `string` | `""` | no |
| ssm\_document\_name | The name of the document. | `string` | `"SSM-SessionManagerRunShell"` | no |
| tags | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |
| user\_data | The user data to provide when launching the instance. | `string` | `""` | no |
| vpc\_security\_group\_ids | A list of security group IDs to associate with. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| iam\_instance\_profile\_arn | The ARN assigned by AWS to the instance profile. |
| iam\_instance\_profile\_create\_date | The creation timestamp of the instance profile. |
| iam\_instance\_profile\_id | The instance profile's ID. |
| iam\_instance\_profile\_name | The instance profile's name. |
| iam\_instance\_profile\_path | The path of the instance profile in IAM. |
| iam\_instance\_profile\_role | The role assigned to the instance profile. |
| iam\_instance\_profile\_unique\_id | The unique ID assigned by AWS. |
| iam\_policy\_arn | The ARN assigned by AWS to this IAM Policy. |
| iam\_policy\_description | The description of the IAM Policy. |
| iam\_policy\_document | The policy document of the IAM Policy. |
| iam\_policy\_id | The IAM Policy's ID. |
| iam\_policy\_name | The name of the IAM Policy. |
| iam\_policy\_path | The path of the IAM Policy. |
| iam\_role\_arn | The Amazon Resource Name (ARN) specifying the IAM Role. |
| iam\_role\_create\_date | The creation date of the IAM Role. |
| iam\_role\_description | The description of the IAM Role. |
| iam\_role\_name | The name of the IAM Role. |
| iam\_role\_unique\_id | The stable and unique string identifying the IAM Role. |
| ssm\_document\_default\_version | The default version of the document. |
| ssm\_document\_description | The description of the document. |
| ssm\_document\_hash | The sha1 or sha256 of the document content. |
| ssm\_document\_hash\_type | The hashing algorithm used when hashing the content. |
| ssm\_document\_latest\_version | The latest version of the document. |
| ssm\_document\_owner | The AWS user account of the person who created the document. |
| ssm\_document\_parameter | The parameters that are available to this document. |
| ssm\_document\_platform\_types | A list of OS platforms compatible with this SSM document. |
| ssm\_document\_schema\_version | The schema version of the document. |
| ssm\_document\_status | The current status of the document. |
