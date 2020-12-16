set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "EnergyConsumption.eps"


set size 1, 0.6

set boxwidth 0.9
set style fill solid 1.00 border 0
set style histogram cluster gap 1
set style data histograms
set xtics rotate by 0 font 'Helvetica Bold,20'
set bars 0.5

set key top center horizontal samplen 2
set key out top center horizontal samplen 2 nobox font ",20" width -3

colors = "black red blue magenta green #800000"
abrs = "bola pensieve fmpc rmpc"
legends = "B P F R"

colors = "red blue"
set grid ytics lc rgb "gray" lw 1

set ytics 0.2
set y2tics
set yrange [0:]
set y2range [0:2000]
set ylabel "Energy (kJ)"
set y2label "Time (s)"

set xtics font ",18"

plot "./EnergyConsumption.dat" u ($2/1000000):xtic(1) lc rgb "blue" t "Energy Consumption", \
    "./EnergyConsumption.dat" u 3:xtic(1) lc rgb "red" axes x1y2 t "Extra Time"



