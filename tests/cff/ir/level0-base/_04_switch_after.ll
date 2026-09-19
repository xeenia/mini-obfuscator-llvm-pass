; ModuleID = '_04_switch.bc'
source_filename = "_04_switch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const._10_switch_array.values = private unnamed_addr constant [5 x i32] [i32 10, i32 20, i32 30, i32 40, i32 50], align 16
@__const._12_switch_pointer_modify.values = private unnamed_addr constant [3 x i32] [i32 10, i32 20, i32 30], align 4
@__const._15_switch_nested_array.values = private unnamed_addr constant [4 x i32] [i32 100, i32 200, i32 300, i32 400], align 16
@__const._21_switch_complex_data.values = private unnamed_addr constant [8 x i32] [i32 11, i32 22, i32 33, i32 44, i32 55, i32 66, i32 77, i32 88], align 16
@__const._27_switch_goto_nested_array.values = private unnamed_addr constant [4 x i32] [i32 100, i32 200, i32 300, i32 400], align 16
@__const._29_switch_combined.values = private unnamed_addr constant [8 x i32] [i32 3, i32 7, i32 11, i32 19, i32 23, i32 31, i32 43, i32 59], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_00_switch_simple(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 1, label %case1
    i32 2, label %case2
    i32 3, label %case3
  ]

5:                                                ; preds = %switch
  store i32 10, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  store i32 20, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 30, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  ret i32 %9

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
  ]

loop:                                             ; preds = %7, %6, %5, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_switch_default(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 100, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 1, label %case1
    i32 2, label %case2
    i32 3, label %case3
  ]

5:                                                ; preds = %switch
  store i32 10, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  store i32 20, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 30, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  ret i32 %10

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
    i32 5, label %9
  ]

loop:                                             ; preds = %8, %7, %6, %5, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_switch_negative(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 -3, label %case1
    i32 -2, label %case2
    i32 -1, label %case3
    i32 0, label %case4
    i32 5, label %case5
  ]

5:                                                ; preds = %switch
  store i32 300, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 500, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 -999, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  ret i32 %12

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
    i32 5, label %9
    i32 6, label %10
    i32 7, label %11
  ]

loop:                                             ; preds = %10, %9, %8, %7, %6, %5, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 6, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %3
  store i32 5, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_switch_fallthrough(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 1, label %case1
    i32 2, label %case2
    i32 3, label %case3
    i32 4, label %case4
    i32 5, label %case5
  ]

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = add nsw i32 %6, 10
  store i32 %7, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 20
  store i32 %10, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  ret i32 %13

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %8
    i32 3, label %11
    i32 4, label %12
  ]

loop:                                             ; preds = %11, %8, %5, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_switch_fallthrough_steps(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 1, label %case1
    i32 2, label %case2
    i32 3, label %case3
  ]

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 2
  store i32 %10, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, 4
  store i32 %13, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 -10, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %8
    i32 3, label %11
    i32 4, label %14
    i32 5, label %15
  ]

loop:                                             ; preds = %14, %11, %8, %5, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_switch_before_after(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 5, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = mul nsw i32 %4, 2
  store i32 %5, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  switch i32 %6, label %case [
    i32 1, label %case1
    i32 2, label %case2
    i32 3, label %case3
  ]

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 20
  store i32 %12, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 30
  store i32 %15, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 40
  store i32 %18, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = mul nsw i32 %20, 3
  store i32 %21, ptr %2, align 4
  %22 = load i32, ptr %2, align 4
  %23 = sub nsw i32 %22, 7
  store i32 %23, ptr %2, align 4
  %24 = load i32, ptr %2, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %3
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
    i32 4, label %16
    i32 5, label %19
  ]

loop:                                             ; preds = %16, %13, %10, %7, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_switch_multiple(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 1, label %case1
    i32 2, label %case2
  ]

5:                                                ; preds = %switch
  store i32 10, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  store i32 20, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 30, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  switch i32 %9, label %case3 [
    i32 10, label %case4
    i32 20, label %case5
  ]

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 100
  store i32 %12, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 200
  store i32 %15, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 300
  store i32 %18, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
    i32 5, label %10
    i32 6, label %13
    i32 7, label %16
    i32 8, label %19
  ]

loop:                                             ; preds = %16, %13, %10, %case5, %case4, %case3, %7, %6, %5, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %8
  store i32 7, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %8
  store i32 5, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %8
  store i32 6, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_switch_two_independent(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %5 = load i32, ptr %1, align 4
  %6 = srem i32 %5, 4
  switch i32 %6, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
  ]

7:                                                ; preds = %switch
  store i32 10, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 20, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 30, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 40, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %1, align 4
  %13 = add nsw i32 %12, 1
  %14 = srem i32 %13, 3
  switch i32 %14, label %case4 [
    i32 0, label %case5
    i32 1, label %case6
  ]

15:                                               ; preds = %switch
  store i32 100, ptr %3, align 4
  store i32 9, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 200, ptr %3, align 4
  store i32 9, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 300, ptr %3, align 4
  store i32 9, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %19, %20
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %4
    i32 1, label %7
    i32 2, label %8
    i32 3, label %9
    i32 4, label %10
    i32 5, label %11
    i32 6, label %15
    i32 7, label %16
    i32 8, label %17
    i32 9, label %18
  ]

loop:                                             ; preds = %17, %16, %15, %case6, %case5, %case4, %10, %9, %8, %7, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %4
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %4
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %4
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %11
  store i32 8, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %11
  store i32 6, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %11
  store i32 7, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_switch_expression(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %5 = load i32, ptr %1, align 4
  %6 = mul nsw i32 %5, 7
  %7 = add nsw i32 %6, 3
  %8 = srem i32 %7, 5
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  switch i32 %9, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
    i32 3, label %case4
  ]

10:                                               ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 300, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 400, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 500, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = load i32, ptr %1, align 4
  %18 = add nsw i32 %16, %17
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b5 = load i32, ptr %b, align 4
  switch i32 %b5, label %default [
    i32 0, label %4
    i32 1, label %10
    i32 2, label %11
    i32 3, label %12
    i32 4, label %13
    i32 5, label %14
    i32 6, label %15
  ]

loop:                                             ; preds = %14, %13, %12, %11, %10, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %4
  store i32 5, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %4
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %4
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %4
  store i32 4, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_switch_bitwise(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %5 = load i32, ptr %1, align 4
  %6 = xor i32 %5, 85
  %7 = and i32 %6, 7
  store i32 %7, ptr %3, align 4
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
    i32 3, label %case4
    i32 4, label %case5
    i32 5, label %case6
    i32 6, label %case7
  ]

