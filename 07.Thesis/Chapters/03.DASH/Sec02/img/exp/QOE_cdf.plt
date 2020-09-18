set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "QOE_cdf.eps"
set size 1, 0.8

set key top left  samplen 2
set bmargin 3


#set yrange [-1000:1000]
set xrange [-1000:]

set xlabel "QOE"


plot \
         './QOE/http_lin_cdf' using 1:2 w l lw 9 title "HTTP Lin", \
         './QOE/http_log_cdf' using 1:2 w l lw 9 title "HTTP Log", \
         './QOE/quic_lin_cdf' using 1:2 w l lw 9 title "QUIC Lin", \
         './QOE/quic_log_cdf' using 1:2 w l lw 9 title "QUIC Log" \

