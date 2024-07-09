{
  "version": 4,
  "terraform_version": "1.9.1",
  "serial": 10,
  "lineage": "4fc3fa86-0a5c-5c11-1adf-7cf3ce8cc4c1",
  "outputs": {
    "glue_role_arn": {
      "value": "arn:aws:iam::975050191059:role/AWSGlueServiceRole",
      "type": "string"
    },
    "s3_buckets": {
      "value": [
        "my-company-data-raw-transactions",
        "my-company-data-raw-customers",
        "my-company-data-raw-logs",
        "my-company-data-athena-results"
      ],
      "type": [
        "tuple",
        [
          "string",
          "string",
          "string",
          "string"
        ]
      ]
    }
  },
  "resources": [
    {
      "mode": "managed",
      "type": "aws_glue_crawler",
      "name": "transactions_crawler",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:glue:us-east-1:975050191059:crawler/transactions-crawler",
            "catalog_target": [],
            "classifiers": [],
            "configuration": "",
            "database_name": "customer_data",
            "delta_target": [],
            "description": "",
            "dynamodb_target": [],
            "hudi_target": [],
            "iceberg_target": [],
            "id": "transactions-crawler",
            "jdbc_target": [],
            "lake_formation_configuration": [
              {
                "account_id": "",
                "use_lake_formation_credentials": false
              }
            ],
            "lineage_configuration": [
              {
                "crawler_lineage_settings": "DISABLE"
              }
            ],
            "mongodb_target": [],
            "name": "transactions-crawler",
            "recrawl_policy": [
              {
                "recrawl_behavior": "CRAWL_EVERYTHING"
              }
            ],
            "role": "AWSGlueServiceRole",
            "s3_target": [
              {
                "connection_name": "",
                "dlq_event_queue_arn": "",
                "event_queue_arn": "",
                "exclusions": null,
                "path": "s3://mybucket3s2/dados/originais/dados_empresas.csv",
                "sample_size": 0
              }
            ],
            "schedule": "cron(0 12 * * ? *)",
            "schema_change_policy": [
              {
                "delete_behavior": "LOG",
                "update_behavior": "UPDATE_IN_DATABASE"
              }
            ],
            "security_configuration": "",
            "table_prefix": "",
            "tags": null,
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_role.glue_role"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_policy",
      "name": "glue_policy",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::975050191059:policy/AWSGlueServicePolicy",
            "attachment_count": 1,
            "description": "Policy for Glue Service Role",
            "id": "arn:aws:iam::975050191059:policy/AWSGlueServicePolicy",
            "name": "AWSGlueServicePolicy",
            "name_prefix": "",
            "path": "/",
            "policy": "{\"Statement\":[{\"Action\":[\"s3:GetObject\",\"s3:ListBucket\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::my-company-data-raw-transactions\",\"arn:aws:s3:::my-company-data-raw-transactions/*\",\"arn:aws:s3:::my-company-data-raw-customers\",\"arn:aws:s3:::my-company-data-raw-customers/*\",\"arn:aws:s3:::my-company-data-raw-logs\",\"arn:aws:s3:::my-company-data-raw-logs/*\",\"arn:aws:s3:::my-company-data-athena-results\",\"arn:aws:s3:::my-company-data-athena-results/*\"]},{\"Action\":[\"glue:*\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}",
            "policy_id": "ANPA6GBMFGDJ4C47QT33W",
            "tags": {},
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_role",
      "name": "glue_role",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::975050191059:role/AWSGlueServiceRole",
            "assume_role_policy": "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"glue.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}",
            "create_date": "2024-07-06T13:20:39Z",
            "description": "",
            "force_detach_policies": false,
            "id": "AWSGlueServiceRole",
            "inline_policy": [],
            "managed_policy_arns": [
              "arn:aws:iam::975050191059:policy/AWSGlueServicePolicy"
            ],
            "max_session_duration": 3600,
            "name": "AWSGlueServiceRole",
            "name_prefix": "",
            "path": "/",
            "permissions_boundary": "",
            "tags": {},
            "tags_all": {},
            "unique_id": "AROA6GBMFGDJ57MA2PBEQ"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_role_policy_attachment",
      "name": "glue_role_attachment",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "AWSGlueServiceRole-20240706132036961800000001",
            "policy_arn": "arn:aws:iam::975050191059:policy/AWSGlueServicePolicy",
            "role": "AWSGlueServiceRole"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_policy.glue_policy",
            "aws_iam_role.glue_role"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "athena_results",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": "private",
            "arn": "arn:aws:s3:::my-company-data-athena-results",
            "bucket": "my-company-data-athena-results",
            "bucket_domain_name": "my-company-data-athena-results.s3.amazonaws.com",
            "bucket_prefix": "",
            "bucket_regional_domain_name": "my-company-data-athena-results.s3.us-east-1.amazonaws.com",
            "cors_rule": [],
            "force_destroy": false,
            "grant": [
              {
                "id": "f29cd317b5699f1e37da86e0e8b558b032ed5990b5825357b8b5983a83767fe3",
                "permissions": [
                  "FULL_CONTROL"
                ],
                "type": "CanonicalUser",
                "uri": ""
              }
            ],
            "hosted_zone_id": "Z3AQBSTGFYJSTF",
            "id": "my-company-data-athena-results",
            "lifecycle_rule": [],
            "logging": [],
            "object_lock_configuration": [],
            "object_lock_enabled": false,
            "policy": "",
            "region": "us-east-1",
            "replication_configuration": [],
            "request_payer": "BucketOwner",
            "server_side_encryption_configuration": [
              {
                "rule": [
                  {
                    "apply_server_side_encryption_by_default": [
                      {
                        "kms_master_key_id": "",
                        "sse_algorithm": "AES256"
                      }
                    ],
                    "bucket_key_enabled": false
                  }
                ]
              }
            ],
            "tags": {},
            "tags_all": {},
            "timeouts": null,
            "versioning": [
              {
                "enabled": false,
                "mfa_delete": false
              }
            ],
            "website": [],
            "website_domain": null,
            "website_endpoint": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjM2MDAwMDAwMDAwMDAsInJlYWQiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19"
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "customers",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": "private",
            "arn": "arn:aws:s3:::my-company-data-raw-customers",
            "bucket": "my-company-data-raw-customers",
            "bucket_domain_name": "my-company-data-raw-customers.s3.amazonaws.com",
            "bucket_prefix": "",
            "bucket_regional_domain_name": "my-company-data-raw-customers.s3.us-east-1.amazonaws.com",
            "cors_rule": [],
            "force_destroy": false,
            "grant": [
              {
                "id": "f29cd317b5699f1e37da86e0e8b558b032ed5990b5825357b8b5983a83767fe3",
                "permissions": [
                  "FULL_CONTROL"
                ],
                "type": "CanonicalUser",
                "uri": ""
              }
            ],
            "hosted_zone_id": "Z3AQBSTGFYJSTF",
            "id": "my-company-data-raw-customers",
            "lifecycle_rule": [],
            "logging": [],
            "object_lock_configuration": [],
            "object_lock_enabled": false,
            "policy": "",
            "region": "us-east-1",
            "replication_configuration": [],
            "request_payer": "BucketOwner",
            "server_side_encryption_configuration": [
              {
                "rule": [
                  {
                    "apply_server_side_encryption_by_default": [
                      {
                        "kms_master_key_id": "",
                        "sse_algorithm": "AES256"
                      }
                    ],
                    "bucket_key_enabled": false
                  }
                ]
              }
            ],
            "tags": {},
            "tags_all": {},
            "timeouts": null,
            "versioning": [
              {
                "enabled": false,
                "mfa_delete": false
              }
            ],
            "website": [],
            "website_domain": null,
            "website_endpoint": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjM2MDAwMDAwMDAwMDAsInJlYWQiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19"
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "logs",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": "private",
            "arn": "arn:aws:s3:::my-company-data-raw-logs",
            "bucket": "my-company-data-raw-logs",
            "bucket_domain_name": "my-company-data-raw-logs.s3.amazonaws.com",
            "bucket_prefix": "",
            "bucket_regional_domain_name": "my-company-data-raw-logs.s3.us-east-1.amazonaws.com",
            "cors_rule": [],
            "force_destroy": false,
            "grant": [
              {
                "id": "f29cd317b5699f1e37da86e0e8b558b032ed5990b5825357b8b5983a83767fe3",
                "permissions": [
                  "FULL_CONTROL"
                ],
                "type": "CanonicalUser",
                "uri": ""
              }
            ],
            "hosted_zone_id": "Z3AQBSTGFYJSTF",
            "id": "my-company-data-raw-logs",
            "lifecycle_rule": [],
            "logging": [],
            "object_lock_configuration": [],
            "object_lock_enabled": false,
            "policy": "",
            "region": "us-east-1",
            "replication_configuration": [],
            "request_payer": "BucketOwner",
            "server_side_encryption_configuration": [
              {
                "rule": [
                  {
                    "apply_server_side_encryption_by_default": [
                      {
                        "kms_master_key_id": "",
                        "sse_algorithm": "AES256"
                      }
                    ],
                    "bucket_key_enabled": false
                  }
                ]
              }
            ],
            "tags": {},
            "tags_all": {},
            "timeouts": null,
            "versioning": [
              {
                "enabled": false,
                "mfa_delete": false
              }
            ],
            "website": [],
            "website_domain": null,
            "website_endpoint": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjM2MDAwMDAwMDAwMDAsInJlYWQiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19"
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "transactions",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": "private",
            "arn": "arn:aws:s3:::my-company-data-raw-transactions",
            "bucket": "my-company-data-raw-transactions",
            "bucket_domain_name": "my-company-data-raw-transactions.s3.amazonaws.com",
            "bucket_prefix": "",
            "bucket_regional_domain_name": "my-company-data-raw-transactions.s3.us-east-1.amazonaws.com",
            "cors_rule": [],
            "force_destroy": false,
            "grant": [
              {
                "id": "f29cd317b5699f1e37da86e0e8b558b032ed5990b5825357b8b5983a83767fe3",
                "permissions": [
                  "FULL_CONTROL"
                ],
                "type": "CanonicalUser",
                "uri": ""
              }
            ],
            "hosted_zone_id": "Z3AQBSTGFYJSTF",
            "id": "my-company-data-raw-transactions",
            "lifecycle_rule": [],
            "logging": [],
            "object_lock_configuration": [],
            "object_lock_enabled": false,
            "policy": "",
            "region": "us-east-1",
            "replication_configuration": [],
            "request_payer": "BucketOwner",
            "server_side_encryption_configuration": [
              {
                "rule": [
                  {
                    "apply_server_side_encryption_by_default": [
                      {
                        "kms_master_key_id": "",
                        "sse_algorithm": "AES256"
                      }
                    ],
                    "bucket_key_enabled": false
                  }
                ]
              }
            ],
            "tags": {},
            "tags_all": {},
            "timeouts": null,
            "versioning": [
              {
                "enabled": false,
                "mfa_delete": false
              }
            ],
            "website": [],
            "website_domain": null,
            "website_endpoint": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjM2MDAwMDAwMDAwMDAsInJlYWQiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19"
        }
      ]
    }
  ],
  "check_results": null
}