9:                                                ; preds = %switch
  store i32 11, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 22, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 33, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 44, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 55, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 66, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 77, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 88, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b8 = load i32, ptr %b, align 4
  switch i32 %b8, label %default [
    i32 0, label %4
    i32 1, label %9
    i32 2, label %10
    i32 3, label %11
    i32 4, label %12
    i32 5, label %13
    i32 6, label %14
    i32 7, label %15
    i32 8, label %16
    i32 9, label %17
  ]

loop:                                             ; preds = %16, %15, %14, %13, %12, %11, %10, %9, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %4
  store i32 8, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %4
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %4
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %4
  store i32 4, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %4
  store i32 5, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %4
  store i32 6, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %4
  store i32 7, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_switch_array(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const._10_switch_array.values, i64 20, i1 false)
  store i32 0, ptr %3, align 4
  %5 = load i32, ptr %1, align 4
  switch i32 %5, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
    i32 3, label %case4
    i32 4, label %case5
  ]

6:                                                ; preds = %switch
  %7 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 0
  %8 = load i32, ptr %7, align 16
  store i32 %8, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 1
  %11 = load i32, ptr %10, align 4
  store i32 %11, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2
  %14 = load i32, ptr %13, align 8
  store i32 %14, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3
  %17 = load i32, ptr %16, align 4
  store i32 %17, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 4
  %20 = load i32, ptr %19, align 16
  store i32 %20, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  store i32 -1, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %4
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %15
    i32 5, label %18
    i32 6, label %21
    i32 7, label %22
  ]

loop:                                             ; preds = %21, %18, %15, %12, %9, %6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %4
  store i32 6, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %4
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %4
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %4
  store i32 4, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %4
  store i32 5, ptr %b, align 4
  br label %loop
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_switch_pointer(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  store i32 20, ptr %3, align 4
  store i32 30, ptr %4, align 4
  store ptr %2, ptr %5, align 8
  %7 = load i32, ptr %1, align 4
  switch i32 %7, label %case [
    i32 1, label %case1
    i32 2, label %case2
    i32 3, label %case3
  ]

8:                                                ; preds = %switch
  store ptr %2, ptr %5, align 8
  store i32 5, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store ptr %3, ptr %5, align 8
  store i32 5, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store ptr %4, ptr %5, align 8
  store i32 5, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store ptr %2, ptr %5, align 8
  store i32 5, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %13, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %6
    i32 1, label %8
    i32 2, label %9
    i32 3, label %10
    i32 4, label %11
    i32 5, label %12
  ]

loop:                                             ; preds = %11, %10, %9, %8, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %6
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %6
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %6
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_switch_pointer_modify(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca [3 x i32], align 4
  %3 = alloca ptr, align 8
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 @__const._12_switch_pointer_modify.values, i64 12, i1 false)
  %5 = getelementptr inbounds [3 x i32], ptr %2, i64 0, i64 0
  store ptr %5, ptr %3, align 8
  %6 = load i32, ptr %1, align 4
  switch i32 %6, label %case [
    i32 1, label %case1
    i32 2, label %case2
    i32 3, label %case3
  ]

7:                                                ; preds = %switch
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds i32, ptr %8, i64 0
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 100
  store i32 %12, ptr %10, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds i32, ptr %14, i64 1
  store ptr %15, ptr %3, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %16, align 4
  %18 = add nsw i32 %17, 200
  store i32 %18, ptr %16, align 4
  store i32 5, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds i32, ptr %20, i64 2
  store ptr %21, ptr %3, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %23, 300
  store i32 %24, ptr %22, align 4
  store i32 5, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load ptr, ptr %3, align 8
  store i32 -1, ptr %26, align 4
  store i32 5, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = getelementptr inbounds [3 x i32], ptr %2, i64 0, i64 0
  %29 = load i32, ptr %28, align 4
  %30 = getelementptr inbounds [3 x i32], ptr %2, i64 0, i64 1
  %31 = load i32, ptr %30, align 4
  %32 = add nsw i32 %29, %31
  %33 = getelementptr inbounds [3 x i32], ptr %2, i64 0, i64 2
  %34 = load i32, ptr %33, align 4
  %35 = add nsw i32 %32, %34
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %4
    i32 1, label %7
    i32 2, label %13
    i32 3, label %19
    i32 4, label %25
    i32 5, label %27
  ]

loop:                                             ; preds = %25, %19, %13, %7, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %4
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %4
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %4
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_switch_nested(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 1, label %case1
    i32 2, label %case2
  ]

5:                                                ; preds = %switch
  %6 = load i32, ptr %1, align 4
  %7 = add nsw i32 %6, 1
  switch i32 %7, label %case3 [
    i32 2, label %case4
  ]

8:                                                ; preds = %switch
  store i32 12, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 19, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %1, align 4
  %13 = sub nsw i32 %12, 1
  switch i32 %13, label %case5 [
    i32 1, label %case6
  ]

14:                                               ; preds = %switch
  store i32 21, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 29, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %8
    i32 3, label %9
    i32 4, label %10
    i32 5, label %11
    i32 6, label %14
    i32 7, label %15
    i32 8, label %16
    i32 9, label %17
    i32 10, label %18
  ]

loop:                                             ; preds = %17, %16, %15, %14, %case6, %case5, %10, %9, %8, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 9, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 5, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %5
  store i32 2, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %11
  store i32 7, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %11
  store i32 6, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_switch_deep_nested(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  %5 = and i32 %4, 3
  switch i32 %5, label %case [
    i32 0, label %case1
    i32 1, label %case2
  ]

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = and i32 %7, 7
  switch i32 %8, label %case3 [
    i32 0, label %case4
  ]

9:                                                ; preds = %switch
  %10 = load i32, ptr %1, align 4
  %11 = and i32 %10, 15
  switch i32 %11, label %case5 [
    i32 0, label %case6
  ]

12:                                               ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 101, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 102, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %1, align 4
  %19 = and i32 %18, 7
  switch i32 %19, label %case7 [
    i32 1, label %case8
  ]

20:                                               ; preds = %switch
  %21 = load i32, ptr %1, align 4
  %22 = and i32 %21, 15
  switch i32 %22, label %case9 [
    i32 1, label %case10
  ]

23:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 12, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 201, ptr %2, align 4
  store i32 12, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  store i32 202, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  store i32 999, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %2, align 4
  ret i32 %30

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b11 = load i32, ptr %b, align 4
  switch i32 %b11, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %13
    i32 5, label %14
    i32 6, label %15
    i32 7, label %16
    i32 8, label %17
    i32 9, label %20
    i32 10, label %23
    i32 11, label %24
    i32 12, label %25
    i32 13, label %26
    i32 14, label %27
    i32 15, label %28
    i32 16, label %29
  ]

loop:                                             ; preds = %28, %27, %26, %25, %24, %23, %case10, %case9, %case8, %case7, %16, %15, %14, %13, %12, %case6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 15, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 8, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %6
  store i32 6, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %6
  store i32 2, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %9
  store i32 4, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %17
  store i32 13, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %17
  store i32 9, ptr %b, align 4
  br label %loop

