#!/bin/sh

. ./env.sh

$docker_cmd run \
-d -t -p 18081:80 \
--dns "$dns" \
$dns_search \
--name zuul -h zuul.zuul.local.flyacmeair.net \
acmeair/zuul

$docker_cmd inspect --format '{{ .Config.Hostname }} {{ .NetworkSettings.IPAddress }}' zuul

