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
}
