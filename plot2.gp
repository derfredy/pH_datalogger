set datafile separator ','
set xdata time
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%d-%m"
set yrange [6:8]
set ylabel word("pH", 1)
set title "pH Control"
set xlabel word("Date", 1)
set xrange ['05/10/2023 00:00:00':'15/10/2023 00:00:00']
set xtics rotate by 45 offset '-1.8','-1.6'
set arrow from graph 0,first 7.1 to graph 1,first 7.1 nohead lc rgb 'grey' back
set arrow from graph 0,first 6.9 to graph 1,first 6.9 nohead lc rgb 'grey' back
set key opaque top left autotitle columnheader
set grid ytics mytics
set mytics 5
show grid
set style fill transparent solid 0.5 noborder
plot 'ph_data.csv' using 1:2 lt rgb 'red' with lines , \
     'ph_data.csv' using 1:($3*8) with boxes lc rgb '#01FFFF' 

