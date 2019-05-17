set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grpsz_fairness.eps"


set size 1, 0.9

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram errorbars gap 5 lw 1
set style data histograms
#set xtics rotate by -45
set bars 0.5

set key top center horizontal samplen 2

colors = "red blue"
files = "intra inter"
legend = "IntraGroup InterGroup"

set ylabel "Jain fairness index"
#set xlabel "GroupSize"
set xlabel "GroupSize"

tics = "Grp"

tics = "3 4 5 6 7 8 9 10"

set xtics()
set for [i=1:words(tics)] xtics add (word(tics, i) i-1)


set yrange[0.9:1.02]

plot for [i=1:words(files)] "./fairness/".word(files, i) u ($4/1):($3/1) lc rgb word(colors, i) t word(legend, i)
