# attributes/default.rb
#
# Author: Simple Finance <ops@simple.com>
# License: Apache License, Version 2.0
#
# Copyright 2013 Simple Finance Technology Corporation
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
#
# Attributes for the Go cookbook
platforms = {
  'x86_64' => 'amd64',
  'i686' => '386'
}
default[:go][:install_strategy] = 'source'
default[:go][:version]  = '1.1.1'
default[:go][:checksum] = '71ff6e7bfd8f59a12f2fc7b7abf5d006fad24664e11e39bec61c2ac84d2e573f'
default[:go][:platform] = platforms.fetch(node[:kernel][:machine], '386')
default[:go][:install_dir] = '/usr/local/bin'
default[:go][:cleanup] = false

