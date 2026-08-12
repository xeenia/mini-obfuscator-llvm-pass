#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

//ok
int CFF_before_ifelse_both_return(int a) {
  if (a == 0)
    return 1;
  else
    return 0;
}

//ok
int CFF_before_if_return_fallthrough(int a) {
  if (a == 0)
    return 1;
  return 0;
}

//ok
int CFF_before_ifelse_no_return(int a) {
  if (a == 0)
    a = 1;
  else
    a = 0;


  
  return a;
}

//ok
int CFF_before_nested_no_return(int a) {
  if (a > 0) {
    if (a % 2 == 0)
      a = a * 2;
    else
      a = a * 3;
  }



  return a;
}

//OK
int CFF_before_nested_inner_return_only(int a) {
  if (a > 0) {
    if (a % 2 == 0)
      return 1;
    else
      return 0;
  }


  return -1;
}
//ok
bool CFF_before_nested_full_return(int a) {
  if (a > 0) {
    if (a % 2 == 0)
      return true;
    else
      return false;
  } else {
    return false;
  }
}

//ok
int CFF_before_nested_mixed_return(int a) {
  if (a != 0) {
    if (a < 0)
      return 0;
    else
      a = a + 5;
  }


  return a;
}


int CFF_after_ifelse_both_return(int a) {
  int b=0;
  while(1){
    switch(b){
      case 0:
        if(a==0){
          b=1;
        }
        else{
          b=2;
        }
        break;
      case 1:
        return 1;
      case 2:
        return 0;
      default:
        break;
    }
  }
}

int CFF_after_if_return_fallthrough(int a) {
  int b=0;
  while(1){
    switch(b){
      case 0:
        if(a==0){
          b=1;
        }
        else{
          b=2;
        }
        break;
      case 1:
        return 1;
      case 2:
        b=-1;
        break;
      default:
        break;
    }
    if(b==-1) break;
  }


  return 0;
}



int CFF_after_ifelse_no_return(int a) {
  int b=0;
  while(1){
    switch(b){
      case 0:
        if(a==0){
          b=1;
        }else{
          b=2;
        }
        break;
      case 1:
        a=1;
        b=-1;
        break;
      case 2:
        a=0;
        b=-1;
      default:
        break;
    }
    if(b==-1) break;
  }


  return a;
}







int CFF_after_nested_no_return(int a) {
  int b=0;
  while(1){
    switch(b){
      case 0:
        if(a>0)
          b=1;
        else
          b=2;
        break;
      case 1:
        if(a % 2 == 0)
          b=3;
        else
          b=4;
        break;
      case 2:
        b=-1;
        break;
      case 3:
        a = a * 2;
        b=-1;
        break;
      case 4:
        a = a * 3;
        b=-1;
        break;
      default:
        break;
    }
    if(b==-1) break;
  }


  return a;
}

int CFF_after_nested_inner_return_only(int a) {
  int b=0;
  while(1){
    switch(b){
      case 0:
        if(a>0)
          b=1;
        else
          b=2;
        break;
      case 1:
        if(a % 2 == 0)
          b=3;
        else
          b=4;
        break;
      case 2:
        b=-1;
        break;
      case 3:
        return 1;
      case 4:
        return 0;
      default:
        break;
    }
    if(b==-1) break;
  }


  return -1;
}

bool CFF_after_nested_full_return(int a) {
  int b=0;
  while(1){
    switch(b){
      case 0:
        if(a>0)
          b=1;
        else
          b=2;
        break;
      case 1:
        if(a % 2 == 0)
          b=3;
        else
          b=4;
      case 2:
        return false;
      case 3:
        return true;
      case 4:
        return false;
      default:
        break;
    }
  }
}

int CFF_after_nested_mixed_return(int a) {
  int b=0;
  while(1){
    switch(b){
      case 0:
        if(a != 0)
          b=1;
        else
          b=2;
        break;
      case 1:
        if(a < 0)
          b=3;
        else
          b=4;
        break;
      case 2:
        b=-1;
        break;
      case 3:
        return 0;
      case 4:
        a = a + 5;
        b=-1;
        break;
      default:
        break;
    }
    if(b==-1) break;
  }


  return a;
}


int main(int argc, char** argv) {
    int a;
    printf("a: %d", argc);
    if(argc==1) a=0;
    else a = atoi(argv[1]);
    printf("ifelse_both_return   before: %d  after: %d\n",CFF_before_ifelse_both_return(a), CFF_after_ifelse_both_return(a));
    printf("if_return_fallthrough before: %d  after: %d\n",CFF_before_if_return_fallthrough(a), CFF_after_if_return_fallthrough(a));
    printf("ifelse_no_return      before: %d  after: %d\n",CFF_before_ifelse_no_return(a), CFF_after_ifelse_no_return(a));
    printf("nested_no_return      before: %d  after: %d\n",CFF_before_nested_no_return(a), CFF_after_nested_no_return(a));
    printf("nested_inner_return_only before: %d  after: %d\n",CFF_before_nested_inner_return_only(a), CFF_after_nested_inner_return_only(a));
    printf("nested_full_return    before: %d  after: %d\n",CFF_before_nested_full_return(a), CFF_after_nested_full_return(a));
    printf("nested_mixed_return   before: %d  after: %d\n",CFF_before_nested_mixed_return(a), CFF_after_nested_mixed_return(a));

    return 0;
}