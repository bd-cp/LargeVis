if [ $(uname) = "Darwin" ] && [ $(arch) = "arm64" ]; then
    echo "MacOS with M1 compatible CPU"
    sed -i '' 's/lseek64/lseek/g' ANNOY/annoylib.h
    g++ LargeVis.cpp main.cpp -o LargeVis -lm -pthread -lgsl -lgslcblas -Ofast -mcpu=apple-m1 -ffast-math -L/usr/local/lib -I/usr/local/include $(gsl-config --cflags)  $(gsl-config --libs)
else
    g++ LargeVis.cpp main.cpp -o LargeVis -lm -pthread -lgsl -lgslcblas -Ofast -march=native -ffast-math
fi