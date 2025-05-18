#include <stdio.h> 
extern int say_hi(); //extern tells the compiler, “Don’t worry, the definition will come during linking.”



int main() {
    int val; 

    printf("Hello from C! \n");
	val = say_hi(11);
    printf("Value returned: %d \n", val);
}



// Compile and link using: gcc -no-pie  ChcodeFromAsm.c   yourfile.o -o hello