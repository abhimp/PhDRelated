set terminal postscript eps enhanced color font 'Helvetica Bold,25'
set output "cdnuploadcnt_1.eps"
set size 1, 0.8
set bmargin 3
set key top left  samplen 2
set xlabel "Minutes"
set ylabel "# download"


set xrange [0:60]

colors = "black red blue magenta brown #800000"
files = "BOLA Penseiv RobustMPC DHTEnvironment GrpDeterRm"
legend = "BOLA Pensieve MPC DHT FLiDASH"

plot for [i=1:words(files)] 'comparison/cdnUploaded/'.word(files, i).'_cnt.dat' u ($1/60000):2 w lines lw 9 lc rgb word(colors, i) title word(legend, i)
