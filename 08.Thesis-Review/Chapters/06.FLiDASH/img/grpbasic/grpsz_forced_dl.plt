set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grpsz_forced_dl.eps"

set size 1, 0.8
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

#set key top left samplen 2
set ylabel "Forced self download (%)" font ',23'
#set xlabel "GroupSize"
set xlabel "Coalition Size"

#set yrange [-2:5]
set yrange [:50]


colors = "black red blue magenta brown #800000"
files = "3 4 5 6 7 8 9 10"
legend = "3 4 5 6 7 8 9 10"

set xtics()
set for [i=1:words(files)] xtics add (word(legend, i) i)

plot for [i=1:words(files)] 'GroupSize/Force_Download_Ratio/GrpDeterRm_'.word(files, i).'.dat' u (i):($2*100) lc rgb "blue" notitle
