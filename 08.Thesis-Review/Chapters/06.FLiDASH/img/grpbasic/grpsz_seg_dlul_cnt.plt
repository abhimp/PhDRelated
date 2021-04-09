set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grpsz_seg_dlul_cnt.eps"


set size 1, 0.8

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram cluster gap 5
set style data histograms
#set xtics rotate by -45
set bars 0.5

set key top center horizontal samplen 2

colors = "red blue"
files = "intra inter"
legend = "IntraCoalition InterCoalition"

set ylabel "#Segments"
set xlabel "Coalition Size"

#set xrange [2.5:10.5]

set yrange [0:20200]

tics = "3 4 5 6 7 8 9 10"

set xtics()

set ytics 4000



plot \
         "./GroupSize/segWatage/segUse.dat" u 2:xtic(1) lc rgb "red" t "Downloaded", \
         "" u 4 lc rgb "blue" t "Played"

#plot for [i=1:words(files)] "./GroupSize/segWatage/segUse.dat" u ($1/1):((i*2 +1)/1) lc rgb word(colors, i) t word(legend, i)
