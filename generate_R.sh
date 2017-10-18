#!/bin/bash

# generate R field for time directories

pimpleFoam -postProcess -func R    #calculate and write out the R field
writeCellCentres    #generate coordinates for output

#    only use last time directory, name 'y'
x="ls | sort -n | tail -n1 | head -n1"
y=`eval $x`

cd $y

#    clean coordinate folders
gunzip -c ccx.gz > ccx
gunzip -c ccy.gz > ccy
gunzip -c ccz.gz > ccz

sed '1,22d' ccx > tempx
sed '1,22d' ccy > tempy
sed '1,22d' ccz > tempz

sed '/)/,$d' tempx > xcoords
sed '/)/,$d' tempy > ycoords
sed '/)/,$d' tempz > zcoords

rm -rf temp* ccx ccy ccz


#clean the R folder
gunzip -c turbulenceProperties:R.gz > R_temp1
sed -e '1,22d' R_temp1 > R_temp2    #delete first 22 lines
sed '/;/,$d'  R_temp2 > R_temp3    #delete last block of text
sed '$d' R_temp3 > R_temp4    #delete 'pesky' remaining bracket on last line
sed 's/(//g' R_temp4 > R_temp5         #remove '('
sed 's/)//g' R_temp5> R_temp6         #remove ')'
mv R_temp6 R_clean
rm -rf R_temp*

cd ..
rm -rf R
mkdir R

cp -r $y/R_clean $y/xcoords $y/ycoords $y/zcoords R

