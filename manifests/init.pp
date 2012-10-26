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

  include rabbitmq::package
  class { 'rabbitmq::config':
    plugins => $plugins
  }
  include rabbitmq::service

}
