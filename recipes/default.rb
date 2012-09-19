#
# Cookbook Name:: download_vcap_repo
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{unzip}.each do |pkg|
  package pkg do
    action :install
  end
end


if "ls /srv/vcap/dev_setup"

Chef::Log.warn("Vcap is already downloaded")

end 

bash "make vcap local copy from local http repo  " do
  user "root"
  cwd "/srv"
  code <<-EOH
  rm -rf ./vcap
  wget http://10.1.1.241/master.zip -O vcap_zip
  unzip vcap_zip
  rm vcap_zip
  EOH
#  git init
 not_if {"ls /srv/vcap/dev_setup" }

end