case9:                                            ; preds = %20
  store i32 11, ptr %b, align 4
  br label %loop

case10:                                           ; preds = %20
  store i32 10, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_switch_nested_array(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca [4 x i32], align 16
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const._15_switch_nested_array.values, i64 16, i1 false)
  store i32 0, ptr %3, align 4
  %5 = load i32, ptr %1, align 4
  %6 = and i32 %5, 1
  switch i32 %6, label %case [
    i32 0, label %case1
    i32 1, label %case2
  ]

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = and i32 %8, 3
  switch i32 %9, label %case3 [
    i32 0, label %case4
    i32 2, label %case5
  ]

10:                                               ; preds = %switch
  %11 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 0
  %12 = load i32, ptr %11, align 16
  store i32 %12, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 2
  %15 = load i32, ptr %14, align 8
  store i32 %15, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 -10, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %1, align 4
  %20 = and i32 %19, 3
  switch i32 %20, label %case6 [
    i32 1, label %case7
    i32 3, label %case8
  ]

21:                                               ; preds = %switch
  %22 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 1
  %23 = load i32, ptr %22, align 4
  store i32 %23, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 3
  %26 = load i32, ptr %25, align 4
  store i32 %26, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 -20, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %3, align 4
  ret i32 %30

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b9 = load i32, ptr %b, align 4
  switch i32 %b9, label %default [
    i32 0, label %4
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
    i32 4, label %16
    i32 5, label %17
    i32 6, label %18
    i32 7, label %21
    i32 8, label %24
    i32 9, label %27
    i32 10, label %28
    i32 11, label %29
  ]

loop:                                             ; preds = %28, %27, %24, %21, %case8, %case7, %case6, %17, %16, %13, %10, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %4
  store i32 11, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %4
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %4
  store i32 6, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %7
  store i32 4, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %7
  store i32 2, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %18
  store i32 9, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %18
  store i32 7, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %18
  store i32 8, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_switch_nested_pointer(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  store i32 20, ptr %3, align 4
  store i32 30, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %8 = load i32, ptr %1, align 4
  %9 = srem i32 %8, 3
  switch i32 %9, label %case [
    i32 0, label %case1
    i32 1, label %case2
  ]

10:                                               ; preds = %switch
  %11 = load i32, ptr %1, align 4
  %12 = and i32 %11, 1
  switch i32 %12, label %case3 [
    i32 0, label %case4
    i32 1, label %case5
  ]

13:                                               ; preds = %switch
  store ptr %2, ptr %6, align 8
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store ptr %3, ptr %6, align 8
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store ptr %4, ptr %6, align 8
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store ptr %3, ptr %6, align 8
  store i32 8, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store ptr %4, ptr %6, align 8
  store i32 8, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load ptr, ptr %6, align 8
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %1, align 4
  %23 = add nsw i32 %21, %22
  store i32 %23, ptr %5, align 4
  %24 = load i32, ptr %5, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %13
    i32 3, label %14
    i32 4, label %15
    i32 5, label %16
    i32 6, label %17
    i32 7, label %18
    i32 8, label %19
  ]

loop:                                             ; preds = %18, %17, %16, %15, %14, %13, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %7
  store i32 7, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %7
  store i32 6, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %10
  store i32 4, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %10
  store i32 2, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_switch_goto(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 1, label %case1
    i32 2, label %case2
    i32 3, label %case3
  ]

5:                                                ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 300, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 -100, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
    i32 5, label %9
    i32 6, label %10
    i32 7, label %11
    i32 8, label %12
    i32 9, label %13
  ]

loop:                                             ; preds = %12, %11, %10, %9, %8, %7, %6, %5, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_switch_multiple_goto(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  %5 = and i32 %4, 3
  switch i32 %5, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
  ]

6:                                                ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 20
  store i32 %15, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 30
  store i32 %18, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, 40
  store i32 %21, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  %24 = sdiv i32 %23, 10
  switch i32 %24, label %case4 [
    i32 1, label %case5
    i32 2, label %case6
    i32 3, label %case7
  ]

25:                                               ; preds = %switch
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %26, 100
  store i32 %27, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %2, align 4
  %30 = add nsw i32 %29, 200
  store i32 %30, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %2, align 4
  %33 = add nsw i32 %32, 300
  store i32 %33, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %2, align 4
  %36 = add nsw i32 %35, 400
  store i32 %36, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %2, align 4
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b8 = load i32, ptr %b, align 4
  switch i32 %b8, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %10
    i32 6, label %13
    i32 7, label %16
    i32 8, label %19
    i32 9, label %22
    i32 10, label %25
    i32 11, label %28
    i32 12, label %31
    i32 13, label %34
    i32 14, label %37
  ]

loop:                                             ; preds = %34, %31, %28, %25, %case7, %case6, %case5, %case4, %19, %16, %13, %10, %9, %8, %7, %6, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %22
  store i32 13, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %22
  store i32 10, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %22
  store i32 11, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %22
  store i32 12, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_switch_nested_goto(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  %5 = and i32 %4, 1
  switch i32 %5, label %case [
    i32 0, label %case1
    i32 1, label %case2
  ]

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = and i32 %7, 3
  switch i32 %8, label %case3 [
    i32 0, label %case4
    i32 2, label %case5
  ]

9:                                                ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  %14 = and i32 %13, 3
  switch i32 %14, label %case6 [
    i32 1, label %case7
    i32 3, label %case8
  ]

15:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 15, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 15, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  store i32 300, ptr %2, align 4
  store i32 15, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 400, ptr %2, align 4
  store i32 15, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 15, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b9 = load i32, ptr %b, align 4
  switch i32 %b9, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %9
    i32 3, label %10
    i32 4, label %11
    i32 5, label %12
    i32 6, label %15
    i32 7, label %16
    i32 8, label %17
    i32 9, label %18
    i32 10, label %19
    i32 11, label %20
    i32 12, label %21
    i32 13, label %22
    i32 14, label %23
    i32 15, label %24
  ]

