#!/bin/bash

#    Run in current working directory and use current environment
#$ -cwd -V

#    Send email at job start and end
#$ -m be
#$ -M scrh@leeds.ac.uk

#    Set time 
#$ -l h_rt=2:00:00       # time needed

#    How many nodes, how many processors per node (24 cores per node)
#$ -l nodes=1,ppn=24 

# ARC3
module switch intel gnu
module add openfoam/4.1.0
source $FOAM_SRC_FILE

decomposePar
mpirun -np 24 pimpleFoam -parallel 
#reconstructPar -fields '(U p nut k)' -newTimes




