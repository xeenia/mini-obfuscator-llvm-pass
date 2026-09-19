; ModuleID = '_02_loops.c'
source_filename = "_02_loops.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_x = dso_local global i32 10, align 4
@g_y = dso_local global i32 -3, align 4
@g_z = dso_local global i32 7, align 4
@g_n = dso_local global i32 4, align 4
@g_limit = dso_local global i32 10, align 4
@g_step = dso_local global i32 0, align 4
@g_arr = dso_local global [8 x i32] [i32 0, i32 1, i32 -2, i32 3, i32 -4, i32 5, i32 6, i32 -7], align 16
@g_mat = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 7, i32 8, i32 9]], align 16
@g_void_result = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@__const.main.pointer_data = private unnamed_addr constant [8 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_00_for_simple(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %4, align 4
  br label %5, !llvm.loop !6

16:                                               ; preds = %5
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_while_simple(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %9, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %15

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %3, align 4
  br label %5, !llvm.loop !8

15:                                               ; preds = %5
  %16 = load i32, ptr %4, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_dowhile_simple(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %11, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %4, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr %4, align 4
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %3, align 4
  br label %11

11:                                               ; preds = %5
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %5, label %15, !llvm.loop !9

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_for_empty_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %9, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %3, align 4
  br label %4, !llvm.loop !10

12:                                               ; preds = %4
  %13 = load i32, ptr %3, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_while_true_break(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %1, %15
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %4, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr %4, align 4
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %3, align 4
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %5
  br label %16

15:                                               ; preds = %5
  br label %5

16:                                               ; preds = %14
  %17 = load i32, ptr %4, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_for_continue(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %22, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  %14 = zext i1 %13 to i8
  store i8 %14, ptr %5, align 1
  %15 = load i8, ptr %5, align 1
  %16 = trunc i8 %15 to i1
  br i1 %16, label %17, label %18

17:                                               ; preds = %10
  br label %22

18:                                               ; preds = %10
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %3, align 4
  br label %22

22:                                               ; preds = %18, %17
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %6, !llvm.loop !11

25:                                               ; preds = %6
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_relational_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %7 = load i32, ptr %3, align 4
  store i32 %7, ptr %6, align 4
  br label %8

8:                                                ; preds = %16, %2
  %9 = load i32, ptr %6, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %19

12:                                               ; preds = %8
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr %5, align 4
  br label %16

16:                                               ; preds = %12
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %6, align 4
  br label %8, !llvm.loop !12

19:                                               ; preds = %8
  %20 = load i32, ptr %5, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_not_equal_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %9, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %9, label %19

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = zext i1 %14 to i64
  %16 = select i1 %14, i32 1, i32 -1
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %3, align 4
  br label %5, !llvm.loop !13

19:                                               ; preds = %5
  %20 = load i32, ptr %4, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_loop_and(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %17, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %15

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %12, %13
  br label %15

15:                                               ; preds = %11, %7
  %16 = phi i1 [ false, %7 ], [ %14, %11 ]
  br i1 %16, label %17, label %23

17:                                               ; preds = %15
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %6, align 4
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %5, align 4
  br label %7, !llvm.loop !14

23:                                               ; preds = %15
  %24 = load i32, ptr %6, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_loop_or(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %17, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %15, label %11

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %12, %13
  br label %15

15:                                               ; preds = %11, %7
  %16 = phi i1 [ true, %7 ], [ %14, %11 ]
  br i1 %16, label %17, label %23

17:                                               ; preds = %15
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %6, align 4
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %5, align 4
  br label %7, !llvm.loop !15

23:                                               ; preds = %15
  %24 = load i32, ptr %6, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_nested_loop_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %11

11:                                               ; preds = %44, %4
  %12 = load i32, ptr %9, align 4
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %23

15:                                               ; preds = %11
  %16 = load i32, ptr %9, align 4
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %33, label %19

19:                                               ; preds = %15
  %20 = load i32, ptr %9, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %33, label %23

23:                                               ; preds = %19, %11
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %8, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %31

27:                                               ; preds = %23
  %28 = load i32, ptr %9, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %28, %29
  br label %31

31:                                               ; preds = %27, %23
  %32 = phi i1 [ false, %23 ], [ %30, %27 ]
  br label %33

33:                                               ; preds = %31, %19, %15
  %34 = phi i1 [ true, %19 ], [ true, %15 ], [ %32, %31 ]
  br i1 %34, label %35, label %45

35:                                               ; preds = %33
  %36 = load i32, ptr %9, align 4
  %37 = load i32, ptr %10, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %10, align 4
  %39 = load i32, ptr %9, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %9, align 4
  %41 = load i32, ptr %9, align 4
  %42 = icmp sgt i32 %41, 20
  br i1 %42, label %43, label %44

43:                                               ; preds = %35
  br label %45

44:                                               ; preds = %35
  br label %11, !llvm.loop !16

45:                                               ; preds = %43, %33
  %46 = load i32, ptr %10, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_arithmetic_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %18, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %21

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = mul nsw i32 %10, 3
  %12 = load i32, ptr %4, align 4
  %13 = sub nsw i32 %12, 1
  %14 = mul nsw i32 %13, 2
  %15 = add nsw i32 %11, %14
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %3, align 4
  br label %18

18:                                               ; preds = %9
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %4, align 4
  br label %5, !llvm.loop !17

21:                                               ; preds = %5
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_nested_arithmetic_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %27, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %30

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %4, align 4
  %13 = sub nsw i32 %12, 1
  %14 = mul nsw i32 0, %13
  %15 = add nsw i32 %11, %14
  %16 = icmp eq i32 %10, %15
  br i1 %16, label %17, label %20

17:                                               ; preds = %9
  %18 = load i32, ptr %4, align 4
  %19 = mul nsw i32 %18, 2
  br label %23

20:                                               ; preds = %9
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 3
  br label %23

23:                                               ; preds = %20, %17
  %24 = phi i32 [ %19, %17 ], [ %22, %20 ]
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %3, align 4
  br label %27

27:                                               ; preds = %23
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %4, align 4
  br label %5, !llvm.loop !18

30:                                               ; preds = %5
  %31 = load i32, ptr %3, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_ternary_loop_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %23, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %26

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = mul nsw i32 %14, 2
  br label %19

16:                                               ; preds = %9
  %17 = load i32, ptr %4, align 4
  %18 = mul nsw i32 %17, 3
  br label %19

19:                                               ; preds = %16, %13
  %20 = phi i32 [ %15, %13 ], [ %18, %16 ]
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %3, align 4
  br label %23

23:                                               ; preds = %19
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %4, align 4
  br label %5, !llvm.loop !19

26:                                               ; preds = %5
  %27 = load i32, ptr %3, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_multiple_accumulators(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %35, %1
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %38

11:                                               ; preds = %7
  %12 = load i32, ptr %6, align 4
  %13 = srem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %11
  %16 = load i32, ptr %6, align 4
  br label %18

17:                                               ; preds = %11
  br label %18

18:                                               ; preds = %17, %15
  %19 = phi i32 [ %16, %15 ], [ 0, %17 ]
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %3, align 4
  %22 = load i32, ptr %6, align 4
  %23 = srem i32 %22, 2
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %18
  %26 = load i32, ptr %6, align 4
  br label %28

27:                                               ; preds = %18
  br label %28

28:                                               ; preds = %27, %25
  %29 = phi i32 [ %26, %25 ], [ 0, %27 ]
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %4, align 4
  %32 = load i32, ptr %6, align 4
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %5, align 4
  br label %35

35:                                               ; preds = %28
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %6, align 4
  br label %7, !llvm.loop !20

38:                                               ; preds = %7
  %39 = load i32, ptr %3, align 4
  %40 = load i32, ptr %4, align 4
  %41 = add nsw i32 %39, %40
  %42 = load i32, ptr %5, align 4
  %43 = add nsw i32 %41, %42
  ret i32 %43
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_nested_for(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %25, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %28

10:                                               ; preds = %6
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %21, %10
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %24

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %3, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %5, align 4
  br label %11, !llvm.loop !21

24:                                               ; preds = %11
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %6, !llvm.loop !22

28:                                               ; preds = %6
  %29 = load i32, ptr %3, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_for_while(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %24, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %27

10:                                               ; preds = %6
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %15, %10
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %23

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = mul nsw i32 %16, %17
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %3, align 4
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %5, align 4
  br label %11, !llvm.loop !23

23:                                               ; preds = %11
  br label %24

24:                                               ; preds = %23
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %4, align 4
  br label %6, !llvm.loop !24

27:                                               ; preds = %6
  %28 = load i32, ptr %3, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_while_dowhile(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %22, %1
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %19, %10
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %5, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %20, 2
  br i1 %21, label %11, label %22, !llvm.loop !25

22:                                               ; preds = %19
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %6, !llvm.loop !26

25:                                               ; preds = %6
  %26 = load i32, ptr %4, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_triple_for(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %36, %1
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %39

11:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %32, %11
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %35

16:                                               ; preds = %12
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %28, %16
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, 2
  br i1 %19, label %20, label %31

20:                                               ; preds = %17
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %3, align 4
  br label %28

28:                                               ; preds = %20
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  br label %17, !llvm.loop !27

31:                                               ; preds = %17
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %5, align 4
  br label %12, !llvm.loop !28

35:                                               ; preds = %12
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %4, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %4, align 4
  br label %7, !llvm.loop !29

39:                                               ; preds = %7
  %40 = load i32, ptr %3, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_mixed_nested_loops(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %33, %1
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %29, %11
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %32

15:                                               ; preds = %12
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %26, %15
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %3, align 4
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %16
  %27 = load i32, ptr %6, align 4
  %28 = icmp slt i32 %27, 2
  br i1 %28, label %16, label %29, !llvm.loop !30

29:                                               ; preds = %26
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %5, align 4
  br label %12, !llvm.loop !31

32:                                               ; preds = %12
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %4, align 4
  br label %7, !llvm.loop !32

36:                                               ; preds = %7
  %37 = load i32, ptr %3, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_inner_break(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %29, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %32

10:                                               ; preds = %6
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %25, %10
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %28

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %3, align 4
  %21 = load i32, ptr %5, align 4
  %22 = icmp sge i32 %21, 2
  br i1 %22, label %23, label %24

23:                                               ; preds = %15
  br label %28

24:                                               ; preds = %15
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %11, !llvm.loop !33

28:                                               ; preds = %23, %11
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %6, !llvm.loop !34

32:                                               ; preds = %6
  %33 = load i32, ptr %3, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_inner_continue(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %34, %1
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %37

11:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %30, %11
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %33

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  %20 = zext i1 %19 to i8
  store i8 %20, ptr %6, align 1
  %21 = load i8, ptr %6, align 1
  %22 = trunc i8 %21 to i1
  br i1 %22, label %23, label %24

23:                                               ; preds = %16
  br label %30

24:                                               ; preds = %16
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %3, align 4
  br label %30

30:                                               ; preds = %24, %23
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  br label %12, !llvm.loop !35

33:                                               ; preds = %12
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %4, align 4
  br label %7, !llvm.loop !36

37:                                               ; preds = %7
  %38 = load i32, ptr %3, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_break_with_ternary(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %37, %1
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %40

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 3
  %14 = zext i1 %13 to i64
  %15 = select i1 %13, i32 1, i32 0
  store i32 %15, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %33, %11
  %17 = load i32, ptr %6, align 4
  %18 = load i32, ptr %2, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %36

20:                                               ; preds = %16
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %3, align 4
  %26 = load i32, ptr %5, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %32

28:                                               ; preds = %20
  %29 = load i32, ptr %6, align 4
  %30 = icmp sge i32 %29, 2
  br i1 %30, label %31, label %32

31:                                               ; preds = %28
  br label %36

32:                                               ; preds = %28, %20
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  br label %16, !llvm.loop !37

36:                                               ; preds = %31, %16
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %4, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %4, align 4
  br label %7, !llvm.loop !38

40:                                               ; preds = %7
  %41 = load i32, ptr %3, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_continue_and_break(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %33, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %36

10:                                               ; preds = %6
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %31, %21, %10
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %32

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %5, align 4
  %19 = srem i32 %18, 2
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %15
  br label %11, !llvm.loop !39

22:                                               ; preds = %15
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %3, align 4
  %28 = load i32, ptr %3, align 4
  %29 = icmp sgt i32 %28, 30
  br i1 %29, label %30, label %31

30:                                               ; preds = %22
  br label %32

31:                                               ; preds = %22
  br label %11, !llvm.loop !39

32:                                               ; preds = %30, %11
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %4, align 4
  br label %6, !llvm.loop !40

36:                                               ; preds = %6
  %37 = load i32, ptr %3, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_early_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %19, %1
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %22

10:                                               ; preds = %6
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 20
  br i1 %15, label %16, label %18

16:                                               ; preds = %10
  %17 = load i32, ptr %4, align 4
  store i32 %17, ptr %2, align 4
  br label %24

18:                                               ; preds = %10
  br label %19

19:                                               ; preds = %18
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %6, !llvm.loop !41

22:                                               ; preds = %6
  %23 = load i32, ptr %4, align 4
  store i32 %23, ptr %2, align 4
  br label %24

24:                                               ; preds = %22, %16
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_nested_early_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %31, %1
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %34

11:                                               ; preds = %7
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %27, %11
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %30

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %4, align 4
  %22 = load i32, ptr %4, align 4
  %23 = icmp sgt i32 %22, 40
  br i1 %23, label %24, label %26

24:                                               ; preds = %16
  %25 = load i32, ptr %4, align 4
  store i32 %25, ptr %2, align 4
  br label %36

26:                                               ; preds = %16
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %12, !llvm.loop !42

30:                                               ; preds = %12
  br label %31

31:                                               ; preds = %30
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %5, align 4
  br label %7, !llvm.loop !43

34:                                               ; preds = %7
  %35 = load i32, ptr %4, align 4
  store i32 %35, ptr %2, align 4
  br label %36

36:                                               ; preds = %34, %24
  %37 = load i32, ptr %2, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_multiple_returns(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %16, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %4, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 20
  br i1 %13, label %14, label %16

14:                                               ; preds = %8
  %15 = load i32, ptr %4, align 4
  store i32 %15, ptr %2, align 4
  br label %21

16:                                               ; preds = %8
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, ptr %3, align 4
  br label %5, !llvm.loop !44

19:                                               ; preds = %5
  %20 = load i32, ptr %4, align 4
  store i32 %20, ptr %2, align 4
  br label %21

21:                                               ; preds = %19, %14
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_dowhile_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %18, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %5, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr %5, align 4
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = icmp sge i32 %10, %11
  br i1 %12, label %13, label %15

13:                                               ; preds = %6
  %14 = load i32, ptr %5, align 4
  store i32 %14, ptr %2, align 4
  br label %21

15:                                               ; preds = %6
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %4, align 4
  br label %18

18:                                               ; preds = %15
  br i1 true, label %6, label %19

19:                                               ; preds = %18
  %20 = load i32, ptr %5, align 4
  store i32 %20, ptr %2, align 4
  br label %21

21:                                               ; preds = %19, %13
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_for_while_for(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %34, %1
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %37

11:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %30, %11
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %33

15:                                               ; preds = %12
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %27, %15
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %17, 2
  br i1 %18, label %19, label %30

19:                                               ; preds = %16
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %3, align 4
  br label %27

27:                                               ; preds = %19
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %16, !llvm.loop !45

30:                                               ; preds = %16
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  br label %12, !llvm.loop !46

33:                                               ; preds = %12
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %4, align 4
  br label %7, !llvm.loop !47

37:                                               ; preds = %7
  %38 = load i32, ptr %3, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_while_for_dowhile(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %33, %1
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %30, %11
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %33

15:                                               ; preds = %12
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %26, %15
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %4, align 4
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %16
  %27 = load i32, ptr %6, align 4
  %28 = icmp slt i32 %27, 2
  br i1 %28, label %16, label %29, !llvm.loop !48

29:                                               ; preds = %26
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  br label %12, !llvm.loop !49

33:                                               ; preds = %12
  %34 = load i32, ptr %3, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %3, align 4
  br label %7, !llvm.loop !50

36:                                               ; preds = %7
  %37 = load i32, ptr %4, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_four_level_nesting(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %46, %1
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %49

12:                                               ; preds = %8
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %42, %12
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %14, 2
  br i1 %15, label %16, label %45

16:                                               ; preds = %13
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %38, %16
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, 2
  br i1 %19, label %20, label %41

20:                                               ; preds = %17
  store i32 0, ptr %7, align 4
  br label %21

21:                                               ; preds = %34, %20
  %22 = load i32, ptr %7, align 4
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %24, label %37

24:                                               ; preds = %21
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %3, align 4
  br label %34

34:                                               ; preds = %24
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %7, align 4
  br label %21, !llvm.loop !51

37:                                               ; preds = %21
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %6, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %6, align 4
  br label %17, !llvm.loop !52

41:                                               ; preds = %17
  br label %42

42:                                               ; preds = %41
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %5, align 4
  br label %13, !llvm.loop !53

45:                                               ; preds = %13
  br label %46

46:                                               ; preds = %45
  %47 = load i32, ptr %4, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %4, align 4
  br label %8, !llvm.loop !54

49:                                               ; preds = %8
  %50 = load i32, ptr %3, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_multiple_loop_variables(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %6 = load i32, ptr %2, align 4
  store i32 %6, ptr %5, align 4
  br label %7

7:                                                ; preds = %17, %1
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %3, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, ptr %5, align 4
  br label %7, !llvm.loop !55

22:                                               ; preds = %7
  %23 = load i32, ptr %3, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_complex_update(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, 2
  store i32 %15, ptr %4, align 4
  br label %5, !llvm.loop !56

16:                                               ; preds = %5
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_decreasing_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  store i32 %5, ptr %4, align 4
  br label %6

6:                                                ; preds = %13, %1
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, -1
  store i32 %15, ptr %4, align 4
  br label %6, !llvm.loop !57

16:                                               ; preds = %6
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_multiple_condition_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %9

9:                                                ; preds = %28, %3
  %10 = load i32, ptr %7, align 4
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %17

13:                                               ; preds = %9
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %5, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %26, label %17

17:                                               ; preds = %13, %9
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %24

21:                                               ; preds = %17
  %22 = load i32, ptr %7, align 4
  %23 = icmp slt i32 %22, 10
  br label %24

24:                                               ; preds = %21, %17
  %25 = phi i1 [ false, %17 ], [ %23, %21 ]
  br label %26

26:                                               ; preds = %24, %13
  %27 = phi i1 [ true, %13 ], [ %25, %24 ]
  br i1 %27, label %28, label %34

28:                                               ; preds = %26
  %29 = load i32, ptr %7, align 4
  %30 = load i32, ptr %8, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %8, align 4
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %7, align 4
  br label %9, !llvm.loop !58

34:                                               ; preds = %26
  %35 = load i32, ptr %8, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_computed_loop_limit(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %8, %9
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  %12 = load i32, ptr %3, align 4
  br label %15

13:                                               ; preds = %2
  %14 = load i32, ptr %4, align 4
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i32 [ %12, %11 ], [ %14, %13 ]
  store i32 %16, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %17

17:                                               ; preds = %27, %15
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %30

21:                                               ; preds = %17
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %5, align 4
  %24 = mul nsw i32 %22, %23
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %6, align 4
  br label %27

27:                                               ; preds = %21
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %7, align 4
  br label %17, !llvm.loop !59

30:                                               ; preds = %17
  %31 = load i32, ptr %6, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_array_for(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  %9 = load i32, ptr %2, align 4
  br label %11

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %10, %8
  %12 = phi i32 [ %9, %8 ], [ 8, %10 ]
  store i32 %12, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %24, %11
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %27

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %3, align 4
  br label %24

24:                                               ; preds = %17
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  br label %13, !llvm.loop !60

27:                                               ; preds = %13
  %28 = load i32, ptr %3, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_array_while(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  %9 = load i32, ptr %2, align 4
  br label %11

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %10, %8
  %12 = phi i32 [ %9, %8 ], [ 8, %10 ]
  store i32 %12, ptr %5, align 4
  br label %13

13:                                               ; preds = %17, %11
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %5, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %26

17:                                               ; preds = %13
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %4, align 4
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  br label %13, !llvm.loop !61

26:                                               ; preds = %13
  %27 = load i32, ptr %4, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_matrix_nested(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %11

9:                                                ; preds = %1
  %10 = load i32, ptr %2, align 4
  br label %12

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %11, %9
  %13 = phi i32 [ %10, %9 ], [ 3, %11 ]
  store i32 %13, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %14

14:                                               ; preds = %36, %12
  %15 = load i32, ptr %5, align 4
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %39

18:                                               ; preds = %14
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %32, %18
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %35

22:                                               ; preds = %19
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %24
  %26 = load i32, ptr %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x i32], ptr %25, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %3, align 4
  br label %32

32:                                               ; preds = %22
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %6, align 4
  br label %19, !llvm.loop !62

35:                                               ; preds = %19
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %5, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %5, align 4
  br label %14, !llvm.loop !63

39:                                               ; preds = %14
  %40 = load i32, ptr %3, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_array_controlled_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %15, %1
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 8
  br label %13

13:                                               ; preds = %10, %6
  %14 = phi i1 [ false, %6 ], [ %12, %10 ]
  br i1 %14, label %15, label %32

15:                                               ; preds = %13
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = icmp sge i32 %19, 0
  %21 = zext i1 %20 to i64
  %22 = select i1 %20, i32 1, i32 2
  store i32 %22, ptr %5, align 4
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %4, align 4
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %3, align 4
  br label %6, !llvm.loop !64

32:                                               ; preds = %13
  %33 = load i32, ptr %4, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_array_write_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  %9 = load i32, ptr %2, align 4
  br label %11

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %10, %8
  %12 = phi i32 [ %9, %8 ], [ 8, %10 ]
  store i32 %12, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %29, %11
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %32

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %18, 2
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  store i32 %19, ptr %22, align 4
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %4, align 4
  br label %29

29:                                               ; preds = %17
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %5, align 4
  br label %13, !llvm.loop !65

32:                                               ; preds = %13
  %33 = load i32, ptr %4, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_pointer_loop(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %19, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %5, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %6, align 4
  br label %7, !llvm.loop !66

22:                                               ; preds = %7
  %23 = load i32, ptr %5, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_pointer_increment(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %9, %2
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %18

9:                                                ; preds = %6
  %10 = load ptr, ptr %3, align 8
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr %5, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %5, align 4
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds i32, ptr %14, i32 1
  store ptr %15, ptr %3, align 8
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, ptr %4, align 4
  br label %6, !llvm.loop !67

18:                                               ; preds = %6
  %19 = load i32, ptr %5, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_pointer_write_loop(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %25, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %28

11:                                               ; preds = %7
  %12 = load i32, ptr %6, align 4
  %13 = mul nsw i32 %12, 3
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %6, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %14, i64 %16
  store i32 %13, ptr %17, align 4
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %6, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %5, align 4
  br label %25

25:                                               ; preds = %11
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %6, align 4
  br label %7, !llvm.loop !68

28:                                               ; preds = %7
  %29 = load i32, ptr %5, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_pointer_array_loop(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %8, 8
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  br label %13

12:                                               ; preds = %2
  br label %13

13:                                               ; preds = %12, %10
  %14 = phi i32 [ %11, %10 ], [ 8, %12 ]
  store i32 %14, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %15

15:                                               ; preds = %32, %13
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %35

19:                                               ; preds = %15
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %7, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, ptr %20, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = add nsw i32 %24, %28
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %5, align 4
  br label %32

32:                                               ; preds = %19
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %7, align 4
  br label %15, !llvm.loop !69

35:                                               ; preds = %15
  %36 = load i32, ptr %5, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_pointer_nested_loop(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %9

9:                                                ; preds = %36, %2
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %39

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %14, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = zext i1 %16 to i64
  %18 = select i1 %16, i32 3, i32 2
  store i32 %18, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %19

19:                                               ; preds = %32, %13
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %35

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %8, align 4
  %26 = add nsw i32 %24, %25
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %27, align 4
  %29 = add nsw i32 %26, %28
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %5, align 4
  br label %32

32:                                               ; preds = %23
  %33 = load i32, ptr %8, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %8, align 4
  br label %19, !llvm.loop !70

35:                                               ; preds = %19
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  br label %9, !llvm.loop !71

39:                                               ; preds = %9
  %40 = load i32, ptr %5, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_for() #0 {
  store i32 0, ptr @g_x, align 4
  br label %1

1:                                                ; preds = %9, %0
  %2 = load i32, ptr @g_x, align 4
  %3 = load i32, ptr @g_limit, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %12

5:                                                ; preds = %1
  %6 = load i32, ptr @g_x, align 4
  %7 = load i32, ptr @g_y, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr @g_y, align 4
  br label %9

9:                                                ; preds = %5
  %10 = load i32, ptr @g_x, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr @g_x, align 4
  br label %1, !llvm.loop !72

12:                                               ; preds = %1
  %13 = load i32, ptr @g_y, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_global_while() #0 {
  br label %1

1:                                                ; preds = %5, %0
  %2 = load i32, ptr @g_x, align 4
  %3 = load i32, ptr @g_limit, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = load i32, ptr @g_step, align 4
  %7 = load i32, ptr @g_x, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr @g_x, align 4
  br label %1, !llvm.loop !73

9:                                                ; preds = %1
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = add nsw i32 %10, %11
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_global_array_loop() #0 {
  store i32 0, ptr @g_x, align 4
  br label %1

1:                                                ; preds = %11, %0
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp slt i32 %2, 8
  br i1 %3, label %4, label %14

4:                                                ; preds = %1
  %5 = load i32, ptr @g_x, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = load i32, ptr @g_y, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, ptr @g_y, align 4
  br label %11

11:                                               ; preds = %4
  %12 = load i32, ptr @g_x, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr @g_x, align 4
  br label %1, !llvm.loop !74

14:                                               ; preds = %1
  %15 = load i32, ptr @g_y, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_global_matrix_loop() #0 {
  store i32 0, ptr @g_x, align 4
  br label %1

1:                                                ; preds = %22, %0
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp slt i32 %2, 3
  br i1 %3, label %4, label %25

4:                                                ; preds = %1
  store i32 0, ptr @g_y, align 4
  br label %5

5:                                                ; preds = %18, %4
  %6 = load i32, ptr @g_y, align 4
  %7 = icmp slt i32 %6, 3
  br i1 %7, label %8, label %21

8:                                                ; preds = %5
  %9 = load i32, ptr @g_x, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %10
  %12 = load i32, ptr @g_y, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr @g_z, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr @g_z, align 4
  br label %18

18:                                               ; preds = %8
  %19 = load i32, ptr @g_y, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr @g_y, align 4
  br label %5, !llvm.loop !75

21:                                               ; preds = %5
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr @g_x, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr @g_x, align 4
  br label %1, !llvm.loop !76

25:                                               ; preds = %1
  %26 = load i32, ptr @g_z, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_50_global_state_loop() #0 {
  store i32 0, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  br label %1

1:                                                ; preds = %5, %0
  %2 = load i32, ptr @g_x, align 4
  %3 = load i32, ptr @g_limit, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %11

5:                                                ; preds = %1
  %6 = load i32, ptr @g_x, align 4
  %7 = load i32, ptr @g_y, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr @g_y, align 4
  %9 = load i32, ptr @g_x, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr @g_x, align 4
  br label %1, !llvm.loop !77

11:                                               ; preds = %1
  %12 = load i32, ptr @g_y, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_51_global_nested() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr @g_x, align 4
  br label %2

2:                                                ; preds = %23, %0
  %3 = load i32, ptr @g_x, align 4
  %4 = load i32, ptr @g_n, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %26

6:                                                ; preds = %2
  store i32 0, ptr @g_y, align 4
  br label %7

7:                                                ; preds = %19, %6
  %8 = load i32, ptr @g_y, align 4
  %9 = load i32, ptr @g_limit, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i32, ptr @g_x, align 4
  %13 = load i32, ptr @g_y, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr @g_z, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr %1, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %1, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr @g_y, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr @g_y, align 4
  br label %7, !llvm.loop !78

22:                                               ; preds = %7
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr @g_x, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr @g_x, align 4
  br label %2, !llvm.loop !79

26:                                               ; preds = %2
  %27 = load i32, ptr %1, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_loop_carried_value(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %14, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %17

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %3, align 4
  br label %14

14:                                               ; preds = %9
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %4, align 4
  br label %5, !llvm.loop !80

17:                                               ; preds = %5
  %18 = load i32, ptr %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_multiple_loop_carried(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 2, ptr %4, align 4
  store i32 3, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %9

9:                                                ; preds = %25, %1
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %28

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  store i32 %14, ptr %7, align 4
  %15 = load i32, ptr %4, align 4
  store i32 %15, ptr %8, align 4
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %3, align 4
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, ptr %4, align 4
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %5, align 4
  br label %25

25:                                               ; preds = %13
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %6, align 4
  br label %9, !llvm.loop !81

28:                                               ; preds = %9
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_nested_loop_carried(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %22, %1
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  store i32 %11, ptr %5, align 4
  br label %12

12:                                               ; preds = %15, %10
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %21

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %3, align 4
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, -1
  store i32 %20, ptr %5, align 4
  br label %12, !llvm.loop !82

21:                                               ; preds = %12
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %6, !llvm.loop !83

25:                                               ; preds = %6
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_55_value_after_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 10, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %14, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %17

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %3, align 4
  br label %14

14:                                               ; preds = %9
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %4, align 4
  br label %5, !llvm.loop !84

17:                                               ; preds = %5
  %18 = load i32, ptr %3, align 4
  %19 = mul nsw i32 %18, 3
  store i32 %19, ptr %3, align 4
  %20 = load i32, ptr %2, align 4
  %21 = load i32, ptr %3, align 4
  %22 = sub nsw i32 %21, %20
  store i32 %22, ptr %3, align 4
  %23 = load i32, ptr %3, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_prefix_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %7, align 4
  %15 = load i32, ptr %7, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %8, align 4
  %17 = load i32, ptr %8, align 4
  %18 = sub nsw i32 %17, 3
  store i32 %18, ptr %9, align 4
  store i32 0, ptr %10, align 4
  store i32 0, ptr %11, align 4
  br label %19

19:                                               ; preds = %29, %3
  %20 = load i32, ptr %11, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %32

23:                                               ; preds = %19
  %24 = load i32, ptr %11, align 4
  %25 = load i32, ptr %9, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %10, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %10, align 4
  br label %29

29:                                               ; preds = %23
  %30 = load i32, ptr %11, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %11, align 4
  br label %19, !llvm.loop !85

32:                                               ; preds = %19
  %33 = load i32, ptr %10, align 4
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %33, %34
  %36 = load i32, ptr %8, align 4
  %37 = add nsw i32 %35, %36
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_suffix_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %4, align 4
  br label %5, !llvm.loop !86

16:                                               ; preds = %5
  %17 = load i32, ptr %3, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %3, align 4
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 10
  store i32 %20, ptr %3, align 4
  %21 = load i32, ptr %3, align 4
  %22 = mul nsw i32 %21, 3
  store i32 %22, ptr %3, align 4
  %23 = load i32, ptr %3, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_58_prefix_nested_suffix(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = mul nsw i32 %8, 2
  store i32 %9, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %10

10:                                               ; preds = %28, %2
  %11 = load i32, ptr %6, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %31

14:                                               ; preds = %10
  store i32 0, ptr %7, align 4
  br label %15

15:                                               ; preds = %24, %14
  %16 = load i32, ptr %7, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %18, label %27

18:                                               ; preds = %15
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  br label %24

24:                                               ; preds = %18
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %7, align 4
  br label %15, !llvm.loop !87

27:                                               ; preds = %15
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  br label %10, !llvm.loop !88

31:                                               ; preds = %10
  %32 = load i32, ptr %3, align 4
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %5, align 4
  %35 = load i32, ptr %5, align 4
  %36 = mul nsw i32 %35, 2
  store i32 %36, ptr %5, align 4
  %37 = load i32, ptr %5, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_59_ternary_loop_limit(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %8, %9
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  %12 = load i32, ptr %3, align 4
  br label %15

13:                                               ; preds = %2
  %14 = load i32, ptr %4, align 4
  br label %15

15:                                               ; preds = %13, %11
  %16 = phi i32 [ %12, %11 ], [ %14, %13 ]
  store i32 %16, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %17

17:                                               ; preds = %25, %15
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %28

21:                                               ; preds = %17
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %6, align 4
  br label %25

25:                                               ; preds = %21
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %7, align 4
  br label %17, !llvm.loop !89

28:                                               ; preds = %17
  %29 = load i32, ptr %6, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_60_ternary_loop_update(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %21

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  %17 = zext i1 %16 to i64
  %18 = select i1 %16, i32 1, i32 2
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  br label %5, !llvm.loop !90

21:                                               ; preds = %5
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_61_nested_ternary_loops(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %46, %1
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %49

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 3
  br i1 %13, label %14, label %19

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 6
  %17 = zext i1 %16 to i64
  %18 = select i1 %16, i32 3, i32 2
  br label %20

19:                                               ; preds = %11
  br label %20

20:                                               ; preds = %19, %14
  %21 = phi i32 [ %18, %14 ], [ 1, %19 ]
  store i32 %21, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %22

22:                                               ; preds = %42, %20
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %45

26:                                               ; preds = %22
  %27 = load i32, ptr %6, align 4
  %28 = srem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

30:                                               ; preds = %26
  %31 = load i32, ptr %4, align 4
  %32 = load i32, ptr %6, align 4
  %33 = add nsw i32 %31, %32
  br label %38

34:                                               ; preds = %26
  %35 = load i32, ptr %4, align 4
  %36 = load i32, ptr %6, align 4
  %37 = sub nsw i32 %35, %36
  br label %38

38:                                               ; preds = %34, %30
  %39 = phi i32 [ %33, %30 ], [ %37, %34 ]
  %40 = load i32, ptr %3, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %3, align 4
  br label %42

42:                                               ; preds = %38
  %43 = load i32, ptr %6, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %6, align 4
  br label %22, !llvm.loop !91

45:                                               ; preds = %22
  br label %46

46:                                               ; preds = %45
  %47 = load i32, ptr %4, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %4, align 4
  br label %7, !llvm.loop !92

49:                                               ; preds = %7
  %50 = load i32, ptr %3, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_62_dynamic_alloca(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = load i32, ptr %3, align 4
  br label %15

14:                                               ; preds = %2
  br label %15

15:                                               ; preds = %14, %12
  %16 = phi i32 [ %13, %12 ], [ 1, %14 ]
  store i32 %16, ptr %5, align 4
  %17 = load i32, ptr %5, align 4
  %18 = zext i32 %17 to i64
  %19 = call ptr @llvm.stacksave()
  store ptr %19, ptr %6, align 8
  %20 = alloca i32, i64 %18, align 16
  store i64 %18, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %21

21:                                               ; preds = %38, %15
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %5, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %41

25:                                               ; preds = %21
  %26 = load i32, ptr %4, align 4
  %27 = load i32, ptr %9, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr %9, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %20, i64 %30
  store i32 %28, ptr %31, align 4
  %32 = load i32, ptr %9, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, ptr %20, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = load i32, ptr %8, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, ptr %8, align 4
  br label %38

38:                                               ; preds = %25
  %39 = load i32, ptr %9, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %9, align 4
  br label %21, !llvm.loop !93

41:                                               ; preds = %21
  %42 = load i32, ptr %8, align 4
  %43 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %43)
  ret i32 %42
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_63_dynamic_alloca_pointer(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %2
  %15 = load i32, ptr %3, align 4
  br label %17

16:                                               ; preds = %2
  br label %17

17:                                               ; preds = %16, %14
  %18 = phi i32 [ %15, %14 ], [ 1, %16 ]
  store i32 %18, ptr %5, align 4
  %19 = load i32, ptr %5, align 4
  %20 = zext i32 %19 to i64
  %21 = call ptr @llvm.stacksave()
  store ptr %21, ptr %6, align 8
  %22 = alloca i32, i64 %20, align 16
  store i64 %20, ptr %7, align 8
  store ptr %22, ptr %8, align 8
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %23

23:                                               ; preds = %36, %17
  %24 = load i32, ptr %10, align 4
  %25 = load i32, ptr %5, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %39

27:                                               ; preds = %23
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %10, align 4
  %30 = mul nsw i32 %29, 2
  %31 = add nsw i32 %28, %30
  %32 = load ptr, ptr %8, align 8
  %33 = load i32, ptr %10, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr %32, i64 %34
  store i32 %31, ptr %35, align 4
  br label %36

36:                                               ; preds = %27
  %37 = load i32, ptr %10, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %10, align 4
  br label %23, !llvm.loop !94

39:                                               ; preds = %23
  store i32 0, ptr %11, align 4
  br label %40

40:                                               ; preds = %52, %39
  %41 = load i32, ptr %11, align 4
  %42 = load i32, ptr %5, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %55

44:                                               ; preds = %40
  %45 = load ptr, ptr %8, align 8
  %46 = load i32, ptr %11, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %45, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %9, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %9, align 4
  br label %52

52:                                               ; preds = %44
  %53 = load i32, ptr %11, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %11, align 4
  br label %40, !llvm.loop !95

55:                                               ; preds = %40
  %56 = load i32, ptr %9, align 4
  %57 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %57)
  ret i32 %56
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_64_dynamic_alloca_nested(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %2
  %15 = load i32, ptr %3, align 4
  br label %17

16:                                               ; preds = %2
  br label %17

17:                                               ; preds = %16, %14
  %18 = phi i32 [ %15, %14 ], [ 1, %16 ]
  store i32 %18, ptr %5, align 4
  %19 = load i32, ptr %5, align 4
  %20 = zext i32 %19 to i64
  %21 = call ptr @llvm.stacksave()
  store ptr %21, ptr %6, align 8
  %22 = alloca i32, i64 %20, align 16
  store i64 %20, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %23

23:                                               ; preds = %34, %17
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %5, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %37

27:                                               ; preds = %23
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %9, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %9, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, ptr %22, i64 %32
  store i32 %30, ptr %33, align 4
  br label %34

34:                                               ; preds = %27
  %35 = load i32, ptr %9, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %9, align 4
  br label %23, !llvm.loop !96

37:                                               ; preds = %23
  store i32 0, ptr %10, align 4
  br label %38

38:                                               ; preds = %59, %37
  %39 = load i32, ptr %10, align 4
  %40 = load i32, ptr %5, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %62

42:                                               ; preds = %38
  store i32 0, ptr %11, align 4
  br label %43

43:                                               ; preds = %55, %42
  %44 = load i32, ptr %11, align 4
  %45 = icmp slt i32 %44, 2
  br i1 %45, label %46, label %58

46:                                               ; preds = %43
  %47 = load i32, ptr %10, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, ptr %22, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %11, align 4
  %52 = add nsw i32 %50, %51
  %53 = load i32, ptr %8, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %8, align 4
  br label %55

55:                                               ; preds = %46
  %56 = load i32, ptr %11, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %11, align 4
  br label %43, !llvm.loop !97

58:                                               ; preds = %43
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %10, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %10, align 4
  br label %38, !llvm.loop !98

62:                                               ; preds = %38
  %63 = load i32, ptr %8, align 4
  %64 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %64)
  ret i32 %63
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_65_malloc_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = load i32, ptr %3, align 4
  br label %15

14:                                               ; preds = %2
  br label %15

15:                                               ; preds = %14, %12
  %16 = phi i32 [ %13, %12 ], [ 1, %14 ]
  store i32 %16, ptr %5, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sext i32 %17 to i64
  %19 = mul i64 %18, 4
  %20 = call noalias ptr @malloc(i64 noundef %19) #8
  store ptr %20, ptr %6, align 8
  store i32 0, ptr %7, align 4
  %21 = load ptr, ptr %6, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %27

23:                                               ; preds = %15
  %24 = load i32, ptr %4, align 4
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds i32, ptr %25, i64 0
  store i32 %24, ptr %26, align 4
  br label %28

27:                                               ; preds = %15
  br label %28

28:                                               ; preds = %27, %23
  %29 = phi i32 [ %24, %23 ], [ 0, %27 ]
  store i32 0, ptr %8, align 4
  br label %30

30:                                               ; preds = %48, %28
  %31 = load i32, ptr %8, align 4
  %32 = load i32, ptr %5, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %51

34:                                               ; preds = %30
  %35 = load ptr, ptr %6, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %45

37:                                               ; preds = %34
  %38 = load i32, ptr %4, align 4
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %38, %39
  %41 = load ptr, ptr %6, align 8
  %42 = load i32, ptr %8, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %41, i64 %43
  store i32 %40, ptr %44, align 4
  br label %46

45:                                               ; preds = %34
  br label %46

46:                                               ; preds = %45, %37
  %47 = phi i32 [ %40, %37 ], [ 0, %45 ]
  br label %48

48:                                               ; preds = %46
  %49 = load i32, ptr %8, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %8, align 4
  br label %30, !llvm.loop !99

51:                                               ; preds = %30
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %70, %51
  %53 = load i32, ptr %9, align 4
  %54 = load i32, ptr %5, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %73

56:                                               ; preds = %52
  %57 = load ptr, ptr %6, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %59, label %65

59:                                               ; preds = %56
  %60 = load ptr, ptr %6, align 8
  %61 = load i32, ptr %9, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, ptr %60, i64 %62
  %64 = load i32, ptr %63, align 4
  br label %66

65:                                               ; preds = %56
  br label %66

66:                                               ; preds = %65, %59
  %67 = phi i32 [ %64, %59 ], [ -1, %65 ]
  %68 = load i32, ptr %7, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %7, align 4
  br label %70

70:                                               ; preds = %66
  %71 = load i32, ptr %9, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %9, align 4
  br label %52, !llvm.loop !100

73:                                               ; preds = %52
  %74 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %74) #9
  %75 = load i32, ptr %7, align 4
  ret i32 %75
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_66_malloc_nested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %3
  %16 = load i32, ptr %4, align 4
  br label %18

17:                                               ; preds = %3
  br label %18

18:                                               ; preds = %17, %15
  %19 = phi i32 [ %16, %15 ], [ 1, %17 ]
  store i32 %19, ptr %7, align 4
  %20 = load i32, ptr %7, align 4
  %21 = sext i32 %20 to i64
  %22 = mul i64 %21, 4
  %23 = call noalias ptr @malloc(i64 noundef %22) #8
  store ptr %23, ptr %8, align 8
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %24

24:                                               ; preds = %42, %18
  %25 = load i32, ptr %10, align 4
  %26 = load i32, ptr %7, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %45

28:                                               ; preds = %24
  %29 = load ptr, ptr %8, align 8
  %30 = icmp ne ptr %29, null
  br i1 %30, label %31, label %39

31:                                               ; preds = %28
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %10, align 4
  %34 = add nsw i32 %32, %33
  %35 = load ptr, ptr %8, align 8
  %36 = load i32, ptr %10, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  store i32 %34, ptr %38, align 4
  br label %40

39:                                               ; preds = %28
  br label %40

40:                                               ; preds = %39, %31
  %41 = phi i32 [ %34, %31 ], [ 0, %39 ]
  br label %42

42:                                               ; preds = %40
  %43 = load i32, ptr %10, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %10, align 4
  br label %24, !llvm.loop !101

45:                                               ; preds = %24
  store i32 0, ptr %11, align 4
  br label %46

46:                                               ; preds = %76, %45
  %47 = load i32, ptr %11, align 4
  %48 = load i32, ptr %7, align 4
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %50, label %79

50:                                               ; preds = %46
  store i32 0, ptr %12, align 4
  br label %51

51:                                               ; preds = %72, %50
  %52 = load i32, ptr %12, align 4
  %53 = icmp slt i32 %52, 2
  br i1 %53, label %54, label %75

54:                                               ; preds = %51
  %55 = load ptr, ptr %8, align 8
  %56 = icmp ne ptr %55, null
  br i1 %56, label %57, label %67

57:                                               ; preds = %54
  %58 = load ptr, ptr %8, align 8
  %59 = load i32, ptr %11, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %58, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %6, align 4
  %64 = add nsw i32 %62, %63
  %65 = load i32, ptr %12, align 4
  %66 = add nsw i32 %64, %65
  br label %68

67:                                               ; preds = %54
  br label %68

68:                                               ; preds = %67, %57
  %69 = phi i32 [ %66, %57 ], [ -1, %67 ]
  %70 = load i32, ptr %9, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, ptr %9, align 4
  br label %72

72:                                               ; preds = %68
  %73 = load i32, ptr %12, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %12, align 4
  br label %51, !llvm.loop !102

75:                                               ; preds = %51
  br label %76

76:                                               ; preds = %75
  %77 = load i32, ptr %11, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %11, align 4
  br label %46, !llvm.loop !103

79:                                               ; preds = %46
  %80 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %80) #9
  %81 = load i32, ptr %9, align 4
  ret i32 %81
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_for(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %12, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %15

8:                                                ; preds = %4
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr @g_void_result, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  br label %12

12:                                               ; preds = %8
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %3, align 4
  br label %4, !llvm.loop !104

15:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_while(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %8, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %15

8:                                                ; preds = %4
  %9 = load i32, ptr %3, align 4
  %10 = mul nsw i32 %9, 2
  %11 = load i32, ptr @g_void_result, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr @g_void_result, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %3, align 4
  br label %4, !llvm.loop !105

15:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_69_void_dowhile(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %11, %1
  %5 = load i32, ptr %3, align 4
  %6 = add nsw i32 %5, 1
  %7 = load i32, ptr @g_void_result, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr @g_void_result, align 4
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %3, align 4
  br label %11

11:                                               ; preds = %4
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %4, label %15, !llvm.loop !106

15:                                               ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_70_void_nested(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %23, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %26

9:                                                ; preds = %5
  store i32 0, ptr %4, align 4
  br label %10

10:                                               ; preds = %19, %9
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %11, 2
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr @g_void_result, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr @g_void_result, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %10, !llvm.loop !107

22:                                               ; preds = %10
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  br label %5, !llvm.loop !108

26:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_71_void_continue(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %17, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %20

8:                                                ; preds = %4
  %9 = load i32, ptr %3, align 4
  %10 = srem i32 %9, 2
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  br label %17

13:                                               ; preds = %8
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  br label %17

17:                                               ; preds = %13, %12
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %3, align 4
  br label %4, !llvm.loop !109

20:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_72_void_global_only() #0 {
  br label %1

1:                                                ; preds = %5, %0
  %2 = load i32, ptr @g_x, align 4
  %3 = load i32, ptr @g_limit, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %12

5:                                                ; preds = %1
  %6 = load i32, ptr @g_x, align 4
  %7 = load i32, ptr @g_void_result, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr @g_void_result, align 4
  %9 = load i32, ptr @g_step, align 4
  %10 = load i32, ptr @g_x, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_x, align 4
  br label %1, !llvm.loop !110

12:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_73_void_pointer(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %25, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %28

10:                                               ; preds = %6
  %11 = load i32, ptr %5, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = add nsw i32 %16, %11
  store i32 %17, ptr %15, align 4
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr @g_void_result, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr @g_void_result, align 4
  br label %25

25:                                               ; preds = %10
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %6, !llvm.loop !111

28:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_74_void_array(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, 8
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4
  br label %10

9:                                                ; preds = %1
  br label %10

10:                                               ; preds = %9, %7
  %11 = phi i32 [ %8, %7 ], [ 8, %9 ]
  store i32 %11, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %29, %10
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %32

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = add nsw i32 %21, %17
  store i32 %22, ptr %20, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr @g_void_result, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr @g_void_result, align 4
  br label %29

29:                                               ; preds = %16
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %12, !llvm.loop !112

32:                                               ; preds = %12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_75_loop_return_paths(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %19, %1
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %22

10:                                               ; preds = %6
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp eq i32 %14, 3
  br i1 %15, label %16, label %18

16:                                               ; preds = %10
  %17 = load i32, ptr %4, align 4
  store i32 %17, ptr %2, align 4
  br label %25

18:                                               ; preds = %10
  br label %19

19:                                               ; preds = %18
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %6, !llvm.loop !113

22:                                               ; preds = %6
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 100
  store i32 %24, ptr %2, align 4
  br label %25

25:                                               ; preds = %22, %16
  %26 = load i32, ptr %2, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_76_nested_return_paths(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %37, %1
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %40

11:                                               ; preds = %7
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %33, %11
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %36

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %4, align 4
  %22 = load i32, ptr %6, align 4
  %23 = icmp eq i32 %22, 2
  br i1 %23, label %24, label %26

24:                                               ; preds = %16
  %25 = load i32, ptr %4, align 4
  store i32 %25, ptr %2, align 4
  br label %43

26:                                               ; preds = %16
  %27 = load i32, ptr %4, align 4
  %28 = icmp sgt i32 %27, 30
  br i1 %28, label %29, label %32

29:                                               ; preds = %26
  %30 = load i32, ptr %4, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %2, align 4
  br label %43

32:                                               ; preds = %26
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  br label %12, !llvm.loop !114

36:                                               ; preds = %12
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %5, align 4
  br label %7, !llvm.loop !115

40:                                               ; preds = %7
  %41 = load i32, ptr %4, align 4
  %42 = add nsw i32 %41, 100
  store i32 %42, ptr %2, align 4
  br label %43

43:                                               ; preds = %40, %29, %24
  %44 = load i32, ptr %2, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_77_loop_final_returns(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %4, align 4
  br label %5, !llvm.loop !116

16:                                               ; preds = %5
  %17 = load i32, ptr %3, align 4
  %18 = icmp sgt i32 %17, 20
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = load i32, ptr %3, align 4
  %21 = mul nsw i32 %20, 2
  br label %25

22:                                               ; preds = %16
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 10
  br label %25

25:                                               ; preds = %22, %19
  %26 = phi i32 [ %21, %19 ], [ %24, %22 ]
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_78_state_machine_loop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %20, %1
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %23

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %5, align 4
  %13 = mul nsw i32 %11, %12
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr %4, align 4
  %16 = load i32, ptr %3, align 4
  %17 = icmp eq i32 %16, 1
  %18 = zext i1 %17 to i64
  %19 = select i1 %17, i32 2, i32 1
  store i32 %19, ptr %3, align 4
  br label %20

20:                                               ; preds = %10
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %5, align 4
  br label %6, !llvm.loop !117

23:                                               ; preds = %6
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %24, %25
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_79_multiple_backedge_values(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 2, ptr %4, align 4
  store i32 3, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %23, %1
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %26

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %6, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %3, align 4
  %15 = load i32, ptr %5, align 4
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %4, align 4
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %5, align 4
  br label %23

23:                                               ; preds = %11
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  br label %7, !llvm.loop !118

26:                                               ; preds = %7
  %27 = load i32, ptr %3, align 4
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %29, %30
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_80_nested_state(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %33, %1
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %29, %11
  %13 = load i32, ptr %6, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %32

15:                                               ; preds = %12
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %25, %26
  %28 = srem i32 %27, 5
  store i32 %28, ptr %4, align 4
  br label %29

29:                                               ; preds = %15
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %6, align 4
  br label %12, !llvm.loop !119

32:                                               ; preds = %12
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  br label %7, !llvm.loop !120

36:                                               ; preds = %7
  %37 = load i32, ptr %3, align 4
  %38 = load i32, ptr %4, align 4
  %39 = add nsw i32 %37, %38
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_81_array_pointer_nested(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %9, 8
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  %12 = load i32, ptr %4, align 4
  br label %14

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %13, %11
  %15 = phi i32 [ %12, %11 ], [ 8, %13 ]
  store i32 %15, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %16

16:                                               ; preds = %56, %14
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %59

20:                                               ; preds = %16
  store i32 0, ptr %8, align 4
  br label %21

21:                                               ; preds = %52, %20
  %22 = load i32, ptr %8, align 4
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %24, label %55

24:                                               ; preds = %21
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %7, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 %29, %33
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %6, align 4
  %39 = load i32, ptr %7, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = icmp sgt i32 %42, 0
  %44 = zext i1 %43 to i64
  %45 = select i1 %43, i32 1, i32 -1
  %46 = load ptr, ptr %3, align 8
  %47 = load i32, ptr %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, ptr %46, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = add nsw i32 %50, %45
  store i32 %51, ptr %49, align 4
  br label %52

52:                                               ; preds = %24
  %53 = load i32, ptr %8, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %8, align 4
  br label %21, !llvm.loop !121

55:                                               ; preds = %21
  br label %56

56:                                               ; preds = %55
  %57 = load i32, ptr %7, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %7, align 4
  br label %16, !llvm.loop !122

59:                                               ; preds = %16
  %60 = load i32, ptr %6, align 4
  ret i32 %60
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_82_matrix_state(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %11

9:                                                ; preds = %1
  %10 = load i32, ptr %2, align 4
  br label %12

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %11, %9
  %13 = phi i32 [ %10, %9 ], [ 3, %11 ]
  store i32 %13, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %14

14:                                               ; preds = %46, %12
  %15 = load i32, ptr %5, align 4
  %16 = load i32, ptr %3, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %49

18:                                               ; preds = %14
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %32, %18
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %35

22:                                               ; preds = %19
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %24
  %26 = load i32, ptr %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x i32], ptr %25, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %4, align 4
  br label %32

32:                                               ; preds = %22
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %6, align 4
  br label %19, !llvm.loop !123

35:                                               ; preds = %19
  %36 = load i32, ptr %4, align 4
  %37 = icmp sgt i32 %36, 20
  br i1 %37, label %38, label %41

38:                                               ; preds = %35
  %39 = load i32, ptr %4, align 4
  %40 = sdiv i32 %39, 2
  br label %44

41:                                               ; preds = %35
  %42 = load i32, ptr %4, align 4
  %43 = add nsw i32 %42, 3
  br label %44

44:                                               ; preds = %41, %38
  %45 = phi i32 [ %40, %38 ], [ %43, %41 ]
  store i32 %45, ptr %4, align 4
  br label %46

46:                                               ; preds = %44
  %47 = load i32, ptr %5, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %5, align 4
  br label %14, !llvm.loop !124

49:                                               ; preds = %14
  %50 = load i32, ptr %4, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_83_complex_loop_control(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %9, align 4
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %4
  %20 = load i32, ptr %8, align 4
  br label %23

21:                                               ; preds = %4
  %22 = load i32, ptr %9, align 4
  br label %23

23:                                               ; preds = %21, %19
  %24 = phi i32 [ %20, %19 ], [ %22, %21 ]
  store i32 %24, ptr %10, align 4
  %25 = load i32, ptr %10, align 4
  %26 = icmp sgt i32 %25, 6
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  br label %30

28:                                               ; preds = %23
  %29 = load i32, ptr %10, align 4
  br label %30

30:                                               ; preds = %28, %27
  %31 = phi i32 [ 6, %27 ], [ %29, %28 ]
  store i32 %31, ptr %10, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %32, 1
  br i1 %33, label %34, label %35

34:                                               ; preds = %30
  br label %37

35:                                               ; preds = %30
  %36 = load i32, ptr %10, align 4
  br label %37

37:                                               ; preds = %35, %34
  %38 = phi i32 [ 1, %34 ], [ %36, %35 ]
  store i32 %38, ptr %10, align 4
  %39 = load i32, ptr @g_x, align 4
  store i32 %39, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %40

40:                                               ; preds = %93, %37
  %41 = load i32, ptr %12, align 4
  %42 = load i32, ptr %10, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %96

44:                                               ; preds = %40
  store i32 0, ptr %13, align 4
  br label %45

45:                                               ; preds = %89, %44
  %46 = load i32, ptr %13, align 4
  %47 = load i32, ptr @g_limit, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %92

49:                                               ; preds = %45
  store i32 0, ptr %14, align 4
  br label %50

50:                                               ; preds = %86, %49
  %51 = load i32, ptr %14, align 4
  %52 = icmp slt i32 %51, 2
  br i1 %52, label %53, label %89

53:                                               ; preds = %50
  %54 = load i32, ptr %12, align 4
  %55 = load i32, ptr %13, align 4
  %56 = add nsw i32 %54, %55
  %57 = load i32, ptr %14, align 4
  %58 = add nsw i32 %56, %57
  %59 = srem i32 %58, 8
  store i32 %59, ptr %15, align 4
  %60 = load i32, ptr %15, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = load i32, ptr %11, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %11, align 4
  %66 = load ptr, ptr %6, align 8
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %11, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %11, align 4
  %70 = load i32, ptr %15, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = srem i32 %73, 2
  %75 = icmp eq i32 %74, 0
  %76 = zext i1 %75 to i64
  %77 = select i1 %75, i32 1, i32 -1
  %78 = load ptr, ptr %6, align 8
  %79 = load i32, ptr %78, align 4
  %80 = add nsw i32 %79, %77
  store i32 %80, ptr %78, align 4
  %81 = load i32, ptr %11, align 4
  %82 = icmp sgt i32 %81, 50
  br i1 %82, label %83, label %85

83:                                               ; preds = %53
  %84 = load i32, ptr %11, align 4
  store i32 %84, ptr %5, align 4
  br label %98

85:                                               ; preds = %53
  br label %86

86:                                               ; preds = %85
  %87 = load i32, ptr %14, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %14, align 4
  br label %50, !llvm.loop !125

89:                                               ; preds = %50
  %90 = load i32, ptr %13, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %13, align 4
  br label %45, !llvm.loop !126

92:                                               ; preds = %45
  br label %93

93:                                               ; preds = %92
  %94 = load i32, ptr %12, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %12, align 4
  br label %40, !llvm.loop !127

96:                                               ; preds = %40
  %97 = load i32, ptr %11, align 4
  store i32 %97, ptr %5, align 4
  br label %98

98:                                               ; preds = %96, %83
  %99 = load i32, ptr %5, align 4
  ret i32 %99
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_84_complex_loop_state(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %15 = load i32, ptr %8, align 4
  %16 = load i32, ptr @g_x, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %11, align 4
  store i32 0, ptr %12, align 4
  store i32 0, ptr %13, align 4
  br label %18

18:                                               ; preds = %83, %5
  %19 = load i32, ptr %13, align 4
  %20 = load i32, ptr %7, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %25

22:                                               ; preds = %18
  %23 = load i32, ptr %13, align 4
  %24 = icmp slt i32 %23, 8
  br i1 %24, label %33, label %25

25:                                               ; preds = %22, %18
  %26 = load i32, ptr %12, align 4
  %27 = icmp slt i32 %26, 3
  br i1 %27, label %28, label %31

28:                                               ; preds = %25
  %29 = load i32, ptr %13, align 4
  %30 = icmp slt i32 %29, 10
  br label %31

31:                                               ; preds = %28, %25
  %32 = phi i1 [ false, %25 ], [ %30, %28 ]
  br label %33

33:                                               ; preds = %31, %22
  %34 = phi i1 [ true, %22 ], [ %32, %31 ]
  br i1 %34, label %35, label %86

35:                                               ; preds = %33
  %36 = load i32, ptr %13, align 4
  %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %36, %37
  %39 = load i32, ptr %9, align 4
  %40 = icmp sgt i32 %38, %39
  br i1 %40, label %41, label %44

41:                                               ; preds = %35
  %42 = load i32, ptr %12, align 4
  %43 = add nsw i32 %42, 1
  br label %47

44:                                               ; preds = %35
  %45 = load i32, ptr %12, align 4
  %46 = sub nsw i32 %45, 1
  br label %47

47:                                               ; preds = %44, %41
  %48 = phi i32 [ %43, %41 ], [ %46, %44 ]
  store i32 %48, ptr %12, align 4
  store i32 0, ptr %14, align 4
  br label %49

49:                                               ; preds = %79, %47
  %50 = load i32, ptr %14, align 4
  %51 = icmp slt i32 %50, 3
  br i1 %51, label %52, label %55

52:                                               ; preds = %49
  %53 = load i32, ptr %12, align 4
  %54 = icmp slt i32 %53, 5
  br label %55

55:                                               ; preds = %52, %49
  %56 = phi i1 [ false, %49 ], [ %54, %52 ]
  br i1 %56, label %57, label %82

57:                                               ; preds = %55
  %58 = load i32, ptr %13, align 4
  %59 = srem i32 %58, 8
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %11, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %11, align 4
  %65 = load ptr, ptr %6, align 8
  %66 = load i32, ptr %65, align 4
  %67 = load i32, ptr %10, align 4
  %68 = add nsw i32 %66, %67
  %69 = load i32, ptr %11, align 4
  %70 = add nsw i32 %69, %68
  store i32 %70, ptr %11, align 4
  %71 = load i32, ptr %11, align 4
  %72 = srem i32 %71, 2
  %73 = icmp eq i32 %72, 0
  %74 = zext i1 %73 to i64
  %75 = select i1 %73, i32 1, i32 -1
  %76 = load ptr, ptr %6, align 8
  %77 = load i32, ptr %76, align 4
  %78 = add nsw i32 %77, %75
  store i32 %78, ptr %76, align 4
  br label %79

79:                                               ; preds = %57
  %80 = load i32, ptr %14, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %14, align 4
  br label %49, !llvm.loop !128

82:                                               ; preds = %55
  br label %83

83:                                               ; preds = %82
  %84 = load i32, ptr %13, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %13, align 4
  br label %18, !llvm.loop !129

86:                                               ; preds = %33
  %87 = load i32, ptr %11, align 4
  %88 = load i32, ptr %12, align 4
  %89 = add nsw i32 %87, %88
  ret i32 %89
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_85_loop_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  %18 = load i32, ptr %9, align 4
  %19 = load i32, ptr %10, align 4
  %20 = icmp sgt i32 %18, %19
  br i1 %20, label %21, label %23

21:                                               ; preds = %5
  %22 = load i32, ptr %9, align 4
  br label %25

23:                                               ; preds = %5
  %24 = load i32, ptr %10, align 4
  br label %25

25:                                               ; preds = %23, %21
  %26 = phi i32 [ %22, %21 ], [ %24, %23 ]
  store i32 %26, ptr %12, align 4
  %27 = load i32, ptr %12, align 4
  %28 = icmp sgt i32 %27, 8
  br i1 %28, label %29, label %30

29:                                               ; preds = %25
  br label %32

30:                                               ; preds = %25
  %31 = load i32, ptr %12, align 4
  br label %32

32:                                               ; preds = %30, %29
  %33 = phi i32 [ 8, %29 ], [ %31, %30 ]
  store i32 %33, ptr %12, align 4
  %34 = load i32, ptr %9, align 4
  %35 = load i32, ptr @g_x, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %13, align 4
  store i32 0, ptr %14, align 4
  store i32 0, ptr %15, align 4
  br label %37

37:                                               ; preds = %122, %32
  %38 = load i32, ptr %15, align 4
  %39 = load i32, ptr %12, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %44

41:                                               ; preds = %37
  %42 = load i32, ptr %14, align 4
  %43 = icmp slt i32 %42, 10
  br i1 %43, label %53, label %44

44:                                               ; preds = %41, %37
  %45 = load i32, ptr %15, align 4
  %46 = load i32, ptr %8, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %51

48:                                               ; preds = %44
  %49 = load i32, ptr %11, align 4
  %50 = icmp ne i32 %49, 0
  br label %51

51:                                               ; preds = %48, %44
  %52 = phi i1 [ false, %44 ], [ %50, %48 ]
  br label %53

53:                                               ; preds = %51, %41
  %54 = phi i1 [ true, %41 ], [ %52, %51 ]
  br i1 %54, label %55, label %125

55:                                               ; preds = %53
  %56 = load i32, ptr %15, align 4
  %57 = load i32, ptr %14, align 4
  %58 = add nsw i32 %56, %57
  %59 = srem i32 %58, 8
  store i32 %59, ptr %16, align 4
  %60 = load i32, ptr %16, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = load i32, ptr %13, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %13, align 4
  br label %66

66:                                               ; preds = %109, %55
  %67 = load i32, ptr %14, align 4
  %68 = icmp slt i32 %67, 4
  br i1 %68, label %69, label %73

69:                                               ; preds = %66
  %70 = load i32, ptr %15, align 4
  %71 = load i32, ptr @g_limit, align 4
  %72 = icmp slt i32 %70, %71
  br label %73

73:                                               ; preds = %69, %66
  %74 = phi i1 [ false, %66 ], [ %72, %69 ]
  br i1 %74, label %75, label %112

75:                                               ; preds = %73
  %76 = load i32, ptr %15, align 4
  %77 = load i32, ptr %14, align 4
  %78 = add nsw i32 %76, %77
  %79 = load i32, ptr %13, align 4
  %80 = add nsw i32 %79, %78
  store i32 %80, ptr %13, align 4
  store i32 0, ptr %17, align 4
  br label %81

81:                                               ; preds = %106, %75
  %82 = load i32, ptr %17, align 4
  %83 = icmp slt i32 %82, 2
  br i1 %83, label %84, label %109

84:                                               ; preds = %81
  %85 = load i32, ptr %16, align 4
  %86 = load i32, ptr %17, align 4
  %87 = add nsw i32 %85, %86
  %88 = srem i32 %87, 8
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = load i32, ptr %13, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, ptr %13, align 4
  %94 = load i32, ptr %13, align 4
  %95 = icmp sgt i32 %94, 0
  %96 = zext i1 %95 to i64
  %97 = select i1 %95, i32 1, i32 -1
  %98 = load ptr, ptr %7, align 8
  %99 = load i32, ptr %98, align 4
  %100 = add nsw i32 %99, %97
  store i32 %100, ptr %98, align 4
  %101 = load ptr, ptr %7, align 8
  %102 = load i32, ptr %101, align 4
  %103 = icmp sgt i32 %102, 20
  br i1 %103, label %104, label %105

104:                                              ; preds = %84
  br label %109

105:                                              ; preds = %84
  br label %106

106:                                              ; preds = %105
  %107 = load i32, ptr %17, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, ptr %17, align 4
  br label %81, !llvm.loop !130

109:                                              ; preds = %104, %81
  %110 = load i32, ptr %14, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, ptr %14, align 4
  br label %66, !llvm.loop !131

112:                                              ; preds = %73
  %113 = load ptr, ptr %7, align 8
  %114 = load i32, ptr %113, align 4
  %115 = load i32, ptr %13, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %13, align 4
  %117 = load i32, ptr %13, align 4
  %118 = icmp sgt i32 %117, 100
  br i1 %118, label %119, label %121

119:                                              ; preds = %112
  %120 = load i32, ptr %13, align 4
  store i32 %120, ptr %6, align 4
  br label %136

121:                                              ; preds = %112
  br label %122

122:                                              ; preds = %121
  %123 = load i32, ptr %15, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, ptr %15, align 4
  br label %37, !llvm.loop !132

125:                                              ; preds = %53
  %126 = load i32, ptr %13, align 4
  %127 = icmp sgt i32 %126, 0
  br i1 %127, label %128, label %131

128:                                              ; preds = %125
  %129 = load i32, ptr %13, align 4
  %130 = mul nsw i32 %129, 2
  br label %134

131:                                              ; preds = %125
  %132 = load i32, ptr %13, align 4
  %133 = sub nsw i32 0, %132
  br label %134

134:                                              ; preds = %131, %128
  %135 = phi i32 [ %130, %128 ], [ %133, %131 ]
  store i32 %135, ptr %6, align 4
  br label %136

136:                                              ; preds = %134, %119
  %137 = load i32, ptr %6, align 4
  ret i32 %137
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [8 x i32], align 16
  %11 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 1
  br i1 %13, label %14, label %19

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #10
  br label %20

19:                                               ; preds = %2
  br label %20

20:                                               ; preds = %19, %14
  %21 = phi i32 [ %18, %14 ], [ 4, %19 ]
  store i32 %21, ptr %6, align 4
  %22 = load i32, ptr %4, align 4
  %23 = icmp sgt i32 %22, 2
  br i1 %23, label %24, label %29

24:                                               ; preds = %20
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 2
  %27 = load ptr, ptr %26, align 8
  %28 = call i32 @atoi(ptr noundef %27) #10
  br label %30

29:                                               ; preds = %20
  br label %30

30:                                               ; preds = %29, %24
  %31 = phi i32 [ %28, %24 ], [ -1, %29 ]
  store i32 %31, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %32 = load i32, ptr %6, align 4
  %33 = call i32 @abs(i32 noundef %32) #11
  store i32 %33, ptr %9, align 4
  %34 = load i32, ptr %9, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %30
  store i32 1, ptr %9, align 4
  br label %37

37:                                               ; preds = %36, %30
  %38 = load i32, ptr @g_step, align 4
  %39 = icmp sle i32 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  store i32 1, ptr @g_step, align 4
  br label %41

41:                                               ; preds = %40, %37
  %42 = load i32, ptr @g_limit, align 4
  %43 = icmp sle i32 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %41
  store i32 10, ptr @g_limit, align 4
  br label %45

45:                                               ; preds = %44, %41
  %46 = load i32, ptr %9, align 4
  %47 = call i32 @_00_for_simple(i32 noundef %46)
  %48 = load i32, ptr %8, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %8, align 4
  %50 = load i32, ptr %9, align 4
  %51 = call i32 @_01_while_simple(i32 noundef %50)
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, ptr %8, align 4
  %54 = load i32, ptr %9, align 4
  %55 = call i32 @_02_dowhile_simple(i32 noundef %54)
  %56 = load i32, ptr %8, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %8, align 4
  %58 = call i32 @_03_for_empty_body(i32 noundef 3)
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %8, align 4
  %61 = load i32, ptr %9, align 4
  %62 = call i32 @_04_while_true_break(i32 noundef %61)
  %63 = load i32, ptr %8, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %8, align 4
  %65 = load i32, ptr %9, align 4
  %66 = call i32 @_05_for_continue(i32 noundef %65)
  %67 = load i32, ptr %8, align 4
  %68 = add nsw i32 %67, %66
  store i32 %68, ptr %8, align 4
  %69 = load i32, ptr %7, align 4
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %74

71:                                               ; preds = %45
  %72 = load i32, ptr %8, align 4
  %73 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %72)
  store i32 0, ptr %3, align 4
  br label %484

74:                                               ; preds = %45
  %75 = load i32, ptr %9, align 4
  %76 = load i32, ptr %9, align 4
  %77 = add nsw i32 %76, 6
  %78 = call i32 @_06_relational_loop(i32 noundef %75, i32 noundef %77)
  %79 = load i32, ptr %8, align 4
  %80 = add nsw i32 %79, %78
  store i32 %80, ptr %8, align 4
  %81 = load i32, ptr %9, align 4
  %82 = call i32 @_07_not_equal_loop(i32 noundef %81)
  %83 = load i32, ptr %8, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, ptr %8, align 4
  %85 = load i32, ptr %9, align 4
  %86 = call i32 @_08_loop_and(i32 noundef %85, i32 noundef 5)
  %87 = load i32, ptr %8, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, ptr %8, align 4
  %89 = load i32, ptr %9, align 4
  %90 = call i32 @_09_loop_or(i32 noundef %89, i32 noundef 5)
  %91 = load i32, ptr %8, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %8, align 4
  %93 = load i32, ptr %9, align 4
  %94 = call i32 @_10_nested_loop_condition(i32 noundef %93, i32 noundef 6, i32 noundef 3, i32 noundef 4)
  %95 = load i32, ptr %8, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, ptr %8, align 4
  %97 = load i32, ptr %7, align 4
  %98 = icmp eq i32 %97, 1
  br i1 %98, label %99, label %102

99:                                               ; preds = %74
  %100 = load i32, ptr %8, align 4
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %100)
  store i32 0, ptr %3, align 4
  br label %484

102:                                              ; preds = %74
  %103 = load i32, ptr %9, align 4
  %104 = call i32 @_11_arithmetic_loop(i32 noundef %103)
  %105 = load i32, ptr %8, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, ptr %8, align 4
  %107 = load i32, ptr %9, align 4
  %108 = call i32 @_12_nested_arithmetic_loop(i32 noundef %107)
  %109 = load i32, ptr %8, align 4
  %110 = add nsw i32 %109, %108
  store i32 %110, ptr %8, align 4
  %111 = load i32, ptr %9, align 4
  %112 = call i32 @_13_ternary_loop_body(i32 noundef %111)
  %113 = load i32, ptr %8, align 4
  %114 = add nsw i32 %113, %112
  store i32 %114, ptr %8, align 4
  %115 = load i32, ptr %9, align 4
  %116 = call i32 @_14_multiple_accumulators(i32 noundef %115)
  %117 = load i32, ptr %8, align 4
  %118 = add nsw i32 %117, %116
  store i32 %118, ptr %8, align 4
  %119 = load i32, ptr %7, align 4
  %120 = icmp eq i32 %119, 2
  br i1 %120, label %121, label %124

121:                                              ; preds = %102
  %122 = load i32, ptr %8, align 4
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %122)
  store i32 0, ptr %3, align 4
  br label %484

124:                                              ; preds = %102
  %125 = call i32 @_15_nested_for(i32 noundef 3)
  %126 = load i32, ptr %8, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, ptr %8, align 4
  %128 = call i32 @_16_for_while(i32 noundef 4)
  %129 = load i32, ptr %8, align 4
  %130 = add nsw i32 %129, %128
  store i32 %130, ptr %8, align 4
  %131 = call i32 @_17_while_dowhile(i32 noundef 3)
  %132 = load i32, ptr %8, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, ptr %8, align 4
  %134 = call i32 @_18_triple_for(i32 noundef 2)
  %135 = load i32, ptr %8, align 4
  %136 = add nsw i32 %135, %134
  store i32 %136, ptr %8, align 4
  %137 = call i32 @_19_mixed_nested_loops(i32 noundef 3)
  %138 = load i32, ptr %8, align 4
  %139 = add nsw i32 %138, %137
  store i32 %139, ptr %8, align 4
  %140 = load i32, ptr %7, align 4
  %141 = icmp eq i32 %140, 3
  br i1 %141, label %142, label %145

142:                                              ; preds = %124
  %143 = load i32, ptr %8, align 4
  %144 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %143)
  store i32 0, ptr %3, align 4
  br label %484

145:                                              ; preds = %124
  %146 = call i32 @_20_inner_break(i32 noundef 5)
  %147 = load i32, ptr %8, align 4
  %148 = add nsw i32 %147, %146
  store i32 %148, ptr %8, align 4
  %149 = call i32 @_21_inner_continue(i32 noundef 5)
  %150 = load i32, ptr %8, align 4
  %151 = add nsw i32 %150, %149
  store i32 %151, ptr %8, align 4
  %152 = call i32 @_22_break_with_ternary(i32 noundef 5)
  %153 = load i32, ptr %8, align 4
  %154 = add nsw i32 %153, %152
  store i32 %154, ptr %8, align 4
  %155 = call i32 @_23_continue_and_break(i32 noundef 6)
  %156 = load i32, ptr %8, align 4
  %157 = add nsw i32 %156, %155
  store i32 %157, ptr %8, align 4
  %158 = load i32, ptr %7, align 4
  %159 = icmp eq i32 %158, 4
  br i1 %159, label %160, label %163

160:                                              ; preds = %145
  %161 = load i32, ptr %8, align 4
  %162 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %161)
  store i32 0, ptr %3, align 4
  br label %484

163:                                              ; preds = %145
  %164 = load i32, ptr %9, align 4
  %165 = call i32 @_24_early_return(i32 noundef %164)
  %166 = load i32, ptr %8, align 4
  %167 = add nsw i32 %166, %165
  store i32 %167, ptr %8, align 4
  %168 = load i32, ptr %9, align 4
  %169 = call i32 @_25_nested_early_return(i32 noundef %168)
  %170 = load i32, ptr %8, align 4
  %171 = add nsw i32 %170, %169
  store i32 %171, ptr %8, align 4
  %172 = load i32, ptr %9, align 4
  %173 = call i32 @_26_multiple_returns(i32 noundef %172)
  %174 = load i32, ptr %8, align 4
  %175 = add nsw i32 %174, %173
  store i32 %175, ptr %8, align 4
  %176 = load i32, ptr %9, align 4
  %177 = call i32 @_27_dowhile_return(i32 noundef %176)
  %178 = load i32, ptr %8, align 4
  %179 = add nsw i32 %178, %177
  store i32 %179, ptr %8, align 4
  %180 = load i32, ptr %7, align 4
  %181 = icmp eq i32 %180, 5
  br i1 %181, label %182, label %185

182:                                              ; preds = %163
  %183 = load i32, ptr %8, align 4
  %184 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %183)
  store i32 0, ptr %3, align 4
  br label %484

185:                                              ; preds = %163
  %186 = call i32 @_28_for_while_for(i32 noundef 3)
  %187 = load i32, ptr %8, align 4
  %188 = add nsw i32 %187, %186
  store i32 %188, ptr %8, align 4
  %189 = call i32 @_29_while_for_dowhile(i32 noundef 3)
  %190 = load i32, ptr %8, align 4
  %191 = add nsw i32 %190, %189
  store i32 %191, ptr %8, align 4
  %192 = call i32 @_30_four_level_nesting(i32 noundef 2)
  %193 = load i32, ptr %8, align 4
  %194 = add nsw i32 %193, %192
  store i32 %194, ptr %8, align 4
  %195 = load i32, ptr %7, align 4
  %196 = icmp eq i32 %195, 6
  br i1 %196, label %197, label %200

197:                                              ; preds = %185
  %198 = load i32, ptr %8, align 4
  %199 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %198)
  store i32 0, ptr %3, align 4
  br label %484

200:                                              ; preds = %185
  %201 = call i32 @_31_multiple_loop_variables(i32 noundef 6)
  %202 = load i32, ptr %8, align 4
  %203 = add nsw i32 %202, %201
  store i32 %203, ptr %8, align 4
  %204 = load i32, ptr %9, align 4
  %205 = call i32 @_32_complex_update(i32 noundef %204)
  %206 = load i32, ptr %8, align 4
  %207 = add nsw i32 %206, %205
  store i32 %207, ptr %8, align 4
  %208 = call i32 @_33_decreasing_loop(i32 noundef 6)
  %209 = load i32, ptr %8, align 4
  %210 = add nsw i32 %209, %208
  store i32 %210, ptr %8, align 4
  %211 = load i32, ptr %9, align 4
  %212 = call i32 @_34_multiple_condition_values(i32 noundef %211, i32 noundef 6, i32 noundef 4)
  %213 = load i32, ptr %8, align 4
  %214 = add nsw i32 %213, %212
  store i32 %214, ptr %8, align 4
  %215 = load i32, ptr %9, align 4
  %216 = call i32 @_35_computed_loop_limit(i32 noundef %215, i32 noundef 3)
  %217 = load i32, ptr %8, align 4
  %218 = add nsw i32 %217, %216
  store i32 %218, ptr %8, align 4
  %219 = load i32, ptr %7, align 4
  %220 = icmp eq i32 %219, 7
  br i1 %220, label %221, label %224

221:                                              ; preds = %200
  %222 = load i32, ptr %8, align 4
  %223 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %222)
  store i32 0, ptr %3, align 4
  br label %484

224:                                              ; preds = %200
  %225 = call i32 @_36_array_for(i32 noundef 6)
  %226 = load i32, ptr %8, align 4
  %227 = add nsw i32 %226, %225
  store i32 %227, ptr %8, align 4
  %228 = call i32 @_37_array_while(i32 noundef 6)
  %229 = load i32, ptr %8, align 4
  %230 = add nsw i32 %229, %228
  store i32 %230, ptr %8, align 4
  %231 = call i32 @_38_matrix_nested(i32 noundef 3)
  %232 = load i32, ptr %8, align 4
  %233 = add nsw i32 %232, %231
  store i32 %233, ptr %8, align 4
  %234 = call i32 @_39_array_controlled_loop(i32 noundef 6)
  %235 = load i32, ptr %8, align 4
  %236 = add nsw i32 %235, %234
  store i32 %236, ptr %8, align 4
  %237 = load i32, ptr %7, align 4
  %238 = icmp eq i32 %237, 8
  br i1 %238, label %239, label %242

239:                                              ; preds = %224
  %240 = load i32, ptr %8, align 4
  %241 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %240)
  store i32 0, ptr %3, align 4
  br label %484

242:                                              ; preds = %224
  store i32 0, ptr @g_arr, align 16
  store i32 1, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 -2, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  store i32 3, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 3), align 4
  store i32 -4, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 4), align 16
  store i32 5, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 5), align 4
  store i32 6, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 6), align 8
  store i32 -7, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %243 = call i32 @_40_array_write_loop(i32 noundef 6)
  %244 = load i32, ptr %8, align 4
  %245 = add nsw i32 %244, %243
  store i32 %245, ptr %8, align 4
  %246 = load i32, ptr %7, align 4
  %247 = icmp eq i32 %246, 9
  br i1 %247, label %248, label %251

248:                                              ; preds = %242
  %249 = load i32, ptr %8, align 4
  %250 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %249)
  store i32 0, ptr %3, align 4
  br label %484

251:                                              ; preds = %242
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %10, ptr align 16 @__const.main.pointer_data, i64 32, i1 false)
  %252 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %253 = call i32 @_41_pointer_loop(ptr noundef %252, i32 noundef 6)
  %254 = load i32, ptr %8, align 4
  %255 = add nsw i32 %254, %253
  store i32 %255, ptr %8, align 4
  %256 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %257 = call i32 @_42_pointer_increment(ptr noundef %256, i32 noundef 6)
  %258 = load i32, ptr %8, align 4
  %259 = add nsw i32 %258, %257
  store i32 %259, ptr %8, align 4
  %260 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %261 = call i32 @_43_pointer_write_loop(ptr noundef %260, i32 noundef 6)
  %262 = load i32, ptr %8, align 4
  %263 = add nsw i32 %262, %261
  store i32 %263, ptr %8, align 4
  %264 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %265 = call i32 @_44_pointer_array_loop(ptr noundef %264, i32 noundef 6)
  %266 = load i32, ptr %8, align 4
  %267 = add nsw i32 %266, %265
  store i32 %267, ptr %8, align 4
  %268 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %269 = call i32 @_45_pointer_nested_loop(ptr noundef %268, i32 noundef 4)
  %270 = load i32, ptr %8, align 4
  %271 = add nsw i32 %270, %269
  store i32 %271, ptr %8, align 4
  %272 = load i32, ptr %7, align 4
  %273 = icmp eq i32 %272, 10
  br i1 %273, label %274, label %277

274:                                              ; preds = %251
  %275 = load i32, ptr %8, align 4
  %276 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %275)
  store i32 0, ptr %3, align 4
  br label %484

277:                                              ; preds = %251
  store i32 0, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %278 = call i32 @_46_global_for()
  %279 = load i32, ptr %8, align 4
  %280 = add nsw i32 %279, %278
  store i32 %280, ptr %8, align 4
  %281 = call i32 @_47_global_while()
  %282 = load i32, ptr %8, align 4
  %283 = add nsw i32 %282, %281
  store i32 %283, ptr %8, align 4
  %284 = call i32 @_48_global_array_loop()
  %285 = load i32, ptr %8, align 4
  %286 = add nsw i32 %285, %284
  store i32 %286, ptr %8, align 4
  %287 = call i32 @_49_global_matrix_loop()
  %288 = load i32, ptr %8, align 4
  %289 = add nsw i32 %288, %287
  store i32 %289, ptr %8, align 4
  %290 = load i32, ptr %9, align 4
  store i32 %290, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %291 = call i32 @_50_global_state_loop()
  %292 = load i32, ptr %8, align 4
  %293 = add nsw i32 %292, %291
  store i32 %293, ptr %8, align 4
  store i32 0, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %294 = call i32 @_51_global_nested()
  %295 = load i32, ptr %8, align 4
  %296 = add nsw i32 %295, %294
  store i32 %296, ptr %8, align 4
  %297 = load i32, ptr %7, align 4
  %298 = icmp eq i32 %297, 11
  br i1 %298, label %299, label %302

299:                                              ; preds = %277
  %300 = load i32, ptr %8, align 4
  %301 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %300)
  store i32 0, ptr %3, align 4
  br label %484

302:                                              ; preds = %277
  %303 = load i32, ptr %9, align 4
  %304 = call i32 @_52_loop_carried_value(i32 noundef %303)
  %305 = load i32, ptr %8, align 4
  %306 = add nsw i32 %305, %304
  store i32 %306, ptr %8, align 4
  %307 = load i32, ptr %9, align 4
  %308 = call i32 @_53_multiple_loop_carried(i32 noundef %307)
  %309 = load i32, ptr %8, align 4
  %310 = add nsw i32 %309, %308
  store i32 %310, ptr %8, align 4
  %311 = load i32, ptr %9, align 4
  %312 = call i32 @_54_nested_loop_carried(i32 noundef %311)
  %313 = load i32, ptr %8, align 4
  %314 = add nsw i32 %313, %312
  store i32 %314, ptr %8, align 4
  %315 = load i32, ptr %9, align 4
  %316 = call i32 @_55_value_after_loop(i32 noundef %315)
  %317 = load i32, ptr %8, align 4
  %318 = add nsw i32 %317, %316
  store i32 %318, ptr %8, align 4
  %319 = load i32, ptr %7, align 4
  %320 = icmp eq i32 %319, 12
  br i1 %320, label %321, label %324

321:                                              ; preds = %302
  %322 = load i32, ptr %8, align 4
  %323 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %322)
  store i32 0, ptr %3, align 4
  br label %484

324:                                              ; preds = %302
  %325 = load i32, ptr %9, align 4
  %326 = call i32 @_56_prefix_loop(i32 noundef %325, i32 noundef 2, i32 noundef 4)
  %327 = load i32, ptr %8, align 4
  %328 = add nsw i32 %327, %326
  store i32 %328, ptr %8, align 4
  %329 = load i32, ptr %9, align 4
  %330 = call i32 @_57_suffix_loop(i32 noundef %329)
  %331 = load i32, ptr %8, align 4
  %332 = add nsw i32 %331, %330
  store i32 %332, ptr %8, align 4
  %333 = load i32, ptr %9, align 4
  %334 = call i32 @_58_prefix_nested_suffix(i32 noundef %333, i32 noundef 4)
  %335 = load i32, ptr %8, align 4
  %336 = add nsw i32 %335, %334
  store i32 %336, ptr %8, align 4
  %337 = load i32, ptr %7, align 4
  %338 = icmp eq i32 %337, 13
  br i1 %338, label %339, label %342

339:                                              ; preds = %324
  %340 = load i32, ptr %8, align 4
  %341 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %340)
  store i32 0, ptr %3, align 4
  br label %484

342:                                              ; preds = %324
  %343 = load i32, ptr %9, align 4
  %344 = call i32 @_59_ternary_loop_limit(i32 noundef %343, i32 noundef 5)
  %345 = load i32, ptr %8, align 4
  %346 = add nsw i32 %345, %344
  store i32 %346, ptr %8, align 4
  %347 = call i32 @_60_ternary_loop_update(i32 noundef 6)
  %348 = load i32, ptr %8, align 4
  %349 = add nsw i32 %348, %347
  store i32 %349, ptr %8, align 4
  %350 = call i32 @_61_nested_ternary_loops(i32 noundef 6)
  %351 = load i32, ptr %8, align 4
  %352 = add nsw i32 %351, %350
  store i32 %352, ptr %8, align 4
  %353 = load i32, ptr %7, align 4
  %354 = icmp eq i32 %353, 14
  br i1 %354, label %355, label %358

355:                                              ; preds = %342
  %356 = load i32, ptr %8, align 4
  %357 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %356)
  store i32 0, ptr %3, align 4
  br label %484

358:                                              ; preds = %342
  %359 = load i32, ptr %9, align 4
  %360 = call i32 @_62_dynamic_alloca(i32 noundef 4, i32 noundef %359)
  %361 = load i32, ptr %8, align 4
  %362 = add nsw i32 %361, %360
  store i32 %362, ptr %8, align 4
  %363 = load i32, ptr %9, align 4
  %364 = call i32 @_63_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %363)
  %365 = load i32, ptr %8, align 4
  %366 = add nsw i32 %365, %364
  store i32 %366, ptr %8, align 4
  %367 = load i32, ptr %9, align 4
  %368 = call i32 @_64_dynamic_alloca_nested(i32 noundef 4, i32 noundef %367)
  %369 = load i32, ptr %8, align 4
  %370 = add nsw i32 %369, %368
  store i32 %370, ptr %8, align 4
  %371 = load i32, ptr %7, align 4
  %372 = icmp eq i32 %371, 15
  br i1 %372, label %373, label %376

373:                                              ; preds = %358
  %374 = load i32, ptr %8, align 4
  %375 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %374)
  store i32 0, ptr %3, align 4
  br label %484

376:                                              ; preds = %358
  %377 = load i32, ptr %9, align 4
  %378 = call i32 @_65_malloc_loop(i32 noundef 4, i32 noundef %377)
  %379 = load i32, ptr %8, align 4
  %380 = add nsw i32 %379, %378
  store i32 %380, ptr %8, align 4
  %381 = load i32, ptr %9, align 4
  %382 = call i32 @_66_malloc_nested(i32 noundef 4, i32 noundef %381, i32 noundef 3)
  %383 = load i32, ptr %8, align 4
  %384 = add nsw i32 %383, %382
  store i32 %384, ptr %8, align 4
  %385 = load i32, ptr %7, align 4
  %386 = icmp eq i32 %385, 16
  br i1 %386, label %387, label %390

387:                                              ; preds = %376
  %388 = load i32, ptr %8, align 4
  %389 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %388)
  store i32 0, ptr %3, align 4
  br label %484

390:                                              ; preds = %376
  store i32 0, ptr @g_void_result, align 4
  %391 = load i32, ptr %9, align 4
  call void @_67_void_for(i32 noundef %391)
  %392 = load i32, ptr %9, align 4
  call void @_68_void_while(i32 noundef %392)
  %393 = load i32, ptr %9, align 4
  call void @_69_void_dowhile(i32 noundef %393)
  %394 = load i32, ptr %9, align 4
  call void @_70_void_nested(i32 noundef %394)
  %395 = load i32, ptr %9, align 4
  call void @_71_void_continue(i32 noundef %395)
  store i32 0, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  call void @_72_void_global_only()
  %396 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  call void @_73_void_pointer(ptr noundef %396, i32 noundef 6)
  call void @_74_void_array(i32 noundef 6)
  %397 = load i32, ptr @g_void_result, align 4
  %398 = load i32, ptr %8, align 4
  %399 = add nsw i32 %398, %397
  store i32 %399, ptr %8, align 4
  %400 = load i32, ptr %7, align 4
  %401 = icmp eq i32 %400, 17
  br i1 %401, label %402, label %405

402:                                              ; preds = %390
  %403 = load i32, ptr %8, align 4
  %404 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %403)
  store i32 0, ptr %3, align 4
  br label %484

405:                                              ; preds = %390
  %406 = load i32, ptr %9, align 4
  %407 = call i32 @_75_loop_return_paths(i32 noundef %406)
  %408 = load i32, ptr %8, align 4
  %409 = add nsw i32 %408, %407
  store i32 %409, ptr %8, align 4
  %410 = load i32, ptr %9, align 4
  %411 = call i32 @_76_nested_return_paths(i32 noundef %410)
  %412 = load i32, ptr %8, align 4
  %413 = add nsw i32 %412, %411
  store i32 %413, ptr %8, align 4
  %414 = load i32, ptr %9, align 4
  %415 = call i32 @_77_loop_final_returns(i32 noundef %414)
  %416 = load i32, ptr %8, align 4
  %417 = add nsw i32 %416, %415
  store i32 %417, ptr %8, align 4
  %418 = load i32, ptr %7, align 4
  %419 = icmp eq i32 %418, 18
  br i1 %419, label %420, label %423

420:                                              ; preds = %405
  %421 = load i32, ptr %8, align 4
  %422 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %421)
  store i32 0, ptr %3, align 4
  br label %484

423:                                              ; preds = %405
  %424 = load i32, ptr %9, align 4
  %425 = call i32 @_78_state_machine_loop(i32 noundef %424)
  %426 = load i32, ptr %8, align 4
  %427 = add nsw i32 %426, %425
  store i32 %427, ptr %8, align 4
  %428 = load i32, ptr %9, align 4
  %429 = call i32 @_79_multiple_backedge_values(i32 noundef %428)
  %430 = load i32, ptr %8, align 4
  %431 = add nsw i32 %430, %429
  store i32 %431, ptr %8, align 4
  %432 = load i32, ptr %9, align 4
  %433 = call i32 @_80_nested_state(i32 noundef %432)
  %434 = load i32, ptr %8, align 4
  %435 = add nsw i32 %434, %433
  store i32 %435, ptr %8, align 4
  %436 = load i32, ptr %7, align 4
  %437 = icmp eq i32 %436, 19
  br i1 %437, label %438, label %441

438:                                              ; preds = %423
  %439 = load i32, ptr %8, align 4
  %440 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %439)
  store i32 0, ptr %3, align 4
  br label %484

441:                                              ; preds = %423
  %442 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  store i32 1, ptr %442, align 16
  %443 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 1
  store i32 2, ptr %443, align 4
  %444 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 2
  store i32 3, ptr %444, align 8
  %445 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 3
  store i32 4, ptr %445, align 4
  %446 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 4
  store i32 5, ptr %446, align 16
  %447 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 5
  store i32 6, ptr %447, align 4
  %448 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 6
  store i32 7, ptr %448, align 8
  %449 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 7
  store i32 8, ptr %449, align 4
  %450 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %451 = call i32 @_81_array_pointer_nested(ptr noundef %450, i32 noundef 5)
  %452 = load i32, ptr %8, align 4
  %453 = add nsw i32 %452, %451
  store i32 %453, ptr %8, align 4
  %454 = call i32 @_82_matrix_state(i32 noundef 3)
  %455 = load i32, ptr %8, align 4
  %456 = add nsw i32 %455, %454
  store i32 %456, ptr %8, align 4
  %457 = load i32, ptr %7, align 4
  %458 = icmp eq i32 %457, 20
  br i1 %458, label %459, label %462

459:                                              ; preds = %441
  %460 = load i32, ptr %8, align 4
  %461 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %460)
  store i32 0, ptr %3, align 4
  br label %484

462:                                              ; preds = %441
  %463 = load i32, ptr %9, align 4
  store i32 %463, ptr %11, align 4
  %464 = load i32, ptr %9, align 4
  %465 = call i32 @_83_complex_loop_control(ptr noundef %11, i32 noundef 5, i32 noundef %464, i32 noundef 3)
  %466 = load i32, ptr %8, align 4
  %467 = add nsw i32 %466, %465
  store i32 %467, ptr %8, align 4
  %468 = load i32, ptr %9, align 4
  %469 = call i32 @_84_complex_loop_state(ptr noundef %11, i32 noundef 6, i32 noundef %468, i32 noundef 3, i32 noundef 5)
  %470 = load i32, ptr %8, align 4
  %471 = add nsw i32 %470, %469
  store i32 %471, ptr %8, align 4
  %472 = load i32, ptr %9, align 4
  %473 = call i32 @_85_loop_stress(ptr noundef %11, i32 noundef 6, i32 noundef %472, i32 noundef 3, i32 noundef 5)
  %474 = load i32, ptr %8, align 4
  %475 = add nsw i32 %474, %473
  store i32 %475, ptr %8, align 4
  %476 = load i32, ptr %7, align 4
  %477 = icmp eq i32 %476, 21
  br i1 %477, label %478, label %481

478:                                              ; preds = %462
  %479 = load i32, ptr %8, align 4
  %480 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %479)
  store i32 0, ptr %3, align 4
  br label %484

481:                                              ; preds = %462
  %482 = load i32, ptr %8, align 4
  %483 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %482)
  store i32 0, ptr %3, align 4
  br label %484

484:                                              ; preds = %481, %478, %459, %438, %420, %402, %387, %373, %355, %339, %321, %299, %274, %248, %239, %221, %197, %182, %160, %142, %121, %99, %71
  %485 = load i32, ptr %3, align 4
  ret i32 %485
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

; Function Attrs: nounwind willreturn memory(none)
declare i32 @abs(i32 noundef) #5

declare i32 @printf(ptr noundef, ...) #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #7

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { nounwind }
attributes #10 = { nounwind willreturn memory(read) }
attributes #11 = { nounwind willreturn memory(none) }

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
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
!59 = distinct !{!59, !7}
!60 = distinct !{!60, !7}
!61 = distinct !{!61, !7}
!62 = distinct !{!62, !7}
!63 = distinct !{!63, !7}
!64 = distinct !{!64, !7}
!65 = distinct !{!65, !7}
!66 = distinct !{!66, !7}
!67 = distinct !{!67, !7}
!68 = distinct !{!68, !7}
!69 = distinct !{!69, !7}
!70 = distinct !{!70, !7}
!71 = distinct !{!71, !7}
!72 = distinct !{!72, !7}
!73 = distinct !{!73, !7}
!74 = distinct !{!74, !7}
!75 = distinct !{!75, !7}
!76 = distinct !{!76, !7}
!77 = distinct !{!77, !7}
!78 = distinct !{!78, !7}
!79 = distinct !{!79, !7}
!80 = distinct !{!80, !7}
!81 = distinct !{!81, !7}
!82 = distinct !{!82, !7}
!83 = distinct !{!83, !7}
!84 = distinct !{!84, !7}
!85 = distinct !{!85, !7}
!86 = distinct !{!86, !7}
!87 = distinct !{!87, !7}
!88 = distinct !{!88, !7}
!89 = distinct !{!89, !7}
!90 = distinct !{!90, !7}
!91 = distinct !{!91, !7}
!92 = distinct !{!92, !7}
!93 = distinct !{!93, !7}
!94 = distinct !{!94, !7}
!95 = distinct !{!95, !7}
!96 = distinct !{!96, !7}
!97 = distinct !{!97, !7}
!98 = distinct !{!98, !7}
!99 = distinct !{!99, !7}
!100 = distinct !{!100, !7}
!101 = distinct !{!101, !7}
!102 = distinct !{!102, !7}
!103 = distinct !{!103, !7}
!104 = distinct !{!104, !7}
!105 = distinct !{!105, !7}
!106 = distinct !{!106, !7}
!107 = distinct !{!107, !7}
!108 = distinct !{!108, !7}
!109 = distinct !{!109, !7}
!110 = distinct !{!110, !7}
!111 = distinct !{!111, !7}
!112 = distinct !{!112, !7}
!113 = distinct !{!113, !7}
!114 = distinct !{!114, !7}
!115 = distinct !{!115, !7}
!116 = distinct !{!116, !7}
!117 = distinct !{!117, !7}
!118 = distinct !{!118, !7}
!119 = distinct !{!119, !7}
!120 = distinct !{!120, !7}
!121 = distinct !{!121, !7}
!122 = distinct !{!122, !7}
!123 = distinct !{!123, !7}
!124 = distinct !{!124, !7}
!125 = distinct !{!125, !7}
!126 = distinct !{!126, !7}
!127 = distinct !{!127, !7}
!128 = distinct !{!128, !7}
!129 = distinct !{!129, !7}
!130 = distinct !{!130, !7}
!131 = distinct !{!131, !7}
!132 = distinct !{!132, !7}
