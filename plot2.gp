set datafile separator ','
set xdata time
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%d-%m"
set yrange [6:8]
set ylabel word("pH", 1)
set title "pH Control"
set xlabel word("Date", 1)
#set xrange ['07/10/2023 00:00:00':'11/10/2023 00:00:00']
set tics front
set xtics rotate by 45 offset '-2.8','-1.6'
set mxtics 6
set grid ytics mytics
show grid
set arrow from graph 0,first 7.1 to graph 1,first 7.1 nohead lc rgb 'grey' back
set arrow from graph 0,first 7.0 to graph 1,first 7.0 nohead lc rgb 'grey' back
set key opaque top left
set style fill transparent solid 0.5 noborder
set timestamp

set term png
set output "ph.png"

plot '< tail -n 400 ph_data.csv' using 1:($3*8) with boxes lc rgb '#01FFFF' title 'valve on', \
     '< tail -n 400 ph_data.csv' using 1:2 lt rgb 'red' with lines title 'pH data'
