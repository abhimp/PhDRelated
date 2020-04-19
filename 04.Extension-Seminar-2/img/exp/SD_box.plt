set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "SD_box.eps"
set size 1, 0.8
set nokey #top left horizontal samplen 2
set bmargin 3

set style fill solid 0.25 border -1
set style boxplot outliers pointtype 7
set style data boxplot

set yrange [3:7.5]

set ylabel "Startup Delay (sec)"

set xtics ("HTTP" 1, "QUIC" 2)

plot \
         './otherdata/http_startup_delay_box' using (1):1 title "1", \
         './otherdata/quic_startup_delay_box' using (2):1 title "2", \

