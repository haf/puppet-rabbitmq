# = Class: rabbitmq
#
# Installs and runs the rabbitmq messaging server: http://www.rabbitmq.com/.
#
# == Usage:
#
#   class { 'rabbitmq':
#     plugins => true   #optional
#   }
#
class rabbitmq (
  $plugins = $rabbitmq::params::plugins
)
{
  require rabbitmq::params

  anchor { 'rabbitmq::start': }

  class { 'rabbitmq::package':
    require => Anchor[rabbitmq::start],
    before  => Anchor[rabbitmq::end],
  } ->
  class { 'rabbitmq::config':
    plugins => $plugins,
    require => Anchor[rabbitmq::start],
    before  => Anchor[rabbitmq::end],
  } ->
  class { 'rabbitmq::service': 
    require => Anchor[rabbitmq::start],
    before  => Anchor[rabbitmq::end],
  }

  anchor { 'rabbitmq::end': }

}
