set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "qoe_cdf_flsd.eps"
set size 1, 0.8
set bmargin 3
set key top left  samplen 2
set ylabel "CDF"
set xlabel "QoE"

#set xrange [-3:]

colors = "brown #800000"
files = "GrpDeterRm"
legend = "FLiDASH"

set arrow from 1.4,0.34 to 1.4,0.21 head lw 9
set label "Coalitions are formed" at 1.3,0.38
plot for [i=1:words(files)] 'comparison/QoE/'.word(files, i).'_cmf.dat' u ($1/1):2 w lines lw 9 lc rgb word(colors, i) title word(legend, i)
