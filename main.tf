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


locals {
  regions = [
    "asia-east1",
    "asia-east2",
    "asia-northeast1",
    "asia-northeast2",
    "asia-northeast3",
    "asia-south1",
    "asia-southeast1",
    "asia-southeast2",
    "australia-southeast1",
    "europe-north1",
    "europe-west1",
    "europe-west2",
    "europe-west3",
    "europe-west4",
    "europe-west6",
    "northamerica-northeast1",
    "northamerica-northeast2",
    "southamerica-east1",
    "us-central1",
    "us-east1",
    "us-east4",
    "us-west1",
    "us-west2",
    "us-west3",
    "us-west4",
  ]
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
  region_short_name_map = { for full_region in local.regions : full_region =>
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
