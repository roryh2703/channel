#    script to change boundary conditions

rm -rf path_file

#    choice: slip or symmetry
#grep -r "symmetry" | cut -d' ' -f1 | tr -d ':' >> temp1
grep -r "slip" | cut -d' ' -f1 | tr -d ':' >> temp1

sort temp1 | uniq > temp2
sed '/~$/ d' temp2 > temp3          # delete any line ending with ~
cat temp3 | sed '/change_wall*/d' > temp4
cp temp4 path_file
rm -rf temp*

#xargs -d '\n' -a path_file sed -i -- 's/symmetry/slip/g'
xargs -d '\n' -a path_file sed -i -- 's/slip/symmetry/g'

