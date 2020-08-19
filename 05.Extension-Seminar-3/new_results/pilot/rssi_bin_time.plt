set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "rssi_bin_time.eps"


set size 1, 0.6

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram cluster gap 1
set style data histograms
#set xtics rotate by -45
set bars 0.5

set key top center horizontal samplen 2
set key top right vertical samplen 2 font ",20"

colors = "red blue"

set grid ytics lc rgb "gray" lw 1

set xlabel "RSSI Bins"
set ylabel "Time (s)" font ",23"

plot "rssi_bin.dat" u 2:xtic(1) lc rgb "red" t "Total Time", \
	"" u 3:xtic(1) lc rgb "blue" t "Active Time"
