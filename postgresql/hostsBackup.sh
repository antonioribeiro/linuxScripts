#!/bin/bash

backupDir="/tank/\!backup"

remoteUser=root
remoteHost=ks300977.kimsufi.com
remoteDir="/tank/\!backup"

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
    rsync -avz -e ssh $remoteUser@$remoteHost:$remoteDir $backupdir/$remoteHost
}

main