loop:                                             ; preds = %23, %22, %21, %20, %19, %18, %17, %16, %15, %case8, %case7, %case6, %11, %10, %9, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 9, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 5, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %6
  store i32 4, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %6
  store i32 2, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %12
  store i32 8, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %12
  store i32 6, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %12
  store i32 7, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_switch_precomputed(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  %8 = load i32, ptr %1, align 4
  %9 = mul nsw i32 %8, 3
  store i32 %9, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = xor i32 %10, 85
  store i32 %11, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 17
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %4, align 4
  %15 = and i32 %14, 7
  store i32 %15, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %16 = load i32, ptr %5, align 4
  switch i32 %16, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
    i32 3, label %case4
    i32 4, label %case5
    i32 5, label %case6
    i32 6, label %case7
  ]

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %2, align 4
  %27 = load i32, ptr %4, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %2, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %3, align 4
  %34 = mul nsw i32 %33, 2
  store i32 %34, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %4, align 4
  %37 = mul nsw i32 %36, 2
  store i32 %37, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = load i32, ptr %2, align 4
  %40 = load i32, ptr %4, align 4
  %41 = xor i32 %39, %40
  store i32 %41, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  %43 = load i32, ptr %3, align 4
  %44 = load i32, ptr %4, align 4
  %45 = xor i32 %43, %44
  store i32 %45, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %6, align 4
  ret i32 %47

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b8 = load i32, ptr %b, align 4
  switch i32 %b8, label %default [
    i32 0, label %7
    i32 1, label %17
    i32 2, label %21
    i32 3, label %25
    i32 4, label %29
    i32 5, label %32
    i32 6, label %35
    i32 7, label %38
    i32 8, label %42
    i32 9, label %46
  ]

loop:                                             ; preds = %42, %38, %35, %32, %29, %25, %21, %17, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %7
  store i32 8, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %7
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %7
  store i32 4, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %7
  store i32 5, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %7
  store i32 6, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %7
  store i32 7, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_switch_complex_data(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca [8 x i32], align 16
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const._21_switch_complex_data.values, i64 32, i1 false)
  %7 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 0
  store ptr %7, ptr %3, align 8
  store i32 0, ptr %4, align 4
  %8 = load i32, ptr %1, align 4
  %9 = mul nsw i32 %8, 5
  %10 = add nsw i32 %9, 7
  %11 = and i32 %10, 7
  store i32 %11, ptr %5, align 4
  %12 = load i32, ptr %5, align 4
  %13 = and i32 %12, 3
  switch i32 %13, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
  ]

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  switch i32 %15, label %case4 [
    i32 0, label %case5
    i32 4, label %case6
  ]

16:                                               ; preds = %switch
  %17 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 0
  store ptr %17, ptr %3, align 8
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 4
  store ptr %19, ptr %3, align 8
  store i32 5, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 1
  store ptr %21, ptr %3, align 8
  store i32 5, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %5, align 4
  switch i32 %24, label %case7 [
    i32 1, label %case8
    i32 5, label %case9
  ]

25:                                               ; preds = %switch
  %26 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 1
  store ptr %26, ptr %3, align 8
  store i32 10, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 5
  store ptr %28, ptr %3, align 8
  store i32 10, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 2
  store ptr %30, ptr %3, align 8
  store i32 10, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %5, align 4
  switch i32 %33, label %case10 [
    i32 2, label %case11
    i32 6, label %case12
  ]

34:                                               ; preds = %switch
  %35 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 2
  store ptr %35, ptr %3, align 8
  store i32 15, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 6
  store ptr %37, ptr %3, align 8
  store i32 15, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 3
  store ptr %39, ptr %3, align 8
  store i32 15, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %5, align 4
  switch i32 %42, label %case13 [
    i32 3, label %case14
    i32 7, label %case15
  ]

43:                                               ; preds = %switch
  %44 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 3
  store ptr %44, ptr %3, align 8
  store i32 20, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 7
  store ptr %46, ptr %3, align 8
  store i32 20, ptr %b, align 4
  br label %loop

47:                                               ; preds = %switch
  %48 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 0
  store ptr %48, ptr %3, align 8
  store i32 20, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %loop

50:                                               ; preds = %switch
  %51 = load ptr, ptr %3, align 8
  %52 = load i32, ptr %51, align 4
  store i32 %52, ptr %4, align 4
  %53 = load i32, ptr %1, align 4
  %54 = load i32, ptr %4, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %4, align 4
  %56 = load i32, ptr %4, align 4
  ret i32 %56

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b16 = load i32, ptr %b, align 4
  switch i32 %b16, label %default [
    i32 0, label %6
    i32 1, label %14
    i32 2, label %16
    i32 3, label %18
    i32 4, label %20
    i32 5, label %22
    i32 6, label %23
    i32 7, label %25
    i32 8, label %27
    i32 9, label %29
    i32 10, label %31
    i32 11, label %32
    i32 12, label %34
    i32 13, label %36
    i32 14, label %38
    i32 15, label %40
    i32 16, label %41
    i32 17, label %43
    i32 18, label %45
    i32 19, label %47
    i32 20, label %49
    i32 21, label %50
  ]

loop:                                             ; preds = %49, %47, %45, %43, %case15, %case14, %case13, %40, %38, %36, %34, %case12, %case11, %case10, %31, %29, %27, %25, %case9, %case8, %case7, %22, %20, %18, %16, %case6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %6
  store i32 16, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %6
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %6
  store i32 6, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %6
  store i32 11, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %14
  store i32 4, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %14
  store i32 2, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %14
  store i32 3, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %23
  store i32 9, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %23
  store i32 7, ptr %b, align 4
  br label %loop

case9:                                            ; preds = %23
  store i32 8, ptr %b, align 4
  br label %loop

case10:                                           ; preds = %32
  store i32 14, ptr %b, align 4
  br label %loop

case11:                                           ; preds = %32
  store i32 12, ptr %b, align 4
  br label %loop

case12:                                           ; preds = %32
  store i32 13, ptr %b, align 4
  br label %loop

case13:                                           ; preds = %41
  store i32 19, ptr %b, align 4
  br label %loop

case14:                                           ; preds = %41
  store i32 17, ptr %b, align 4
  br label %loop

case15:                                           ; preds = %41
  store i32 18, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_switch_case_blocks(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  %7 = load i32, ptr %1, align 4
  %8 = add nsw i32 %7, 10
  store i32 %8, ptr %2, align 4
  %9 = load i32, ptr %1, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %11 = load i32, ptr %1, align 4
  %12 = and i32 %11, 3
  switch i32 %12, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
  ]

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %4, align 4
  %17 = load i32, ptr %4, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %4, align 4
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %1, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  %24 = load i32, ptr %3, align 4
  %25 = sub nsw i32 %23, %24
  store i32 %25, ptr %4, align 4
  %26 = load i32, ptr %4, align 4
  %27 = mul nsw i32 %26, 3
  store i32 %27, ptr %4, align 4
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %1, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %2, align 4
  %33 = load i32, ptr %3, align 4
  %34 = mul nsw i32 %32, %33
  store i32 %34, ptr %4, align 4
  %35 = load i32, ptr %4, align 4
  %36 = sub nsw i32 %35, 7
  store i32 %36, ptr %4, align 4
  %37 = load i32, ptr %4, align 4
  %38 = load i32, ptr %1, align 4
  %39 = xor i32 %37, %38
  store i32 %39, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %41 = load i32, ptr %2, align 4
  %42 = load i32, ptr %3, align 4
  %43 = xor i32 %41, %42
  store i32 %43, ptr %4, align 4
  %44 = load i32, ptr %4, align 4
  %45 = add nsw i32 %44, 100
  store i32 %45, ptr %4, align 4
  %46 = load i32, ptr %4, align 4
  %47 = load i32, ptr %1, align 4
  %48 = add nsw i32 %46, %47
  store i32 %48, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, 17
  store i32 %51, ptr %5, align 4
  %52 = load i32, ptr %5, align 4
  ret i32 %52

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %6
    i32 1, label %13
    i32 2, label %22
    i32 3, label %31
    i32 4, label %40
    i32 5, label %49
  ]

