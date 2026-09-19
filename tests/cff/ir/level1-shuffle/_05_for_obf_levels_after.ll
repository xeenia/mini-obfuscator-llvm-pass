; ModuleID = '_05_for_obf_levels.bc'
source_filename = "_05_for_obf_levels.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_counter = internal global i32 0, align 4
@g_config = internal global [4 x i32] [i32 10, i32 20, i32 30, i32 40], align 16
@__const.main.test_arr = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_00_no_args_globals() #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 2, ptr %b, align 4
  br label %switch

2:                                                ; preds = %switch
  %3 = load i32, ptr @g_counter, align 4
  %4 = add nsw i32 %3, 5
  store i32 %4, ptr @g_counter, align 4
  store i32 0, ptr %0, align 4
  store i32 0, ptr %1, align 4
  store i32 3, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %6, 4
  %8 = select i1 %7, i32 0, i32 1
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %1, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [4 x i32], ptr @g_config, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = load i32, ptr @g_counter, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %0, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %0, align 4
  %18 = load i32, ptr %1, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %1, align 4
  store i32 3, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %0, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %20
    i32 2, label %2
    i32 3, label %5
  ]

loop:                                             ; preds = %5, %2, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_loop_if_single_arg(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 0
  %9 = select i1 %8, i32 8, i32 9
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 3, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 2, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %13, %14
  %16 = select i1 %15, i32 1, i32 4
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  %19 = srem i32 %18, 2
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 11, i32 7
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %4, align 4
  %24 = mul nsw i32 %23, 2
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  store i32 2, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %3, align 4
  store i32 %36, ptr %1, align 4
  store i32 3, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %1, align 4
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %17
    i32 2, label %12
    i32 3, label %37
    i32 4, label %35
    i32 5, label %32
    i32 6, label %31
    i32 7, label %27
    i32 8, label %10
    i32 9, label %11
    i32 10, label %6
    i32 11, label %22
  ]

loop:                                             ; preds = %22, %6, %11, %10, %27, %31, %32, %35, %12, %17, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_pointer_array_two_args(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %10, null
  %12 = select i1 %11, i32 6, i32 5
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp sle i32 %14, 0
  %16 = select i1 %15, i32 5, i32 7
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  %19 = load ptr, ptr %3, align 8
  store ptr %19, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 4, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %4, align 4
  %23 = icmp slt i32 %21, %22
  %24 = select i1 %23, i32 2, i32 1
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load ptr, ptr %6, align 8
  %27 = load i32, ptr %26, align 4
  %28 = mul nsw i32 %27, 2
  %29 = load i32, ptr @g_counter, align 4
  %30 = add nsw i32 %28, %29
  %31 = load ptr, ptr %6, align 8
  store i32 %30, ptr %31, align 4
  %32 = load ptr, ptr %6, align 8
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %5, align 4
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds i32, ptr %36, i32 1
  store ptr %37, ptr %6, align 8
  store i32 8, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %7, align 4
  store i32 4, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %5, align 4
  store i32 %42, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load i32, ptr %2, align 4
  ret i32 %44

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %41
    i32 2, label %25
    i32 3, label %9
    i32 4, label %20
    i32 5, label %17
    i32 6, label %13
    i32 7, label %18
    i32 8, label %38
    i32 9, label %43
  ]

loop:                                             ; preds = %38, %18, %13, %17, %20, %9, %25, %41, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_switch_goto(i32 noundef %0) #0 {
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
  store i32 8, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 50, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr @g_counter, align 4
  %16 = add nsw i32 %14, %15
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %3
    i32 1, label %8
    i32 2, label %7
    i32 3, label %10
    i32 4, label %12
    i32 5, label %9
    i32 6, label %13
    i32 7, label %6
    i32 8, label %11
  ]

loop:                                             ; preds = %11, %6, %9, %12, %10, %7, %8, %case3, %case2, %case1, %case
  br label %switch

case:                                             ; preds = %3
  store i32 5, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %3
  store i32 7, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %loop

