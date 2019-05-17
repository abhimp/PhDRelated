set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "avgbitrate_var_cdf_1.eps"
set size 1, 0.9
set bmargin 3
set key bottom right  samplen 2
set ylabel "CDF"
set xlabel "Bitrate (mbps)"

#set xrange [0:5]

colors = "black red blue magenta green #800000"
files = "BOLA Penseiv RobustMPC DHTEnvironment GrpDeter"
legend = "BOLA Pensieve MPC DHT CoaliDASH"

plot for [i=1:words(files)] 'comparison/Average_Bitrate_Variation/'.word(files, i).'_cmf.dat' u ($1/1000000):2 w lines lw 9 lc rgb word(colors, i) title word(legend, i)
