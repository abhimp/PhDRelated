set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grpsz_qoe.eps"

set size 1, 0.8
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

#set key top left samplen 2
set ylabel "QoE"
#set xlabel "GroupSize"
set xlabel "Coalition Size"

set yrange [-2:5]


colors = "black red blue magenta brown #800000"
files = "3 4 5 6 7 8 9 10"
legend = "3 4 5 6 7 8 9 10"

set xtics()
set for [i=1:words(files)] xtics add (word(legend, i) i)

plot for [i=1:words(files)] './GroupSize/qoe/GrpDeterRm_'.word(files, i).'.dat' u (i):($2/1) lc rgb "blue" notitle
