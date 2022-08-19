OS:=$(shell uname -s)

SRC=functors.cpp
OUT=$(SRC:.cpp=.o)

%.o: %.cpp
	g++ $< -c -fPIC -o $@

ifeq ($(OS),Linux)
libfunctors.so: $(OUT)
	g++ -shared -o $@ $^

all: libfunctors.so
endif

ifeq ($(OS),Darwin)
libfunctors.dylib: $(OUT)
	g++ -dynamiclib -install_name $@ -o $@ $^

all: libfunctors.so
endif

.PHONY: clean

clean:
	rm -f *.o *.so *.dylib