loop:                                             ; preds = %40, %31, %22, %13, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %6
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %6
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %6
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_switch_nested_fallthrough(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  %5 = and i32 %4, 1
  switch i32 %5, label %case [
    i32 0, label %case1
    i32 1, label %case2
  ]

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = and i32 %7, 3
  switch i32 %8, label %case3 [
    i32 0, label %case4
    i32 2, label %case5
  ]

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 20
  store i32 %14, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 -10, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %1, align 4
  %19 = and i32 %18, 3
  switch i32 %19, label %case6 [
    i32 1, label %case7
    i32 3, label %case8
  ]

20:                                               ; preds = %switch
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, 30
  store i32 %22, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 40
  store i32 %25, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  store i32 -20, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %2, align 4
  ret i32 %29

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b9 = load i32, ptr %b, align 4
  switch i32 %b9, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %15
    i32 5, label %16
    i32 6, label %17
    i32 7, label %20
    i32 8, label %23
    i32 9, label %26
    i32 10, label %27
    i32 11, label %28
  ]

loop:                                             ; preds = %27, %26, %23, %20, %case8, %case7, %case6, %16, %15, %12, %9, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 11, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 6, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %6
  store i32 4, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %6
  store i32 2, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %17
  store i32 9, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %17
  store i32 7, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %17
  store i32 8, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_switch_large(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
    i32 3, label %case4
    i32 4, label %case5
    i32 5, label %case6
    i32 6, label %case7
    i32 7, label %case8
    i32 8, label %case9
    i32 9, label %case10
    i32 10, label %case11
    i32 20, label %case12
    i32 50, label %case13
    i32 100, label %case14
  ]

5:                                                ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  store i32 101, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 102, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 103, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 104, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 105, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 106, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 107, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 108, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 109, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 110, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 120, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 150, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %2, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b15 = load i32, ptr %b, align 4
  switch i32 %b15, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
    i32 5, label %9
    i32 6, label %10
    i32 7, label %11
    i32 8, label %12
    i32 9, label %13
    i32 10, label %14
    i32 11, label %15
    i32 12, label %16
    i32 13, label %17
    i32 14, label %18
    i32 15, label %19
    i32 16, label %20
  ]

loop:                                             ; preds = %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5, %case14, %case13, %case12, %case11, %case10, %case9, %case8, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 15, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %3
  store i32 5, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %3
  store i32 6, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %3
  store i32 7, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %3
  store i32 8, ptr %b, align 4
  br label %loop

case9:                                            ; preds = %3
  store i32 9, ptr %b, align 4
  br label %loop

case10:                                           ; preds = %3
  store i32 10, ptr %b, align 4
  br label %loop

case11:                                           ; preds = %3
  store i32 11, ptr %b, align 4
  br label %loop

case12:                                           ; preds = %3
  store i32 12, ptr %b, align 4
  br label %loop

case13:                                           ; preds = %3
  store i32 13, ptr %b, align 4
  br label %loop

case14:                                           ; preds = %3
  store i32 14, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_switch_sparse(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %case [
    i32 -1000, label %case1
    i32 -17, label %case2
    i32 -1, label %case3
    i32 0, label %case4
    i32 7, label %case5
    i32 42, label %case6
    i32 1337, label %case7
    i32 65535, label %case8
  ]

5:                                                ; preds = %switch
  store i32 1, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  store i32 2, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 3, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 4, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 5, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 6, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 7, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 8, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 999, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  ret i32 %15

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b9 = load i32, ptr %b, align 4
  switch i32 %b9, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
    i32 5, label %9
    i32 6, label %10
    i32 7, label %11
    i32 8, label %12
    i32 9, label %13
    i32 10, label %14
  ]

loop:                                             ; preds = %13, %12, %11, %10, %9, %8, %7, %6, %5, %case8, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 9, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %3
  store i32 4, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %3
  store i32 5, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %3
  store i32 6, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %3
  store i32 7, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %3
  store i32 8, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_switch_very_nested(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  %7 = load i32, ptr %1, align 4
  %8 = xor i32 %7, 4660
  %9 = and i32 %8, 15
  store i32 %9, ptr %2, align 4
  %10 = load i32, ptr %1, align 4
  %11 = mul nsw i32 %10, 3
  %12 = add nsw i32 %11, 7
  %13 = and i32 %12, 7
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = xor i32 %14, %15
  %17 = and i32 %16, 3
  store i32 %17, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %18 = load i32, ptr %2, align 4
  %19 = and i32 %18, 3
  switch i32 %19, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
  ]

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = and i32 %21, 3
  switch i32 %22, label %case4 [
    i32 0, label %case5
    i32 1, label %case6
  ]

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  switch i32 %24, label %case7 [
    i32 0, label %case8
    i32 1, label %case9
  ]

25:                                               ; preds = %switch
  store i32 1000, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  store i32 1001, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 1002, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  store i32 1010, ptr %5, align 4
  store i32 9, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  store i32 1020, ptr %5, align 4
  store i32 9, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  store i32 26, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %3, align 4
  %34 = and i32 %33, 3
  switch i32 %34, label %case10 [
    i32 0, label %case11
    i32 1, label %case12
  ]

35:                                               ; preds = %switch
  store i32 1100, ptr %5, align 4
  store i32 19, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = load i32, ptr %4, align 4
  switch i32 %37, label %case13 [
    i32 0, label %case14
    i32 1, label %case15
    i32 2, label %case16
  ]

38:                                               ; preds = %switch
  store i32 1110, ptr %5, align 4
  store i32 17, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  store i32 1111, ptr %5, align 4
  store i32 17, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  store i32 1112, ptr %5, align 4
  store i32 17, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  store i32 1113, ptr %5, align 4
  store i32 17, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  store i32 1120, ptr %5, align 4
  store i32 19, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  store i32 26, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load i32, ptr %4, align 4
  switch i32 %46, label %case17 [
    i32 0, label %case18
    i32 1, label %case19
  ]

47:                                               ; preds = %switch
  store i32 1200, ptr %5, align 4
  store i32 24, ptr %b, align 4
  br label %loop

