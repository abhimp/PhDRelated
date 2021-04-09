set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "BuffOccu.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

set key bottom right samplen 2
#set xlabel "Bitrate"

#set yrange [0:5000]

#set ytics 1

colors = "black red blue magenta green #800000"
abrs = "bola pensieve fmpc rmpc"
legends = "BOLA Pensieve F-MPC R-MPC"

set ylabel "P(X < x)"
set xlabel "Buffer Occupancy (s)"
set xrange [0:200]

set xtics()
#set for [i=1:words(abrs)] xtics add (word(legends, i) 2*i, word(legends, i)."-L" 2*i+1)

plot \
    'bola/buffer_occupancy_cmf.dat' u 1:2 w l lw 7 lc rgb word(colors, 1) t "EnDASH", \
    for [i=1:words(legends)] word(abrs, i).'/buffer_occupancy_ms_cmf.dat' u 1:2 w l lw 7 lc rgb word(colors, i+1) t word(legends, i)

#[[1, 'QoEs'], [2, 'totalEnergies'], [3, 'totalTimes'], [4, 'totalStallTime'], [5, 'videoDuration'], [6, 'avgBitrate'], [7, 'avgSmoothness']]
