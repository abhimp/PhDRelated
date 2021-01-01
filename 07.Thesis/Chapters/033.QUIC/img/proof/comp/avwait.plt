#if (!exists("siz")) quit
set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "avwait.eps"
set size 1, 0.8

#set style fill solid 1 border -1
set style fill  transparent pattern 4 noborder
set style boxplot nooutliers
set style data boxplot

set ylabel "Response latency (ms) - audio" offset 2,-1,0
set y2label "Response latency (ms) - video" offset -3,-1,0
set xlabel ""

set boxwidth 0.30

chunks = "2kb 4kb 8kb 16kb 32kb 64kb 128kb 256kb 512kb"
protos = "http quic"
protoTitle = "TCP QUIC"
media = "a v"
mediaTitle = "Audio Video"
colors = "blue red"
set for [i=1:words(media)] xtic(word(mediaTitle, i) i)
set yrange [:6000]
set y2range [:122]
set y2tic 10 offset -1,0,0
set ytic offset 0.5,0,0
set key center top horizontal
set rmargin 7
set lmargin 7
set bmargin 3


plot \
	for [j=1:words(protos)] i=1 word(protos, j)."-".word(media, i).".dat" u (i - .6 + .4*j):($3-$2) fs solid 1.0 lc rgb word(colors, j) axes x1y1 notitle, \
	for [j=1:words(protos)] i=2 word(protos, j)."-".word(media, i).".dat" u (i - .6 + .4*j):($3-$2) fs solid 1.0 lc rgb word(colors, j) axes x1y2 t word(protoTitle, j), \
	for [j=1:words(protos)] i=1 word(protos, j)."-".word(media, i).".dat" u (i - .6 + .4*j):($3-$2) fs transparent pattern 1 lw 5 lc rgb "black" axes x1y1 notitle, \
	for [j=1:words(protos)] i=2 word(protos, j)."-".word(media, i).".dat" u (i - .6 + .4*j):($3-$2) fs transparent pattern 4 lw 5 lc rgb "black" axes x1y2 notitle, \
#    for [j=1:words(protos)] NaN lw 7 lc rgb word(colors, j) t word(protoTitle, j) \
#for [i=1:words(media)] NaN w boxes fs pattern i*3-2 lw 5 lc rgb "black" t word(mediaTitle, i)