48:                                               ; preds = %switch
  store i32 1201, ptr %5, align 4
  store i32 24, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  store i32 1299, ptr %5, align 4
  store i32 24, ptr %b, align 4
  br label %loop

50:                                               ; preds = %switch
  store i32 26, ptr %b, align 4
  br label %loop

51:                                               ; preds = %switch
  store i32 1300, ptr %5, align 4
  store i32 26, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = load i32, ptr %5, align 4
  %54 = load i32, ptr %1, align 4
  %55 = add nsw i32 %53, %54
  ret i32 %55

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b20 = load i32, ptr %b, align 4
  switch i32 %b20, label %default [
    i32 0, label %6
    i32 1, label %20
    i32 2, label %23
    i32 3, label %25
    i32 4, label %26
    i32 5, label %27
    i32 6, label %28
    i32 7, label %29
    i32 8, label %30
    i32 9, label %31
    i32 10, label %32
    i32 11, label %35
    i32 12, label %36
    i32 13, label %38
    i32 14, label %39
    i32 15, label %40
    i32 16, label %41
    i32 17, label %42
    i32 18, label %43
    i32 19, label %44
    i32 20, label %45
    i32 21, label %47
    i32 22, label %48
    i32 23, label %49
    i32 24, label %50
    i32 25, label %51
    i32 26, label %52
  ]

loop:                                             ; preds = %51, %50, %49, %48, %47, %case19, %case18, %case17, %44, %43, %42, %41, %40, %39, %38, %case16, %case15, %case14, %case13, %35, %case12, %case11, %case10, %31, %30, %29, %28, %27, %26, %25, %case9, %case8, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %6
  store i32 25, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %6
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %6
  store i32 10, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %6
  store i32 20, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %20
  store i32 8, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %20
  store i32 2, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %20
  store i32 7, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %23
  store i32 5, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %23
  store i32 3, ptr %b, align 4
  br label %loop

case9:                                            ; preds = %23
  store i32 4, ptr %b, align 4
  br label %loop

case10:                                           ; preds = %32
  store i32 18, ptr %b, align 4
  br label %loop

case11:                                           ; preds = %32
  store i32 11, ptr %b, align 4
  br label %loop

case12:                                           ; preds = %32
  store i32 12, ptr %b, align 4
  br label %loop

case13:                                           ; preds = %36
  store i32 16, ptr %b, align 4
  br label %loop

case14:                                           ; preds = %36
  store i32 13, ptr %b, align 4
  br label %loop

case15:                                           ; preds = %36
  store i32 14, ptr %b, align 4
  br label %loop

case16:                                           ; preds = %36
  store i32 15, ptr %b, align 4
  br label %loop

case17:                                           ; preds = %45
  store i32 23, ptr %b, align 4
  br label %loop

case18:                                           ; preds = %45
  store i32 21, ptr %b, align 4
  br label %loop

case19:                                           ; preds = %45
  store i32 22, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_switch_goto_nested_array(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca [4 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const._27_switch_goto_nested_array.values, i64 16, i1 false)
  store i32 0, ptr %3, align 4
  %6 = load i32, ptr %1, align 4
  %7 = and i32 %6, 3
  store i32 %7, ptr %4, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
  ]

9:                                                ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 15, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 20, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %1, align 4
  %15 = and i32 %14, 7
  switch i32 %15, label %case4 [
    i32 0, label %case5
    i32 4, label %case6
  ]

16:                                               ; preds = %switch
  %17 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 0
  %18 = load i32, ptr %17, align 16
  store i32 %18, ptr %3, align 4
  store i32 9, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 1
  %21 = load i32, ptr %20, align 4
  store i32 %21, ptr %3, align 4
  store i32 9, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 -1, ptr %3, align 4
  store i32 9, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %1, align 4
  %26 = and i32 %25, 7
  switch i32 %26, label %case7 [
    i32 1, label %case8
    i32 5, label %case9
  ]

27:                                               ; preds = %switch
  %28 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 1
  %29 = load i32, ptr %28, align 4
  store i32 %29, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 2
  %32 = load i32, ptr %31, align 8
  store i32 %32, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  store i32 -2, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %1, align 4
  %37 = and i32 %36, 7
  switch i32 %37, label %case10 [
    i32 2, label %case11
    i32 6, label %case12
  ]

38:                                               ; preds = %switch
  %39 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 2
  %40 = load i32, ptr %39, align 8
  store i32 %40, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 3
  %43 = load i32, ptr %42, align 4
  store i32 %43, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  store i32 -3, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %1, align 4
  %48 = and i32 %47, 7
  switch i32 %48, label %case13 [
    i32 3, label %case14
    i32 7, label %case15
  ]

49:                                               ; preds = %switch
  %50 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 3
  %51 = load i32, ptr %50, align 4
  store i32 %51, ptr %3, align 4
  store i32 24, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 0
  %54 = load i32, ptr %53, align 16
  %55 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 3
  %56 = load i32, ptr %55, align 4
  %57 = add nsw i32 %54, %56
  store i32 %57, ptr %3, align 4
  store i32 24, ptr %b, align 4
  br label %loop

58:                                               ; preds = %switch
  store i32 -4, ptr %3, align 4
  store i32 24, ptr %b, align 4
  br label %loop

59:                                               ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load i32, ptr %3, align 4
  ret i32 %61

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b16 = load i32, ptr %b, align 4
  switch i32 %b16, label %default [
    i32 0, label %5
    i32 1, label %9
    i32 2, label %10
    i32 3, label %11
    i32 4, label %12
    i32 5, label %13
    i32 6, label %16
    i32 7, label %19
    i32 8, label %22
    i32 9, label %23
    i32 10, label %24
    i32 11, label %27
    i32 12, label %30
    i32 13, label %33
    i32 14, label %34
    i32 15, label %35
    i32 16, label %38
    i32 17, label %41
    i32 18, label %44
    i32 19, label %45
    i32 20, label %46
    i32 21, label %49
    i32 22, label %52
    i32 23, label %58
    i32 24, label %59
    i32 25, label %60
  ]

loop:                                             ; preds = %59, %58, %52, %49, %case15, %case14, %case13, %45, %44, %41, %38, %case12, %case11, %case10, %34, %33, %30, %27, %case9, %case8, %case7, %23, %22, %19, %16, %case6, %case5, %case4, %12, %11, %10, %9, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %5
  store i32 4, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %5
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %5
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %13
  store i32 8, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %13
  store i32 6, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %13
  store i32 7, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %24
  store i32 13, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %24
  store i32 11, ptr %b, align 4
  br label %loop

case9:                                            ; preds = %24
  store i32 12, ptr %b, align 4
  br label %loop

case10:                                           ; preds = %35
  store i32 18, ptr %b, align 4
  br label %loop

case11:                                           ; preds = %35
  store i32 16, ptr %b, align 4
  br label %loop

