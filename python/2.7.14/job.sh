#! /bin/sh

# For kubernetes Cron Job
# Created by Lin.Ru@msn.com, 2018-06-02

msg(){
    echo -e "`date +'%F %T'` $1"
}

msg "Job type: $APP_JOB_TYPE, id $CRONJOB_ID"

msg "Change dir into $APP_ROOT"
cd $APP_ROOT

  cj="cronjob.json"
name="`jq \".[] | select(.id == $CRONJOB_ID) | .name\" $cj | sed 's/"//g'`"

if [ "$CRONJOB_NAME" != "$name" ]
then
    msg  "Task names are inconsistent !"
    send "failure-task-name-inconsistent"
    exit 0
fi

echo "`date +'%F %T'` Execute command: `jq \".[] | select(.id == $CRONJOB_ID) | .command\" $cj | sed 's/"//g'`"

jq ".[] | select(.id == $CRONJOB_ID) | .command" $cj | sed 's/"//g' | sh

if [ $? = 0 ]
then
    msg "Command successfully completed"
    exit 0
else
    msg  "Command failed"
    exit 0
fi