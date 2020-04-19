set terminal postscript eps enhanced color font 'Helvetica Bold,12'
set output "bandwidthComp.eps"

set size 1, 0.6
set key bottom

set xlabel "Sample number"
set ylabel "Througput (Kbps)"

set ytics 50
plot "withthr.csv" u 1:3 w l lw 9 t "HTTP", "" u 1:2 w l lw 9 t "QUIC"
