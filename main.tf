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
  regions = concat(var.additional_regions, [
    "asia-east1",
    "asia-east2",
    "asia-northeast1",
    "asia-northeast2",
    "asia-northeast3",
    "asia-south1",
    "asia-south2",
    "asia-southeast1",
    "asia-southeast2",
    "australia-southeast1",
    "australia-southeast2",
    "europe-central2",
    "europe-north1",
    "europe-southwest1",
    "europe-west1",
    "europe-west2",
    "europe-west3",
    "europe-west4",
    "europe-west6",
    "europe-west8",
    "europe-west9",
    "europe-west12",
    "me-central1",
    "me-central2",
    "me-west1",
    "northamerica-northeast1",
    "northamerica-northeast2",
    "southamerica-east1",
    "southamerica-west1",
    "us-central1",
    "us-east1",
    "us-east4",
    "us-east5",
    "us-south1",
    "us-west1",
    "us-west2",
    "us-west3",
    "us-west4",
  ])


  zones = concat(var.additional_zones, [
    "asia-east1-a",
    "asia-east1-b",
    "asia-east1-c",
    "asia-east2-a",
    "asia-east2-b",
    "asia-east2-c",
    "asia-northeast1-a",
    "asia-northeast1-b",
    "asia-northeast1-c",
    "asia-northeast2-a",
    "asia-northeast2-b",
    "asia-northeast2-c",
    "asia-northeast3-a",
    "asia-northeast3-b",
    "asia-northeast3-c",
    "asia-south1-a",
    "asia-south1-b",
    "asia-south1-c",
    "asia-south2-a",
    "asia-south2-b",
    "asia-south2-c",
    "asia-southeast1-a",
    "asia-southeast1-b",
    "asia-southeast1-c",
    "asia-southeast2-a",
    "asia-southeast2-b",
    "asia-southeast2-c",
    "australia-southeast1-a",
    "australia-southeast1-b",
    "australia-southeast1-c",
    "australia-southeast2-a",
    "australia-southeast2-b",
    "australia-southeast2-c",
    "europe-central2-a",
    "europe-central2-b",
    "europe-central2-c",
    "europe-north1-a",
    "europe-north1-b",
    "europe-north1-c",
    "europe-southwest1-a",
    "europe-southwest1-b",
    "europe-southwest1-c",
    "europe-west1-b",
    "europe-west1-c",
    "europe-west1-d",
    "europe-west10-a",
    "europe-west10-b",
    "europe-west10-c",
    "europe-west12-a",
    "europe-west12-b",
    "europe-west12-c",
    "europe-west2-a",
    "europe-west2-b",
    "europe-west2-c",
    "europe-west3-a",
    "europe-west3-b",
    "europe-west3-c",
    "europe-west4-a",
    "europe-west4-b",
    "europe-west4-c",
    "europe-west6-a",
    "europe-west6-b",
    "europe-west6-c",
    "europe-west8-a",
    "europe-west8-b",
    "europe-west8-c",
    "europe-west9-a",
    "europe-west9-b",
    "europe-west9-c",
    "me-central1-a",
    "me-central1-b",
    "me-central1-c",
    "me-central2-a",
    "me-central2-b",
    "me-central2-c",
    "me-west1-a",
    "me-west1-b",
    "me-west1-c",
    "northamerica-northeast1-a",
    "northamerica-northeast1-b",
    "northamerica-northeast1-c",
    "northamerica-northeast2-a",
    "northamerica-northeast2-b",
    "northamerica-northeast2-c",
    "southamerica-east1-a",
    "southamerica-east1-b",
    "southamerica-east1-c",
    "southamerica-west1-a",
    "southamerica-west1-b",
    "southamerica-west1-c",
    "us-central1-a",
    "us-central1-b",
    "us-central1-c",
    "us-central1-f",
    "us-east1-b",
    "us-east1-c",
    "us-east1-d",
    "us-east4-a",
    "us-east4-b",
    "us-east4-c",
    "us-east5-a",
    "us-east5-b",
    "us-east5-c",
    "us-south1-a",
    "us-south1-b",
    "us-south1-c",
    "us-west1-a",
    "us-west1-b",
    "us-west1-c",
    "us-west2-a",
    "us-west2-b",
    "us-west2-c",
    "us-west3-a",
    "us-west3-b",
    "us-west3-c",
    "us-west4-a",
    "us-west4-b",
    "us-west4-c",
  ])

  # Compute the regional shortname from component parts
  continent_short_name = {
    asia         = "az"
    australia    = "au"
    europe       = "eu"
    northamerica = "na"
    southamerica = "sa"
    us           = "us"
    me           = "me"
  }
  parts = var.region == null ? [] : split("-", var.region)
  region_short_name = var.region == null ? "" : join("", [
    local.continent_short_name[local.parts[0]],
    replace(local.parts[1], "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/", "$1$2$3$4$5")
  ])
  zone_short_name = var.zone == null ? "" : join("", [
    local.continent_short_name[split("-", var.zone)[0]],
    replace(join("", slice(split("-", var.zone), 1, 3)), "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/", "$1$2$3$4$5")
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
  zone_short_name_map = { for full_zone in local.zones : full_zone =>
    join(
      "", [
        local.continent_short_name[
          split("-", full_zone)[0]
        ],
        replace(
          join(
            "", slice(split("-", full_zone), 1, 3)
          ),
          "/(n)orth|(s)outh|(e)ast|(w)est|(c)entral/",
          "$1$2$3$4$5"
        )
      ]
    )
  }
}
