# Makefile to build the StreamIO sample using g++ with C++11 features
# Auther : Wen-Kai, Chang
#
CC=g++
DEBUGFLAGS=-g -std=c++11
RELEASEFLAGS=-std=c++11
SRCDIR=StreamIO/
DEBUGDIR=./Debug/
RELEASEDIR=./Release/
DEBUGOBJS=$(DEBUGDIR)entry.o $(DEBUGDIR)main.o
RELEASEOBJS=$(RELEASEDIR)entry.o $(RELEASEDIR)main.o
OUTPUT=streamio.out
MKDIR_P=mkdir -p

all : debug release

#####################
# Debug build
#####################

debug : debug_dir $(DEBUGDIR)$(OUTPUT)

debug_dir : $(DEBUGDIR)
	
$(DEBUGDIR) : 
	$(MKDIR_P) $(DEBUGDIR)

$(DEBUGDIR)$(OUTPUT) : $(DEBUGOBJS)
	$(CC) $(DEBUGFLAGS) $(DEBUGOBJS) -o $(DEBUGDIR)$(OUTPUT)

$(DEBUGDIR)entry.o : $(SRCDIR)entry.cpp $(SRCDIR)entry.h
	$(CC) $(DEBUGFLAGS) -c $(SRCDIR)entry.cpp -o $(DEBUGDIR)entry.o

$(DEBUGDIR)main.o : $(SRCDIR)main.cpp $(SRCDIR)entry.h
	$(CC) $(DEBUGFLAGS) -c $(SRCDIR)main.cpp -o $(DEBUGDIR)main.o

cleandebug :
	rm -rf $(DEBUGDIR)


#####################
# Release build
#####################

release : release_dir $(RELEASEDIR)$(OUTPUT)

release_dir : $(RELEASEDIR)

$(RELEASEDIR) : 
	$(MKDIR_P) $(RELEASEDIR)

$(RELEASEDIR)$(OUTPUT) : $(RELEASEOBJS)
	$(CC) $(RELEASEFLAGS) $(RELEASEOBJS) -o $(RELEASEDIR)$(OUTPUT)

$(RELEASEDIR)entry.o : $(SRCDIR)entry.cpp $(SRCDIR)entry.h
	$(CC) $(RELEASEFLAGS) -c $(SRCDIR)entry.cpp -o $(RELEASEDIR)entry.o

$(RELEASEDIR)main.o : $(SRCDIR)main.cpp $(SRCDIR)entry.h
	$(CC) $(RELEASEFLAGS) -c $(SRCDIR)main.cpp -o $(RELEASEDIR)main.o

cleanrelease :
	rm -rf $(RELEASEDIR)

clean : cleandebug cleanrelease
