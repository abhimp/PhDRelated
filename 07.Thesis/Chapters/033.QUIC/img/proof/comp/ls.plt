set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "ls.eps"
set size 10, 8
set size 1, .8
set bmargin 3

#set grid xtic

#set xtic 1000
set ylabel "Request number"
set xlabel "Time (seconds)"
set key top left

x=1400

set xrange [x+58:x+90]
set yrange [378.5:386.5]
colors = "blue #005800"
files = "quic-a quic-v"
title = "Audio Video"

plot \
         "quic-av.dat" u ($2/1000):1:(($3-$2)/1000):(0) with vector nohead lc rgb "red" lw 40 t "Waiting", \
         for [i=1:words(files)] word(files, i).".dat" u ($3/1000):1:(($4-$3)/1000):(0) with vector nohead lc rgb word(colors, i) lw 40 t word(title, i)
