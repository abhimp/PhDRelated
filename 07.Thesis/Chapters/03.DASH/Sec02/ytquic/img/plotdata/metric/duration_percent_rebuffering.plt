set terminal postscript eps enhanced color font 'Helvetica,Bold' 40
set output "time_duration_percent_rebuffering.eps"
set size 2.5,1.3
#set yrange [-140:60]
#set ytics autofreq 40
set multiplot 
set lmargin 2


set size 1.1, 1.3
set origin 0.1, 0.0
set ylabel '% of total playback duration' offset 2,0,0
set xlabel 'Itag (Quality)'
set style data histogram
set style fill solid border
set style histogram clustered
set ytics autofreq 20
set key left top 
set title "(a)" font ",50"
plot  'QUIC_timeduration.dat' using 5:xtic(1) ti "QUIC" lc "red",  'TCP_timeduration.dat' using 5:xtic(1) ti "TCP" lc "blue" 

set size 1.1, 1.3
set origin 1.4, 0.0
set ylabel 'Number of Rebuffer Occurs' offset 2,0,0
set xlabel 'Bandwidth (Kbps)'
set ytics autofreq 400
set style data histogram
set style fill solid border
set style histogram clustered
set title "(b)" font ",50"
set key right top
plot  'QUIC_rebuffering.dat' using 1:xtic(3) ti "QUIC" lc "blue",  'TCP_rebuffering.dat' using 1:xtic(3) ti "TCP" lc "red" 
