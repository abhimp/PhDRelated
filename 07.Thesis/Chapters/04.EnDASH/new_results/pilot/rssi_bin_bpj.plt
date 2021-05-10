set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "rssi_bin_bpj.eps"


set size 1, 0.6

# set boxwidth 0.9
# set style fill solid 1.00 border 0
# set style histogram errorbars gap 1 lw 1
# set style data histograms
# #set xtics rotate by -45
# set bars 0.5

set key top right vertical samplen 2 font ",20"

colors = "red blue"
files = "intra inter"

legend = "Intra-Coalition Inter-Coalition"

set grid ytics lc rgb "gray" lw 1

set y2tics 200


set xlabel "RSSI Bins"
set ylabel "Data Downloaded \nper Energy (Mb/J)" font ",23"

plot "rssi_bin.dat" u 1:($4*8/$5) w lp lw 7 lc rgb "red" t "Data Transfered per Joule"