case3:                                            ; preds = %3
  store i32 1, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_nested_loops_control(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %9, %10
  %12 = select i1 %11, i32 10, i32 4
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = icmp eq i32 %14, 5
  %16 = select i1 %15, i32 12, i32 11
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %6, align 4
  %21 = load i32, ptr %3, align 4
  %22 = icmp slt i32 %20, %21
  %23 = select i1 %22, i32 8, i32 2
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = icmp eq i32 %25, 2
  %27 = select i1 %26, i32 9, i32 5
  store i32 %27, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, 1
  %32 = load i32, ptr %6, align 4
  %33 = add nsw i32 %32, 1
  %34 = mul nsw i32 %31, %33
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  store i32 1, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %5, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  %45 = load i32, ptr %4, align 4
  ret i32 %45

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %41
    i32 2, label %40
    i32 3, label %8
    i32 4, label %44
    i32 5, label %29
    i32 6, label %19
    i32 7, label %37
    i32 8, label %24
    i32 9, label %28
    i32 10, label %13
    i32 11, label %18
    i32 12, label %17
  ]

loop:                                             ; preds = %17, %18, %13, %28, %24, %37, %19, %29, %8, %40, %41, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_six_args_compounds(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
entry:
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 6, ptr %b, align 4
  br label %switch

13:                                               ; preds = %switch
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  store i32 %5, ptr %11, align 4
  store i32 0, ptr %12, align 4
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %7, align 4
  %17 = icmp sgt i32 %15, %16
  %18 = select i1 %17, i32 9, i32 8
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %9, align 4
  %22 = icmp slt i32 %20, %21
  %23 = select i1 %22, i32 2, i32 8
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, ptr %12, align 4
  store i32 12, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %10, align 4
  %30 = load i32, ptr %11, align 4
  %31 = icmp eq i32 %29, %30
  %32 = select i1 %31, i32 10, i32 0
  store i32 %32, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %10, align 4
  %35 = mul nsw i32 %34, 2
  store i32 %35, ptr %12, align 4
  store i32 7, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = load i32, ptr %7, align 4
  %38 = load i32, ptr %9, align 4
  %39 = add nsw i32 %37, %38
  %40 = load i32, ptr %11, align 4
  %41 = add nsw i32 %39, %40
  store i32 %41, ptr %12, align 4
  store i32 7, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load i32, ptr %11, align 4
  %45 = srem i32 %44, 3
  switch i32 %45, label %case [
    i32 0, label %case1
    i32 1, label %case2
  ]

46:                                               ; preds = %switch
  %47 = load i32, ptr %12, align 4
  %48 = add nsw i32 %47, 10
  store i32 %48, ptr %12, align 4
  store i32 11, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  %50 = load i32, ptr %12, align 4
  %51 = add nsw i32 %50, 20
  store i32 %51, ptr %12, align 4
  store i32 11, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = load i32, ptr %12, align 4
  %54 = add nsw i32 %53, 30
  store i32 %54, ptr %12, align 4
  store i32 11, ptr %b, align 4
  br label %loop

55:                                               ; preds = %switch
  %56 = load i32, ptr %12, align 4
  ret i32 %56

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %36
    i32 1, label %52
    i32 2, label %24
    i32 3, label %46
    i32 4, label %49
    i32 5, label %14
    i32 6, label %13
    i32 7, label %42
    i32 8, label %28
    i32 9, label %19
    i32 10, label %33
    i32 11, label %55
    i32 12, label %43
  ]

loop:                                             ; preds = %case2, %case1, %case, %33, %19, %28, %42, %13, %14, %49, %46, %24, %52, %36
  br label %switch

