#!/bin/bash

#    returns directory to original, blank form

rm -rf correlation_probes_* probesU probesp probesX* surfaces* force_coeffs monitor_probes

cd paraFoam
rm -rf *.png

cd ../cylinder
rm -rf 0 *.[0-9] *.txt *.dat

cd ../lit_pressure_surf
rm -rf *.dat *.jpg

cd ../lit_velocity_probe
rm -rf *.dat *.jpg *.mat

cd ..




