set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "AQV_box.eps"
set size 1, 0.8
set nokey #top left horizontal samplen 2
set bmargin 3

set style fill solid border -1
set style boxplot outliers pointtype 7
set style boxplot nooutliers
set style data boxplot

#set yrange [60:1400]
set yrange [60:]
set ylabel "Average bitrate variation (kbps)"

set xtics ("HTTP" 1, "QUIC" 2)

plot \
         './otherdata2/http_aqv_box' using (1):1 title "1" lc rgb "blue", \
         './otherdata2/quic_aqv_box' using (2):1 title "2" lc rgb "red", \

