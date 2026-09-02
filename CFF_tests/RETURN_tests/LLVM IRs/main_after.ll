; ModuleID = 'main.bc'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [38 x i8] c"_7_validate_and_print: invalid input\0A\00", align 1
@.str.1 = private unnamed_addr constant [39 x i8] c"_7_validate_and_print: valid input %d\0A\00", align 1
@__const.main.numbers = private unnamed_addr constant [5 x i32] [i32 -4, i32 0, i32 3, i32 8, i32 11], align 16
@.str.2 = private unnamed_addr constant [12 x i8] c"Number: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"Absolute value: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"Zero\0A\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"Positive odd\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Positive even\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"Negative\0A\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"Sum until 10: %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [33 x i8] c"First number divisible by 7: %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [32 x i8] c"No number divisible by 7 found\0A\00", align 1
@.str.11 = private unnamed_addr constant [11 x i8] c"Score: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [19 x i8] c"Pair found at: %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"First negative: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_0_absolute_value(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %b, align 4
  br label %while

4:                                                ; preds = %switch
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %true, label %false

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = sub nsw i32 0, %8
  store i32 %9, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  store i32 %11, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  ret i32 %13

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %7
    i32 2, label %12
    i32 3, label %10
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %10, %7, %break_con, %default
  br label %while

