# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

output_zone_map = attribute("zone_short_name_map")

describe "outputs" do
  it 'should have a valid zone' do
    expect(output_zone_map[:"asia-east1-a"]).to eq "aze1a"
    expect(output_zone_map[:"asia-east2-a"]).to eq "aze2a"
    expect(output_zone_map[:"asia-northeast1-a"]).to eq "azne1a"
    expect(output_zone_map[:"asia-northeast2-a"]).to eq "azne2a"
    expect(output_zone_map[:"asia-northeast3-a"]).to eq "azne3a"
    expect(output_zone_map[:"asia-south1-a"]).to eq "azs1a"
    expect(output_zone_map[:"asia-southeast1-a"]).to eq "azse1a"
    expect(output_zone_map[:"asia-southeast2-a"]).to eq "azse2a"
    expect(output_zone_map[:"australia-southeast1-a"]).to eq "ause1a"
    expect(output_zone_map[:"europe-north1-a"]).to eq "eun1a"
    expect(output_zone_map[:"europe-west1-b"]).to eq "euw1b"
    expect(output_zone_map[:"europe-west2-a"]).to eq "euw2a"
    expect(output_zone_map[:"europe-west3-a"]).to eq "euw3a"
    expect(output_zone_map[:"europe-west4-a"]).to eq "euw4a"
    expect(output_zone_map[:"europe-west6-a"]).to eq "euw6a"
    expect(output_zone_map[:"northamerica-northeast1-a"]).to eq "nane1a"
    expect(output_zone_map[:"northamerica-northeast2-a"]).to eq "nane2a"
    expect(output_zone_map[:"southamerica-east1-a"]).to eq "sae1a"
    expect(output_zone_map[:"us-central1-a"]).to eq "usc1a"
    expect(output_zone_map[:"us-east1-b"]).to eq "use1b"
    expect(output_zone_map[:"us-east4-a"]).to eq "use4a"
    expect(output_zone_map[:"us-west1-a"]).to eq "usw1a"
    expect(output_zone_map[:"us-west2-a"]).to eq "usw2a"
    expect(output_zone_map[:"us-west3-a"]).to eq "usw3a"
    expect(output_zone_map[:"us-west4-a"]).to eq "usw4a"
  end
end
