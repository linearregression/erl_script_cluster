#! /usr/bin/env sh
echo on
set -e
export RUN_SCRIPT_TYPE="python"
export DEDPLOY_ENV="local"
if [[ -z "$RUN_SCRIPT_TYPE" ]]; then
	echo "Make sure you set \$RUN_SCRIPT_TYPE before running this script"
	echo "e.g. export RUN_SCRIPT_TYPE=\"python\""
	exit 1
fi

if [[ -z "$DEPLOY_ENV" ]]; then
	echo "Make sure you set \$DEPLOY_ENV before running this script"
	echo "e.g. export DEPLOY_ENV=\"local\""
	exit 1
fi

erl -pa ebin deps/*/ebin deps/*/deps/*/ebin -sname erl_script_cluster -s erl_script_cluster
