class profiles::firewall2 {

  include iptables
  $firewall_rules = {
    'rule21' => {
      source      => '10.10.10.10',
      destination => $::ipaddress_eth0,
      protocol    => 'tcp',
      port        => '56',
    },
    'rule22' => {
      source      => '11.11.11.11',
      #destination => $::ipaddress_eth1,
      protocol    => 'tcp',
      port        => '78',
    },
  }
  create_resources (firewall, $firewall_rules)

}
