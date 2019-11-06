# Simple Example

This example illustrates how to use the `utils` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | A list of GCP region codes for each of the given regions. i.e. "us-central1"="usc1" | string | `"null"` | no |
| regions | A list of GCP region codes for each of the given regions. i.e. ["us-central1"] => {"us-central1"="usc1"} | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| region\_short\_name | The 4 or 5 character shortname of a given region. |
| region\_short\_name\_map | The 4 or 5 character shortname of any given region. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
