set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "qoe_box_1.eps"
set size 1, 0.9
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

#set key top left samplen 2
set ylabel "QoE"

set yrange [-20:5]


colors = "black red blue magenta green #800000"
files = "BOLA Penseiv RobustMPC DHTEnvironment GrpDeter"
legend = "BOLA Pensieve MPC DHT CoaliDASH"

set xtics()
set for [i=1:words(files)] xtics add (word(legend, i) i)

plot for [i=1:words(files)] 'comparison/QoE/'.word(files, i).'.dat' u (i):($2) lc rgb word(colors, i) notitle
