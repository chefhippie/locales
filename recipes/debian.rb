#
# Cookbook Name:: locales
# Recipe:: default
#
# Copyright 2013, Thomas Boerger
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

node["locales"]["packages"].each do |name|
  package name do
    action :install
  end
end

template node["locales"]["generate_file"] do
  mode 0644
  owner "root"
  group "root"

  source "locale.gen.erb"

  variables(
    node["locales"]
  )

  notifies :run, "execute[locales_generate]", :immediately
end

execute "locales_generate" do
  command "locale-gen"

  user "root"
  group "root"

  action :nothing
end

execute "locales_update" do
  command "update-locale LANG=#{node["locales"]["lang"]}"

  user "root"
  group "root"

  action :run

  not_if do
    `tail -n1 /etc/default/locale`.strip == "LANG=#{node["locales"]["lang"]}"
  end
end