case12:                                           ; preds = %35
  store i32 17, ptr %b, align 4
  br label %loop

case13:                                           ; preds = %46
  store i32 23, ptr %b, align 4
  br label %loop

case14:                                           ; preds = %46
  store i32 21, ptr %b, align 4
  br label %loop

case15:                                           ; preds = %46
  store i32 22, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_switch_pointer_to_pointer(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  store i32 20, ptr %3, align 4
  store i32 30, ptr %4, align 4
  store ptr %2, ptr %5, align 8
  store ptr %3, ptr %6, align 8
  store ptr %4, ptr %7, align 8
  store ptr %5, ptr %8, align 8
  %10 = load i32, ptr %1, align 4
  %11 = srem i32 %10, 3
  switch i32 %11, label %case [
    i32 0, label %case1
    i32 1, label %case2
  ]

12:                                               ; preds = %switch
  store ptr %5, ptr %8, align 8
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store ptr %6, ptr %8, align 8
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store ptr %7, ptr %8, align 8
  store i32 4, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load ptr, ptr %8, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %1, align 4
  %20 = add nsw i32 %18, %19
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %9
    i32 1, label %12
    i32 2, label %13
    i32 3, label %14
    i32 4, label %15
  ]

loop:                                             ; preds = %14, %13, %12, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %9
  store i32 3, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %9
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %9
  store i32 2, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_switch_combined(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca [8 x i32], align 16
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const._29_switch_combined.values, i64 32, i1 false)
  %8 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 0
  store ptr %8, ptr %3, align 8
  store i32 0, ptr %4, align 4
  %9 = load i32, ptr %1, align 4
  %10 = xor i32 %9, 170
  %11 = and i32 %10, 7
  store i32 %11, ptr %5, align 4
  %12 = load i32, ptr %1, align 4
  %13 = mul nsw i32 %12, 7
  %14 = add nsw i32 %13, 3
  %15 = and i32 %14, 3
  store i32 %15, ptr %6, align 4
  %16 = load i32, ptr %5, align 4
  switch i32 %16, label %case [
    i32 0, label %case1
    i32 1, label %case2
    i32 2, label %case3
    i32 3, label %case4
    i32 4, label %case5
    i32 5, label %case6
    i32 6, label %case7
  ]

17:                                               ; preds = %switch
  %18 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 0
  store ptr %18, ptr %3, align 8
  store i32 9, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 1
  store ptr %20, ptr %3, align 8
  store i32 9, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 2
  store ptr %22, ptr %3, align 8
  store i32 9, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 3
  store ptr %24, ptr %3, align 8
  store i32 9, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 4
  store ptr %26, ptr %3, align 8
  store i32 9, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 5
  store ptr %28, ptr %3, align 8
  store i32 9, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 6
  store ptr %30, ptr %3, align 8
  store i32 9, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 7
  store ptr %32, ptr %3, align 8
  store i32 9, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  switch i32 %34, label %case8 [
    i32 0, label %case9
    i32 1, label %case10
    i32 2, label %case11
  ]

35:                                               ; preds = %switch
  %36 = load ptr, ptr %3, align 8
  %37 = load i32, ptr %36, align 4
  %38 = and i32 %37, 3
  switch i32 %38, label %case12 [
    i32 0, label %case13
    i32 1, label %case14
    i32 2, label %case15
  ]

39:                                               ; preds = %switch
  %40 = load ptr, ptr %3, align 8
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %41, 100
  store i32 %42, ptr %4, align 4
  store i32 15, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load ptr, ptr %3, align 8
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %45, 200
  store i32 %46, ptr %4, align 4
  store i32 15, ptr %b, align 4
  br label %loop

47:                                               ; preds = %switch
  %48 = load ptr, ptr %3, align 8
  %49 = load i32, ptr %48, align 4
  %50 = add nsw i32 %49, 300
  store i32 %50, ptr %4, align 4
  store i32 15, ptr %b, align 4
  br label %loop

51:                                               ; preds = %switch
  %52 = load ptr, ptr %3, align 8
  %53 = load i32, ptr %52, align 4
  %54 = add nsw i32 %53, 400
  store i32 %54, ptr %4, align 4
  store i32 15, ptr %b, align 4
  br label %loop

55:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %loop

56:                                               ; preds = %switch
  %57 = load ptr, ptr %3, align 8
  %58 = load i32, ptr %57, align 4
  %59 = mul nsw i32 %58, 2
  store i32 %59, ptr %4, align 4
  store i32 19, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load ptr, ptr %3, align 8
  %62 = load i32, ptr %61, align 4
  %63 = mul nsw i32 %62, 3
  store i32 %63, ptr %4, align 4
  store i32 19, ptr %b, align 4
  br label %loop

64:                                               ; preds = %switch
  %65 = load ptr, ptr %3, align 8
  %66 = load i32, ptr %65, align 4
  %67 = mul nsw i32 %66, 4
  store i32 %67, ptr %4, align 4
  store i32 19, ptr %b, align 4
  br label %loop

68:                                               ; preds = %switch
  %69 = load i32, ptr %4, align 4
  %70 = load i32, ptr %1, align 4
  %71 = add nsw i32 %69, %70
  ret i32 %71

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b16 = load i32, ptr %b, align 4
  switch i32 %b16, label %default [
    i32 0, label %7
    i32 1, label %17
    i32 2, label %19
    i32 3, label %21
    i32 4, label %23
    i32 5, label %25
    i32 6, label %27
    i32 7, label %29
    i32 8, label %31
    i32 9, label %33
    i32 10, label %35
    i32 11, label %39
    i32 12, label %43
    i32 13, label %47
    i32 14, label %51
    i32 15, label %55
    i32 16, label %56
    i32 17, label %60
    i32 18, label %64
    i32 19, label %68
  ]

loop:                                             ; preds = %64, %60, %56, %55, %51, %47, %43, %39, %case15, %case14, %case13, %case12, %case11, %case10, %case9, %case8, %31, %29, %27, %25, %23, %21, %19, %17, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %7
  store i32 8, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %7
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %loop

case4:                                            ; preds = %7
  store i32 4, ptr %b, align 4
  br label %loop

case5:                                            ; preds = %7
  store i32 5, ptr %b, align 4
  br label %loop

case6:                                            ; preds = %7
  store i32 6, ptr %b, align 4
  br label %loop

case7:                                            ; preds = %7
  store i32 7, ptr %b, align 4
  br label %loop

case8:                                            ; preds = %33
  store i32 18, ptr %b, align 4
  br label %loop

case9:                                            ; preds = %33
  store i32 10, ptr %b, align 4
  br label %loop

case10:                                           ; preds = %33
  store i32 16, ptr %b, align 4
  br label %loop

case11:                                           ; preds = %33
  store i32 17, ptr %b, align 4
  br label %loop

