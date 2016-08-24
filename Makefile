CC=/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc
LDFLAGS=
BUILD_FOLDER=/build
CFLAGS=-c -Wall -I$(BUILD_FOLDER)
SOURCES=$(wildcard *.cpp)
OBJDIR=$(BUILD_FOLDER)/bin
_OBJECTS=$(SOURCES:.cpp=.o)
OBJECTS := $(addprefix $(OBJDIR)/,$(_OBJECTS))

EXECUTABLE=$(OBJDIR)/hello

all: clean $(SOURCES) $(EXECUTABLE)
    
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJDIR)/*.o -o $@ 

# .cpp.o:
$(OBJDIR)/%.o : %.cpp
	$(CC) $(CFLAGS) $< -o $@

clean:
	-rm -f $(OBJDIR)/*.o $(EXECUTABLE)