set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "benefit_qoe_box_1.eps"
set size 1, 0.9
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

#set key top left samplen 2
set ylabel "QoE Benefit"
#set xlabel "Bitrate"

set yrange [-5:5]

set grid ytics lc rgb "gray"

colors = "black red blue magenta green #800000"
files = "BOLA Penseiv RobustMPC DHTEnvironment"
legend = "BOLA Pensieve MPC DHT"

set xtics()
set for [i=1:words(files)] xtics add (word(legend, i) i)

plot for [i=1:words(files)] './benefit/QoE/'.word(files, i).'.dat' u (i):1 lc rgb word(colors, i) notitle
