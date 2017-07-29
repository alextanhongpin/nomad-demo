 nomad logs -stderr -tail 431cda94
 nomad logs -stderr -tail c7e407c4
 nomad logs -stderr -tail 7a203443


 nomad logs -stderr -tail 3914a30d


dns service lookup

[tag.]<service>.service[.datacenter].<domain>

 dig @127.0.0.1 -p 8600 global-server-check.service.consul SRV

  ./consul-template -template /tmp/consul.ctmpl:/tmp/consul.result -dry -once

./consul-template -template "in.tpl:out.txt" -once