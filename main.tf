/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

terraform {
  required_version = "~> 0.12.0"
}

locals {
  # Compute the regional shortname from component parts
  continent_short_name = {
    asia         = "az"
    australia    = "au"
    europe       = "eu"
    northamerica = "na"
    southamerica = "sa"
    us           = "us"
  }
  parts = var.region == null ? [] : split("-", var.region)
  region_short_name = var.region == null ? "" : join("", [
    local.continent_short_name[local.parts[0]],
    replace(local.parts[1], "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/", "$1$2$3$4$5")
  ])
  # Same computation but kick back a map
  region_short_name_map = var.regions == [] ? {} : { for full_region in var.regions : full_region =>
    join(
      "", [
        local.continent_short_name[split(
          "-",
          full_region
        )[0]],
        replace(
          split(
          "-", full_region)[1],
          "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/",
          "$1$2$3$4$5"
        )
      ]
    )
  }
}
