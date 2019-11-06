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

control "gcloud" do
  title "gcloud"

  describe "outputs" do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq "" }

    it 'should have a valid region' do
      expect(output_region_map["us-central1"]).to eq "usc1"
      expect(output_region_map["us-east1"]).to eq "use1"
    end
  end
end
