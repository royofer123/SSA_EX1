#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int isPrime(int n)
{
    if (n==0) return 0;
    if (n==1) return 1;
    int sn = sqrt((double)(n));
    for (int i = 2; i <= sn; i++)
    {
        if (n%i==0) return 0;
    }
    return 1; 
}

int factorial(int n){    
if (n==1|| n==0) return 1;
else return n*factorial(n-1);
}

int isStrong(int n){
if(n==0) return 0;
int tempStrong= n;
int sum=0;
while(tempStrong>0){
    sum=sum+factorial(tempStrong%10);
    tempStrong=tempStrong/10;
}
return n==sum;

}




