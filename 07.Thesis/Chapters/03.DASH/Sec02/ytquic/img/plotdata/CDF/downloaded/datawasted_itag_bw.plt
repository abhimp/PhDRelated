set terminal postscript eps enhanced color "Helvetica Bold" 40
set output "data_wasted_itag_bw.eps"
set size 2.45,1.3
set multiplot 
set lmargin 2



set size 1.1,1.3
set origin 0.2,0
set title "(a)" font ",50"
set ylabel "Data Wasted (%)"
set xlabel "itag"
set boxwidth 1
set style data histograms
set style fill solid border
set style histogram cluster gap 1
set key right
plot "QUIC/DataCombined" using 4:xtic(1) title "QUIC" lt rgb "red","TCP/DataCombined" using 4 title "TCP" lt rgb "blue"


set size 1.1, 1.3
set origin 1.45,0
set title "(b)" font ",50"
set ylabel 'Data wasted (%)'
set xlabel 'Bandwith (kbps)'
set style data histogram
set style fill solid border
set style histogram clustered
set xtics rotate by -45
plot  'datawasted-QUIC.dat' using 3:xtic(1) ti "QUIC" lc "red",  'datawasted-TCP.dat' using 3:xtic(1) ti "TCP" lc "blue" 
