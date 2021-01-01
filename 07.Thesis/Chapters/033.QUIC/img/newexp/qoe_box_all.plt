set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "qoe_box_all.eps"
set size 1, 0.8
set bmargin 3

set style fill solid 1 border -1
set style boxplot nooutliers
set style data boxplot

set boxwidth 0.28

#set key top left samplen 2
set ylabel "QoE"

#set title "Average playback bitrate"


prots = "http quic"
modes = "Lin Log"

legend = "HTTP\nLin HTTP\nLog QUIC\nLin QUIC\nLog"
color = "blue red"

#set yrange [-2:4]

#set xtics()
#set for [i=1:words(legend)] xtics add (word(legend, i) i)
set xtics ("HTTP\nLin" 1, "HTTP\nLog" 2, "QUIC\nLin" 3, "QUIC\nLog" 4)

#plot \
#         for [i=1:words(prots)] for [j=1:words(modes)] 'newdata/qoe'.word(modes, j).'_Bola_'.word(prots, i).'.dat' u ((i-1)*2+j):1 lc rgb word(color, i) notitle

plot \
         'newdata/qoeLin_Bola_http.dat' u (1):1 lc rgb "blue" notitle, \
         'newdata/qoeLin_Bola_quic.dat' u (3):1 lc rgb "red" notitle, \
         'newdata/qoeLog_Bola_http.dat' u (2):1 lc rgb "blue" notitle, \
         'newdata/qoeLog_Bola_quic.dat' u (4):1 lc rgb "red" notitle, \
