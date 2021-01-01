set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "RT_box.eps"
set size 1, 0.8
set nokey #top left horizontal samplen 2
set bmargin 3

set style fill solid border -1
set style boxplot outliers pointtype 7
set style boxplot nooutliers
set style data boxplot

set yrange [-0.1:0.8]
set ytics 0.2

set ylabel "Rebuf time (seconds)"

set xtics ("HTTP" 1, "QUIC" 2)

plot \
         './otherdata2/http_rebuf_box' using (1):1 title "1" lc rgb "blue", \
         './otherdata2/quic_rebuf_box' using (2):1 title "2" lc rgb "red", \

