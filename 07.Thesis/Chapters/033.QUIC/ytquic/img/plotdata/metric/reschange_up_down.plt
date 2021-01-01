set terminal postscript eps enhanced color font 'Helvetica,Bold' 40
set output "reschange_up_down.eps"
set size 2.45,1.3
set yrange [0:300]
set ytics autofreq 60
set key top horizontal
set multiplot 
set lmargin 2



set size 1.1, 1.3
set origin 0.15, 0.0
set ylabel 'Number of Occurence' offset 2,0,0
set xlabel 'Quality switch (from-to)'
set style data histogram
set style fill solid border
set style histogram clustered
set xtics rotate by -45
set title "(a)" font ",50"
plot  'QUIC_reschanges_up.dat' using 2:xtic(1) ti "QUIC" lc "red",  'TCP_reschanges_up.dat' using 2:xtic(1) ti "TCP" lc "blue" 


set size 1.1, 1.3
set origin 1.35, 0.0
set ylabel 'Number of Occurence' offset 2,0,0
set xlabel 'Quality switch (from-to)'
set style data histogram
set style fill solid border
set style histogram clustered
set xtics rotate by -45
set title "(b)" font ",50"
plot  'QUIC_reschanges_down.dat' using 2:xtic(1) ti "QUIC" lc "red",  'TCP_reschanges_down.dat' using 2:xtic(1) ti "TCP" lc "blue" 
