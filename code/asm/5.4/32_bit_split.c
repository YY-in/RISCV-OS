#include<stdio.h>

void convert(long int temp);

int main(int argc, char const *argv[])
{
    convert(0x876564321);
}

void convert(long int temp){
    short x1,x2;
    x1 = temp & 0x0000FFFF;
    x2=temp >> 16; 
    x2 = temp&0x0000FFFF;

    printf("x1=%d;x2=%d",x1,x2);
}