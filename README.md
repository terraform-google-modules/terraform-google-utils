# terraform-google-utils

This module provides a way to get the shortnames for a given GCP region.
For example, "us-central1" becomes "usc1". This module also always outputs a map for every region, which allows you to do multiple at once.

This module does not communicate with GCP in any way.

## Usage

Basic usage of this module is as follows:

```hcl
module "utils" {
  source  = "terraform-google-modules/utils/google"
  version = "~> 0.7"
  region  = "us-central1"
}

locals {
  "us-central1" = module.utils.region_short_name
  "asia-east1"  = module.utils.region_short_name_map["asia-east1"]
}
```

The above results in locals with computed values of:

```
locals {
  "us-central1" = "usc1"
  "asia-east1"  = "aze1"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_regions | A user-supplied list of regions to extend the lookup map. | `list(string)` | `[]` | no |
| region | The GCP region to retrieve a short name for (ex. `us-central1).` | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| region\_short\_name | The 4 or 5 character shortname of the region specified in var.region. |
| region\_short\_name\_map | The 4 or 5 character shortname of any given region. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] >= v0.12, < v0.14

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
