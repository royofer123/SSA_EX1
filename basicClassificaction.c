#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int factorial(int a){
    int mul=1;
    while(a>1){
        mul=mul*a;
        a=a-1;
    }
    return mul;
}

int isStrong(int num){
    int sum=0, saveNum=num;
    while(num>0){
        int digit=num%10;
        sum=sum+factorial(digit);
        num=num/10;
    }
    return (sum==saveNum);

}   

int isPrime(int num){
   int i;
   for(i=2;i<=sqrt(num);i++){
    if(num%i==0)
    return 0;
   }
   return 1;
    }