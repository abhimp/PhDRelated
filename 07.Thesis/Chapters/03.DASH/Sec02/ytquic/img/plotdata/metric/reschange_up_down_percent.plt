set terminal postscript eps enhanced color font 'Helvetica,Bold' 40
set output "reschange_up_down_percent.eps"
set size 2.5,1.3
set yrange [-140:60]
set ytics autofreq 40
set multiplot 
set lmargin 2


set size 1.1, 1.3
set origin 0.2, 0.0
set ylabel "% PQSRQ" offset 2,0,0
set xlabel 'Quality switch (from-to)'
set style data histogram
set style fill solid border
set style histogram clustered
set xtics rotate by -45
set grid ytics
set title "(b)" font ",50"
plot  'reschanges_up.dat' using (($3-$2)*100.0/$3):xtic(1) notitle lc "red"


set size 1.1, 1.3
set origin 1.4, 0.0
set ylabel "% PQSRQ" offset 2,0,0
set xlabel 'Quality switch (from-to)'
set style data histogram
set style fill solid border
set style histogram clustered
set xtics rotate by -45
set grid ytics
set title "(a)" font ",50"
plot  'reschanges_down.dat' using (($3-$2)*100.0/$3):xtic(1) notitle lc "red"
