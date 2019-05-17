set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "stalltime_box_1.eps"
set size 1, 0.9
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

#set key top left samplen 2
set ylabel "Stall Time (seconds)"

set yrange [-10:80]


colors = "black red blue magenta green #800000"
files = "BOLA Penseiv RobustMPC DHTEnvironment GrpDeter"
legend = "BOLA Pensieve MPC DHT CoaliDASH"

set xtics()
set for [i=1:words(files)] xtics add (word(legend, i) i)

plot for [i=1:words(files)] 'comparison/Stall_Time/'.word(files, i).'.dat' u (i):($2/1) lc rgb word(colors, i) notitle
