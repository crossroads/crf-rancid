#
# Cookbook Name:: rancid
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

default['rancid']['user']          = 'rancid'
default['rancid']['group']         = 'rancid'
default['rancid']['scm']           = 'svn'
default['rancid']['base_dir']      = '/var/rancid'
default['rancid']['log_dir']       = '/var/log/rancid'
default['rancid']['device_groups'] = [ 'core', 'access', 'distribution', 'firewalls' ]