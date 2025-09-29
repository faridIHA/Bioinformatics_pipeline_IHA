#!/bin/bash
for i in $(grep -l 'Uniquely mapped reads number' *Log.final.out); do
export percent=$(sed -n '/Uniquely mapped reads %/p' $i |cut -f2)
export num=$(sed -n '/Uniquely mapped reads number/p' $i| cut -f2)
export file=$(paste <(echo "$i") <(echo "$num") <(echo "$percent"))
echo "$file" >> compiled_STAR_stats.txt
done
