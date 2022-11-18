.PHONY: all clean loopd loops recursived recursives 

GCC = gcc
AR = ar -rcs
FLAGS = -Wall -g

##Create .o files
basicClassificaction.o: basicClassificaction.c  
	$(GCC) $(FLAGS) -c basicClassificaction.c

advancedClassificationLoop.o: advancedClassificationLoop.c 
	$(GCC) $(FLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c 
	$(GCC) $(FLAGS) -c advancedClassificationRecursion.c

main.o: main.c 
	$(GCC) $(FLAGS) -c main.c

##Create libraries
#Static-
loops: libclassloops.a 
libclassloops.a: basicClassificaction.o advancedClassificationLoop.o
	$(AR) libclassloops.a basicClassificaction.o advancedClassificationLoop.o
	ranlib libclassloops.a

recursives: libclassrec.a
libclassrec.a: advancedClassificationRecursion.o basicClassificaction.o
	$(AR) libclassrec.a advancedClassificationRecursion.o basicClassificaction.o
	ranlib libclassrec.a

#Dynamic
loopd: libclassloops.so
libclassloops.so: basicClassificaction.o advancedClassificationLoop.o
	$(GCC) $(FLAGS) -shared -o libclassloops.so basicClassificaction.o advancedClassificationLoop.o
	
recursived: libclassrec.so
libclassrec.so : basicClassificaction.o advancedClassificationRecursion.o
	$(GCC) $(FLAGS) -shared -o libclassrec.so basicClassificaction.o advancedClassificationRecursion.o

#Making main files
mains: libclassrec.a main.o
	$(GCC) $(FLAGS) main.o libclassrec.a -o mains -lm

maindloop: libclassloops.so main.o
	$(GCC) $(FLAGS) main.o ./libclassloops.so -o maindloop -lm

maindrec: libclassrec.so main.o
	$(GCC) $(FLAGS) main.o ./libclassrec.so -o maindrec -lm

all: mains maindloop maindrec

clean:
	rm -f *.o *.a *.so mains maindloop maindrec






 