case:                                             ; preds = %43
  store i32 1, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %43
  store i32 3, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %43
  store i32 4, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_double_pointer_dowhile(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i1, align 1
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 5, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  %7 = load i32, ptr %1, align 4
  store i32 %7, ptr %2, align 4
  store ptr %2, ptr %3, align 8
  store ptr %3, ptr %4, align 8
  store i32 0, ptr %5, align 4
  store i32 2, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %9, align 8
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 3
  store i32 %12, ptr %10, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %17, align 4
  %19 = icmp slt i32 %18, 20
  store i1 false, ptr %.reg2mem, align 1
  %20 = select i1 %19, i32 0, i32 3
  store i32 %20, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %22, 10
  store i1 %23, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %25 = select i1 %.reload, i32 2, i32 1
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load ptr, ptr %4, align 8
  %28 = load ptr, ptr %27, align 8
  %29 = load i32, ptr %28, align 4
  ret i32 %29

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %21
    i32 1, label %26
    i32 2, label %8
    i32 3, label %24
    i32 4, label %15
    i32 5, label %6
  ]

loop:                                             ; preds = %6, %15, %24, %8, %21
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_six_args_array_globals(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
entry:
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [6 x i32], align 16
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 2, ptr %b, align 4
  br label %switch

16:                                               ; preds = %switch
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  store i32 %5, ptr %11, align 4
  %17 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0
  %18 = load i32, ptr %6, align 4
  store i32 %18, ptr %17, align 4
  %19 = getelementptr inbounds i32, ptr %17, i64 1
  %20 = load i32, ptr %7, align 4
  store i32 %20, ptr %19, align 4
  %21 = getelementptr inbounds i32, ptr %19, i64 1
  %22 = load i32, ptr %8, align 4
  store i32 %22, ptr %21, align 4
  %23 = getelementptr inbounds i32, ptr %21, i64 1
  %24 = load i32, ptr %9, align 4
  store i32 %24, ptr %23, align 4
  %25 = getelementptr inbounds i32, ptr %23, i64 1
  %26 = load i32, ptr %10, align 4
  store i32 %26, ptr %25, align 4
  %27 = getelementptr inbounds i32, ptr %25, i64 1
  %28 = load i32, ptr %11, align 4
  store i32 %28, ptr %27, align 4
  %29 = getelementptr inbounds [6 x i32], ptr %12, i64 0, i64 0
  store ptr %29, ptr %13, align 8
  store i32 0, ptr %14, align 4
  store i32 0, ptr %15, align 4
  store i32 3, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %15, align 4
  %32 = icmp slt i32 %31, 6
  %33 = select i1 %32, i32 1, i32 5
  store i32 %33, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load ptr, ptr %13, align 8
  %36 = load i32, ptr %35, align 4
  %37 = srem i32 %36, 2
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %38, i32 7, i32 4
  store i32 %39, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %41 = load ptr, ptr %13, align 8
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr %15, align 4
  %44 = srem i32 %43, 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [4 x i32], ptr @g_config, i64 0, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = add nsw i32 %42, %47
  %49 = load i32, ptr %14, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %14, align 4
  store i32 0, ptr %b, align 4
  br label %loop

51:                                               ; preds = %switch
  %52 = load ptr, ptr %13, align 8
  %53 = load i32, ptr %52, align 4
  %54 = load i32, ptr %14, align 4
  %55 = sub nsw i32 %54, %53
  store i32 %55, ptr %14, align 4
  store i32 0, ptr %b, align 4
  br label %loop

56:                                               ; preds = %switch
  %57 = load ptr, ptr %13, align 8
  %58 = getelementptr inbounds i32, ptr %57, i32 1
  store ptr %58, ptr %13, align 8
  store i32 6, ptr %b, align 4
  br label %loop

59:                                               ; preds = %switch
  %60 = load i32, ptr %15, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %15, align 4
  store i32 3, ptr %b, align 4
  br label %loop

62:                                               ; preds = %switch
  %63 = load i32, ptr %14, align 4
  ret i32 %63

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %56
    i32 1, label %34
    i32 2, label %16
    i32 3, label %30
    i32 4, label %51
    i32 5, label %62
    i32 6, label %59
    i32 7, label %40
  ]

