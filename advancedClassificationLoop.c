#include <stdio.h>
#include <math.h>
#include "NumClass.h"

int countDigit(int num){
   int count=0;
   while(num>0){
    num=num/10;
    count++;
   } 
   return count;
}
int isPalindrom(int num){
   int reverse=num%10;
   int saveNum=num;
   int temp=num;
   int count=countDigit(temp);
   while(count>1){
    reverse=reverse*10+saveNum/10;
    count--;
    saveNum=saveNum/10;
   }
    return (num==reverse);
    }

int isArmstrong(int num){
   int saveNum=num;
   int sum=0;
   int temp=num;
   int count =countDigit(temp);
   while(saveNum>0){
      int digit=saveNum%10;
      sum=sum+pow(digit,count);
   }
   return (sum==num);
}