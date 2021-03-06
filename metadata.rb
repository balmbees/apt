name              'apt'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache 2.0'
description       'Configures apt and apt services and LWRPs for managing apt repositories and preferences'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url        'https://github.com/opscode-cookbooks/apt/issues'  if respond_to?(:issues_url)
source_url        'https://github.com/opscode-cookbooks/apt'  if respond_to?(:source_url)
version           '2.8.2'
recipe            'apt', 'Runs apt-get update during compile phase and sets up preseed directories'
recipe            'apt::cacher-ng', 'Set up an apt-cacher-ng caching proxy'
recipe            'apt::cacher-client', 'Client for the apt::cacher-ng caching proxy'

%w{ ubuntu debian }.each do |os|
  supports os
end

attribute 'apt/cacher-client/restrict_environment',
          :description => 'Whether to restrict the search for the caching server to the same environment as this node',
          :default => 'false'

attribute 'apt/cacher_port',
          :description => 'Default listen port for the caching server',
          :default => '3142'

attribute 'apt/cacher_ssl_support',
          :description => 'The caching server supports upstream SSL servers via CONNECT',
          :default => 'false'

attribute 'apt/cacher_interface',
          :description => 'Default listen interface for the caching server',
          :default => nil

attribute 'apt/key_proxy',
          :description => 'Passed as the proxy passed to GPG for the apt_repository resource',
          :default => ''

attribute 'apt/caching_server',
          :description => 'Set this to true if the node is a caching server',
          :default => 'false'
