set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "smooth_box.eps"
set size 1, 0.8
set bmargin 3
set lmargin 7

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set boxwidth 0.28

set yrange [.060:1.000]
set ylabel "Average bitrate variation\n(mbps)" offset 2,0,0


abrs = "Buffer_Based Festive Fixed_Rate_0 MPC_Fast MPC_Robust Pensieve Rate_Based"
prots = "http quic"

legend = "BB F FR MF MR P RB"

abrs = "Bola Buffer_Based MPC_Fast MPC_Robust Pensieve"
legend = "B BB MF MR P"

set xtics()
set for [i=1:words(legend)] xtics add (word(legend, i) i)

plot for [i=1:words(abrs)] 'data/smoothness_'.word(abrs, i).'_http.dat' u (i-0.15):($1/1000) lc rgb "blue" notitle, \
        for [i=1:words(abrs)] 'data/smoothness_'.word(abrs, i).'_quic.dat' u (i+0.15):($1/1000) lc rgb "red" notitle, \
        NaN lc rgb "blue" lw 7 t "TCP", NaN lc rgb "red" lw 7 t "QUIC"

