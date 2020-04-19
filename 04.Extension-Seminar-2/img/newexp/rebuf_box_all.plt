set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "rebuf_box_all.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set boxwidth 0.28

#set key top left samplen 2
set ylabel "Rebuffering Time (seconds)"

#set title "Average playback bitrate"


prots = "http quic"

legend = "HTTP QUIC"
color = "blue red"

set yrange [0:.1]

set xtics()
set for [i=1:words(legend)] xtics add (word(legend, i) i)

plot for [i=1:words(prots)] 'newdata/rebuf_Bola_'.word(prots, i).'.dat' u (i):1 lc rgb word(color, i) notitle
