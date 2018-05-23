require 'beaker-rspec'
# Helper does not yet support Puppet 5
#require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

# Helper does not yet support Puppet 5
#install_puppetlabs_release_repo_on(hosts, 'puppet5')
install_puppet_agent_on(hosts, :puppet_collection => 'puppet5', :puppet_agent_version => ENV['PUPPET_INSTALL_VERSION'])
#run_puppet_install_helper
install_module_on(hosts)
install_module_dependencies_on(hosts)

UNSUPPORTED_PLATFORMS = ['Suse','AIX','Solaris']

RSpec.configure do |c|
  # Readable test descriptions
  c.formatter = :documentation
end
