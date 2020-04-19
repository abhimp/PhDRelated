set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "throughput.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set ylabel "Throughput (mbps)"
set xlabel ""

set boxwidth 0.38

chunks = "2kb 4kb 8kb 16kb 32kb 64kb 128kb 256kb 512kb"
protos = "http quic"
protosTitle = "TCP QUIC"
set for [i=1:words(protos)] xtic(word(protosTitle, i) i)
set yrange [:4.000]
set ytics 1
colors="blue red blue"

plot \
	for [i=1:words(protos)] word(protos, i).".dat" u (i):($4*8/($3-$2)/1000) lc rgb word(colors, i) not, \
#	for [i=1:words(protos)] word(protos, i).".dat" u (0.4+0.4*i):($4*8/($3-$1)/1000) lc rgb word(colors, i) notitle, \
