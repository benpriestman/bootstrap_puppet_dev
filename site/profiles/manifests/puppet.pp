class profiles::puppet {

  case $::osfamily {
    'Debian': {
      include ::apt::repo::puppetlabs
    }
    'RedHat': {
      include ::yum::repo::puppetlabs
    }
    default: {
      fail("I don't know how to manage a puppet repo on ${::operatingsystem}.")
    }
  }

  include ::puppet

}
