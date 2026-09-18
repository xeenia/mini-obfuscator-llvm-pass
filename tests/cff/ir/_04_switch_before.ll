; ModuleID = '_04_switch.c'
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
define dso_local i32 @_0_switch_simple(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %8 [
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
  ]

5:                                                ; preds = %1
  store i32 10, ptr %3, align 4
  br label %8

6:                                                ; preds = %1
  store i32 20, ptr %3, align 4
  br label %8

7:                                                ; preds = %1
  store i32 30, ptr %3, align 4
  br label %8

8:                                                ; preds = %1, %7, %6, %5
  %9 = load i32, ptr %3, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_1_switch_default(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 100, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %8 [
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
  ]

5:                                                ; preds = %1
  store i32 10, ptr %3, align 4
  br label %9

6:                                                ; preds = %1
  store i32 20, ptr %3, align 4
  br label %9

7:                                                ; preds = %1
  store i32 30, ptr %3, align 4
  br label %9

8:                                                ; preds = %1
  store i32 -1, ptr %3, align 4
  br label %9

9:                                                ; preds = %8, %7, %6, %5
  %10 = load i32, ptr %3, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_2_switch_negative(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %10 [
    i32 -3, label %5
    i32 -2, label %6
    i32 -1, label %7
    i32 0, label %8
    i32 5, label %9
  ]

5:                                                ; preds = %1
  store i32 300, ptr %3, align 4
  br label %11

6:                                                ; preds = %1
  store i32 200, ptr %3, align 4
  br label %11

7:                                                ; preds = %1
  store i32 100, ptr %3, align 4
  br label %11

8:                                                ; preds = %1
  store i32 0, ptr %3, align 4
  br label %11

9:                                                ; preds = %1
  store i32 500, ptr %3, align 4
  br label %11

10:                                               ; preds = %1
  store i32 -999, ptr %3, align 4
  br label %11

11:                                               ; preds = %10, %9, %8, %7, %6, %5
  %12 = load i32, ptr %3, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_3_switch_fallthrough(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %11 [
    i32 1, label %5
    i32 2, label %5
    i32 3, label %8
    i32 4, label %8
    i32 5, label %8
  ]

5:                                                ; preds = %1, %1
  %6 = load i32, ptr %3, align 4
  %7 = add nsw i32 %6, 10
  store i32 %7, ptr %3, align 4
  br label %12

8:                                                ; preds = %1, %1, %1
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 20
  store i32 %10, ptr %3, align 4
  br label %12

11:                                               ; preds = %1
  store i32 -1, ptr %3, align 4
  br label %12

12:                                               ; preds = %11, %8, %5
  %13 = load i32, ptr %3, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_4_switch_fallthrough_steps(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %14 [
    i32 1, label %5
    i32 2, label %8
    i32 3, label %11
  ]

5:                                                ; preds = %1
  %6 = load i32, ptr %3, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, ptr %3, align 4
  br label %8

8:                                                ; preds = %1, %5
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 2
  store i32 %10, ptr %3, align 4
  br label %11

11:                                               ; preds = %1, %8
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 4
  store i32 %13, ptr %3, align 4
  br label %15

14:                                               ; preds = %1
  store i32 -10, ptr %3, align 4
  br label %15

15:                                               ; preds = %14, %11
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_5_switch_before_after(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 5, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = mul nsw i32 %4, 2
  store i32 %5, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %16 [
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
  ]

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %3, align 4
  br label %19

10:                                               ; preds = %1
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 20
  store i32 %12, ptr %3, align 4
  br label %19

13:                                               ; preds = %1
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 30
  store i32 %15, ptr %3, align 4
  br label %19

16:                                               ; preds = %1
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 40
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %16, %13, %10, %7
  %20 = load i32, ptr %3, align 4
  %21 = mul nsw i32 %20, 3
  store i32 %21, ptr %3, align 4
  %22 = load i32, ptr %3, align 4
  %23 = sub nsw i32 %22, 7
  store i32 %23, ptr %3, align 4
  %24 = load i32, ptr %3, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_6_switch_multiple(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %7 [
    i32 1, label %5
    i32 2, label %6
  ]

5:                                                ; preds = %1
  store i32 10, ptr %3, align 4
  br label %8

6:                                                ; preds = %1
  store i32 20, ptr %3, align 4
  br label %8

7:                                                ; preds = %1
  store i32 30, ptr %3, align 4
  br label %8

8:                                                ; preds = %7, %6, %5
  %9 = load i32, ptr %3, align 4
  switch i32 %9, label %16 [
    i32 10, label %10
    i32 20, label %13
  ]

10:                                               ; preds = %8
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 100
  store i32 %12, ptr %3, align 4
  br label %19

13:                                               ; preds = %8
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 200
  store i32 %15, ptr %3, align 4
  br label %19

16:                                               ; preds = %8
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 300
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %16, %13, %10
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_7_switch_two_independent(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %5 = load i32, ptr %2, align 4
  %6 = srem i32 %5, 4
  switch i32 %6, label %10 [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %9
  ]

7:                                                ; preds = %1
  store i32 10, ptr %3, align 4
  br label %11

8:                                                ; preds = %1
  store i32 20, ptr %3, align 4
  br label %11

9:                                                ; preds = %1
  store i32 30, ptr %3, align 4
  br label %11

10:                                               ; preds = %1
  store i32 40, ptr %3, align 4
  br label %11

11:                                               ; preds = %10, %9, %8, %7
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, 1
  %14 = srem i32 %13, 3
  switch i32 %14, label %17 [
    i32 0, label %15
    i32 1, label %16
  ]

15:                                               ; preds = %11
  store i32 100, ptr %4, align 4
  br label %18

16:                                               ; preds = %11
  store i32 200, ptr %4, align 4
  br label %18

17:                                               ; preds = %11
  store i32 300, ptr %4, align 4
  br label %18

18:                                               ; preds = %17, %16, %15
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %19, %20
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_8_switch_expression(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = mul nsw i32 %5, 7
  %7 = add nsw i32 %6, 3
  %8 = srem i32 %7, 5
  store i32 %8, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  switch i32 %9, label %14 [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %12
    i32 3, label %13
  ]

10:                                               ; preds = %1
  store i32 100, ptr %3, align 4
  br label %15

11:                                               ; preds = %1
  store i32 200, ptr %3, align 4
  br label %15

12:                                               ; preds = %1
  store i32 300, ptr %3, align 4
  br label %15

13:                                               ; preds = %1
  store i32 400, ptr %3, align 4
  br label %15

14:                                               ; preds = %1
  store i32 500, ptr %3, align 4
  br label %15

15:                                               ; preds = %14, %13, %12, %11, %10
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %16, %17
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_9_switch_bitwise(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = xor i32 %5, 85
  %7 = and i32 %6, 7
  store i32 %7, ptr %4, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %16 [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %11
    i32 3, label %12
    i32 4, label %13
    i32 5, label %14
    i32 6, label %15
  ]

9:                                                ; preds = %1
  store i32 11, ptr %3, align 4
  br label %17

10:                                               ; preds = %1
  store i32 22, ptr %3, align 4
  br label %17

11:                                               ; preds = %1
  store i32 33, ptr %3, align 4
  br label %17

12:                                               ; preds = %1
  store i32 44, ptr %3, align 4
  br label %17

13:                                               ; preds = %1
  store i32 55, ptr %3, align 4
  br label %17

14:                                               ; preds = %1
  store i32 66, ptr %3, align 4
  br label %17

15:                                               ; preds = %1
  store i32 77, ptr %3, align 4
  br label %17

16:                                               ; preds = %1
  store i32 88, ptr %3, align 4
  br label %17

17:                                               ; preds = %16, %15, %14, %13, %12, %11, %10, %9
  %18 = load i32, ptr %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_switch_array(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [5 x i32], align 16
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const._10_switch_array.values, i64 20, i1 false)
  store i32 0, ptr %4, align 4
  %5 = load i32, ptr %2, align 4
  switch i32 %5, label %21 [
    i32 0, label %6
    i32 1, label %9
    i32 2, label %12
    i32 3, label %15
    i32 4, label %18
  ]

6:                                                ; preds = %1
  %7 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 0
  %8 = load i32, ptr %7, align 16
  store i32 %8, ptr %4, align 4
  br label %22

9:                                                ; preds = %1
  %10 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 1
  %11 = load i32, ptr %10, align 4
  store i32 %11, ptr %4, align 4
  br label %22

12:                                               ; preds = %1
  %13 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %14 = load i32, ptr %13, align 8
  store i32 %14, ptr %4, align 4
  br label %22

15:                                               ; preds = %1
  %16 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %17 = load i32, ptr %16, align 4
  store i32 %17, ptr %4, align 4
  br label %22

18:                                               ; preds = %1
  %19 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 4
  %20 = load i32, ptr %19, align 16
  store i32 %20, ptr %4, align 4
  br label %22

21:                                               ; preds = %1
  store i32 -1, ptr %4, align 4
  br label %22

22:                                               ; preds = %21, %18, %15, %12, %9, %6
  %23 = load i32, ptr %4, align 4
  ret i32 %23
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_switch_pointer(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  store i32 10, ptr %3, align 4
  store i32 20, ptr %4, align 4
  store i32 30, ptr %5, align 4
  store ptr %3, ptr %6, align 8
  %7 = load i32, ptr %2, align 4
  switch i32 %7, label %11 [
    i32 1, label %8
    i32 2, label %9
    i32 3, label %10
  ]

8:                                                ; preds = %1
  store ptr %3, ptr %6, align 8
  br label %12

9:                                                ; preds = %1
  store ptr %4, ptr %6, align 8
  br label %12

10:                                               ; preds = %1
  store ptr %5, ptr %6, align 8
  br label %12

11:                                               ; preds = %1
  store ptr %3, ptr %6, align 8
  br label %12

12:                                               ; preds = %11, %10, %9, %8
  %13 = load ptr, ptr %6, align 8
  %14 = load i32, ptr %13, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_switch_pointer_modify(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [3 x i32], align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 @__const._12_switch_pointer_modify.values, i64 12, i1 false)
  %5 = getelementptr inbounds [3 x i32], ptr %3, i64 0, i64 0
  store ptr %5, ptr %4, align 8
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %25 [
    i32 1, label %7
    i32 2, label %13
    i32 3, label %19
  ]

7:                                                ; preds = %1
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds i32, ptr %8, i64 0
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 100
  store i32 %12, ptr %10, align 4
  br label %27

13:                                               ; preds = %1
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds i32, ptr %14, i64 1
  store ptr %15, ptr %4, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = load i32, ptr %16, align 4
  %18 = add nsw i32 %17, 200
  store i32 %18, ptr %16, align 4
  br label %27

19:                                               ; preds = %1
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds i32, ptr %20, i64 2
  store ptr %21, ptr %4, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %23, 300
  store i32 %24, ptr %22, align 4
  br label %27

25:                                               ; preds = %1
  %26 = load ptr, ptr %4, align 8
  store i32 -1, ptr %26, align 4
  br label %27

27:                                               ; preds = %25, %19, %13, %7
  %28 = getelementptr inbounds [3 x i32], ptr %3, i64 0, i64 0
  %29 = load i32, ptr %28, align 4
  %30 = getelementptr inbounds [3 x i32], ptr %3, i64 0, i64 1
  %31 = load i32, ptr %30, align 4
  %32 = add nsw i32 %29, %31
  %33 = getelementptr inbounds [3 x i32], ptr %3, i64 0, i64 2
  %34 = load i32, ptr %33, align 4
  %35 = add nsw i32 %32, %34
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_switch_nested(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %17 [
    i32 1, label %5
    i32 2, label %11
  ]

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = add nsw i32 %6, 1
  switch i32 %7, label %9 [
    i32 2, label %8
  ]

8:                                                ; preds = %5
  store i32 12, ptr %3, align 4
  br label %10

9:                                                ; preds = %5
  store i32 19, ptr %3, align 4
  br label %10

10:                                               ; preds = %9, %8
  br label %18

11:                                               ; preds = %1
  %12 = load i32, ptr %2, align 4
  %13 = sub nsw i32 %12, 1
  switch i32 %13, label %15 [
    i32 1, label %14
  ]

14:                                               ; preds = %11
  store i32 21, ptr %3, align 4
  br label %16

15:                                               ; preds = %11
  store i32 29, ptr %3, align 4
  br label %16

16:                                               ; preds = %15, %14
  br label %18

17:                                               ; preds = %1
  store i32 -1, ptr %3, align 4
  br label %18

18:                                               ; preds = %17, %16, %10
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_switch_deep_nested(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  %5 = and i32 %4, 3
  switch i32 %5, label %28 [
    i32 0, label %6
    i32 1, label %17
  ]

6:                                                ; preds = %1
  %7 = load i32, ptr %2, align 4
  %8 = and i32 %7, 7
  switch i32 %8, label %15 [
    i32 0, label %9
  ]

9:                                                ; preds = %6
  %10 = load i32, ptr %2, align 4
  %11 = and i32 %10, 15
  switch i32 %11, label %13 [
    i32 0, label %12
  ]

12:                                               ; preds = %9
  store i32 100, ptr %3, align 4
  br label %14

13:                                               ; preds = %9
  store i32 101, ptr %3, align 4
  br label %14

14:                                               ; preds = %13, %12
  br label %16

15:                                               ; preds = %6
  store i32 102, ptr %3, align 4
  br label %16

16:                                               ; preds = %15, %14
  br label %29

17:                                               ; preds = %1
  %18 = load i32, ptr %2, align 4
  %19 = and i32 %18, 7
  switch i32 %19, label %26 [
    i32 1, label %20
  ]

20:                                               ; preds = %17
  %21 = load i32, ptr %2, align 4
  %22 = and i32 %21, 15
  switch i32 %22, label %24 [
    i32 1, label %23
  ]

23:                                               ; preds = %20
  store i32 200, ptr %3, align 4
  br label %25

24:                                               ; preds = %20
  store i32 201, ptr %3, align 4
  br label %25

25:                                               ; preds = %24, %23
  br label %27

26:                                               ; preds = %17
  store i32 202, ptr %3, align 4
  br label %27

27:                                               ; preds = %26, %25
  br label %29

28:                                               ; preds = %1
  store i32 999, ptr %3, align 4
  br label %29

29:                                               ; preds = %28, %27, %16
  %30 = load i32, ptr %3, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_switch_nested_array(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [4 x i32], align 16
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const._15_switch_nested_array.values, i64 16, i1 false)
  store i32 0, ptr %4, align 4
  %5 = load i32, ptr %2, align 4
  %6 = and i32 %5, 1
  switch i32 %6, label %29 [
    i32 0, label %7
    i32 1, label %18
  ]

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4
  %9 = and i32 %8, 3
  switch i32 %9, label %16 [
    i32 0, label %10
    i32 2, label %13
  ]

10:                                               ; preds = %7
  %11 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 0
  %12 = load i32, ptr %11, align 16
  store i32 %12, ptr %4, align 4
  br label %17

13:                                               ; preds = %7
  %14 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 2
  %15 = load i32, ptr %14, align 8
  store i32 %15, ptr %4, align 4
  br label %17

16:                                               ; preds = %7
  store i32 -10, ptr %4, align 4
  br label %17

17:                                               ; preds = %16, %13, %10
  br label %29

18:                                               ; preds = %1
  %19 = load i32, ptr %2, align 4
  %20 = and i32 %19, 3
  switch i32 %20, label %27 [
    i32 1, label %21
    i32 3, label %24
  ]

21:                                               ; preds = %18
  %22 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 1
  %23 = load i32, ptr %22, align 4
  store i32 %23, ptr %4, align 4
  br label %28

24:                                               ; preds = %18
  %25 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 3
  %26 = load i32, ptr %25, align 4
  store i32 %26, ptr %4, align 4
  br label %28

27:                                               ; preds = %18
  store i32 -20, ptr %4, align 4
  br label %28

28:                                               ; preds = %27, %24, %21
  br label %29

29:                                               ; preds = %1, %28, %17
  %30 = load i32, ptr %4, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_switch_nested_pointer(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  store i32 10, ptr %3, align 4
  store i32 20, ptr %4, align 4
  store i32 30, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store ptr %3, ptr %7, align 8
  %8 = load i32, ptr %2, align 4
  %9 = srem i32 %8, 3
  switch i32 %9, label %18 [
    i32 0, label %10
    i32 1, label %17
  ]

10:                                               ; preds = %1
  %11 = load i32, ptr %2, align 4
  %12 = and i32 %11, 1
  switch i32 %12, label %15 [
    i32 0, label %13
    i32 1, label %14
  ]

13:                                               ; preds = %10
  store ptr %3, ptr %7, align 8
  br label %16

14:                                               ; preds = %10
  store ptr %4, ptr %7, align 8
  br label %16

15:                                               ; preds = %10
  store ptr %5, ptr %7, align 8
  br label %16

16:                                               ; preds = %15, %14, %13
  br label %19

17:                                               ; preds = %1
  store ptr %4, ptr %7, align 8
  br label %19

18:                                               ; preds = %1
  store ptr %5, ptr %7, align 8
  br label %19

19:                                               ; preds = %18, %17, %16
  %20 = load ptr, ptr %7, align 8
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %21, %22
  store i32 %23, ptr %6, align 4
  %24 = load i32, ptr %6, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_switch_goto(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %8 [
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
  ]

5:                                                ; preds = %1
  br label %9

6:                                                ; preds = %1
  br label %10

7:                                                ; preds = %1
  br label %11

8:                                                ; preds = %1
  br label %12

9:                                                ; preds = %5
  store i32 100, ptr %3, align 4
  br label %13

10:                                               ; preds = %6
  store i32 200, ptr %3, align 4
  br label %13

11:                                               ; preds = %7
  store i32 300, ptr %3, align 4
  br label %13

12:                                               ; preds = %8
  store i32 -100, ptr %3, align 4
  br label %13

13:                                               ; preds = %12, %11, %10, %9
  %14 = load i32, ptr %3, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_switch_multiple_goto(i32 noundef %0) #0 {
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
  br label %10

7:                                                ; preds = %1
  br label %13

8:                                                ; preds = %1
  br label %16

9:                                                ; preds = %1
  br label %19

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %3, align 4
  br label %22

13:                                               ; preds = %7
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 20
  store i32 %15, ptr %3, align 4
  br label %22

16:                                               ; preds = %8
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 30
  store i32 %18, ptr %3, align 4
  br label %22

19:                                               ; preds = %9
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 40
  store i32 %21, ptr %3, align 4
  br label %22

22:                                               ; preds = %19, %16, %13, %10
  %23 = load i32, ptr %3, align 4
  %24 = sdiv i32 %23, 10
  switch i32 %24, label %34 [
    i32 1, label %25
    i32 2, label %28
    i32 3, label %31
  ]

25:                                               ; preds = %22
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, 100
  store i32 %27, ptr %3, align 4
  br label %37

28:                                               ; preds = %22
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, 200
  store i32 %30, ptr %3, align 4
  br label %37

31:                                               ; preds = %22
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, 300
  store i32 %33, ptr %3, align 4
  br label %37

34:                                               ; preds = %22
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, 400
  store i32 %36, ptr %3, align 4
  br label %37

37:                                               ; preds = %34, %31, %28, %25
  %38 = load i32, ptr %3, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_switch_nested_goto(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  %5 = and i32 %4, 1
  switch i32 %5, label %18 [
    i32 0, label %6
    i32 1, label %12
  ]

6:                                                ; preds = %1
  %7 = load i32, ptr %2, align 4
  %8 = and i32 %7, 3
  switch i32 %8, label %11 [
    i32 0, label %9
    i32 2, label %10
  ]

9:                                                ; preds = %6
  br label %19

10:                                               ; preds = %6
  br label %21

11:                                               ; preds = %6
  br label %23

12:                                               ; preds = %1
  %13 = load i32, ptr %2, align 4
  %14 = and i32 %13, 3
  switch i32 %14, label %17 [
    i32 1, label %15
    i32 3, label %16
  ]

15:                                               ; preds = %12
  br label %20

16:                                               ; preds = %12
  br label %22

17:                                               ; preds = %12
  br label %23

18:                                               ; preds = %1
  br label %19

19:                                               ; preds = %18, %9
  store i32 100, ptr %3, align 4
  br label %24

20:                                               ; preds = %15
  store i32 200, ptr %3, align 4
  br label %24

21:                                               ; preds = %10
  store i32 300, ptr %3, align 4
  br label %24

22:                                               ; preds = %16
  store i32 400, ptr %3, align 4
  br label %24

23:                                               ; preds = %17, %11
  store i32 -1, ptr %3, align 4
  br label %24

24:                                               ; preds = %23, %22, %21, %20, %19
  %25 = load i32, ptr %3, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_switch_precomputed(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %8 = load i32, ptr %2, align 4
  %9 = mul nsw i32 %8, 3
  store i32 %9, ptr %3, align 4
  %10 = load i32, ptr %3, align 4
  %11 = xor i32 %10, 85
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, 17
  store i32 %13, ptr %5, align 4
  %14 = load i32, ptr %5, align 4
  %15 = and i32 %14, 7
  store i32 %15, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %16 = load i32, ptr %6, align 4
  switch i32 %16, label %42 [
    i32 0, label %17
    i32 1, label %21
    i32 2, label %25
    i32 3, label %29
    i32 4, label %32
    i32 5, label %35
    i32 6, label %38
  ]

17:                                               ; preds = %1
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %7, align 4
  br label %46

21:                                               ; preds = %1
  %22 = load i32, ptr %4, align 4
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %7, align 4
  br label %46

25:                                               ; preds = %1
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %5, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, ptr %7, align 4
  br label %46

29:                                               ; preds = %1
  %30 = load i32, ptr %3, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %7, align 4
  br label %46

32:                                               ; preds = %1
  %33 = load i32, ptr %4, align 4
  %34 = mul nsw i32 %33, 2
  store i32 %34, ptr %7, align 4
  br label %46

35:                                               ; preds = %1
  %36 = load i32, ptr %5, align 4
  %37 = mul nsw i32 %36, 2
  store i32 %37, ptr %7, align 4
  br label %46

38:                                               ; preds = %1
  %39 = load i32, ptr %3, align 4
  %40 = load i32, ptr %5, align 4
  %41 = xor i32 %39, %40
  store i32 %41, ptr %7, align 4
  br label %46

42:                                               ; preds = %1
  %43 = load i32, ptr %4, align 4
  %44 = load i32, ptr %5, align 4
  %45 = xor i32 %43, %44
  store i32 %45, ptr %7, align 4
  br label %46

46:                                               ; preds = %42, %38, %35, %32, %29, %25, %21, %17
  %47 = load i32, ptr %7, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_switch_complex_data(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [8 x i32], align 16
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const._21_switch_complex_data.values, i64 32, i1 false)
  %7 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 0
  store ptr %7, ptr %4, align 8
  store i32 0, ptr %5, align 4
  %8 = load i32, ptr %2, align 4
  %9 = mul nsw i32 %8, 5
  %10 = add nsw i32 %9, 7
  %11 = and i32 %10, 7
  store i32 %11, ptr %6, align 4
  %12 = load i32, ptr %6, align 4
  %13 = and i32 %12, 3
  switch i32 %13, label %41 [
    i32 0, label %14
    i32 1, label %23
    i32 2, label %32
  ]

14:                                               ; preds = %1
  %15 = load i32, ptr %6, align 4
  switch i32 %15, label %20 [
    i32 0, label %16
    i32 4, label %18
  ]

16:                                               ; preds = %14
  %17 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 0
  store ptr %17, ptr %4, align 8
  br label %22

18:                                               ; preds = %14
  %19 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 4
  store ptr %19, ptr %4, align 8
  br label %22

20:                                               ; preds = %14
  %21 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 1
  store ptr %21, ptr %4, align 8
  br label %22

22:                                               ; preds = %20, %18, %16
  br label %50

23:                                               ; preds = %1
  %24 = load i32, ptr %6, align 4
  switch i32 %24, label %29 [
    i32 1, label %25
    i32 5, label %27
  ]

25:                                               ; preds = %23
  %26 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 1
  store ptr %26, ptr %4, align 8
  br label %31

27:                                               ; preds = %23
  %28 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 5
  store ptr %28, ptr %4, align 8
  br label %31

29:                                               ; preds = %23
  %30 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 2
  store ptr %30, ptr %4, align 8
  br label %31

31:                                               ; preds = %29, %27, %25
  br label %50

32:                                               ; preds = %1
  %33 = load i32, ptr %6, align 4
  switch i32 %33, label %38 [
    i32 2, label %34
    i32 6, label %36
  ]

34:                                               ; preds = %32
  %35 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 2
  store ptr %35, ptr %4, align 8
  br label %40

36:                                               ; preds = %32
  %37 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 6
  store ptr %37, ptr %4, align 8
  br label %40

38:                                               ; preds = %32
  %39 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 3
  store ptr %39, ptr %4, align 8
  br label %40

40:                                               ; preds = %38, %36, %34
  br label %50

41:                                               ; preds = %1
  %42 = load i32, ptr %6, align 4
  switch i32 %42, label %47 [
    i32 3, label %43
    i32 7, label %45
  ]

43:                                               ; preds = %41
  %44 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 3
  store ptr %44, ptr %4, align 8
  br label %49

45:                                               ; preds = %41
  %46 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 7
  store ptr %46, ptr %4, align 8
  br label %49

47:                                               ; preds = %41
  %48 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 0
  store ptr %48, ptr %4, align 8
  br label %49

49:                                               ; preds = %47, %45, %43
  br label %50

50:                                               ; preds = %49, %40, %31, %22
  %51 = load ptr, ptr %4, align 8
  %52 = load i32, ptr %51, align 4
  store i32 %52, ptr %5, align 4
  %53 = load i32, ptr %2, align 4
  %54 = load i32, ptr %5, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %5, align 4
  %56 = load i32, ptr %5, align 4
  ret i32 %56
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_switch_case_blocks(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %7 = load i32, ptr %2, align 4
  %8 = add nsw i32 %7, 10
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %11 = load i32, ptr %2, align 4
  %12 = and i32 %11, 3
  switch i32 %12, label %40 [
    i32 0, label %13
    i32 1, label %22
    i32 2, label %31
  ]

13:                                               ; preds = %1
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %5, align 4
  %17 = load i32, ptr %5, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %5, align 4
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %2, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %6, align 4
  br label %49

22:                                               ; preds = %1
  %23 = load i32, ptr %3, align 4
  %24 = load i32, ptr %4, align 4
  %25 = sub nsw i32 %23, %24
  store i32 %25, ptr %5, align 4
  %26 = load i32, ptr %5, align 4
  %27 = mul nsw i32 %26, 3
  store i32 %27, ptr %5, align 4
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %2, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr %6, align 4
  br label %49

31:                                               ; preds = %1
  %32 = load i32, ptr %3, align 4
  %33 = load i32, ptr %4, align 4
  %34 = mul nsw i32 %32, %33
  store i32 %34, ptr %5, align 4
  %35 = load i32, ptr %5, align 4
  %36 = sub nsw i32 %35, 7
  store i32 %36, ptr %5, align 4
  %37 = load i32, ptr %5, align 4
  %38 = load i32, ptr %2, align 4
  %39 = xor i32 %37, %38
  store i32 %39, ptr %6, align 4
  br label %49

40:                                               ; preds = %1
  %41 = load i32, ptr %3, align 4
  %42 = load i32, ptr %4, align 4
  %43 = xor i32 %41, %42
  store i32 %43, ptr %5, align 4
  %44 = load i32, ptr %5, align 4
  %45 = add nsw i32 %44, 100
  store i32 %45, ptr %5, align 4
  %46 = load i32, ptr %5, align 4
  %47 = load i32, ptr %2, align 4
  %48 = add nsw i32 %46, %47
  store i32 %48, ptr %6, align 4
  br label %49

49:                                               ; preds = %40, %31, %22, %13
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, 17
  store i32 %51, ptr %6, align 4
  %52 = load i32, ptr %6, align 4
  ret i32 %52
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_switch_nested_fallthrough(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  %5 = and i32 %4, 1
  switch i32 %5, label %28 [
    i32 0, label %6
    i32 1, label %17
  ]

6:                                                ; preds = %1
  %7 = load i32, ptr %2, align 4
  %8 = and i32 %7, 3
  switch i32 %8, label %15 [
    i32 0, label %9
    i32 2, label %12
  ]

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %3, align 4
  br label %12

12:                                               ; preds = %6, %9
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 20
  store i32 %14, ptr %3, align 4
  br label %16

15:                                               ; preds = %6
  store i32 -10, ptr %3, align 4
  br label %16

16:                                               ; preds = %15, %12
  br label %28

17:                                               ; preds = %1
  %18 = load i32, ptr %2, align 4
  %19 = and i32 %18, 3
  switch i32 %19, label %26 [
    i32 1, label %20
    i32 3, label %23
  ]

20:                                               ; preds = %17
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 30
  store i32 %22, ptr %3, align 4
  br label %23

23:                                               ; preds = %17, %20
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 40
  store i32 %25, ptr %3, align 4
  br label %27

26:                                               ; preds = %17
  store i32 -20, ptr %3, align 4
  br label %27

27:                                               ; preds = %26, %23
  br label %28

28:                                               ; preds = %1, %27, %16
  %29 = load i32, ptr %3, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_switch_large(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %19 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %10
    i32 6, label %11
    i32 7, label %12
    i32 8, label %13
    i32 9, label %14
    i32 10, label %15
    i32 20, label %16
    i32 50, label %17
    i32 100, label %18
  ]

5:                                                ; preds = %1
  store i32 100, ptr %3, align 4
  br label %20

6:                                                ; preds = %1
  store i32 101, ptr %3, align 4
  br label %20

7:                                                ; preds = %1
  store i32 102, ptr %3, align 4
  br label %20

8:                                                ; preds = %1
  store i32 103, ptr %3, align 4
  br label %20

9:                                                ; preds = %1
  store i32 104, ptr %3, align 4
  br label %20

10:                                               ; preds = %1
  store i32 105, ptr %3, align 4
  br label %20

11:                                               ; preds = %1
  store i32 106, ptr %3, align 4
  br label %20

12:                                               ; preds = %1
  store i32 107, ptr %3, align 4
  br label %20

13:                                               ; preds = %1
  store i32 108, ptr %3, align 4
  br label %20

14:                                               ; preds = %1
  store i32 109, ptr %3, align 4
  br label %20

15:                                               ; preds = %1
  store i32 110, ptr %3, align 4
  br label %20

16:                                               ; preds = %1
  store i32 120, ptr %3, align 4
  br label %20

17:                                               ; preds = %1
  store i32 150, ptr %3, align 4
  br label %20

18:                                               ; preds = %1
  store i32 200, ptr %3, align 4
  br label %20

19:                                               ; preds = %1
  store i32 -1, ptr %3, align 4
  br label %20

20:                                               ; preds = %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_switch_sparse(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %13 [
    i32 -1000, label %5
    i32 -17, label %6
    i32 -1, label %7
    i32 0, label %8
    i32 7, label %9
    i32 42, label %10
    i32 1337, label %11
    i32 65535, label %12
  ]

5:                                                ; preds = %1
  store i32 1, ptr %3, align 4
  br label %14

6:                                                ; preds = %1
  store i32 2, ptr %3, align 4
  br label %14

7:                                                ; preds = %1
  store i32 3, ptr %3, align 4
  br label %14

8:                                                ; preds = %1
  store i32 4, ptr %3, align 4
  br label %14

9:                                                ; preds = %1
  store i32 5, ptr %3, align 4
  br label %14

10:                                               ; preds = %1
  store i32 6, ptr %3, align 4
  br label %14

11:                                               ; preds = %1
  store i32 7, ptr %3, align 4
  br label %14

12:                                               ; preds = %1
  store i32 8, ptr %3, align 4
  br label %14

13:                                               ; preds = %1
  store i32 999, ptr %3, align 4
  br label %14

14:                                               ; preds = %13, %12, %11, %10, %9, %8, %7, %6, %5
  %15 = load i32, ptr %3, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_switch_very_nested(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %7 = load i32, ptr %2, align 4
  %8 = xor i32 %7, 4660
  %9 = and i32 %8, 15
  store i32 %9, ptr %3, align 4
  %10 = load i32, ptr %2, align 4
  %11 = mul nsw i32 %10, 3
  %12 = add nsw i32 %11, 7
  %13 = and i32 %12, 7
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = xor i32 %14, %15
  %17 = and i32 %16, 3
  store i32 %17, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %18 = load i32, ptr %3, align 4
  %19 = and i32 %18, 3
  switch i32 %19, label %51 [
    i32 0, label %20
    i32 1, label %32
    i32 2, label %45
  ]

20:                                               ; preds = %1
  %21 = load i32, ptr %4, align 4
  %22 = and i32 %21, 3
  switch i32 %22, label %30 [
    i32 0, label %23
    i32 1, label %29
  ]

23:                                               ; preds = %20
  %24 = load i32, ptr %5, align 4
  switch i32 %24, label %27 [
    i32 0, label %25
    i32 1, label %26
  ]

25:                                               ; preds = %23
  store i32 1000, ptr %6, align 4
  br label %28

26:                                               ; preds = %23
  store i32 1001, ptr %6, align 4
  br label %28

27:                                               ; preds = %23
  store i32 1002, ptr %6, align 4
  br label %28

28:                                               ; preds = %27, %26, %25
  br label %31

29:                                               ; preds = %20
  store i32 1010, ptr %6, align 4
  br label %31

30:                                               ; preds = %20
  store i32 1020, ptr %6, align 4
  br label %31

31:                                               ; preds = %30, %29, %28
  br label %52

32:                                               ; preds = %1
  %33 = load i32, ptr %4, align 4
  %34 = and i32 %33, 3
  switch i32 %34, label %43 [
    i32 0, label %35
    i32 1, label %36
  ]

35:                                               ; preds = %32
  store i32 1100, ptr %6, align 4
  br label %44

36:                                               ; preds = %32
  %37 = load i32, ptr %5, align 4
  switch i32 %37, label %41 [
    i32 0, label %38
    i32 1, label %39
    i32 2, label %40
  ]

38:                                               ; preds = %36
  store i32 1110, ptr %6, align 4
  br label %42

39:                                               ; preds = %36
  store i32 1111, ptr %6, align 4
  br label %42

40:                                               ; preds = %36
  store i32 1112, ptr %6, align 4
  br label %42

41:                                               ; preds = %36
  store i32 1113, ptr %6, align 4
  br label %42

42:                                               ; preds = %41, %40, %39, %38
  br label %44

43:                                               ; preds = %32
  store i32 1120, ptr %6, align 4
  br label %44

44:                                               ; preds = %43, %42, %35
  br label %52

45:                                               ; preds = %1
  %46 = load i32, ptr %5, align 4
  switch i32 %46, label %49 [
    i32 0, label %47
    i32 1, label %48
  ]

47:                                               ; preds = %45
  store i32 1200, ptr %6, align 4
  br label %50

48:                                               ; preds = %45
  store i32 1201, ptr %6, align 4
  br label %50

49:                                               ; preds = %45
  store i32 1299, ptr %6, align 4
  br label %50

50:                                               ; preds = %49, %48, %47
  br label %52

51:                                               ; preds = %1
  store i32 1300, ptr %6, align 4
  br label %52

52:                                               ; preds = %51, %50, %44, %31
  %53 = load i32, ptr %6, align 4
  %54 = load i32, ptr %2, align 4
  %55 = add nsw i32 %53, %54
  ret i32 %55
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_switch_goto_nested_array(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [4 x i32], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const._27_switch_goto_nested_array.values, i64 16, i1 false)
  store i32 0, ptr %4, align 4
  %6 = load i32, ptr %2, align 4
  %7 = and i32 %6, 3
  store i32 %7, ptr %5, align 4
  %8 = load i32, ptr %5, align 4
  switch i32 %8, label %12 [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %11
  ]

9:                                                ; preds = %1
  br label %13

10:                                               ; preds = %1
  br label %24

11:                                               ; preds = %1
  br label %35

12:                                               ; preds = %1
  br label %46

13:                                               ; preds = %9
  %14 = load i32, ptr %2, align 4
  %15 = and i32 %14, 7
  switch i32 %15, label %22 [
    i32 0, label %16
    i32 4, label %19
  ]

16:                                               ; preds = %13
  %17 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 0
  %18 = load i32, ptr %17, align 16
  store i32 %18, ptr %4, align 4
  br label %23

19:                                               ; preds = %13
  %20 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 1
  %21 = load i32, ptr %20, align 4
  store i32 %21, ptr %4, align 4
  br label %23

22:                                               ; preds = %13
  store i32 -1, ptr %4, align 4
  br label %23

23:                                               ; preds = %22, %19, %16
  br label %60

24:                                               ; preds = %10
  %25 = load i32, ptr %2, align 4
  %26 = and i32 %25, 7
  switch i32 %26, label %33 [
    i32 1, label %27
    i32 5, label %30
  ]

27:                                               ; preds = %24
  %28 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 1
  %29 = load i32, ptr %28, align 4
  store i32 %29, ptr %4, align 4
  br label %34

30:                                               ; preds = %24
  %31 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 2
  %32 = load i32, ptr %31, align 8
  store i32 %32, ptr %4, align 4
  br label %34

33:                                               ; preds = %24
  store i32 -2, ptr %4, align 4
  br label %34

34:                                               ; preds = %33, %30, %27
  br label %60

35:                                               ; preds = %11
  %36 = load i32, ptr %2, align 4
  %37 = and i32 %36, 7
  switch i32 %37, label %44 [
    i32 2, label %38
    i32 6, label %41
  ]

38:                                               ; preds = %35
  %39 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 2
  %40 = load i32, ptr %39, align 8
  store i32 %40, ptr %4, align 4
  br label %45

41:                                               ; preds = %35
  %42 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 3
  %43 = load i32, ptr %42, align 4
  store i32 %43, ptr %4, align 4
  br label %45

44:                                               ; preds = %35
  store i32 -3, ptr %4, align 4
  br label %45

45:                                               ; preds = %44, %41, %38
  br label %60

46:                                               ; preds = %12
  %47 = load i32, ptr %2, align 4
  %48 = and i32 %47, 7
  switch i32 %48, label %58 [
    i32 3, label %49
    i32 7, label %52
  ]

49:                                               ; preds = %46
  %50 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 3
  %51 = load i32, ptr %50, align 4
  store i32 %51, ptr %4, align 4
  br label %59

52:                                               ; preds = %46
  %53 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 0
  %54 = load i32, ptr %53, align 16
  %55 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 3
  %56 = load i32, ptr %55, align 4
  %57 = add nsw i32 %54, %56
  store i32 %57, ptr %4, align 4
  br label %59

58:                                               ; preds = %46
  store i32 -4, ptr %4, align 4
  br label %59

59:                                               ; preds = %58, %52, %49
  br label %60

60:                                               ; preds = %59, %45, %34, %23
  %61 = load i32, ptr %4, align 4
  ret i32 %61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_switch_pointer_to_pointer(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  store i32 10, ptr %3, align 4
  store i32 20, ptr %4, align 4
  store i32 30, ptr %5, align 4
  store ptr %3, ptr %6, align 8
  store ptr %4, ptr %7, align 8
  store ptr %5, ptr %8, align 8
  store ptr %6, ptr %9, align 8
  %10 = load i32, ptr %2, align 4
  %11 = srem i32 %10, 3
  switch i32 %11, label %14 [
    i32 0, label %12
    i32 1, label %13
  ]

12:                                               ; preds = %1
  store ptr %6, ptr %9, align 8
  br label %15

13:                                               ; preds = %1
  store ptr %7, ptr %9, align 8
  br label %15

14:                                               ; preds = %1
  store ptr %8, ptr %9, align 8
  br label %15

15:                                               ; preds = %14, %13, %12
  %16 = load ptr, ptr %9, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %18, %19
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_switch_combined(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [8 x i32], align 16
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const._29_switch_combined.values, i64 32, i1 false)
  %8 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 0
  store ptr %8, ptr %4, align 8
  store i32 0, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = xor i32 %9, 170
  %11 = and i32 %10, 7
  store i32 %11, ptr %6, align 4
  %12 = load i32, ptr %2, align 4
  %13 = mul nsw i32 %12, 7
  %14 = add nsw i32 %13, 3
  %15 = and i32 %14, 3
  store i32 %15, ptr %7, align 4
  %16 = load i32, ptr %6, align 4
  switch i32 %16, label %31 [
    i32 0, label %17
    i32 1, label %19
    i32 2, label %21
    i32 3, label %23
    i32 4, label %25
    i32 5, label %27
    i32 6, label %29
  ]

17:                                               ; preds = %1
  %18 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 0
  store ptr %18, ptr %4, align 8
  br label %33

19:                                               ; preds = %1
  %20 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 1
  store ptr %20, ptr %4, align 8
  br label %33

21:                                               ; preds = %1
  %22 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 2
  store ptr %22, ptr %4, align 8
  br label %33

23:                                               ; preds = %1
  %24 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 3
  store ptr %24, ptr %4, align 8
  br label %33

25:                                               ; preds = %1
  %26 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 4
  store ptr %26, ptr %4, align 8
  br label %33

27:                                               ; preds = %1
  %28 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 5
  store ptr %28, ptr %4, align 8
  br label %33

29:                                               ; preds = %1
  %30 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 6
  store ptr %30, ptr %4, align 8
  br label %33

31:                                               ; preds = %1
  %32 = getelementptr inbounds [8 x i32], ptr %3, i64 0, i64 7
  store ptr %32, ptr %4, align 8
  br label %33

33:                                               ; preds = %31, %29, %27, %25, %23, %21, %19, %17
  %34 = load i32, ptr %7, align 4
  switch i32 %34, label %64 [
    i32 0, label %35
    i32 1, label %56
    i32 2, label %60
  ]

35:                                               ; preds = %33
  %36 = load ptr, ptr %4, align 8
  %37 = load i32, ptr %36, align 4
  %38 = and i32 %37, 3
  switch i32 %38, label %51 [
    i32 0, label %39
    i32 1, label %43
    i32 2, label %47
  ]

39:                                               ; preds = %35
  %40 = load ptr, ptr %4, align 8
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %41, 100
  store i32 %42, ptr %5, align 4
  br label %55

43:                                               ; preds = %35
  %44 = load ptr, ptr %4, align 8
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %45, 200
  store i32 %46, ptr %5, align 4
  br label %55

47:                                               ; preds = %35
  %48 = load ptr, ptr %4, align 8
  %49 = load i32, ptr %48, align 4
  %50 = add nsw i32 %49, 300
  store i32 %50, ptr %5, align 4
  br label %55

51:                                               ; preds = %35
  %52 = load ptr, ptr %4, align 8
  %53 = load i32, ptr %52, align 4
  %54 = add nsw i32 %53, 400
  store i32 %54, ptr %5, align 4
  br label %55

55:                                               ; preds = %51, %47, %43, %39
  br label %68

56:                                               ; preds = %33
  %57 = load ptr, ptr %4, align 8
  %58 = load i32, ptr %57, align 4
  %59 = mul nsw i32 %58, 2
  store i32 %59, ptr %5, align 4
  br label %68

60:                                               ; preds = %33
  %61 = load ptr, ptr %4, align 8
  %62 = load i32, ptr %61, align 4
  %63 = mul nsw i32 %62, 3
  store i32 %63, ptr %5, align 4
  br label %68

64:                                               ; preds = %33
  %65 = load ptr, ptr %4, align 8
  %66 = load i32, ptr %65, align 4
  %67 = mul nsw i32 %66, 4
  store i32 %67, ptr %5, align 4
  br label %68

68:                                               ; preds = %64, %60, %56, %55
  %69 = load i32, ptr %5, align 4
  %70 = load i32, ptr %2, align 4
  %71 = add nsw i32 %69, %70
  ret i32 %71
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 4, ptr %6, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %10 [
    i32 1, label %9
  ]

9:                                                ; preds = %2
  store i32 4, ptr %6, align 4
  br label %15

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds ptr, ptr %11, i64 1
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 @atoi(ptr noundef %13) #4
  store i32 %14, ptr %6, align 4
  br label %15

15:                                               ; preds = %10, %9
  store i32 0, ptr %7, align 4
  %16 = load i32, ptr %6, align 4
  %17 = call i32 @_0_switch_simple(i32 noundef %16)
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %7, align 4
  %20 = load i32, ptr %6, align 4
  %21 = call i32 @_1_switch_default(i32 noundef %20)
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %6, align 4
  %25 = call i32 @_2_switch_negative(i32 noundef %24)
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %7, align 4
  %28 = load i32, ptr %6, align 4
  %29 = call i32 @_3_switch_fallthrough(i32 noundef %28)
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %7, align 4
  %32 = load i32, ptr %6, align 4
  %33 = call i32 @_4_switch_fallthrough_steps(i32 noundef %32)
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %7, align 4
  %36 = load i32, ptr %6, align 4
  %37 = call i32 @_5_switch_before_after(i32 noundef %36)
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %7, align 4
  %40 = load i32, ptr %6, align 4
  %41 = call i32 @_6_switch_multiple(i32 noundef %40)
  %42 = load i32, ptr %7, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %7, align 4
  %44 = load i32, ptr %6, align 4
  %45 = call i32 @_7_switch_two_independent(i32 noundef %44)
  %46 = load i32, ptr %7, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %7, align 4
  %48 = load i32, ptr %6, align 4
  %49 = call i32 @_8_switch_expression(i32 noundef %48)
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %7, align 4
  %52 = load i32, ptr %6, align 4
  %53 = call i32 @_9_switch_bitwise(i32 noundef %52)
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %7, align 4
  %56 = load i32, ptr %6, align 4
  %57 = call i32 @_10_switch_array(i32 noundef %56)
  %58 = load i32, ptr %7, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %7, align 4
  %60 = load i32, ptr %6, align 4
  %61 = call i32 @_11_switch_pointer(i32 noundef %60)
  %62 = load i32, ptr %7, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %7, align 4
  %64 = load i32, ptr %6, align 4
  %65 = call i32 @_12_switch_pointer_modify(i32 noundef %64)
  %66 = load i32, ptr %7, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %7, align 4
  %68 = load i32, ptr %6, align 4
  %69 = call i32 @_13_switch_nested(i32 noundef %68)
  %70 = load i32, ptr %7, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, ptr %7, align 4
  %72 = load i32, ptr %6, align 4
  %73 = call i32 @_14_switch_deep_nested(i32 noundef %72)
  %74 = load i32, ptr %7, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %7, align 4
  %76 = load i32, ptr %6, align 4
  %77 = call i32 @_15_switch_nested_array(i32 noundef %76)
  %78 = load i32, ptr %7, align 4
  %79 = add nsw i32 %78, %77
  store i32 %79, ptr %7, align 4
  %80 = load i32, ptr %6, align 4
  %81 = call i32 @_16_switch_nested_pointer(i32 noundef %80)
  %82 = load i32, ptr %7, align 4
  %83 = add nsw i32 %82, %81
  store i32 %83, ptr %7, align 4
  %84 = load i32, ptr %6, align 4
  %85 = call i32 @_17_switch_goto(i32 noundef %84)
  %86 = load i32, ptr %7, align 4
  %87 = add nsw i32 %86, %85
  store i32 %87, ptr %7, align 4
  %88 = load i32, ptr %6, align 4
  %89 = call i32 @_18_switch_multiple_goto(i32 noundef %88)
  %90 = load i32, ptr %7, align 4
  %91 = add nsw i32 %90, %89
  store i32 %91, ptr %7, align 4
  %92 = load i32, ptr %6, align 4
  %93 = call i32 @_19_switch_nested_goto(i32 noundef %92)
  %94 = load i32, ptr %7, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, ptr %7, align 4
  %96 = load i32, ptr %6, align 4
  %97 = call i32 @_20_switch_precomputed(i32 noundef %96)
  %98 = load i32, ptr %7, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, ptr %7, align 4
  %100 = load i32, ptr %6, align 4
  %101 = call i32 @_21_switch_complex_data(i32 noundef %100)
  %102 = load i32, ptr %7, align 4
  %103 = add nsw i32 %102, %101
  store i32 %103, ptr %7, align 4
  %104 = load i32, ptr %6, align 4
  %105 = call i32 @_22_switch_case_blocks(i32 noundef %104)
  %106 = load i32, ptr %7, align 4
  %107 = add nsw i32 %106, %105
  store i32 %107, ptr %7, align 4
  %108 = load i32, ptr %6, align 4
  %109 = call i32 @_23_switch_nested_fallthrough(i32 noundef %108)
  %110 = load i32, ptr %7, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, ptr %7, align 4
  %112 = load i32, ptr %6, align 4
  %113 = call i32 @_24_switch_large(i32 noundef %112)
  %114 = load i32, ptr %7, align 4
  %115 = add nsw i32 %114, %113
  store i32 %115, ptr %7, align 4
  %116 = load i32, ptr %6, align 4
  %117 = call i32 @_25_switch_sparse(i32 noundef %116)
  %118 = load i32, ptr %7, align 4
  %119 = add nsw i32 %118, %117
  store i32 %119, ptr %7, align 4
  %120 = load i32, ptr %6, align 4
  %121 = call i32 @_26_switch_very_nested(i32 noundef %120)
  %122 = load i32, ptr %7, align 4
  %123 = add nsw i32 %122, %121
  store i32 %123, ptr %7, align 4
  %124 = load i32, ptr %6, align 4
  %125 = call i32 @_27_switch_goto_nested_array(i32 noundef %124)
  %126 = load i32, ptr %7, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, ptr %7, align 4
  %128 = load i32, ptr %6, align 4
  %129 = call i32 @_28_switch_pointer_to_pointer(i32 noundef %128)
  %130 = load i32, ptr %7, align 4
  %131 = add nsw i32 %130, %129
  store i32 %131, ptr %7, align 4
  %132 = load i32, ptr %6, align 4
  %133 = call i32 @_29_switch_combined(i32 noundef %132)
  %134 = load i32, ptr %7, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, ptr %7, align 4
  %136 = load i32, ptr %7, align 4
  %137 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %136)
  ret i32 0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
