set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "throughput.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set ylabel "Throughput (kbps)"
set xlabel "Chunk size"

set xtics rotate by -45

set boxwidth 0.28

chunks = "2kb 4kb 8kb 16kb 32kb 64kb 128kb 256kb 512kb"
protos = "http quic"
protosTitle = "TCP QUIC"
colors = "blue red"
set for [i=1:words(chunks)] xtic(word(chunks, i) i)

plot \
	for [i=2:words(chunks)-1] for [j=1:words(protos)] "throughput.dat" u (i - 0.15  + (j-1)*.3):(column((i-1)*words(protos)+j)*8/1000) lc rgb word(colors, j) notitle, \
	for [j=1:words(protos)] i=words(chunks) "throughput.dat" u (i - 0.15  + (j-1)*.3):(column((i-1)*words(protos)+j)*8/1000) lc rgb word(colors, j) t word(protosTitle, j) \
