class rabbitmq::params {

  $package = $::operatingsystem ? {
    default => 'rabbitmq-server',
  }

  $plugins = false
}


