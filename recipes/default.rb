#
# Cookbook Name:: crf-rancid
# Recipe:: default
#
# Copyright (C) 2016 Crossroads Foundation Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'yum-epel::default'
case node['rancid']['scm']
when 'svn'
  include_recipe 'subversion::client'
else
  include_recipe 'git::default'
end
include_recipe 'postfix::default'

package 'rancid' do
  action :upgrade
end

directory node['rancid']['base_dir'] do
  recursive true
  owner     node['rancid']['user']
  group     node['rancid']['user']
  mode      "0750"
end

directory node['rancid']['log_dir'] do
  owner  node['rancid']['user']
  group  node['rancid']['group']
  mode   "0770"
end

link "#{node['rancid']['base_dir']}/logs" do
  to node['rancid']['log_dir']
end

template '/etc/rancid/rancid.conf' do
  source 'rancid.conf.erb'
  owner  node['rancid']['user']
  group  node['rancid']['group']
  mode   "0640"
end

bash 'initiate-scm' do
  code '/usr/bin/rancid-cvs'
  user node['rancid']['user']
  not_if  do File.directory?("#{node['rancid']['base_dir']}/#{node['rancid']['scm']}") end
  only_if do File.exists?("/etc/rancid/rancid.conf") end
end

file '/etc/cron.d/rancid' do
  action :delete
end

cron 'rancid' do
  minute  '30'
  user    node['rancid']['user']
  command '/usr/bin/rancid-run'
end

cron 'rancid-log-cleanup' do
  minute  '0'
  user    'root'
  command "/bin/find #{node['rancid']['log_dir']} -type f -mtime +7 -exec rm -rf \\{} \\;"
end
