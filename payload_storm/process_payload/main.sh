#!/bin/sh

INPUT_DIR=$1
OUTPUT_DIR=$2
STORM_HOME=/opt/storm/build/bin
STORM_BIN=storm
TASK_ID=`cat task.id`
STORM_CONTAINER="storm$TASK_ID"


if [ -e timedata.txt ]
then
    exec_start_time=`date +"%Y-%m-%d %H:%M:%S.%3N"`
    sed -i "s/EXEC_START_TIME/$exec_start_time/" ./timedata.txt
fi 
sh $INPUT_DIR/run.sh $INPUT_DIR $OUTPUT_DIR $STORM_HOME $STORM_BIN $STORM_CONTAINER
if [ -e timedata.txt ]
then
    exec_end_time=`date +"%Y-%m-%d %H:%M:%S.%3N"`
    sed -i "s/EXEC_END_TIME/$exec_end_time/" ./timedata.txt
    cp ./timedata.txt $OUTPUT_DIR/timedata.txt
fi 

# --- EOF ---
