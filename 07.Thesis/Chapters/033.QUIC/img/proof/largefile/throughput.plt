set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "throughput.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set ylabel "Throughput (mbps)"
set xlabel ""

#set xtics rotate by -45

set boxwidth 0.7
#set yrange [85:95]
set xrange [0:3]
set ytics 0.4

protos = "http quic"
protosTitle = "TCP QUIC"
colors = "blue red"
set for [i=1:words(protos)] xtic(word(protosTitle, i) i)

plot \
	for [i=1:words(protos)] word(protos, i).".dat" u (i):($2*8/1000/1000) lc rgb word(colors, i) notitle
