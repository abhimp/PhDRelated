set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grpsz_contri_cnt.eps"

set size 1, 0.8
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot nooutliers
set style data boxplot

#set key top left samplen 2
set ylabel "Download share in coalition (%)" font ',23'
#set xlabel "GroupSize"
set xlabel "Coalition Size"

#set yrange [-2:5]
set yrange [:50]
set xrange [2.2:10.8]


colors = "black red blue magenta brown #800000"
files = "3 4 5 6 7 8 9 10"
legend = "3 4 5 6 7 8 9 10"

set xtics()
#set for [i=1:words(files)] xtics add (word(legend, i) i)

fs(x) = 100*(1/x)

plot i=3 'GroupSize/Group_Contri_Ratio/GrpDeterRm_'.i.'.dat' u (i):($2 * 100) lc rgb "blue" t "Share", \
            for [i=4:words(files)+2] 'GroupSize/Group_Contri_Ratio/GrpDeterRm_'.i.'.dat' u (i):($2 * 100) lc rgb "blue" notitle, \
            fs(x) w l lw 4 lc rgb "red" t "Theoritical Bound"
