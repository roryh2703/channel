#!/bin/bash
module add openfoam/4.0
./Allclean.sh

cp -r 0.orig 0

blockMesh

decomposePar -force

mpirun -np 4 pimpleFoam -parallel >> log

reconstructPar






