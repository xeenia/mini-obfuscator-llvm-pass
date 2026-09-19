; ModuleID = '_01_ifs.c'
source_filename = "_01_ifs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_x = dso_local global i32 10, align 4
@g_y = dso_local global i32 -3, align 4
@g_z = dso_local global i32 7, align 4
@g_arr = dso_local global [8 x i32] [i32 0, i32 1, i32 -2, i32 3, i32 -4, i32 5, i32 6, i32 -7], align 16
@g_mat = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 7, i32 8, i32 9]], align 16
@g_void_result = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_00_if_only(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = mul nsw i32 %7, 2
  store i32 %8, ptr %2, align 4
  br label %11

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  store i32 %10, ptr %2, align 4
  br label %11

11:                                               ; preds = %9, %6
  %12 = load i32, ptr %2, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_if_else(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %7, 10
  store i32 %8, ptr %2, align 4
  br label %12

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = sub nsw i32 %10, 10
  store i32 %11, ptr %2, align 4
  br label %12

12:                                               ; preds = %9, %6
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_if_with_surrounding_code(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = add nsw i32 %4, 3
  store i32 %5, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %1
  %9 = load i32, ptr %3, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %3, align 4
  br label %11

11:                                               ; preds = %8, %1
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 5
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %3, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_if_compound(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  store i32 %4, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %3, align 4
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %3, align 4
  br label %12

12:                                               ; preds = %7, %1
  %13 = load i32, ptr %3, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_if_else_compound(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = load i32, ptr %2, align 4
  %8 = mul nsw i32 %7, 2
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %3, align 4
  br label %16

11:                                               ; preds = %1
  %12 = load i32, ptr %2, align 4
  %13 = sub nsw i32 %12, 2
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 1
  store i32 %15, ptr %3, align 4
  br label %16

16:                                               ; preds = %11, %6
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_if_equal(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp eq i32 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  store i32 100, ptr %3, align 4
  br label %11

10:                                               ; preds = %2
  store i32 200, ptr %3, align 4
  br label %11

11:                                               ; preds = %10, %9
  %12 = load i32, ptr %3, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_if_not_equal(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %9, label %13

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %3, align 4
  br label %17

13:                                               ; preds = %2
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %5, align 4
  %16 = sub nsw i32 %14, %15
  store i32 %16, ptr %3, align 4
  br label %17

17:                                               ; preds = %13, %9
  %18 = load i32, ptr %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_relational(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  store i32 1, ptr %3, align 4
  br label %21

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %10
  store i32 2, ptr %3, align 4
  br label %21

15:                                               ; preds = %10
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %15
  store i32 3, ptr %3, align 4
  br label %21

20:                                               ; preds = %15
  store i32 4, ptr %3, align 4
  br label %21

21:                                               ; preds = %20, %19, %14, %9
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = zext i1 %0 to i8
  store i8 %6, ptr %4, align 1
  store i32 %1, ptr %5, align 4
  %7 = load i8, ptr %4, align 1
  %8 = trunc i8 %7 to i1
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = mul nsw i32 %10, 3
  store i32 %11, ptr %3, align 4
  br label %15

12:                                               ; preds = %2
  %13 = load i32, ptr %5, align 4
  %14 = sub nsw i32 %13, 3
  store i32 %14, ptr %3, align 4
  br label %15

15:                                               ; preds = %12, %9
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_if_elseif_else(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 10
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %7, 100
  store i32 %8, ptr %2, align 4
  br label %18

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 5
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 50
  store i32 %14, ptr %2, align 4
  br label %18

15:                                               ; preds = %9
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, 10
  store i32 %17, ptr %2, align 4
  br label %18

18:                                               ; preds = %15, %12, %6
  %19 = load i32, ptr %2, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_multiple_elseif(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, -10
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 -1, ptr %2, align 4
  br label %20

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 -2, ptr %2, align 4
  br label %20

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 0, ptr %2, align 4
  br label %20

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = icmp slt i32 %16, 10
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  store i32 2, ptr %2, align 4
  br label %20

19:                                               ; preds = %15
  store i32 1, ptr %2, align 4
  br label %20

20:                                               ; preds = %19, %18, %14, %10, %6
  %21 = load i32, ptr %2, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_elseif_expressions(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %3, align 4
  br label %33

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp eq i32 %13, %14
  br i1 %15, label %16, label %20

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  br label %33

20:                                               ; preds = %12
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 10
  %23 = load i32, ptr %5, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %20
  %26 = load i32, ptr %4, align 4
  %27 = load i32, ptr %5, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, ptr %3, align 4
  br label %33

29:                                               ; preds = %20
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %4, align 4
  %32 = sub nsw i32 %30, %31
  store i32 %32, ptr %3, align 4
  br label %33

33:                                               ; preds = %29, %25, %16, %9
  %34 = load i32, ptr %3, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_and(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %15

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %3, align 4
  br label %19

15:                                               ; preds = %8, %2
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sub nsw i32 %16, %17
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %15, %11
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_or(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %16

11:                                               ; preds = %8, %2
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = add nsw i32 %14, 10
  store i32 %15, ptr %3, align 4
  br label %21

16:                                               ; preds = %8
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  %20 = sub nsw i32 %19, 10
  store i32 %20, ptr %3, align 4
  br label %21

21:                                               ; preds = %16, %11
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_and_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %16, label %13

13:                                               ; preds = %10, %3
  %14 = load i32, ptr %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13, %10
  store i32 100, ptr %4, align 4
  br label %18

17:                                               ; preds = %13
  store i32 200, ptr %4, align 4
  br label %18

18:                                               ; preds = %17, %16
  %19 = load i32, ptr %4, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_or_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %10, %3
  %14 = load i32, ptr %7, align 4
  %15 = icmp sgt i32 %14, 10
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 300, ptr %4, align 4
  br label %18

17:                                               ; preds = %13, %10
  store i32 400, ptr %4, align 4
  br label %18

18:                                               ; preds = %17, %16
  %19 = load i32, ptr %4, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %10 = load i32, ptr %6, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %4
  %13 = load i32, ptr %7, align 4
  %14 = icmp slt i32 %13, 10
  br i1 %14, label %21, label %15

15:                                               ; preds = %12, %4
  %16 = load i32, ptr %8, align 4
  %17 = icmp eq i32 %16, 5
  br i1 %17, label %18, label %29

18:                                               ; preds = %15
  %19 = load i32, ptr %9, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %29

21:                                               ; preds = %18, %12
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr %7, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, ptr %8, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %9, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %5, align 4
  br label %37

29:                                               ; preds = %18, %15
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %7, align 4
  %32 = sub nsw i32 %30, %31
  %33 = load i32, ptr %8, align 4
  %34 = sub nsw i32 %32, %33
  %35 = load i32, ptr %9, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %5, align 4
  br label %37

37:                                               ; preds = %29, %21
  %38 = load i32, ptr %5, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_nested_arithmetic_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %6, align 4
  %10 = load i32, ptr %7, align 4
  %11 = sdiv i32 %10, 10
  %12 = load i32, ptr %5, align 4
  %13 = sub nsw i32 %12, 1
  %14 = mul nsw i32 %11, %13
  %15 = add nsw i32 %9, %14
  %16 = icmp eq i32 %8, %15
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  store i32 111, ptr %4, align 4
  br label %19

18:                                               ; preds = %3
  store i32 222, ptr %4, align 4
  br label %19

19:                                               ; preds = %18, %17
  %20 = load i32, ptr %4, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_deep_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %6, align 4
  %10 = add nsw i32 %8, %9
  %11 = load i32, ptr %7, align 4
  %12 = sub nsw i32 %11, 1
  %13 = mul nsw i32 %10, %12
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = add nsw i32 %15, 2
  %17 = sub nsw i32 %14, %16
  %18 = load i32, ptr %7, align 4
  %19 = mul nsw i32 %17, %18
  %20 = icmp eq i32 %13, %19
  br i1 %20, label %21, label %27

21:                                               ; preds = %3
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %24, %25
  store i32 %26, ptr %4, align 4
  br label %33

27:                                               ; preds = %3
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %6, align 4
  %30 = sub nsw i32 %28, %29
  %31 = load i32, ptr %7, align 4
  %32 = sub nsw i32 %30, %31
  store i32 %32, ptr %4, align 4
  br label %33

33:                                               ; preds = %27, %21
  %34 = load i32, ptr %4, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_arithmetic_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %6, align 4
  %10 = add nsw i32 %8, %9
  %11 = load i32, ptr %7, align 4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %21

13:                                               ; preds = %3
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = sub nsw i32 %14, %15
  %17 = load i32, ptr %7, align 4
  %18 = add nsw i32 %17, 10
  %19 = icmp slt i32 %16, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %13
  store i32 123, ptr %4, align 4
  br label %22

21:                                               ; preds = %13, %3
  store i32 456, ptr %4, align 4
  br label %22

22:                                               ; preds = %21, %20
  %23 = load i32, ptr %4, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_nested_boolean_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %7, align 4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %21

13:                                               ; preds = %4
  %14 = load i32, ptr %8, align 4
  %15 = load i32, ptr %9, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %29, label %17

17:                                               ; preds = %13
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %8, align 4
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %29, label %21

21:                                               ; preds = %17, %4
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %9, align 4
  %24 = icmp eq i32 %22, %23
  br i1 %24, label %25, label %30

25:                                               ; preds = %21
  %26 = load i32, ptr %6, align 4
  %27 = load i32, ptr %8, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %30

29:                                               ; preds = %25, %17, %13
  store i32 777, ptr %5, align 4
  br label %31

30:                                               ; preds = %25, %21
  store i32 888, ptr %5, align 4
  br label %31

31:                                               ; preds = %30, %29
  %32 = load i32, ptr %5, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_nested_if(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  store i32 %6, ptr %5, align 4
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %25

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %18

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %5, align 4
  br label %24

18:                                               ; preds = %9
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %19, %20
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  br label %24

24:                                               ; preds = %18, %12
  br label %25

25:                                               ; preds = %24, %2
  %26 = load i32, ptr %5, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_nested_in_else(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %3, align 4
  br label %21

12:                                               ; preds = %2
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %18

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %3, align 4
  br label %21

18:                                               ; preds = %12
  %19 = load i32, ptr %5, align 4
  %20 = sub nsw i32 %19, 2
  store i32 %20, ptr %3, align 4
  br label %21

21:                                               ; preds = %18, %15, %8
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_nested_if_else(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %21

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %4, align 4
  br label %30

17:                                               ; preds = %10
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = sub nsw i32 %18, %19
  store i32 %20, ptr %4, align 4
  br label %30

21:                                               ; preds = %3
  %22 = load i32, ptr %7, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %21
  %25 = load i32, ptr %7, align 4
  %26 = mul nsw i32 %25, 2
  store i32 %26, ptr %4, align 4
  br label %30

27:                                               ; preds = %21
  %28 = load i32, ptr %7, align 4
  %29 = sub nsw i32 %28, 2
  store i32 %29, ptr %4, align 4
  br label %30

30:                                               ; preds = %27, %24, %17, %13
  %31 = load i32, ptr %4, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_three_level_nesting(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %31

10:                                               ; preds = %3
  %11 = load i32, ptr %7, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %7, align 4
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %27

15:                                               ; preds = %10
  %16 = load i32, ptr %7, align 4
  %17 = add nsw i32 %16, 10
  store i32 %17, ptr %7, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %15
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %21, 100
  store i32 %22, ptr %7, align 4
  br label %26

23:                                               ; preds = %15
  %24 = load i32, ptr %7, align 4
  %25 = sub nsw i32 %24, 100
  store i32 %25, ptr %7, align 4
  br label %26

26:                                               ; preds = %23, %20
  br label %30

27:                                               ; preds = %10
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 20
  store i32 %29, ptr %7, align 4
  br label %30

30:                                               ; preds = %27, %26
  br label %32

31:                                               ; preds = %3
  store i32 -1, ptr %7, align 4
  br label %32

32:                                               ; preds = %31, %30
  %33 = load i32, ptr %7, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_deep_nested_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %6, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %8, align 4
  %12 = load i32, ptr %8, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %44

14:                                               ; preds = %3
  %15 = load i32, ptr %8, align 4
  %16 = add nsw i32 %15, 10
  store i32 %16, ptr %8, align 4
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %7, align 4
  %19 = icmp sgt i32 %17, %18
  br i1 %19, label %20, label %32

20:                                               ; preds = %14
  %21 = load i32, ptr %8, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, ptr %8, align 4
  %23 = load i32, ptr %8, align 4
  %24 = srem i32 %23, 3
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %29

26:                                               ; preds = %20
  %27 = load i32, ptr %8, align 4
  %28 = add nsw i32 %27, 3
  store i32 %28, ptr %4, align 4
  br label %48

29:                                               ; preds = %20
  %30 = load i32, ptr %8, align 4
  %31 = sub nsw i32 %30, 3
  store i32 %31, ptr %4, align 4
  br label %48

32:                                               ; preds = %14
  %33 = load i32, ptr %8, align 4
  %34 = sub nsw i32 %33, 5
  store i32 %34, ptr %8, align 4
  %35 = load i32, ptr %8, align 4
  %36 = load i32, ptr %7, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %41

38:                                               ; preds = %32
  %39 = load i32, ptr %8, align 4
  %40 = mul nsw i32 %39, 2
  store i32 %40, ptr %4, align 4
  br label %48

41:                                               ; preds = %32
  %42 = load i32, ptr %8, align 4
  %43 = sdiv i32 %42, 2
  store i32 %43, ptr %4, align 4
  br label %48

44:                                               ; preds = %3
  %45 = load i32, ptr %8, align 4
  %46 = load i32, ptr %7, align 4
  %47 = sub nsw i32 %45, %46
  store i32 %47, ptr %4, align 4
  br label %48

48:                                               ; preds = %44, %41, %38, %29, %26
  %49 = load i32, ptr %4, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_nested_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %31

10:                                               ; preds = %3
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %31

13:                                               ; preds = %10
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %7, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %7, align 4
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %26

19:                                               ; preds = %13
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %20, 10
  br i1 %21, label %22, label %26

22:                                               ; preds = %19
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %7, align 4
  br label %30

26:                                               ; preds = %19, %13
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %7, align 4
  %29 = sub nsw i32 %28, %27
  store i32 %29, ptr %7, align 4
  br label %30

30:                                               ; preds = %26, %22
  br label %33

31:                                               ; preds = %10, %3
  %32 = load i32, ptr %6, align 4
  store i32 %32, ptr %7, align 4
  br label %33

33:                                               ; preds = %31, %30
  %34 = load i32, ptr %7, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_nested_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %21

13:                                               ; preds = %10, %3
  %14 = load i32, ptr %7, align 4
  %15 = icmp sgt i32 %14, 10
  br i1 %15, label %19, label %16

16:                                               ; preds = %13
  %17 = load i32, ptr %7, align 4
  %18 = icmp slt i32 %17, -10
  br i1 %18, label %19, label %20

19:                                               ; preds = %16, %13
  store i32 1000, ptr %4, align 4
  br label %22

20:                                               ; preds = %16
  store i32 2000, ptr %4, align 4
  br label %22

21:                                               ; preds = %10
  store i32 3000, ptr %4, align 4
  br label %22

22:                                               ; preds = %21, %20, %19
  %23 = load i32, ptr %4, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_nested_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %10 = load i32, ptr %6, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %4
  %13 = load i32, ptr %7, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %18, label %15

15:                                               ; preds = %12, %4
  %16 = load i32, ptr %8, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %40

18:                                               ; preds = %15, %12
  %19 = load i32, ptr %9, align 4
  %20 = icmp sgt i32 %19, 5
  br i1 %20, label %25, label %21

21:                                               ; preds = %18
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr %7, align 4
  %24 = icmp eq i32 %22, %23
  br i1 %24, label %25, label %36

25:                                               ; preds = %21, %18
  %26 = load i32, ptr %8, align 4
  %27 = icmp slt i32 %26, 10
  br i1 %27, label %28, label %36

28:                                               ; preds = %25
  %29 = load i32, ptr %6, align 4
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, ptr %9, align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %5, align 4
  br label %44

36:                                               ; preds = %25, %21
  %37 = load i32, ptr %6, align 4
  %38 = load i32, ptr %7, align 4
  %39 = mul nsw i32 %37, %38
  store i32 %39, ptr %5, align 4
  br label %44

40:                                               ; preds = %15
  %41 = load i32, ptr %8, align 4
  %42 = load i32, ptr %9, align 4
  %43 = sub nsw i32 %41, %42
  store i32 %43, ptr %5, align 4
  br label %44

44:                                               ; preds = %40, %36, %28
  %45 = load i32, ptr %5, align 4
  ret i32 %45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_independent_ifs(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  store i32 %4, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %3, align 4
  br label %10

10:                                               ; preds = %7, %1
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 5
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 20
  store i32 %15, ptr %3, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %2, align 4
  %18 = icmp sgt i32 %17, 10
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 30
  store i32 %21, ptr %3, align 4
  br label %22

22:                                               ; preds = %19, %16
  %23 = load i32, ptr %3, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_independent_if_else(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = add nsw i32 %9, 10
  store i32 %10, ptr %5, align 4
  br label %14

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4
  %13 = sub nsw i32 %12, 10
  store i32 %13, ptr %5, align 4
  br label %14

14:                                               ; preds = %11, %8
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %14
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 20
  store i32 %19, ptr %5, align 4
  br label %23

20:                                               ; preds = %14
  %21 = load i32, ptr %5, align 4
  %22 = sub nsw i32 %21, 20
  store i32 %22, ptr %5, align 4
  br label %23

23:                                               ; preds = %20, %17
  %24 = load i32, ptr %5, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_array_condition(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %5 = load i32, ptr %3, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %14

11:                                               ; preds = %1
  %12 = load i32, ptr %4, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %2, align 4
  br label %17

14:                                               ; preds = %1
  %15 = load i32, ptr %4, align 4
  %16 = sub nsw i32 %15, 2
  store i32 %16, ptr %2, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_array_branches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %5
  %7 = load i32, ptr %6, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %2, align 4
  br label %23

16:                                               ; preds = %1
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  %22 = sub nsw i32 %20, %21
  store i32 %22, ptr %2, align 4
  br label %23

23:                                               ; preds = %16, %9
  %24 = load i32, ptr %2, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_array_complex_condition(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = load i32, ptr %5, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = icmp sgt i32 %9, %13
  br i1 %14, label %15, label %27

15:                                               ; preds = %2
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %27

21:                                               ; preds = %15
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = mul nsw i32 %25, 10
  store i32 %26, ptr %3, align 4
  br label %33

27:                                               ; preds = %15, %2
  %28 = load i32, ptr %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = mul nsw i32 %31, 10
  store i32 %32, ptr %3, align 4
  br label %33

33:                                               ; preds = %27, %21
  %34 = load i32, ptr %3, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_matrix_condition(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %7 = load i32, ptr %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %8
  %10 = load i32, ptr %5, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [3 x i32], ptr %9, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  store i32 %13, ptr %6, align 4
  %14 = load i32, ptr %6, align 4
  %15 = icmp sgt i32 %14, 5
  br i1 %15, label %16, label %19

16:                                               ; preds = %2
  %17 = load i32, ptr %6, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %3, align 4
  br label %22

19:                                               ; preds = %2
  %20 = load i32, ptr %6, align 4
  %21 = sub nsw i32 %20, 2
  store i32 %21, ptr %3, align 4
  br label %22

22:                                               ; preds = %19, %16
  %23 = load i32, ptr %3, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_nested_array(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp sge i32 %6, 0
  br i1 %7, label %8, label %59

8:                                                ; preds = %2
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 8
  br i1 %10, label %11, label %59

11:                                               ; preds = %8
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp sge i32 %18, 0
  br i1 %19, label %20, label %58

20:                                               ; preds = %11
  %21 = load i32, ptr %4, align 4
  %22 = icmp slt i32 %21, 8
  br i1 %22, label %23, label %58

23:                                               ; preds = %20
  %24 = load i32, ptr %3, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = icmp sgt i32 %27, %31
  br i1 %32, label %33, label %45

33:                                               ; preds = %23
  %34 = load i32, ptr %3, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = load i32, ptr %4, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = sub nsw i32 %37, %41
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr %5, align 4
  br label %57

45:                                               ; preds = %23
  %46 = load i32, ptr %4, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %3, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = sub nsw i32 %49, %53
  %55 = load i32, ptr %5, align 4
  %56 = add nsw i32 %55, %54
  store i32 %56, ptr %5, align 4
  br label %57

57:                                               ; preds = %45, %33
  br label %58

58:                                               ; preds = %57, %20, %11
  br label %59

59:                                               ; preds = %58, %8, %2
  %60 = load i32, ptr %5, align 4
  ret i32 %60
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_pointer_condition(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 10
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = load i32, ptr %8, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %2, align 4
  br label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, 2
  store i32 %14, ptr %2, align 4
  br label %15

15:                                               ; preds = %11, %7
  %16 = load i32, ptr %2, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_pointer_branches(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load i32, ptr %4, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = load i32, ptr %8, align 4
  %10 = add nsw i32 %9, 100
  store i32 %10, ptr %2, align 4
  br label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %12, align 4
  %14 = sub nsw i32 %13, 100
  store i32 %14, ptr %2, align 4
  br label %15

15:                                               ; preds = %11, %7
  %16 = load i32, ptr %2, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_pointer_array(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %6 = load ptr, ptr %4, align 8
  %7 = load i32, ptr %5, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i32, ptr %6, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = load i32, ptr %5, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = icmp sgt i32 %10, %14
  br i1 %15, label %16, label %27

16:                                               ; preds = %2
  %17 = load ptr, ptr %4, align 8
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr %17, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = add nsw i32 %21, %25
  store i32 %26, ptr %3, align 4
  br label %38

27:                                               ; preds = %2
  %28 = load ptr, ptr %4, align 8
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %28, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = sub nsw i32 %32, %36
  store i32 %37, ptr %3, align 4
  br label %38

38:                                               ; preds = %27, %16
  %39 = load i32, ptr %3, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_nested_pointer(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr %5, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = load i32, ptr %8, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %25

11:                                               ; preds = %2
  %12 = load i32, ptr %4, align 4
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %13, align 4
  %15 = icmp sgt i32 %12, %14
  br i1 %15, label %16, label %20

16:                                               ; preds = %11
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %5, align 4
  br label %24

20:                                               ; preds = %11
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  br label %24

24:                                               ; preds = %20, %16
  br label %29

25:                                               ; preds = %2
  %26 = load ptr, ptr %3, align 8
  %27 = load i32, ptr %26, align 4
  %28 = sub nsw i32 0, %27
  store i32 %28, ptr %5, align 4
  br label %29

29:                                               ; preds = %25, %24
  %30 = load i32, ptr %5, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_pointer_write(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = mul nsw i32 %8, 2
  %10 = load ptr, ptr %3, align 8
  store i32 %9, ptr %10, align 4
  br label %15

11:                                               ; preds = %2
  %12 = load i32, ptr %4, align 4
  %13 = sub nsw i32 %12, 2
  %14 = load ptr, ptr %3, align 8
  store i32 %13, ptr %14, align 4
  br label %15

15:                                               ; preds = %11, %7
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %16, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_pointer_write_nested(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %23

9:                                                ; preds = %3
  %10 = load i32, ptr %6, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %17

12:                                               ; preds = %9
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %13, %14
  %16 = load ptr, ptr %4, align 8
  store i32 %15, ptr %16, align 4
  br label %22

17:                                               ; preds = %9
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = sub nsw i32 %18, %19
  %21 = load ptr, ptr %4, align 8
  store i32 %20, ptr %21, align 4
  br label %22

22:                                               ; preds = %17, %12
  br label %27

23:                                               ; preds = %3
  %24 = load i32, ptr %5, align 4
  %25 = sub nsw i32 0, %24
  %26 = load ptr, ptr %4, align 8
  store i32 %25, ptr %26, align 4
  br label %27

27:                                               ; preds = %23, %22
  %28 = load ptr, ptr %4, align 8
  %29 = load i32, ptr %28, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_global_only() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %0
  %5 = load i32, ptr @g_x, align 4
  %6 = load i32, ptr @g_y, align 4
  %7 = add nsw i32 %5, %6
  store i32 %7, ptr %1, align 4
  br label %12

8:                                                ; preds = %0
  %9 = load i32, ptr @g_x, align 4
  %10 = load i32, ptr @g_y, align 4
  %11 = sub nsw i32 %9, %10
  store i32 %11, ptr %1, align 4
  br label %12

12:                                               ; preds = %8, %4
  %13 = load i32, ptr %1, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_global_and() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %11

4:                                                ; preds = %0
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_y, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %1, align 4
  br label %13

11:                                               ; preds = %4, %0
  %12 = load i32, ptr @g_z, align 4
  store i32 %12, ptr %1, align 4
  br label %13

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %1, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_global_or() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %0
  %5 = load i32, ptr @g_z, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %4, %0
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_z, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %1, align 4
  br label %13

11:                                               ; preds = %4
  %12 = load i32, ptr @g_y, align 4
  store i32 %12, ptr %1, align 4
  br label %13

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %1, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_global_nested() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %15

4:                                                ; preds = %0
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_y, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %1, align 4
  br label %17

11:                                               ; preds = %4
  %12 = load i32, ptr @g_x, align 4
  %13 = load i32, ptr @g_y, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, ptr %1, align 4
  br label %17

15:                                               ; preds = %0
  %16 = load i32, ptr @g_z, align 4
  store i32 %16, ptr %1, align 4
  br label %17

17:                                               ; preds = %15, %11, %7
  %18 = load i32, ptr %1, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_array_only() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_arr, align 16
  %3 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %7

5:                                                ; preds = %0
  %6 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 %6, ptr %1, align 4
  br label %9

7:                                                ; preds = %0
  %8 = load i32, ptr @g_arr, align 16
  store i32 %8, ptr %1, align 4
  br label %9

9:                                                ; preds = %7, %5
  %10 = load i32, ptr %1, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_global_matrix_only() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_mat, align 16
  %3 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %7

5:                                                ; preds = %0
  %6 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  store i32 %6, ptr %1, align 4
  br label %9

7:                                                ; preds = %0
  %8 = load i32, ptr @g_mat, align 16
  store i32 %8, ptr %1, align 4
  br label %9

9:                                                ; preds = %7, %5
  %10 = load i32, ptr %1, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_multiple_returns(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 -1, ptr %2, align 4
  br label %16

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 0, ptr %2, align 4
  br label %16

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %12, 10
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 10, ptr %2, align 4
  br label %16

15:                                               ; preds = %11
  store i32 20, ptr %2, align 4
  br label %16

16:                                               ; preds = %15, %14, %10, %6
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_nested_multiple_returns(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %24

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %3, align 4
  br label %27

15:                                               ; preds = %8
  %16 = load i32, ptr %5, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = load i32, ptr %4, align 4
  store i32 %19, ptr %3, align 4
  br label %27

20:                                               ; preds = %15
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %3, align 4
  br label %27

24:                                               ; preds = %2
  %25 = load i32, ptr %4, align 4
  %26 = sub nsw i32 0, %25
  store i32 %26, ptr %3, align 4
  br label %27

27:                                               ; preds = %24, %20, %18, %11
  %28 = load i32, ptr %3, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_50_complex_multiple_returns(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %17

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %4, align 4
  br label %40

17:                                               ; preds = %10, %3
  %18 = load i32, ptr %5, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %23, label %20

20:                                               ; preds = %17
  %21 = load i32, ptr %7, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %20, %17
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %7, align 4
  %26 = sub nsw i32 %24, %25
  store i32 %26, ptr %4, align 4
  br label %40

27:                                               ; preds = %20
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %7, align 4
  %32 = mul nsw i32 %31, 2
  %33 = icmp sgt i32 %30, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %27
  %35 = load i32, ptr %5, align 4
  %36 = load i32, ptr %6, align 4
  %37 = mul nsw i32 %35, %36
  store i32 %37, ptr %4, align 4
  br label %40

38:                                               ; preds = %27
  %39 = load i32, ptr %7, align 4
  store i32 %39, ptr %4, align 4
  br label %40

40:                                               ; preds = %38, %34, %23, %13
  %41 = load i32, ptr %4, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_51_prefix_code(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %7, align 4
  %13 = load i32, ptr %7, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %8, align 4
  %15 = load i32, ptr %8, align 4
  %16 = load i32, ptr %6, align 4
  %17 = sub nsw i32 %15, %16
  store i32 %17, ptr %9, align 4
  %18 = load i32, ptr %9, align 4
  %19 = icmp sgt i32 %18, 10
  br i1 %19, label %20, label %23

20:                                               ; preds = %3
  %21 = load i32, ptr %9, align 4
  %22 = add nsw i32 %21, 100
  store i32 %22, ptr %9, align 4
  br label %26

23:                                               ; preds = %3
  %24 = load i32, ptr %9, align 4
  %25 = sub nsw i32 %24, 100
  store i32 %25, ptr %9, align 4
  br label %26

26:                                               ; preds = %23, %20
  %27 = load i32, ptr %9, align 4
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %8, align 4
  %31 = add nsw i32 %29, %30
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_suffix_code(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %5, align 4
  br label %15

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %5, align 4
  br label %15

15:                                               ; preds = %12, %9
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, 10
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %18, 3
  store i32 %19, ptr %5, align 4
  %20 = load i32, ptr %5, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_prefix_nested_suffix(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %5, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %28

13:                                               ; preds = %3
  %14 = load i32, ptr %7, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %7, align 4
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %19, label %22

19:                                               ; preds = %13
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %20, 10
  store i32 %21, ptr %7, align 4
  br label %25

22:                                               ; preds = %13
  %23 = load i32, ptr %7, align 4
  %24 = sub nsw i32 %23, 10
  store i32 %24, ptr %7, align 4
  br label %25

25:                                               ; preds = %22, %19
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, 5
  store i32 %27, ptr %7, align 4
  br label %31

28:                                               ; preds = %3
  %29 = load i32, ptr %7, align 4
  %30 = sub nsw i32 0, %29
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %28, %25
  %32 = load i32, ptr %7, align 4
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %32, %33
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_diamond(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %5, align 4
  br label %15

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 20
  store i32 %14, ptr %5, align 4
  br label %15

15:                                               ; preds = %12, %9
  %16 = load i32, ptr %5, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_55_multiple_merge_values(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %14

9:                                                ; preds = %2
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, 2
  store i32 %13, ptr %6, align 4
  br label %19

14:                                               ; preds = %2
  %15 = load i32, ptr %3, align 4
  %16 = sub nsw i32 %15, 1
  store i32 %16, ptr %5, align 4
  %17 = load i32, ptr %4, align 4
  %18 = sub nsw i32 %17, 2
  store i32 %18, ptr %6, align 4
  br label %19

19:                                               ; preds = %14, %9
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = mul nsw i32 %20, %21
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_nested_diamonds(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %23

11:                                               ; preds = %3
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %7, align 4
  br label %22

18:                                               ; preds = %11
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %7, align 4
  br label %22

22:                                               ; preds = %18, %14
  br label %35

23:                                               ; preds = %3
  %24 = load i32, ptr %6, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %26, label %30

26:                                               ; preds = %23
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %7, align 4
  br label %34

30:                                               ; preds = %23
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %4, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %7, align 4
  br label %34

34:                                               ; preds = %30, %26
  br label %35

35:                                               ; preds = %34, %22
  %36 = load i32, ptr %7, align 4
  %37 = icmp sgt i32 %36, 10
  br i1 %37, label %38, label %41

38:                                               ; preds = %35
  %39 = load i32, ptr %7, align 4
  %40 = mul nsw i32 %39, 2
  store i32 %40, ptr %8, align 4
  br label %44

41:                                               ; preds = %35
  %42 = load i32, ptr %7, align 4
  %43 = sub nsw i32 %42, 2
  store i32 %43, ptr %8, align 4
  br label %44

44:                                               ; preds = %41, %38
  %45 = load i32, ptr %8, align 4
  ret i32 %45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_ternary_before_if(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sgt i32 %7, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  br label %14

12:                                               ; preds = %2
  %13 = load i32, ptr %5, align 4
  br label %14

14:                                               ; preds = %12, %10
  %15 = phi i32 [ %11, %10 ], [ %13, %12 ]
  store i32 %15, ptr %6, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp sgt i32 %16, 10
  br i1 %17, label %18, label %21

18:                                               ; preds = %14
  %19 = load i32, ptr %6, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, ptr %3, align 4
  br label %24

21:                                               ; preds = %14
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, 2
  store i32 %23, ptr %3, align 4
  br label %24

24:                                               ; preds = %21, %18
  %25 = load i32, ptr %3, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_58_ternary_inside_if(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %21

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  br label %19

15:                                               ; preds = %8
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sub nsw i32 %16, %17
  br label %19

19:                                               ; preds = %15, %11
  %20 = phi i32 [ %14, %11 ], [ %18, %15 ]
  store i32 %20, ptr %3, align 4
  br label %32

21:                                               ; preds = %2
  %22 = load i32, ptr %5, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %21
  %25 = load i32, ptr %5, align 4
  %26 = mul nsw i32 %25, 2
  br label %30

27:                                               ; preds = %21
  %28 = load i32, ptr %5, align 4
  %29 = sub nsw i32 %28, 2
  br label %30

30:                                               ; preds = %27, %24
  %31 = phi i32 [ %26, %24 ], [ %29, %27 ]
  store i32 %31, ptr %3, align 4
  br label %32

32:                                               ; preds = %30, %19
  %33 = load i32, ptr %3, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_59_nested_ternary_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %6, align 4
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %3
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %7, align 4
  %15 = icmp sgt i32 %13, %14
  br i1 %15, label %16, label %18

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  br label %20

18:                                               ; preds = %12
  %19 = load i32, ptr %7, align 4
  br label %20

20:                                               ; preds = %18, %16
  %21 = phi i32 [ %17, %16 ], [ %19, %18 ]
  br label %32

22:                                               ; preds = %3
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %7, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %26, label %28

26:                                               ; preds = %22
  %27 = load i32, ptr %6, align 4
  br label %30

28:                                               ; preds = %22
  %29 = load i32, ptr %7, align 4
  br label %30

30:                                               ; preds = %28, %26
  %31 = phi i32 [ %27, %26 ], [ %29, %28 ]
  br label %32

32:                                               ; preds = %30, %20
  %33 = phi i32 [ %21, %20 ], [ %31, %30 ]
  store i32 %33, ptr %8, align 4
  %34 = load i32, ptr %8, align 4
  %35 = icmp sgt i32 %34, 10
  br i1 %35, label %36, label %39

36:                                               ; preds = %32
  %37 = load i32, ptr %8, align 4
  %38 = mul nsw i32 %37, 2
  store i32 %38, ptr %4, align 4
  br label %41

39:                                               ; preds = %32
  %40 = load i32, ptr %8, align 4
  store i32 %40, ptr %4, align 4
  br label %41

41:                                               ; preds = %39, %36
  %42 = load i32, ptr %4, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_60_dynamic_alloca(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sle i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %42

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4
  %14 = zext i32 %13 to i64
  %15 = call ptr @llvm.stacksave()
  store ptr %15, ptr %6, align 8
  %16 = alloca i32, i64 %14, align 16
  store i64 %14, ptr %7, align 8
  %17 = load i32, ptr %5, align 4
  %18 = getelementptr inbounds i32, ptr %16, i64 0
  store i32 %17, ptr %18, align 16
  %19 = load i32, ptr %4, align 4
  %20 = icmp sgt i32 %19, 1
  br i1 %20, label %21, label %25

21:                                               ; preds = %12
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, 10
  %24 = getelementptr inbounds i32, ptr %16, i64 1
  store i32 %23, ptr %24, align 4
  br label %29

25:                                               ; preds = %12
  %26 = getelementptr inbounds i32, ptr %16, i64 0
  %27 = load i32, ptr %26, align 16
  %28 = add nsw i32 %27, 10
  store i32 %28, ptr %26, align 16
  br label %29

29:                                               ; preds = %25, %21
  %30 = getelementptr inbounds i32, ptr %16, i64 0
  %31 = load i32, ptr %30, align 16
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %36

33:                                               ; preds = %29
  %34 = getelementptr inbounds i32, ptr %16, i64 0
  %35 = load i32, ptr %34, align 16
  store i32 %35, ptr %3, align 4
  store i32 1, ptr %8, align 4
  br label %40

36:                                               ; preds = %29
  %37 = getelementptr inbounds i32, ptr %16, i64 0
  %38 = load i32, ptr %37, align 16
  %39 = sub nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  store i32 1, ptr %8, align 4
  br label %40

40:                                               ; preds = %36, %33
  %41 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %41)
  br label %42

42:                                               ; preds = %40, %11
  %43 = load i32, ptr %3, align 4
  ret i32 %43
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_61_dynamic_alloca_pointer(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp sle i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %53

13:                                               ; preds = %2
  %14 = load i32, ptr %4, align 4
  %15 = zext i32 %14 to i64
  %16 = call ptr @llvm.stacksave()
  store ptr %16, ptr %6, align 8
  %17 = alloca i32, i64 %15, align 16
  store i64 %15, ptr %7, align 8
  store ptr %17, ptr %8, align 8
  %18 = load i32, ptr %5, align 4
  %19 = load ptr, ptr %8, align 8
  store i32 %18, ptr %19, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp sgt i32 %20, 2
  br i1 %21, label %22, label %47

22:                                               ; preds = %13
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, 1
  %25 = load ptr, ptr %8, align 8
  %26 = getelementptr inbounds i32, ptr %25, i64 1
  store i32 %24, ptr %26, align 4
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds i32, ptr %27, i64 1
  %29 = load i32, ptr %28, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %39

31:                                               ; preds = %22
  %32 = load ptr, ptr %8, align 8
  %33 = getelementptr inbounds i32, ptr %32, i64 1
  %34 = load i32, ptr %33, align 4
  %35 = load ptr, ptr %8, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 0
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %34, %37
  store i32 %38, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %51

39:                                               ; preds = %22
  %40 = load ptr, ptr %8, align 8
  %41 = getelementptr inbounds i32, ptr %40, i64 0
  %42 = load i32, ptr %41, align 4
  %43 = load ptr, ptr %8, align 8
  %44 = getelementptr inbounds i32, ptr %43, i64 1
  %45 = load i32, ptr %44, align 4
  %46 = sub nsw i32 %42, %45
  store i32 %46, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %51

47:                                               ; preds = %13
  %48 = load ptr, ptr %8, align 8
  %49 = getelementptr inbounds i32, ptr %48, i64 0
  %50 = load i32, ptr %49, align 4
  store i32 %50, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %51

51:                                               ; preds = %47, %39, %31
  %52 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %52)
  br label %53

53:                                               ; preds = %51, %12
  %54 = load i32, ptr %3, align 4
  ret i32 %54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_62_dynamic_alloca_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp sle i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %3
  store i32 -100, ptr %4, align 4
  br label %55

14:                                               ; preds = %3
  %15 = load i32, ptr %5, align 4
  %16 = zext i32 %15 to i64
  %17 = call ptr @llvm.stacksave()
  store ptr %17, ptr %8, align 8
  %18 = alloca i32, i64 %16, align 16
  store i64 %16, ptr %9, align 8
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %19, %20
  %22 = getelementptr inbounds i32, ptr %18, i64 0
  store i32 %21, ptr %22, align 16
  %23 = load i32, ptr %5, align 4
  %24 = icmp sgt i32 %23, 3
  br i1 %24, label %25, label %34

25:                                               ; preds = %14
  %26 = getelementptr inbounds i32, ptr %18, i64 0
  %27 = load i32, ptr %26, align 16
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %34

29:                                               ; preds = %25
  %30 = getelementptr inbounds i32, ptr %18, i64 0
  %31 = load i32, ptr %30, align 16
  %32 = mul nsw i32 %31, 2
  %33 = getelementptr inbounds i32, ptr %18, i64 1
  store i32 %32, ptr %33, align 4
  br label %38

34:                                               ; preds = %25, %14
  %35 = getelementptr inbounds i32, ptr %18, i64 0
  %36 = load i32, ptr %35, align 16
  %37 = sub nsw i32 %36, 5
  store i32 %37, ptr %35, align 16
  br label %38

38:                                               ; preds = %34, %29
  %39 = getelementptr inbounds i32, ptr %18, i64 0
  %40 = load i32, ptr %39, align 16
  %41 = icmp sgt i32 %40, 10
  br i1 %41, label %45, label %42

42:                                               ; preds = %38
  %43 = load i32, ptr %7, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %48

45:                                               ; preds = %42, %38
  %46 = getelementptr inbounds i32, ptr %18, i64 0
  %47 = load i32, ptr %46, align 16
  store i32 %47, ptr %4, align 4
  store i32 1, ptr %10, align 4
  br label %53

48:                                               ; preds = %42
  %49 = getelementptr inbounds i32, ptr %18, i64 0
  %50 = load i32, ptr %49, align 16
  %51 = load i32, ptr %6, align 4
  %52 = add nsw i32 %50, %51
  store i32 %52, ptr %4, align 4
  store i32 1, ptr %10, align 4
  br label %53

53:                                               ; preds = %48, %45
  %54 = load ptr, ptr %8, align 8
  call void @llvm.stackrestore(ptr %54)
  br label %55

55:                                               ; preds = %53, %13
  %56 = load i32, ptr %4, align 4
  ret i32 %56
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_63_malloc_if(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp sle i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %43

11:                                               ; preds = %2
  %12 = load i32, ptr %4, align 4
  %13 = sext i32 %12 to i64
  %14 = mul i64 %13, 4
  %15 = call noalias ptr @malloc(i64 noundef %14) #6
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %19

18:                                               ; preds = %11
  store i32 -2, ptr %3, align 4
  br label %43

19:                                               ; preds = %11
  %20 = load i32, ptr %5, align 4
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds i32, ptr %21, i64 0
  store i32 %20, ptr %22, align 4
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds i32, ptr %23, i64 0
  %25 = load i32, ptr %24, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %32

27:                                               ; preds = %19
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds i32, ptr %28, i64 0
  %30 = load i32, ptr %29, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %29, align 4
  br label %37

32:                                               ; preds = %19
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds i32, ptr %33, i64 0
  %35 = load i32, ptr %34, align 4
  %36 = sub nsw i32 %35, 2
  store i32 %36, ptr %34, align 4
  br label %37

37:                                               ; preds = %32, %27
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds i32, ptr %38, i64 0
  %40 = load i32, ptr %39, align 4
  store i32 %40, ptr %7, align 4
  %41 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %41) #7
  %42 = load i32, ptr %7, align 4
  store i32 %42, ptr %3, align 4
  br label %43

43:                                               ; preds = %37, %18, %10
  %44 = load i32, ptr %3, align 4
  ret i32 %44
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_64_malloc_nested_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %10 = load i32, ptr %5, align 4
  %11 = icmp sle i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  store i32 -1, ptr %4, align 4
  br label %56

13:                                               ; preds = %3
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16) #6
  store ptr %17, ptr %8, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %13
  store i32 -2, ptr %4, align 4
  br label %56

21:                                               ; preds = %13
  %22 = load i32, ptr %6, align 4
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds i32, ptr %23, i64 0
  store i32 %22, ptr %24, align 4
  %25 = load i32, ptr %6, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %43

27:                                               ; preds = %21
  %28 = load i32, ptr %7, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %36

30:                                               ; preds = %27
  %31 = load i32, ptr %7, align 4
  %32 = load ptr, ptr %8, align 8
  %33 = getelementptr inbounds i32, ptr %32, i64 0
  %34 = load i32, ptr %33, align 4
  %35 = add nsw i32 %34, %31
  store i32 %35, ptr %33, align 4
  br label %42

36:                                               ; preds = %27
  %37 = load i32, ptr %7, align 4
  %38 = load ptr, ptr %8, align 8
  %39 = getelementptr inbounds i32, ptr %38, i64 0
  %40 = load i32, ptr %39, align 4
  %41 = sub nsw i32 %40, %37
  store i32 %41, ptr %39, align 4
  br label %42

42:                                               ; preds = %36, %30
  br label %50

43:                                               ; preds = %21
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr inbounds i32, ptr %44, i64 0
  %46 = load i32, ptr %45, align 4
  %47 = sub nsw i32 0, %46
  %48 = load ptr, ptr %8, align 8
  %49 = getelementptr inbounds i32, ptr %48, i64 0
  store i32 %47, ptr %49, align 4
  br label %50

50:                                               ; preds = %43, %42
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 0
  %53 = load i32, ptr %52, align 4
  store i32 %53, ptr %9, align 4
  %54 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %54) #7
  %55 = load i32, ptr %9, align 4
  store i32 %55, ptr %4, align 4
  br label %56

56:                                               ; preds = %50, %20, %12
  %57 = load i32, ptr %4, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_65_void_if(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr @g_void_result, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr @g_void_result, align 4
  br label %9

9:                                                ; preds = %5, %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_66_void_if_else(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %10

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = mul nsw i32 %6, 2
  %8 = load i32, ptr @g_void_result, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_void_result, align 4
  br label %14

10:                                               ; preds = %1
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr @g_void_result, align 4
  %13 = sub nsw i32 %12, %11
  store i32 %13, ptr @g_void_result, align 4
  br label %14

14:                                               ; preds = %10, %5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_nested(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %23

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %11, %12
  %14 = load i32, ptr @g_void_result, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr @g_void_result, align 4
  br label %22

16:                                               ; preds = %7
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %17, %18
  %20 = load i32, ptr @g_void_result, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr @g_void_result, align 4
  br label %22

22:                                               ; preds = %16, %10
  br label %27

23:                                               ; preds = %2
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr @g_void_result, align 4
  %26 = sub nsw i32 %25, %24
  store i32 %26, ptr @g_void_result, align 4
  br label %27

27:                                               ; preds = %23, %22
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %3
  %10 = load i32, ptr %5, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %15, label %12

12:                                               ; preds = %9, %3
  %13 = load i32, ptr %6, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %23

15:                                               ; preds = %12, %9
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr @g_void_result, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr @g_void_result, align 4
  br label %31

23:                                               ; preds = %12
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr @g_void_result, align 4
  %30 = sub nsw i32 %29, %28
  store i32 %30, ptr @g_void_result, align 4
  br label %31

31:                                               ; preds = %23, %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_69_void_global_only() #0 {
  %1 = load i32, ptr @g_x, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %10

3:                                                ; preds = %0
  %4 = load i32, ptr @g_y, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %3
  %7 = load i32, ptr @g_x, align 4
  %8 = load i32, ptr @g_void_result, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_void_result, align 4
  br label %14

10:                                               ; preds = %3, %0
  %11 = load i32, ptr @g_z, align 4
  %12 = load i32, ptr @g_void_result, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr @g_void_result, align 4
  br label %14

14:                                               ; preds = %10, %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_70_void_pointer(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = mul nsw i32 %8, 2
  %10 = load ptr, ptr %3, align 8
  store i32 %9, ptr %10, align 4
  br label %15

11:                                               ; preds = %2
  %12 = load i32, ptr %4, align 4
  %13 = sub nsw i32 %12, 2
  %14 = load ptr, ptr %3, align 8
  store i32 %13, ptr %14, align 4
  br label %15

15:                                               ; preds = %11, %7
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %16, align 4
  %18 = load i32, ptr @g_void_result, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr @g_void_result, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_71_void_array(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = icmp sge i32 %5, 0
  br i1 %6, label %7, label %15

7:                                                ; preds = %2
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 8
  br i1 %9, label %10, label %15

10:                                               ; preds = %7
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %13
  store i32 %11, ptr %14, align 4
  br label %15

15:                                               ; preds = %10, %7, %2
  %16 = load i32, ptr %3, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %28

18:                                               ; preds = %15
  %19 = load i32, ptr %3, align 4
  %20 = icmp slt i32 %19, 8
  br i1 %20, label %21, label %28

21:                                               ; preds = %18
  %22 = load i32, ptr %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr @g_void_result, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr @g_void_result, align 4
  br label %28

28:                                               ; preds = %21, %18, %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_72_complex_control_flow(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %11 = load i32, ptr @g_x, align 4
  store i32 %11, ptr %10, align 4
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %9, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %15, label %65

15:                                               ; preds = %4
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %10, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %10, align 4
  %19 = load i32, ptr %7, align 4
  %20 = icmp sge i32 %19, 0
  br i1 %20, label %21, label %61

21:                                               ; preds = %15
  %22 = load i32, ptr %7, align 4
  %23 = icmp slt i32 %22, 8
  br i1 %23, label %24, label %61

24:                                               ; preds = %21
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %53

30:                                               ; preds = %24
  %31 = load i32, ptr %7, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr %10, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %10, align 4
  %37 = load ptr, ptr %6, align 8
  %38 = load i32, ptr %37, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %43, label %40

40:                                               ; preds = %30
  %41 = load i32, ptr @g_y, align 4
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %43, label %48

43:                                               ; preds = %40, %30
  %44 = load i32, ptr %10, align 4
  %45 = load ptr, ptr %6, align 8
  %46 = load i32, ptr %45, align 4
  %47 = add nsw i32 %44, %46
  store i32 %47, ptr %5, align 4
  br label %101

48:                                               ; preds = %40
  %49 = load i32, ptr %10, align 4
  %50 = load ptr, ptr %6, align 8
  %51 = load i32, ptr %50, align 4
  %52 = sub nsw i32 %49, %51
  store i32 %52, ptr %5, align 4
  br label %101

53:                                               ; preds = %24
  %54 = load i32, ptr %7, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = load i32, ptr %10, align 4
  %59 = sub nsw i32 %58, %57
  store i32 %59, ptr %10, align 4
  br label %60

60:                                               ; preds = %53
  br label %64

61:                                               ; preds = %21, %15
  %62 = load i32, ptr %10, align 4
  %63 = add nsw i32 %62, 100
  store i32 %63, ptr %10, align 4
  br label %64

64:                                               ; preds = %61, %60
  br label %99

65:                                               ; preds = %4
  %66 = load i32, ptr %8, align 4
  %67 = load i32, ptr %9, align 4
  %68 = icmp eq i32 %66, %67
  br i1 %68, label %69, label %83

69:                                               ; preds = %65
  %70 = load i32, ptr @g_z, align 4
  %71 = load i32, ptr %10, align 4
  %72 = add nsw i32 %71, %70
  store i32 %72, ptr %10, align 4
  %73 = load ptr, ptr %6, align 8
  %74 = load i32, ptr %73, align 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %78

76:                                               ; preds = %69
  %77 = load i32, ptr %10, align 4
  store i32 %77, ptr %5, align 4
  br label %101

78:                                               ; preds = %69
  %79 = load i32, ptr %10, align 4
  %80 = load ptr, ptr %6, align 8
  %81 = load i32, ptr %80, align 4
  %82 = add nsw i32 %79, %81
  store i32 %82, ptr %5, align 4
  br label %101

83:                                               ; preds = %65
  %84 = load i32, ptr %9, align 4
  %85 = load i32, ptr %10, align 4
  %86 = sub nsw i32 %85, %84
  store i32 %86, ptr %10, align 4
  %87 = load i32, ptr %8, align 4
  %88 = load i32, ptr %9, align 4
  %89 = add nsw i32 %87, %88
  %90 = load i32, ptr @g_x, align 4
  %91 = add nsw i32 %90, 1
  %92 = icmp sgt i32 %89, %91
  br i1 %92, label %93, label %96

93:                                               ; preds = %83
  %94 = load i32, ptr %10, align 4
  %95 = mul nsw i32 %94, 2
  store i32 %95, ptr %5, align 4
  br label %101

96:                                               ; preds = %83
  %97 = load i32, ptr %10, align 4
  %98 = sdiv i32 %97, 2
  store i32 %98, ptr %5, align 4
  br label %101

99:                                               ; preds = %64
  %100 = load i32, ptr %10, align 4
  store i32 %100, ptr %5, align 4
  br label %101

101:                                              ; preds = %99, %96, %93, %78, %76, %48, %43
  %102 = load i32, ptr %5, align 4
  ret i32 %102
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_73_complex_merge(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %10 = load i32, ptr %5, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %30

12:                                               ; preds = %3
  %13 = load i32, ptr %6, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %30

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %8, align 4
  %19 = load i32, ptr %7, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %25

21:                                               ; preds = %15
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %8, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %9, align 4
  br label %29

25:                                               ; preds = %15
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %8, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, ptr %9, align 4
  br label %29

29:                                               ; preds = %25, %21
  br label %48

30:                                               ; preds = %12, %3
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %6, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %8, align 4
  %34 = load i32, ptr %7, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %40, label %36

36:                                               ; preds = %30
  %37 = load i32, ptr %5, align 4
  %38 = load i32, ptr %6, align 4
  %39 = icmp eq i32 %37, %38
  br i1 %39, label %40, label %43

40:                                               ; preds = %36, %30
  %41 = load i32, ptr %8, align 4
  %42 = mul nsw i32 %41, 2
  store i32 %42, ptr %9, align 4
  br label %47

43:                                               ; preds = %36
  %44 = load i32, ptr %8, align 4
  %45 = load i32, ptr %7, align 4
  %46 = sub nsw i32 %44, %45
  store i32 %46, ptr %9, align 4
  br label %47

47:                                               ; preds = %43, %40
  br label %48

48:                                               ; preds = %47, %29
  %49 = load i32, ptr %9, align 4
  %50 = icmp sgt i32 %49, 20
  br i1 %50, label %51, label %54

51:                                               ; preds = %48
  %52 = load i32, ptr %9, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %4, align 4
  br label %63

54:                                               ; preds = %48
  %55 = load i32, ptr %9, align 4
  %56 = icmp sgt i32 %55, 10
  br i1 %56, label %57, label %60

57:                                               ; preds = %54
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %58, 2
  store i32 %59, ptr %4, align 4
  br label %63

60:                                               ; preds = %54
  %61 = load i32, ptr %9, align 4
  %62 = add nsw i32 %61, 3
  store i32 %62, ptr %4, align 4
  br label %63

63:                                               ; preds = %60, %57, %51
  %64 = load i32, ptr %4, align 4
  ret i32 %64
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_74_if_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  %13 = load i32, ptr %9, align 4
  %14 = load i32, ptr @g_x, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %12, align 4
  %16 = load i32, ptr %9, align 4
  %17 = load i32, ptr %10, align 4
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %19, label %22

19:                                               ; preds = %5
  %20 = load i32, ptr %11, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %29, label %22

22:                                               ; preds = %19, %5
  %23 = load i32, ptr %10, align 4
  %24 = load i32, ptr %11, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %26, label %90

26:                                               ; preds = %22
  %27 = load i32, ptr %9, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %90

29:                                               ; preds = %26, %19
  %30 = load i32, ptr %12, align 4
  %31 = add nsw i32 %30, 10
  store i32 %31, ptr %12, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp sge i32 %32, 0
  br i1 %33, label %34, label %86

34:                                               ; preds = %29
  %35 = load i32, ptr %8, align 4
  %36 = icmp slt i32 %35, 8
  br i1 %36, label %37, label %86

37:                                               ; preds = %34
  %38 = load i32, ptr %8, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = load i32, ptr %12, align 4
  %43 = icmp sgt i32 %41, %42
  br i1 %43, label %44, label %65

44:                                               ; preds = %37
  %45 = load i32, ptr %8, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = load i32, ptr %12, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %12, align 4
  %51 = load ptr, ptr %7, align 8
  %52 = load i32, ptr %51, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %59

54:                                               ; preds = %44
  %55 = load ptr, ptr %7, align 8
  %56 = load i32, ptr %55, align 4
  %57 = load i32, ptr %12, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, ptr %12, align 4
  br label %64

59:                                               ; preds = %44
  %60 = load ptr, ptr %7, align 8
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %12, align 4
  %63 = sub nsw i32 %62, %61
  store i32 %63, ptr %12, align 4
  br label %64

64:                                               ; preds = %59, %54
  br label %85

65:                                               ; preds = %37
  %66 = load i32, ptr %8, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = load i32, ptr %12, align 4
  %71 = sub nsw i32 %70, %69
  store i32 %71, ptr %12, align 4
  %72 = load i32, ptr %8, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %73
  %75 = load i32, ptr %74, align 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %81, label %77

77:                                               ; preds = %65
  %78 = load ptr, ptr %7, align 8
  %79 = load i32, ptr %78, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %84

81:                                               ; preds = %77, %65
  %82 = load i32, ptr %12, align 4
  %83 = add nsw i32 %82, 50
  store i32 %83, ptr %12, align 4
  br label %84

84:                                               ; preds = %81, %77
  br label %85

85:                                               ; preds = %84, %64
  br label %89

86:                                               ; preds = %34, %29
  %87 = load i32, ptr %12, align 4
  %88 = sub nsw i32 %87, 20
  store i32 %88, ptr %12, align 4
  br label %89

89:                                               ; preds = %86, %85
  br label %113

90:                                               ; preds = %26, %22
  %91 = load i32, ptr %12, align 4
  %92 = sub nsw i32 %91, 10
  store i32 %92, ptr %12, align 4
  %93 = load i32, ptr %12, align 4
  %94 = load i32, ptr @g_z, align 4
  %95 = icmp sgt i32 %93, %94
  br i1 %95, label %96, label %112

96:                                               ; preds = %90
  %97 = load i32, ptr %9, align 4
  %98 = load i32, ptr %10, align 4
  %99 = load i32, ptr %11, align 4
  %100 = sdiv i32 %99, 10
  %101 = load i32, ptr %9, align 4
  %102 = sub nsw i32 %101, 1
  %103 = mul nsw i32 %100, %102
  %104 = add nsw i32 %98, %103
  %105 = icmp eq i32 %97, %104
  br i1 %105, label %106, label %109

106:                                              ; preds = %96
  %107 = load i32, ptr %12, align 4
  %108 = add nsw i32 %107, 100
  store i32 %108, ptr %6, align 4
  br label %124

109:                                              ; preds = %96
  %110 = load i32, ptr %12, align 4
  %111 = add nsw i32 %110, 200
  store i32 %111, ptr %6, align 4
  br label %124

112:                                              ; preds = %90
  br label %113

113:                                              ; preds = %112, %89
  %114 = load i32, ptr %12, align 4
  %115 = icmp sgt i32 %114, 0
  br i1 %115, label %116, label %119

116:                                              ; preds = %113
  %117 = load i32, ptr %12, align 4
  %118 = mul nsw i32 %117, 2
  br label %122

119:                                              ; preds = %113
  %120 = load i32, ptr %12, align 4
  %121 = sub nsw i32 0, %120
  br label %122

122:                                              ; preds = %119, %116
  %123 = phi i32 [ %118, %116 ], [ %121, %119 ]
  store i32 %123, ptr %6, align 4
  br label %124

124:                                              ; preds = %122, %109, %106
  %125 = load i32, ptr %6, align 4
  ret i32 %125
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
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %17

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 1
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 @atoi(ptr noundef %15) #8
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %12
  %19 = phi i32 [ %16, %12 ], [ 4, %17 ]
  store i32 %19, ptr %6, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp sgt i32 %20, 2
  br i1 %21, label %22, label %27

22:                                               ; preds = %18
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds ptr, ptr %23, i64 2
  %25 = load ptr, ptr %24, align 8
  %26 = call i32 @atoi(ptr noundef %25) #8
  br label %28

27:                                               ; preds = %18
  br label %28

28:                                               ; preds = %27, %22
  %29 = phi i32 [ %26, %22 ], [ -1, %27 ]
  store i32 %29, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %30 = load i32, ptr %6, align 4
  %31 = call i32 @_00_if_only(i32 noundef %30)
  %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %8, align 4
  %34 = load i32, ptr %6, align 4
  %35 = call i32 @_01_if_else(i32 noundef %34)
  %36 = load i32, ptr %8, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, ptr %8, align 4
  %38 = load i32, ptr %6, align 4
  %39 = call i32 @_02_if_with_surrounding_code(i32 noundef %38)
  %40 = load i32, ptr %8, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %8, align 4
  %42 = load i32, ptr %6, align 4
  %43 = call i32 @_03_if_compound(i32 noundef %42)
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, ptr %8, align 4
  %46 = load i32, ptr %6, align 4
  %47 = call i32 @_04_if_else_compound(i32 noundef %46)
  %48 = load i32, ptr %8, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %8, align 4
  %50 = load i32, ptr %7, align 4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %28
  %53 = load i32, ptr %8, align 4
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %53)
  store i32 0, ptr %3, align 4
  br label %408

55:                                               ; preds = %28
  %56 = load i32, ptr %6, align 4
  %57 = call i32 @_05_if_equal(i32 noundef %56, i32 noundef 4)
  %58 = load i32, ptr %8, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %8, align 4
  %60 = load i32, ptr %6, align 4
  %61 = call i32 @_06_if_not_equal(i32 noundef %60, i32 noundef 4)
  %62 = load i32, ptr %8, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %8, align 4
  %64 = load i32, ptr %6, align 4
  %65 = call i32 @_07_relational(i32 noundef %64, i32 noundef 4)
  %66 = load i32, ptr %8, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %8, align 4
  %68 = load i32, ptr %6, align 4
  %69 = icmp sgt i32 %68, 0
  %70 = load i32, ptr %6, align 4
  %71 = call i32 @_08_boolean_argument(i1 noundef zeroext %69, i32 noundef %70)
  %72 = load i32, ptr %8, align 4
  %73 = add nsw i32 %72, %71
  store i32 %73, ptr %8, align 4
  %74 = load i32, ptr %7, align 4
  %75 = icmp eq i32 %74, 1
  br i1 %75, label %76, label %79

76:                                               ; preds = %55
  %77 = load i32, ptr %8, align 4
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %77)
  store i32 0, ptr %3, align 4
  br label %408

79:                                               ; preds = %55
  %80 = load i32, ptr %6, align 4
  %81 = call i32 @_09_if_elseif_else(i32 noundef %80)
  %82 = load i32, ptr %8, align 4
  %83 = add nsw i32 %82, %81
  store i32 %83, ptr %8, align 4
  %84 = load i32, ptr %6, align 4
  %85 = call i32 @_10_multiple_elseif(i32 noundef %84)
  %86 = load i32, ptr %8, align 4
  %87 = add nsw i32 %86, %85
  store i32 %87, ptr %8, align 4
  %88 = load i32, ptr %6, align 4
  %89 = call i32 @_11_elseif_expressions(i32 noundef %88, i32 noundef 4)
  %90 = load i32, ptr %8, align 4
  %91 = add nsw i32 %90, %89
  store i32 %91, ptr %8, align 4
  %92 = load i32, ptr %7, align 4
  %93 = icmp eq i32 %92, 2
  br i1 %93, label %94, label %97

94:                                               ; preds = %79
  %95 = load i32, ptr %8, align 4
  %96 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %95)
  store i32 0, ptr %3, align 4
  br label %408

97:                                               ; preds = %79
  %98 = load i32, ptr %6, align 4
  %99 = call i32 @_12_and(i32 noundef %98, i32 noundef 3)
  %100 = load i32, ptr %8, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, ptr %8, align 4
  %102 = load i32, ptr %6, align 4
  %103 = call i32 @_13_or(i32 noundef %102, i32 noundef -3)
  %104 = load i32, ptr %8, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, ptr %8, align 4
  %106 = load i32, ptr %6, align 4
  %107 = call i32 @_14_and_or(i32 noundef %106, i32 noundef 2, i32 noundef -1)
  %108 = load i32, ptr %8, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %8, align 4
  %110 = load i32, ptr %6, align 4
  %111 = call i32 @_15_or_and(i32 noundef %110, i32 noundef 0, i32 noundef 20)
  %112 = load i32, ptr %8, align 4
  %113 = add nsw i32 %112, %111
  store i32 %113, ptr %8, align 4
  %114 = load i32, ptr %6, align 4
  %115 = call i32 @_16_complex_boolean(i32 noundef %114, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %116 = load i32, ptr %8, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, ptr %8, align 4
  %118 = load i32, ptr %7, align 4
  %119 = icmp eq i32 %118, 3
  br i1 %119, label %120, label %123

120:                                              ; preds = %97
  %121 = load i32, ptr %8, align 4
  %122 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %121)
  store i32 0, ptr %3, align 4
  br label %408

123:                                              ; preds = %97
  %124 = load i32, ptr %6, align 4
  %125 = call i32 @_17_nested_arithmetic_condition(i32 noundef %124, i32 noundef 1, i32 noundef 20)
  %126 = load i32, ptr %8, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, ptr %8, align 4
  %128 = load i32, ptr %6, align 4
  %129 = call i32 @_18_deep_parentheses(i32 noundef %128, i32 noundef 2, i32 noundef 3)
  %130 = load i32, ptr %8, align 4
  %131 = add nsw i32 %130, %129
  store i32 %131, ptr %8, align 4
  %132 = load i32, ptr %6, align 4
  %133 = call i32 @_19_arithmetic_boolean(i32 noundef %132, i32 noundef 2, i32 noundef 5)
  %134 = load i32, ptr %8, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, ptr %8, align 4
  %136 = load i32, ptr %6, align 4
  %137 = call i32 @_20_nested_boolean_parentheses(i32 noundef %136, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %138 = load i32, ptr %8, align 4
  %139 = add nsw i32 %138, %137
  store i32 %139, ptr %8, align 4
  %140 = load i32, ptr %7, align 4
  %141 = icmp eq i32 %140, 4
  br i1 %141, label %142, label %145

142:                                              ; preds = %123
  %143 = load i32, ptr %8, align 4
  %144 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %143)
  store i32 0, ptr %3, align 4
  br label %408

145:                                              ; preds = %123
  %146 = load i32, ptr %6, align 4
  %147 = call i32 @_21_nested_if(i32 noundef %146, i32 noundef 3)
  %148 = load i32, ptr %8, align 4
  %149 = add nsw i32 %148, %147
  store i32 %149, ptr %8, align 4
  %150 = load i32, ptr %6, align 4
  %151 = call i32 @_22_nested_in_else(i32 noundef %150, i32 noundef 3)
  %152 = load i32, ptr %8, align 4
  %153 = add nsw i32 %152, %151
  store i32 %153, ptr %8, align 4
  %154 = load i32, ptr %6, align 4
  %155 = call i32 @_23_nested_if_else(i32 noundef %154, i32 noundef 3, i32 noundef 5)
  %156 = load i32, ptr %8, align 4
  %157 = add nsw i32 %156, %155
  store i32 %157, ptr %8, align 4
  %158 = load i32, ptr %6, align 4
  %159 = call i32 @_24_three_level_nesting(i32 noundef %158, i32 noundef 3, i32 noundef 5)
  %160 = load i32, ptr %8, align 4
  %161 = add nsw i32 %160, %159
  store i32 %161, ptr %8, align 4
  %162 = load i32, ptr %6, align 4
  %163 = call i32 @_25_deep_nested_values(i32 noundef %162, i32 noundef 3, i32 noundef 10)
  %164 = load i32, ptr %8, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %8, align 4
  %166 = load i32, ptr %6, align 4
  %167 = call i32 @_26_nested_and(i32 noundef %166, i32 noundef 3, i32 noundef 5)
  %168 = load i32, ptr %8, align 4
  %169 = add nsw i32 %168, %167
  store i32 %169, ptr %8, align 4
  %170 = load i32, ptr %6, align 4
  %171 = call i32 @_27_nested_or(i32 noundef %170, i32 noundef 0, i32 noundef 20)
  %172 = load i32, ptr %8, align 4
  %173 = add nsw i32 %172, %171
  store i32 %173, ptr %8, align 4
  %174 = load i32, ptr %6, align 4
  %175 = call i32 @_28_nested_complex_boolean(i32 noundef %174, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %176 = load i32, ptr %8, align 4
  %177 = add nsw i32 %176, %175
  store i32 %177, ptr %8, align 4
  %178 = load i32, ptr %7, align 4
  %179 = icmp eq i32 %178, 5
  br i1 %179, label %180, label %183

180:                                              ; preds = %145
  %181 = load i32, ptr %8, align 4
  %182 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %181)
  store i32 0, ptr %3, align 4
  br label %408

183:                                              ; preds = %145
  %184 = load i32, ptr %6, align 4
  %185 = call i32 @_29_independent_ifs(i32 noundef %184)
  %186 = load i32, ptr %8, align 4
  %187 = add nsw i32 %186, %185
  store i32 %187, ptr %8, align 4
  %188 = load i32, ptr %6, align 4
  %189 = call i32 @_30_independent_if_else(i32 noundef %188, i32 noundef 3)
  %190 = load i32, ptr %8, align 4
  %191 = add nsw i32 %190, %189
  store i32 %191, ptr %8, align 4
  %192 = load i32, ptr %7, align 4
  %193 = icmp eq i32 %192, 6
  br i1 %193, label %194, label %197

194:                                              ; preds = %183
  %195 = load i32, ptr %8, align 4
  %196 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %195)
  store i32 0, ptr %3, align 4
  br label %408

197:                                              ; preds = %183
  %198 = call i32 @_31_array_condition(i32 noundef 1)
  %199 = load i32, ptr %8, align 4
  %200 = add nsw i32 %199, %198
  store i32 %200, ptr %8, align 4
  %201 = call i32 @_32_array_branches(i32 noundef 2)
  %202 = load i32, ptr %8, align 4
  %203 = add nsw i32 %202, %201
  store i32 %203, ptr %8, align 4
  %204 = call i32 @_33_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %205 = load i32, ptr %8, align 4
  %206 = add nsw i32 %205, %204
  store i32 %206, ptr %8, align 4
  %207 = call i32 @_34_matrix_condition(i32 noundef 1, i32 noundef 1)
  %208 = load i32, ptr %8, align 4
  %209 = add nsw i32 %208, %207
  store i32 %209, ptr %8, align 4
  %210 = call i32 @_35_nested_array(i32 noundef 1, i32 noundef 2)
  %211 = load i32, ptr %8, align 4
  %212 = add nsw i32 %211, %210
  store i32 %212, ptr %8, align 4
  %213 = load i32, ptr %7, align 4
  %214 = icmp eq i32 %213, 7
  br i1 %214, label %215, label %218

215:                                              ; preds = %197
  %216 = load i32, ptr %8, align 4
  %217 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %216)
  store i32 0, ptr %3, align 4
  br label %408

218:                                              ; preds = %197
  %219 = load i32, ptr %6, align 4
  store i32 %219, ptr %9, align 4
  %220 = call i32 @_36_pointer_condition(ptr noundef %9)
  %221 = load i32, ptr %8, align 4
  %222 = add nsw i32 %221, %220
  store i32 %222, ptr %8, align 4
  %223 = call i32 @_37_pointer_branches(ptr noundef %9)
  %224 = load i32, ptr %8, align 4
  %225 = add nsw i32 %224, %223
  store i32 %225, ptr %8, align 4
  %226 = call i32 @_38_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %227 = load i32, ptr %8, align 4
  %228 = add nsw i32 %227, %226
  store i32 %228, ptr %8, align 4
  %229 = call i32 @_39_nested_pointer(ptr noundef %9, i32 noundef 3)
  %230 = load i32, ptr %8, align 4
  %231 = add nsw i32 %230, %229
  store i32 %231, ptr %8, align 4
  %232 = load i32, ptr %6, align 4
  store i32 %232, ptr %9, align 4
  %233 = load i32, ptr %6, align 4
  %234 = call i32 @_40_pointer_write(ptr noundef %9, i32 noundef %233)
  %235 = load i32, ptr %8, align 4
  %236 = add nsw i32 %235, %234
  store i32 %236, ptr %8, align 4
  %237 = load i32, ptr %6, align 4
  store i32 %237, ptr %9, align 4
  %238 = load i32, ptr %6, align 4
  %239 = call i32 @_41_pointer_write_nested(ptr noundef %9, i32 noundef %238, i32 noundef 3)
  %240 = load i32, ptr %8, align 4
  %241 = add nsw i32 %240, %239
  store i32 %241, ptr %8, align 4
  %242 = load i32, ptr %7, align 4
  %243 = icmp eq i32 %242, 8
  br i1 %243, label %244, label %247

244:                                              ; preds = %218
  %245 = load i32, ptr %8, align 4
  %246 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %245)
  store i32 0, ptr %3, align 4
  br label %408

247:                                              ; preds = %218
  %248 = load i32, ptr %6, align 4
  store i32 %248, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %249 = call i32 @_42_global_only()
  %250 = load i32, ptr %8, align 4
  %251 = add nsw i32 %250, %249
  store i32 %251, ptr %8, align 4
  %252 = call i32 @_43_global_and()
  %253 = load i32, ptr %8, align 4
  %254 = add nsw i32 %253, %252
  store i32 %254, ptr %8, align 4
  %255 = call i32 @_44_global_or()
  %256 = load i32, ptr %8, align 4
  %257 = add nsw i32 %256, %255
  store i32 %257, ptr %8, align 4
  %258 = call i32 @_45_global_nested()
  %259 = load i32, ptr %8, align 4
  %260 = add nsw i32 %259, %258
  store i32 %260, ptr %8, align 4
  %261 = call i32 @_46_global_array_only()
  %262 = load i32, ptr %8, align 4
  %263 = add nsw i32 %262, %261
  store i32 %263, ptr %8, align 4
  %264 = call i32 @_47_global_matrix_only()
  %265 = load i32, ptr %8, align 4
  %266 = add nsw i32 %265, %264
  store i32 %266, ptr %8, align 4
  %267 = load i32, ptr %7, align 4
  %268 = icmp eq i32 %267, 9
  br i1 %268, label %269, label %272

269:                                              ; preds = %247
  %270 = load i32, ptr %8, align 4
  %271 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %270)
  store i32 0, ptr %3, align 4
  br label %408

272:                                              ; preds = %247
  %273 = load i32, ptr %6, align 4
  %274 = call i32 @_48_multiple_returns(i32 noundef %273)
  %275 = load i32, ptr %8, align 4
  %276 = add nsw i32 %275, %274
  store i32 %276, ptr %8, align 4
  %277 = load i32, ptr %6, align 4
  %278 = call i32 @_49_nested_multiple_returns(i32 noundef %277, i32 noundef 3)
  %279 = load i32, ptr %8, align 4
  %280 = add nsw i32 %279, %278
  store i32 %280, ptr %8, align 4
  %281 = load i32, ptr %6, align 4
  %282 = call i32 @_50_complex_multiple_returns(i32 noundef %281, i32 noundef 3, i32 noundef 5)
  %283 = load i32, ptr %8, align 4
  %284 = add nsw i32 %283, %282
  store i32 %284, ptr %8, align 4
  %285 = load i32, ptr %7, align 4
  %286 = icmp eq i32 %285, 10
  br i1 %286, label %287, label %290

287:                                              ; preds = %272
  %288 = load i32, ptr %8, align 4
  %289 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %288)
  store i32 0, ptr %3, align 4
  br label %408

290:                                              ; preds = %272
  %291 = load i32, ptr %6, align 4
  %292 = call i32 @_51_prefix_code(i32 noundef %291, i32 noundef 2, i32 noundef 3)
  %293 = load i32, ptr %8, align 4
  %294 = add nsw i32 %293, %292
  store i32 %294, ptr %8, align 4
  %295 = load i32, ptr %6, align 4
  %296 = call i32 @_52_suffix_code(i32 noundef %295, i32 noundef 3)
  %297 = load i32, ptr %8, align 4
  %298 = add nsw i32 %297, %296
  store i32 %298, ptr %8, align 4
  %299 = load i32, ptr %6, align 4
  %300 = call i32 @_53_prefix_nested_suffix(i32 noundef %299, i32 noundef 3, i32 noundef 5)
  %301 = load i32, ptr %8, align 4
  %302 = add nsw i32 %301, %300
  store i32 %302, ptr %8, align 4
  %303 = load i32, ptr %7, align 4
  %304 = icmp eq i32 %303, 11
  br i1 %304, label %305, label %308

305:                                              ; preds = %290
  %306 = load i32, ptr %8, align 4
  %307 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %306)
  store i32 0, ptr %3, align 4
  br label %408

308:                                              ; preds = %290
  %309 = load i32, ptr %6, align 4
  %310 = call i32 @_54_diamond(i32 noundef %309, i32 noundef 3)
  %311 = load i32, ptr %8, align 4
  %312 = add nsw i32 %311, %310
  store i32 %312, ptr %8, align 4
  %313 = load i32, ptr %6, align 4
  %314 = call i32 @_55_multiple_merge_values(i32 noundef %313, i32 noundef 3)
  %315 = load i32, ptr %8, align 4
  %316 = add nsw i32 %315, %314
  store i32 %316, ptr %8, align 4
  %317 = load i32, ptr %6, align 4
  %318 = call i32 @_56_nested_diamonds(i32 noundef %317, i32 noundef 3, i32 noundef 5)
  %319 = load i32, ptr %8, align 4
  %320 = add nsw i32 %319, %318
  store i32 %320, ptr %8, align 4
  %321 = load i32, ptr %7, align 4
  %322 = icmp eq i32 %321, 12
  br i1 %322, label %323, label %326

323:                                              ; preds = %308
  %324 = load i32, ptr %8, align 4
  %325 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %324)
  store i32 0, ptr %3, align 4
  br label %408

326:                                              ; preds = %308
  %327 = load i32, ptr %6, align 4
  %328 = call i32 @_57_ternary_before_if(i32 noundef %327, i32 noundef 3)
  %329 = load i32, ptr %8, align 4
  %330 = add nsw i32 %329, %328
  store i32 %330, ptr %8, align 4
  %331 = load i32, ptr %6, align 4
  %332 = call i32 @_58_ternary_inside_if(i32 noundef %331, i32 noundef 3)
  %333 = load i32, ptr %8, align 4
  %334 = add nsw i32 %333, %332
  store i32 %334, ptr %8, align 4
  %335 = load i32, ptr %6, align 4
  %336 = call i32 @_59_nested_ternary_if(i32 noundef %335, i32 noundef 3, i32 noundef 5)
  %337 = load i32, ptr %8, align 4
  %338 = add nsw i32 %337, %336
  store i32 %338, ptr %8, align 4
  %339 = load i32, ptr %7, align 4
  %340 = icmp eq i32 %339, 13
  br i1 %340, label %341, label %344

341:                                              ; preds = %326
  %342 = load i32, ptr %8, align 4
  %343 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %342)
  store i32 0, ptr %3, align 4
  br label %408

344:                                              ; preds = %326
  %345 = load i32, ptr %6, align 4
  %346 = call i32 @_60_dynamic_alloca(i32 noundef 4, i32 noundef %345)
  %347 = load i32, ptr %8, align 4
  %348 = add nsw i32 %347, %346
  store i32 %348, ptr %8, align 4
  %349 = load i32, ptr %6, align 4
  %350 = call i32 @_61_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %349)
  %351 = load i32, ptr %8, align 4
  %352 = add nsw i32 %351, %350
  store i32 %352, ptr %8, align 4
  %353 = load i32, ptr %6, align 4
  %354 = call i32 @_62_dynamic_alloca_complex(i32 noundef 6, i32 noundef %353, i32 noundef 3)
  %355 = load i32, ptr %8, align 4
  %356 = add nsw i32 %355, %354
  store i32 %356, ptr %8, align 4
  %357 = load i32, ptr %7, align 4
  %358 = icmp eq i32 %357, 14
  br i1 %358, label %359, label %362

359:                                              ; preds = %344
  %360 = load i32, ptr %8, align 4
  %361 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %360)
  store i32 0, ptr %3, align 4
  br label %408

362:                                              ; preds = %344
  %363 = load i32, ptr %6, align 4
  %364 = call i32 @_63_malloc_if(i32 noundef 4, i32 noundef %363)
  %365 = load i32, ptr %8, align 4
  %366 = add nsw i32 %365, %364
  store i32 %366, ptr %8, align 4
  %367 = load i32, ptr %6, align 4
  %368 = call i32 @_64_malloc_nested_if(i32 noundef 4, i32 noundef %367, i32 noundef 3)
  %369 = load i32, ptr %8, align 4
  %370 = add nsw i32 %369, %368
  store i32 %370, ptr %8, align 4
  %371 = load i32, ptr %7, align 4
  %372 = icmp eq i32 %371, 15
  br i1 %372, label %373, label %376

373:                                              ; preds = %362
  %374 = load i32, ptr %8, align 4
  %375 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %374)
  store i32 0, ptr %3, align 4
  br label %408

376:                                              ; preds = %362
  store i32 0, ptr @g_void_result, align 4
  %377 = load i32, ptr %6, align 4
  call void @_65_void_if(i32 noundef %377)
  %378 = load i32, ptr %6, align 4
  call void @_66_void_if_else(i32 noundef %378)
  %379 = load i32, ptr %6, align 4
  call void @_67_void_nested(i32 noundef %379, i32 noundef 3)
  %380 = load i32, ptr %6, align 4
  call void @_68_void_complex(i32 noundef %380, i32 noundef 3, i32 noundef 0)
  call void @_69_void_global_only()
  %381 = load i32, ptr %6, align 4
  store i32 %381, ptr %9, align 4
  %382 = load i32, ptr %6, align 4
  call void @_70_void_pointer(ptr noundef %9, i32 noundef %382)
  %383 = load i32, ptr %6, align 4
  call void @_71_void_array(i32 noundef 1, i32 noundef %383)
  %384 = load i32, ptr %7, align 4
  %385 = icmp eq i32 %384, 16
  br i1 %385, label %386, label %389

386:                                              ; preds = %376
  %387 = load i32, ptr %8, align 4
  %388 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %387)
  store i32 0, ptr %3, align 4
  br label %408

389:                                              ; preds = %376
  %390 = load i32, ptr @g_void_result, align 4
  %391 = load i32, ptr %8, align 4
  %392 = add nsw i32 %391, %390
  store i32 %392, ptr %8, align 4
  %393 = load i32, ptr %6, align 4
  store i32 %393, ptr %9, align 4
  %394 = load i32, ptr %6, align 4
  %395 = call i32 @_72_complex_control_flow(ptr noundef %9, i32 noundef 1, i32 noundef %394, i32 noundef 3)
  %396 = load i32, ptr %8, align 4
  %397 = add nsw i32 %396, %395
  store i32 %397, ptr %8, align 4
  %398 = load i32, ptr %6, align 4
  %399 = call i32 @_73_complex_merge(i32 noundef %398, i32 noundef 3, i32 noundef 5)
  %400 = load i32, ptr %8, align 4
  %401 = add nsw i32 %400, %399
  store i32 %401, ptr %8, align 4
  %402 = load i32, ptr %6, align 4
  %403 = call i32 @_74_if_stress(ptr noundef %9, i32 noundef 1, i32 noundef %402, i32 noundef 3, i32 noundef 5)
  %404 = load i32, ptr %8, align 4
  %405 = add nsw i32 %404, %403
  store i32 %405, ptr %8, align 4
  %406 = load i32, ptr %8, align 4
  %407 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %406)
  store i32 0, ptr %3, align 4
  br label %408

408:                                              ; preds = %389, %386, %373, %359, %341, %323, %305, %287, %269, %244, %215, %194, %180, %142, %120, %94, %76, %52
  %409 = load i32, ptr %3, align 4
  ret i32 %409
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

declare i32 @printf(ptr noundef, ...) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }
attributes #8 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
