node_name "devops-ovpn"
file_cache_path    "/var/chef/cache"
file_backup_path   "/var/chef/backup"
cookbook_path ["../cookbooks"]
role_path []
log_level :info
verbose_logging false

encrypted_data_bag_secret nil

data_bag_path "../data_bags"

node_path []

http_proxy nil
http_proxy_user nil
http_proxy_pass nil
https_proxy nil
https_proxy_user nil
https_proxy_pass nil
no_proxy nil

Chef::Config.from_file "custom-config.rb"
