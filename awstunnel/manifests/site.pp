node 'jorge-virtualbox.vlan131.itnow.es' {
  include awstunnel
  include ::awstunnel::install
  include ::awstunnel::config
  include ::awstunnel::service
}

node default {
	notify{"The default puppet configuration": }
}

node /^puppet/ {
	notify{"We have matched the puppet node": }
}

node /^jorge-Virtual/ {
  notify{"Mi $::hostname de $::operatingsystem.": }
}
