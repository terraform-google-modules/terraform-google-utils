# terraform-google-utils

This module provides a way to get the shortnames for given GCP region(s). For example, "us-central1" becomes "usc1".

This module does not communicate with GCP in any way.

## Usage

Basic usage of this module is as follows:

```hcl
module "utils" {
  source  = "terraform-google-modules/utils/google"
  version = "~> 0.1"
  regions = ["us-central1", "us-west1"]
}

output "region_shortname_map" {
  description = "Map of full to short name of all given regions"
  value       = "${module.utils.region_short_name_map}"
}

module "utils" {
  source  = "terraform-google-modules/utils/google"
  version = "~> 0.1"
  regions = "us-central1"
}

output "region_shortname" {
  description = "Short name of the given region"
  value       = "${module.utils.region_short_name}"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket\_name | The name of the bucket to create | string | n/a | yes |
| project\_id | The project ID to deploy to | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_name |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.12

### Service Account

A service account is not needed for to use this module.

### APIs

Projects/APIs are not required to use this module.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html
