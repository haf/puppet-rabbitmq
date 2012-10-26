puppet-rabbitmq
===============

This is an actively maintained rabbitmq puppet module, with full command
mappings.

## Dependencies

 * `concat` from [puppetlabs/concat](git://github.com/ripienaar/puppet-concat.git).

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

## Notes

Ugly hack to enabled stomp support added (Kris Buytaert)

Refactoring to enable support for multiple plugins and more config detail.

Not yet sure how to tackle to merge rabbitmq.config .. currently 2 templates
based on my 2 isolated use cases .  needs work 
