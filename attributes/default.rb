#
# Cookbook Name:: locales
# Attributes:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
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

case node["platform_family"]
when "debian"
  default["locales"]["packages"] = %w(
    locales
  )

  default["locales"]["generate"] = [
    "en_US ISO-8859-1",
    "en_US.ISO-8859-15 ISO-8859-15",
    "en_US.UTF-8 UTF-8",
    "de_DE ISO-8859-1",
    "de_DE@euro ISO-8859-15",
    "de_DE.UTF-8 UTF-8"
  ]

  default["locales"]["lang"] = "en_US.UTF-8"
  default["locales"]["generate_file"] = "/etc/locale.gen"
when "ubuntu"
  default["locales"]["packages"] = %w(
    locales
  )

  default["locales"]["generate"] = [
    "en_US ISO-8859-1",
    "en_US.ISO-8859-15 ISO-8859-15",
    "en_US.UTF-8 UTF-8",
    "de_DE ISO-8859-1",
    "de_DE@euro ISO-8859-15",
    "de_DE.UTF-8 UTF-8"
  ]

  default["locales"]["lang"] = "en_US.UTF-8"
  default["locales"]["generate_file"] = "/etc/locale.gen"
when "suse"
  default["locales"]["lang"] = "en_US.utf8"
end
