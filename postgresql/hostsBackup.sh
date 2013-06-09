#!/bin/bash

backupDir="/tank/\!backup"

remoteHost=ks300977.kimsufi.com
remoteDir="/tank/\!backup"

rsync -avz -e ssh $remoteHost:$remoteDir $backupdir/$remoteHost

function main()
{
    createDir
    copyBackup
}

function createDir()
{
    mkdir -p $backupdir/$remoteHost
}

function copyBackup()
{
    mkdir -p $backupDir
    su --login --command "pg_dump $database | gzip " postgres | tee $fileName > /dev/null
}

main
