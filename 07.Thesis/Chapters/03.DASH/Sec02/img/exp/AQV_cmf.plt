set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "AQV_cmf.eps"
set size 1, 0.8

set key top left  samplen 2
set bmargin 3


#set yrange [-1000:1000]
#et xrange [-1000:]

set xlabel "Average Video Bitrate Variation (kbps)"


plot \
         './otherdata/http_aqv_cmf' using 1:2 w l lw 9 title "HTTP", \
         './otherdata/quic_aqv_cmf' using 1:2 w l lw 9 title "QUIC", \

