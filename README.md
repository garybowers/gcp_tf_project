# GCP Project Module

## Description

This module creates a Google Cloud Project and will enable some default services and enable a supplied list of custom API's

### Inputs

**folder_id**

Creates the project under the specified folder, use the [google_folder](https://www.terraform.io/docs/providers/google/r/google_folder.html) terraform resource or provide the organisation_id as the parent.

**name**

Provide a name for the project, the project ID will be generated based on this.

**billing_account_id**

Provide the ID of the billing account to attach the project to.

**create_network**

Defaults to fase but can be overidden, when **false** the default network is deleted, along with all the firewall rules.

**services**

Provide a list of API's to enable on the project, **compute.googleapis.com** is enabled by default and shouldn't be specified.

### Outputs

**project_id**

Provides the ID of the project for other resources to deploy to

**salt**

The random 6 integer characters to ensure the project id is unique, this can be used ffor other resources that require global uniqueness e.g. Buckets, CloudSQL instances.

### Example

    module "anthos_project" {
      source             = "../modules/gcp_tf_project"
      billing_account_id = var.billing_account_id
      name               = "anthos-test"
      folder_id          = google_folder.anthos.id

      services = [
        "container.googleapis.com",
        "servicenetworking.googleapis.com",
        "anthos.googleapis.com",
        "monitoring.googleapis.com",
        "logging.googleapis.com",
        "meshca.googleapis.com",
        "meshtelemetry.googleapis.com",
        "meshconfig.googleapis.com",
        "iamcredentials.googleapis.com",
        "gkeconnect.googleapis.com",
        "gkehub.googleapis.com",
        "cloudresourcemanager.googleapis.com",
      ]
    }



