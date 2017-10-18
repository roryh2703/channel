#!/bin/bash
#    script removes all time directories apart from latest and 0


#module switch intel gnu/4.9.1
#module add openfoam/4.1.0
#source $FOAM_SRC_FILE

#    Stores last time directory in mesh file
x="ls | sort -n | tail -n1 | head -n1"
y=`eval $x`

mv $y last_time_step
foamListTimes -rm
mv last_time_step $y

