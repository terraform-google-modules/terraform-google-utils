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

output_region_map = attribute("output_region_short_name_map")

describe "outputs" do
  it 'should have a valid region' do
    expect(output_region_map["asia-east1"]).to eq "aze1"
    expect(output_region_map["asia-east2"]).to eq "aze2"
    expect(output_region_map["asia-northeast1"]).to eq "azne1"
    expect(output_region_map["asia-northeast2"]).to eq "azne2"
    expect(output_region_map["asia-south1"]).to eq "azs1"
    expect(output_region_map["asia-southeast1"]).to eq "azse1"
    expect(output_region_map["australia-southeast1"]).to eq "ause1"
    expect(output_region_map["europe-north1"]).to eq "eun1"
    expect(output_region_map["europe-west1"]).to eq "euw1"
    expect(output_region_map["europe-west2"]).to eq "euw2"
    expect(output_region_map["europe-west3"]).to eq "euw3"
    expect(output_region_map["europe-west4"]).to eq "euw4"
    expect(output_region_map["europe-west6"]).to eq "euw6"
    expect(output_region_map["northamerica-northeast1"]).to eq "nane1"
    expect(output_region_map["southamerica-east1"]).to eq "sae1"
    expect(output_region_map["us-central1"]).to eq "usc1"
    expect(output_region_map["us-east1"]).to eq "use1"
    expect(output_region_map["us-east4"]).to eq "use4"
    expect(output_region_map["us-west1"]).to eq "usw1"
    expect(output_region_map["us-west2"]).to eq "usw2"
  end
end
