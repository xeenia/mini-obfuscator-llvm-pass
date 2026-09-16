; ModuleID = '_02_loops.bc'
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
define dso_local i32 @_0_for_simple(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %13, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %3, align 4
  br label %5, !llvm.loop !8

16:                                               ; preds = %5
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_1_while_simple(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %9, %4
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %15

9:                                                ; preds = %5
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %2, align 4
  br label %5, !llvm.loop !10

15:                                               ; preds = %5
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_2_dowhile_simple(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %11, %4
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4
  br label %11

11:                                               ; preds = %5
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %5, label %15, !llvm.loop !11

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_3_for_empty_body(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %9, %3
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %2, align 4
  br label %4, !llvm.loop !12

12:                                               ; preds = %4
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_4_while_true_break(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %4, %16
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4
  br label %11

11:                                               ; preds = %5
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  br label %17

16:                                               ; preds = %11
  br label %5

17:                                               ; preds = %15
  %18 = load i32, ptr %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_5_for_continue(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %23, %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %26

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  %14 = zext i1 %13 to i8
  store i8 %14, ptr %4, align 1
  br label %15

15:                                               ; preds = %10
  %16 = load i8, ptr %4, align 1
  %17 = trunc i8 %16 to i1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  br label %23

19:                                               ; preds = %15
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %2, align 4
  br label %23

23:                                               ; preds = %19, %18
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  br label %6, !llvm.loop !13

26:                                               ; preds = %6
  %27 = load i32, ptr %2, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_6_relational_loop(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %5, align 4
  br label %8

8:                                                ; preds = %16, %6
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %19

12:                                               ; preds = %8
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr %4, align 4
  br label %16

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %5, align 4
  br label %8, !llvm.loop !14

19:                                               ; preds = %8
  %20 = load i32, ptr %4, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_7_not_equal_loop(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %9, %4
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %9, label %19

9:                                                ; preds = %5
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = zext i1 %14 to i64
  %16 = select i1 %14, i32 1, i32 -1
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %2, align 4
  br label %5, !llvm.loop !15

19:                                               ; preds = %5
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_8_loop_and(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %16, %6
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  store i1 false, ptr %.reg2mem, align 1
  br i1 %10, label %11, label %15

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  store i1 %14, ptr %.reg2mem, align 1
  br label %15

15:                                               ; preds = %11, %7
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %16, label %22

16:                                               ; preds = %15
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %5, align 4
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %7, !llvm.loop !16

22:                                               ; preds = %15
  %23 = load i32, ptr %5, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_9_loop_or(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %16, %6
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  store i1 true, ptr %.reg2mem, align 1
  br i1 %10, label %15, label %11

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  store i1 %14, ptr %.reg2mem, align 1
  br label %15

15:                                               ; preds = %11, %7
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %16, label %22

16:                                               ; preds = %15
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %5, align 4
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %7, !llvm.loop !17

22:                                               ; preds = %15
  %23 = load i32, ptr %5, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_nested_loop_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem = alloca i1, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  br label %10

10:                                               ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %11

11:                                               ; preds = %43, %10
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %23

15:                                               ; preds = %11
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %16, %17
  store i1 true, ptr %.reg2mem1, align 1
  br i1 %18, label %32, label %19

19:                                               ; preds = %15
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp eq i32 %20, %21
  store i1 true, ptr %.reg2mem1, align 1
  br i1 %22, label %32, label %23

23:                                               ; preds = %19, %11
  %24 = load i32, ptr %8, align 4
  %25 = load i32, ptr %7, align 4
  %26 = icmp eq i32 %24, %25
  store i1 false, ptr %.reg2mem, align 1
  br i1 %26, label %27, label %31

27:                                               ; preds = %23
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %4, align 4
  %30 = icmp slt i32 %28, %29
  store i1 %30, ptr %.reg2mem, align 1
  br label %31

31:                                               ; preds = %27, %23
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  br label %32

32:                                               ; preds = %31, %19, %15
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  br i1 %.reload2, label %33, label %44

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = load i32, ptr %9, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %9, align 4
  %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %8, align 4
  br label %39

39:                                               ; preds = %33
  %40 = load i32, ptr %8, align 4
  %41 = icmp sgt i32 %40, 20
  br i1 %41, label %42, label %43

42:                                               ; preds = %39
  br label %44

43:                                               ; preds = %39
  br label %11, !llvm.loop !18

44:                                               ; preds = %42, %32
  %45 = load i32, ptr %9, align 4
  ret i32 %45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_arithmetic_loop(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %18, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %21

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 3
  %12 = load i32, ptr %3, align 4
  %13 = sub nsw i32 %12, 1
  %14 = mul nsw i32 %13, 2
  %15 = add nsw i32 %11, %14
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %2, align 4
  br label %18

18:                                               ; preds = %9
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  br label %5, !llvm.loop !19

21:                                               ; preds = %5
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_nested_arithmetic_loop(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %26, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %29

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  %13 = sub nsw i32 %12, 1
  %14 = mul nsw i32 0, %13
  %15 = add nsw i32 %11, %14
  %16 = icmp eq i32 %10, %15
  br i1 %16, label %17, label %20

17:                                               ; preds = %9
  %18 = load i32, ptr %3, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, ptr %.reg2mem, align 4
  br label %23

20:                                               ; preds = %9
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 3
  store i32 %22, ptr %.reg2mem, align 4
  br label %23

23:                                               ; preds = %20, %17
  %.reload = load i32, ptr %.reg2mem, align 4
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, %.reload
  store i32 %25, ptr %2, align 4
  br label %26

26:                                               ; preds = %23
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %3, align 4
  br label %5, !llvm.loop !20

29:                                               ; preds = %5
  %30 = load i32, ptr %2, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_ternary_loop_body(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %22, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %25

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %.reg2mem, align 4
  br label %19

16:                                               ; preds = %9
  %17 = load i32, ptr %3, align 4
  %18 = mul nsw i32 %17, 3
  store i32 %18, ptr %.reg2mem, align 4
  br label %19

19:                                               ; preds = %16, %13
  %.reload = load i32, ptr %.reg2mem, align 4
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, %.reload
  store i32 %21, ptr %2, align 4
  br label %22

22:                                               ; preds = %19
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %5, !llvm.loop !21

25:                                               ; preds = %5
  %26 = load i32, ptr %2, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_multiple_accumulators(i32 noundef %0) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %34, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %37

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = srem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  store i32 %16, ptr %.reg2mem, align 4
  br label %18

17:                                               ; preds = %11
  store i32 0, ptr %.reg2mem, align 4
  br label %18

18:                                               ; preds = %15, %17
  %.reload = load i32, ptr %.reg2mem, align 4
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, %.reload
  store i32 %20, ptr %2, align 4
  br label %21

21:                                               ; preds = %18
  %22 = load i32, ptr %5, align 4
  %23 = srem i32 %22, 2
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %21
  %26 = load i32, ptr %5, align 4
  store i32 %26, ptr %.reg2mem1, align 4
  br label %28

27:                                               ; preds = %21
  store i32 0, ptr %.reg2mem1, align 4
  br label %28

28:                                               ; preds = %27, %25
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, %.reload2
  store i32 %30, ptr %3, align 4
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %4, align 4
  br label %34

34:                                               ; preds = %28
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %5, align 4
  br label %7, !llvm.loop !22

37:                                               ; preds = %7
  %38 = load i32, ptr %2, align 4
  %39 = load i32, ptr %3, align 4
  %40 = add nsw i32 %38, %39
  %41 = load i32, ptr %4, align 4
  %42 = add nsw i32 %40, %41
  ret i32 %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_nested_for(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %25, %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %28

10:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %21, %10
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %24

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %2, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %4, align 4
  br label %11, !llvm.loop !23

24:                                               ; preds = %11
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %3, align 4
  br label %6, !llvm.loop !24

28:                                               ; preds = %6
  %29 = load i32, ptr %2, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_for_while(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %24, %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %27

10:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %15, %10
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %23

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = mul nsw i32 %16, %17
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %2, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %4, align 4
  br label %11, !llvm.loop !25

23:                                               ; preds = %11
  br label %24

24:                                               ; preds = %23
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %3, align 4
  br label %6, !llvm.loop !26

27:                                               ; preds = %6
  %28 = load i32, ptr %2, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_while_dowhile(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %22, %5
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %19, %10
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %4, align 4
  %21 = icmp slt i32 %20, 2
  br i1 %21, label %11, label %22, !llvm.loop !27

22:                                               ; preds = %19
  %23 = load i32, ptr %2, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %2, align 4
  br label %6, !llvm.loop !28

25:                                               ; preds = %6
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_triple_for(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %36, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %39

11:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %32, %11
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %1, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %35

16:                                               ; preds = %12
  store i32 0, ptr %5, align 4
  br label %17

17:                                               ; preds = %28, %16
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %18, 2
  br i1 %19, label %20, label %31

20:                                               ; preds = %17
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %2, align 4
  br label %28

28:                                               ; preds = %20
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %5, align 4
  br label %17, !llvm.loop !29

31:                                               ; preds = %17
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  br label %12, !llvm.loop !30

35:                                               ; preds = %12
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %3, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %3, align 4
  br label %7, !llvm.loop !31

39:                                               ; preds = %7
  %40 = load i32, ptr %2, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_mixed_nested_loops(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %33, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %29, %11
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %32

15:                                               ; preds = %12
  store i32 0, ptr %5, align 4
  br label %16

16:                                               ; preds = %26, %15
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %2, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %5, align 4
  br label %26

26:                                               ; preds = %16
  %27 = load i32, ptr %5, align 4
  %28 = icmp slt i32 %27, 2
  br i1 %28, label %16, label %29, !llvm.loop !32

29:                                               ; preds = %26
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %12, !llvm.loop !33

32:                                               ; preds = %12
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %3, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %3, align 4
  br label %7, !llvm.loop !34

36:                                               ; preds = %7
  %37 = load i32, ptr %2, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_inner_break(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %30, %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %33

10:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %26, %10
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %29

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %2, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %4, align 4
  %23 = icmp sge i32 %22, 2
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  br label %29

25:                                               ; preds = %21
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %4, align 4
  br label %11, !llvm.loop !35

29:                                               ; preds = %24, %11
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %3, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %3, align 4
  br label %6, !llvm.loop !36

33:                                               ; preds = %6
  %34 = load i32, ptr %2, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_inner_continue(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %35, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %38

11:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %31, %11
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %1, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %34

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  %20 = zext i1 %19 to i8
  store i8 %20, ptr %5, align 1
  br label %21

21:                                               ; preds = %16
  %22 = load i8, ptr %5, align 1
  %23 = trunc i8 %22 to i1
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  br label %31

25:                                               ; preds = %21
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr %2, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %2, align 4
  br label %31

31:                                               ; preds = %25, %24
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %4, align 4
  br label %12, !llvm.loop !37

34:                                               ; preds = %12
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %3, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %3, align 4
  br label %7, !llvm.loop !38

38:                                               ; preds = %7
  %39 = load i32, ptr %2, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_break_with_ternary(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %38, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %41

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 3
  %14 = zext i1 %13 to i64
  %15 = select i1 %13, i32 1, i32 0
  store i32 %15, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %16

16:                                               ; preds = %34, %11
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %1, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %37

20:                                               ; preds = %16
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %2, align 4
  br label %26

26:                                               ; preds = %20
  %27 = load i32, ptr %4, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %33

29:                                               ; preds = %26
  %30 = load i32, ptr %5, align 4
  %31 = icmp sge i32 %30, 2
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  br label %37

33:                                               ; preds = %29, %26
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %5, align 4
  br label %16, !llvm.loop !39

37:                                               ; preds = %32, %16
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %3, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %3, align 4
  br label %7, !llvm.loop !40

41:                                               ; preds = %7
  %42 = load i32, ptr %2, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_continue_and_break(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %35, %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %38

10:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %33, %22, %10
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %34

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %4, align 4
  br label %18

18:                                               ; preds = %15
  %19 = load i32, ptr %4, align 4
  %20 = srem i32 %19, 2
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  br label %11, !llvm.loop !41

23:                                               ; preds = %18
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %2, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %2, align 4
  br label %29

29:                                               ; preds = %23
  %30 = load i32, ptr %2, align 4
  %31 = icmp sgt i32 %30, 30
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  br label %34

33:                                               ; preds = %29
  br label %11, !llvm.loop !41

34:                                               ; preds = %32, %11
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %3, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %3, align 4
  br label %6, !llvm.loop !42

38:                                               ; preds = %6
  %39 = load i32, ptr %2, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_early_return(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %20, %5
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %23

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %3, align 4
  br label %14

14:                                               ; preds = %10
  %15 = load i32, ptr %3, align 4
  %16 = icmp sgt i32 %15, 20
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = load i32, ptr %3, align 4
  store i32 %18, ptr %1, align 4
  br label %25

19:                                               ; preds = %14
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %4, align 4
  br label %6, !llvm.loop !43

23:                                               ; preds = %6
  %24 = load i32, ptr %3, align 4
  store i32 %24, ptr %1, align 4
  br label %25

25:                                               ; preds = %23, %17
  %26 = load i32, ptr %1, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_nested_early_return(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %32, %6
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %35

11:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %28, %11
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %31

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %3, align 4
  br label %22

22:                                               ; preds = %16
  %23 = load i32, ptr %3, align 4
  %24 = icmp sgt i32 %23, 40
  br i1 %24, label %25, label %27

25:                                               ; preds = %22
  %26 = load i32, ptr %3, align 4
  store i32 %26, ptr %1, align 4
  br label %37

27:                                               ; preds = %22
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %5, align 4
  br label %12, !llvm.loop !44

31:                                               ; preds = %12
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  br label %7, !llvm.loop !45

35:                                               ; preds = %7
  %36 = load i32, ptr %3, align 4
  store i32 %36, ptr %1, align 4
  br label %37

37:                                               ; preds = %35, %25
  %38 = load i32, ptr %1, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_multiple_returns(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %17, %4
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %20

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr %3, align 4
  br label %12

12:                                               ; preds = %8
  %13 = load i32, ptr %3, align 4
  %14 = icmp sgt i32 %13, 20
  br i1 %14, label %15, label %17

15:                                               ; preds = %12
  %16 = load i32, ptr %3, align 4
  store i32 %16, ptr %1, align 4
  br label %22

17:                                               ; preds = %12
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, ptr %2, align 4
  br label %5, !llvm.loop !46

20:                                               ; preds = %5
  %21 = load i32, ptr %3, align 4
  store i32 %21, ptr %1, align 4
  br label %22

22:                                               ; preds = %20, %15
  %23 = load i32, ptr %1, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_dowhile_return(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %5, %19
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr %4, align 4
  br label %10

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = icmp sge i32 %11, %12
  br i1 %13, label %14, label %16

14:                                               ; preds = %10
  %15 = load i32, ptr %4, align 4
  store i32 %15, ptr %1, align 4
  br label %22

16:                                               ; preds = %10
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %16
  br i1 true, label %6, label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %4, align 4
  store i32 %21, ptr %1, align 4
  br label %22

22:                                               ; preds = %20, %14
  %23 = load i32, ptr %1, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_for_while_for(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %34, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %37

11:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %30, %11
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %33

15:                                               ; preds = %12
  store i32 0, ptr %5, align 4
  br label %16

16:                                               ; preds = %27, %15
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %17, 2
  br i1 %18, label %19, label %30

19:                                               ; preds = %16
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, ptr %2, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %2, align 4
  br label %27

27:                                               ; preds = %19
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %5, align 4
  br label %16, !llvm.loop !47

30:                                               ; preds = %16
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %12, !llvm.loop !48

33:                                               ; preds = %12
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %3, align 4
  br label %7, !llvm.loop !49

37:                                               ; preds = %7
  %38 = load i32, ptr %2, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_while_for_dowhile(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %33, %6
  %8 = load i32, ptr %2, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %30, %11
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %33

15:                                               ; preds = %12
  store i32 0, ptr %5, align 4
  br label %16

16:                                               ; preds = %26, %15
  %17 = load i32, ptr %2, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %3, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %5, align 4
  br label %26

26:                                               ; preds = %16
  %27 = load i32, ptr %5, align 4
  %28 = icmp slt i32 %27, 2
  br i1 %28, label %16, label %29, !llvm.loop !50

29:                                               ; preds = %26
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %12, !llvm.loop !51

33:                                               ; preds = %12
  %34 = load i32, ptr %2, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %2, align 4
  br label %7, !llvm.loop !52

36:                                               ; preds = %7
  %37 = load i32, ptr %3, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_four_level_nesting(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %46, %7
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %1, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %49

12:                                               ; preds = %8
  store i32 0, ptr %4, align 4
  br label %13

13:                                               ; preds = %42, %12
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 2
  br i1 %15, label %16, label %45

16:                                               ; preds = %13
  store i32 0, ptr %5, align 4
  br label %17

17:                                               ; preds = %38, %16
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %18, 2
  br i1 %19, label %20, label %41

20:                                               ; preds = %17
  store i32 0, ptr %6, align 4
  br label %21

21:                                               ; preds = %34, %20
  %22 = load i32, ptr %6, align 4
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %24, label %37

24:                                               ; preds = %21
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %2, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %2, align 4
  br label %34

34:                                               ; preds = %24
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %6, align 4
  br label %21, !llvm.loop !53

37:                                               ; preds = %21
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  br label %17, !llvm.loop !54

41:                                               ; preds = %17
  br label %42

42:                                               ; preds = %41
  %43 = load i32, ptr %4, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %4, align 4
  br label %13, !llvm.loop !55

45:                                               ; preds = %13
  br label %46

46:                                               ; preds = %45
  %47 = load i32, ptr %3, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %3, align 4
  br label %8, !llvm.loop !56

49:                                               ; preds = %8
  %50 = load i32, ptr %2, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_multiple_loop_variables(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %6 = load i32, ptr %1, align 4
  store i32 %6, ptr %4, align 4
  br label %7

7:                                                ; preds = %17, %5
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %2, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, ptr %4, align 4
  br label %7, !llvm.loop !57

22:                                               ; preds = %7
  %23 = load i32, ptr %2, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_complex_update(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %13, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 2
  store i32 %15, ptr %3, align 4
  br label %5, !llvm.loop !58

16:                                               ; preds = %5
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_decreasing_loop(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %5 = load i32, ptr %1, align 4
  store i32 %5, ptr %3, align 4
  br label %6

6:                                                ; preds = %13, %4
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, -1
  store i32 %15, ptr %3, align 4
  br label %6, !llvm.loop !59

16:                                               ; preds = %6
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_multiple_condition_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %26, %8
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %17

13:                                               ; preds = %9
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  store i1 true, ptr %.reg2mem1, align 1
  br i1 %16, label %25, label %17

17:                                               ; preds = %13, %9
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp slt i32 %18, %19
  store i1 false, ptr %.reg2mem, align 1
  br i1 %20, label %21, label %24

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = icmp slt i32 %22, 10
  store i1 %23, ptr %.reg2mem, align 1
  br label %24

24:                                               ; preds = %21, %17
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  br label %25

25:                                               ; preds = %24, %13
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  br i1 %.reload2, label %26, label %32

26:                                               ; preds = %25
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %7, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %6, align 4
  br label %9, !llvm.loop !60

32:                                               ; preds = %25
  %33 = load i32, ptr %7, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_computed_loop_limit(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  store i32 %13, ptr %.reg2mem, align 4
  br label %16

14:                                               ; preds = %8
  %15 = load i32, ptr %3, align 4
  store i32 %15, ptr %.reg2mem, align 4
  br label %16

16:                                               ; preds = %14, %12
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %27, %16
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %30

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr %4, align 4
  %24 = mul nsw i32 %22, %23
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %5, align 4
  br label %27

27:                                               ; preds = %21
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %17, !llvm.loop !61

30:                                               ; preds = %17
  %31 = load i32, ptr %5, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_array_for(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = load i32, ptr %1, align 4
  store i32 %10, ptr %.reg2mem, align 4
  br label %12

11:                                               ; preds = %6
  store i32 8, ptr %.reg2mem, align 4
  br label %12

12:                                               ; preds = %11, %9
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %13

13:                                               ; preds = %24, %12
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %27

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %2, align 4
  br label %24

24:                                               ; preds = %17
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %4, align 4
  br label %13, !llvm.loop !62

27:                                               ; preds = %13
  %28 = load i32, ptr %2, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_array_while(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = load i32, ptr %1, align 4
  store i32 %10, ptr %.reg2mem, align 4
  br label %12

11:                                               ; preds = %6
  store i32 8, ptr %.reg2mem, align 4
  br label %12

12:                                               ; preds = %11, %9
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  br label %13

13:                                               ; preds = %17, %12
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %26

17:                                               ; preds = %13
  %18 = load i32, ptr %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %3, align 4
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %2, align 4
  br label %13, !llvm.loop !63

26:                                               ; preds = %13
  %27 = load i32, ptr %3, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_matrix_nested(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  store i32 %11, ptr %.reg2mem, align 4
  br label %13

12:                                               ; preds = %7
  store i32 3, ptr %.reg2mem, align 4
  br label %13

13:                                               ; preds = %12, %10
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %14

14:                                               ; preds = %36, %13
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %3, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %39

18:                                               ; preds = %14
  store i32 0, ptr %5, align 4
  br label %19

19:                                               ; preds = %32, %18
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %35

22:                                               ; preds = %19
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %24
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x i32], ptr %25, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %2, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %2, align 4
  br label %32

32:                                               ; preds = %22
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %5, align 4
  br label %19, !llvm.loop !64

35:                                               ; preds = %19
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %4, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %4, align 4
  br label %14, !llvm.loop !65

39:                                               ; preds = %14
  %40 = load i32, ptr %2, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_array_controlled_loop(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i1, align 1
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %14, %5
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  store i1 false, ptr %.reg2mem, align 1
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %11, 8
  store i1 %12, ptr %.reg2mem, align 1
  br label %13

13:                                               ; preds = %10, %6
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %14, label %31

14:                                               ; preds = %13
  %15 = load i32, ptr %2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = icmp sge i32 %18, 0
  %20 = zext i1 %19 to i64
  %21 = select i1 %19, i32 1, i32 2
  store i32 %21, ptr %4, align 4
  %22 = load i32, ptr %2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %3, align 4
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %2, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %2, align 4
  br label %6, !llvm.loop !66

31:                                               ; preds = %13
  %32 = load i32, ptr %3, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_array_write_loop(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = load i32, ptr %1, align 4
  store i32 %10, ptr %.reg2mem, align 4
  br label %12

11:                                               ; preds = %6
  store i32 8, ptr %.reg2mem, align 4
  br label %12

12:                                               ; preds = %11, %9
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %13

13:                                               ; preds = %29, %12
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %32

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  %19 = mul nsw i32 %18, 2
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  store i32 %19, ptr %22, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %3, align 4
  br label %29

29:                                               ; preds = %17
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %13, !llvm.loop !67

32:                                               ; preds = %13
  %33 = load i32, ptr %3, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_pointer_loop(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %19, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load ptr, ptr %2, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %4, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %7, !llvm.loop !68

22:                                               ; preds = %7
  %23 = load i32, ptr %4, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_pointer_increment(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %9, %5
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %18

9:                                                ; preds = %6
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %4, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds i32, ptr %14, i32 1
  store ptr %15, ptr %2, align 8
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, ptr %3, align 4
  br label %6, !llvm.loop !69

18:                                               ; preds = %6
  %19 = load i32, ptr %4, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_pointer_write_loop(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %25, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %28

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = mul nsw i32 %12, 3
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %14, i64 %16
  store i32 %13, ptr %17, align 4
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %4, align 4
  br label %25

25:                                               ; preds = %11
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %7, !llvm.loop !70

28:                                               ; preds = %7
  %29 = load i32, ptr %4, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_pointer_array_loop(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 8
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = load i32, ptr %3, align 4
  store i32 %12, ptr %.reg2mem, align 4
  br label %14

13:                                               ; preds = %8
  store i32 8, ptr %.reg2mem, align 4
  br label %14

14:                                               ; preds = %13, %11
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %32, %14
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %35

19:                                               ; preds = %15
  %20 = load ptr, ptr %2, align 8
  %21 = load i32, ptr %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, ptr %20, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = load i32, ptr %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = add nsw i32 %24, %28
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %4, align 4
  br label %32

32:                                               ; preds = %19
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %6, align 4
  br label %15, !llvm.loop !71

35:                                               ; preds = %15
  %36 = load i32, ptr %4, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_pointer_nested_loop(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %9

9:                                                ; preds = %36, %8
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %39

13:                                               ; preds = %9
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = zext i1 %16 to i64
  %18 = select i1 %16, i32 3, i32 2
  store i32 %18, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %19

19:                                               ; preds = %32, %13
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %35

23:                                               ; preds = %19
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %24, %25
  %27 = load ptr, ptr %2, align 8
  %28 = load i32, ptr %27, align 4
  %29 = add nsw i32 %26, %28
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %4, align 4
  br label %32

32:                                               ; preds = %23
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %7, align 4
  br label %19, !llvm.loop !72

35:                                               ; preds = %19
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %5, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %5, align 4
  br label %9, !llvm.loop !73

39:                                               ; preds = %9
  %40 = load i32, ptr %4, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_for() #0 {
entry:
  br label %0

0:                                                ; preds = %entry
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
  br label %1, !llvm.loop !74

12:                                               ; preds = %1
  %13 = load i32, ptr @g_y, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_global_while() #0 {
entry:
  br label %0

0:                                                ; preds = %entry
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
  br label %1, !llvm.loop !75

9:                                                ; preds = %1
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = add nsw i32 %10, %11
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_global_array_loop() #0 {
entry:
  br label %0

0:                                                ; preds = %entry
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
  br label %1, !llvm.loop !76

14:                                               ; preds = %1
  %15 = load i32, ptr @g_y, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_global_matrix_loop() #0 {
entry:
  br label %0

0:                                                ; preds = %entry
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
  br label %5, !llvm.loop !77

21:                                               ; preds = %5
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr @g_x, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr @g_x, align 4
  br label %1, !llvm.loop !78

25:                                               ; preds = %1
  %26 = load i32, ptr @g_z, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_50_global_state_loop() #0 {
entry:
  br label %0

0:                                                ; preds = %entry
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
  br label %1, !llvm.loop !79

11:                                               ; preds = %1
  %12 = load i32, ptr @g_y, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_51_global_nested() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  store i32 0, ptr %0, align 4
  store i32 0, ptr @g_x, align 4
  br label %2

2:                                                ; preds = %23, %1
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
  %17 = load i32, ptr %0, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %0, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr @g_y, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr @g_y, align 4
  br label %7, !llvm.loop !80

22:                                               ; preds = %7
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr @g_x, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr @g_x, align 4
  br label %2, !llvm.loop !81

26:                                               ; preds = %2
  %27 = load i32, ptr %0, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_loop_carried_value(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %14, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %17

9:                                                ; preds = %5
  %10 = load i32, ptr %2, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %2, align 4
  br label %14

14:                                               ; preds = %9
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  br label %5, !llvm.loop !82

17:                                               ; preds = %5
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_multiple_loop_carried(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 2, ptr %3, align 4
  store i32 3, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %9

9:                                                ; preds = %25, %8
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %1, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %28

13:                                               ; preds = %9
  %14 = load i32, ptr %2, align 4
  store i32 %14, ptr %6, align 4
  %15 = load i32, ptr %3, align 4
  store i32 %15, ptr %7, align 4
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %2, align 4
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, ptr %3, align 4
  %22 = load i32, ptr %2, align 4
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %4, align 4
  br label %25

25:                                               ; preds = %13
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %9, !llvm.loop !83

28:                                               ; preds = %9
  %29 = load i32, ptr %2, align 4
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %31, %32
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_nested_loop_carried(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %22, %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  store i32 %11, ptr %4, align 4
  br label %12

12:                                               ; preds = %15, %10
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %21

15:                                               ; preds = %12
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %2, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, -1
  store i32 %20, ptr %4, align 4
  br label %12, !llvm.loop !84

21:                                               ; preds = %12
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %6, !llvm.loop !85

25:                                               ; preds = %6
  %26 = load i32, ptr %2, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_55_value_after_loop(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %14, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %17

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  br label %14

14:                                               ; preds = %9
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  br label %5, !llvm.loop !86

17:                                               ; preds = %5
  %18 = load i32, ptr %2, align 4
  %19 = mul nsw i32 %18, 3
  store i32 %19, ptr %2, align 4
  %20 = load i32, ptr %1, align 4
  %21 = load i32, ptr %2, align 4
  %22 = sub nsw i32 %21, %20
  store i32 %22, ptr %2, align 4
  %23 = load i32, ptr %2, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_prefix_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  br label %11

11:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %6, align 4
  %15 = load i32, ptr %6, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %7, align 4
  %17 = load i32, ptr %7, align 4
  %18 = sub nsw i32 %17, 3
  store i32 %18, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %19

19:                                               ; preds = %29, %11
  %20 = load i32, ptr %10, align 4
  %21 = load i32, ptr %5, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %32

23:                                               ; preds = %19
  %24 = load i32, ptr %10, align 4
  %25 = load i32, ptr %8, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %9, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %9, align 4
  br label %29

29:                                               ; preds = %23
  %30 = load i32, ptr %10, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %10, align 4
  br label %19, !llvm.loop !87

32:                                               ; preds = %19
  %33 = load i32, ptr %9, align 4
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %33, %34
  %36 = load i32, ptr %7, align 4
  %37 = add nsw i32 %35, %36
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_suffix_loop(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %13, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %3, align 4
  br label %5, !llvm.loop !88

16:                                               ; preds = %5
  %17 = load i32, ptr %2, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %2, align 4
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, 10
  store i32 %20, ptr %2, align 4
  %21 = load i32, ptr %2, align 4
  %22 = mul nsw i32 %21, 3
  store i32 %22, ptr %2, align 4
  %23 = load i32, ptr %2, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_58_prefix_nested_suffix(i32 noundef %0, i32 noundef %1) #0 {
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
  %8 = load i32, ptr %2, align 4
  %9 = mul nsw i32 %8, 2
  store i32 %9, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %28, %7
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %31

14:                                               ; preds = %10
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %24, %14
  %16 = load i32, ptr %6, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %18, label %27

18:                                               ; preds = %15
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %4, align 4
  br label %24

24:                                               ; preds = %18
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %6, align 4
  br label %15, !llvm.loop !89

27:                                               ; preds = %15
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %5, align 4
  br label %10, !llvm.loop !90

31:                                               ; preds = %10
  %32 = load i32, ptr %2, align 4
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %4, align 4
  %35 = load i32, ptr %4, align 4
  %36 = mul nsw i32 %35, 2
  store i32 %36, ptr %4, align 4
  %37 = load i32, ptr %4, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_59_ternary_loop_limit(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  store i32 %13, ptr %.reg2mem, align 4
  br label %16

14:                                               ; preds = %8
  %15 = load i32, ptr %3, align 4
  store i32 %15, ptr %.reg2mem, align 4
  br label %16

16:                                               ; preds = %14, %12
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %25, %16
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %28

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %5, align 4
  br label %25

25:                                               ; preds = %21
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %6, align 4
  br label %17, !llvm.loop !91

28:                                               ; preds = %17
  %29 = load i32, ptr %5, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_60_ternary_loop_update(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %13, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %21

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  %17 = zext i1 %16 to i64
  %18 = select i1 %16, i32 1, i32 2
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %3, align 4
  br label %5, !llvm.loop !92

21:                                               ; preds = %5
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_61_nested_ternary_loops(i32 noundef %0) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %44, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %47

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 3
  br i1 %13, label %14, label %19

14:                                               ; preds = %11
  %15 = load i32, ptr %3, align 4
  %16 = icmp sgt i32 %15, 6
  %17 = zext i1 %16 to i64
  %18 = select i1 %16, i32 3, i32 2
  store i32 %18, ptr %.reg2mem, align 4
  br label %20

19:                                               ; preds = %11
  store i32 1, ptr %.reg2mem, align 4
  br label %20

20:                                               ; preds = %19, %14
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %21

21:                                               ; preds = %40, %20
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %4, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %43

25:                                               ; preds = %21
  %26 = load i32, ptr %5, align 4
  %27 = srem i32 %26, 2
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %33

29:                                               ; preds = %25
  %30 = load i32, ptr %3, align 4
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %30, %31
  store i32 %32, ptr %.reg2mem1, align 4
  br label %37

33:                                               ; preds = %25
  %34 = load i32, ptr %3, align 4
  %35 = load i32, ptr %5, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %.reg2mem1, align 4
  br label %37

37:                                               ; preds = %33, %29
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %38 = load i32, ptr %2, align 4
  %39 = add nsw i32 %38, %.reload2
  store i32 %39, ptr %2, align 4
  br label %40

40:                                               ; preds = %37
  %41 = load i32, ptr %5, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %5, align 4
  br label %21, !llvm.loop !93

43:                                               ; preds = %21
  br label %44

44:                                               ; preds = %43
  %45 = load i32, ptr %3, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %3, align 4
  br label %7, !llvm.loop !94

47:                                               ; preds = %7
  %48 = load i32, ptr %2, align 4
  ret i32 %48
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_62_dynamic_alloca(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = load i32, ptr %2, align 4
  store i32 %14, ptr %.reg2mem, align 4
  br label %16

15:                                               ; preds = %10
  store i32 1, ptr %.reg2mem, align 4
  br label %16

16:                                               ; preds = %15, %13
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  %17 = load i32, ptr %4, align 4
  %18 = zext i32 %17 to i64
  %19 = call ptr @llvm.stacksave()
  store ptr %19, ptr %5, align 8
  %20 = alloca i32, i64 %18, align 16
  store ptr %20, ptr %.reg2mem1, align 8
  store i64 %18, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %21

21:                                               ; preds = %38, %16
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %4, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %41

25:                                               ; preds = %21
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %8, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr %8, align 4
  %30 = sext i32 %29 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %31 = getelementptr inbounds i32, ptr %.reload3, i64 %30
  store i32 %28, ptr %31, align 4
  %32 = load i32, ptr %8, align 4
  %33 = sext i32 %32 to i64
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %34 = getelementptr inbounds i32, ptr %.reload2, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = load i32, ptr %7, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, ptr %7, align 4
  br label %38

38:                                               ; preds = %25
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %8, align 4
  br label %21, !llvm.loop !95

41:                                               ; preds = %21
  %42 = load i32, ptr %7, align 4
  %43 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %43)
  ret i32 %42
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_63_dynamic_alloca_pointer(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  br label %11

11:                                               ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %12

12:                                               ; preds = %11
  %13 = load i32, ptr %2, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %12
  %16 = load i32, ptr %2, align 4
  store i32 %16, ptr %.reg2mem, align 4
  br label %18

17:                                               ; preds = %12
  store i32 1, ptr %.reg2mem, align 4
  br label %18

18:                                               ; preds = %17, %15
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  %19 = load i32, ptr %4, align 4
  %20 = zext i32 %19 to i64
  %21 = call ptr @llvm.stacksave()
  store ptr %21, ptr %5, align 8
  %22 = alloca i32, i64 %20, align 16
  store i64 %20, ptr %6, align 8
  store ptr %22, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %23

23:                                               ; preds = %36, %18
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %4, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %39

27:                                               ; preds = %23
  %28 = load i32, ptr %3, align 4
  %29 = load i32, ptr %9, align 4
  %30 = mul nsw i32 %29, 2
  %31 = add nsw i32 %28, %30
  %32 = load ptr, ptr %7, align 8
  %33 = load i32, ptr %9, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr %32, i64 %34
  store i32 %31, ptr %35, align 4
  br label %36

36:                                               ; preds = %27
  %37 = load i32, ptr %9, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %9, align 4
  br label %23, !llvm.loop !96

39:                                               ; preds = %23
  store i32 0, ptr %10, align 4
  br label %40

40:                                               ; preds = %52, %39
  %41 = load i32, ptr %10, align 4
  %42 = load i32, ptr %4, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %55

44:                                               ; preds = %40
  %45 = load ptr, ptr %7, align 8
  %46 = load i32, ptr %10, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %45, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %8, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %8, align 4
  br label %52

52:                                               ; preds = %44
  %53 = load i32, ptr %10, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %10, align 4
  br label %40, !llvm.loop !97

55:                                               ; preds = %40
  %56 = load i32, ptr %8, align 4
  %57 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %57)
  ret i32 %56
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_64_dynamic_alloca_nested(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  br label %11

11:                                               ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %12

12:                                               ; preds = %11
  %13 = load i32, ptr %2, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %12
  %16 = load i32, ptr %2, align 4
  store i32 %16, ptr %.reg2mem, align 4
  br label %18

17:                                               ; preds = %12
  store i32 1, ptr %.reg2mem, align 4
  br label %18

18:                                               ; preds = %17, %15
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  %19 = load i32, ptr %4, align 4
  %20 = zext i32 %19 to i64
  %21 = call ptr @llvm.stacksave()
  store ptr %21, ptr %5, align 8
  %22 = alloca i32, i64 %20, align 16
  store ptr %22, ptr %.reg2mem1, align 8
  store i64 %20, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %23

23:                                               ; preds = %34, %18
  %24 = load i32, ptr %8, align 4
  %25 = load i32, ptr %4, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %37

27:                                               ; preds = %23
  %28 = load i32, ptr %3, align 4
  %29 = load i32, ptr %8, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %8, align 4
  %32 = sext i32 %31 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %33 = getelementptr inbounds i32, ptr %.reload3, i64 %32
  store i32 %30, ptr %33, align 4
  br label %34

34:                                               ; preds = %27
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %8, align 4
  br label %23, !llvm.loop !98

37:                                               ; preds = %23
  store i32 0, ptr %9, align 4
  br label %38

38:                                               ; preds = %59, %37
  %39 = load i32, ptr %9, align 4
  %40 = load i32, ptr %4, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %62

42:                                               ; preds = %38
  store i32 0, ptr %10, align 4
  br label %43

43:                                               ; preds = %55, %42
  %44 = load i32, ptr %10, align 4
  %45 = icmp slt i32 %44, 2
  br i1 %45, label %46, label %58

46:                                               ; preds = %43
  %47 = load i32, ptr %9, align 4
  %48 = sext i32 %47 to i64
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %49 = getelementptr inbounds i32, ptr %.reload2, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %10, align 4
  %52 = add nsw i32 %50, %51
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %7, align 4
  br label %55

55:                                               ; preds = %46
  %56 = load i32, ptr %10, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %10, align 4
  br label %43, !llvm.loop !99

58:                                               ; preds = %43
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %9, align 4
  br label %38, !llvm.loop !100

62:                                               ; preds = %38
  %63 = load i32, ptr %7, align 4
  %64 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %64)
  ret i32 %63
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_65_malloc_loop(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = load i32, ptr %2, align 4
  store i32 %14, ptr %.reg2mem, align 4
  br label %16

15:                                               ; preds = %10
  store i32 1, ptr %.reg2mem, align 4
  br label %16

16:                                               ; preds = %13, %15
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  %17 = load i32, ptr %4, align 4
  %18 = sext i32 %17 to i64
  %19 = mul i64 %18, 4
  %20 = call noalias ptr @malloc(i64 noundef %19) #8
  store ptr %20, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %21

21:                                               ; preds = %16
  %22 = load ptr, ptr %5, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %28

24:                                               ; preds = %21
  %25 = load i32, ptr %3, align 4
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds i32, ptr %26, i64 0
  store i32 %25, ptr %27, align 4
  br label %29

28:                                               ; preds = %21
  br label %29

29:                                               ; preds = %28, %24
  store i32 0, ptr %7, align 4
  br label %30

30:                                               ; preds = %47, %29
  %31 = load i32, ptr %7, align 4
  %32 = load i32, ptr %4, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %50

34:                                               ; preds = %30
  %35 = load ptr, ptr %5, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %45

37:                                               ; preds = %34
  %38 = load i32, ptr %3, align 4
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %38, %39
  %41 = load ptr, ptr %5, align 8
  %42 = load i32, ptr %7, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %41, i64 %43
  store i32 %40, ptr %44, align 4
  br label %46

45:                                               ; preds = %34
  br label %46

46:                                               ; preds = %45, %37
  br label %47

47:                                               ; preds = %46
  %48 = load i32, ptr %7, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %7, align 4
  br label %30, !llvm.loop !101

50:                                               ; preds = %30
  store i32 0, ptr %8, align 4
  br label %51

51:                                               ; preds = %68, %50
  %52 = load i32, ptr %8, align 4
  %53 = load i32, ptr %4, align 4
  %54 = icmp slt i32 %52, %53
  br i1 %54, label %55, label %71

55:                                               ; preds = %51
  %56 = load ptr, ptr %5, align 8
  %57 = icmp ne ptr %56, null
  br i1 %57, label %58, label %64

58:                                               ; preds = %55
  %59 = load ptr, ptr %5, align 8
  %60 = load i32, ptr %8, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %59, i64 %61
  %63 = load i32, ptr %62, align 4
  store i32 %63, ptr %.reg2mem1, align 4
  br label %65

64:                                               ; preds = %55
  store i32 -1, ptr %.reg2mem1, align 4
  br label %65

65:                                               ; preds = %64, %58
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %66 = load i32, ptr %6, align 4
  %67 = add nsw i32 %66, %.reload2
  store i32 %67, ptr %6, align 4
  br label %68

68:                                               ; preds = %65
  %69 = load i32, ptr %8, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %8, align 4
  br label %51, !llvm.loop !102

71:                                               ; preds = %51
  %72 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %72) #9
  %73 = load i32, ptr %6, align 4
  ret i32 %73
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_66_malloc_nested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  br label %12

12:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  br label %13

13:                                               ; preds = %12
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = load i32, ptr %3, align 4
  store i32 %17, ptr %.reg2mem, align 4
  br label %19

18:                                               ; preds = %13
  store i32 1, ptr %.reg2mem, align 4
  br label %19

19:                                               ; preds = %18, %16
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %6, align 4
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = mul i64 %21, 4
  %23 = call noalias ptr @malloc(i64 noundef %22) #8
  store ptr %23, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %24

24:                                               ; preds = %41, %19
  %25 = load i32, ptr %9, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %44

28:                                               ; preds = %24
  %29 = load ptr, ptr %7, align 8
  %30 = icmp ne ptr %29, null
  br i1 %30, label %31, label %39

31:                                               ; preds = %28
  %32 = load i32, ptr %4, align 4
  %33 = load i32, ptr %9, align 4
  %34 = add nsw i32 %32, %33
  %35 = load ptr, ptr %7, align 8
  %36 = load i32, ptr %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  store i32 %34, ptr %38, align 4
  br label %40

39:                                               ; preds = %28
  br label %40

40:                                               ; preds = %39, %31
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %9, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %9, align 4
  br label %24, !llvm.loop !103

44:                                               ; preds = %24
  store i32 0, ptr %10, align 4
  br label %45

45:                                               ; preds = %74, %44
  %46 = load i32, ptr %10, align 4
  %47 = load i32, ptr %6, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %77

49:                                               ; preds = %45
  store i32 0, ptr %11, align 4
  br label %50

50:                                               ; preds = %70, %49
  %51 = load i32, ptr %11, align 4
  %52 = icmp slt i32 %51, 2
  br i1 %52, label %53, label %73

53:                                               ; preds = %50
  %54 = load ptr, ptr %7, align 8
  %55 = icmp ne ptr %54, null
  br i1 %55, label %56, label %66

56:                                               ; preds = %53
  %57 = load ptr, ptr %7, align 8
  %58 = load i32, ptr %10, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %5, align 4
  %63 = add nsw i32 %61, %62
  %64 = load i32, ptr %11, align 4
  %65 = add nsw i32 %63, %64
  store i32 %65, ptr %.reg2mem1, align 4
  br label %67

66:                                               ; preds = %53
  store i32 -1, ptr %.reg2mem1, align 4
  br label %67

67:                                               ; preds = %66, %56
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %68 = load i32, ptr %8, align 4
  %69 = add nsw i32 %68, %.reload2
  store i32 %69, ptr %8, align 4
  br label %70

70:                                               ; preds = %67
  %71 = load i32, ptr %11, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %11, align 4
  br label %50, !llvm.loop !104

73:                                               ; preds = %50
  br label %74

74:                                               ; preds = %73
  %75 = load i32, ptr %10, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %10, align 4
  br label %45, !llvm.loop !105

77:                                               ; preds = %45
  %78 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %78) #9
  %79 = load i32, ptr %8, align 4
  ret i32 %79
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_for(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %12, %3
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %15

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr @g_void_result, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  br label %12

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %2, align 4
  br label %4, !llvm.loop !106

15:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_while(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %8, %3
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %15

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = mul nsw i32 %9, 2
  %11 = load i32, ptr @g_void_result, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr @g_void_result, align 4
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %2, align 4
  br label %4, !llvm.loop !107

15:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_69_void_dowhile(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %11, %3
  %5 = load i32, ptr %2, align 4
  %6 = add nsw i32 %5, 1
  %7 = load i32, ptr @g_void_result, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr @g_void_result, align 4
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4
  br label %11

11:                                               ; preds = %4
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %4, label %15, !llvm.loop !108

15:                                               ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_70_void_nested(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %5

5:                                                ; preds = %23, %4
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %26

9:                                                ; preds = %5
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %19, %9
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 2
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr @g_void_result, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr @g_void_result, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %3, align 4
  br label %10, !llvm.loop !109

22:                                               ; preds = %10
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %2, align 4
  br label %5, !llvm.loop !110

26:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_71_void_continue(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %17, %3
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %20

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = srem i32 %9, 2
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  br label %17

13:                                               ; preds = %8
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  br label %17

17:                                               ; preds = %13, %12
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %2, align 4
  br label %4, !llvm.loop !111

20:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_72_void_global_only() #0 {
entry:
  br label %0

0:                                                ; preds = %entry
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
  br label %1, !llvm.loop !112

12:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_73_void_pointer(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %25, %5
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %28

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  %12 = load ptr, ptr %2, align 8
  %13 = load i32, ptr %4, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = add nsw i32 %16, %11
  store i32 %17, ptr %15, align 4
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr @g_void_result, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr @g_void_result, align 4
  br label %25

25:                                               ; preds = %10
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %6, !llvm.loop !113

28:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_74_void_array(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  br label %5

5:                                                ; preds = %4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %10

8:                                                ; preds = %5
  %9 = load i32, ptr %1, align 4
  store i32 %9, ptr %.reg2mem, align 4
  br label %11

10:                                               ; preds = %5
  store i32 8, ptr %.reg2mem, align 4
  br label %11

11:                                               ; preds = %10, %8
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %12

12:                                               ; preds = %29, %11
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %32

16:                                               ; preds = %12
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = add nsw i32 %21, %17
  store i32 %22, ptr %20, align 4
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr @g_void_result, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr @g_void_result, align 4
  br label %29

29:                                               ; preds = %16
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %3, align 4
  br label %12, !llvm.loop !114

32:                                               ; preds = %12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_75_loop_return_paths(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %20, %5
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %23

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %3, align 4
  br label %14

14:                                               ; preds = %10
  %15 = load i32, ptr %4, align 4
  %16 = icmp eq i32 %15, 3
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = load i32, ptr %3, align 4
  store i32 %18, ptr %1, align 4
  br label %26

19:                                               ; preds = %14
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %4, align 4
  br label %6, !llvm.loop !115

23:                                               ; preds = %6
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 100
  store i32 %25, ptr %1, align 4
  br label %26

26:                                               ; preds = %23, %17
  %27 = load i32, ptr %1, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_76_nested_return_paths(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %38, %6
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %41

11:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %34, %11
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %37

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %3, align 4
  br label %22

22:                                               ; preds = %16
  %23 = load i32, ptr %5, align 4
  %24 = icmp eq i32 %23, 2
  br i1 %24, label %25, label %27

25:                                               ; preds = %22
  %26 = load i32, ptr %3, align 4
  store i32 %26, ptr %1, align 4
  br label %44

27:                                               ; preds = %22
  %28 = load i32, ptr %3, align 4
  %29 = icmp sgt i32 %28, 30
  br i1 %29, label %30, label %33

30:                                               ; preds = %27
  %31 = load i32, ptr %3, align 4
  %32 = mul nsw i32 %31, 2
  store i32 %32, ptr %1, align 4
  br label %44

33:                                               ; preds = %27
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %5, align 4
  br label %12, !llvm.loop !116

37:                                               ; preds = %12
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %4, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %4, align 4
  br label %7, !llvm.loop !117

41:                                               ; preds = %7
  %42 = load i32, ptr %3, align 4
  %43 = add nsw i32 %42, 100
  store i32 %43, ptr %1, align 4
  br label %44

44:                                               ; preds = %41, %30, %25
  %45 = load i32, ptr %1, align 4
  ret i32 %45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_77_loop_final_returns(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %13, %4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %3, align 4
  br label %5, !llvm.loop !118

16:                                               ; preds = %5
  %17 = load i32, ptr %2, align 4
  %18 = icmp sgt i32 %17, 20
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = load i32, ptr %2, align 4
  %21 = mul nsw i32 %20, 2
  store i32 %21, ptr %.reg2mem, align 4
  br label %25

22:                                               ; preds = %16
  %23 = load i32, ptr %2, align 4
  %24 = add nsw i32 %23, 10
  store i32 %24, ptr %.reg2mem, align 4
  br label %25

25:                                               ; preds = %22, %19
  %.reload = load i32, ptr %.reg2mem, align 4
  ret i32 %.reload
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_78_state_machine_loop(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %20, %5
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %23

10:                                               ; preds = %6
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr %4, align 4
  %13 = mul nsw i32 %11, %12
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr %3, align 4
  %16 = load i32, ptr %2, align 4
  %17 = icmp eq i32 %16, 1
  %18 = zext i1 %17 to i64
  %19 = select i1 %17, i32 2, i32 1
  store i32 %19, ptr %2, align 4
  br label %20

20:                                               ; preds = %10
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %4, align 4
  br label %6, !llvm.loop !119

23:                                               ; preds = %6
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %2, align 4
  %26 = add nsw i32 %24, %25
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_79_multiple_backedge_values(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 2, ptr %3, align 4
  store i32 3, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %23, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %26

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %2, align 4
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %3, align 4
  %18 = load i32, ptr %2, align 4
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %4, align 4
  br label %23

23:                                               ; preds = %11
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %5, align 4
  br label %7, !llvm.loop !120

26:                                               ; preds = %7
  %27 = load i32, ptr %2, align 4
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %29, %30
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_80_nested_state(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %33, %6
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %1, align 4
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
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %2, align 4
  %23 = load i32, ptr %3, align 4
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  %28 = srem i32 %27, 5
  store i32 %28, ptr %3, align 4
  br label %29

29:                                               ; preds = %15
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %5, align 4
  br label %12, !llvm.loop !121

32:                                               ; preds = %12
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %4, align 4
  br label %7, !llvm.loop !122

36:                                               ; preds = %7
  %37 = load i32, ptr %2, align 4
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %37, %38
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_81_array_pointer_nested(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  store i32 %13, ptr %.reg2mem, align 4
  br label %15

14:                                               ; preds = %9
  store i32 8, ptr %.reg2mem, align 4
  br label %15

15:                                               ; preds = %14, %12
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %56, %15
  %17 = load i32, ptr %6, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %59

20:                                               ; preds = %16
  store i32 0, ptr %7, align 4
  br label %21

21:                                               ; preds = %52, %20
  %22 = load i32, ptr %7, align 4
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %24, label %55

24:                                               ; preds = %21
  %25 = load ptr, ptr %2, align 8
  %26 = load i32, ptr %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 %29, %33
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr %5, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %5, align 4
  %39 = load i32, ptr %6, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = icmp sgt i32 %42, 0
  %44 = zext i1 %43 to i64
  %45 = select i1 %43, i32 1, i32 -1
  %46 = load ptr, ptr %2, align 8
  %47 = load i32, ptr %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, ptr %46, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = add nsw i32 %50, %45
  store i32 %51, ptr %49, align 4
  br label %52

52:                                               ; preds = %24
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %7, align 4
  br label %21, !llvm.loop !123

55:                                               ; preds = %21
  br label %56

56:                                               ; preds = %55
  %57 = load i32, ptr %6, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %6, align 4
  br label %16, !llvm.loop !124

59:                                               ; preds = %16
  %60 = load i32, ptr %5, align 4
  ret i32 %60
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_82_matrix_state(i32 noundef %0) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  store i32 %11, ptr %.reg2mem, align 4
  br label %13

12:                                               ; preds = %7
  store i32 3, ptr %.reg2mem, align 4
  br label %13

13:                                               ; preds = %12, %10
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %14

14:                                               ; preds = %45, %13
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %2, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %48

18:                                               ; preds = %14
  store i32 0, ptr %5, align 4
  br label %19

19:                                               ; preds = %32, %18
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %35

22:                                               ; preds = %19
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %24
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x i32], ptr %25, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %3, align 4
  br label %32

32:                                               ; preds = %22
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %5, align 4
  br label %19, !llvm.loop !125

35:                                               ; preds = %19
  %36 = load i32, ptr %3, align 4
  %37 = icmp sgt i32 %36, 20
  br i1 %37, label %38, label %41

38:                                               ; preds = %35
  %39 = load i32, ptr %3, align 4
  %40 = sdiv i32 %39, 2
  store i32 %40, ptr %.reg2mem1, align 4
  br label %44

41:                                               ; preds = %35
  %42 = load i32, ptr %3, align 4
  %43 = add nsw i32 %42, 3
  store i32 %43, ptr %.reg2mem1, align 4
  br label %44

44:                                               ; preds = %41, %38
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %3, align 4
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %4, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %4, align 4
  br label %14, !llvm.loop !126

48:                                               ; preds = %14
  %49 = load i32, ptr %3, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_83_complex_loop_control(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  br label %15

15:                                               ; preds = %entry
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  br label %16

16:                                               ; preds = %15
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %8, align 4
  %19 = icmp sgt i32 %17, %18
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  %21 = load i32, ptr %7, align 4
  store i32 %21, ptr %.reg2mem, align 4
  br label %24

22:                                               ; preds = %16
  %23 = load i32, ptr %8, align 4
  store i32 %23, ptr %.reg2mem, align 4
  br label %24

24:                                               ; preds = %20, %22
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %9, align 4
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %9, align 4
  %27 = icmp sgt i32 %26, 6
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  store i32 6, ptr %.reg2mem1, align 4
  br label %31

29:                                               ; preds = %25
  %30 = load i32, ptr %9, align 4
  store i32 %30, ptr %.reg2mem1, align 4
  br label %31

31:                                               ; preds = %28, %29
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %9, align 4
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %9, align 4
  %34 = icmp slt i32 %33, 1
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  store i32 1, ptr %.reg2mem3, align 4
  br label %38

36:                                               ; preds = %32
  %37 = load i32, ptr %9, align 4
  store i32 %37, ptr %.reg2mem3, align 4
  br label %38

38:                                               ; preds = %36, %35
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %9, align 4
  %39 = load i32, ptr @g_x, align 4
  store i32 %39, ptr %10, align 4
  store i32 0, ptr %11, align 4
  br label %40

40:                                               ; preds = %94, %38
  %41 = load i32, ptr %11, align 4
  %42 = load i32, ptr %9, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %97

44:                                               ; preds = %40
  store i32 0, ptr %12, align 4
  br label %45

45:                                               ; preds = %90, %44
  %46 = load i32, ptr %12, align 4
  %47 = load i32, ptr @g_limit, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %93

49:                                               ; preds = %45
  store i32 0, ptr %13, align 4
  br label %50

50:                                               ; preds = %87, %49
  %51 = load i32, ptr %13, align 4
  %52 = icmp slt i32 %51, 2
  br i1 %52, label %53, label %90

53:                                               ; preds = %50
  %54 = load i32, ptr %11, align 4
  %55 = load i32, ptr %12, align 4
  %56 = add nsw i32 %54, %55
  %57 = load i32, ptr %13, align 4
  %58 = add nsw i32 %56, %57
  %59 = srem i32 %58, 8
  store i32 %59, ptr %14, align 4
  %60 = load i32, ptr %14, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = load i32, ptr %10, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %10, align 4
  %66 = load ptr, ptr %5, align 8
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %10, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %10, align 4
  %70 = load i32, ptr %14, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = srem i32 %73, 2
  %75 = icmp eq i32 %74, 0
  %76 = zext i1 %75 to i64
  %77 = select i1 %75, i32 1, i32 -1
  %78 = load ptr, ptr %5, align 8
  %79 = load i32, ptr %78, align 4
  %80 = add nsw i32 %79, %77
  store i32 %80, ptr %78, align 4
  br label %81

81:                                               ; preds = %53
  %82 = load i32, ptr %10, align 4
  %83 = icmp sgt i32 %82, 50
  br i1 %83, label %84, label %86

84:                                               ; preds = %81
  %85 = load i32, ptr %10, align 4
  store i32 %85, ptr %4, align 4
  br label %99

86:                                               ; preds = %81
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %13, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %13, align 4
  br label %50, !llvm.loop !127

90:                                               ; preds = %50
  %91 = load i32, ptr %12, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %12, align 4
  br label %45, !llvm.loop !128

93:                                               ; preds = %45
  br label %94

94:                                               ; preds = %93
  %95 = load i32, ptr %11, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, ptr %11, align 4
  br label %40, !llvm.loop !129

97:                                               ; preds = %40
  %98 = load i32, ptr %10, align 4
  store i32 %98, ptr %4, align 4
  br label %99

99:                                               ; preds = %97, %84
  %100 = load i32, ptr %4, align 4
  ret i32 %100
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_84_complex_loop_state(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
entry:
  %.reg2mem5 = alloca i1, align 1
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  br label %14

14:                                               ; preds = %entry
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 %4, ptr %9, align 4
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr @g_x, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %10, align 4
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %18

18:                                               ; preds = %79, %14
  %19 = load i32, ptr %12, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %25

22:                                               ; preds = %18
  %23 = load i32, ptr %12, align 4
  %24 = icmp slt i32 %23, 8
  store i1 true, ptr %.reg2mem1, align 1
  br i1 %24, label %32, label %25

25:                                               ; preds = %22, %18
  %26 = load i32, ptr %11, align 4
  %27 = icmp slt i32 %26, 3
  store i1 false, ptr %.reg2mem, align 1
  br i1 %27, label %28, label %31

28:                                               ; preds = %25
  %29 = load i32, ptr %12, align 4
  %30 = icmp slt i32 %29, 10
  store i1 %30, ptr %.reg2mem, align 1
  br label %31

31:                                               ; preds = %28, %25
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  br label %32

32:                                               ; preds = %31, %22
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  br i1 %.reload2, label %33, label %82

33:                                               ; preds = %32
  %34 = load i32, ptr %12, align 4
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr %8, align 4
  %38 = icmp sgt i32 %36, %37
  br i1 %38, label %39, label %42

39:                                               ; preds = %33
  %40 = load i32, ptr %11, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %.reg2mem3, align 4
  br label %45

42:                                               ; preds = %33
  %43 = load i32, ptr %11, align 4
  %44 = sub nsw i32 %43, 1
  store i32 %44, ptr %.reg2mem3, align 4
  br label %45

45:                                               ; preds = %42, %39
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %11, align 4
  store i32 0, ptr %13, align 4
  br label %46

46:                                               ; preds = %75, %45
  %47 = load i32, ptr %13, align 4
  %48 = icmp slt i32 %47, 3
  store i1 false, ptr %.reg2mem5, align 1
  br i1 %48, label %49, label %52

49:                                               ; preds = %46
  %50 = load i32, ptr %11, align 4
  %51 = icmp slt i32 %50, 5
  store i1 %51, ptr %.reg2mem5, align 1
  br label %52

52:                                               ; preds = %49, %46
  %.reload6 = load i1, ptr %.reg2mem5, align 1
  br i1 %.reload6, label %53, label %78

53:                                               ; preds = %52
  %54 = load i32, ptr %12, align 4
  %55 = srem i32 %54, 8
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr %10, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %10, align 4
  %61 = load ptr, ptr %5, align 8
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %9, align 4
  %64 = add nsw i32 %62, %63
  %65 = load i32, ptr %10, align 4
  %66 = add nsw i32 %65, %64
  store i32 %66, ptr %10, align 4
  %67 = load i32, ptr %10, align 4
  %68 = srem i32 %67, 2
  %69 = icmp eq i32 %68, 0
  %70 = zext i1 %69 to i64
  %71 = select i1 %69, i32 1, i32 -1
  %72 = load ptr, ptr %5, align 8
  %73 = load i32, ptr %72, align 4
  %74 = add nsw i32 %73, %71
  store i32 %74, ptr %72, align 4
  br label %75

75:                                               ; preds = %53
  %76 = load i32, ptr %13, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %13, align 4
  br label %46, !llvm.loop !130

78:                                               ; preds = %52
  br label %79

79:                                               ; preds = %78
  %80 = load i32, ptr %12, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %12, align 4
  br label %18, !llvm.loop !131

82:                                               ; preds = %32
  %83 = load i32, ptr %10, align 4
  %84 = load i32, ptr %11, align 4
  %85 = add nsw i32 %83, %84
  ret i32 %85
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_85_loop_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
entry:
  %.reg2mem9 = alloca i32, align 4
  %.reg2mem7 = alloca i1, align 1
  %.reg2mem5 = alloca i1, align 1
  %.reg2mem3 = alloca i1, align 1
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
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
  %16 = alloca i32, align 4
  br label %17

17:                                               ; preds = %entry
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  br label %18

18:                                               ; preds = %17
  %19 = load i32, ptr %8, align 4
  %20 = load i32, ptr %9, align 4
  %21 = icmp sgt i32 %19, %20
  br i1 %21, label %22, label %24

22:                                               ; preds = %18
  %23 = load i32, ptr %8, align 4
  store i32 %23, ptr %.reg2mem, align 4
  br label %26

24:                                               ; preds = %18
  %25 = load i32, ptr %9, align 4
  store i32 %25, ptr %.reg2mem, align 4
  br label %26

26:                                               ; preds = %22, %24
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %11, align 4
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %11, align 4
  %29 = icmp sgt i32 %28, 8
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  store i32 8, ptr %.reg2mem1, align 4
  br label %33

31:                                               ; preds = %27
  %32 = load i32, ptr %11, align 4
  store i32 %32, ptr %.reg2mem1, align 4
  br label %33

33:                                               ; preds = %31, %30
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %11, align 4
  %34 = load i32, ptr %8, align 4
  %35 = load i32, ptr @g_x, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %12, align 4
  store i32 0, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %37

37:                                               ; preds = %121, %33
  %38 = load i32, ptr %14, align 4
  %39 = load i32, ptr %11, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %44

41:                                               ; preds = %37
  %42 = load i32, ptr %13, align 4
  %43 = icmp slt i32 %42, 10
  store i1 true, ptr %.reg2mem5, align 1
  br i1 %43, label %52, label %44

44:                                               ; preds = %41, %37
  %45 = load i32, ptr %14, align 4
  %46 = load i32, ptr %7, align 4
  %47 = icmp slt i32 %45, %46
  store i1 false, ptr %.reg2mem3, align 1
  br i1 %47, label %48, label %51

48:                                               ; preds = %44
  %49 = load i32, ptr %10, align 4
  %50 = icmp ne i32 %49, 0
  store i1 %50, ptr %.reg2mem3, align 1
  br label %51

51:                                               ; preds = %48, %44
  %.reload4 = load i1, ptr %.reg2mem3, align 1
  store i1 %.reload4, ptr %.reg2mem5, align 1
  br label %52

52:                                               ; preds = %51, %41
  %.reload6 = load i1, ptr %.reg2mem5, align 1
  br i1 %.reload6, label %53, label %124

53:                                               ; preds = %52
  %54 = load i32, ptr %14, align 4
  %55 = load i32, ptr %13, align 4
  %56 = add nsw i32 %54, %55
  %57 = srem i32 %56, 8
  store i32 %57, ptr %15, align 4
  %58 = load i32, ptr %15, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %12, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %12, align 4
  br label %64

64:                                               ; preds = %107, %53
  %65 = load i32, ptr %13, align 4
  %66 = icmp slt i32 %65, 4
  store i1 false, ptr %.reg2mem7, align 1
  br i1 %66, label %67, label %71

67:                                               ; preds = %64
  %68 = load i32, ptr %14, align 4
  %69 = load i32, ptr @g_limit, align 4
  %70 = icmp slt i32 %68, %69
  store i1 %70, ptr %.reg2mem7, align 1
  br label %71

71:                                               ; preds = %67, %64
  %.reload8 = load i1, ptr %.reg2mem7, align 1
  br i1 %.reload8, label %72, label %110

72:                                               ; preds = %71
  %73 = load i32, ptr %14, align 4
  %74 = load i32, ptr %13, align 4
  %75 = add nsw i32 %73, %74
  %76 = load i32, ptr %12, align 4
  %77 = add nsw i32 %76, %75
  store i32 %77, ptr %12, align 4
  store i32 0, ptr %16, align 4
  br label %78

78:                                               ; preds = %104, %72
  %79 = load i32, ptr %16, align 4
  %80 = icmp slt i32 %79, 2
  br i1 %80, label %81, label %107

81:                                               ; preds = %78
  %82 = load i32, ptr %15, align 4
  %83 = load i32, ptr %16, align 4
  %84 = add nsw i32 %82, %83
  %85 = srem i32 %84, 8
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = load i32, ptr %12, align 4
  %90 = add nsw i32 %89, %88
  store i32 %90, ptr %12, align 4
  %91 = load i32, ptr %12, align 4
  %92 = icmp sgt i32 %91, 0
  %93 = zext i1 %92 to i64
  %94 = select i1 %92, i32 1, i32 -1
  %95 = load ptr, ptr %6, align 8
  %96 = load i32, ptr %95, align 4
  %97 = add nsw i32 %96, %94
  store i32 %97, ptr %95, align 4
  br label %98

98:                                               ; preds = %81
  %99 = load ptr, ptr %6, align 8
  %100 = load i32, ptr %99, align 4
  %101 = icmp sgt i32 %100, 20
  br i1 %101, label %102, label %103

102:                                              ; preds = %98
  br label %107

103:                                              ; preds = %98
  br label %104

104:                                              ; preds = %103
  %105 = load i32, ptr %16, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %16, align 4
  br label %78, !llvm.loop !132

107:                                              ; preds = %102, %78
  %108 = load i32, ptr %13, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %13, align 4
  br label %64, !llvm.loop !133

110:                                              ; preds = %71
  %111 = load ptr, ptr %6, align 8
  %112 = load i32, ptr %111, align 4
  %113 = load i32, ptr %12, align 4
  %114 = add nsw i32 %113, %112
  store i32 %114, ptr %12, align 4
  br label %115

115:                                              ; preds = %110
  %116 = load i32, ptr %12, align 4
  %117 = icmp sgt i32 %116, 100
  br i1 %117, label %118, label %120

118:                                              ; preds = %115
  %119 = load i32, ptr %12, align 4
  store i32 %119, ptr %5, align 4
  br label %134

120:                                              ; preds = %115
  br label %121

121:                                              ; preds = %120
  %122 = load i32, ptr %14, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, ptr %14, align 4
  br label %37, !llvm.loop !134

124:                                              ; preds = %52
  %125 = load i32, ptr %12, align 4
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %130

127:                                              ; preds = %124
  %128 = load i32, ptr %12, align 4
  %129 = mul nsw i32 %128, 2
  store i32 %129, ptr %.reg2mem9, align 4
  br label %133

130:                                              ; preds = %124
  %131 = load i32, ptr %12, align 4
  %132 = sub nsw i32 0, %131
  store i32 %132, ptr %.reg2mem9, align 4
  br label %133

133:                                              ; preds = %130, %127
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  store i32 %.reload10, ptr %5, align 4
  br label %134

134:                                              ; preds = %133, %118
  %135 = load i32, ptr %5, align 4
  ret i32 %135
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [8 x i32], align 16
  %10 = alloca i32, align 4
  br label %11

11:                                               ; preds = %entry
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  br label %12

12:                                               ; preds = %11
  %13 = load i32, ptr %3, align 4
  %14 = icmp sgt i32 %13, 1
  br i1 %14, label %15, label %20

15:                                               ; preds = %12
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i64 1
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 @atoi(ptr noundef %18) #10
  store i32 %19, ptr %.reg2mem, align 4
  br label %21

20:                                               ; preds = %12
  store i32 4, ptr %.reg2mem, align 4
  br label %21

21:                                               ; preds = %15, %20
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %3, align 4
  %24 = icmp sgt i32 %23, 2
  br i1 %24, label %25, label %30

25:                                               ; preds = %22
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 2
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 @atoi(ptr noundef %28) #10
  store i32 %29, ptr %.reg2mem1, align 4
  br label %31

30:                                               ; preds = %22
  store i32 -1, ptr %.reg2mem1, align 4
  br label %31

31:                                               ; preds = %25, %30
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %32 = load i32, ptr %5, align 4
  %33 = call i32 @abs(i32 noundef %32) #11
  store i32 %33, ptr %8, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %8, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %34
  store i32 1, ptr %8, align 4
  br label %38

38:                                               ; preds = %37, %34
  %39 = load i32, ptr @g_step, align 4
  %40 = icmp sle i32 %39, 0
  br i1 %40, label %41, label %42

41:                                               ; preds = %38
  store i32 1, ptr @g_step, align 4
  br label %42

42:                                               ; preds = %41, %38
  %43 = load i32, ptr @g_limit, align 4
  %44 = icmp sle i32 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %42
  store i32 10, ptr @g_limit, align 4
  br label %46

46:                                               ; preds = %42, %45
  %47 = load i32, ptr %8, align 4
  %48 = call i32 @_0_for_simple(i32 noundef %47)
  %49 = load i32, ptr %7, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %7, align 4
  %51 = load i32, ptr %8, align 4
  %52 = call i32 @_1_while_simple(i32 noundef %51)
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %7, align 4
  %55 = load i32, ptr %8, align 4
  %56 = call i32 @_2_dowhile_simple(i32 noundef %55)
  %57 = load i32, ptr %7, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, ptr %7, align 4
  %59 = call i32 @_3_for_empty_body(i32 noundef 3)
  %60 = load i32, ptr %7, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, ptr %7, align 4
  %62 = load i32, ptr %8, align 4
  %63 = call i32 @_4_while_true_break(i32 noundef %62)
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %7, align 4
  %66 = load i32, ptr %8, align 4
  %67 = call i32 @_5_for_continue(i32 noundef %66)
  %68 = load i32, ptr %7, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %7, align 4
  br label %70

70:                                               ; preds = %46
  %71 = load i32, ptr %6, align 4
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %76

73:                                               ; preds = %70
  %74 = load i32, ptr %7, align 4
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %74)
  store i32 0, ptr %2, align 4
  br label %507

76:                                               ; preds = %70
  %77 = load i32, ptr %8, align 4
  %78 = load i32, ptr %8, align 4
  %79 = add nsw i32 %78, 6
  %80 = call i32 @_6_relational_loop(i32 noundef %77, i32 noundef %79)
  %81 = load i32, ptr %7, align 4
  %82 = add nsw i32 %81, %80
  store i32 %82, ptr %7, align 4
  %83 = load i32, ptr %8, align 4
  %84 = call i32 @_7_not_equal_loop(i32 noundef %83)
  %85 = load i32, ptr %7, align 4
  %86 = add nsw i32 %85, %84
  store i32 %86, ptr %7, align 4
  %87 = load i32, ptr %8, align 4
  %88 = call i32 @_8_loop_and(i32 noundef %87, i32 noundef 5)
  %89 = load i32, ptr %7, align 4
  %90 = add nsw i32 %89, %88
  store i32 %90, ptr %7, align 4
  %91 = load i32, ptr %8, align 4
  %92 = call i32 @_9_loop_or(i32 noundef %91, i32 noundef 5)
  %93 = load i32, ptr %7, align 4
  %94 = add nsw i32 %93, %92
  store i32 %94, ptr %7, align 4
  %95 = load i32, ptr %8, align 4
  %96 = call i32 @_10_nested_loop_condition(i32 noundef %95, i32 noundef 6, i32 noundef 3, i32 noundef 4)
  %97 = load i32, ptr %7, align 4
  %98 = add nsw i32 %97, %96
  store i32 %98, ptr %7, align 4
  br label %99

99:                                               ; preds = %76
  %100 = load i32, ptr %6, align 4
  %101 = icmp eq i32 %100, 1
  br i1 %101, label %102, label %105

102:                                              ; preds = %99
  %103 = load i32, ptr %7, align 4
  %104 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %103)
  store i32 0, ptr %2, align 4
  br label %507

105:                                              ; preds = %99
  %106 = load i32, ptr %8, align 4
  %107 = call i32 @_11_arithmetic_loop(i32 noundef %106)
  %108 = load i32, ptr %7, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %7, align 4
  %110 = load i32, ptr %8, align 4
  %111 = call i32 @_12_nested_arithmetic_loop(i32 noundef %110)
  %112 = load i32, ptr %7, align 4
  %113 = add nsw i32 %112, %111
  store i32 %113, ptr %7, align 4
  %114 = load i32, ptr %8, align 4
  %115 = call i32 @_13_ternary_loop_body(i32 noundef %114)
  %116 = load i32, ptr %7, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, ptr %7, align 4
  %118 = load i32, ptr %8, align 4
  %119 = call i32 @_14_multiple_accumulators(i32 noundef %118)
  %120 = load i32, ptr %7, align 4
  %121 = add nsw i32 %120, %119
  store i32 %121, ptr %7, align 4
  br label %122

122:                                              ; preds = %105
  %123 = load i32, ptr %6, align 4
  %124 = icmp eq i32 %123, 2
  br i1 %124, label %125, label %128

125:                                              ; preds = %122
  %126 = load i32, ptr %7, align 4
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %126)
  store i32 0, ptr %2, align 4
  br label %507

128:                                              ; preds = %122
  %129 = call i32 @_15_nested_for(i32 noundef 3)
  %130 = load i32, ptr %7, align 4
  %131 = add nsw i32 %130, %129
  store i32 %131, ptr %7, align 4
  %132 = call i32 @_16_for_while(i32 noundef 4)
  %133 = load i32, ptr %7, align 4
  %134 = add nsw i32 %133, %132
  store i32 %134, ptr %7, align 4
  %135 = call i32 @_17_while_dowhile(i32 noundef 3)
  %136 = load i32, ptr %7, align 4
  %137 = add nsw i32 %136, %135
  store i32 %137, ptr %7, align 4
  %138 = call i32 @_18_triple_for(i32 noundef 2)
  %139 = load i32, ptr %7, align 4
  %140 = add nsw i32 %139, %138
  store i32 %140, ptr %7, align 4
  %141 = call i32 @_19_mixed_nested_loops(i32 noundef 3)
  %142 = load i32, ptr %7, align 4
  %143 = add nsw i32 %142, %141
  store i32 %143, ptr %7, align 4
  br label %144

144:                                              ; preds = %128
  %145 = load i32, ptr %6, align 4
  %146 = icmp eq i32 %145, 3
  br i1 %146, label %147, label %150

147:                                              ; preds = %144
  %148 = load i32, ptr %7, align 4
  %149 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %148)
  store i32 0, ptr %2, align 4
  br label %507

150:                                              ; preds = %144
  %151 = call i32 @_20_inner_break(i32 noundef 5)
  %152 = load i32, ptr %7, align 4
  %153 = add nsw i32 %152, %151
  store i32 %153, ptr %7, align 4
  %154 = call i32 @_21_inner_continue(i32 noundef 5)
  %155 = load i32, ptr %7, align 4
  %156 = add nsw i32 %155, %154
  store i32 %156, ptr %7, align 4
  %157 = call i32 @_22_break_with_ternary(i32 noundef 5)
  %158 = load i32, ptr %7, align 4
  %159 = add nsw i32 %158, %157
  store i32 %159, ptr %7, align 4
  %160 = call i32 @_23_continue_and_break(i32 noundef 6)
  %161 = load i32, ptr %7, align 4
  %162 = add nsw i32 %161, %160
  store i32 %162, ptr %7, align 4
  br label %163

163:                                              ; preds = %150
  %164 = load i32, ptr %6, align 4
  %165 = icmp eq i32 %164, 4
  br i1 %165, label %166, label %169

166:                                              ; preds = %163
  %167 = load i32, ptr %7, align 4
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %167)
  store i32 0, ptr %2, align 4
  br label %507

169:                                              ; preds = %163
  %170 = load i32, ptr %8, align 4
  %171 = call i32 @_24_early_return(i32 noundef %170)
  %172 = load i32, ptr %7, align 4
  %173 = add nsw i32 %172, %171
  store i32 %173, ptr %7, align 4
  %174 = load i32, ptr %8, align 4
  %175 = call i32 @_25_nested_early_return(i32 noundef %174)
  %176 = load i32, ptr %7, align 4
  %177 = add nsw i32 %176, %175
  store i32 %177, ptr %7, align 4
  %178 = load i32, ptr %8, align 4
  %179 = call i32 @_26_multiple_returns(i32 noundef %178)
  %180 = load i32, ptr %7, align 4
  %181 = add nsw i32 %180, %179
  store i32 %181, ptr %7, align 4
  %182 = load i32, ptr %8, align 4
  %183 = call i32 @_27_dowhile_return(i32 noundef %182)
  %184 = load i32, ptr %7, align 4
  %185 = add nsw i32 %184, %183
  store i32 %185, ptr %7, align 4
  br label %186

186:                                              ; preds = %169
  %187 = load i32, ptr %6, align 4
  %188 = icmp eq i32 %187, 5
  br i1 %188, label %189, label %192

189:                                              ; preds = %186
  %190 = load i32, ptr %7, align 4
  %191 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %190)
  store i32 0, ptr %2, align 4
  br label %507

192:                                              ; preds = %186
  %193 = call i32 @_28_for_while_for(i32 noundef 3)
  %194 = load i32, ptr %7, align 4
  %195 = add nsw i32 %194, %193
  store i32 %195, ptr %7, align 4
  %196 = call i32 @_29_while_for_dowhile(i32 noundef 3)
  %197 = load i32, ptr %7, align 4
  %198 = add nsw i32 %197, %196
  store i32 %198, ptr %7, align 4
  %199 = call i32 @_30_four_level_nesting(i32 noundef 2)
  %200 = load i32, ptr %7, align 4
  %201 = add nsw i32 %200, %199
  store i32 %201, ptr %7, align 4
  br label %202

202:                                              ; preds = %192
  %203 = load i32, ptr %6, align 4
  %204 = icmp eq i32 %203, 6
  br i1 %204, label %205, label %208

205:                                              ; preds = %202
  %206 = load i32, ptr %7, align 4
  %207 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %206)
  store i32 0, ptr %2, align 4
  br label %507

208:                                              ; preds = %202
  %209 = call i32 @_31_multiple_loop_variables(i32 noundef 6)
  %210 = load i32, ptr %7, align 4
  %211 = add nsw i32 %210, %209
  store i32 %211, ptr %7, align 4
  %212 = load i32, ptr %8, align 4
  %213 = call i32 @_32_complex_update(i32 noundef %212)
  %214 = load i32, ptr %7, align 4
  %215 = add nsw i32 %214, %213
  store i32 %215, ptr %7, align 4
  %216 = call i32 @_33_decreasing_loop(i32 noundef 6)
  %217 = load i32, ptr %7, align 4
  %218 = add nsw i32 %217, %216
  store i32 %218, ptr %7, align 4
  %219 = load i32, ptr %8, align 4
  %220 = call i32 @_34_multiple_condition_values(i32 noundef %219, i32 noundef 6, i32 noundef 4)
  %221 = load i32, ptr %7, align 4
  %222 = add nsw i32 %221, %220
  store i32 %222, ptr %7, align 4
  %223 = load i32, ptr %8, align 4
  %224 = call i32 @_35_computed_loop_limit(i32 noundef %223, i32 noundef 3)
  %225 = load i32, ptr %7, align 4
  %226 = add nsw i32 %225, %224
  store i32 %226, ptr %7, align 4
  br label %227

227:                                              ; preds = %208
  %228 = load i32, ptr %6, align 4
  %229 = icmp eq i32 %228, 7
  br i1 %229, label %230, label %233

230:                                              ; preds = %227
  %231 = load i32, ptr %7, align 4
  %232 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %231)
  store i32 0, ptr %2, align 4
  br label %507

233:                                              ; preds = %227
  %234 = call i32 @_36_array_for(i32 noundef 6)
  %235 = load i32, ptr %7, align 4
  %236 = add nsw i32 %235, %234
  store i32 %236, ptr %7, align 4
  %237 = call i32 @_37_array_while(i32 noundef 6)
  %238 = load i32, ptr %7, align 4
  %239 = add nsw i32 %238, %237
  store i32 %239, ptr %7, align 4
  %240 = call i32 @_38_matrix_nested(i32 noundef 3)
  %241 = load i32, ptr %7, align 4
  %242 = add nsw i32 %241, %240
  store i32 %242, ptr %7, align 4
  %243 = call i32 @_39_array_controlled_loop(i32 noundef 6)
  %244 = load i32, ptr %7, align 4
  %245 = add nsw i32 %244, %243
  store i32 %245, ptr %7, align 4
  br label %246

246:                                              ; preds = %233
  %247 = load i32, ptr %6, align 4
  %248 = icmp eq i32 %247, 8
  br i1 %248, label %249, label %252

249:                                              ; preds = %246
  %250 = load i32, ptr %7, align 4
  %251 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %250)
  store i32 0, ptr %2, align 4
  br label %507

252:                                              ; preds = %246
  store i32 0, ptr @g_arr, align 16
  store i32 1, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 -2, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  store i32 3, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 3), align 4
  store i32 -4, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 4), align 16
  store i32 5, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 5), align 4
  store i32 6, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 6), align 8
  store i32 -7, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %253 = call i32 @_40_array_write_loop(i32 noundef 6)
  %254 = load i32, ptr %7, align 4
  %255 = add nsw i32 %254, %253
  store i32 %255, ptr %7, align 4
  br label %256

256:                                              ; preds = %252
  %257 = load i32, ptr %6, align 4
  %258 = icmp eq i32 %257, 9
  br i1 %258, label %259, label %262

259:                                              ; preds = %256
  %260 = load i32, ptr %7, align 4
  %261 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %260)
  store i32 0, ptr %2, align 4
  br label %507

262:                                              ; preds = %256
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %9, ptr align 16 @__const.main.pointer_data, i64 32, i1 false)
  %263 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %264 = call i32 @_41_pointer_loop(ptr noundef %263, i32 noundef 6)
  %265 = load i32, ptr %7, align 4
  %266 = add nsw i32 %265, %264
  store i32 %266, ptr %7, align 4
  %267 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %268 = call i32 @_42_pointer_increment(ptr noundef %267, i32 noundef 6)
  %269 = load i32, ptr %7, align 4
  %270 = add nsw i32 %269, %268
  store i32 %270, ptr %7, align 4
  %271 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %272 = call i32 @_43_pointer_write_loop(ptr noundef %271, i32 noundef 6)
  %273 = load i32, ptr %7, align 4
  %274 = add nsw i32 %273, %272
  store i32 %274, ptr %7, align 4
  %275 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %276 = call i32 @_44_pointer_array_loop(ptr noundef %275, i32 noundef 6)
  %277 = load i32, ptr %7, align 4
  %278 = add nsw i32 %277, %276
  store i32 %278, ptr %7, align 4
  %279 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %280 = call i32 @_45_pointer_nested_loop(ptr noundef %279, i32 noundef 4)
  %281 = load i32, ptr %7, align 4
  %282 = add nsw i32 %281, %280
  store i32 %282, ptr %7, align 4
  br label %283

283:                                              ; preds = %262
  %284 = load i32, ptr %6, align 4
  %285 = icmp eq i32 %284, 10
  br i1 %285, label %286, label %289

286:                                              ; preds = %283
  %287 = load i32, ptr %7, align 4
  %288 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %287)
  store i32 0, ptr %2, align 4
  br label %507

289:                                              ; preds = %283
  store i32 0, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %290 = call i32 @_46_global_for()
  %291 = load i32, ptr %7, align 4
  %292 = add nsw i32 %291, %290
  store i32 %292, ptr %7, align 4
  %293 = call i32 @_47_global_while()
  %294 = load i32, ptr %7, align 4
  %295 = add nsw i32 %294, %293
  store i32 %295, ptr %7, align 4
  %296 = call i32 @_48_global_array_loop()
  %297 = load i32, ptr %7, align 4
  %298 = add nsw i32 %297, %296
  store i32 %298, ptr %7, align 4
  %299 = call i32 @_49_global_matrix_loop()
  %300 = load i32, ptr %7, align 4
  %301 = add nsw i32 %300, %299
  store i32 %301, ptr %7, align 4
  %302 = load i32, ptr %8, align 4
  store i32 %302, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %303 = call i32 @_50_global_state_loop()
  %304 = load i32, ptr %7, align 4
  %305 = add nsw i32 %304, %303
  store i32 %305, ptr %7, align 4
  store i32 0, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %306 = call i32 @_51_global_nested()
  %307 = load i32, ptr %7, align 4
  %308 = add nsw i32 %307, %306
  store i32 %308, ptr %7, align 4
  br label %309

309:                                              ; preds = %289
  %310 = load i32, ptr %6, align 4
  %311 = icmp eq i32 %310, 11
  br i1 %311, label %312, label %315

312:                                              ; preds = %309
  %313 = load i32, ptr %7, align 4
  %314 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %313)
  store i32 0, ptr %2, align 4
  br label %507

315:                                              ; preds = %309
  %316 = load i32, ptr %8, align 4
  %317 = call i32 @_52_loop_carried_value(i32 noundef %316)
  %318 = load i32, ptr %7, align 4
  %319 = add nsw i32 %318, %317
  store i32 %319, ptr %7, align 4
  %320 = load i32, ptr %8, align 4
  %321 = call i32 @_53_multiple_loop_carried(i32 noundef %320)
  %322 = load i32, ptr %7, align 4
  %323 = add nsw i32 %322, %321
  store i32 %323, ptr %7, align 4
  %324 = load i32, ptr %8, align 4
  %325 = call i32 @_54_nested_loop_carried(i32 noundef %324)
  %326 = load i32, ptr %7, align 4
  %327 = add nsw i32 %326, %325
  store i32 %327, ptr %7, align 4
  %328 = load i32, ptr %8, align 4
  %329 = call i32 @_55_value_after_loop(i32 noundef %328)
  %330 = load i32, ptr %7, align 4
  %331 = add nsw i32 %330, %329
  store i32 %331, ptr %7, align 4
  br label %332

332:                                              ; preds = %315
  %333 = load i32, ptr %6, align 4
  %334 = icmp eq i32 %333, 12
  br i1 %334, label %335, label %338

335:                                              ; preds = %332
  %336 = load i32, ptr %7, align 4
  %337 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %336)
  store i32 0, ptr %2, align 4
  br label %507

338:                                              ; preds = %332
  %339 = load i32, ptr %8, align 4
  %340 = call i32 @_56_prefix_loop(i32 noundef %339, i32 noundef 2, i32 noundef 4)
  %341 = load i32, ptr %7, align 4
  %342 = add nsw i32 %341, %340
  store i32 %342, ptr %7, align 4
  %343 = load i32, ptr %8, align 4
  %344 = call i32 @_57_suffix_loop(i32 noundef %343)
  %345 = load i32, ptr %7, align 4
  %346 = add nsw i32 %345, %344
  store i32 %346, ptr %7, align 4
  %347 = load i32, ptr %8, align 4
  %348 = call i32 @_58_prefix_nested_suffix(i32 noundef %347, i32 noundef 4)
  %349 = load i32, ptr %7, align 4
  %350 = add nsw i32 %349, %348
  store i32 %350, ptr %7, align 4
  br label %351

351:                                              ; preds = %338
  %352 = load i32, ptr %6, align 4
  %353 = icmp eq i32 %352, 13
  br i1 %353, label %354, label %357

354:                                              ; preds = %351
  %355 = load i32, ptr %7, align 4
  %356 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %355)
  store i32 0, ptr %2, align 4
  br label %507

357:                                              ; preds = %351
  %358 = load i32, ptr %8, align 4
  %359 = call i32 @_59_ternary_loop_limit(i32 noundef %358, i32 noundef 5)
  %360 = load i32, ptr %7, align 4
  %361 = add nsw i32 %360, %359
  store i32 %361, ptr %7, align 4
  %362 = call i32 @_60_ternary_loop_update(i32 noundef 6)
  %363 = load i32, ptr %7, align 4
  %364 = add nsw i32 %363, %362
  store i32 %364, ptr %7, align 4
  %365 = call i32 @_61_nested_ternary_loops(i32 noundef 6)
  %366 = load i32, ptr %7, align 4
  %367 = add nsw i32 %366, %365
  store i32 %367, ptr %7, align 4
  br label %368

368:                                              ; preds = %357
  %369 = load i32, ptr %6, align 4
  %370 = icmp eq i32 %369, 14
  br i1 %370, label %371, label %374

371:                                              ; preds = %368
  %372 = load i32, ptr %7, align 4
  %373 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %372)
  store i32 0, ptr %2, align 4
  br label %507

374:                                              ; preds = %368
  %375 = load i32, ptr %8, align 4
  %376 = call i32 @_62_dynamic_alloca(i32 noundef 4, i32 noundef %375)
  %377 = load i32, ptr %7, align 4
  %378 = add nsw i32 %377, %376
  store i32 %378, ptr %7, align 4
  %379 = load i32, ptr %8, align 4
  %380 = call i32 @_63_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %379)
  %381 = load i32, ptr %7, align 4
  %382 = add nsw i32 %381, %380
  store i32 %382, ptr %7, align 4
  %383 = load i32, ptr %8, align 4
  %384 = call i32 @_64_dynamic_alloca_nested(i32 noundef 4, i32 noundef %383)
  %385 = load i32, ptr %7, align 4
  %386 = add nsw i32 %385, %384
  store i32 %386, ptr %7, align 4
  br label %387

387:                                              ; preds = %374
  %388 = load i32, ptr %6, align 4
  %389 = icmp eq i32 %388, 15
  br i1 %389, label %390, label %393

390:                                              ; preds = %387
  %391 = load i32, ptr %7, align 4
  %392 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %391)
  store i32 0, ptr %2, align 4
  br label %507

393:                                              ; preds = %387
  %394 = load i32, ptr %8, align 4
  %395 = call i32 @_65_malloc_loop(i32 noundef 4, i32 noundef %394)
  %396 = load i32, ptr %7, align 4
  %397 = add nsw i32 %396, %395
  store i32 %397, ptr %7, align 4
  %398 = load i32, ptr %8, align 4
  %399 = call i32 @_66_malloc_nested(i32 noundef 4, i32 noundef %398, i32 noundef 3)
  %400 = load i32, ptr %7, align 4
  %401 = add nsw i32 %400, %399
  store i32 %401, ptr %7, align 4
  br label %402

402:                                              ; preds = %393
  %403 = load i32, ptr %6, align 4
  %404 = icmp eq i32 %403, 16
  br i1 %404, label %405, label %408

405:                                              ; preds = %402
  %406 = load i32, ptr %7, align 4
  %407 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %406)
  store i32 0, ptr %2, align 4
  br label %507

408:                                              ; preds = %402
  store i32 0, ptr @g_void_result, align 4
  %409 = load i32, ptr %8, align 4
  call void @_67_void_for(i32 noundef %409)
  %410 = load i32, ptr %8, align 4
  call void @_68_void_while(i32 noundef %410)
  %411 = load i32, ptr %8, align 4
  call void @_69_void_dowhile(i32 noundef %411)
  %412 = load i32, ptr %8, align 4
  call void @_70_void_nested(i32 noundef %412)
  %413 = load i32, ptr %8, align 4
  call void @_71_void_continue(i32 noundef %413)
  store i32 0, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  call void @_72_void_global_only()
  %414 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  call void @_73_void_pointer(ptr noundef %414, i32 noundef 6)
  call void @_74_void_array(i32 noundef 6)
  %415 = load i32, ptr @g_void_result, align 4
  %416 = load i32, ptr %7, align 4
  %417 = add nsw i32 %416, %415
  store i32 %417, ptr %7, align 4
  br label %418

418:                                              ; preds = %408
  %419 = load i32, ptr %6, align 4
  %420 = icmp eq i32 %419, 17
  br i1 %420, label %421, label %424

421:                                              ; preds = %418
  %422 = load i32, ptr %7, align 4
  %423 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %422)
  store i32 0, ptr %2, align 4
  br label %507

424:                                              ; preds = %418
  %425 = load i32, ptr %8, align 4
  %426 = call i32 @_75_loop_return_paths(i32 noundef %425)
  %427 = load i32, ptr %7, align 4
  %428 = add nsw i32 %427, %426
  store i32 %428, ptr %7, align 4
  %429 = load i32, ptr %8, align 4
  %430 = call i32 @_76_nested_return_paths(i32 noundef %429)
  %431 = load i32, ptr %7, align 4
  %432 = add nsw i32 %431, %430
  store i32 %432, ptr %7, align 4
  %433 = load i32, ptr %8, align 4
  %434 = call i32 @_77_loop_final_returns(i32 noundef %433)
  %435 = load i32, ptr %7, align 4
  %436 = add nsw i32 %435, %434
  store i32 %436, ptr %7, align 4
  br label %437

437:                                              ; preds = %424
  %438 = load i32, ptr %6, align 4
  %439 = icmp eq i32 %438, 18
  br i1 %439, label %440, label %443

440:                                              ; preds = %437
  %441 = load i32, ptr %7, align 4
  %442 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %441)
  store i32 0, ptr %2, align 4
  br label %507

443:                                              ; preds = %437
  %444 = load i32, ptr %8, align 4
  %445 = call i32 @_78_state_machine_loop(i32 noundef %444)
  %446 = load i32, ptr %7, align 4
  %447 = add nsw i32 %446, %445
  store i32 %447, ptr %7, align 4
  %448 = load i32, ptr %8, align 4
  %449 = call i32 @_79_multiple_backedge_values(i32 noundef %448)
  %450 = load i32, ptr %7, align 4
  %451 = add nsw i32 %450, %449
  store i32 %451, ptr %7, align 4
  %452 = load i32, ptr %8, align 4
  %453 = call i32 @_80_nested_state(i32 noundef %452)
  %454 = load i32, ptr %7, align 4
  %455 = add nsw i32 %454, %453
  store i32 %455, ptr %7, align 4
  br label %456

456:                                              ; preds = %443
  %457 = load i32, ptr %6, align 4
  %458 = icmp eq i32 %457, 19
  br i1 %458, label %459, label %462

459:                                              ; preds = %456
  %460 = load i32, ptr %7, align 4
  %461 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %460)
  store i32 0, ptr %2, align 4
  br label %507

462:                                              ; preds = %456
  %463 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  store i32 1, ptr %463, align 16
  %464 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 1
  store i32 2, ptr %464, align 4
  %465 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 2
  store i32 3, ptr %465, align 8
  %466 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 3
  store i32 4, ptr %466, align 4
  %467 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 4
  store i32 5, ptr %467, align 16
  %468 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 5
  store i32 6, ptr %468, align 4
  %469 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 6
  store i32 7, ptr %469, align 8
  %470 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 7
  store i32 8, ptr %470, align 4
  %471 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %472 = call i32 @_81_array_pointer_nested(ptr noundef %471, i32 noundef 5)
  %473 = load i32, ptr %7, align 4
  %474 = add nsw i32 %473, %472
  store i32 %474, ptr %7, align 4
  %475 = call i32 @_82_matrix_state(i32 noundef 3)
  %476 = load i32, ptr %7, align 4
  %477 = add nsw i32 %476, %475
  store i32 %477, ptr %7, align 4
  br label %478

478:                                              ; preds = %462
  %479 = load i32, ptr %6, align 4
  %480 = icmp eq i32 %479, 20
  br i1 %480, label %481, label %484

481:                                              ; preds = %478
  %482 = load i32, ptr %7, align 4
  %483 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %482)
  store i32 0, ptr %2, align 4
  br label %507

484:                                              ; preds = %478
  %485 = load i32, ptr %8, align 4
  store i32 %485, ptr %10, align 4
  %486 = load i32, ptr %8, align 4
  %487 = call i32 @_83_complex_loop_control(ptr noundef %10, i32 noundef 5, i32 noundef %486, i32 noundef 3)
  %488 = load i32, ptr %7, align 4
  %489 = add nsw i32 %488, %487
  store i32 %489, ptr %7, align 4
  %490 = load i32, ptr %8, align 4
  %491 = call i32 @_84_complex_loop_state(ptr noundef %10, i32 noundef 6, i32 noundef %490, i32 noundef 3, i32 noundef 5)
  %492 = load i32, ptr %7, align 4
  %493 = add nsw i32 %492, %491
  store i32 %493, ptr %7, align 4
  %494 = load i32, ptr %8, align 4
  %495 = call i32 @_85_loop_stress(ptr noundef %10, i32 noundef 6, i32 noundef %494, i32 noundef 3, i32 noundef 5)
  %496 = load i32, ptr %7, align 4
  %497 = add nsw i32 %496, %495
  store i32 %497, ptr %7, align 4
  br label %498

498:                                              ; preds = %484
  %499 = load i32, ptr %6, align 4
  %500 = icmp eq i32 %499, 21
  br i1 %500, label %501, label %504

501:                                              ; preds = %498
  %502 = load i32, ptr %7, align 4
  %503 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %502)
  store i32 0, ptr %2, align 4
  br label %507

504:                                              ; preds = %498
  %505 = load i32, ptr %7, align 4
  %506 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %505)
  store i32 0, ptr %2, align 4
  br label %507

507:                                              ; preds = %504, %501, %481, %459, %440, %421, %405, %390, %371, %354, %335, %312, %286, %259, %249, %230, %205, %189, %166, %147, %125, %102, %73
  %508 = load i32, ptr %2, align 4
  ret i32 %508
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
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !9}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !9}
!21 = distinct !{!21, !9}
!22 = distinct !{!22, !9}
!23 = distinct !{!23, !9}
!24 = distinct !{!24, !9}
!25 = distinct !{!25, !9}
!26 = distinct !{!26, !9}
!27 = distinct !{!27, !9}
!28 = distinct !{!28, !9}
!29 = distinct !{!29, !9}
!30 = distinct !{!30, !9}
!31 = distinct !{!31, !9}
!32 = distinct !{!32, !9}
!33 = distinct !{!33, !9}
!34 = distinct !{!34, !9}
!35 = distinct !{!35, !9}
!36 = distinct !{!36, !9}
!37 = distinct !{!37, !9}
!38 = distinct !{!38, !9}
!39 = distinct !{!39, !9}
!40 = distinct !{!40, !9}
!41 = distinct !{!41, !9}
!42 = distinct !{!42, !9}
!43 = distinct !{!43, !9}
!44 = distinct !{!44, !9}
!45 = distinct !{!45, !9}
!46 = distinct !{!46, !9}
!47 = distinct !{!47, !9}
!48 = distinct !{!48, !9}
!49 = distinct !{!49, !9}
!50 = distinct !{!50, !9}
!51 = distinct !{!51, !9}
!52 = distinct !{!52, !9}
!53 = distinct !{!53, !9}
!54 = distinct !{!54, !9}
!55 = distinct !{!55, !9}
!56 = distinct !{!56, !9}
!57 = distinct !{!57, !9}
!58 = distinct !{!58, !9}
!59 = distinct !{!59, !9}
!60 = distinct !{!60, !9}
!61 = distinct !{!61, !9}
!62 = distinct !{!62, !9}
!63 = distinct !{!63, !9}
!64 = distinct !{!64, !9}
!65 = distinct !{!65, !9}
!66 = distinct !{!66, !9}
!67 = distinct !{!67, !9}
!68 = distinct !{!68, !9}
!69 = distinct !{!69, !9}
!70 = distinct !{!70, !9}
!71 = distinct !{!71, !9}
!72 = distinct !{!72, !9}
!73 = distinct !{!73, !9}
!74 = distinct !{!74, !9}
!75 = distinct !{!75, !9}
!76 = distinct !{!76, !9}
!77 = distinct !{!77, !9}
!78 = distinct !{!78, !9}
!79 = distinct !{!79, !9}
!80 = distinct !{!80, !9}
!81 = distinct !{!81, !9}
!82 = distinct !{!82, !9}
!83 = distinct !{!83, !9}
!84 = distinct !{!84, !9}
!85 = distinct !{!85, !9}
!86 = distinct !{!86, !9}
!87 = distinct !{!87, !9}
!88 = distinct !{!88, !9}
!89 = distinct !{!89, !9}
!90 = distinct !{!90, !9}
!91 = distinct !{!91, !9}
!92 = distinct !{!92, !9}
!93 = distinct !{!93, !9}
!94 = distinct !{!94, !9}
!95 = distinct !{!95, !9}
!96 = distinct !{!96, !9}
!97 = distinct !{!97, !9}
!98 = distinct !{!98, !9}
!99 = distinct !{!99, !9}
!100 = distinct !{!100, !9}
!101 = distinct !{!101, !9}
!102 = distinct !{!102, !9}
!103 = distinct !{!103, !9}
!104 = distinct !{!104, !9}
!105 = distinct !{!105, !9}
!106 = distinct !{!106, !9}
!107 = distinct !{!107, !9}
!108 = distinct !{!108, !9}
!109 = distinct !{!109, !9}
!110 = distinct !{!110, !9}
!111 = distinct !{!111, !9}
!112 = distinct !{!112, !9}
!113 = distinct !{!113, !9}
!114 = distinct !{!114, !9}
!115 = distinct !{!115, !9}
!116 = distinct !{!116, !9}
!117 = distinct !{!117, !9}
!118 = distinct !{!118, !9}
!119 = distinct !{!119, !9}
!120 = distinct !{!120, !9}
!121 = distinct !{!121, !9}
!122 = distinct !{!122, !9}
!123 = distinct !{!123, !9}
!124 = distinct !{!124, !9}
!125 = distinct !{!125, !9}
!126 = distinct !{!126, !9}
!127 = distinct !{!127, !9}
!128 = distinct !{!128, !9}
!129 = distinct !{!129, !9}
!130 = distinct !{!130, !9}
!131 = distinct !{!131, !9}
!132 = distinct !{!132, !9}
!133 = distinct !{!133, !9}
!134 = distinct !{!134, !9}