case12:                                           ; preds = %35
  store i32 14, ptr %b, align 4
  br label %loop

case13:                                           ; preds = %35
  store i32 11, ptr %b, align 4
  br label %loop

case14:                                           ; preds = %35
  store i32 12, ptr %b, align 4
  br label %loop

case15:                                           ; preds = %35
  store i32 13, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 4, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %case [
    i32 1, label %case1
  ]

9:                                                ; preds = %switch
  store i32 4, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds ptr, ptr %11, i64 1
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 @atoi(ptr noundef %13) #4
  store i32 %14, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  %16 = load i32, ptr %5, align 4
  %17 = call i32 @_00_switch_simple(i32 noundef %16)
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %6, align 4
  %20 = load i32, ptr %5, align 4
  %21 = call i32 @_01_switch_default(i32 noundef %20)
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %6, align 4
  %24 = load i32, ptr %5, align 4
  %25 = call i32 @_02_switch_negative(i32 noundef %24)
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  %28 = load i32, ptr %5, align 4
  %29 = call i32 @_03_switch_fallthrough(i32 noundef %28)
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  %32 = load i32, ptr %5, align 4
  %33 = call i32 @_04_switch_fallthrough_steps(i32 noundef %32)
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %6, align 4
  %36 = load i32, ptr %5, align 4
  %37 = call i32 @_05_switch_before_after(i32 noundef %36)
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %6, align 4
  %40 = load i32, ptr %5, align 4
  %41 = call i32 @_06_switch_multiple(i32 noundef %40)
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %6, align 4
  %44 = load i32, ptr %5, align 4
  %45 = call i32 @_07_switch_two_independent(i32 noundef %44)
  %46 = load i32, ptr %6, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %6, align 4
  %48 = load i32, ptr %5, align 4
  %49 = call i32 @_08_switch_expression(i32 noundef %48)
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %6, align 4
  %52 = load i32, ptr %5, align 4
  %53 = call i32 @_09_switch_bitwise(i32 noundef %52)
  %54 = load i32, ptr %6, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %6, align 4
  %56 = load i32, ptr %5, align 4
  %57 = call i32 @_10_switch_array(i32 noundef %56)
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %6, align 4
  %60 = load i32, ptr %5, align 4
  %61 = call i32 @_11_switch_pointer(i32 noundef %60)
  %62 = load i32, ptr %6, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %6, align 4
  %64 = load i32, ptr %5, align 4
  %65 = call i32 @_12_switch_pointer_modify(i32 noundef %64)
  %66 = load i32, ptr %6, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %6, align 4
  %68 = load i32, ptr %5, align 4
  %69 = call i32 @_13_switch_nested(i32 noundef %68)
  %70 = load i32, ptr %6, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, ptr %6, align 4
  %72 = load i32, ptr %5, align 4
  %73 = call i32 @_14_switch_deep_nested(i32 noundef %72)
  %74 = load i32, ptr %6, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %6, align 4
  %76 = load i32, ptr %5, align 4
  %77 = call i32 @_15_switch_nested_array(i32 noundef %76)
  %78 = load i32, ptr %6, align 4
  %79 = add nsw i32 %78, %77
  store i32 %79, ptr %6, align 4
  %80 = load i32, ptr %5, align 4
  %81 = call i32 @_16_switch_nested_pointer(i32 noundef %80)
  %82 = load i32, ptr %6, align 4
  %83 = add nsw i32 %82, %81
  store i32 %83, ptr %6, align 4
  %84 = load i32, ptr %5, align 4
  %85 = call i32 @_17_switch_goto(i32 noundef %84)
  %86 = load i32, ptr %6, align 4
  %87 = add nsw i32 %86, %85
  store i32 %87, ptr %6, align 4
  %88 = load i32, ptr %5, align 4
  %89 = call i32 @_18_switch_multiple_goto(i32 noundef %88)
  %90 = load i32, ptr %6, align 4
  %91 = add nsw i32 %90, %89
  store i32 %91, ptr %6, align 4
  %92 = load i32, ptr %5, align 4
  %93 = call i32 @_19_switch_nested_goto(i32 noundef %92)
  %94 = load i32, ptr %6, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, ptr %6, align 4
  %96 = load i32, ptr %5, align 4
  %97 = call i32 @_20_switch_precomputed(i32 noundef %96)
  %98 = load i32, ptr %6, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, ptr %6, align 4
  %100 = load i32, ptr %5, align 4
  %101 = call i32 @_21_switch_complex_data(i32 noundef %100)
  %102 = load i32, ptr %6, align 4
  %103 = add nsw i32 %102, %101
  store i32 %103, ptr %6, align 4
  %104 = load i32, ptr %5, align 4
  %105 = call i32 @_22_switch_case_blocks(i32 noundef %104)
  %106 = load i32, ptr %6, align 4
  %107 = add nsw i32 %106, %105
  store i32 %107, ptr %6, align 4
  %108 = load i32, ptr %5, align 4
  %109 = call i32 @_23_switch_nested_fallthrough(i32 noundef %108)
  %110 = load i32, ptr %6, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, ptr %6, align 4
  %112 = load i32, ptr %5, align 4
  %113 = call i32 @_24_switch_large(i32 noundef %112)
  %114 = load i32, ptr %6, align 4
  %115 = add nsw i32 %114, %113
  store i32 %115, ptr %6, align 4
  %116 = load i32, ptr %5, align 4
  %117 = call i32 @_25_switch_sparse(i32 noundef %116)
  %118 = load i32, ptr %6, align 4
  %119 = add nsw i32 %118, %117
  store i32 %119, ptr %6, align 4
  %120 = load i32, ptr %5, align 4
  %121 = call i32 @_26_switch_very_nested(i32 noundef %120)
  %122 = load i32, ptr %6, align 4
  %123 = add nsw i32 %122, %121
  store i32 %123, ptr %6, align 4
  %124 = load i32, ptr %5, align 4
  %125 = call i32 @_27_switch_goto_nested_array(i32 noundef %124)
  %126 = load i32, ptr %6, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, ptr %6, align 4
  %128 = load i32, ptr %5, align 4
  %129 = call i32 @_28_switch_pointer_to_pointer(i32 noundef %128)
  %130 = load i32, ptr %6, align 4
  %131 = add nsw i32 %130, %129
  store i32 %131, ptr %6, align 4
  %132 = load i32, ptr %5, align 4
  %133 = call i32 @_29_switch_combined(i32 noundef %132)
  %134 = load i32, ptr %6, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, ptr %6, align 4
  %136 = load i32, ptr %6, align 4
  %137 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %136)
  ret i32 0

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b2 = load i32, ptr %b, align 4
  switch i32 %b2, label %default [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %10
    i32 3, label %15
  ]

loop:                                             ; preds = %10, %9, %case1, %case
  br label %switch

case:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %loop
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }

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
