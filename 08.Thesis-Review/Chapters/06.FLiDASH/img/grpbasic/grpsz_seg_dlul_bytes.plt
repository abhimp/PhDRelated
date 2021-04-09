set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grpsz_seg_dlul_bytes.eps"


set size 1, 0.8

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram cluster gap 1
set style data histograms
#set xtics rotate by -45
set bars 0.5

set key top center horizontal samplen 2

colors = "red blue"
files = "intra inter"
legend = "IntraCoalition InterCoalition"

set ylabel "Downloaded data (GB)"
set xlabel "Coalition Size"

#set xrange [2.5:10.5]

set yrange [0:]

tics = "3 4 5 6 7 8 9 10"

set xtics()



plot \
         "./GroupSize/segWatage/segUse.dat" u ($3/1000000000):xtic(1) lc rgb "red" t "Downloaded", \
         "" u ($5/1000000000)  lc rgb "blue" t "Played"
