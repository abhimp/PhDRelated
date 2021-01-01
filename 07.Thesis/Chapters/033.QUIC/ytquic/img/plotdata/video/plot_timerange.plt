set yrange [0:5]
set terminal postscript eps enhanced color font 'Helvetica,Bold' 30
set size 1.5, 1
set output "plot_timerange.eps"
set ytics ("" 0, "144p" 1, "240p" 2, "360p" 3, "480p" 4)
set xlabel 'Time(in sec)'
set ylabel 'Quality Level'
set grid xtics ytics
set key top horizontal
plot  \
	'QUICPlots/plot_timerange_quality.dat' using ($2/1000):($1+0.2):(($3/1000)-($2/1000)):(0) with vectors nohead lw 24 lc "red" title "QUIC" ,  \
	'QUICPlots/plot_timerange_139867765379152.dat' using ($1/1000):($2+0.2) with steps lw 8 lt "dotted" lc "black" notitle, \
	'TCPPlots/plot_timerange_quality.dat' using ($2/1000):($1-0.2):(($3/1000)-($2/1000)):(0) with vectors nohead lw 24 lc "blue" title "TCP",  \
	'TCPPlots/plot_timerange_140001536202728.dat' using ($1/1000):($2-0.2) with steps lw 8 lt "dotted" lc "black" notitle, \
	'wastagecircle.dat' using 1:2:3 with circles lw 10 lc "black" notitle