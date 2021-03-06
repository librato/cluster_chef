#
# Author:: Benjamin Black (<b@b3k.us>)
# Cookbook Name:: cassandra
# Recipe:: daemon
#
# Copyright 2010, Flip Kromer
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

# Install everything to be able to set up as a cassandra daemon, but dont
# actually provide the service or start the daemon, or try to become a seed
# or anything like that....

directory('/etc/sv/cassandra/env'){ owner 'root' ; action :create ; recursive true }

template "/etc/cassandra/cassandra.yaml" do
  source    "cassandra.yaml.erb"
  owner     "root"
  group     "root"
  mode      0644
end

template "/etc/cassandra/log4j-server.properties" do
  source    "log4j-server.properties.erb"
  owner     "root"
  group     "root"
  mode      0644
end
