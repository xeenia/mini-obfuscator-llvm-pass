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
  br label %2

2:                                                ; preds = %entry
  %3 = load i32, ptr @g_counter, align 4
  %4 = add nsw i32 %3, 5
  store i32 %4, ptr @g_counter, align 4
  store i32 0, ptr %0, align 4
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %8, %2
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %6, 4
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [4 x i32], ptr @g_config, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = load i32, ptr @g_counter, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %0, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %0, align 4
  %17 = load i32, ptr %1, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %1, align 4
  br label %5, !llvm.loop !8

19:                                               ; preds = %5
  %20 = load i32, ptr %0, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_loop_if_single_arg(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  store i32 -1, ptr %1, align 4
  br label %34

10:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %29, %10
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %32

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = srem i32 %16, 2
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %24

19:                                               ; preds = %15
  %20 = load i32, ptr %4, align 4
  %21 = mul nsw i32 %20, 2
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %3, align 4
  br label %28

24:                                               ; preds = %15
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %3, align 4
  br label %28

28:                                               ; preds = %24, %19
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %11, !llvm.loop !10

32:                                               ; preds = %11
  %33 = load i32, ptr %3, align 4
  store i32 %33, ptr %1, align 4
  br label %34

34:                                               ; preds = %32, %9
  %35 = load i32, ptr %1, align 4
  ret i32 %35
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
  br label %8

8:                                                ; preds = %entry
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  br label %9

9:                                                ; preds = %8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = icmp sle i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12, %9
  store i32 0, ptr %2, align 4
  br label %40

16:                                               ; preds = %12
  store i32 0, ptr %5, align 4
  %17 = load ptr, ptr %3, align 8
  store ptr %17, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %18

18:                                               ; preds = %35, %16
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %38

22:                                               ; preds = %18
  %23 = load ptr, ptr %6, align 8
  %24 = load i32, ptr %23, align 4
  %25 = mul nsw i32 %24, 2
  %26 = load i32, ptr @g_counter, align 4
  %27 = add nsw i32 %25, %26
  %28 = load ptr, ptr %6, align 8
  store i32 %27, ptr %28, align 4
  %29 = load ptr, ptr %6, align 8
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %5, align 4
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds i32, ptr %33, i32 1
  store ptr %34, ptr %6, align 8
  br label %35

35:                                               ; preds = %22
  %36 = load i32, ptr %7, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %7, align 4
  br label %18, !llvm.loop !11

38:                                               ; preds = %18
  %39 = load i32, ptr %5, align 4
  store i32 %39, ptr %2, align 4
  br label %40

40:                                               ; preds = %38, %15
  %41 = load i32, ptr %2, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_switch_goto(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = load i32, ptr %1, align 4
  %5 = and i32 %4, 3
  switch i32 %5, label %9 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
  ]

6:                                                ; preds = %3
  br label %11

7:                                                ; preds = %3
  store i32 100, ptr %2, align 4
  br label %10

8:                                                ; preds = %3
  br label %12

9:                                                ; preds = %3
  store i32 -1, ptr %2, align 4
  br label %10

10:                                               ; preds = %9, %7
  br label %13

11:                                               ; preds = %6
  store i32 50, ptr %2, align 4
  br label %13

12:                                               ; preds = %8
  store i32 200, ptr %2, align 4
  br label %13

13:                                               ; preds = %12, %11, %10
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr @g_counter, align 4
  %16 = add nsw i32 %14, %15
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_nested_loops_control(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %37, %7
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %40

12:                                               ; preds = %8
  %13 = load i32, ptr %5, align 4
  %14 = icmp eq i32 %13, 5
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %40

16:                                               ; preds = %12
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %33, %16
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %3, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %36

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = icmp eq i32 %22, 2
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  br label %33

25:                                               ; preds = %21
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  %30 = mul nsw i32 %27, %29
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %4, align 4
  br label %33

33:                                               ; preds = %25, %24
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  br label %17, !llvm.loop !12

36:                                               ; preds = %17
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %5, align 4
  br label %8, !llvm.loop !13

40:                                               ; preds = %15, %8
  %41 = load i32, ptr %4, align 4
  ret i32 %41
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
  br label %13

13:                                               ; preds = %entry
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  store i32 %5, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %14

14:                                               ; preds = %13
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %7, align 4
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %18, label %26

18:                                               ; preds = %14
  %19 = load i32, ptr %8, align 4
  %20 = load i32, ptr %9, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %26

22:                                               ; preds = %18
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %8, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, ptr %12, align 4
  br label %40

26:                                               ; preds = %18, %14
  %27 = load i32, ptr %10, align 4
  %28 = load i32, ptr %11, align 4
  %29 = icmp eq i32 %27, %28
  br i1 %29, label %30, label %33

30:                                               ; preds = %26
  %31 = load i32, ptr %10, align 4
  %32 = mul nsw i32 %31, 2
  store i32 %32, ptr %12, align 4
  br label %39

33:                                               ; preds = %26
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %9, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr %11, align 4
  %38 = add nsw i32 %36, %37
  store i32 %38, ptr %12, align 4
  br label %39

39:                                               ; preds = %33, %30
  br label %40

40:                                               ; preds = %39, %22
  %41 = load i32, ptr %11, align 4
  %42 = srem i32 %41, 3
  switch i32 %42, label %49 [
    i32 0, label %43
    i32 1, label %46
  ]

43:                                               ; preds = %40
  %44 = load i32, ptr %12, align 4
  %45 = add nsw i32 %44, 10
  store i32 %45, ptr %12, align 4
  br label %52

46:                                               ; preds = %40
  %47 = load i32, ptr %12, align 4
  %48 = add nsw i32 %47, 20
  store i32 %48, ptr %12, align 4
  br label %52

49:                                               ; preds = %40
  %50 = load i32, ptr %12, align 4
  %51 = add nsw i32 %50, 30
  store i32 %51, ptr %12, align 4
  br label %52

52:                                               ; preds = %49, %46, %43
  %53 = load i32, ptr %12, align 4
  ret i32 %53
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
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  %7 = load i32, ptr %1, align 4
  store i32 %7, ptr %2, align 4
  store ptr %2, ptr %3, align 8
  store ptr %3, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %23, %6
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %9, align 8
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 3
  store i32 %12, ptr %10, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %5, align 4
  br label %15

15:                                               ; preds = %8
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %17, align 4
  %19 = icmp slt i32 %18, 20
  store i1 false, ptr %.reg2mem, align 1
  br i1 %19, label %20, label %23

20:                                               ; preds = %15
  %21 = load i32, ptr %5, align 4
  %22 = icmp slt i32 %21, 10
  store i1 %22, ptr %.reg2mem, align 1
  br label %23

23:                                               ; preds = %20, %15
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %8, label %24, !llvm.loop !14

24:                                               ; preds = %23
  %25 = load ptr, ptr %4, align 8
  %26 = load ptr, ptr %25, align 8
  %27 = load i32, ptr %26, align 4
  ret i32 %27
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
  br label %16

16:                                               ; preds = %entry
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
  br label %30

30:                                               ; preds = %57, %16
  %31 = load i32, ptr %15, align 4
  %32 = icmp slt i32 %31, 6
  br i1 %32, label %33, label %60

33:                                               ; preds = %30
  %34 = load ptr, ptr %13, align 8
  %35 = load i32, ptr %34, align 4
  %36 = srem i32 %35, 2
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %49

38:                                               ; preds = %33
  %39 = load ptr, ptr %13, align 8
  %40 = load i32, ptr %39, align 4
  %41 = load i32, ptr %15, align 4
  %42 = srem i32 %41, 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x i32], ptr @g_config, i64 0, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %40, %45
  %47 = load i32, ptr %14, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %14, align 4
  br label %54

49:                                               ; preds = %33
  %50 = load ptr, ptr %13, align 8
  %51 = load i32, ptr %50, align 4
  %52 = load i32, ptr %14, align 4
  %53 = sub nsw i32 %52, %51
  store i32 %53, ptr %14, align 4
  br label %54

54:                                               ; preds = %49, %38
  %55 = load ptr, ptr %13, align 8
  %56 = getelementptr inbounds i32, ptr %55, i32 1
  store ptr %56, ptr %13, align 8
  br label %57

57:                                               ; preds = %54
  %58 = load i32, ptr %15, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %15, align 4
  br label %30, !llvm.loop !15

60:                                               ; preds = %30
  %61 = load i32, ptr %14, align 4
  ret i32 %61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_goto_loop_statemachine(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %26, %6
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sge i32 %9, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  br label %29

13:                                               ; preds = %8
  %14 = load i32, ptr %4, align 4
  %15 = srem i32 %14, 3
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  %19 = mul nsw i32 %18, 2
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %5, align 4
  br label %26

22:                                               ; preds = %13
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %5, align 4
  br label %26

26:                                               ; preds = %22, %17
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %4, align 4
  br label %8

29:                                               ; preds = %12
  %30 = load i32, ptr %5, align 4
  ret i32 %30
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
  br label %17

17:                                               ; preds = %entry
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
  switch i32 %28, label %56 [
    i32 0, label %29
    i32 1, label %45
  ]

29:                                               ; preds = %17
  store i32 0, ptr %16, align 4
  br label %30

30:                                               ; preds = %41, %29
  %31 = load i32, ptr %16, align 4
  %32 = icmp slt i32 %31, 4
  br i1 %32, label %33, label %44

33:                                               ; preds = %30
  %34 = load ptr, ptr %14, align 8
  %35 = load i32, ptr %16, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr %34, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = load i32, ptr %15, align 4
  %40 = add nsw i32 %39, %38
  store i32 %40, ptr %15, align 4
  br label %41

41:                                               ; preds = %33
  %42 = load i32, ptr %16, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %16, align 4
  br label %30, !llvm.loop !16

44:                                               ; preds = %30
  br label %56

45:                                               ; preds = %17
  %46 = load i32, ptr %11, align 4
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %48, label %54

48:                                               ; preds = %45
  %49 = load i32, ptr %7, align 4
  %50 = load i32, ptr %8, align 4
  %51 = add nsw i32 %49, %50
  %52 = load i32, ptr %11, align 4
  %53 = mul nsw i32 %51, %52
  store i32 %53, ptr %15, align 4
  br label %55

54:                                               ; preds = %45
  br label %60

55:                                               ; preds = %48
  br label %56

56:                                               ; preds = %55, %44, %17
  %57 = load i32, ptr %15, align 4
  %58 = load i32, ptr @g_counter, align 4
  %59 = add nsw i32 %57, %58
  store i32 %59, ptr %6, align 4
  br label %67

60:                                               ; preds = %54
  %61 = load i32, ptr %9, align 4
  %62 = load i32, ptr %10, align 4
  %63 = add nsw i32 %61, %62
  %64 = load i32, ptr %12, align 4
  %65 = add nsw i32 %63, %64
  store i32 %65, ptr %15, align 4
  %66 = load i32, ptr %15, align 4
  store i32 %66, ptr %6, align 4
  br label %67

67:                                               ; preds = %60, %56
  %68 = load i32, ptr %6, align 4
  ret i32 %68
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
  br label %8

8:                                                ; preds = %entry
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 4, ptr %5, align 4
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %17

12:                                               ; preds = %9
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 1
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 @atoi(ptr noundef %15) #4
  store i32 %16, ptr %5, align 4
  br label %17

17:                                               ; preds = %12, %9
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 @__const.main.test_arr, i64 20, i1 false)
  store i32 0, ptr %7, align 4
  %18 = call i32 @_00_no_args_globals()
  %19 = load i32, ptr %7, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %7, align 4
  %21 = load i32, ptr %5, align 4
  %22 = call i32 @_01_loop_if_single_arg(i32 noundef %21)
  %23 = load i32, ptr %7, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %7, align 4
  %25 = getelementptr inbounds [5 x i32], ptr %6, i64 0, i64 0
  %26 = call i32 @_02_pointer_array_two_args(ptr noundef %25, i32 noundef 5)
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %7, align 4
  %29 = load i32, ptr %5, align 4
  %30 = call i32 @_03_switch_goto(i32 noundef %29)
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %7, align 4
  %33 = call i32 @_04_nested_loops_control(i32 noundef 3, i32 noundef 4)
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %7, align 4
  %36 = load i32, ptr %5, align 4
  %37 = load i32, ptr %5, align 4
  %38 = add nsw i32 %37, 1
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 2
  %41 = load i32, ptr %5, align 4
  %42 = add nsw i32 %41, 3
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %43, 4
  %45 = load i32, ptr %5, align 4
  %46 = add nsw i32 %45, 5
  %47 = call i32 @_05_six_args_compounds(i32 noundef %36, i32 noundef %38, i32 noundef %40, i32 noundef %42, i32 noundef %44, i32 noundef %46)
  %48 = load i32, ptr %7, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %7, align 4
  %50 = load i32, ptr %5, align 4
  %51 = call i32 @_06_double_pointer_dowhile(i32 noundef %50)
  %52 = load i32, ptr %7, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, ptr %7, align 4
  %54 = call i32 @_07_six_args_array_globals(i32 noundef 1, i32 noundef 2, i32 noundef 3, i32 noundef 4, i32 noundef 5, i32 noundef 6)
  %55 = load i32, ptr %7, align 4
  %56 = add nsw i32 %55, %54
  store i32 %56, ptr %7, align 4
  %57 = load i32, ptr %5, align 4
  %58 = add nsw i32 %57, 5
  %59 = call i32 @_08_goto_loop_statemachine(i32 noundef 1, i32 noundef %58)
  %60 = load i32, ptr %7, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, ptr %7, align 4
  %62 = load i32, ptr %5, align 4
  %63 = load i32, ptr %5, align 4
  %64 = add nsw i32 %63, 1
  %65 = load i32, ptr %5, align 4
  %66 = add nsw i32 %65, 2
  %67 = load i32, ptr %5, align 4
  %68 = add nsw i32 %67, 3
  %69 = load i32, ptr %5, align 4
  %70 = add nsw i32 %69, 4
  %71 = load i32, ptr %5, align 4
  %72 = add nsw i32 %71, 5
  %73 = call i32 @_09_six_args_full_mix(i32 noundef %62, i32 noundef %64, i32 noundef %66, i32 noundef %68, i32 noundef %70, i32 noundef %72)
  %74 = load i32, ptr %7, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %7, align 4
  %76 = load i32, ptr %7, align 4
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %76)
  ret i32 0
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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
