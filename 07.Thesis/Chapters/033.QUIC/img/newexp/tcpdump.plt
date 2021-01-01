
set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "throughput.eps"

set key top right samplen 2
set size 1, 0.8
set bmargin 3


#set yrange [-1000:1000]
#et xrange [-1000:]

set xlabel "Time (seconds)"
set ylabel "Througput (mbps)"

prots = "http quic"

abrs = "Buffer_Based Festive Fixed_Rate_0 MPC_Fast MPC_Robust Pensieve Rate_Based"
legend = "BB F FR MF MR P RB"

abrs = "Buffer_Based MPC_Fast MPC_Robust Pensieve"
legend = "BB MF MR P"

#array ptypes = [5, 7, 9, 13]

#set xrange [0:200]


plot \
    'data/tcpdump-quic.dat' u 1:($2/1000000) w l lw 7 lc rgb "red" t "QUIC", \
    'data/tcpdump-http.dat' u 1:($2/1000000) w l lw 7 lc rgb "blue" t "HTTP" \


#plot for [i=1:words(abrs)] 'data/rebuf_'.word(abrs, i).'_http_cdf.dat' u 1:2 w p pt ptypes[i] ps 2 lc rgb "blue" notitle, \
#        for [i=1:words(abrs)] 'data/rebuf_'.word(abrs, i).'_quic_cdf.dat' u 1:2 w p pt ptypes[i] ps 2 lc rgb "red" notitle, \
#        for [i=1:words(abrs)] NaN w lp pt ptypes[i] ps 2 lc "black" t word(legend, i), \
#        NaN lc rgb "blue" lw 7 t "HTTP", NaN lc rgb "red" lw 7 t "QUIC"

