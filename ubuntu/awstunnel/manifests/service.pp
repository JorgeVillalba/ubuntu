# Submódulo de instalación
class ::awstunnel::service{
  service {'awstunneld':
    ensure  => running,
    name    => 'awstunneld',
    enable  => true,
    path    => '/etc/init.d/awstuenneld',
    stop    => '/etc/init.d/awstuenneld stop',
    start   => '/etc/init.d/awstuenneld start',
    status  => '/etc/init.d/awstuenneld status',
    restart => '/etc/init.d/awstuenneld restart',
    require => File['awstuenneld'],
  }
}