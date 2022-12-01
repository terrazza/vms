#!/bin/bash
set -e
BASE_FOLDER=$(realpath $(dirname "$0"))
source "${BASE_FOLDER}/.helper"

if [ -n ${1} ]; then
	DOCKER_ID=$(getDockerIdByName ${1})
	if [[ -n ${DOCKER_ID} ]]; then
		shift
  		docker logs $DOCKER_ID $@
  	else
  		echo "<E>container ${1} not found"
	fi
fi
