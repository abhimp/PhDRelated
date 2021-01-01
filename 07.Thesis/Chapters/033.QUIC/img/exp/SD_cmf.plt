set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "SD_cmf.eps"
set size 1, 0.8

set key top left  samplen 2
set bmargin 3


#set yrange [-1000:1000]
#et xrange [-1000:]

set xlabel "Startup·Delay·(sec)"


plot \
         './otherdata/http_startup_delay_cmf' using 1:2 w l lw 9 title "HTTP", \
         './otherdata/quic_startup_delay_cmf' using 1:2 w l lw 9 title "QUIC", \

