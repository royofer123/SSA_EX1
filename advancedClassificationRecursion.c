#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int isArmstrongRecur(int n, int count)
{
    if (n>0) {
        return pow(n%10, count)+isArmstrongRecur(n/10, count);
    }
    return 0;
}
int countDigit(int n){
    if(n>=0 && n<=9) return 1;
    return 1+countDigit(n/10);  
}

int isArmstrong(int n)
{
    int temp = n;
    int count = countDigit(n);
    
    if (n==isArmstrongRecur(temp,count)) return 1;
    else return 0; 
}


int isPalindromeRecur(int n, int rn) 
{
    
   if(n!=0){
      rn=rn*10+n%10;
      return isPalindromeRecur(n/10, rn);
   }
   return rn;

}

int isPalindrome(int n)
{

    if (n==isPalindromeRecur(n, 0)) return 1;
    else return 0;
}