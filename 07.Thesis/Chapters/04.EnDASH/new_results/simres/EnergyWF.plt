set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "EnergyWF.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 0.75 border -1
set style boxplot nooutliers
set style data boxplot


set yrange [-.200:2.500]

set ytics 1

colors = "black red blue magenta green #800000"
abrs = "bola pensieve fmpc rmpc fixed"
legends = "B P MF MR Fixed"

set ylabel "Energy Consumption (kJ)"

set xtics() font ',20'
set for [i=1:words(abrs)] xtics add (word(legends, i) i)
set xtics add ("EnDASH" 0)

plot \
    'bola/PowerEnv.dat' u (0):($2/1000000) lc rgb word(colors, 1) notitle, \
    for [i=1:words(legends)] word(abrs, i).'/PowerMeasure.dat' u (i):($2/1000000) lc rgb word(colors, i+1) notitle

#[[1, 'QoEs'], [2, 'totalEnergies'], [3, 'totalTimes'], [4, 'totalStallTime'], [5, 'videoDuration'], [6, 'avgBitrate'], [7, 'avgSmoothness']]
