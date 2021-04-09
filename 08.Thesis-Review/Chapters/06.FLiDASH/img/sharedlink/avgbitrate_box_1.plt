set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "avgbitrate_box_1.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

#set key top left samplen 2
set ylabel "Bitrate (mbps)"
#set xlabel "Bitrate"

set yrange [0:4.3]

set ytics 1

colors = "black red blue magenta brown #800000"
files = "BOLA Penseiv RobustMPC DHTEnvironment GrpDeterRm"
legend = "BOLA Pensieve MPC DHT FLiDASH"

set xtics()
set for [i=1:words(files)] xtics add (word(legend, i) i)

plot for [i=1:words(files)] 'comparison/Average_bitrate_played/'.word(files, i).'.dat' u (i):($2/1000000) lc rgb word(colors, i) notitle
