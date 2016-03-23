# Submódulo de configuraciones
class ::awstunnel::config{
  file {'awstuenneld':
    ensure  => file,
    path    => '/etc/init.d/awstuenneld',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => "#!/bin/bash

export DISPLAY=:0.0
export PATHTOCERT='/home/jorge/certs'
export CERT=${PATHTOCERT}/keyfile.ppk
export LPORT='8081'
export RPORT='22'
export REMOTEHOST='52.31.107.108'
export REMOTEUSER='ec2-user'
export PATH=\"$::path\"
export BINPATH='/usr/bin'

start() {
  putty -ssh -i ${CERT} -D ${LPORT} -P ${RPORT} -l ${REMOTEUSER} ${REMOTEHOST} &
}

stop() {
  export PID=`lsof -nPi:${LPORT} | grep LISTEN | head -1 | awk {'print $2'}`
  kill -9 ${PID}
}

status() {
  if [[ `lsof -nPi:${LPORT} | grep LISTEN | wc -l` -lt 2 ]]; then
    echo -e '\nAL: Túnel AWS, puerto ${LPORT}: CERRADO.\n'
  else
    export PID=`lsof -nPi:${LPORT} | grep LISTEN | head -1 | awk {'print $2'}`
    echo -e '\nOK: Túnel AWS, puerto ${LPORT}: ABIERTO, PID ${PID}.\n'
  fi
}

case $1 in
  start)
        start
        ;;
  stop)
        stop
        ;;
  status)
        status
        ;;
  restart)
        stop
        sleep 5
        start
        ;;
  *)
        echo 'Uso: $0 [start|stop|status|restart]'
        exit 1
esac",
  }
}
