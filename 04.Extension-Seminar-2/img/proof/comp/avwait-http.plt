set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "avwait-http.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set ylabel "Response latency (ms)"
set xlabel ""

set boxwidth 0.8

chunks = "2kb 4kb 8kb 16kb 32kb 64kb 128kb 256kb 512kb"
protos = "a v"
protoTitle = "A V"
colors = "blue red"
set for [i=1:words(protoTitle)] xtic(word(protoTitle, i) i)
set yrange [:2000]

plot \
	for [i=1:words(protos)] "http-".word(protos, i).".dat" u (i):($3-$2) lc rgb word(colors, i) notitle
