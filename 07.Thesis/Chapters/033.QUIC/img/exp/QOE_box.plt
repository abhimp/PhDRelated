set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "QOE_box.eps"
set size 1, 0.8
set nokey #top left horizontal samplen 2
set bmargin 3

set style fill solid border -1
set style boxplot outliers pointtype 7
set style boxplot nooutliers
set style data boxplot

set yrange [-2:]
set ylabel "QoE"
set ytics 1

set xtics ("HTTP\nLin" 1, "HTTP\nLog" 2, "QUIC\nLin" 3, "QUIC\nLog" 4)

plot \
         './QOE2/http_lin_box' using (1):1 title "1" lc rgb "blue", \
         './QOE2/http_log_box' using (2):1 title "2" lc rgb "blue", \
         './QOE2/quic_lin_box' using (3):1 title "3" lc rgb "red", \
         './QOE2/quic_log_box' using (4):1 title "4" lc rgb "red" \

