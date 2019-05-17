set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "grpsz_upload_download.eps"

set size 1, 0.8

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram errorbars gap 2 lw 1
set style data histograms
set xtics rotate by -45
set bars 0.5

colors = "red blue"
files = "upload download"
legend = "Upload Download"

set key top center horizontal samplen 2

set ylabel "Average data transfer (MB)"
set xlabel "GroupSize"

tics = "3 4 5 6 7 8 9 10"

set xtics()
set for [i=1:words(tics)] xtics add (word(tics, i) i-1)

plot for [i=1:words(files)] "./GroupSize/".word(files, i).".dat" u ($4/1000000):($3/1000000) lc rgb word(colors, i) t word(legend, i)
