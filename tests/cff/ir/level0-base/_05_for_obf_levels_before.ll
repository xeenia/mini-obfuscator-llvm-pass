; ModuleID = '_05_for_obf_levels.c'
source_filename = "_05_for_obf_levels.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_counter = internal global i32 0, align 4
@g_config = internal global [4 x i32] [i32 10, i32 20, i32 30, i32 40], align 16
@__const.main.test_arr = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_00_no_args_globals() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, ptr @g_counter, align 4
  %4 = add nsw i32 %3, 5
  store i32 %4, ptr @g_counter, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %5

5:                                                ; preds = %8, %0
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %6, 4
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [4 x i32], ptr @g_config, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = load i32, ptr @g_counter, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %1, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %1, align 4
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %2, align 4
  br label %5, !llvm.loop !6

19:                                               ; preds = %5
  %20 = load i32, ptr %1, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_loop_if_single_arg(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store i32 -1, ptr %2, align 4
  br label %33

9:                                                ; preds = %1
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %28, %9
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %31

14:                                               ; preds = %10
  %15 = load i32, ptr %5, align 4
  %16 = srem i32 %15, 2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %23

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = mul nsw i32 %19, 2
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %4, align 4
  br label %27

23:                                               ; preds = %14
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  br label %27

27:                                               ; preds = %23, %18
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %5, align 4
  br label %10, !llvm.loop !8

31:                                               ; preds = %10
  %32 = load i32, ptr %4, align 4
  store i32 %32, ptr %2, align 4
  br label %33

33:                                               ; preds = %31, %8
  %34 = load i32, ptr %2, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_pointer_array_two_args(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %14

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4
  %13 = icmp sle i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %2
  store i32 0, ptr %3, align 4
  br label %39

15:                                               ; preds = %11
  store i32 0, ptr %6, align 4
  %16 = load ptr, ptr %4, align 8
  store ptr %16, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %17

17:                                               ; preds = %34, %15
  %18 = load i32, ptr %8, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %37

21:                                               ; preds = %17
  %22 = load ptr, ptr %7, align 8
  %23 = load i32, ptr %22, align 4
  %24 = mul nsw i32 %23, 2
  %25 = load i32, ptr @g_counter, align 4
  %26 = add nsw i32 %24, %25
  %27 = load ptr, ptr %7, align 8
  store i32 %26, ptr %27, align 4
  %28 = load ptr, ptr %7, align 8
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds i32, ptr %32, i32 1
  store ptr %33, ptr %7, align 8
  br label %34

34:                                               ; preds = %21
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %8, align 4
  br label %17, !llvm.loop !9

37:                                               ; preds = %17
  %38 = load i32, ptr %6, align 4
  store i32 %38, ptr %3, align 4
  br label %39

39:                                               ; preds = %37, %14
  %40 = load i32, ptr %3, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_switch_goto(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  %5 = and i32 %4, 3
  switch i32 %5, label %9 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
  ]

6:                                                ; preds = %1
  br label %11

7:                                                ; preds = %1
  store i32 100, ptr %3, align 4
  br label %10

8:                                                ; preds = %1
  br label %12

9:                                                ; preds = %1
  store i32 -1, ptr %3, align 4
  br label %10

10:                                               ; preds = %9, %7
  br label %13

11:                                               ; preds = %6
  store i32 50, ptr %3, align 4
  br label %13

12:                                               ; preds = %8
  store i32 200, ptr %3, align 4
  br label %13

13:                                               ; preds = %12, %11, %10
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr @g_counter, align 4
  %16 = add nsw i32 %14, %15
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_nested_loops_control(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %8

8:                                                ; preds = %37, %2
  %9 = load i32, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %40

12:                                               ; preds = %8
  %13 = load i32, ptr %6, align 4
  %14 = icmp eq i32 %13, 5
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %40

16:                                               ; preds = %12
  store i32 0, ptr %7, align 4
  br label %17

17:                                               ; preds = %33, %16
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %36

21:                                               ; preds = %17
  %22 = load i32, ptr %7, align 4
  %23 = icmp eq i32 %22, 2
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  br label %33

25:                                               ; preds = %21
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 1
  %30 = mul nsw i32 %27, %29
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %5, align 4
  br label %33

33:                                               ; preds = %25, %24
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %7, align 4
  br label %17, !llvm.loop !10

36:                                               ; preds = %17
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %6, align 4
  br label %8, !llvm.loop !11

40:                                               ; preds = %15, %8
  %41 = load i32, ptr %5, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_six_args_compounds(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  store i32 0, ptr %13, align 4
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %8, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %17, label %25

17:                                               ; preds = %6
  %18 = load i32, ptr %9, align 4
  %19 = load i32, ptr %10, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %25

21:                                               ; preds = %17
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %9, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %13, align 4
  br label %39

25:                                               ; preds = %17, %6
  %26 = load i32, ptr %11, align 4
  %27 = load i32, ptr %12, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %32

29:                                               ; preds = %25
  %30 = load i32, ptr %11, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %13, align 4
  br label %38

32:                                               ; preds = %25
  %33 = load i32, ptr %8, align 4
  %34 = load i32, ptr %10, align 4
  %35 = add nsw i32 %33, %34
  %36 = load i32, ptr %12, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, ptr %13, align 4
  br label %38

38:                                               ; preds = %32, %29
  br label %39

39:                                               ; preds = %38, %21
  %40 = load i32, ptr %12, align 4
  %41 = srem i32 %40, 3
  switch i32 %41, label %48 [
    i32 0, label %42
    i32 1, label %45
  ]

42:                                               ; preds = %39
  %43 = load i32, ptr %13, align 4
  %44 = add nsw i32 %43, 10
  store i32 %44, ptr %13, align 4
  br label %51

45:                                               ; preds = %39
  %46 = load i32, ptr %13, align 4
  %47 = add nsw i32 %46, 20
  store i32 %47, ptr %13, align 4
  br label %51

48:                                               ; preds = %39
  %49 = load i32, ptr %13, align 4
  %50 = add nsw i32 %49, 30
  store i32 %50, ptr %13, align 4
  br label %51

51:                                               ; preds = %48, %45, %42
  %52 = load i32, ptr %13, align 4
  ret i32 %52
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_double_pointer_dowhile(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %3, align 4
  store ptr %3, ptr %4, align 8
  store ptr %4, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %8

8:                                                ; preds = %23, %1
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %9, align 8
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 3
  store i32 %12, ptr %10, align 4
  %13 = load i32, ptr %6, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %6, align 4
  br label %15

15:                                               ; preds = %8
  %16 = load ptr, ptr %5, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %17, align 4
  %19 = icmp slt i32 %18, 20
  br i1 %19, label %20, label %23

20:                                               ; preds = %15
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %21, 10
  br label %23

23:                                               ; preds = %20, %15
  %24 = phi i1 [ false, %15 ], [ %22, %20 ]
  br i1 %24, label %8, label %25, !llvm.loop !12

25:                                               ; preds = %23
  %26 = load ptr, ptr %5, align 8
  %27 = load ptr, ptr %26, align 8
  %28 = load i32, ptr %27, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_six_args_array_globals(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [6 x i32], align 16
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  %17 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 0
  %18 = load i32, ptr %7, align 4
  store i32 %18, ptr %17, align 4
  %19 = getelementptr inbounds i32, ptr %17, i64 1
  %20 = load i32, ptr %8, align 4
  store i32 %20, ptr %19, align 4
  %21 = getelementptr inbounds i32, ptr %19, i64 1
  %22 = load i32, ptr %9, align 4
  store i32 %22, ptr %21, align 4
  %23 = getelementptr inbounds i32, ptr %21, i64 1
  %24 = load i32, ptr %10, align 4
  store i32 %24, ptr %23, align 4
  %25 = getelementptr inbounds i32, ptr %23, i64 1
  %26 = load i32, ptr %11, align 4
  store i32 %26, ptr %25, align 4
  %27 = getelementptr inbounds i32, ptr %25, i64 1
  %28 = load i32, ptr %12, align 4
  store i32 %28, ptr %27, align 4
  %29 = getelementptr inbounds [6 x i32], ptr %13, i64 0, i64 0
  store ptr %29, ptr %14, align 8
  store i32 0, ptr %15, align 4
  store i32 0, ptr %16, align 4
  br label %30

30:                                               ; preds = %57, %6
  %31 = load i32, ptr %16, align 4
  %32 = icmp slt i32 %31, 6
  br i1 %32, label %33, label %60

33:                                               ; preds = %30
  %34 = load ptr, ptr %14, align 8
  %35 = load i32, ptr %34, align 4
  %36 = srem i32 %35, 2
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %49

38:                                               ; preds = %33
  %39 = load ptr, ptr %14, align 8
  %40 = load i32, ptr %39, align 4
  %41 = load i32, ptr %16, align 4
  %42 = srem i32 %41, 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x i32], ptr @g_config, i64 0, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %40, %45
  %47 = load i32, ptr %15, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %15, align 4
  br label %54

49:                                               ; preds = %33
  %50 = load ptr, ptr %14, align 8
  %51 = load i32, ptr %50, align 4
  %52 = load i32, ptr %15, align 4
  %53 = sub nsw i32 %52, %51
  store i32 %53, ptr %15, align 4
  br label %54

54:                                               ; preds = %49, %38
  %55 = load ptr, ptr %14, align 8
  %56 = getelementptr inbounds i32, ptr %55, i32 1
  store ptr %56, ptr %14, align 8
  br label %57

57:                                               ; preds = %54
  %58 = load i32, ptr %16, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %16, align 4
  br label %30, !llvm.loop !13

60:                                               ; preds = %30
  %61 = load i32, ptr %15, align 4
  ret i32 %61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_goto_loop_statemachine(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  store i32 %7, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %8

8:                                                ; preds = %26, %2
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp sge i32 %9, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  br label %29

13:                                               ; preds = %8
  %14 = load i32, ptr %5, align 4
  %15 = srem i32 %14, 3
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %18, 2
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %6, align 4
  br label %26

22:                                               ; preds = %13
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %22, %17
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  br label %8

29:                                               ; preds = %12
  %30 = load i32, ptr %6, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_six_args_full_mix(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [4 x i32], align 16
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store i32 %2, ptr %10, align 4
  store i32 %3, ptr %11, align 4
  store i32 %4, ptr %12, align 4
  store i32 %5, ptr %13, align 4
  %18 = getelementptr inbounds [4 x i32], ptr %14, i64 0, i64 0
  %19 = load i32, ptr %8, align 4
  store i32 %19, ptr %18, align 4
  %20 = getelementptr inbounds i32, ptr %18, i64 1
  %21 = load i32, ptr %9, align 4
  store i32 %21, ptr %20, align 4
  %22 = getelementptr inbounds i32, ptr %20, i64 1
  %23 = load i32, ptr %10, align 4
  store i32 %23, ptr %22, align 4
  %24 = getelementptr inbounds i32, ptr %22, i64 1
  %25 = load i32, ptr %11, align 4
  store i32 %25, ptr %24, align 4
  %26 = getelementptr inbounds [4 x i32], ptr %14, i64 0, i64 0
  store ptr %26, ptr %15, align 8
  store i32 0, ptr %16, align 4
  %27 = load i32, ptr %13, align 4
  %28 = and i32 %27, 1
  switch i32 %28, label %56 [
    i32 0, label %29
    i32 1, label %45
  ]

29:                                               ; preds = %6
  store i32 0, ptr %17, align 4
  br label %30

30:                                               ; preds = %41, %29
  %31 = load i32, ptr %17, align 4
  %32 = icmp slt i32 %31, 4
  br i1 %32, label %33, label %44

33:                                               ; preds = %30
  %34 = load ptr, ptr %15, align 8
  %35 = load i32, ptr %17, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr %34, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = load i32, ptr %16, align 4
  %40 = add nsw i32 %39, %38
  store i32 %40, ptr %16, align 4
  br label %41

41:                                               ; preds = %33
  %42 = load i32, ptr %17, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %17, align 4
  br label %30, !llvm.loop !14

44:                                               ; preds = %30
  br label %56

45:                                               ; preds = %6
  %46 = load i32, ptr %12, align 4
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %48, label %54

48:                                               ; preds = %45
  %49 = load i32, ptr %8, align 4
  %50 = load i32, ptr %9, align 4
  %51 = add nsw i32 %49, %50
  %52 = load i32, ptr %12, align 4
  %53 = mul nsw i32 %51, %52
  store i32 %53, ptr %16, align 4
  br label %55

54:                                               ; preds = %45
  br label %60

55:                                               ; preds = %48
  br label %56

56:                                               ; preds = %6, %55, %44
  %57 = load i32, ptr %16, align 4
  %58 = load i32, ptr @g_counter, align 4
  %59 = add nsw i32 %57, %58
  store i32 %59, ptr %7, align 4
  br label %67

60:                                               ; preds = %54
  %61 = load i32, ptr %10, align 4
  %62 = load i32, ptr %11, align 4
  %63 = add nsw i32 %61, %62
  %64 = load i32, ptr %13, align 4
  %65 = add nsw i32 %63, %64
  store i32 %65, ptr %16, align 4
  %66 = load i32, ptr %16, align 4
  store i32 %66, ptr %7, align 4
  br label %67

67:                                               ; preds = %60, %56
  %68 = load i32, ptr %7, align 4
  ret i32 %68
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [5 x i32], align 16
  %8 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 4, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 1
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 1
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 @atoi(ptr noundef %14) #4
  store i32 %15, ptr %6, align 4
  br label %16

16:                                               ; preds = %11, %2
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %7, ptr align 16 @__const.main.test_arr, i64 20, i1 false)
  store i32 0, ptr %8, align 4
  %17 = call i32 @_00_no_args_globals()
  %18 = load i32, ptr %8, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %8, align 4
  %20 = load i32, ptr %6, align 4
  %21 = call i32 @_01_loop_if_single_arg(i32 noundef %20)
  %22 = load i32, ptr %8, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %8, align 4
  %24 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 0
  %25 = call i32 @_02_pointer_array_two_args(ptr noundef %24, i32 noundef 5)
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %8, align 4
  %28 = load i32, ptr %6, align 4
  %29 = call i32 @_03_switch_goto(i32 noundef %28)
  %30 = load i32, ptr %8, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %8, align 4
  %32 = call i32 @_04_nested_loops_control(i32 noundef 3, i32 noundef 4)
  %33 = load i32, ptr %8, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %8, align 4
  %35 = load i32, ptr %6, align 4
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 2
  %40 = load i32, ptr %6, align 4
  %41 = add nsw i32 %40, 3
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %42, 4
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, 5
  %46 = call i32 @_05_six_args_compounds(i32 noundef %35, i32 noundef %37, i32 noundef %39, i32 noundef %41, i32 noundef %43, i32 noundef %45)
  %47 = load i32, ptr %8, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %8, align 4
  %49 = load i32, ptr %6, align 4
  %50 = call i32 @_06_double_pointer_dowhile(i32 noundef %49)
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %8, align 4
  %53 = call i32 @_07_six_args_array_globals(i32 noundef 1, i32 noundef 2, i32 noundef 3, i32 noundef 4, i32 noundef 5, i32 noundef 6)
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %8, align 4
  %56 = load i32, ptr %6, align 4
  %57 = add nsw i32 %56, 5
  %58 = call i32 @_08_goto_loop_statemachine(i32 noundef 1, i32 noundef %57)
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %8, align 4
  %61 = load i32, ptr %6, align 4
  %62 = load i32, ptr %6, align 4
  %63 = add nsw i32 %62, 1
  %64 = load i32, ptr %6, align 4
  %65 = add nsw i32 %64, 2
  %66 = load i32, ptr %6, align 4
  %67 = add nsw i32 %66, 3
  %68 = load i32, ptr %6, align 4
  %69 = add nsw i32 %68, 4
  %70 = load i32, ptr %6, align 4
  %71 = add nsw i32 %70, 5
  %72 = call i32 @_09_six_args_full_mix(i32 noundef %61, i32 noundef %63, i32 noundef %65, i32 noundef %67, i32 noundef %69, i32 noundef %71)
  %73 = load i32, ptr %8, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %8, align 4
  %75 = load i32, ptr %8, align 4
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %75)
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

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
