#!/bin/bash

backupDir="/backup/postgresql"

numberOfDaysToKeep=90

function main()
{
    databases=`su --login --command "psql -l -t | cut -d'|' -f1 | sed -e 's/ //g' -e '/^$/d'" postgres`
    for database in $databases; do
      if [ "$database" != "template0" ] && [ "$database" != "template1" ]; then
        makeFileName

        echo Dumping $database to $fileName

        backup
        deleteOldBackup
      fi
    done

}

function backup()
{
    mkdir -p $backupDir
    su --login --command "pg_dump $database | gzip " postgres | tee $fileName > /dev/null
}

function deleteOldBackup()
{
    find $backupDir -type f -prune -mtime +$numberOfDaysToKeep -exec rm -f {} \;
}


function makeFileName()
{
    fileName=$backupDir/postgresql.`hostname`.`date +%Y-%m-%d+%H.%m`.$database.gz
}

main
