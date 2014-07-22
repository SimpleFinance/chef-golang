# recipes/source.rb
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
# Installs Go from source

node.default[:go][:filename] = "go#{node[:go][:version]}.#{node[:os]}-#{node[:go][:platform]}.tar.gz"
node.default[:go][:url] = "https://storage.googleapis.com/golang/#{node['go']['filename']}"

if node[:go][:cleanup]
  file ::File.join(Chef::Config[:file_cache_path], node[:go][:filename]) do
    action :nothing
    subscribes :delete, 'execute[install-golang]', :immediately
  end
end

execute 'install-golang' do
  cwd Chef::Config[:file_cache_path]
  command "tar -C #{node[:go][:install_dir]} -xzf #{node[:go][:filename]}"
  action :nothing
end

remote_file ::File.join(Chef::Config[:file_cache_path], node[:go][:filename]) do
  owner node[:go][:owner]
  mode 00644
  source node[:go][:url]
  checksum node[:go][:checksum]
  notifies :run, 'execute[install-golang]', :immediately
end
