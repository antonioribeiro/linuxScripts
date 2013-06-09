#!/bin/bash

backupDir="/tank/!backup"

remoteUser=root
remoteHost=ks300977.kimsufi.com
remoteDir="/backup"

function main()
{
    createDir
    copyBackup
}

function createDir()
{
    mkdir "$backupDir/$remoteHost"
    echo "mkdir -p $backupDir/$remoteHost"
}

function copyBackup()
{
    echo $backupDir/$remoteHost
    rsync --progress -avz -e ssh $remoteUser@$remoteHost:$remoteDir $backupDir/$remoteHost
}

main
