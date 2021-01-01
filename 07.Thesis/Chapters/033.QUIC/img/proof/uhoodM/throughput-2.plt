para='2'

set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "throughput-".para.".eps"
set size 1, 0.8
set bmargin 3

#set title "# parallel connection(s) ".para

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set ylabel "Throughput (mbps)"
set xlabel "Inter request time (ms)"

set boxwidth 0.28

set key left top horizontal maxcols 2

chunks = "500 1000 2000 4000 8000"
protos = "http quic quic2"
title = "TCP Go-QUIC LS-QUIC"
colors = "blue red magenta"
start=-0.6

protos = "http quic"
title = "TCP QUIC"
start=-0.45

set for [i=1:words(chunks)] xtic(word(chunks, i) i)
set yrange [:3.5]
set ytics 1

plot \
	for [j=1:words(protos)] for [i=1:words(chunks)-1] para."/".word(protos, j)."-gdpt.dat" u (i + start + .3*j):(column(i+1)/1000) lc rgb word(colors, j) notitle, \
	for [j=1:words(protos)] i=words(chunks) para."/".word(protos, j)."-gdpt.dat" u (i + start + .3*j):(column(i+1)/1000) lc rgb word(colors, j) t word(title, j), \

