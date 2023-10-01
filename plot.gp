set datafile separator ','
set xdata time
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%d-%m %Hh"
set yrange [5:8]
set ylabel word("pH", 1)
set title "pH Control"
set xlabel word("Date", 1)
set xtics rotate by 45 offset '-1.8','-2.6'
set key top left autotitle columnheader
set grid
show grid
plot 'plot.csv' using 1:2 lt rgb 'red' with lines , \
     'plot.csv' using 1:($3*7) pt 7 ps 1 lt rgb 'blue' 
