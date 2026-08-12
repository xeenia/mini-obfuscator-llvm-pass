#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int CFF_before_with_returns(int a) {
  if(a == 0)
    return 1;
  else
    return 10;
  return 0;
}

int CFF_before_without_returns(int a) {
  if(a == 0)
    a = 100;
  else
    a = -100;
  return a;
}

int CFF_after_with_returns(int a) {
  int b = 0;
  while(1){
    switch(b){
        case 0:
            if(a == 0){
                b=1;
            }
            else{
                b=2;
            }
            break;
        case 1:
            return 1;
        case 2:
            return 10;
        default:
            break;
    }
  }
  return 0;
}

int CFF_after_without_returns(int a) {
  int b = 0;
  srand(time(NULL)); 
  while(1){
    switch(b){
        case 0:
            if(a == 0){
                b=1;
            }
            else{
                b=2;
            }
            break;
        case 1:
            a = 100;
        case 2:
            a = -100;
        default:
            break;
    }
    if(b<3) {
         int use_positive = rand() % 2; 
         if (use_positive) {
           b = 3 + rand() % 8;         
         } else {
           b = -10 + rand() % 8; 
         }
    }
  }
  return 0;
}

int main(int argc, char** argv) {
  int a = atoi(argv[1]);
  printf("CFF before (returns): %d\n", CFF_before_with_returns(a));
  printf("CFF after (returns): %d\n", CFF_after_with_returns(a));
  printf("CFF before (no returns): %d\n", CFF_before_without_returns(a));
  printf("CFF after (no returns): %d\n", CFF_after_without_returns(a));
  return 0;
}