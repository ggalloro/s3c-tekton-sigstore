# Copyright 2023 The Tekton Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Modified to estract taskrun results
# export IMAGE_URL=$(tkn tr describe --last -o jsonpath="{.status.results[1].value}")
# export IMAGE_DIGEST=$(tkn tr describe --last -o jsonpath="{.status.results[0].value}")
# export IMAGE_REF=$IMAGE_URL@$IMAGE_DIGEST
# gcloud artifacts docker images describe $IMAGE_URL --show-all-metadata --format json | jq -r '.provenance_summary.provenance[0].envelope.payload' | tr '\-_' '+/' | base64 -d | jq > provenance.json
# gcloud artifacts docker images describe $IMAGE_URL --show-all-metadata --format json | jq -r '.provenance_summary.provenance[0].envelope.signatures[0].sig' | tr '\-_' '+/' | base64 -d | jq > signature


# Extract results from pipelinerun
export IMAGE_URL=$(tkn pr describe --last -o jsonpath="{.status.results[1].value}")
export IMAGE_DIGEST=$(tkn pr describe --last -o jsonpath="{.status.results[0].value}")
export IMAGE_REF=$IMAGE_URL@$IMAGE_DIGEST
gcloud artifacts docker images describe $IMAGE_REF --show-all-metadata --format json | jq -r '.provenance_summary.provenance[0].envelope.payload' | tr '\-_' '+/' | base64 -d | jq > provenance
gcloud artifacts docker images describe $IMAGE_REF --show-all-metadata --format json | jq -r '.provenance_summary.provenance[0].envelope.signatures[0].sig' | tr '\-_' '+/' | base64 -d | jq  > signature