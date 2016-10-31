#!/bin/sh

# Shutdown function
shut() {
	kill -s SIGTERM $PID
	wait $PID
}

# Status check Function
check_status() {
    if [ $# -ne 2 ];
    then
        echo "$0: Programming error: Report to prasad.prabhakaran@starwoodhotels.com"
        exit -1
    fi
    exit_code=$1
    err_msg=$2
    if [ $exit_code -ne 0 ];
    then
        echo $err_msg
        exit $exit_code
    fi
}

#if [ $# -ne 1 ];
#then
#   echo "Usage: $0 target_host"
#    exit 1
#fi

TargetHost=$1
TargetProject=$2
curdir=`pwd`
ProjectFile=/opt/bin/$TargetProject
SOAPUI_HOME=/opt/SoapUI/bin
TEST_RUNNER=$SOAPUI_HOME/testrunner.sh

ls -lrt $SOAPUI_HOME/

if [ ! -f "$ProjectFile" ];
then
    echo "Project File does not exist"
    exit 1
fi

bash -x ./$TEST_RUNNER -s"SherlockTestSuite" "$ProjectFile"
PID=$!
echo "$PID"
check_status $PID "Failed to pass regression testing "


trap shut SIGTERM SIGINT
wait $PID