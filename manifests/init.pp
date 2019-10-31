# @summary rpcbind class
#
# Manages rpcbind package and service.
#
# @example Declaring the class
#   include rpcbind
#
# @param package_ensure Value used for the ensure attribute of the rpcbind package resource.
# @param package_name Value used for the name attribute of the rpcbind package resource.
# @param service_enable Boolean used for the enable attribute of the rpcbind service resource.
# @param service_ensure Value used for the ensure attribute of the rpcbind service resource.
# @param service_name Value used for the name attribute of the rpcbind service resource.
#
class rpcbind (
  String[1] $package_ensure = 'installed',
  String[1] $package_name = 'rpcbind',
  Boolean $service_enable = true,
  String[1] $service_ensure = 'running',
  String[1] $service_name = 'rpcbind',
) {

  # Fail on unsupported platforms
  if !($facts['os']['family'] in ['Debian','RedHat','Suse']) {
    fail('Unsupported osfamily detected. This module works with Debian, RedHat and Suse')
  }

  if $facts['os']['family'] == 'RedHat' and !($facts['os']['release']['major'] in ['6','7']) {
    fail("osfamily RedHat's os.release.major is <${::facts['os']['release']['major']}> and must be 6 or 7")
  } elsif $facts['os']['family'] == 'Suse' and !($facts['os']['release']['major'] in ['11','12','15']) {
    fail("osfamily Suse's os.release.major is <${::facts['os']['release']['major']}> and must be 11, 12 or 15")
  } elsif $facts['os']['name'] == 'Debian' and !($facts['os']['release']['major'] in ['8','9']) {
    fail("Ubuntu's os.release.major is <${facts['os']['release']['major']}> and must be 8 or 9")
  } elsif $facts['os']['name'] == 'Ubuntu' and !($facts['os']['release']['major'] in ['14.04','16.04','18.04']) {
    fail("Ubuntu's os.release.major is <${facts['os']['release']['major']}> and must be 14.04, 16.04 or 18.04")
  }

  package { 'rpcbind_package':
    ensure => $package_ensure,
    name   => $package_name,
  }

  service { 'rpcbind_service':
    ensure  => $service_ensure,
    name    => $service_name,
    enable  => $service_enable,
    require => Package['rpcbind_package'],
  }
}
