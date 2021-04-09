set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grpsz_segFreq.eps"


set size 1, 0.8

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram cluster gap 1
set style data histograms
#set xtics rotate by -45
set bars 0.5

set key top right samplen 2

colors = "black red blue magenta brown #800000 black red blue magenta brown #800000"
files = "3 5 7 9"
legend = "3 5 7 9"

set ylabel "% of segments"
set xlabel "# of uses of a downloaded segments"


set xtics 2

set key Left box title "Coalition\nSize"

plot for [i=1:words(files)] './GroupSize/segWatage/GrpDeterRm_'.word(files, i).'_pmf.dat' u 2:xtic(1) lc rgb word(colors, i) title "   ".word(legend, i)
#plot for [i=1:words(files)] './GroupSize/segWatage/GrpDeterRm_'.word(files, i).'_cnt.dat' u ($2/1):(i) w l lw 9 lc rgb word(colors, i) title "   ".word(legend, i)
