#!/bin/sh

rm output.log 

z=0
for i in `seq 0 2`; do 
	for x in `seq 0 2`; do
		b=256
		if [ $i -eq 2 ]; then
			b=32
		fi  
		if [ $z -eq 0 ]; then
			while ( ! ( python stacked_lstm.py -t=$i -b=$b -r -d ) ); do 
				b=`expr $b \/ 2`
			done
		else
			while ( ! ( python stacked_lstm.py -t=$i -b=$b -r ) ); do 
				b=`expr $b \/ 2`
			done
		fi
		z=`expr $z + 1`
	done
done | tee output.log
