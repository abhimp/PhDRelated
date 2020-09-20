set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "location_throughput.eps"


set size 1, 0.7

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram cluster gap 1
set style data histograms
set xtics rotate by -90 font 'Helvetica Bold,15'
set bars 0.5

set key out top center horizontal samplen 1 nobox font ",20" width -3

colors = "red blue"

set grid ytics lc rgb "gray" lw 1

set y2tics

set xlabel "Location Indices"
set ylabel "Throughput (Kbps)" font ",23"
set y2label "Var. RSSI & No. of Handovers" font ",23"

plot "location_throughput.dat" u 12:xtic(2) lc rgb "green" axes x1y2 t "Var RSSI", \
    "" u 16:xtic(2) lc rgb "orange" axes x1y2 t "Vertical HO", \
    "" u 17:xtic(2) lc rgb "magenta" axes x1y2 t "Horizontal HO", \
    "" u 1:9:xtic(strcol(2)."AA") w lp lw 7 lc rgb "red" t "Throughput (kbps)", \
	"" u 1:($11/-1):xtic(2) w lp lw 7 lc rgb "blue" t "Avg. RSSI (dBm)"


