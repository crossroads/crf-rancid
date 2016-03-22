# crf-rancid Cookbook

This cookbook installs and provides basic configuration for [RANCID](http://www.shrubbery.net/rancid/).

## Supported Platforms

Currently supports:
* CentOS 7

## Attributes

| Key | Type | Description | Default |
| --- | ---- | ----------- | ------- |
| `['rancid']['user']` | `String` | The user that the RANCID process runs under | `rancid` |
| `['rancid']['group']` | `String` | The group that the RANCID user belongs to by default | `rancid` |
| `['rancid']['scm']` | `String` | The SCM that RANCID will use.  Valid choices are `svn` and `git`  | `svn` |
| `['rancid']['base_dir']` | `String` | The directory that will hold the RANCID SCM instance and associated files | `/var/rancid` |
| `['rancid']['log_dir']` | `String` | The RANCID log directory | `/var/log/rancid` |
| `['rancid']['device_groups']` | `Array` | An array of device types that RANCID will query | `[ 'core', 'access', 'distribution', 'firewalls' ]` |

## Usage

### crf-rancid::default

Include `crf-rancid` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[crf-rancid::default]"
  ]
}
```

Once installed you must create a `.cloginrc` file and edit the `router.db` file for each device
group in the `node['rancid']['base_dir']` directory.

## License and Authors

Author:: Crossroads Foundation Ltd (<itdept@crossroads.org.hk>)

```
Copyright (C) 2016 Crossroads Foundation Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