loop:                                             ; preds = %40, %59, %51, %30, %16, %34, %56
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_goto_loop_statemachine(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 6, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sge i32 %9, %10
  %12 = select i1 %11, i32 1, i32 5
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 3, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = srem i32 %15, 3
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 0, i32 2
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = mul nsw i32 %20, 2
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %19
    i32 1, label %13
    i32 2, label %24
    i32 3, label %31
    i32 4, label %28
    i32 5, label %14
    i32 6, label %6
    i32 7, label %8
  ]

loop:                                             ; preds = %8, %6, %14, %28, %24, %13, %19
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_six_args_full_mix(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
entry:
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [4 x i32], align 16
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 5, ptr %b, align 4
  br label %switch

17:                                               ; preds = %switch
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  %18 = getelementptr inbounds [4 x i32], ptr %13, i64 0, i64 0
  %19 = load i32, ptr %7, align 4
  store i32 %19, ptr %18, align 4
  %20 = getelementptr inbounds i32, ptr %18, i64 1
  %21 = load i32, ptr %8, align 4
  store i32 %21, ptr %20, align 4
  %22 = getelementptr inbounds i32, ptr %20, i64 1
  %23 = load i32, ptr %9, align 4
  store i32 %23, ptr %22, align 4
  %24 = getelementptr inbounds i32, ptr %22, i64 1
  %25 = load i32, ptr %10, align 4
  store i32 %25, ptr %24, align 4
  %26 = getelementptr inbounds [4 x i32], ptr %13, i64 0, i64 0
  store ptr %26, ptr %14, align 8
  store i32 0, ptr %15, align 4
  %27 = load i32, ptr %12, align 4
  %28 = and i32 %27, 1
  switch i32 %28, label %case [
    i32 0, label %case1
    i32 1, label %case2
  ]

29:                                               ; preds = %switch
  store i32 0, ptr %16, align 4
  store i32 11, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %16, align 4
  %32 = icmp slt i32 %31, 4
  %33 = select i1 %32, i32 10, i32 8
  store i32 %33, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load ptr, ptr %14, align 8
  %36 = load i32, ptr %16, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = load i32, ptr %15, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %15, align 4
  store i32 7, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  %43 = load i32, ptr %16, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %16, align 4
  store i32 11, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  store i32 3, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %11, align 4
  %48 = icmp sgt i32 %47, 0
  %49 = select i1 %48, i32 2, i32 12
  store i32 %49, ptr %b, align 4
  br label %loop

50:                                               ; preds = %switch
  %51 = load i32, ptr %7, align 4
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %51, %52
  %54 = load i32, ptr %11, align 4
  %55 = mul nsw i32 %53, %54
  store i32 %55, ptr %15, align 4
  store i32 9, ptr %b, align 4
  br label %loop

56:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

57:                                               ; preds = %switch
  store i32 3, ptr %b, align 4
  br label %loop

58:                                               ; preds = %switch
  %59 = load i32, ptr %15, align 4
  %60 = load i32, ptr @g_counter, align 4
  %61 = add nsw i32 %59, %60
  store i32 %61, ptr %6, align 4
  store i32 0, ptr %b, align 4
  br label %loop

62:                                               ; preds = %switch
  %63 = load i32, ptr %9, align 4
  %64 = load i32, ptr %10, align 4
  %65 = add nsw i32 %63, %64
  %66 = load i32, ptr %12, align 4
  %67 = add nsw i32 %65, %66
  store i32 %67, ptr %15, align 4
  %68 = load i32, ptr %15, align 4
  store i32 %68, ptr %6, align 4
  store i32 0, ptr %b, align 4
  br label %loop

69:                                               ; preds = %switch
  %70 = load i32, ptr %6, align 4
  ret i32 %70

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %69
    i32 1, label %29
    i32 2, label %50
    i32 3, label %58
    i32 4, label %62
    i32 5, label %17
    i32 6, label %46
    i32 7, label %42
    i32 8, label %45
    i32 9, label %57
    i32 10, label %34
    i32 11, label %30
    i32 12, label %56
  ]

