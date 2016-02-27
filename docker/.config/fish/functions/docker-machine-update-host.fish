function docker-machine-update-host -a machine
    if test -z "$machine"
        set machine "default"
    end

	# clear existing docker.local entry from /etc/hosts
    set _sed_command "/ $machine\.docker\$/d"
	sudo sed -i '' $_sed_command /etc/hosts

	# get ip of running machine
	# export DOCKER_IP="$(echo ${DOCKER_HOST} | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
    set DOCKER_IP (echo $DOCKER_HOST | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')

	# update /etc/hosts with docker machine ip
	# [[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP}	docker.local\" >> /etc/hosts"
    if test -n "$DOCKER_IP"
        sudo /bin/bash -c "echo \"$DOCKER_IP    $machine.docker\" >> /etc/hosts"
    end
end
