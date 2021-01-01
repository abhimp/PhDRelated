para='1'

set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "wait-".para.".eps"
set size 1, 0.8
set bmargin 3

#set title "# parallel connection(s) = ".para

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set ylabel "Response latency (ms)"
set xlabel "Inter request time (ms)"

set boxwidth 0.28

chunks = "500 1000 2000 4000 8000"
protos = "http quic quic2"
title = "TCP Go-QUIC LS-QUIC"
colors = "blue red magenta"
start=-0.6

protos = "http quic"
title = "TCP QUIC"
start=-0.45

set for [i=1:words(chunks)] xtic(word(chunks, i) i)
#set yrange [:10000]

plot \
	for [j=1:words(protos)] for [i=1:words(chunks)-1] para."/".word(protos, j).".dat" u (i + start + .3*j):i+1 lc rgb word(colors, j) notitle, \
	for [j=1:words(protos)] i=words(chunks) para."/".word(protos, j).".dat" u (i + start + .3*j):i+1 lc rgb word(colors, j) t word(title, j), \
