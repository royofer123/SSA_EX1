#include <stdio.h>
#include "NumClass.h"

int main()
{
    int s=0;
    int e=0;
    scanf("%d", &s);
    scanf("%d", &e);
    printf("The Armstrong numbers are:");
    for (int i = s; i <= e; i++)
    {
        if (isArmstrong(i)) printf(" %d",i);
    }

    printf("\nThe Palindromes are:");
    for (int i = s; i <= e; i++)
    {
        if (isPalindrome(i)) printf(" %d",i);
    }    

    printf("\nThe Prime numbers are:");
    for (int i = s; i <= e; i++)
    {
        if (isPrime(i)) printf(" %d",i);
    }    

        printf("\nThe Strong numbers are:");
    for (int i = s; i <= e; i++)
    {
        if (isStrong(i)) printf(" %d",i);
    }  
        printf("\n");
    return 0;

}