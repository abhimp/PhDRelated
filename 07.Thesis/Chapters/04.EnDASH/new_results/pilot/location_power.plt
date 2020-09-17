set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "location_power.eps"


set size 1, 0.7

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram cluster gap 1
set style data histograms
set xtics rotate by -90 font 'Helvetica Bold,15'
set bars 0.5

#set key out top center horizontal samplen 2
set key out top center horizontal samplen 1 nobox font ",20" width -3

colors = "red blue"

set grid ytics lc rgb "gray" lw 1

set y2tics 2

set xlabel "Location Indices"
set ylabel "S.D of Power (mWs)" font ",23"
set y2label "No. of Handovers" font ",23"

plot "location_power.dat" u 16:xtic(2) lc rgb "orange" axes x1y2 t "Vertical HO", \
    "" u 17:xtic(2) lc rgb "magenta" axes x1y2 t "Horizontal HO", \
    "" u 1:13:xtic(2) w lp lw 7 lc rgb "red" t "S. D. Connected Power", \
	"" u 1:14:xtic(2) w lp lw 7 lc rgb "blue" t "S.D. Tail Power", \
	"" u 1:15:xtic(2) w lp lw 7 lc rgb "green" t "S.D. Idle Power"



