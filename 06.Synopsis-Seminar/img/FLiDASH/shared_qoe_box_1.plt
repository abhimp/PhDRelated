set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "shared_qoe_box_1.eps"
set size 1, 0.5
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

#set key top left samplen 2
set ylabel "QoE"

set yrange [-2:4]


colors = "black red blue magenta brown #800000"
files = "BOLA Penseiv RobustMPC DHTEnvironment GrpDeterRm"
legend = "BOLA Pensieve MPC DHT FLiDASH"

set ytics 2

set xtics()
set for [i=1:words(files)] xtics add (word(legend, i) i)

plot for [i=1:words(files)] 'shared_QoE/'.word(files, i).'.dat' u (i):($2) lc rgb word(colors, i) notitle
