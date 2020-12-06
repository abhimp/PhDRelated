
set terminal postscript eps enhanced color "Helvetica Bold" 50
set output "plot_rbuf_bucket123.eps"
set size 3.6,1.2
set multiplot 
set lmargin 2


set size 1,1.2
set origin 0.2, 0.0
set xtics autofreq 300
set ytics autofreq 0.2
set ylabel "CDF" offset 2,0,0
set xlabel "Rbuf (KB)"
set key right bottom
# set xtics rotate by -45
set title "(a)" font ",60"
plot "QUIC/bucket1" using ($2/1000):5 with lines lc rgb "red" linewidth 28 title "QUIC", "TCP/bucket1" using ($2/1000):5 with lines lc rgb "blue" linewidth 28 title "TCP"



set size 1,1.2
set origin 1.4, 0.0	
set xtics autofreq 300
set ytics autofreq 0.2
set ylabel "CDF" offset 2,0,0
set xlabel "Rbuf (KB)"
set key right bottom
set title "(b)" font ",60"
plot "QUIC/bucket2" using ($2/1000):5 with lines lc rgb "red" linewidth 28 title "QUIC", "TCP/bucket2" using ($2/1000):5 with lines lc rgb "blue" linewidth 28 title "TCP"



set size 1,1.2
set origin 2.6, 0.0
set xtics autofreq 300
set ytics autofreq 0.2
set ylabel "CDF" offset 2,0,0
set xlabel "Rbuf (KB)"
set key right bottom
set title "(c)" font ",60"
plot "QUIC/bucket3" using ($2/1000):5 with lines lc rgb "red" linewidth 28 title "QUIC", "TCP/bucket3" using ($2/1000):5 with lines lc rgb "blue" linewidth 28 title "TCP"

unset multiplot