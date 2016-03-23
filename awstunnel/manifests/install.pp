# Submódulo de instalación
class awstunnel::install{
  package {'putty':
    ensure => installed,
  }
}