loop:                                             ; preds = %56, %30, %34, %57, %45, %42, %46, %case2, %case1, %case, %62, %58, %50, %29
  br label %switch

case:                                             ; preds = %17
  store i32 3, ptr %b, align 4
  br label %loop

case1:                                            ; preds = %17
  store i32 1, ptr %b, align 4
  br label %loop

case2:                                            ; preds = %17
  store i32 6, ptr %b, align 4
  br label %loop
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca [5 x i32], align 16
  %7 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 1, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 4, ptr %5, align 4
  store i32 0, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 1
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @atoi(ptr noundef %16) #4
  store i32 %17, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 @__const.main.test_arr, i64 20, i1 false)
  store i32 0, ptr %7, align 4
  %19 = call i32 @_00_no_args_globals()
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %7, align 4
  %22 = load i32, ptr %5, align 4
  %23 = call i32 @_01_loop_if_single_arg(i32 noundef %22)
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %7, align 4
  %26 = getelementptr inbounds [5 x i32], ptr %6, i64 0, i64 0
  %27 = call i32 @_02_pointer_array_two_args(ptr noundef %26, i32 noundef 5)
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %7, align 4
  %30 = load i32, ptr %5, align 4
  %31 = call i32 @_03_switch_goto(i32 noundef %30)
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %7, align 4
  %34 = call i32 @_04_nested_loops_control(i32 noundef 3, i32 noundef 4)
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %7, align 4
  %37 = load i32, ptr %5, align 4
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %40, 2
  %42 = load i32, ptr %5, align 4
  %43 = add nsw i32 %42, 3
  %44 = load i32, ptr %5, align 4
  %45 = add nsw i32 %44, 4
  %46 = load i32, ptr %5, align 4
  %47 = add nsw i32 %46, 5
  %48 = call i32 @_05_six_args_compounds(i32 noundef %37, i32 noundef %39, i32 noundef %41, i32 noundef %43, i32 noundef %45, i32 noundef %47)
  %49 = load i32, ptr %7, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %7, align 4
  %51 = load i32, ptr %5, align 4
  %52 = call i32 @_06_double_pointer_dowhile(i32 noundef %51)
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %7, align 4
  %55 = call i32 @_07_six_args_array_globals(i32 noundef 1, i32 noundef 2, i32 noundef 3, i32 noundef 4, i32 noundef 5, i32 noundef 6)
  %56 = load i32, ptr %7, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %7, align 4
  %58 = load i32, ptr %5, align 4
  %59 = add nsw i32 %58, 5
  %60 = call i32 @_08_goto_loop_statemachine(i32 noundef 1, i32 noundef %59)
  %61 = load i32, ptr %7, align 4
  %62 = add nsw i32 %61, %60
  store i32 %62, ptr %7, align 4
  %63 = load i32, ptr %5, align 4
  %64 = load i32, ptr %5, align 4
  %65 = add nsw i32 %64, 1
  %66 = load i32, ptr %5, align 4
  %67 = add nsw i32 %66, 2
  %68 = load i32, ptr %5, align 4
  %69 = add nsw i32 %68, 3
  %70 = load i32, ptr %5, align 4
  %71 = add nsw i32 %70, 4
  %72 = load i32, ptr %5, align 4
  %73 = add nsw i32 %72, 5
  %74 = call i32 @_09_six_args_full_mix(i32 noundef %63, i32 noundef %65, i32 noundef %67, i32 noundef %69, i32 noundef %71, i32 noundef %73)
  %75 = load i32, ptr %7, align 4
  %76 = add nsw i32 %75, %74
  store i32 %76, ptr %7, align 4
  %77 = load i32, ptr %7, align 4
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %77)
  ret i32 0

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %8
    i32 2, label %13
    i32 3, label %18
  ]

loop:                                             ; preds = %13, %8, %9
  br label %switch
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
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
