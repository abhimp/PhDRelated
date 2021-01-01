set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "AQ_cmf.eps"
set size 1, 0.8

set key top left  samplen 2
set bmargin 3


#set yrange [-1000:1000]
#et xrange [-1000:]

set xlabel "Average Video Bitrate (kbps)"


plot \
         './otherdata/http_aq_cmf' using 1:2 w l lw 9 title "HTTP", \
         './otherdata/quic_aq_cmf' using 1:2 w l lw 9 title "QUIC", \

