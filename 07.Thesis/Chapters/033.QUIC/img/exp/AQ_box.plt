set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "AQ_box.eps"
set nokey #top left horizontal samplen 2
set size 1, 0.8
set bmargin 3

set style fill solid border -1
set style boxplot outliers pointtype 7
set style boxplot nooutliers
set style data boxplot

#set yrange [500:4500]

set ylabel "Average bitrate (kbps)"

set xtics ("HTTP" 1, "QUIC" 2)

plot \
         './otherdata2/http_aq_box' using (1):1 title "1" lc rgb "blue", \
         './otherdata2/quic_aq_box' using (2):1 title "2" lc rgb "red", \

