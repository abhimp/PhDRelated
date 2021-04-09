set terminal postscript eps enhanced color "Helvetica,Bold" 25
set output "plot_itag_pdf_bucket2.eps"
set yrange [0:0.6]
#set lmargin 2

set size 1,0.8
#set origin 1.9, 0.0
set xlabel "itag"
set ylabel "PDF" offset 2,0,0
set ytics autofreq 0.2
unset key
set boxwidth 1
set style data histograms
set style fill solid border
set style histogram cluster gap 1
set key left
#set title "(b)" font ",50"
plot "QUIC/bucket2" using 4:xtic(2)  lc rgb "red" title "QUIC", "TCP/bucket2" using 4 lc rgb "blue" title "TCP"
