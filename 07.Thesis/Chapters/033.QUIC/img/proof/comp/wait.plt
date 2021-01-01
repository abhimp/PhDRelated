set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "wait.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set ylabel "Response latency (ms)"
set xlabel ""

set boxwidth 0.8

chunks = "2kb 4kb 8kb 16kb 32kb 64kb 128kb 256kb 512kb"
protos = "http quic"
protoTitle = "TCP QUIC"
colors = "blue red"
set for [i=1:words(protoTitle)] xtic(word(protoTitle, i) i)
set yrange [:1600]

plot \
	for [i=1:words(protos)] word(protos, i).".dat" u (i):($2-$1) lc rgb word(colors, i) notitle
