#!/bin/sh

. ./env.sh

asgc_addr=$($docker_cmd inspect --format '{{ .NetworkSettings.IPAddress }}' microscaler)

ssh -i id_rsa root@$asgc_addr << EOF
cd /usr/local/microscaler-cli/bin &&\
./ms login --target http://localhost:56785/asgcc/ --user user01 --key key &&\
\
./ms update-asg \
--asg-name $1 \
--asg-launch-configuration $1 \
--asg-min-size $2 \
--asg-desired-capacity $3 \
--asg-max-size $4
EOF
