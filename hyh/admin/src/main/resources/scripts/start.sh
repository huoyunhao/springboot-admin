#!bin/sh

moduleName="admin"
pidPath="../$moduleName

rm -f $pidPath

nohup java -jar ../$moduleName.jar > ./$moduleName.log 2>&1 &

