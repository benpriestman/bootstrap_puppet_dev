class profiles::firewall {

  include iptables
  $firewall_rules = {
    'rule11' => {
      source      => '8.8.8.8',
      destination => $::ipaddress_eth0,
      protocol    => 'tcp',
      port        => '12',
    },
    'rule12' => {
      source      => '9.9.9.9',
      #destination => $::ipaddress_eth1,
      protocol    => 'tcp',
      port        => '34',
    },
  }
  create_resources (firewall, $firewall_rules)

}