true:                                             ; preds = %4
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_1_classify_number(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %b, align 4
  br label %while

4:                                                ; preds = %switch
  %5 = load i32, ptr %3, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %true, label %false

7:                                                ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %true2, label %false3

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = srem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %true5, label %false6

15:                                               ; preds = %switch
  store i32 2, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  store i32 1, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  ret i32 %19

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %7
    i32 2, label %18
    i32 3, label %8
    i32 4, label %11
    i32 5, label %15
    i32 6, label %16
    i32 7, label %17
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %17, %16, %15, %break_con7, %break_con4, %7, %break_con, %default
  br label %while

true:                                             ; preds = %4
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %8
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %11
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %11
  store i32 6, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_2_sum_until(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %b, align 4
  br label %while

6:                                                ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp sle i32 %8, %9
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 5
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  store i32 %15, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !8

22:                                               ; preds = %switch
  %23 = load i32, ptr %4, align 4
  store i32 %23, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  ret i32 %25

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %14
    i32 4, label %24
    i32 5, label %16
    i32 6, label %22
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %22, %16, %14, %break_con4, %break_con, %6, %default
  br label %while

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_3_find_first_divisible(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 0, ptr %b, align 4
  br label %while

9:                                                ; preds = %switch
  %10 = load i32, ptr %5, align 4
  store i32 %10, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %6, align 4
  %14 = icmp sle i32 %12, %13
  br i1 %14, label %true, label %false

15:                                               ; preds = %switch
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %7, align 4
  %18 = srem i32 %16, %17
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %true2, label %false3

20:                                               ; preds = %switch
  %21 = load i32, ptr %8, align 4
  store i32 %21, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %8, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !10

26:                                               ; preds = %switch
  store i32 -1, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  ret i32 %28

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %15
    i32 3, label %20
    i32 4, label %27
    i32 5, label %22
    i32 6, label %23
    i32 7, label %26
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %26, %23, %22, %20, %break_con4, %break_con, %9, %default
  br label %while

true:                                             ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %11
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %15
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %15
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_4_calculate_score(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %b, align 4
  br label %while

6:                                                ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 1, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp sle i32 %13, %14
  br i1 %15, label %true2, label %false3

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %true5, label %false6

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  %29 = icmp sgt i32 %28, 20
  br i1 %29, label %true8, label %false9

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  store i32 %31, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break, !llvm.loop !11

36:                                               ; preds = %switch
  %37 = load i32, ptr %4, align 4
  store i32 %37, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %2, align 4
  ret i32 %39

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %10
    i32 3, label %38
    i32 4, label %11
    i32 5, label %12
    i32 6, label %16
    i32 7, label %20
    i32 8, label %27
    i32 9, label %30
    i32 10, label %32
    i32 11, label %33
    i32 12, label %24
    i32 13, label %36
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %36, %24, %33, %32, %30, %break_con10, %20, %break_con7, %break_con4, %11, %10, %break_con, %6, %default
  br label %while

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %12
  store i32 6, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %12
  store i32 13, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %16
  store i32 7, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %16
  store i32 12, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %27
  store i32 9, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %27
  store i32 10, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_5_find_pair_in_grid(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 0, ptr %b, align 4
  br label %while

10:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %true, label %false

15:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %true2, label %false3

20:                                               ; preds = %switch
  %21 = load i32, ptr %8, align 4
  %22 = load i32, ptr %6, align 4
  %23 = mul nsw i32 %21, %22
  %24 = load i32, ptr %9, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %7, align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %true5, label %false6

28:                                               ; preds = %switch
  %29 = load i32, ptr %8, align 4
  %30 = mul nsw i32 %29, 100
  %31 = load i32, ptr %9, align 4
  %32 = add nsw i32 %30, %31
  store i32 %32, ptr %4, align 4
  store i32 6, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %9, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %9, align 4
  store i32 3, ptr %b, align 4
  br label %break, !llvm.loop !12

37:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !13

41:                                               ; preds = %switch
  store i32 -1, ptr %4, align 4
  store i32 6, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %4, align 4
  ret i32 %43

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %15
    i32 3, label %16
    i32 4, label %20
    i32 5, label %28
    i32 6, label %42
    i32 7, label %33
    i32 8, label %34
    i32 9, label %37
    i32 10, label %38
    i32 11, label %41
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %41, %38, %37, %34, %33, %28, %break_con7, %break_con4, %15, %break_con, %10, %default
  br label %while

true:                                             ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %11
  store i32 11, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %16
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %16
  store i32 9, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %20
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %20
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_6_first_negative_do_while(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %b, align 4
  br label %while

8:                                                ; preds = %switch
  store i32 0, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  store i32 %9, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %7, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  %14 = load i32, ptr %7, align 4
  store i32 %14, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %7, align 4
  %17 = sub nsw i32 %16, 3
  store i32 %17, ptr %7, align 4
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %true2, label %false3, !llvm.loop !14

24:                                               ; preds = %switch
  store i32 0, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %3, align 4
  ret i32 %26

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %10
    i32 2, label %13
    i32 3, label %25
    i32 4, label %15
    i32 5, label %20
    i32 6, label %24
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %24, %break_con4, %15, %13, %break_con, %8, %default
  br label %while

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %20
  store i32 1, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %20
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_7_validate_and_print(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %b, align 4
  br label %while

3:                                                ; preds = %switch
  %4 = load i32, ptr %2, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %true, label %false

6:                                                ; preds = %switch
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 2, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %9)
  store i32 2, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %11
    i32 3, label %8
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %8, %6, %break_con, %default
  br label %while

true:                                             ; preds = %3
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %b = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %while

9:                                                ; preds = %switch
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.numbers, i64 20, i1 false)
  store i32 5, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %true, label %false

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  store i32 %18, ptr %5, align 4
  %19 = load i32, ptr %5, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %19)
  %21 = load i32, ptr %5, align 4
  %22 = call i32 @_0_absolute_value(i32 noundef %21)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %22)
  %24 = load i32, ptr %5, align 4
  %25 = call i32 @_1_classify_number(i32 noundef %24)
  store i32 %25, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %true2, label %false3

29:                                               ; preds = %switch
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 5, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %true5, label %false6

34:                                               ; preds = %switch
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 9, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %6, align 4
  %38 = icmp eq i32 %37, 2
  br i1 %38, label %true8, label %false9

39:                                               ; preds = %switch
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 12, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 12, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %4, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !15

49:                                               ; preds = %switch
  %50 = call i32 @_2_sum_until(i32 noundef 10)
  store i32 %50, ptr %7, align 4
  %51 = load i32, ptr %7, align 4
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %51)
  %53 = call i32 @_3_find_first_divisible(i32 noundef 3, i32 noundef 20, i32 noundef 7)
  store i32 %53, ptr %8, align 4
  store i32 15, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  %55 = load i32, ptr %8, align 4
  %56 = icmp ne i32 %55, -1
  br i1 %56, label %true11, label %false12

57:                                               ; preds = %switch
  %58 = load i32, ptr %8, align 4
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %58)
  store i32 17, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  store i32 17, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = call i32 @_4_calculate_score(i32 noundef 10)
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %63)
  %65 = call i32 @_5_find_pair_in_grid(i32 noundef 3, i32 noundef 3, i32 noundef 4)
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %65)
  %67 = call i32 @_5_find_pair_in_grid(i32 noundef 3, i32 noundef 3, i32 noundef 100)
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %67)
  %69 = call i32 @_6_first_negative_do_while(i32 noundef 5, i32 noundef 3)
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %69)
  %71 = call i32 @_6_first_negative_do_while(i32 noundef 100, i32 noundef 2)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %71)
  call void @_7_validate_and_print(i32 noundef -1)
  call void @_7_validate_and_print(i32 noundef 5)
  ret i32 0

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %26
    i32 4, label %29
    i32 5, label %45
    i32 6, label %46
    i32 7, label %31
    i32 8, label %34
    i32 9, label %44
    i32 10, label %36
    i32 11, label %39
    i32 12, label %43
    i32 13, label %41
    i32 14, label %49
    i32 15, label %54
    i32 16, label %57
    i32 17, label %62
    i32 18, label %60
  ]

while:                                            ; preds = %0, %break
  br label %switch

break:                                            ; preds = %60, %57, %break_con13, %49, %41, %43, %39, %break_con10, %44, %34, %break_con7, %46, %45, %29, %break_con4, %14, %break_con, %9, %default
  br label %while

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 14, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %26
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %26
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %31
  store i32 8, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %31
  store i32 10, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %36
  store i32 11, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %36
  store i32 13, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %54
  store i32 16, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %54
  store i32 18, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"ThinLTO", i32 0}
!6 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!7 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
