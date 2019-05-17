set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grp_buflen.eps"
set size 1, 0.9
set bmargin 3

set ylabel "Buffer Length (seconds)"
set xlabel "Time (senconds)"

set key top right samplen 2

set yrange [-1:60]
set xrange [2070:2170]

colors = "black red blue magenta"
files = "13625 4550 2828 8143"
legend = "1 2 3 4"

plot for [i=1:words(files)] './data/'.word(files, i).'_groupP2PBasic_bufferLen.dat' w lp lc rgb word(colors, i) lw 5 pt 7 ps 1.5 title word(legend, i).''

quit
