--
-- Copyright 2022 The Android Open Source Project
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     https://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

SELECT RUN_METRIC('chrome/chrome_tasks.sql');

SELECT full_name, task_type, count() as count
FROM chrome_tasks
WHERE full_name GLOB 'FrameHost::BeginNavigation*'
  OR full_name GLOB 'FrameHost::DidCommitProvisionalLoad*'
  OR full_name GLOB 'FrameHost::DidCommitSameDocumentNavigation*'
  OR full_name GLOB 'FrameHost::DidStopLoading*'
GROUP BY full_name, task_type
ORDER BY count DESC
LIMIT 50;
