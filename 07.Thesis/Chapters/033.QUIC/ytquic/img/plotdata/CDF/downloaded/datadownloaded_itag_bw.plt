set terminal postscript eps enhanced color "Helvetica Bold" 40
set output "data_dowloaded_itag_bw.eps"
set size 2.45,1.3
set multiplot 
set lmargin 2



set size 1.1,1.3
set origin 0.2,0
set ylabel "Data Downloaded (Mb)" offset 2,0,0
set xlabel "itag"
set boxwidth 1
set style data histograms
set style fill solid border
set style histogram cluster gap 1
set ytics autofreq 5000
set key left
set title "(a)" font ",50"
plot "QUIC/DataDownloaded" using ($2/(1024*1024*8)):xtic(1) title "QUIC" lt rgb "red","TCP/DataDownloaded" using ($2/(1024*1024*8)) title "TCP" lt rgb "blue"


set size 1.1, 1.3
set origin 1.45,0
set ylabel 'Data downloaded (MB)' offset 2,0,0
set xlabel 'Bandwith (kbps)'
set style data histogram
set style fill solid border
set style histogram clustered
set ytics autofreq 2500
set xtics rotate by -45
set key left
set title "(b)" font ",50"
plot  'datadownloaded-QUIC.dat' using ($3/(1024*1024)):xtic(1) ti "QUIC" lc "red",  'datadownloaded-TCP.dat' using ($3/(1024*1024)):xtic(1) ti "TCP" lc "blue" 