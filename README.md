puppet-rabbitmq
===============

This is an actively maintained rabbitmq puppet module, with full command
mappings.

## Dependencies

 * `concat` from [puppetlabs/concat](git://github.com/ripienaar/puppet-concat.git).
 * `hiera` IF puppet < 3.0, otherwise it's bundled in puppet.

If you are running CentOS or RHEL, you'll need the EPEL repository. I can
recommend having a look at https://github.com/stahnma/puppet-module-epel.

## API

These are the types available in the API of this module.

### class `rabbitmq`

```puppet
class { 'rabbitmq':
  $plugins => true # optional, default false
}
```

*Note: breaking change - use the DSL true|false atoms, not 'no' or 'yes'.*

### define `rabbitmq::vhost`

```puppet
rabbitmq::vhost { 'development':
  ensure => 'present'
}
```

### class `rabbitmq::ssl`

```puppet
include rabbitmq::ssl
```

Generates a simple SSL self-signed certificate.

### class `rabbitmq::stomp`

```puppet
class { 'rabbitmq':
  plugins => true,
}
include rabbitmq::stomp
```

Enables the STOMP RabbitMQ plugin. 
WARNING: WILL OVERWRITE `/etc/rabbitmq/rabbitmq.config` in its current format.

### define `rabbitmq::permission`

```puppet
rabbitmq::permission { "myuser":
  vhostpath => '/', #default
  $conf     => "^amq.gen-.*",
  $write    => ".*",
  $read     => ".*",
}
rabbitmq::permission { "myuser":
  ensure => "absent",
  vhostpath => '/', #default
}
```

Creates or removes permissions


### More types:
... have a look in manifests - most things are configurable.

## Notes

Ugly hack to enabled stomp support added (Kris Buytaert)

Refactoring to enable support for multiple plugins and more config detail.

Not yet sure how to tackle to merge rabbitmq.config .. currently 2 templates
based on my 2 isolated use cases .  needs work 
