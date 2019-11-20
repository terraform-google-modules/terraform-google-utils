# terraform-google-utils

This module provides a way to get the shortnames for given GCP region(s). For example, "us-central1" becomes "usc1".

This module does not communicate with GCP in any way.

## Usage

Basic usage of this module is as follows:

```hcl
module "utils" {
  source  = "terraform-google-modules/utils/google"
  version = "~> 0.1"
  region  = "us-central1"
}

output "region_short_name" {
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
| region | A list of GCP region codes for each of the given regions. i.e. "us-central1"="usc1" | string | `"null"` | no |

## Outputs

| Name | Description |
|------|-------------|
| region\_short\_name | The 4 or 5 character shortname of a given region. |

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
