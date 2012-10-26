# = Class: rabbitmq::package
#
#
# == Usage:
#
#   include rabbitmq::package
#
class rabbitmq::package(
  $package = hiera('package', $rabbitmq::params::package),
  $source  = '',
  $absent  = false
) {

  require rabbitmq::params

  $manage_package = $absent ? {
    true    => 'absent',
    default => 'installed',
  }

  $manage_source = $source ? {
    ''      => undef,
    default => $source
  }

  package { $package:
    ensure => $manage_package,
    source => $manage_source
  }

  case $::operatingsystem {
    /(?i:centos|redhat)/ : {

      exec { 'install-epel-gpg-key':
        # http URL's work too, but would't be as secure as veryfying the key first.
        command => '/bin/rpm --import https://fedoraproject.org/static/0608B895.txt',
        unless  => '/bin/rpm -q --quiet gpg-pubkey-0608b895',
      }

      package { 'epel-release-6-7.noarch':
        ensure   => installed,
        source   => 'http://mirror.unl.edu/epel/6/x86_64/epel-release-6-7.noarch.rpm',
        provider => 'rpm',
        require  => Exec['install-epel-gpg-key']
      }

      Package[$package] { require +> Package['epel-release-6-7.noarch'] }
    }
    default : {}
  }

}
