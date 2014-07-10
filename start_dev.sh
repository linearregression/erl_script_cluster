#! /usr/bin/env sh
SQOR_RUN_SCRIPT_TYPE="python" sqor_deploy_env="local" erl -pa ebin deps/*/ebin deps/*/deps/*/ebin -sname script_cluster -s scripty_cluster
