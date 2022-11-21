.PHONY: all clean loopd loops recursived recursives 

GCC = gcc
AR = ar -rcs
FLAGS = -Wall -g

##Create .o files
basicClassification.o: basicClassification.c 
	$(GCC) $(FLAGS) -c basicClassification.c
advancedClassificationLoop.o: advancedClassificationLoop.c 
	$(GCC) $(FLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c 
	$(GCC) $(FLAGS) -c advancedClassificationRecursion.c 
main.o: main.c 
	$(GCC) $(FLAGS) -c main.c


##Create libraries
#Static-
loops: libclassloops.a
libclassloops.a: basicClassification.o advancedClassificationLoop.o 
	$(AR) libclassloops.a basicClassification.o advancedClassificationLoop.o
	ranlib libclassloops.a
recursives: libclassrec.a
libclassrec.a: basicClassification.o advancedClassificationRecursion.o 
	$(AR) libclassrec.a basicClassification.o advancedClassificationRecursion.o
	ranlib libclassrec.a
#Dynamic
lloopd: libclassloops.so
libclassloops.so: basicClassification.o advancedClassificationLoop.o 
	$(GCC) $(FLAGS) -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o -lm
recursived: libclassrec.so
libclassrec.so: basicClassification.o advancedClassificationRecursion.o 
	$(GCC) $(FLAGS) -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o -lm

#Making main files
mains: libclassrec.a main.o
	$(GCC) $(FLAGS) main.o libclassrec.a -o mains -lm
maindloop: libclassloops.so main.o 
	$(GCC) $(FLAGS) main.o ./libclassloops.so -o maindloop -lm
maindrec: libclassrec.so main.o
	$(GCC) $(FLAGS) main.o ./libclassrec.so -o maindrec -lm

all: loops loopd recursived recursives mains maindloop maindrec

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
