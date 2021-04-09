set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "corenetwork_1.eps"
set size 1, 0.8
set bmargin 3
set key bottom right  samplen 2
set xlabel "Minutes"
set ylabel "Utilization (%)"


set xrange [0:60]

colors = "black red blue magenta brown #800000"
files = "BOLA Penseiv RobustMPC DHTEnvironment GrpDeterRm"
legend = "BOLA Pensieve MPC DHT FLiDASH"

plot for [i=1:words(files)] 'comparison/coreNetworkUsage/'.word(files, i).'.dat' u ($1/60000):($2/1000000/5.0) w lines lw 9 lc rgb word(colors, i) title word(legend, i)
