set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "RT_cmf.eps"
set size 1, 0.8

set key bottom right  samplen 2
set bmargin 3


#set yrange [-1000:1000]
set xrange [-10:]

set xlabel "Rebuffing Time (sec)"


plot \
         './otherdata/http_rebuf_cmf' using 1:2 w l lw 9 title "HTTP", \
         './otherdata/quic_rebuf_cmf' using 1:2 w l lw 9 title "QUIC", \

