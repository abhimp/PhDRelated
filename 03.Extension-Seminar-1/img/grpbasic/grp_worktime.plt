set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grp_worktime.eps"
set size 1, 0.9
set bmargin 3

set ylabel "Throughput (BPS)"
set xlabel "Time (seconds)"

set key top left samplen 2

set yrange [-100000:]
set xrange [2070:2170]

# set xtics ("MPTCP\\nBest" 1, "MPTCP\\nWorst" 2, "MPQUIC" 3, "TCP" 4, "QUIC" 5)
colors = "black red blue magenta"
files = "13625 4550 2828 8143"
legend = "1 2 3 4"

plot for [i=1:words(files)] './data/'.word(files, i).'_groupP2PBasic_workingTime.dat' w fstep lc rgb word(colors, i) lw 5 title word(legend, i), \
     for [i=1:words(files)] './data/'.word(files, i).'_groupP2PBasic_workingTime.dat' w p pt 7 ps 1.5 lc rgb word(colors, i) lw 5 notitle


quit
