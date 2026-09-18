; ModuleID = '_00_all.c'
source_filename = "_00_all.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_x = dso_local global i32 10, align 4
@g_y = dso_local global i32 -3, align 4
@g_z = dso_local global i32 7, align 4
@g_n = dso_local global i32 4, align 4
@g_arr = dso_local global [8 x i32] [i32 0, i32 1, i32 -2, i32 3, i32 -4, i32 5, i32 6, i32 -7], align 16
@g_mat = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 7, i32 8, i32 9]], align 16
@g_void_result = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_0_if_only(i32 noundef %0) #0 {
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
define dso_local i32 @_1_if_else(i32 noundef %0) #0 {
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
define dso_local i32 @_2_if_with_surrounding_code(i32 noundef %0) #0 {
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
define dso_local i32 @_3_if_compound(i32 noundef %0) #0 {
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
define dso_local i32 @_4_if_else_compound(i32 noundef %0) #0 {
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
define dso_local i32 @_5_if_equal(i32 noundef %0, i32 noundef %1) #0 {
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
define dso_local i32 @_6_if_not_equal(i32 noundef %0, i32 noundef %1) #0 {
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
define dso_local i32 @_7_relational(i32 noundef %0, i32 noundef %1) #0 {
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
define dso_local i32 @_8_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
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
define dso_local i32 @_9_if_elseif_else(i32 noundef %0) #0 {
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
  %15 = call noalias ptr @malloc(i64 noundef %14) #7
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
  call void @free(ptr noundef %41) #8
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
  %17 = call noalias ptr @malloc(i64 noundef %16) #7
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
  call void @free(ptr noundef %54) #8
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
define dso_local i32 @_75_for_simple(i32 noundef %0, i32 noundef %1) #0 {
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
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %20

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %6, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %5, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %5, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %6, align 4
  br label %7, !llvm.loop !6

20:                                               ; preds = %7
  %21 = load i32, ptr %5, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_76_while_simple(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %11, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %19

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %6, align 4
  %14 = sub nsw i32 %12, %13
  %15 = load i32, ptr %5, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %5, align 4
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %6, align 4
  br label %7, !llvm.loop !8

19:                                               ; preds = %7
  %20 = load i32, ptr %5, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_77_do_while(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %16, %2
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %6, align 4
  %10 = mul nsw i32 2, %9
  %11 = add nsw i32 %8, %10
  %12 = load i32, ptr %5, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %6, align 4
  br label %16

16:                                               ; preds = %7
  %17 = load i32, ptr %6, align 4
  %18 = load i32, ptr %3, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %7, label %20, !llvm.loop !9

20:                                               ; preds = %16
  %21 = load i32, ptr %5, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_78_nested_loops(i32 noundef %0, i32 noundef %1) #0 {
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

8:                                                ; preds = %27, %2
  %9 = load i32, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %30

12:                                               ; preds = %8
  store i32 0, ptr %7, align 4
  br label %13

13:                                               ; preds = %23, %12
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %26

17:                                               ; preds = %13
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %7, align 4
  %20 = mul nsw i32 %18, %19
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %5, align 4
  br label %23

23:                                               ; preds = %17
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %7, align 4
  br label %13, !llvm.loop !10

26:                                               ; preds = %13
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %8, !llvm.loop !11

30:                                               ; preds = %8
  %31 = load i32, ptr %5, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_79_nested_loop_if(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %7, align 4
  br label %13

13:                                               ; preds = %33, %12
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %36

17:                                               ; preds = %13
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %7, align 4
  %20 = add nsw i32 %18, %19
  %21 = srem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %29

23:                                               ; preds = %17
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %5, align 4
  br label %32

29:                                               ; preds = %17
  %30 = load i32, ptr %5, align 4
  %31 = sub nsw i32 %30, 1
  store i32 %31, ptr %5, align 4
  br label %32

32:                                               ; preds = %29, %23
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %7, align 4
  br label %13, !llvm.loop !12

36:                                               ; preds = %13
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %6, align 4
  br label %8, !llvm.loop !13

40:                                               ; preds = %8
  %41 = load i32, ptr %5, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_80_break(i32 noundef %0) #0 {
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
  %11 = icmp sgt i32 %10, 3
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %21

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = mul nsw i32 %14, 10
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %3, align 4
  br label %18

18:                                               ; preds = %13
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %4, align 4
  br label %5, !llvm.loop !14

21:                                               ; preds = %12, %5
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_81_continue(i32 noundef %0) #0 {
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
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  br label %18

14:                                               ; preds = %9
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %3, align 4
  br label %18

18:                                               ; preds = %14, %13
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %4, align 4
  br label %5, !llvm.loop !15

21:                                               ; preds = %5
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_82_loop_complex_condition(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %29, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %19

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4
  %16 = icmp slt i32 %15, 3
  br label %17

17:                                               ; preds = %14, %11
  %18 = phi i1 [ true, %11 ], [ %16, %14 ]
  br label %19

19:                                               ; preds = %17, %7
  %20 = phi i1 [ false, %7 ], [ %18, %17 ]
  br i1 %20, label %21, label %37

21:                                               ; preds = %19
  %22 = load i32, ptr %4, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %21
  %25 = load i32, ptr %4, align 4
  br label %29

26:                                               ; preds = %21
  %27 = load i32, ptr %4, align 4
  %28 = sub nsw i32 0, %27
  br label %29

29:                                               ; preds = %26, %24
  %30 = phi i32 [ %25, %24 ], [ %28, %26 ]
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %6, align 4
  %33 = load i32, ptr %4, align 4
  %34 = sdiv i32 %33, 2
  store i32 %34, ptr %4, align 4
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %5, align 4
  br label %7, !llvm.loop !16

37:                                               ; preds = %19
  %38 = load i32, ptr %6, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_83_loop_global_array() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %3

3:                                                ; preds = %27, %0
  %4 = load i32, ptr %2, align 4
  %5 = icmp slt i32 %4, 8
  br i1 %5, label %6, label %30

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %19

12:                                               ; preds = %6
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %1, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %1, align 4
  br label %26

19:                                               ; preds = %6
  %20 = load i32, ptr %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %1, align 4
  %25 = sub nsw i32 %24, %23
  store i32 %25, ptr %1, align 4
  br label %26

26:                                               ; preds = %19, %12
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %2, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %2, align 4
  br label %3, !llvm.loop !17

30:                                               ; preds = %3
  %31 = load i32, ptr %1, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_84_loop_pointer(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [8 x i32], align 16
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %10 = getelementptr inbounds [8 x i32], ptr %5, i64 0, i64 0
  store ptr %10, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %11

11:                                               ; preds = %27, %2
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %18

15:                                               ; preds = %11
  %16 = load i32, ptr %8, align 4
  %17 = icmp slt i32 %16, 8
  br label %18

18:                                               ; preds = %15, %11
  %19 = phi i1 [ false, %11 ], [ %17, %15 ]
  br i1 %19, label %20, label %30

20:                                               ; preds = %18
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %8, align 4
  %23 = add nsw i32 %21, %22
  %24 = load ptr, ptr %6, align 8
  store i32 %23, ptr %24, align 4
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds i32, ptr %25, i32 1
  store ptr %26, ptr %6, align 8
  br label %27

27:                                               ; preds = %20
  %28 = load i32, ptr %8, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %8, align 4
  br label %11, !llvm.loop !18

30:                                               ; preds = %18
  store i32 0, ptr %9, align 4
  br label %31

31:                                               ; preds = %48, %30
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %3, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %38

35:                                               ; preds = %31
  %36 = load i32, ptr %9, align 4
  %37 = icmp slt i32 %36, 8
  br label %38

38:                                               ; preds = %35, %31
  %39 = phi i1 [ false, %31 ], [ %37, %35 ]
  br i1 %39, label %40, label %51

40:                                               ; preds = %38
  %41 = load i32, ptr %9, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [8 x i32], ptr %5, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = mul nsw i32 %44, 2
  %46 = load i32, ptr %7, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %7, align 4
  br label %48

48:                                               ; preds = %40
  %49 = load i32, ptr %9, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %9, align 4
  br label %31, !llvm.loop !19

51:                                               ; preds = %38
  %52 = load i32, ptr %7, align 4
  ret i32 %52
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_85_loop_surrounding_code(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %11

11:                                               ; preds = %28, %2
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %31

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %7, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %8, align 4
  %19 = load i32, ptr %8, align 4
  %20 = icmp sgt i32 %19, 10
  br i1 %20, label %21, label %24

21:                                               ; preds = %15
  %22 = load i32, ptr %8, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, ptr %8, align 4
  br label %24

24:                                               ; preds = %21, %15
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  br label %28

28:                                               ; preds = %24
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %7, align 4
  br label %11, !llvm.loop !20

31:                                               ; preds = %11
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %6, align 4
  %35 = load i32, ptr %6, align 4
  %36 = icmp sgt i32 %35, 100
  br i1 %36, label %37, label %40

37:                                               ; preds = %31
  %38 = load i32, ptr %6, align 4
  %39 = sub nsw i32 %38, 100
  store i32 %39, ptr %6, align 4
  br label %40

40:                                               ; preds = %37, %31
  %41 = load i32, ptr %6, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_86_triple_nested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %11

11:                                               ; preds = %57, %3
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %60

15:                                               ; preds = %11
  store i32 0, ptr %9, align 4
  br label %16

16:                                               ; preds = %53, %15
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %56

20:                                               ; preds = %16
  store i32 0, ptr %10, align 4
  br label %21

21:                                               ; preds = %49, %20
  %22 = load i32, ptr %10, align 4
  %23 = load i32, ptr %6, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %52

25:                                               ; preds = %21
  %26 = load i32, ptr %8, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %29, label %36

29:                                               ; preds = %25
  %30 = load i32, ptr %9, align 4
  %31 = load i32, ptr %10, align 4
  %32 = icmp sgt i32 %30, %31
  br i1 %32, label %33, label %36

33:                                               ; preds = %29
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, 10
  store i32 %35, ptr %7, align 4
  br label %48

36:                                               ; preds = %29, %25
  %37 = load i32, ptr %8, align 4
  %38 = load i32, ptr %9, align 4
  %39 = icmp eq i32 %37, %38
  br i1 %39, label %44, label %40

40:                                               ; preds = %36
  %41 = load i32, ptr %9, align 4
  %42 = load i32, ptr %10, align 4
  %43 = icmp eq i32 %41, %42
  br i1 %43, label %44, label %47

44:                                               ; preds = %40, %36
  %45 = load i32, ptr %7, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %7, align 4
  br label %47

47:                                               ; preds = %44, %40
  br label %48

48:                                               ; preds = %47, %33
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %10, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %10, align 4
  br label %21, !llvm.loop !21

52:                                               ; preds = %21
  br label %53

53:                                               ; preds = %52
  %54 = load i32, ptr %9, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %9, align 4
  br label %16, !llvm.loop !22

56:                                               ; preds = %16
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %8, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %8, align 4
  br label %11, !llvm.loop !23

60:                                               ; preds = %11
  %61 = load i32, ptr %7, align 4
  ret i32 %61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_87_if_OR3(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %16, label %10

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %16, label %13

13:                                               ; preds = %10
  %14 = load i32, ptr %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %40

16:                                               ; preds = %13, %10, %3
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = load i32, ptr %5, align 4
  br label %22

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %21, %19
  %23 = phi i32 [ %20, %19 ], [ 0, %21 ]
  %24 = load i32, ptr %6, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %22
  %27 = load i32, ptr %6, align 4
  br label %29

28:                                               ; preds = %22
  br label %29

29:                                               ; preds = %28, %26
  %30 = phi i32 [ %27, %26 ], [ 0, %28 ]
  %31 = add nsw i32 %23, %30
  %32 = load i32, ptr %7, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %29
  %35 = load i32, ptr %7, align 4
  br label %37

36:                                               ; preds = %29
  br label %37

37:                                               ; preds = %36, %34
  %38 = phi i32 [ %35, %34 ], [ 0, %36 ]
  %39 = add nsw i32 %31, %38
  store i32 %39, ptr %4, align 4
  br label %41

40:                                               ; preds = %13
  store i32 0, ptr %4, align 4
  br label %41

41:                                               ; preds = %40, %37
  %42 = load i32, ptr %4, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_88_if_OR3_vla(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = load i32, ptr %4, align 4
  br label %29

14:                                               ; preds = %3
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = load i32, ptr %5, align 4
  br label %27

19:                                               ; preds = %14
  %20 = load i32, ptr %6, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %19
  %23 = load i32, ptr %6, align 4
  br label %25

24:                                               ; preds = %19
  br label %25

25:                                               ; preds = %24, %22
  %26 = phi i32 [ %23, %22 ], [ 1, %24 ]
  br label %27

27:                                               ; preds = %25, %17
  %28 = phi i32 [ %18, %17 ], [ %26, %25 ]
  br label %29

29:                                               ; preds = %27, %12
  %30 = phi i32 [ %13, %12 ], [ %28, %27 ]
  store i32 %30, ptr %7, align 4
  %31 = load i32, ptr %7, align 4
  %32 = zext i32 %31 to i64
  %33 = call ptr @llvm.stacksave()
  store ptr %33, ptr %8, align 8
  %34 = alloca i32, i64 %32, align 16
  store i64 %32, ptr %9, align 8
  %35 = getelementptr inbounds i32, ptr %34, i64 0
  store i32 0, ptr %35, align 16
  %36 = load i32, ptr %4, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %44, label %38

38:                                               ; preds = %29
  %39 = load i32, ptr %5, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %44, label %41

41:                                               ; preds = %38
  %42 = load i32, ptr %6, align 4
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %44, label %69

44:                                               ; preds = %41, %38, %29
  %45 = load i32, ptr %4, align 4
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %47, label %49

47:                                               ; preds = %44
  %48 = load i32, ptr %4, align 4
  br label %50

49:                                               ; preds = %44
  br label %50

50:                                               ; preds = %49, %47
  %51 = phi i32 [ %48, %47 ], [ 0, %49 ]
  %52 = load i32, ptr %5, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %56

54:                                               ; preds = %50
  %55 = load i32, ptr %5, align 4
  br label %57

56:                                               ; preds = %50
  br label %57

57:                                               ; preds = %56, %54
  %58 = phi i32 [ %55, %54 ], [ 0, %56 ]
  %59 = add nsw i32 %51, %58
  %60 = load i32, ptr %6, align 4
  %61 = icmp sgt i32 %60, 0
  br i1 %61, label %62, label %64

62:                                               ; preds = %57
  %63 = load i32, ptr %6, align 4
  br label %65

64:                                               ; preds = %57
  br label %65

65:                                               ; preds = %64, %62
  %66 = phi i32 [ %63, %62 ], [ 0, %64 ]
  %67 = add nsw i32 %59, %66
  %68 = getelementptr inbounds i32, ptr %34, i64 0
  store i32 %67, ptr %68, align 16
  br label %69

69:                                               ; preds = %65, %41
  %70 = load i32, ptr %7, align 4
  %71 = icmp sgt i32 %70, 1
  br i1 %71, label %72, label %77

72:                                               ; preds = %69
  %73 = getelementptr inbounds i32, ptr %34, i64 0
  %74 = load i32, ptr %73, align 16
  %75 = mul nsw i32 %74, 2
  %76 = getelementptr inbounds i32, ptr %34, i64 1
  store i32 %75, ptr %76, align 4
  br label %82

77:                                               ; preds = %69
  %78 = getelementptr inbounds i32, ptr %34, i64 0
  %79 = load i32, ptr %78, align 16
  %80 = sub nsw i32 %79, 1
  %81 = getelementptr inbounds i32, ptr %34, i64 1
  store i32 %80, ptr %81, align 4
  br label %82

82:                                               ; preds = %77, %72
  %83 = getelementptr inbounds i32, ptr %34, i64 0
  %84 = load i32, ptr %83, align 16
  %85 = getelementptr inbounds i32, ptr %34, i64 1
  %86 = load i32, ptr %85, align 4
  %87 = add nsw i32 %84, %86
  %88 = load ptr, ptr %8, align 8
  call void @llvm.stackrestore(ptr %88)
  ret i32 %87
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_89_loop_vla(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %11 = load i32, ptr %4, align 4
  %12 = icmp sle i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %65

14:                                               ; preds = %2
  %15 = load i32, ptr %4, align 4
  %16 = zext i32 %15 to i64
  %17 = call ptr @llvm.stacksave()
  store ptr %17, ptr %6, align 8
  %18 = alloca i32, i64 %16, align 16
  store i64 %16, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %19

19:                                               ; preds = %30, %14
  %20 = load i32, ptr %9, align 4
  %21 = load i32, ptr %4, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %33

23:                                               ; preds = %19
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %9, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %9, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr %18, i64 %28
  store i32 %26, ptr %29, align 4
  br label %30

30:                                               ; preds = %23
  %31 = load i32, ptr %9, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %9, align 4
  br label %19, !llvm.loop !24

33:                                               ; preds = %19
  store i32 0, ptr %10, align 4
  br label %34

34:                                               ; preds = %59, %33
  %35 = load i32, ptr %10, align 4
  %36 = load i32, ptr %4, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %62

38:                                               ; preds = %34
  %39 = load i32, ptr %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %18, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %44, label %51

44:                                               ; preds = %38
  %45 = load i32, ptr %10, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %18, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = load i32, ptr %8, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %8, align 4
  br label %58

51:                                               ; preds = %38
  %52 = load i32, ptr %10, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %18, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = load i32, ptr %8, align 4
  %57 = sub nsw i32 %56, %55
  store i32 %57, ptr %8, align 4
  br label %58

58:                                               ; preds = %51, %44
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %10, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %10, align 4
  br label %34, !llvm.loop !25

62:                                               ; preds = %34
  %63 = load i32, ptr %8, align 4
  store i32 %63, ptr %3, align 4
  %64 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %64)
  br label %65

65:                                               ; preds = %62, %13
  %66 = load i32, ptr %3, align 4
  ret i32 %66
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_90_vla_nested_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp sle i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %71

16:                                               ; preds = %2
  %17 = load i32, ptr %4, align 4
  %18 = zext i32 %17 to i64
  %19 = call ptr @llvm.stacksave()
  store ptr %19, ptr %6, align 8
  %20 = alloca i32, i64 %18, align 16
  store i64 %18, ptr %7, align 8
  store ptr %20, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %21

21:                                               ; preds = %49, %16
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %4, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %52

25:                                               ; preds = %21
  %26 = load ptr, ptr %8, align 8
  %27 = load i32, ptr %9, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr %26, i64 %28
  store i32 0, ptr %29, align 4
  store i32 0, ptr %10, align 4
  br label %30

30:                                               ; preds = %45, %25
  %31 = load i32, ptr %10, align 4
  %32 = load i32, ptr %9, align 4
  %33 = icmp sle i32 %31, %32
  br i1 %33, label %34, label %48

34:                                               ; preds = %30
  %35 = load i32, ptr %5, align 4
  %36 = load i32, ptr %10, align 4
  %37 = add nsw i32 %36, 1
  %38 = mul nsw i32 %35, %37
  %39 = load ptr, ptr %8, align 8
  %40 = load i32, ptr %9, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %39, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = add nsw i32 %43, %38
  store i32 %44, ptr %42, align 4
  br label %45

45:                                               ; preds = %34
  %46 = load i32, ptr %10, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %10, align 4
  br label %30, !llvm.loop !26

48:                                               ; preds = %30
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %9, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %9, align 4
  br label %21, !llvm.loop !27

52:                                               ; preds = %21
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %53

53:                                               ; preds = %65, %52
  %54 = load i32, ptr %12, align 4
  %55 = load i32, ptr %4, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %57, label %68

57:                                               ; preds = %53
  %58 = load ptr, ptr %8, align 8
  %59 = load i32, ptr %12, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %58, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %11, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %11, align 4
  br label %65

65:                                               ; preds = %57
  %66 = load i32, ptr %12, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %12, align 4
  br label %53, !llvm.loop !28

68:                                               ; preds = %53
  %69 = load i32, ptr %11, align 4
  store i32 %69, ptr %3, align 4
  %70 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %70)
  br label %71

71:                                               ; preds = %68, %15
  %72 = load i32, ptr %3, align 4
  ret i32 %72
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_91_alloca_inside_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %10

10:                                               ; preds = %61, %2
  %11 = load i32, ptr %6, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %17

14:                                               ; preds = %10
  %15 = load i32, ptr %6, align 4
  %16 = icmp slt i32 %15, 4
  br label %17

17:                                               ; preds = %14, %10
  %18 = phi i1 [ false, %10 ], [ %16, %14 ]
  br i1 %18, label %19, label %64

19:                                               ; preds = %17
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 1
  %22 = zext i32 %21 to i64
  %23 = call ptr @llvm.stacksave()
  store ptr %23, ptr %7, align 8
  %24 = alloca i32, i64 %22, align 16
  store i64 %22, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %25

25:                                               ; preds = %36, %19
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %6, align 4
  %28 = icmp sle i32 %26, %27
  br i1 %28, label %29, label %39

29:                                               ; preds = %25
  %30 = load i32, ptr %4, align 4
  %31 = load i32, ptr %9, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %9, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr %24, i64 %34
  store i32 %32, ptr %35, align 4
  br label %36

36:                                               ; preds = %29
  %37 = load i32, ptr %9, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %9, align 4
  br label %25, !llvm.loop !29

39:                                               ; preds = %25
  %40 = load i32, ptr %6, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %24, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %45, label %52

45:                                               ; preds = %39
  %46 = load i32, ptr %6, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %24, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %5, align 4
  br label %59

52:                                               ; preds = %39
  %53 = load i32, ptr %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, ptr %24, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = load i32, ptr %5, align 4
  %58 = sub nsw i32 %57, %56
  store i32 %58, ptr %5, align 4
  br label %59

59:                                               ; preds = %52, %45
  %60 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %60)
  br label %61

61:                                               ; preds = %59
  %62 = load i32, ptr %6, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %6, align 4
  br label %10, !llvm.loop !30

64:                                               ; preds = %17
  %65 = load i32, ptr %5, align 4
  ret i32 %65
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_92_vla_size_from_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 1, ptr %7, align 4
  br label %12

12:                                               ; preds = %28, %2
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp sle i32 %13, %14
  br i1 %15, label %16, label %31

16:                                               ; preds = %12
  %17 = load i32, ptr %7, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %16
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %6, align 4
  br label %27

24:                                               ; preds = %16
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %6, align 4
  br label %27

27:                                               ; preds = %24, %20
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %7, align 4
  br label %12, !llvm.loop !31

31:                                               ; preds = %12
  %32 = load i32, ptr %6, align 4
  %33 = zext i32 %32 to i64
  %34 = call ptr @llvm.stacksave()
  store ptr %34, ptr %8, align 8
  %35 = alloca i32, i64 %33, align 16
  store i64 %33, ptr %9, align 8
  %36 = load i32, ptr %5, align 4
  %37 = getelementptr inbounds i32, ptr %35, i64 0
  store i32 %36, ptr %37, align 16
  store i32 1, ptr %10, align 4
  br label %38

38:                                               ; preds = %53, %31
  %39 = load i32, ptr %10, align 4
  %40 = load i32, ptr %6, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %56

42:                                               ; preds = %38
  %43 = load i32, ptr %10, align 4
  %44 = sub nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %35, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr %10, align 4
  %49 = add nsw i32 %47, %48
  %50 = load i32, ptr %10, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %35, i64 %51
  store i32 %49, ptr %52, align 4
  br label %53

53:                                               ; preds = %42
  %54 = load i32, ptr %10, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %10, align 4
  br label %38, !llvm.loop !32

56:                                               ; preds = %38
  %57 = load i32, ptr %6, align 4
  %58 = sub nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %35, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = getelementptr inbounds i32, ptr %35, i64 0
  %63 = load i32, ptr %62, align 16
  %64 = icmp sgt i32 %61, %63
  br i1 %64, label %65, label %71

65:                                               ; preds = %56
  %66 = load i32, ptr %6, align 4
  %67 = sub nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr %35, i64 %68
  %70 = load i32, ptr %69, align 4
  store i32 %70, ptr %3, align 4
  store i32 1, ptr %11, align 4
  br label %74

71:                                               ; preds = %56
  %72 = getelementptr inbounds i32, ptr %35, i64 0
  %73 = load i32, ptr %72, align 16
  store i32 %73, ptr %3, align 4
  store i32 1, ptr %11, align 4
  br label %74

74:                                               ; preds = %71, %65
  %75 = load ptr, ptr %8, align 8
  call void @llvm.stackrestore(ptr %75)
  %76 = load i32, ptr %3, align 4
  ret i32 %76
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_93_global_loop() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr @g_void_result, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %20, %0
  %3 = load i32, ptr %1, align 4
  %4 = load i32, ptr @g_n, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %23

6:                                                ; preds = %2
  %7 = load i32, ptr @g_x, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %6
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr %1, align 4
  %12 = add nsw i32 %10, %11
  %13 = load i32, ptr @g_void_result, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr @g_void_result, align 4
  br label %19

15:                                               ; preds = %6
  %16 = load i32, ptr @g_z, align 4
  %17 = load i32, ptr @g_void_result, align 4
  %18 = sub nsw i32 %17, %16
  store i32 %18, ptr @g_void_result, align 4
  br label %19

19:                                               ; preds = %15, %9
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %1, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %1, align 4
  br label %2, !llvm.loop !33

23:                                               ; preds = %2
  %24 = load i32, ptr @g_void_result, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_94_void_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %22, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  br label %21

17:                                               ; preds = %10
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr @g_void_result, align 4
  %20 = sub nsw i32 %19, %18
  store i32 %20, ptr @g_void_result, align 4
  br label %21

21:                                               ; preds = %17, %13
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %5, align 4
  br label %6, !llvm.loop !34

25:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_95_void_loop_pointer(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %34, %3
  %10 = load i32, ptr %7, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %37

13:                                               ; preds = %9
  %14 = load i32, ptr %7, align 4
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %25

17:                                               ; preds = %13
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %7, align 4
  %20 = add nsw i32 %18, %19
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, ptr %21, i64 %23
  store i32 %20, ptr %24, align 4
  br label %33

25:                                               ; preds = %13
  %26 = load i32, ptr %6, align 4
  %27 = load i32, ptr %7, align 4
  %28 = sub nsw i32 %26, %27
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 %28, ptr %32, align 4
  br label %33

33:                                               ; preds = %25, %17
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %7, align 4
  br label %9, !llvm.loop !35

37:                                               ; preds = %9
  store i32 0, ptr %8, align 4
  br label %38

38:                                               ; preds = %50, %37
  %39 = load i32, ptr %8, align 4
  %40 = load i32, ptr %5, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %53

42:                                               ; preds = %38
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %8, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr @g_void_result, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr @g_void_result, align 4
  br label %50

50:                                               ; preds = %42
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %8, align 4
  br label %38, !llvm.loop !36

53:                                               ; preds = %38
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_96_goto_break(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %23, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %26

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %6, align 4
  %14 = add nsw i32 %12, %13
  %15 = icmp sgt i32 %14, 20
  br i1 %15, label %16, label %17

16:                                               ; preds = %11
  br label %27

17:                                               ; preds = %11
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %5, align 4
  br label %23

23:                                               ; preds = %17
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  br label %7, !llvm.loop !37

26:                                               ; preds = %7
  br label %27

27:                                               ; preds = %26, %16
  %28 = load i32, ptr %5, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_97_goto_nested_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %33, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %19

15:                                               ; preds = %11
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sub nsw i32 %17, %16
  store i32 %18, ptr %5, align 4
  br label %33

19:                                               ; preds = %14
  %20 = load i32, ptr %6, align 4
  %21 = srem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %19
  br label %28

24:                                               ; preds = %19
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %5, align 4
  br label %33

28:                                               ; preds = %23
  %29 = load i32, ptr %6, align 4
  %30 = mul nsw i32 %29, 10
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %5, align 4
  br label %33

33:                                               ; preds = %28, %24, %15
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  br label %7, !llvm.loop !38

36:                                               ; preds = %7
  %37 = load i32, ptr %5, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_98_goto_vla(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  %12 = load i32, ptr %4, align 4
  br label %14

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %13, %11
  %15 = phi i32 [ %12, %11 ], [ 1, %13 ]
  %16 = zext i32 %15 to i64
  %17 = call ptr @llvm.stacksave()
  store ptr %17, ptr %6, align 8
  %18 = alloca i32, i64 %16, align 16
  store i64 %16, ptr %7, align 8
  %19 = load i32, ptr %4, align 4
  %20 = icmp sle i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %14
  br label %48

22:                                               ; preds = %14
  %23 = load i32, ptr %5, align 4
  %24 = getelementptr inbounds i32, ptr %18, i64 0
  store i32 %23, ptr %24, align 16
  %25 = load i32, ptr %4, align 4
  %26 = icmp sgt i32 %25, 2
  br i1 %26, label %27, label %28

27:                                               ; preds = %22
  br label %32

28:                                               ; preds = %22
  %29 = getelementptr inbounds i32, ptr %18, i64 0
  %30 = load i32, ptr %29, align 16
  %31 = add nsw i32 %30, 10
  store i32 %31, ptr %29, align 16
  br label %36

32:                                               ; preds = %27
  %33 = load i32, ptr %5, align 4
  %34 = mul nsw i32 %33, 2
  %35 = getelementptr inbounds i32, ptr %18, i64 1
  store i32 %34, ptr %35, align 4
  br label %36

36:                                               ; preds = %32, %28
  %37 = getelementptr inbounds i32, ptr %18, i64 0
  %38 = load i32, ptr %37, align 16
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %36
  br label %45

41:                                               ; preds = %36
  %42 = getelementptr inbounds i32, ptr %18, i64 0
  %43 = load i32, ptr %42, align 16
  %44 = sub nsw i32 %43, 1
  store i32 %44, ptr %3, align 4
  store i32 1, ptr %8, align 4
  br label %49

45:                                               ; preds = %40
  %46 = getelementptr inbounds i32, ptr %18, i64 0
  %47 = load i32, ptr %46, align 16
  store i32 %47, ptr %3, align 4
  store i32 1, ptr %8, align 4
  br label %49

48:                                               ; preds = %21
  store i32 -1, ptr %3, align 4
  store i32 1, ptr %8, align 4
  br label %49

49:                                               ; preds = %48, %45, %41
  %50 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %50)
  %51 = load i32, ptr %3, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_99_malloc_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp sle i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %69

13:                                               ; preds = %2
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16) #7
  store ptr %17, ptr %6, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %13
  store i32 -2, ptr %3, align 4
  br label %69

21:                                               ; preds = %13
  store i32 0, ptr %7, align 4
  br label %22

22:                                               ; preds = %47, %21
  %23 = load i32, ptr %7, align 4
  %24 = load i32, ptr %4, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %50

26:                                               ; preds = %22
  %27 = load i32, ptr %7, align 4
  %28 = srem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %38

30:                                               ; preds = %26
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %31, %32
  %34 = load ptr, ptr %6, align 8
  %35 = load i32, ptr %7, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr %34, i64 %36
  store i32 %33, ptr %37, align 4
  br label %46

38:                                               ; preds = %26
  %39 = load i32, ptr %5, align 4
  %40 = load i32, ptr %7, align 4
  %41 = sub nsw i32 %39, %40
  %42 = load ptr, ptr %6, align 8
  %43 = load i32, ptr %7, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  store i32 %41, ptr %45, align 4
  br label %46

46:                                               ; preds = %38, %30
  br label %47

47:                                               ; preds = %46
  %48 = load i32, ptr %7, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %7, align 4
  br label %22, !llvm.loop !39

50:                                               ; preds = %22
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %51

51:                                               ; preds = %63, %50
  %52 = load i32, ptr %9, align 4
  %53 = load i32, ptr %4, align 4
  %54 = icmp slt i32 %52, %53
  br i1 %54, label %55, label %66

55:                                               ; preds = %51
  %56 = load ptr, ptr %6, align 8
  %57 = load i32, ptr %9, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %56, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, %60
  store i32 %62, ptr %8, align 4
  br label %63

63:                                               ; preds = %55
  %64 = load i32, ptr %9, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %9, align 4
  br label %51, !llvm.loop !40

66:                                               ; preds = %51
  %67 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %67) #8
  %68 = load i32, ptr %8, align 4
  store i32 %68, ptr %3, align 4
  br label %69

69:                                               ; preds = %66, %20, %12
  %70 = load i32, ptr %3, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_100_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %15 = load i32, ptr @g_x, align 4
  store i32 %15, ptr %9, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %4
  %19 = load i32, ptr %6, align 4
  br label %21

20:                                               ; preds = %4
  br label %21

21:                                               ; preds = %20, %18
  %22 = phi i32 [ %19, %18 ], [ 1, %20 ]
  %23 = zext i32 %22 to i64
  %24 = call ptr @llvm.stacksave()
  store ptr %24, ptr %10, align 8
  %25 = alloca i32, i64 %23, align 16
  store i64 %23, ptr %11, align 8
  store i32 0, ptr %12, align 4
  br label %26

26:                                               ; preds = %43, %21
  %27 = load i32, ptr %12, align 4
  %28 = load i32, ptr %6, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %26
  %31 = load i32, ptr %6, align 4
  br label %33

32:                                               ; preds = %26
  br label %33

33:                                               ; preds = %32, %30
  %34 = phi i32 [ %31, %30 ], [ 1, %32 ]
  %35 = icmp slt i32 %27, %34
  br i1 %35, label %36, label %46

36:                                               ; preds = %33
  %37 = load i32, ptr %7, align 4
  %38 = load i32, ptr %12, align 4
  %39 = add nsw i32 %37, %38
  %40 = load i32, ptr %12, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %25, i64 %41
  store i32 %39, ptr %42, align 4
  br label %43

43:                                               ; preds = %36
  %44 = load i32, ptr %12, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %12, align 4
  br label %26, !llvm.loop !41

46:                                               ; preds = %33
  store i32 0, ptr %13, align 4
  br label %47

47:                                               ; preds = %129, %46
  %48 = load i32, ptr %13, align 4
  %49 = load i32, ptr %6, align 4
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %51, label %53

51:                                               ; preds = %47
  %52 = load i32, ptr %6, align 4
  br label %54

53:                                               ; preds = %47
  br label %54

54:                                               ; preds = %53, %51
  %55 = phi i32 [ %52, %51 ], [ 1, %53 ]
  %56 = icmp slt i32 %48, %55
  br i1 %56, label %57, label %132

57:                                               ; preds = %54
  %58 = load i32, ptr %13, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %25, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %8, align 4
  %63 = icmp sgt i32 %61, %62
  br i1 %63, label %64, label %108

64:                                               ; preds = %57
  store i32 0, ptr %14, align 4
  br label %65

65:                                               ; preds = %104, %64
  %66 = load i32, ptr %14, align 4
  %67 = icmp slt i32 %66, 8
  br i1 %67, label %68, label %107

68:                                               ; preds = %65
  %69 = load i32, ptr %14, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = icmp sgt i32 %72, 0
  br i1 %73, label %74, label %90

74:                                               ; preds = %68
  %75 = load i32, ptr %14, align 4
  %76 = srem i32 %75, 2
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %90

78:                                               ; preds = %74
  %79 = load i32, ptr %14, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = load i32, ptr %13, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, ptr %25, i64 %84
  %86 = load i32, ptr %85, align 4
  %87 = sub nsw i32 %82, %86
  %88 = load i32, ptr %9, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, ptr %9, align 4
  br label %103

90:                                               ; preds = %74, %68
  %91 = load ptr, ptr %5, align 8
  %92 = icmp ne ptr %91, null
  br i1 %92, label %93, label %102

93:                                               ; preds = %90
  %94 = load ptr, ptr %5, align 8
  %95 = load i32, ptr %94, align 4
  %96 = icmp sgt i32 %95, 0
  br i1 %96, label %97, label %102

97:                                               ; preds = %93
  %98 = load ptr, ptr %5, align 8
  %99 = load i32, ptr %98, align 4
  %100 = load i32, ptr %9, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, ptr %9, align 4
  br label %102

102:                                              ; preds = %97, %93, %90
  br label %103

103:                                              ; preds = %102, %78
  br label %104

104:                                              ; preds = %103
  %105 = load i32, ptr %14, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %14, align 4
  br label %65, !llvm.loop !42

107:                                              ; preds = %65
  br label %128

108:                                              ; preds = %57
  %109 = load i32, ptr %13, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, ptr %25, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = load i32, ptr %9, align 4
  %114 = sub nsw i32 %113, %112
  store i32 %114, ptr %9, align 4
  %115 = load i32, ptr %7, align 4
  %116 = srem i32 %115, 3
  %117 = load i32, ptr %8, align 4
  %118 = load i32, ptr %7, align 4
  %119 = sub nsw i32 %118, 1
  %120 = mul nsw i32 5, %119
  %121 = add nsw i32 %117, %120
  %122 = srem i32 %121, 3
  %123 = icmp eq i32 %116, %122
  br i1 %123, label %124, label %127

124:                                              ; preds = %108
  %125 = load i32, ptr %9, align 4
  %126 = add nsw i32 %125, 7
  store i32 %126, ptr %9, align 4
  br label %127

127:                                              ; preds = %124, %108
  br label %128

128:                                              ; preds = %127, %107
  br label %129

129:                                              ; preds = %128
  %130 = load i32, ptr %13, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %13, align 4
  br label %47, !llvm.loop !43

132:                                              ; preds = %54
  %133 = load i32, ptr %9, align 4
  %134 = icmp sgt i32 %133, 0
  br i1 %134, label %135, label %137

135:                                              ; preds = %132
  %136 = load i32, ptr %9, align 4
  br label %140

137:                                              ; preds = %132
  %138 = load i32, ptr %9, align 4
  %139 = sub nsw i32 0, %138
  br label %140

140:                                              ; preds = %137, %135
  %141 = phi i32 [ %136, %135 ], [ %139, %137 ]
  %142 = load ptr, ptr %10, align 8
  call void @llvm.stackrestore(ptr %142)
  ret i32 %141
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_101_stress_goto(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  %18 = load i32, ptr %9, align 4
  %19 = load i32, ptr @g_x, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %12, align 4
  %21 = load i32, ptr %8, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %5
  %24 = load i32, ptr %8, align 4
  br label %26

25:                                               ; preds = %5
  br label %26

26:                                               ; preds = %25, %23
  %27 = phi i32 [ %24, %23 ], [ 1, %25 ]
  %28 = zext i32 %27 to i64
  %29 = call ptr @llvm.stacksave()
  store ptr %29, ptr %13, align 8
  %30 = alloca i32, i64 %28, align 16
  store i64 %28, ptr %14, align 8
  %31 = load i32, ptr %9, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp sgt i32 %31, %32
  br i1 %33, label %34, label %37

34:                                               ; preds = %26
  %35 = load i32, ptr %11, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %44, label %37

37:                                               ; preds = %34, %26
  %38 = load i32, ptr %10, align 4
  %39 = load i32, ptr %11, align 4
  %40 = icmp sgt i32 %38, %39
  br i1 %40, label %41, label %45

41:                                               ; preds = %37
  %42 = load i32, ptr %9, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %41, %34
  br label %72

45:                                               ; preds = %41, %37
  store i32 0, ptr %15, align 4
  br label %46

46:                                               ; preds = %64, %45
  %47 = load i32, ptr %15, align 4
  %48 = load i32, ptr %8, align 4
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %52

50:                                               ; preds = %46
  %51 = load i32, ptr %8, align 4
  br label %53

52:                                               ; preds = %46
  br label %53

53:                                               ; preds = %52, %50
  %54 = phi i32 [ %51, %50 ], [ 1, %52 ]
  %55 = icmp slt i32 %47, %54
  br i1 %55, label %56, label %67

56:                                               ; preds = %53
  %57 = load i32, ptr %9, align 4
  %58 = sub nsw i32 0, %57
  %59 = load i32, ptr %15, align 4
  %60 = add nsw i32 %58, %59
  %61 = load i32, ptr %15, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, ptr %30, i64 %62
  store i32 %60, ptr %63, align 4
  br label %64

64:                                               ; preds = %56
  %65 = load i32, ptr %15, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %15, align 4
  br label %46, !llvm.loop !44

67:                                               ; preds = %53
  %68 = getelementptr inbounds i32, ptr %30, i64 0
  %69 = load i32, ptr %68, align 16
  %70 = load i32, ptr %12, align 4
  %71 = sub nsw i32 %70, %69
  store i32 %71, ptr %12, align 4
  br label %154

72:                                               ; preds = %44
  store i32 0, ptr %16, align 4
  br label %73

73:                                               ; preds = %130, %72
  %74 = load i32, ptr %16, align 4
  %75 = load i32, ptr %8, align 4
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %77, label %79

77:                                               ; preds = %73
  %78 = load i32, ptr %8, align 4
  br label %80

79:                                               ; preds = %73
  br label %80

80:                                               ; preds = %79, %77
  %81 = phi i32 [ %78, %77 ], [ 1, %79 ]
  %82 = icmp slt i32 %74, %81
  br i1 %82, label %83, label %133

83:                                               ; preds = %80
  %84 = load i32, ptr %10, align 4
  %85 = load i32, ptr %16, align 4
  %86 = add nsw i32 %84, %85
  %87 = load i32, ptr %16, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, ptr %30, i64 %88
  store i32 %86, ptr %89, align 4
  %90 = load i32, ptr %16, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, ptr %30, i64 %91
  %93 = load i32, ptr %92, align 4
  %94 = load i32, ptr @g_z, align 4
  %95 = icmp sgt i32 %93, %94
  br i1 %95, label %96, label %115

96:                                               ; preds = %83
  %97 = load ptr, ptr %7, align 8
  %98 = load i32, ptr %97, align 4
  %99 = icmp sgt i32 %98, 0
  br i1 %99, label %100, label %107

100:                                              ; preds = %96
  %101 = load i32, ptr %16, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, ptr %30, i64 %102
  %104 = load i32, ptr %103, align 4
  %105 = load i32, ptr %12, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, ptr %12, align 4
  br label %114

107:                                              ; preds = %96
  %108 = load i32, ptr %16, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, ptr %30, i64 %109
  %111 = load i32, ptr %110, align 4
  %112 = load i32, ptr %12, align 4
  %113 = sub nsw i32 %112, %111
  store i32 %113, ptr %12, align 4
  br label %114

114:                                              ; preds = %107, %100
  br label %122

115:                                              ; preds = %83
  %116 = load i32, ptr %16, align 4
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %119

118:                                              ; preds = %115
  br label %123

119:                                              ; preds = %115
  %120 = load i32, ptr %12, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, ptr %12, align 4
  br label %122

122:                                              ; preds = %119, %114
  br label %123

123:                                              ; preds = %122, %118
  %124 = load i32, ptr %12, align 4
  %125 = load ptr, ptr %7, align 8
  %126 = load i32, ptr %16, align 4
  %127 = srem i32 %126, 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, ptr %125, i64 %128
  store i32 %124, ptr %129, align 4
  br label %130

130:                                              ; preds = %123
  %131 = load i32, ptr %16, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, ptr %16, align 4
  br label %73, !llvm.loop !45

133:                                              ; preds = %80
  %134 = load i32, ptr %12, align 4
  %135 = load i32, ptr @g_z, align 4
  %136 = icmp sgt i32 %134, %135
  br i1 %136, label %137, label %153

137:                                              ; preds = %133
  %138 = load i32, ptr %9, align 4
  %139 = load i32, ptr %10, align 4
  %140 = load i32, ptr %11, align 4
  %141 = sdiv i32 %140, 10
  %142 = load i32, ptr %9, align 4
  %143 = sub nsw i32 %142, 1
  %144 = mul nsw i32 %141, %143
  %145 = add nsw i32 %139, %144
  %146 = icmp eq i32 %138, %145
  br i1 %146, label %147, label %150

147:                                              ; preds = %137
  %148 = load i32, ptr %12, align 4
  %149 = add nsw i32 %148, 100
  store i32 %149, ptr %6, align 4
  store i32 1, ptr %17, align 4
  br label %165

150:                                              ; preds = %137
  %151 = load i32, ptr %12, align 4
  %152 = add nsw i32 %151, 200
  store i32 %152, ptr %6, align 4
  store i32 1, ptr %17, align 4
  br label %165

153:                                              ; preds = %133
  br label %154

154:                                              ; preds = %153, %67
  %155 = load i32, ptr %12, align 4
  %156 = icmp sgt i32 %155, 0
  br i1 %156, label %157, label %160

157:                                              ; preds = %154
  %158 = load i32, ptr %12, align 4
  %159 = mul nsw i32 %158, 2
  br label %163

160:                                              ; preds = %154
  %161 = load i32, ptr %12, align 4
  %162 = sub nsw i32 0, %161
  br label %163

163:                                              ; preds = %160, %157
  %164 = phi i32 [ %159, %157 ], [ %162, %160 ]
  store i32 %164, ptr %6, align 4
  store i32 1, ptr %17, align 4
  br label %165

165:                                              ; preds = %163, %150, %147
  %166 = load ptr, ptr %13, align 8
  call void @llvm.stackrestore(ptr %166)
  %167 = load i32, ptr %6, align 4
  ret i32 %167
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_102_oneblock(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i64
  %6 = select i1 %4, i32 1, i32 0
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_103_switch_if(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %6 = load i32, ptr %3, align 4
  switch i32 %6, label %34 [
    i32 0, label %7
    i32 1, label %17
    i32 2, label %25
  ]

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = load i32, ptr %4, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %5, align 4
  br label %16

13:                                               ; preds = %7
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %14, 2
  store i32 %15, ptr %5, align 4
  br label %16

16:                                               ; preds = %13, %10
  br label %37

17:                                               ; preds = %2
  %18 = load i32, ptr %4, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  store i32 100, ptr %5, align 4
  br label %24

21:                                               ; preds = %17
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, 100
  store i32 %23, ptr %5, align 4
  br label %24

24:                                               ; preds = %21, %20
  br label %37

25:                                               ; preds = %2
  %26 = load i32, ptr %4, align 4
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %25
  %29 = load i32, ptr %4, align 4
  %30 = sub nsw i32 0, %29
  store i32 %30, ptr %5, align 4
  br label %33

31:                                               ; preds = %25
  %32 = load i32, ptr %4, align 4
  store i32 %32, ptr %5, align 4
  br label %33

33:                                               ; preds = %31, %28
  br label %37

34:                                               ; preds = %2
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, 10
  store i32 %36, ptr %5, align 4
  br label %37

37:                                               ; preds = %34, %33, %24, %16
  %38 = load i32, ptr %5, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_104_switch_nested_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %43 [
    i32 0, label %9
    i32 1, label %28
  ]

9:                                                ; preds = %3
  %10 = load i32, ptr %5, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = load i32, ptr %6, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %7, align 4
  br label %23

19:                                               ; preds = %12
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = sub nsw i32 %20, %21
  store i32 %22, ptr %7, align 4
  br label %23

23:                                               ; preds = %19, %15
  br label %27

24:                                               ; preds = %9
  %25 = load i32, ptr %5, align 4
  %26 = sub nsw i32 0, %25
  store i32 %26, ptr %7, align 4
  br label %27

27:                                               ; preds = %24, %23
  br label %53

28:                                               ; preds = %3
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %6, align 4
  %31 = icmp eq i32 %29, %30
  br i1 %31, label %32, label %38

32:                                               ; preds = %28
  %33 = load i32, ptr %5, align 4
  %34 = icmp sgt i32 %33, 10
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  store i32 100, ptr %7, align 4
  br label %37

36:                                               ; preds = %32
  store i32 200, ptr %7, align 4
  br label %37

37:                                               ; preds = %36, %35
  br label %42

38:                                               ; preds = %28
  %39 = load i32, ptr %5, align 4
  %40 = load i32, ptr %6, align 4
  %41 = add nsw i32 %39, %40
  store i32 %41, ptr %7, align 4
  br label %42

42:                                               ; preds = %38, %37
  br label %53

43:                                               ; preds = %3
  %44 = load i32, ptr %6, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %50

46:                                               ; preds = %43
  %47 = load i32, ptr %5, align 4
  %48 = load i32, ptr %6, align 4
  %49 = sdiv i32 %47, %48
  store i32 %49, ptr %7, align 4
  br label %52

50:                                               ; preds = %43
  %51 = load i32, ptr %5, align 4
  store i32 %51, ptr %7, align 4
  br label %52

52:                                               ; preds = %50, %46
  br label %53

53:                                               ; preds = %52, %42, %27
  %54 = load i32, ptr %7, align 4
  ret i32 %54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_105_switch_ternary(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %37 [
    i32 0, label %9
    i32 1, label %19
    i32 2, label %31
  ]

9:                                                ; preds = %3
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  %14 = load i32, ptr %5, align 4
  br label %17

15:                                               ; preds = %9
  %16 = load i32, ptr %6, align 4
  br label %17

17:                                               ; preds = %15, %13
  %18 = phi i32 [ %14, %13 ], [ %16, %15 ]
  store i32 %18, ptr %7, align 4
  br label %50

19:                                               ; preds = %3
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %26

23:                                               ; preds = %19
  %24 = load i32, ptr %5, align 4
  %25 = mul nsw i32 %24, 2
  br label %29

26:                                               ; preds = %19
  %27 = load i32, ptr %6, align 4
  %28 = mul nsw i32 %27, 2
  br label %29

29:                                               ; preds = %26, %23
  %30 = phi i32 [ %25, %23 ], [ %28, %26 ]
  store i32 %30, ptr %7, align 4
  br label %50

31:                                               ; preds = %3
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %6, align 4
  %34 = icmp eq i32 %32, %33
  %35 = zext i1 %34 to i64
  %36 = select i1 %34, i32 100, i32 -100
  store i32 %36, ptr %7, align 4
  br label %50

37:                                               ; preds = %3
  %38 = load i32, ptr %5, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %44

40:                                               ; preds = %37
  %41 = load i32, ptr %5, align 4
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %41, %42
  br label %48

44:                                               ; preds = %37
  %45 = load i32, ptr %5, align 4
  %46 = load i32, ptr %6, align 4
  %47 = sub nsw i32 %45, %46
  br label %48

48:                                               ; preds = %44, %40
  %49 = phi i32 [ %43, %40 ], [ %47, %44 ]
  store i32 %49, ptr %7, align 4
  br label %50

50:                                               ; preds = %48, %31, %29, %17
  %51 = load i32, ptr %7, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_106_switch_nested_ternary(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  %10 = load i32, ptr %5, align 4
  switch i32 %10, label %84 [
    i32 0, label %11
    i32 1, label %37
    i32 2, label %66
  ]

11:                                               ; preds = %4
  %12 = load i32, ptr %6, align 4
  %13 = load i32, ptr %7, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %15, label %25

15:                                               ; preds = %11
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr %8, align 4
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %15
  %20 = load i32, ptr %6, align 4
  br label %23

21:                                               ; preds = %15
  %22 = load i32, ptr %8, align 4
  br label %23

23:                                               ; preds = %21, %19
  %24 = phi i32 [ %20, %19 ], [ %22, %21 ]
  br label %35

25:                                               ; preds = %11
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %8, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %29, label %31

29:                                               ; preds = %25
  %30 = load i32, ptr %7, align 4
  br label %33

31:                                               ; preds = %25
  %32 = load i32, ptr %8, align 4
  br label %33

33:                                               ; preds = %31, %29
  %34 = phi i32 [ %30, %29 ], [ %32, %31 ]
  br label %35

35:                                               ; preds = %33, %23
  %36 = phi i32 [ %24, %23 ], [ %34, %33 ]
  store i32 %36, ptr %9, align 4
  br label %100

37:                                               ; preds = %4
  %38 = load i32, ptr %6, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %53

40:                                               ; preds = %37
  %41 = load i32, ptr %7, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %47

43:                                               ; preds = %40
  %44 = load i32, ptr %6, align 4
  %45 = load i32, ptr %7, align 4
  %46 = add nsw i32 %44, %45
  br label %51

47:                                               ; preds = %40
  %48 = load i32, ptr %6, align 4
  %49 = load i32, ptr %7, align 4
  %50 = sub nsw i32 %48, %49
  br label %51

51:                                               ; preds = %47, %43
  %52 = phi i32 [ %46, %43 ], [ %50, %47 ]
  br label %64

53:                                               ; preds = %37
  %54 = load i32, ptr %8, align 4
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %59

56:                                               ; preds = %53
  %57 = load i32, ptr %8, align 4
  %58 = mul nsw i32 %57, 2
  br label %62

59:                                               ; preds = %53
  %60 = load i32, ptr %8, align 4
  %61 = sub nsw i32 %60, 2
  br label %62

62:                                               ; preds = %59, %56
  %63 = phi i32 [ %58, %56 ], [ %61, %59 ]
  br label %64

64:                                               ; preds = %62, %51
  %65 = phi i32 [ %52, %51 ], [ %63, %62 ]
  store i32 %65, ptr %9, align 4
  br label %100

66:                                               ; preds = %4
  %67 = load i32, ptr %6, align 4
  %68 = load i32, ptr %7, align 4
  %69 = icmp eq i32 %67, %68
  br i1 %69, label %70, label %76

70:                                               ; preds = %66
  %71 = load i32, ptr %7, align 4
  %72 = load i32, ptr %8, align 4
  %73 = icmp eq i32 %71, %72
  %74 = zext i1 %73 to i64
  %75 = select i1 %73, i32 1, i32 2
  br label %82

76:                                               ; preds = %66
  %77 = load i32, ptr %6, align 4
  %78 = load i32, ptr %8, align 4
  %79 = icmp eq i32 %77, %78
  %80 = zext i1 %79 to i64
  %81 = select i1 %79, i32 3, i32 4
  br label %82

82:                                               ; preds = %76, %70
  %83 = phi i32 [ %75, %70 ], [ %81, %76 ]
  store i32 %83, ptr %9, align 4
  br label %100

84:                                               ; preds = %4
  %85 = load i32, ptr %6, align 4
  %86 = icmp sgt i32 %85, 0
  br i1 %86, label %87, label %89

87:                                               ; preds = %84
  %88 = load i32, ptr %6, align 4
  br label %98

89:                                               ; preds = %84
  %90 = load i32, ptr %7, align 4
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %92, label %94

92:                                               ; preds = %89
  %93 = load i32, ptr %7, align 4
  br label %96

94:                                               ; preds = %89
  %95 = load i32, ptr %8, align 4
  br label %96

96:                                               ; preds = %94, %92
  %97 = phi i32 [ %93, %92 ], [ %95, %94 ]
  br label %98

98:                                               ; preds = %96, %87
  %99 = phi i32 [ %88, %87 ], [ %97, %96 ]
  store i32 %99, ptr %9, align 4
  br label %100

100:                                              ; preds = %98, %82, %64, %35
  %101 = load i32, ptr %9, align 4
  ret i32 %101
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_107_switch_for(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 0, ptr %7, align 4
  %12 = load i32, ptr %4, align 4
  switch i32 %12, label %61 [
    i32 0, label %13
    i32 1, label %28
    i32 2, label %43
  ]

13:                                               ; preds = %3
  store i32 0, ptr %8, align 4
  br label %14

14:                                               ; preds = %24, %13
  %15 = load i32, ptr %8, align 4
  %16 = load i32, ptr %5, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %27

18:                                               ; preds = %14
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %8, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %7, align 4
  br label %24

24:                                               ; preds = %18
  %25 = load i32, ptr %8, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %8, align 4
  br label %14, !llvm.loop !46

27:                                               ; preds = %14
  br label %74

28:                                               ; preds = %3
  store i32 0, ptr %9, align 4
  br label %29

29:                                               ; preds = %39, %28
  %30 = load i32, ptr %9, align 4
  %31 = load i32, ptr %5, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %42

33:                                               ; preds = %29
  %34 = load i32, ptr %6, align 4
  %35 = load i32, ptr %9, align 4
  %36 = mul nsw i32 %34, %35
  %37 = load i32, ptr %7, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %7, align 4
  br label %39

39:                                               ; preds = %33
  %40 = load i32, ptr %9, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %9, align 4
  br label %29, !llvm.loop !47

42:                                               ; preds = %29
  br label %74

43:                                               ; preds = %3
  store i32 0, ptr %10, align 4
  br label %44

44:                                               ; preds = %57, %43
  %45 = load i32, ptr %10, align 4
  %46 = load i32, ptr %5, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %60

48:                                               ; preds = %44
  %49 = load i32, ptr %10, align 4
  %50 = srem i32 %49, 2
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %56

52:                                               ; preds = %48
  %53 = load i32, ptr %10, align 4
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %7, align 4
  br label %56

56:                                               ; preds = %52, %48
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %10, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %10, align 4
  br label %44, !llvm.loop !48

60:                                               ; preds = %44
  br label %74

61:                                               ; preds = %3
  store i32 0, ptr %11, align 4
  br label %62

62:                                               ; preds = %70, %61
  %63 = load i32, ptr %11, align 4
  %64 = load i32, ptr %5, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %73

66:                                               ; preds = %62
  %67 = load i32, ptr %11, align 4
  %68 = load i32, ptr %7, align 4
  %69 = sub nsw i32 %68, %67
  store i32 %69, ptr %7, align 4
  br label %70

70:                                               ; preds = %66
  %71 = load i32, ptr %11, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %11, align 4
  br label %62, !llvm.loop !49

73:                                               ; preds = %62
  br label %74

74:                                               ; preds = %73, %60, %42, %27
  %75 = load i32, ptr %7, align 4
  ret i32 %75
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_108_switch_while(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %11 = load i32, ptr %4, align 4
  switch i32 %11, label %52 [
    i32 0, label %12
    i32 1, label %26
    i32 2, label %40
  ]

12:                                               ; preds = %3
  store i32 0, ptr %8, align 4
  br label %13

13:                                               ; preds = %17, %12
  %14 = load i32, ptr %8, align 4
  %15 = load i32, ptr %5, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %25

17:                                               ; preds = %13
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %8, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %7, align 4
  %23 = load i32, ptr %8, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %8, align 4
  br label %13, !llvm.loop !50

25:                                               ; preds = %13
  br label %56

26:                                               ; preds = %3
  store i32 0, ptr %9, align 4
  br label %27

27:                                               ; preds = %31, %26
  %28 = load i32, ptr %9, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %39

31:                                               ; preds = %27
  %32 = load i32, ptr %6, align 4
  %33 = load i32, ptr %9, align 4
  %34 = sub nsw i32 %32, %33
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %7, align 4
  %37 = load i32, ptr %9, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %9, align 4
  br label %27, !llvm.loop !51

39:                                               ; preds = %27
  br label %56

40:                                               ; preds = %3
  %41 = load i32, ptr %5, align 4
  store i32 %41, ptr %10, align 4
  br label %42

42:                                               ; preds = %45, %40
  %43 = load i32, ptr %10, align 4
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %45, label %51

45:                                               ; preds = %42
  %46 = load i32, ptr %10, align 4
  %47 = load i32, ptr %7, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %7, align 4
  %49 = load i32, ptr %10, align 4
  %50 = add nsw i32 %49, -1
  store i32 %50, ptr %10, align 4
  br label %42, !llvm.loop !52

51:                                               ; preds = %42
  br label %56

52:                                               ; preds = %3
  %53 = load i32, ptr %5, align 4
  %54 = load i32, ptr %6, align 4
  %55 = add nsw i32 %53, %54
  store i32 %55, ptr %7, align 4
  br label %56

56:                                               ; preds = %52, %51, %39, %25
  %57 = load i32, ptr %7, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_109_switch_nested_for(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %103 [
    i32 0, label %15
    i32 1, label %39
    i32 2, label %73
  ]

15:                                               ; preds = %3
  store i32 0, ptr %8, align 4
  br label %16

16:                                               ; preds = %35, %15
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %38

20:                                               ; preds = %16
  store i32 0, ptr %9, align 4
  br label %21

21:                                               ; preds = %31, %20
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %6, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %34

25:                                               ; preds = %21
  %26 = load i32, ptr %8, align 4
  %27 = load i32, ptr %9, align 4
  %28 = mul nsw i32 %26, %27
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %25
  %32 = load i32, ptr %9, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %9, align 4
  br label %21, !llvm.loop !53

34:                                               ; preds = %21
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %8, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %8, align 4
  br label %16, !llvm.loop !54

38:                                               ; preds = %16
  br label %107

39:                                               ; preds = %3
  store i32 0, ptr %10, align 4
  br label %40

40:                                               ; preds = %69, %39
  %41 = load i32, ptr %10, align 4
  %42 = load i32, ptr %5, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %72

44:                                               ; preds = %40
  store i32 0, ptr %11, align 4
  br label %45

45:                                               ; preds = %65, %44
  %46 = load i32, ptr %11, align 4
  %47 = load i32, ptr %6, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %68

49:                                               ; preds = %45
  %50 = load i32, ptr %10, align 4
  %51 = load i32, ptr %11, align 4
  %52 = add nsw i32 %50, %51
  %53 = srem i32 %52, 2
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %61

55:                                               ; preds = %49
  %56 = load i32, ptr %10, align 4
  %57 = load i32, ptr %11, align 4
  %58 = add nsw i32 %56, %57
  %59 = load i32, ptr %7, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %7, align 4
  br label %64

61:                                               ; preds = %49
  %62 = load i32, ptr %7, align 4
  %63 = sub nsw i32 %62, 1
  store i32 %63, ptr %7, align 4
  br label %64

64:                                               ; preds = %61, %55
  br label %65

65:                                               ; preds = %64
  %66 = load i32, ptr %11, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %11, align 4
  br label %45, !llvm.loop !55

68:                                               ; preds = %45
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %10, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %10, align 4
  br label %40, !llvm.loop !56

72:                                               ; preds = %40
  br label %107

73:                                               ; preds = %3
  store i32 0, ptr %12, align 4
  br label %74

74:                                               ; preds = %99, %73
  %75 = load i32, ptr %12, align 4
  %76 = load i32, ptr %5, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %102

78:                                               ; preds = %74
  store i32 0, ptr %13, align 4
  br label %79

79:                                               ; preds = %95, %78
  %80 = load i32, ptr %13, align 4
  %81 = load i32, ptr %6, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %98

83:                                               ; preds = %79
  %84 = load i32, ptr %12, align 4
  %85 = load i32, ptr %13, align 4
  %86 = icmp sgt i32 %84, %85
  br i1 %86, label %87, label %89

87:                                               ; preds = %83
  %88 = load i32, ptr %12, align 4
  br label %91

89:                                               ; preds = %83
  %90 = load i32, ptr %13, align 4
  br label %91

91:                                               ; preds = %89, %87
  %92 = phi i32 [ %88, %87 ], [ %90, %89 ]
  %93 = load i32, ptr %7, align 4
  %94 = add nsw i32 %93, %92
  store i32 %94, ptr %7, align 4
  br label %95

95:                                               ; preds = %91
  %96 = load i32, ptr %13, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %13, align 4
  br label %79, !llvm.loop !57

98:                                               ; preds = %79
  br label %99

99:                                               ; preds = %98
  %100 = load i32, ptr %12, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, ptr %12, align 4
  br label %74, !llvm.loop !58

102:                                              ; preds = %74
  br label %107

103:                                              ; preds = %3
  %104 = load i32, ptr %5, align 4
  %105 = load i32, ptr %6, align 4
  %106 = mul nsw i32 %104, %105
  store i32 %106, ptr %7, align 4
  br label %107

107:                                              ; preds = %103, %102, %72, %38
  %108 = load i32, ptr %7, align 4
  ret i32 %108
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_110_switch_do_while(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %46 [
    i32 0, label %11
    i32 1, label %25
  ]

11:                                               ; preds = %3
  store i32 0, ptr %8, align 4
  br label %12

12:                                               ; preds = %20, %11
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %8, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %7, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %7, align 4
  %18 = load i32, ptr %8, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %8, align 4
  br label %20

20:                                               ; preds = %12
  %21 = load i32, ptr %8, align 4
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %12, label %24, !llvm.loop !59

24:                                               ; preds = %20
  br label %48

25:                                               ; preds = %3
  store i32 0, ptr %9, align 4
  br label %26

26:                                               ; preds = %41, %25
  %27 = load i32, ptr %9, align 4
  %28 = srem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

30:                                               ; preds = %26
  %31 = load i32, ptr %9, align 4
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %7, align 4
  br label %38

34:                                               ; preds = %26
  %35 = load i32, ptr %9, align 4
  %36 = load i32, ptr %7, align 4
  %37 = sub nsw i32 %36, %35
  store i32 %37, ptr %7, align 4
  br label %38

38:                                               ; preds = %34, %30
  %39 = load i32, ptr %9, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %9, align 4
  br label %41

41:                                               ; preds = %38
  %42 = load i32, ptr %9, align 4
  %43 = load i32, ptr %5, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %26, label %45, !llvm.loop !60

45:                                               ; preds = %41
  br label %48

46:                                               ; preds = %3
  %47 = load i32, ptr %6, align 4
  store i32 %47, ptr %7, align 4
  br label %48

48:                                               ; preds = %46, %45, %24
  %49 = load i32, ptr %7, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_111_switch_array(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %6 = load i32, ptr %3, align 4
  switch i32 %6, label %32 [
    i32 0, label %7
    i32 1, label %12
    i32 2, label %18
    i32 3, label %25
  ]

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  store i32 %11, ptr %5, align 4
  br label %45

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %5, align 4
  br label %45

18:                                               ; preds = %2
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr @g_arr, align 16
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %5, align 4
  br label %45

25:                                               ; preds = %2
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %31 = sub nsw i32 %29, %30
  store i32 %31, ptr %5, align 4
  br label %45

32:                                               ; preds = %2
  %33 = load i32, ptr @g_arr, align 16
  %34 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %5, align 4
  %36 = load i32, ptr %5, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %32
  %39 = load i32, ptr %5, align 4
  %40 = mul nsw i32 %39, 2
  store i32 %40, ptr %5, align 4
  br label %44

41:                                               ; preds = %32
  %42 = load i32, ptr %5, align 4
  %43 = sub nsw i32 %42, 2
  store i32 %43, ptr %5, align 4
  br label %44

44:                                               ; preds = %41, %38
  br label %45

45:                                               ; preds = %44, %25, %18, %12, %7
  %46 = load i32, ptr %5, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_112_switch_matrix_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %60 [
    i32 0, label %9
    i32 1, label %26
    i32 2, label %42
  ]

9:                                                ; preds = %3
  %10 = load i32, ptr %5, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %11
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [3 x i32], ptr %12, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  store i32 %16, ptr %7, align 4
  %17 = load i32, ptr %7, align 4
  %18 = icmp sgt i32 %17, 5
  br i1 %18, label %19, label %22

19:                                               ; preds = %9
  %20 = load i32, ptr %7, align 4
  %21 = mul nsw i32 %20, 2
  store i32 %21, ptr %7, align 4
  br label %25

22:                                               ; preds = %9
  %23 = load i32, ptr %7, align 4
  %24 = sub nsw i32 %23, 2
  store i32 %24, ptr %7, align 4
  br label %25

25:                                               ; preds = %22, %19
  br label %69

26:                                               ; preds = %3
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [3 x i32], ptr @g_mat, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2), i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = add nsw i32 %30, %34
  store i32 %35, ptr %7, align 4
  %36 = load i32, ptr %7, align 4
  %37 = icmp sgt i32 %36, 10
  br i1 %37, label %38, label %41

38:                                               ; preds = %26
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %39, 10
  store i32 %40, ptr %7, align 4
  br label %41

41:                                               ; preds = %38, %26
  br label %69

42:                                               ; preds = %3
  %43 = load i32, ptr %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %44
  %46 = getelementptr inbounds [3 x i32], ptr %45, i64 0, i64 0
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr %5, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %49
  %51 = getelementptr inbounds [3 x i32], ptr %50, i64 0, i64 2
  %52 = load i32, ptr %51, align 4
  %53 = sub nsw i32 %47, %52
  store i32 %53, ptr %7, align 4
  %54 = load i32, ptr %7, align 4
  %55 = icmp slt i32 %54, 0
  br i1 %55, label %56, label %59

56:                                               ; preds = %42
  %57 = load i32, ptr %7, align 4
  %58 = sub nsw i32 0, %57
  store i32 %58, ptr %7, align 4
  br label %59

59:                                               ; preds = %56, %42
  br label %69

60:                                               ; preds = %3
  %61 = load i32, ptr @g_mat, align 16
  store i32 %61, ptr %7, align 4
  %62 = load i32, ptr %5, align 4
  %63 = load i32, ptr %6, align 4
  %64 = icmp eq i32 %62, %63
  br i1 %64, label %65, label %68

65:                                               ; preds = %60
  %66 = load i32, ptr %7, align 4
  %67 = add nsw i32 %66, 100
  store i32 %67, ptr %7, align 4
  br label %68

68:                                               ; preds = %65, %60
  br label %69

69:                                               ; preds = %68, %59, %41, %25
  %70 = load i32, ptr %7, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_113_switch_pointer(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %41 [
    i32 0, label %9
    i32 1, label %14
    i32 2, label %20
    i32 3, label %26
  ]

9:                                                ; preds = %3
  %10 = load i32, ptr %6, align 4
  %11 = load ptr, ptr %5, align 8
  store i32 %10, ptr %11, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = load i32, ptr %12, align 4
  store i32 %13, ptr %7, align 4
  br label %44

14:                                               ; preds = %3
  %15 = load i32, ptr %6, align 4
  %16 = mul nsw i32 %15, 2
  %17 = load ptr, ptr %5, align 8
  store i32 %16, ptr %17, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %18, align 4
  store i32 %19, ptr %7, align 4
  br label %44

20:                                               ; preds = %3
  %21 = load ptr, ptr %5, align 8
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 %22, 10
  store i32 %23, ptr %21, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %24, align 4
  store i32 %25, ptr %7, align 4
  br label %44

26:                                               ; preds = %3
  %27 = load ptr, ptr %5, align 8
  %28 = load i32, ptr %27, align 4
  %29 = sub nsw i32 %28, 10
  store i32 %29, ptr %27, align 4
  %30 = load ptr, ptr %5, align 8
  %31 = load i32, ptr %30, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %36

33:                                               ; preds = %26
  %34 = load ptr, ptr %5, align 8
  %35 = load i32, ptr %34, align 4
  store i32 %35, ptr %7, align 4
  br label %40

36:                                               ; preds = %26
  %37 = load ptr, ptr %5, align 8
  %38 = load i32, ptr %37, align 4
  %39 = sub nsw i32 0, %38
  store i32 %39, ptr %7, align 4
  br label %40

40:                                               ; preds = %36, %33
  br label %44

41:                                               ; preds = %3
  %42 = load ptr, ptr %5, align 8
  %43 = load i32, ptr %42, align 4
  store i32 %43, ptr %7, align 4
  br label %44

44:                                               ; preds = %41, %40, %20, %14, %9
  %45 = load i32, ptr %7, align 4
  ret i32 %45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_114_switch_pointer_array(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %69 [
    i32 0, label %9
    i32 1, label %23
    i32 2, label %38
  ]

9:                                                ; preds = %3
  %10 = load i32, ptr %6, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = load ptr, ptr %5, align 8
  %15 = load i32, ptr %6, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %14, i64 %16
  store i32 %13, ptr %17, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %6, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  %22 = load i32, ptr %21, align 4
  store i32 %22, ptr %7, align 4
  br label %80

23:                                               ; preds = %3
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = mul nsw i32 %27, 2
  %29 = load ptr, ptr %5, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 %28, ptr %32, align 4
  %33 = load ptr, ptr %5, align 8
  %34 = load i32, ptr %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr %33, i64 %35
  %37 = load i32, ptr %36, align 4
  store i32 %37, ptr %7, align 4
  br label %80

38:                                               ; preds = %3
  %39 = load i32, ptr %6, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load ptr, ptr %5, align 8
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = add nsw i32 %47, %42
  store i32 %48, ptr %46, align 4
  %49 = load ptr, ptr %5, align 8
  %50 = load i32, ptr %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %49, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %55, label %61

55:                                               ; preds = %38
  %56 = load ptr, ptr %5, align 8
  %57 = load i32, ptr %6, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %56, i64 %58
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %7, align 4
  br label %68

61:                                               ; preds = %38
  %62 = load ptr, ptr %5, align 8
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %62, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = sub nsw i32 0, %66
  store i32 %67, ptr %7, align 4
  br label %68

68:                                               ; preds = %61, %55
  br label %80

69:                                               ; preds = %3
  %70 = load ptr, ptr %5, align 8
  %71 = load i32, ptr %6, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, ptr %70, i64 %72
  %74 = load i32, ptr %73, align 4
  %75 = load i32, ptr %6, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = add nsw i32 %74, %78
  store i32 %79, ptr %7, align 4
  br label %80

80:                                               ; preds = %69, %68, %23, %9
  %81 = load i32, ptr %7, align 4
  ret i32 %81
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_115_switch_array_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %103 [
    i32 0, label %11
    i32 1, label %32
    i32 2, label %67
  ]

11:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %28, %11
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %19

16:                                               ; preds = %12
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %17, 8
  br label %19

19:                                               ; preds = %16, %12
  %20 = phi i1 [ false, %12 ], [ %18, %16 ]
  br i1 %20, label %21, label %31

21:                                               ; preds = %19
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %5, align 4
  br label %28

28:                                               ; preds = %21
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  br label %12, !llvm.loop !61

31:                                               ; preds = %19
  br label %119

32:                                               ; preds = %2
  store i32 0, ptr %7, align 4
  br label %33

33:                                               ; preds = %63, %32
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %33
  %38 = load i32, ptr %7, align 4
  %39 = icmp slt i32 %38, 8
  br label %40

40:                                               ; preds = %37, %33
  %41 = phi i1 [ false, %33 ], [ %39, %37 ]
  br i1 %41, label %42, label %66

42:                                               ; preds = %40
  %43 = load i32, ptr %7, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %48, label %55

48:                                               ; preds = %42
  %49 = load i32, ptr %7, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = load i32, ptr %5, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %5, align 4
  br label %62

55:                                               ; preds = %42
  %56 = load i32, ptr %7, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %5, align 4
  %61 = sub nsw i32 %60, %59
  store i32 %61, ptr %5, align 4
  br label %62

62:                                               ; preds = %55, %48
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %7, align 4
  br label %33, !llvm.loop !62

66:                                               ; preds = %40
  br label %119

67:                                               ; preds = %2
  store i32 0, ptr %8, align 4
  br label %68

68:                                               ; preds = %99, %67
  %69 = load i32, ptr %8, align 4
  %70 = load i32, ptr %4, align 4
  %71 = icmp slt i32 %69, %70
  br i1 %71, label %72, label %75

72:                                               ; preds = %68
  %73 = load i32, ptr %8, align 4
  %74 = icmp slt i32 %73, 8
  br label %75

75:                                               ; preds = %72, %68
  %76 = phi i1 [ false, %68 ], [ %74, %72 ]
  br i1 %76, label %77, label %102

77:                                               ; preds = %75
  %78 = load i32, ptr %8, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = icmp sgt i32 %81, 0
  br i1 %82, label %83, label %89

83:                                               ; preds = %77
  %84 = load i32, ptr %8, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = mul nsw i32 %87, 2
  br label %95

89:                                               ; preds = %77
  %90 = load i32, ptr %8, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %91
  %93 = load i32, ptr %92, align 4
  %94 = sub nsw i32 %93, 2
  br label %95

95:                                               ; preds = %89, %83
  %96 = phi i32 [ %88, %83 ], [ %94, %89 ]
  %97 = load i32, ptr %5, align 4
  %98 = add nsw i32 %97, %96
  store i32 %98, ptr %5, align 4
  br label %99

99:                                               ; preds = %95
  %100 = load i32, ptr %8, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, ptr %8, align 4
  br label %68, !llvm.loop !63

102:                                              ; preds = %75
  br label %119

103:                                              ; preds = %2
  %104 = load i32, ptr @g_arr, align 16
  store i32 %104, ptr %5, align 4
  store i32 1, ptr %9, align 4
  br label %105

105:                                              ; preds = %115, %103
  %106 = load i32, ptr %9, align 4
  %107 = icmp slt i32 %106, 8
  br i1 %107, label %108, label %118

108:                                              ; preds = %105
  %109 = load i32, ptr %9, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = load i32, ptr %5, align 4
  %114 = add nsw i32 %113, %112
  store i32 %114, ptr %5, align 4
  br label %115

115:                                              ; preds = %108
  %116 = load i32, ptr %9, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %9, align 4
  br label %105, !llvm.loop !64

118:                                              ; preds = %105
  br label %119

119:                                              ; preds = %118, %102, %66, %31
  %120 = load i32, ptr %5, align 4
  ret i32 %120
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_116_switch_pointer_loop(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  %14 = load i32, ptr %5, align 4
  switch i32 %14, label %121 [
    i32 0, label %15
    i32 1, label %48
    i32 2, label %88
  ]

15:                                               ; preds = %4
  store i32 0, ptr %10, align 4
  br label %16

16:                                               ; preds = %28, %15
  %17 = load i32, ptr %10, align 4
  %18 = load i32, ptr %7, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %31

20:                                               ; preds = %16
  %21 = load i32, ptr %8, align 4
  %22 = load i32, ptr %10, align 4
  %23 = add nsw i32 %21, %22
  %24 = load ptr, ptr %6, align 8
  %25 = load i32, ptr %10, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %24, i64 %26
  store i32 %23, ptr %27, align 4
  br label %28

28:                                               ; preds = %20
  %29 = load i32, ptr %10, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %10, align 4
  br label %16, !llvm.loop !65

31:                                               ; preds = %16
  store i32 0, ptr %11, align 4
  br label %32

32:                                               ; preds = %44, %31
  %33 = load i32, ptr %11, align 4
  %34 = load i32, ptr %7, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %47

36:                                               ; preds = %32
  %37 = load ptr, ptr %6, align 8
  %38 = load i32, ptr %11, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %37, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = load i32, ptr %9, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %9, align 4
  br label %44

44:                                               ; preds = %36
  %45 = load i32, ptr %11, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %11, align 4
  br label %32, !llvm.loop !66

47:                                               ; preds = %32
  br label %131

48:                                               ; preds = %4
  store i32 0, ptr %12, align 4
  br label %49

49:                                               ; preds = %84, %48
  %50 = load i32, ptr %12, align 4
  %51 = load i32, ptr %7, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %87

53:                                               ; preds = %49
  %54 = load i32, ptr %8, align 4
  %55 = load i32, ptr %12, align 4
  %56 = sub nsw i32 %54, %55
  %57 = load ptr, ptr %6, align 8
  %58 = load i32, ptr %12, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  store i32 %56, ptr %60, align 4
  %61 = load ptr, ptr %6, align 8
  %62 = load i32, ptr %12, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr %61, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = icmp sgt i32 %65, 0
  br i1 %66, label %67, label %75

67:                                               ; preds = %53
  %68 = load ptr, ptr %6, align 8
  %69 = load i32, ptr %12, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, ptr %68, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = load i32, ptr %9, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %9, align 4
  br label %83

75:                                               ; preds = %53
  %76 = load ptr, ptr %6, align 8
  %77 = load i32, ptr %12, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, ptr %76, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = load i32, ptr %9, align 4
  %82 = sub nsw i32 %81, %80
  store i32 %82, ptr %9, align 4
  br label %83

83:                                               ; preds = %75, %67
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr %12, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %12, align 4
  br label %49, !llvm.loop !67

87:                                               ; preds = %49
  br label %131

88:                                               ; preds = %4
  store i32 0, ptr %13, align 4
  br label %89

89:                                               ; preds = %111, %88
  %90 = load i32, ptr %13, align 4
  %91 = load i32, ptr %7, align 4
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %93, label %114

93:                                               ; preds = %89
  %94 = load i32, ptr %13, align 4
  %95 = srem i32 %94, 2
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %101

97:                                               ; preds = %93
  %98 = load i32, ptr %8, align 4
  %99 = load i32, ptr %13, align 4
  %100 = add nsw i32 %98, %99
  br label %105

101:                                              ; preds = %93
  %102 = load i32, ptr %8, align 4
  %103 = load i32, ptr %13, align 4
  %104 = sub nsw i32 %102, %103
  br label %105

105:                                              ; preds = %101, %97
  %106 = phi i32 [ %100, %97 ], [ %104, %101 ]
  %107 = load ptr, ptr %6, align 8
  %108 = load i32, ptr %13, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, ptr %107, i64 %109
  store i32 %106, ptr %110, align 4
  br label %111

111:                                              ; preds = %105
  %112 = load i32, ptr %13, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %13, align 4
  br label %89, !llvm.loop !68

114:                                              ; preds = %89
  %115 = load ptr, ptr %6, align 8
  %116 = load i32, ptr %7, align 4
  %117 = sub nsw i32 %116, 1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, ptr %115, i64 %118
  %120 = load i32, ptr %119, align 4
  store i32 %120, ptr %9, align 4
  br label %131

121:                                              ; preds = %4
  %122 = load ptr, ptr %6, align 8
  %123 = getelementptr inbounds i32, ptr %122, i64 0
  %124 = load i32, ptr %123, align 4
  store i32 %124, ptr %9, align 4
  %125 = load i32, ptr %9, align 4
  %126 = icmp slt i32 %125, 0
  br i1 %126, label %127, label %130

127:                                              ; preds = %121
  %128 = load i32, ptr %9, align 4
  %129 = sub nsw i32 0, %128
  store i32 %129, ptr %9, align 4
  br label %130

130:                                              ; preds = %127, %121
  br label %131

131:                                              ; preds = %130, %114, %87, %47
  %132 = load i32, ptr %9, align 4
  ret i32 %132
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_117_switch_ternary_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  %14 = load i32, ptr %5, align 4
  switch i32 %14, label %94 [
    i32 0, label %15
    i32 1, label %40
    i32 2, label %62
  ]

15:                                               ; preds = %4
  store i32 0, ptr %10, align 4
  br label %16

16:                                               ; preds = %36, %15
  %17 = load i32, ptr %10, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %39

20:                                               ; preds = %16
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %8, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %28

24:                                               ; preds = %20
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %10, align 4
  %27 = add nsw i32 %25, %26
  br label %32

28:                                               ; preds = %20
  %29 = load i32, ptr %8, align 4
  %30 = load i32, ptr %10, align 4
  %31 = sub nsw i32 %29, %30
  br label %32

32:                                               ; preds = %28, %24
  %33 = phi i32 [ %27, %24 ], [ %31, %28 ]
  %34 = load i32, ptr %9, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %9, align 4
  br label %36

36:                                               ; preds = %32
  %37 = load i32, ptr %10, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %10, align 4
  br label %16, !llvm.loop !69

39:                                               ; preds = %16
  br label %104

40:                                               ; preds = %4
  store i32 0, ptr %11, align 4
  br label %41

41:                                               ; preds = %58, %40
  %42 = load i32, ptr %11, align 4
  %43 = load i32, ptr %6, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %61

45:                                               ; preds = %41
  %46 = load i32, ptr %11, align 4
  %47 = srem i32 %46, 2
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %51

49:                                               ; preds = %45
  %50 = load i32, ptr %7, align 4
  br label %53

51:                                               ; preds = %45
  %52 = load i32, ptr %8, align 4
  br label %53

53:                                               ; preds = %51, %49
  %54 = phi i32 [ %50, %49 ], [ %52, %51 ]
  store i32 %54, ptr %12, align 4
  %55 = load i32, ptr %12, align 4
  %56 = load i32, ptr %9, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %9, align 4
  br label %58

58:                                               ; preds = %53
  %59 = load i32, ptr %11, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %11, align 4
  br label %41, !llvm.loop !70

61:                                               ; preds = %41
  br label %104

62:                                               ; preds = %4
  store i32 0, ptr %13, align 4
  br label %63

63:                                               ; preds = %90, %62
  %64 = load i32, ptr %13, align 4
  %65 = load i32, ptr %6, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %93

67:                                               ; preds = %63
  %68 = load i32, ptr %13, align 4
  %69 = icmp sgt i32 %68, 2
  br i1 %69, label %70, label %85

70:                                               ; preds = %67
  %71 = load i32, ptr %7, align 4
  %72 = icmp sgt i32 %71, 0
  br i1 %72, label %73, label %77

73:                                               ; preds = %70
  %74 = load i32, ptr %7, align 4
  %75 = load i32, ptr %13, align 4
  %76 = mul nsw i32 %74, %75
  br label %81

77:                                               ; preds = %70
  %78 = load i32, ptr %8, align 4
  %79 = load i32, ptr %13, align 4
  %80 = mul nsw i32 %78, %79
  br label %81

81:                                               ; preds = %77, %73
  %82 = phi i32 [ %76, %73 ], [ %80, %77 ]
  %83 = load i32, ptr %9, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, ptr %9, align 4
  br label %89

85:                                               ; preds = %67
  %86 = load i32, ptr %13, align 4
  %87 = load i32, ptr %9, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, ptr %9, align 4
  br label %89

89:                                               ; preds = %85, %81
  br label %90

90:                                               ; preds = %89
  %91 = load i32, ptr %13, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %13, align 4
  br label %63, !llvm.loop !71

93:                                               ; preds = %63
  br label %104

94:                                               ; preds = %4
  %95 = load i32, ptr %7, align 4
  %96 = load i32, ptr %8, align 4
  %97 = icmp sgt i32 %95, %96
  br i1 %97, label %98, label %100

98:                                               ; preds = %94
  %99 = load i32, ptr %7, align 4
  br label %102

100:                                              ; preds = %94
  %101 = load i32, ptr %8, align 4
  br label %102

102:                                              ; preds = %100, %98
  %103 = phi i32 [ %99, %98 ], [ %101, %100 ]
  store i32 %103, ptr %9, align 4
  br label %104

104:                                              ; preds = %102, %93, %61, %39
  %105 = load i32, ptr %9, align 4
  ret i32 %105
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_118_nested_switch_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %4, align 4
  switch i32 %8, label %48 [
    i32 0, label %9
    i32 1, label %30
  ]

9:                                                ; preds = %3
  %10 = load i32, ptr %5, align 4
  switch i32 %10, label %17 [
    i32 0, label %11
    i32 1, label %14
  ]

11:                                               ; preds = %9
  %12 = load i32, ptr %6, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %7, align 4
  br label %20

14:                                               ; preds = %9
  %15 = load i32, ptr %6, align 4
  %16 = add nsw i32 %15, 20
  store i32 %16, ptr %7, align 4
  br label %20

17:                                               ; preds = %9
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, 30
  store i32 %19, ptr %7, align 4
  br label %20

20:                                               ; preds = %17, %14, %11
  %21 = load i32, ptr %7, align 4
  %22 = icmp sgt i32 %21, 20
  br i1 %22, label %23, label %26

23:                                               ; preds = %20
  %24 = load i32, ptr %7, align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, ptr %7, align 4
  br label %29

26:                                               ; preds = %20
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %27, 5
  store i32 %28, ptr %7, align 4
  br label %29

29:                                               ; preds = %26, %23
  br label %50

30:                                               ; preds = %3
  %31 = load i32, ptr %5, align 4
  switch i32 %31, label %38 [
    i32 0, label %32
    i32 1, label %35
  ]

32:                                               ; preds = %30
  %33 = load i32, ptr %6, align 4
  %34 = sub nsw i32 %33, 10
  store i32 %34, ptr %7, align 4
  br label %41

35:                                               ; preds = %30
  %36 = load i32, ptr %6, align 4
  %37 = sub nsw i32 %36, 20
  store i32 %37, ptr %7, align 4
  br label %41

38:                                               ; preds = %30
  %39 = load i32, ptr %6, align 4
  %40 = sub nsw i32 %39, 30
  store i32 %40, ptr %7, align 4
  br label %41

41:                                               ; preds = %38, %35, %32
  %42 = load i32, ptr %7, align 4
  %43 = icmp slt i32 %42, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %41
  %45 = load i32, ptr %7, align 4
  %46 = sub nsw i32 0, %45
  store i32 %46, ptr %7, align 4
  br label %47

47:                                               ; preds = %44, %41
  br label %50

48:                                               ; preds = %3
  %49 = load i32, ptr %6, align 4
  store i32 %49, ptr %7, align 4
  br label %50

50:                                               ; preds = %48, %47, %29
  %51 = load i32, ptr %7, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_119_nested_switch_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %60 [
    i32 0, label %11
    i32 1, label %36
  ]

11:                                               ; preds = %3
  store i32 0, ptr %8, align 4
  br label %12

12:                                               ; preds = %32, %11
  %13 = load i32, ptr %8, align 4
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %35

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  switch i32 %17, label %27 [
    i32 0, label %18
    i32 1, label %22
  ]

18:                                               ; preds = %16
  %19 = load i32, ptr %8, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %7, align 4
  br label %31

22:                                               ; preds = %16
  %23 = load i32, ptr %8, align 4
  %24 = mul nsw i32 %23, 2
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %7, align 4
  br label %31

27:                                               ; preds = %16
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %7, align 4
  %30 = sub nsw i32 %29, %28
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %27, %22, %18
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %8, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %8, align 4
  br label %12, !llvm.loop !72

35:                                               ; preds = %12
  br label %62

36:                                               ; preds = %3
  store i32 0, ptr %9, align 4
  br label %37

37:                                               ; preds = %56, %36
  %38 = load i32, ptr %9, align 4
  %39 = load i32, ptr %6, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %59

41:                                               ; preds = %37
  %42 = load i32, ptr %5, align 4
  switch i32 %42, label %53 [
    i32 0, label %43
    i32 1, label %48
  ]

43:                                               ; preds = %41
  %44 = load i32, ptr %9, align 4
  %45 = add nsw i32 %44, 10
  %46 = load i32, ptr %7, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %7, align 4
  br label %56

48:                                               ; preds = %41
  %49 = load i32, ptr %9, align 4
  %50 = mul nsw i32 %49, 3
  %51 = load i32, ptr %7, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %7, align 4
  br label %56

53:                                               ; preds = %41
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %7, align 4
  br label %56

56:                                               ; preds = %53, %48, %43
  %57 = load i32, ptr %9, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %9, align 4
  br label %37, !llvm.loop !73

59:                                               ; preds = %37
  br label %62

60:                                               ; preds = %3
  %61 = load i32, ptr %6, align 4
  store i32 %61, ptr %7, align 4
  br label %62

62:                                               ; preds = %60, %59, %35
  %63 = load i32, ptr %7, align 4
  ret i32 %63
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_120_switch_nested_for_if_ternary(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  %14 = load i32, ptr %5, align 4
  switch i32 %14, label %115 [
    i32 0, label %15
    i32 1, label %66
  ]

15:                                               ; preds = %4
  store i32 0, ptr %10, align 4
  br label %16

16:                                               ; preds = %62, %15
  %17 = load i32, ptr %10, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %65

20:                                               ; preds = %16
  store i32 0, ptr %11, align 4
  br label %21

21:                                               ; preds = %58, %20
  %22 = load i32, ptr %11, align 4
  %23 = load i32, ptr %6, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %61

25:                                               ; preds = %21
  %26 = load i32, ptr %10, align 4
  %27 = load i32, ptr %11, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %29, label %45

29:                                               ; preds = %25
  %30 = load i32, ptr %7, align 4
  %31 = load i32, ptr %8, align 4
  %32 = icmp sgt i32 %30, %31
  br i1 %32, label %33, label %37

33:                                               ; preds = %29
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %10, align 4
  %36 = add nsw i32 %34, %35
  br label %41

37:                                               ; preds = %29
  %38 = load i32, ptr %8, align 4
  %39 = load i32, ptr %11, align 4
  %40 = add nsw i32 %38, %39
  br label %41

41:                                               ; preds = %37, %33
  %42 = phi i32 [ %36, %33 ], [ %40, %37 ]
  %43 = load i32, ptr %9, align 4
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr %9, align 4
  br label %57

45:                                               ; preds = %25
  %46 = load i32, ptr %7, align 4
  %47 = load i32, ptr %8, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %51

49:                                               ; preds = %45
  %50 = load i32, ptr %10, align 4
  br label %53

51:                                               ; preds = %45
  %52 = load i32, ptr %11, align 4
  br label %53

53:                                               ; preds = %51, %49
  %54 = phi i32 [ %50, %49 ], [ %52, %51 ]
  %55 = load i32, ptr %9, align 4
  %56 = sub nsw i32 %55, %54
  store i32 %56, ptr %9, align 4
  br label %57

57:                                               ; preds = %53, %41
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %11, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %11, align 4
  br label %21, !llvm.loop !74

61:                                               ; preds = %21
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %10, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %10, align 4
  br label %16, !llvm.loop !75

65:                                               ; preds = %16
  br label %129

66:                                               ; preds = %4
  store i32 0, ptr %12, align 4
  br label %67

67:                                               ; preds = %111, %66
  %68 = load i32, ptr %12, align 4
  %69 = load i32, ptr %6, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %114

71:                                               ; preds = %67
  %72 = load i32, ptr %12, align 4
  %73 = srem i32 %72, 2
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %98

75:                                               ; preds = %71
  store i32 0, ptr %13, align 4
  br label %76

76:                                               ; preds = %94, %75
  %77 = load i32, ptr %13, align 4
  %78 = icmp slt i32 %77, 2
  br i1 %78, label %79, label %97

79:                                               ; preds = %76
  %80 = load i32, ptr %7, align 4
  %81 = icmp sgt i32 %80, 0
  br i1 %81, label %82, label %86

82:                                               ; preds = %79
  %83 = load i32, ptr %7, align 4
  %84 = load i32, ptr %13, align 4
  %85 = add nsw i32 %83, %84
  br label %90

86:                                               ; preds = %79
  %87 = load i32, ptr %8, align 4
  %88 = load i32, ptr %13, align 4
  %89 = sub nsw i32 %87, %88
  br label %90

90:                                               ; preds = %86, %82
  %91 = phi i32 [ %85, %82 ], [ %89, %86 ]
  %92 = load i32, ptr %9, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, ptr %9, align 4
  br label %94

94:                                               ; preds = %90
  %95 = load i32, ptr %13, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, ptr %13, align 4
  br label %76, !llvm.loop !76

97:                                               ; preds = %76
  br label %110

98:                                               ; preds = %71
  %99 = load i32, ptr %7, align 4
  %100 = load i32, ptr %8, align 4
  %101 = icmp sgt i32 %99, %100
  br i1 %101, label %102, label %104

102:                                              ; preds = %98
  %103 = load i32, ptr %7, align 4
  br label %106

104:                                              ; preds = %98
  %105 = load i32, ptr %8, align 4
  br label %106

106:                                              ; preds = %104, %102
  %107 = phi i32 [ %103, %102 ], [ %105, %104 ]
  %108 = load i32, ptr %9, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %9, align 4
  br label %110

110:                                              ; preds = %106, %97
  br label %111

111:                                              ; preds = %110
  %112 = load i32, ptr %12, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %12, align 4
  br label %67, !llvm.loop !77

114:                                              ; preds = %67
  br label %129

115:                                              ; preds = %4
  %116 = load i32, ptr %7, align 4
  %117 = load i32, ptr %8, align 4
  %118 = icmp sgt i32 %116, %117
  br i1 %118, label %119, label %123

119:                                              ; preds = %115
  %120 = load i32, ptr %7, align 4
  %121 = load i32, ptr %8, align 4
  %122 = sub nsw i32 %120, %121
  br label %127

123:                                              ; preds = %115
  %124 = load i32, ptr %8, align 4
  %125 = load i32, ptr %7, align 4
  %126 = sub nsw i32 %124, %125
  br label %127

127:                                              ; preds = %123, %119
  %128 = phi i32 [ %122, %119 ], [ %126, %123 ]
  store i32 %128, ptr %9, align 4
  br label %129

129:                                              ; preds = %127, %114, %65
  %130 = load i32, ptr %9, align 4
  ret i32 %130
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_121_switch_vla_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %3
  %17 = load i32, ptr %5, align 4
  br label %19

18:                                               ; preds = %3
  br label %19

19:                                               ; preds = %18, %16
  %20 = phi i32 [ %17, %16 ], [ 1, %18 ]
  store i32 %20, ptr %7, align 4
  %21 = load i32, ptr %7, align 4
  %22 = zext i32 %21 to i64
  %23 = call ptr @llvm.stacksave()
  store ptr %23, ptr %8, align 8
  %24 = alloca i32, i64 %22, align 16
  store i64 %22, ptr %9, align 8
  store i32 0, ptr %10, align 4
  br label %25

25:                                               ; preds = %36, %19
  %26 = load i32, ptr %10, align 4
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %39

29:                                               ; preds = %25
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %10, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %10, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr %24, i64 %34
  store i32 %32, ptr %35, align 4
  br label %36

36:                                               ; preds = %29
  %37 = load i32, ptr %10, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %10, align 4
  br label %25, !llvm.loop !78

39:                                               ; preds = %25
  store i32 0, ptr %11, align 4
  %40 = load i32, ptr %4, align 4
  switch i32 %40, label %101 [
    i32 0, label %41
    i32 1, label %57
    i32 2, label %87
  ]

41:                                               ; preds = %39
  store i32 0, ptr %12, align 4
  br label %42

42:                                               ; preds = %53, %41
  %43 = load i32, ptr %12, align 4
  %44 = load i32, ptr %7, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %56

46:                                               ; preds = %42
  %47 = load i32, ptr %12, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, ptr %24, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %11, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %11, align 4
  br label %53

53:                                               ; preds = %46
  %54 = load i32, ptr %12, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %12, align 4
  br label %42, !llvm.loop !79

56:                                               ; preds = %42
  br label %104

57:                                               ; preds = %39
  store i32 0, ptr %13, align 4
  br label %58

58:                                               ; preds = %83, %57
  %59 = load i32, ptr %13, align 4
  %60 = load i32, ptr %7, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %86

62:                                               ; preds = %58
  %63 = load i32, ptr %13, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %24, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = icmp sgt i32 %66, 0
  br i1 %67, label %68, label %75

68:                                               ; preds = %62
  %69 = load i32, ptr %13, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, ptr %24, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = load i32, ptr %11, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %11, align 4
  br label %82

75:                                               ; preds = %62
  %76 = load i32, ptr %13, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, ptr %24, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = load i32, ptr %11, align 4
  %81 = sub nsw i32 %80, %79
  store i32 %81, ptr %11, align 4
  br label %82

82:                                               ; preds = %75, %68
  br label %83

83:                                               ; preds = %82
  %84 = load i32, ptr %13, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %13, align 4
  br label %58, !llvm.loop !80

86:                                               ; preds = %58
  br label %104

87:                                               ; preds = %39
  %88 = getelementptr inbounds i32, ptr %24, i64 0
  %89 = load i32, ptr %88, align 16
  store i32 %89, ptr %11, align 4
  %90 = load i32, ptr %7, align 4
  %91 = icmp sgt i32 %90, 1
  br i1 %91, label %92, label %100

92:                                               ; preds = %87
  %93 = load i32, ptr %7, align 4
  %94 = sub nsw i32 %93, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, ptr %24, i64 %95
  %97 = load i32, ptr %96, align 4
  %98 = load i32, ptr %11, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, ptr %11, align 4
  br label %100

100:                                              ; preds = %92, %87
  br label %104

101:                                              ; preds = %39
  %102 = getelementptr inbounds i32, ptr %24, i64 0
  %103 = load i32, ptr %102, align 16
  store i32 %103, ptr %11, align 4
  br label %104

104:                                              ; preds = %101, %100, %86, %56
  %105 = load i32, ptr %11, align 4
  %106 = load ptr, ptr %8, align 8
  call void @llvm.stackrestore(ptr %106)
  ret i32 %105
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_122_switch_vla_pointer_ternary(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %3
  %17 = load i32, ptr %5, align 4
  br label %19

18:                                               ; preds = %3
  br label %19

19:                                               ; preds = %18, %16
  %20 = phi i32 [ %17, %16 ], [ 1, %18 ]
  store i32 %20, ptr %7, align 4
  %21 = load i32, ptr %7, align 4
  %22 = zext i32 %21 to i64
  %23 = call ptr @llvm.stacksave()
  store ptr %23, ptr %8, align 8
  %24 = alloca i32, i64 %22, align 16
  store i64 %22, ptr %9, align 8
  store ptr %24, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %25

25:                                               ; preds = %47, %19
  %26 = load i32, ptr %11, align 4
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %50

29:                                               ; preds = %25
  %30 = load i32, ptr %11, align 4
  %31 = srem i32 %30, 2
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %37

33:                                               ; preds = %29
  %34 = load i32, ptr %6, align 4
  %35 = load i32, ptr %11, align 4
  %36 = add nsw i32 %34, %35
  br label %41

37:                                               ; preds = %29
  %38 = load i32, ptr %6, align 4
  %39 = load i32, ptr %11, align 4
  %40 = sub nsw i32 %38, %39
  br label %41

41:                                               ; preds = %37, %33
  %42 = phi i32 [ %36, %33 ], [ %40, %37 ]
  %43 = load ptr, ptr %10, align 8
  %44 = load i32, ptr %11, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  store i32 %42, ptr %46, align 4
  br label %47

47:                                               ; preds = %41
  %48 = load i32, ptr %11, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %11, align 4
  br label %25, !llvm.loop !81

50:                                               ; preds = %25
  store i32 0, ptr %12, align 4
  %51 = load i32, ptr %4, align 4
  switch i32 %51, label %80 [
    i32 0, label %52
    i32 1, label %56
    i32 2, label %63
  ]

52:                                               ; preds = %50
  %53 = load ptr, ptr %10, align 8
  %54 = getelementptr inbounds i32, ptr %53, i64 0
  %55 = load i32, ptr %54, align 4
  store i32 %55, ptr %12, align 4
  br label %97

56:                                               ; preds = %50
  %57 = load ptr, ptr %10, align 8
  %58 = load i32, ptr %7, align 4
  %59 = sub nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %57, i64 %60
  %62 = load i32, ptr %61, align 4
  store i32 %62, ptr %12, align 4
  br label %97

63:                                               ; preds = %50
  %64 = load ptr, ptr %10, align 8
  %65 = getelementptr inbounds i32, ptr %64, i64 0
  %66 = load i32, ptr %65, align 4
  %67 = icmp sgt i32 %66, 0
  br i1 %67, label %68, label %73

68:                                               ; preds = %63
  %69 = load ptr, ptr %10, align 8
  %70 = getelementptr inbounds i32, ptr %69, i64 0
  %71 = load i32, ptr %70, align 4
  %72 = mul nsw i32 %71, 2
  br label %78

73:                                               ; preds = %63
  %74 = load ptr, ptr %10, align 8
  %75 = getelementptr inbounds i32, ptr %74, i64 0
  %76 = load i32, ptr %75, align 4
  %77 = sub nsw i32 %76, 2
  br label %78

78:                                               ; preds = %73, %68
  %79 = phi i32 [ %72, %68 ], [ %77, %73 ]
  store i32 %79, ptr %12, align 4
  br label %97

80:                                               ; preds = %50
  store i32 0, ptr %13, align 4
  br label %81

81:                                               ; preds = %93, %80
  %82 = load i32, ptr %13, align 4
  %83 = load i32, ptr %7, align 4
  %84 = icmp slt i32 %82, %83
  br i1 %84, label %85, label %96

85:                                               ; preds = %81
  %86 = load ptr, ptr %10, align 8
  %87 = load i32, ptr %13, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, ptr %86, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = load i32, ptr %12, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %12, align 4
  br label %93

93:                                               ; preds = %85
  %94 = load i32, ptr %13, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %13, align 4
  br label %81, !llvm.loop !82

96:                                               ; preds = %81
  br label %97

97:                                               ; preds = %96, %78, %56, %52
  %98 = load i32, ptr %12, align 4
  %99 = load ptr, ptr %8, align 8
  call void @llvm.stackrestore(ptr %99)
  ret i32 %98
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_123_switch_goto(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %6 = load i32, ptr %3, align 4
  switch i32 %6, label %16 [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %13
  ]

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %5, align 4
  br label %28

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %5, align 4
  br label %18

13:                                               ; preds = %2
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %14, 10
  store i32 %15, ptr %5, align 4
  br label %21

16:                                               ; preds = %2
  %17 = load i32, ptr %4, align 4
  store i32 %17, ptr %5, align 4
  br label %28

18:                                               ; preds = %10
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 5
  store i32 %20, ptr %5, align 4
  br label %21

21:                                               ; preds = %18, %13
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %21
  %25 = load i32, ptr %5, align 4
  %26 = sub nsw i32 0, %25
  store i32 %26, ptr %5, align 4
  br label %27

27:                                               ; preds = %24, %21
  br label %28

28:                                               ; preds = %27, %16, %7
  %29 = load i32, ptr %5, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_124_switch_goto_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %67 [
    i32 0, label %11
    i32 1, label %32
    i32 2, label %50
  ]

11:                                               ; preds = %3
  store i32 0, ptr %8, align 4
  br label %12

12:                                               ; preds = %28, %11
  %13 = load i32, ptr %8, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %31

16:                                               ; preds = %12
  %17 = load i32, ptr %6, align 4
  %18 = load i32, ptr %8, align 4
  %19 = add nsw i32 %17, %18
  %20 = icmp sgt i32 %19, 20
  br i1 %20, label %21, label %22

21:                                               ; preds = %16
  br label %70

22:                                               ; preds = %16
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %8, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %7, align 4
  br label %28

28:                                               ; preds = %22
  %29 = load i32, ptr %8, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %8, align 4
  br label %12, !llvm.loop !83

31:                                               ; preds = %12
  br label %69

32:                                               ; preds = %3
  store i32 0, ptr %9, align 4
  br label %33

33:                                               ; preds = %46, %32
  %34 = load i32, ptr %9, align 4
  %35 = load i32, ptr %5, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %49

37:                                               ; preds = %33
  %38 = load i32, ptr %6, align 4
  %39 = load i32, ptr %9, align 4
  %40 = sub nsw i32 %38, %39
  %41 = load i32, ptr %7, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, ptr %7, align 4
  %43 = load i32, ptr %7, align 4
  %44 = icmp sgt i32 %43, 30
  br i1 %44, label %45, label %46

45:                                               ; preds = %37
  br label %70

46:                                               ; preds = %37
  %47 = load i32, ptr %9, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %9, align 4
  br label %33, !llvm.loop !84

49:                                               ; preds = %33
  br label %69

50:                                               ; preds = %3
  br label %51

51:                                               ; preds = %64, %50
  %52 = load i32, ptr %6, align 4
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %7, align 4
  %55 = load i32, ptr %6, align 4
  %56 = add nsw i32 %55, -1
  store i32 %56, ptr %6, align 4
  br label %57

57:                                               ; preds = %51
  %58 = load i32, ptr %6, align 4
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %64

60:                                               ; preds = %57
  %61 = load i32, ptr %5, align 4
  %62 = add nsw i32 %61, -1
  store i32 %62, ptr %5, align 4
  %63 = icmp sgt i32 %61, 0
  br label %64

64:                                               ; preds = %60, %57
  %65 = phi i1 [ false, %57 ], [ %63, %60 ]
  br i1 %65, label %51, label %66, !llvm.loop !85

66:                                               ; preds = %64
  br label %70

67:                                               ; preds = %3
  %68 = load i32, ptr %6, align 4
  store i32 %68, ptr %7, align 4
  br label %70

69:                                               ; preds = %49, %31
  br label %70

70:                                               ; preds = %69, %67, %66, %45, %21
  %71 = load i32, ptr %7, align 4
  ret i32 %71
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_125_switch_goto_pointer_array(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  %10 = load i32, ptr %5, align 4
  switch i32 %10, label %39 [
    i32 0, label %11
    i32 1, label %22
    i32 2, label %33
  ]

11:                                               ; preds = %4
  %12 = load i32, ptr %7, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %8, align 4
  %17 = add nsw i32 %15, %16
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  store i32 %17, ptr %21, align 4
  br label %48

22:                                               ; preds = %4
  %23 = load i32, ptr %7, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %8, align 4
  %28 = mul nsw i32 %26, %27
  %29 = load ptr, ptr %6, align 8
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 %28, ptr %32, align 4
  br label %48

33:                                               ; preds = %4
  %34 = load i32, ptr %8, align 4
  %35 = load ptr, ptr %6, align 8
  %36 = load i32, ptr %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  store i32 %34, ptr %38, align 4
  br label %41

39:                                               ; preds = %4
  %40 = load i32, ptr @g_arr, align 16
  store i32 %40, ptr %9, align 4
  br label %69

41:                                               ; preds = %33
  %42 = load ptr, ptr %6, align 8
  %43 = load i32, ptr %7, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = add nsw i32 %46, 10
  store i32 %47, ptr %45, align 4
  br label %48

48:                                               ; preds = %41, %22, %11
  %49 = load ptr, ptr %6, align 8
  %50 = load i32, ptr %7, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %49, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %55, label %61

55:                                               ; preds = %48
  %56 = load ptr, ptr %6, align 8
  %57 = load i32, ptr %7, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %56, i64 %58
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %9, align 4
  br label %68

61:                                               ; preds = %48
  %62 = load ptr, ptr %6, align 8
  %63 = load i32, ptr %7, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %62, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = sub nsw i32 0, %66
  store i32 %67, ptr %9, align 4
  br label %68

68:                                               ; preds = %61, %55
  br label %69

69:                                               ; preds = %68, %39
  %70 = load i32, ptr %9, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_126_switch_fallthrough_loop_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %64 [
    i32 0, label %11
    i32 1, label %14
    i32 2, label %40
    i32 3, label %43
  ]

11:                                               ; preds = %3
  %12 = load i32, ptr %7, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %7, align 4
  br label %14

14:                                               ; preds = %3, %11
  store i32 0, ptr %8, align 4
  br label %15

15:                                               ; preds = %36, %14
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %39

19:                                               ; preds = %15
  %20 = load i32, ptr %8, align 4
  %21 = srem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %29

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %8, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %7, align 4
  br label %35

29:                                               ; preds = %19
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %8, align 4
  %32 = sub nsw i32 %30, %31
  %33 = load i32, ptr %7, align 4
  %34 = sub nsw i32 %33, %32
  store i32 %34, ptr %7, align 4
  br label %35

35:                                               ; preds = %29, %23
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %8, align 4
  br label %15, !llvm.loop !86

39:                                               ; preds = %15
  br label %66

40:                                               ; preds = %3
  %41 = load i32, ptr %7, align 4
  %42 = add nsw i32 %41, 20
  store i32 %42, ptr %7, align 4
  br label %43

43:                                               ; preds = %3, %40
  store i32 0, ptr %9, align 4
  br label %44

44:                                               ; preds = %60, %43
  %45 = load i32, ptr %9, align 4
  %46 = load i32, ptr %5, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %63

48:                                               ; preds = %44
  %49 = load i32, ptr %9, align 4
  %50 = icmp sgt i32 %49, 2
  br i1 %50, label %51, label %54

51:                                               ; preds = %48
  %52 = load i32, ptr %9, align 4
  %53 = mul nsw i32 %52, 2
  br label %56

54:                                               ; preds = %48
  %55 = load i32, ptr %9, align 4
  br label %56

56:                                               ; preds = %54, %51
  %57 = phi i32 [ %53, %51 ], [ %55, %54 ]
  %58 = load i32, ptr %7, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %7, align 4
  br label %60

60:                                               ; preds = %56
  %61 = load i32, ptr %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %9, align 4
  br label %44, !llvm.loop !87

63:                                               ; preds = %44
  br label %66

64:                                               ; preds = %3
  %65 = load i32, ptr %6, align 4
  store i32 %65, ptr %7, align 4
  br label %66

66:                                               ; preds = %64, %63, %39
  %67 = load i32, ptr %7, align 4
  ret i32 %67
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_127_nested_switch_array_pointer(i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  %10 = load i32, ptr %5, align 4
  switch i32 %10, label %84 [
    i32 0, label %11
    i32 1, label %48
  ]

11:                                               ; preds = %4
  %12 = load i32, ptr %6, align 4
  switch i32 %12, label %32 [
    i32 0, label %13
    i32 1, label %22
  ]

13:                                               ; preds = %11
  %14 = load i32, ptr %8, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = load ptr, ptr %7, align 8
  %19 = load i32, ptr %8, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  store i32 %17, ptr %21, align 4
  br label %42

22:                                               ; preds = %11
  %23 = load i32, ptr %8, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i32 %26, 2
  %28 = load ptr, ptr %7, align 8
  %29 = load i32, ptr %8, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %28, i64 %30
  store i32 %27, ptr %31, align 4
  br label %42

32:                                               ; preds = %11
  %33 = load i32, ptr %8, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = add nsw i32 %36, 10
  %38 = load ptr, ptr %7, align 8
  %39 = load i32, ptr %8, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %38, i64 %40
  store i32 %37, ptr %41, align 4
  br label %42

42:                                               ; preds = %32, %22, %13
  %43 = load ptr, ptr %7, align 8
  %44 = load i32, ptr %8, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  store i32 %47, ptr %9, align 4
  br label %90

48:                                               ; preds = %4
  %49 = load i32, ptr %6, align 4
  switch i32 %49, label %72 [
    i32 0, label %50
    i32 1, label %61
  ]

50:                                               ; preds = %48
  %51 = load i32, ptr %8, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = load ptr, ptr %7, align 8
  %56 = load i32, ptr %8, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %55, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = add nsw i32 %54, %59
  store i32 %60, ptr %9, align 4
  br label %83

61:                                               ; preds = %48
  %62 = load i32, ptr %8, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = load ptr, ptr %7, align 8
  %67 = load i32, ptr %8, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr %66, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = sub nsw i32 %65, %70
  store i32 %71, ptr %9, align 4
  br label %83

72:                                               ; preds = %48
  %73 = load i32, ptr %8, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %74
  %76 = load i32, ptr %75, align 4
  %77 = load ptr, ptr %7, align 8
  %78 = load i32, ptr %8, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, ptr %77, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = mul nsw i32 %76, %81
  store i32 %82, ptr %9, align 4
  br label %83

83:                                               ; preds = %72, %61, %50
  br label %90

84:                                               ; preds = %4
  %85 = load ptr, ptr %7, align 8
  %86 = load i32, ptr %8, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, ptr %85, i64 %87
  %89 = load i32, ptr %88, align 4
  store i32 %89, ptr %9, align 4
  br label %90

90:                                               ; preds = %84, %83, %42
  %91 = load i32, ptr %9, align 4
  %92 = icmp sgt i32 %91, 0
  br i1 %92, label %93, label %97

93:                                               ; preds = %90
  %94 = load i32, ptr @g_arr, align 16
  %95 = load i32, ptr %9, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, ptr %9, align 4
  br label %101

97:                                               ; preds = %90
  %98 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %99 = load i32, ptr %9, align 4
  %100 = sub nsw i32 %99, %98
  store i32 %100, ptr %9, align 4
  br label %101

101:                                              ; preds = %97, %93
  %102 = load i32, ptr %9, align 4
  ret i32 %102
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_128_switch_array_pointer_loops(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  %14 = load i32, ptr %5, align 4
  switch i32 %14, label %170 [
    i32 0, label %15
    i32 1, label %78
    i32 2, label %131
  ]

15:                                               ; preds = %4
  store i32 0, ptr %10, align 4
  br label %16

16:                                               ; preds = %74, %15
  %17 = load i32, ptr %10, align 4
  %18 = load i32, ptr %7, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %23

20:                                               ; preds = %16
  %21 = load i32, ptr %10, align 4
  %22 = icmp slt i32 %21, 8
  br label %23

23:                                               ; preds = %20, %16
  %24 = phi i1 [ false, %16 ], [ %22, %20 ]
  br i1 %24, label %25, label %77

25:                                               ; preds = %23
  %26 = load i32, ptr %10, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %38

31:                                               ; preds = %25
  %32 = load i32, ptr %10, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = load i32, ptr %8, align 4
  %37 = add nsw i32 %35, %36
  br label %45

38:                                               ; preds = %25
  %39 = load i32, ptr %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr %8, align 4
  %44 = sub nsw i32 %42, %43
  br label %45

45:                                               ; preds = %38, %31
  %46 = phi i32 [ %37, %31 ], [ %44, %38 ]
  %47 = load ptr, ptr %6, align 8
  %48 = load i32, ptr %10, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, ptr %47, i64 %49
  store i32 %46, ptr %50, align 4
  %51 = load ptr, ptr %6, align 8
  %52 = load i32, ptr %10, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %51, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = icmp sgt i32 %55, 0
  br i1 %56, label %57, label %65

57:                                               ; preds = %45
  %58 = load ptr, ptr %6, align 8
  %59 = load i32, ptr %10, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %58, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %9, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %9, align 4
  br label %73

65:                                               ; preds = %45
  %66 = load ptr, ptr %6, align 8
  %67 = load i32, ptr %10, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr %66, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = load i32, ptr %9, align 4
  %72 = sub nsw i32 %71, %70
  store i32 %72, ptr %9, align 4
  br label %73

73:                                               ; preds = %65, %57
  br label %74

74:                                               ; preds = %73
  %75 = load i32, ptr %10, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %10, align 4
  br label %16, !llvm.loop !88

77:                                               ; preds = %23
  br label %182

78:                                               ; preds = %4
  store i32 0, ptr %11, align 4
  br label %79

79:                                               ; preds = %127, %78
  %80 = load i32, ptr %11, align 4
  %81 = load i32, ptr %7, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %86

83:                                               ; preds = %79
  %84 = load i32, ptr %11, align 4
  %85 = icmp slt i32 %84, 8
  br label %86

86:                                               ; preds = %83, %79
  %87 = phi i1 [ false, %79 ], [ %85, %83 ]
  br i1 %87, label %88, label %130

88:                                               ; preds = %86
  %89 = load i32, ptr %8, align 4
  %90 = load i32, ptr %11, align 4
  %91 = add nsw i32 %89, %90
  %92 = load ptr, ptr %6, align 8
  %93 = load i32, ptr %11, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, ptr %92, i64 %94
  store i32 %91, ptr %95, align 4
  store i32 0, ptr %12, align 4
  br label %96

96:                                               ; preds = %123, %88
  %97 = load i32, ptr %12, align 4
  %98 = icmp slt i32 %97, 2
  br i1 %98, label %99, label %126

99:                                               ; preds = %96
  %100 = load i32, ptr %11, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %101
  %103 = load i32, ptr %102, align 4
  %104 = load i32, ptr %12, align 4
  %105 = icmp sgt i32 %103, %104
  br i1 %105, label %106, label %114

106:                                              ; preds = %99
  %107 = load ptr, ptr %6, align 8
  %108 = load i32, ptr %11, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, ptr %107, i64 %109
  %111 = load i32, ptr %110, align 4
  %112 = load i32, ptr %9, align 4
  %113 = add nsw i32 %112, %111
  store i32 %113, ptr %9, align 4
  br label %122

114:                                              ; preds = %99
  %115 = load ptr, ptr %6, align 8
  %116 = load i32, ptr %11, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, ptr %115, i64 %117
  %119 = load i32, ptr %118, align 4
  %120 = load i32, ptr %9, align 4
  %121 = sub nsw i32 %120, %119
  store i32 %121, ptr %9, align 4
  br label %122

122:                                              ; preds = %114, %106
  br label %123

123:                                              ; preds = %122
  %124 = load i32, ptr %12, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %12, align 4
  br label %96, !llvm.loop !89

126:                                              ; preds = %96
  br label %127

127:                                              ; preds = %126
  %128 = load i32, ptr %11, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, ptr %11, align 4
  br label %79, !llvm.loop !90

130:                                              ; preds = %86
  br label %182

131:                                              ; preds = %4
  store i32 0, ptr %13, align 4
  br label %132

132:                                              ; preds = %166, %131
  %133 = load i32, ptr %13, align 4
  %134 = load i32, ptr %7, align 4
  %135 = icmp slt i32 %133, %134
  br i1 %135, label %136, label %139

136:                                              ; preds = %132
  %137 = load i32, ptr %13, align 4
  %138 = icmp slt i32 %137, 8
  br label %139

139:                                              ; preds = %136, %132
  %140 = phi i1 [ false, %132 ], [ %138, %136 ]
  br i1 %140, label %141, label %169

141:                                              ; preds = %139
  %142 = load ptr, ptr %6, align 8
  %143 = load i32, ptr %13, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, ptr %142, i64 %144
  %146 = load i32, ptr %145, align 4
  %147 = icmp sgt i32 %146, 0
  br i1 %147, label %148, label %155

148:                                              ; preds = %141
  %149 = load ptr, ptr %6, align 8
  %150 = load i32, ptr %13, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, ptr %149, i64 %151
  %153 = load i32, ptr %152, align 4
  %154 = mul nsw i32 %153, 2
  br label %162

155:                                              ; preds = %141
  %156 = load ptr, ptr %6, align 8
  %157 = load i32, ptr %13, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, ptr %156, i64 %158
  %160 = load i32, ptr %159, align 4
  %161 = sub nsw i32 %160, 2
  br label %162

162:                                              ; preds = %155, %148
  %163 = phi i32 [ %154, %148 ], [ %161, %155 ]
  %164 = load i32, ptr %9, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %9, align 4
  br label %166

166:                                              ; preds = %162
  %167 = load i32, ptr %13, align 4
  %168 = add nsw i32 %167, 1
  store i32 %168, ptr %13, align 4
  br label %132, !llvm.loop !91

169:                                              ; preds = %139
  br label %182

170:                                              ; preds = %4
  %171 = load ptr, ptr %6, align 8
  %172 = getelementptr inbounds i32, ptr %171, i64 0
  %173 = load i32, ptr %172, align 4
  store i32 %173, ptr %9, align 4
  %174 = load i32, ptr %9, align 4
  %175 = load i32, ptr @g_arr, align 16
  %176 = icmp sgt i32 %174, %175
  br i1 %176, label %177, label %181

177:                                              ; preds = %170
  %178 = load i32, ptr @g_arr, align 16
  %179 = load i32, ptr %9, align 4
  %180 = add nsw i32 %179, %178
  store i32 %180, ptr %9, align 4
  br label %181

181:                                              ; preds = %177, %170
  br label %182

182:                                              ; preds = %181, %169, %130, %77
  %183 = load i32, ptr %9, align 4
  ret i32 %183
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_129_switch_vla_nested(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %18 = load i32, ptr %7, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %4
  %21 = load i32, ptr %7, align 4
  br label %23

22:                                               ; preds = %4
  br label %23

23:                                               ; preds = %22, %20
  %24 = phi i32 [ %21, %20 ], [ 1, %22 ]
  store i32 %24, ptr %9, align 4
  %25 = load i32, ptr %9, align 4
  %26 = zext i32 %25 to i64
  %27 = call ptr @llvm.stacksave()
  store ptr %27, ptr %10, align 8
  %28 = alloca i32, i64 %26, align 16
  store i64 %26, ptr %11, align 8
  store i32 0, ptr %12, align 4
  br label %29

29:                                               ; preds = %44, %23
  %30 = load i32, ptr %12, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %47

33:                                               ; preds = %29
  %34 = load i32, ptr %8, align 4
  %35 = load i32, ptr %12, align 4
  %36 = srem i32 %35, 8
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = add nsw i32 %34, %39
  %41 = load i32, ptr %12, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, ptr %28, i64 %42
  store i32 %40, ptr %43, align 4
  br label %44

44:                                               ; preds = %33
  %45 = load i32, ptr %12, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %12, align 4
  br label %29, !llvm.loop !92

47:                                               ; preds = %29
  store i32 0, ptr %13, align 4
  %48 = load i32, ptr %5, align 4
  switch i32 %48, label %175 [
    i32 0, label %49
    i32 1, label %79
    i32 2, label %126
  ]

49:                                               ; preds = %47
  store i32 0, ptr %14, align 4
  br label %50

50:                                               ; preds = %75, %49
  %51 = load i32, ptr %14, align 4
  %52 = load i32, ptr %9, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %78

54:                                               ; preds = %50
  %55 = load i32, ptr %14, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %28, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %67

60:                                               ; preds = %54
  %61 = load i32, ptr %14, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, ptr %28, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = load i32, ptr %13, align 4
  %66 = add nsw i32 %65, %64
  store i32 %66, ptr %13, align 4
  br label %74

67:                                               ; preds = %54
  %68 = load i32, ptr %14, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, ptr %28, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = load i32, ptr %13, align 4
  %73 = sub nsw i32 %72, %71
  store i32 %73, ptr %13, align 4
  br label %74

74:                                               ; preds = %67, %60
  br label %75

75:                                               ; preds = %74
  %76 = load i32, ptr %14, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %14, align 4
  br label %50, !llvm.loop !93

78:                                               ; preds = %50
  br label %178

79:                                               ; preds = %47
  store i32 0, ptr %15, align 4
  br label %80

80:                                               ; preds = %122, %79
  %81 = load i32, ptr %15, align 4
  %82 = load i32, ptr %9, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %125

84:                                               ; preds = %80
  store i32 0, ptr %16, align 4
  br label %85

85:                                               ; preds = %118, %84
  %86 = load i32, ptr %16, align 4
  %87 = load i32, ptr %15, align 4
  %88 = icmp sle i32 %86, %87
  br i1 %88, label %89, label %121

89:                                               ; preds = %85
  %90 = load ptr, ptr %6, align 8
  %91 = load i32, ptr %16, align 4
  %92 = srem i32 %91, 8
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, ptr %90, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = load i32, ptr %15, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, ptr %28, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = icmp sgt i32 %95, %99
  br i1 %100, label %101, label %110

101:                                              ; preds = %89
  %102 = load ptr, ptr %6, align 8
  %103 = load i32, ptr %16, align 4
  %104 = srem i32 %103, 8
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, ptr %102, i64 %105
  %107 = load i32, ptr %106, align 4
  %108 = load i32, ptr %13, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %13, align 4
  br label %117

110:                                              ; preds = %89
  %111 = load i32, ptr %15, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, ptr %28, i64 %112
  %114 = load i32, ptr %113, align 4
  %115 = load i32, ptr %13, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %13, align 4
  br label %117

117:                                              ; preds = %110, %101
  br label %118

118:                                              ; preds = %117
  %119 = load i32, ptr %16, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %16, align 4
  br label %85, !llvm.loop !94

121:                                              ; preds = %85
  br label %122

122:                                              ; preds = %121
  %123 = load i32, ptr %15, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, ptr %15, align 4
  br label %80, !llvm.loop !95

125:                                              ; preds = %80
  br label %178

126:                                              ; preds = %47
  store i32 0, ptr %17, align 4
  br label %127

127:                                              ; preds = %171, %126
  %128 = load i32, ptr %17, align 4
  %129 = load i32, ptr %9, align 4
  %130 = icmp slt i32 %128, %129
  br i1 %130, label %131, label %174

131:                                              ; preds = %127
  %132 = load i32, ptr %17, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, ptr %28, i64 %133
  %135 = load i32, ptr %134, align 4
  %136 = load ptr, ptr %6, align 8
  %137 = load i32, ptr %17, align 4
  %138 = srem i32 %137, 8
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, ptr %136, i64 %139
  store i32 %135, ptr %140, align 4
  %141 = load ptr, ptr %6, align 8
  %142 = load i32, ptr %17, align 4
  %143 = srem i32 %142, 8
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, ptr %141, i64 %144
  %146 = load i32, ptr %145, align 4
  %147 = load i32, ptr %17, align 4
  %148 = srem i32 %147, 8
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %149
  %151 = load i32, ptr %150, align 4
  %152 = icmp sgt i32 %146, %151
  br i1 %152, label %153, label %162

153:                                              ; preds = %131
  %154 = load ptr, ptr %6, align 8
  %155 = load i32, ptr %17, align 4
  %156 = srem i32 %155, 8
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, ptr %154, i64 %157
  %159 = load i32, ptr %158, align 4
  %160 = load i32, ptr %13, align 4
  %161 = add nsw i32 %160, %159
  store i32 %161, ptr %13, align 4
  br label %170

162:                                              ; preds = %131
  %163 = load i32, ptr %17, align 4
  %164 = srem i32 %163, 8
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %165
  %167 = load i32, ptr %166, align 4
  %168 = load i32, ptr %13, align 4
  %169 = sub nsw i32 %168, %167
  store i32 %169, ptr %13, align 4
  br label %170

170:                                              ; preds = %162, %153
  br label %171

171:                                              ; preds = %170
  %172 = load i32, ptr %17, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, ptr %17, align 4
  br label %127, !llvm.loop !96

174:                                              ; preds = %127
  br label %178

175:                                              ; preds = %47
  %176 = getelementptr inbounds i32, ptr %28, i64 0
  %177 = load i32, ptr %176, align 16
  store i32 %177, ptr %13, align 4
  br label %178

178:                                              ; preds = %175, %174, %125, %78
  %179 = load i32, ptr %13, align 4
  %180 = load ptr, ptr %10, align 8
  call void @llvm.stackrestore(ptr %180)
  ret i32 %179
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_130_switch_stress(i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %2, ptr %10, align 8
  store i32 %3, ptr %11, align 4
  store i32 %4, ptr %12, align 4
  store i32 %5, ptr %13, align 4
  store i32 %6, ptr %14, align 4
  %30 = load i32, ptr %11, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %7
  %33 = load i32, ptr %11, align 4
  br label %35

34:                                               ; preds = %7
  br label %35

35:                                               ; preds = %34, %32
  %36 = phi i32 [ %33, %32 ], [ 1, %34 ]
  store i32 %36, ptr %15, align 4
  %37 = load i32, ptr %15, align 4
  %38 = zext i32 %37 to i64
  %39 = call ptr @llvm.stacksave()
  store ptr %39, ptr %16, align 8
  %40 = alloca i32, i64 %38, align 16
  store i64 %38, ptr %17, align 8
  %41 = load i32, ptr %12, align 4
  %42 = load i32, ptr @g_x, align 4
  %43 = add nsw i32 %41, %42
  store i32 %43, ptr %18, align 4
  store i32 0, ptr %19, align 4
  br label %44

44:                                               ; preds = %65, %35
  %45 = load i32, ptr %19, align 4
  %46 = load i32, ptr %15, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %68

48:                                               ; preds = %44
  %49 = load i32, ptr %19, align 4
  %50 = srem i32 %49, 2
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %56

52:                                               ; preds = %48
  %53 = load i32, ptr %12, align 4
  %54 = load i32, ptr %19, align 4
  %55 = add nsw i32 %53, %54
  br label %60

56:                                               ; preds = %48
  %57 = load i32, ptr %13, align 4
  %58 = load i32, ptr %19, align 4
  %59 = sub nsw i32 %57, %58
  br label %60

60:                                               ; preds = %56, %52
  %61 = phi i32 [ %55, %52 ], [ %59, %56 ]
  %62 = load i32, ptr %19, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr %40, i64 %63
  store i32 %61, ptr %64, align 4
  br label %65

65:                                               ; preds = %60
  %66 = load i32, ptr %19, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %19, align 4
  br label %44, !llvm.loop !97

68:                                               ; preds = %44
  %69 = load i32, ptr %8, align 4
  switch i32 %69, label %467 [
    i32 0, label %70
    i32 1, label %146
    i32 2, label %303
    i32 3, label %399
  ]

70:                                               ; preds = %68
  store i32 0, ptr %20, align 4
  br label %71

71:                                               ; preds = %142, %70
  %72 = load i32, ptr %20, align 4
  %73 = load i32, ptr %15, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %145

75:                                               ; preds = %71
  %76 = load i32, ptr %20, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, ptr %40, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = load i32, ptr %13, align 4
  %81 = icmp sgt i32 %79, %80
  br i1 %81, label %82, label %110

82:                                               ; preds = %75
  %83 = load ptr, ptr %10, align 8
  %84 = icmp ne ptr %83, null
  br i1 %84, label %85, label %102

85:                                               ; preds = %82
  %86 = load ptr, ptr %10, align 8
  %87 = load i32, ptr %20, align 4
  %88 = srem i32 %87, 8
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, ptr %86, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = icmp sgt i32 %91, 0
  br i1 %92, label %93, label %102

93:                                               ; preds = %85
  %94 = load ptr, ptr %10, align 8
  %95 = load i32, ptr %20, align 4
  %96 = srem i32 %95, 8
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, ptr %94, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = load i32, ptr %18, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, ptr %18, align 4
  br label %109

102:                                              ; preds = %85, %82
  %103 = load i32, ptr %20, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, ptr %40, i64 %104
  %106 = load i32, ptr %105, align 4
  %107 = load i32, ptr %18, align 4
  %108 = add nsw i32 %107, %106
  store i32 %108, ptr %18, align 4
  br label %109

109:                                              ; preds = %102, %93
  br label %137

110:                                              ; preds = %75
  %111 = load i32, ptr %20, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, ptr %40, i64 %112
  %114 = load i32, ptr %113, align 4
  %115 = load i32, ptr %18, align 4
  %116 = sub nsw i32 %115, %114
  store i32 %116, ptr %18, align 4
  %117 = load i32, ptr %20, align 4
  %118 = srem i32 %117, 2
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %128

120:                                              ; preds = %110
  %121 = load i32, ptr %20, align 4
  %122 = srem i32 %121, 8
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %123
  %125 = load i32, ptr %124, align 4
  %126 = load i32, ptr %18, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, ptr %18, align 4
  br label %136

128:                                              ; preds = %110
  %129 = load i32, ptr %20, align 4
  %130 = srem i32 %129, 8
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %131
  %133 = load i32, ptr %132, align 4
  %134 = load i32, ptr %18, align 4
  %135 = sub nsw i32 %134, %133
  store i32 %135, ptr %18, align 4
  br label %136

136:                                              ; preds = %128, %120
  br label %137

137:                                              ; preds = %136, %109
  %138 = load i32, ptr %18, align 4
  %139 = icmp sgt i32 %138, 100
  br i1 %139, label %140, label %141

140:                                              ; preds = %137
  br label %571

141:                                              ; preds = %137
  br label %142

142:                                              ; preds = %141
  %143 = load i32, ptr %20, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, ptr %20, align 4
  br label %71, !llvm.loop !98

145:                                              ; preds = %71
  br label %525

146:                                              ; preds = %68
  %147 = load i32, ptr %9, align 4
  switch i32 %147, label %269 [
    i32 0, label %148
    i32 1, label %178
    i32 2, label %219
  ]

148:                                              ; preds = %146
  store i32 0, ptr %21, align 4
  br label %149

149:                                              ; preds = %174, %148
  %150 = load i32, ptr %21, align 4
  %151 = load i32, ptr %15, align 4
  %152 = icmp slt i32 %150, %151
  br i1 %152, label %153, label %177

153:                                              ; preds = %149
  %154 = load i32, ptr %21, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, ptr %40, i64 %155
  %157 = load i32, ptr %156, align 4
  %158 = icmp sgt i32 %157, 0
  br i1 %158, label %159, label %166

159:                                              ; preds = %153
  %160 = load i32, ptr %21, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i32, ptr %40, i64 %161
  %163 = load i32, ptr %162, align 4
  %164 = load i32, ptr %18, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %18, align 4
  br label %173

166:                                              ; preds = %153
  %167 = load i32, ptr %21, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, ptr %40, i64 %168
  %170 = load i32, ptr %169, align 4
  %171 = load i32, ptr %18, align 4
  %172 = sub nsw i32 %171, %170
  store i32 %172, ptr %18, align 4
  br label %173

173:                                              ; preds = %166, %159
  br label %174

174:                                              ; preds = %173
  %175 = load i32, ptr %21, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, ptr %21, align 4
  br label %149, !llvm.loop !99

177:                                              ; preds = %149
  br label %297

178:                                              ; preds = %146
  store i32 0, ptr %22, align 4
  br label %179

179:                                              ; preds = %215, %178
  %180 = load i32, ptr %22, align 4
  %181 = load i32, ptr %15, align 4
  %182 = icmp slt i32 %180, %181
  br i1 %182, label %183, label %218

183:                                              ; preds = %179
  %184 = load i32, ptr %22, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i32, ptr %40, i64 %185
  %187 = load i32, ptr %186, align 4
  %188 = icmp sgt i32 %187, 0
  br i1 %188, label %189, label %194

189:                                              ; preds = %183
  %190 = load i32, ptr %22, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i32, ptr %40, i64 %191
  %193 = load i32, ptr %192, align 4
  br label %200

194:                                              ; preds = %183
  %195 = load i32, ptr %22, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i32, ptr %40, i64 %196
  %198 = load i32, ptr %197, align 4
  %199 = sub nsw i32 0, %198
  br label %200

200:                                              ; preds = %194, %189
  %201 = phi i32 [ %193, %189 ], [ %199, %194 ]
  %202 = load ptr, ptr %10, align 8
  %203 = load i32, ptr %22, align 4
  %204 = srem i32 %203, 8
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i32, ptr %202, i64 %205
  store i32 %201, ptr %206, align 4
  %207 = load ptr, ptr %10, align 8
  %208 = load i32, ptr %22, align 4
  %209 = srem i32 %208, 8
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i32, ptr %207, i64 %210
  %212 = load i32, ptr %211, align 4
  %213 = load i32, ptr %18, align 4
  %214 = add nsw i32 %213, %212
  store i32 %214, ptr %18, align 4
  br label %215

215:                                              ; preds = %200
  %216 = load i32, ptr %22, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, ptr %22, align 4
  br label %179, !llvm.loop !100

218:                                              ; preds = %179
  br label %297

219:                                              ; preds = %146
  store i32 0, ptr %23, align 4
  br label %220

220:                                              ; preds = %265, %219
  %221 = load i32, ptr %23, align 4
  %222 = load i32, ptr %15, align 4
  %223 = icmp slt i32 %221, %222
  br i1 %223, label %224, label %268

224:                                              ; preds = %220
  %225 = load ptr, ptr %10, align 8
  %226 = icmp ne ptr %225, null
  br i1 %226, label %227, label %258

227:                                              ; preds = %224
  %228 = load ptr, ptr %10, align 8
  %229 = load i32, ptr %23, align 4
  %230 = srem i32 %229, 8
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i32, ptr %228, i64 %231
  %233 = load i32, ptr %232, align 4
  %234 = load i32, ptr %23, align 4
  %235 = srem i32 %234, 8
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %236
  %238 = load i32, ptr %237, align 4
  %239 = icmp sgt i32 %233, %238
  br i1 %239, label %240, label %249

240:                                              ; preds = %227
  %241 = load ptr, ptr %10, align 8
  %242 = load i32, ptr %23, align 4
  %243 = srem i32 %242, 8
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds i32, ptr %241, i64 %244
  %246 = load i32, ptr %245, align 4
  %247 = load i32, ptr %18, align 4
  %248 = add nsw i32 %247, %246
  store i32 %248, ptr %18, align 4
  br label %257

249:                                              ; preds = %227
  %250 = load i32, ptr %23, align 4
  %251 = srem i32 %250, 8
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %252
  %254 = load i32, ptr %253, align 4
  %255 = load i32, ptr %18, align 4
  %256 = add nsw i32 %255, %254
  store i32 %256, ptr %18, align 4
  br label %257

257:                                              ; preds = %249, %240
  br label %265

258:                                              ; preds = %224
  %259 = load i32, ptr %23, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i32, ptr %40, i64 %260
  %262 = load i32, ptr %261, align 4
  %263 = load i32, ptr %18, align 4
  %264 = add nsw i32 %263, %262
  store i32 %264, ptr %18, align 4
  br label %265

265:                                              ; preds = %258, %257
  %266 = load i32, ptr %23, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, ptr %23, align 4
  br label %220, !llvm.loop !101

268:                                              ; preds = %220
  br label %297

269:                                              ; preds = %146
  %270 = load i32, ptr %12, align 4
  %271 = load i32, ptr %13, align 4
  %272 = icmp sgt i32 %270, %271
  br i1 %272, label %273, label %283

273:                                              ; preds = %269
  %274 = load i32, ptr %12, align 4
  %275 = load i32, ptr %14, align 4
  %276 = icmp sgt i32 %274, %275
  br i1 %276, label %277, label %279

277:                                              ; preds = %273
  %278 = load i32, ptr %12, align 4
  br label %281

279:                                              ; preds = %273
  %280 = load i32, ptr %14, align 4
  br label %281

281:                                              ; preds = %279, %277
  %282 = phi i32 [ %278, %277 ], [ %280, %279 ]
  br label %293

283:                                              ; preds = %269
  %284 = load i32, ptr %13, align 4
  %285 = load i32, ptr %14, align 4
  %286 = icmp sgt i32 %284, %285
  br i1 %286, label %287, label %289

287:                                              ; preds = %283
  %288 = load i32, ptr %13, align 4
  br label %291

289:                                              ; preds = %283
  %290 = load i32, ptr %14, align 4
  br label %291

291:                                              ; preds = %289, %287
  %292 = phi i32 [ %288, %287 ], [ %290, %289 ]
  br label %293

293:                                              ; preds = %291, %281
  %294 = phi i32 [ %282, %281 ], [ %292, %291 ]
  %295 = load i32, ptr %18, align 4
  %296 = add nsw i32 %295, %294
  store i32 %296, ptr %18, align 4
  br label %571

297:                                              ; preds = %268, %218, %177
  %298 = load i32, ptr %18, align 4
  %299 = load i32, ptr @g_z, align 4
  %300 = icmp sgt i32 %298, %299
  br i1 %300, label %301, label %302

301:                                              ; preds = %297
  br label %571

302:                                              ; preds = %297
  br label %525

303:                                              ; preds = %68
  store i32 0, ptr %24, align 4
  br label %304

304:                                              ; preds = %395, %303
  %305 = load i32, ptr %24, align 4
  %306 = load i32, ptr %15, align 4
  %307 = icmp slt i32 %305, %306
  br i1 %307, label %308, label %398

308:                                              ; preds = %304
  %309 = load i32, ptr %12, align 4
  %310 = load i32, ptr %24, align 4
  %311 = add nsw i32 %309, %310
  %312 = srem i32 %311, 3
  switch i32 %312, label %368 [
    i32 0, label %313
    i32 1, label %321
  ]

313:                                              ; preds = %308
  %314 = load i32, ptr %24, align 4
  %315 = srem i32 %314, 8
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %316
  %318 = load i32, ptr %317, align 4
  %319 = load i32, ptr %18, align 4
  %320 = add nsw i32 %319, %318
  store i32 %320, ptr %18, align 4
  br label %390

321:                                              ; preds = %308
  %322 = load ptr, ptr %10, align 8
  %323 = icmp ne ptr %322, null
  br i1 %323, label %324, label %360

324:                                              ; preds = %321
  %325 = load i32, ptr %24, align 4
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds i32, ptr %40, i64 %326
  %328 = load i32, ptr %327, align 4
  %329 = load ptr, ptr %10, align 8
  %330 = load i32, ptr %24, align 4
  %331 = srem i32 %330, 8
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i32, ptr %329, i64 %332
  store i32 %328, ptr %333, align 4
  %334 = load ptr, ptr %10, align 8
  %335 = load i32, ptr %24, align 4
  %336 = srem i32 %335, 8
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds i32, ptr %334, i64 %337
  %339 = load i32, ptr %338, align 4
  %340 = icmp sgt i32 %339, 0
  br i1 %340, label %341, label %350

341:                                              ; preds = %324
  %342 = load ptr, ptr %10, align 8
  %343 = load i32, ptr %24, align 4
  %344 = srem i32 %343, 8
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds i32, ptr %342, i64 %345
  %347 = load i32, ptr %346, align 4
  %348 = load i32, ptr %18, align 4
  %349 = add nsw i32 %348, %347
  store i32 %349, ptr %18, align 4
  br label %359

350:                                              ; preds = %324
  %351 = load ptr, ptr %10, align 8
  %352 = load i32, ptr %24, align 4
  %353 = srem i32 %352, 8
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds i32, ptr %351, i64 %354
  %356 = load i32, ptr %355, align 4
  %357 = load i32, ptr %18, align 4
  %358 = sub nsw i32 %357, %356
  store i32 %358, ptr %18, align 4
  br label %359

359:                                              ; preds = %350, %341
  br label %367

360:                                              ; preds = %321
  %361 = load i32, ptr %24, align 4
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds i32, ptr %40, i64 %362
  %364 = load i32, ptr %363, align 4
  %365 = load i32, ptr %18, align 4
  %366 = add nsw i32 %365, %364
  store i32 %366, ptr %18, align 4
  br label %367

367:                                              ; preds = %360, %359
  br label %390

368:                                              ; preds = %308
  %369 = load i32, ptr %24, align 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds i32, ptr %40, i64 %370
  %372 = load i32, ptr %371, align 4
  %373 = icmp sgt i32 %372, 0
  br i1 %373, label %374, label %380

374:                                              ; preds = %368
  %375 = load i32, ptr %24, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i32, ptr %40, i64 %376
  %378 = load i32, ptr %377, align 4
  %379 = mul nsw i32 %378, 2
  br label %386

380:                                              ; preds = %368
  %381 = load i32, ptr %24, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds i32, ptr %40, i64 %382
  %384 = load i32, ptr %383, align 4
  %385 = sub nsw i32 %384, 2
  br label %386

386:                                              ; preds = %380, %374
  %387 = phi i32 [ %379, %374 ], [ %385, %380 ]
  %388 = load i32, ptr %18, align 4
  %389 = add nsw i32 %388, %387
  store i32 %389, ptr %18, align 4
  br label %390

390:                                              ; preds = %386, %367, %313
  %391 = load i32, ptr %18, align 4
  %392 = icmp slt i32 %391, -100
  br i1 %392, label %393, label %394

393:                                              ; preds = %390
  br label %568

394:                                              ; preds = %390
  br label %395

395:                                              ; preds = %394
  %396 = load i32, ptr %24, align 4
  %397 = add nsw i32 %396, 1
  store i32 %397, ptr %24, align 4
  br label %304, !llvm.loop !102

398:                                              ; preds = %304
  br label %525

399:                                              ; preds = %68
  %400 = load i32, ptr %12, align 4
  %401 = load i32, ptr %13, align 4
  %402 = icmp sgt i32 %400, %401
  br i1 %402, label %403, label %443

403:                                              ; preds = %399
  store i32 0, ptr %25, align 4
  br label %404

404:                                              ; preds = %439, %403
  %405 = load i32, ptr %25, align 4
  %406 = load i32, ptr %15, align 4
  %407 = icmp slt i32 %405, %406
  br i1 %407, label %408, label %442

408:                                              ; preds = %404
  %409 = load i32, ptr %14, align 4
  %410 = load i32, ptr %25, align 4
  %411 = icmp sgt i32 %409, %410
  br i1 %411, label %412, label %431

412:                                              ; preds = %408
  %413 = load i32, ptr %25, align 4
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds i32, ptr %40, i64 %414
  %416 = load i32, ptr %415, align 4
  %417 = load i32, ptr %18, align 4
  %418 = add nsw i32 %417, %416
  store i32 %418, ptr %18, align 4
  %419 = load ptr, ptr %10, align 8
  %420 = icmp ne ptr %419, null
  br i1 %420, label %421, label %430

421:                                              ; preds = %412
  %422 = load ptr, ptr %10, align 8
  %423 = load i32, ptr %422, align 4
  %424 = icmp sgt i32 %423, 0
  br i1 %424, label %425, label %430

425:                                              ; preds = %421
  %426 = load ptr, ptr %10, align 8
  %427 = load i32, ptr %426, align 4
  %428 = load i32, ptr %18, align 4
  %429 = add nsw i32 %428, %427
  store i32 %429, ptr %18, align 4
  br label %430

430:                                              ; preds = %425, %421, %412
  br label %438

431:                                              ; preds = %408
  %432 = load i32, ptr %25, align 4
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds i32, ptr %40, i64 %433
  %435 = load i32, ptr %434, align 4
  %436 = load i32, ptr %18, align 4
  %437 = sub nsw i32 %436, %435
  store i32 %437, ptr %18, align 4
  br label %438

438:                                              ; preds = %431, %430
  br label %439

439:                                              ; preds = %438
  %440 = load i32, ptr %25, align 4
  %441 = add nsw i32 %440, 1
  store i32 %441, ptr %25, align 4
  br label %404, !llvm.loop !103

442:                                              ; preds = %404
  br label %466

443:                                              ; preds = %399
  store i32 0, ptr %26, align 4
  br label %444

444:                                              ; preds = %461, %443
  %445 = load i32, ptr %12, align 4
  %446 = icmp sgt i32 %445, 0
  br i1 %446, label %447, label %451

447:                                              ; preds = %444
  %448 = load i32, ptr %12, align 4
  %449 = load i32, ptr %26, align 4
  %450 = add nsw i32 %448, %449
  br label %455

451:                                              ; preds = %444
  %452 = load i32, ptr %13, align 4
  %453 = load i32, ptr %26, align 4
  %454 = sub nsw i32 %452, %453
  br label %455

455:                                              ; preds = %451, %447
  %456 = phi i32 [ %450, %447 ], [ %454, %451 ]
  %457 = load i32, ptr %18, align 4
  %458 = add nsw i32 %457, %456
  store i32 %458, ptr %18, align 4
  %459 = load i32, ptr %26, align 4
  %460 = add nsw i32 %459, 1
  store i32 %460, ptr %26, align 4
  br label %461

461:                                              ; preds = %455
  %462 = load i32, ptr %26, align 4
  %463 = load i32, ptr %15, align 4
  %464 = icmp slt i32 %462, %463
  br i1 %464, label %444, label %465, !llvm.loop !104

465:                                              ; preds = %461
  br label %466

466:                                              ; preds = %465, %442
  br label %571

467:                                              ; preds = %68
  %468 = load ptr, ptr %10, align 8
  %469 = icmp ne ptr %468, null
  br i1 %469, label %470, label %496

470:                                              ; preds = %467
  %471 = load i32, ptr %12, align 4
  %472 = load i32, ptr %13, align 4
  %473 = icmp sgt i32 %471, %472
  br i1 %473, label %474, label %476

474:                                              ; preds = %470
  %475 = load i32, ptr %12, align 4
  br label %478

476:                                              ; preds = %470
  %477 = load i32, ptr %13, align 4
  br label %478

478:                                              ; preds = %476, %474
  %479 = phi i32 [ %475, %474 ], [ %477, %476 ]
  %480 = load ptr, ptr %10, align 8
  store i32 %479, ptr %480, align 4
  %481 = load ptr, ptr %10, align 8
  %482 = load i32, ptr %481, align 4
  %483 = load i32, ptr @g_z, align 4
  %484 = icmp sgt i32 %482, %483
  br i1 %484, label %485, label %490

485:                                              ; preds = %478
  %486 = load ptr, ptr %10, align 8
  %487 = load i32, ptr %486, align 4
  %488 = load i32, ptr %18, align 4
  %489 = add nsw i32 %488, %487
  store i32 %489, ptr %18, align 4
  br label %495

490:                                              ; preds = %478
  %491 = load ptr, ptr %10, align 8
  %492 = load i32, ptr %491, align 4
  %493 = load i32, ptr %18, align 4
  %494 = sub nsw i32 %493, %492
  store i32 %494, ptr %18, align 4
  br label %495

495:                                              ; preds = %490, %485
  br label %496

496:                                              ; preds = %495, %467
  store i32 0, ptr %27, align 4
  br label %497

497:                                              ; preds = %521, %496
  %498 = load i32, ptr %27, align 4
  %499 = icmp slt i32 %498, 8
  br i1 %499, label %500, label %524

500:                                              ; preds = %497
  %501 = load i32, ptr %27, align 4
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %502
  %504 = load i32, ptr %503, align 4
  %505 = icmp sgt i32 %504, 0
  br i1 %505, label %506, label %513

506:                                              ; preds = %500
  %507 = load i32, ptr %27, align 4
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %508
  %510 = load i32, ptr %509, align 4
  %511 = load i32, ptr %18, align 4
  %512 = add nsw i32 %511, %510
  store i32 %512, ptr %18, align 4
  br label %520

513:                                              ; preds = %500
  %514 = load i32, ptr %27, align 4
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %515
  %517 = load i32, ptr %516, align 4
  %518 = load i32, ptr %18, align 4
  %519 = sub nsw i32 %518, %517
  store i32 %519, ptr %18, align 4
  br label %520

520:                                              ; preds = %513, %506
  br label %521

521:                                              ; preds = %520
  %522 = load i32, ptr %27, align 4
  %523 = add nsw i32 %522, 1
  store i32 %523, ptr %27, align 4
  br label %497, !llvm.loop !105

524:                                              ; preds = %497
  br label %525

525:                                              ; preds = %524, %398, %302, %145
  %526 = load i32, ptr %18, align 4
  %527 = srem i32 %526, 2
  %528 = icmp eq i32 %527, 0
  br i1 %528, label %529, label %552

529:                                              ; preds = %525
  store i32 0, ptr %28, align 4
  br label %530

530:                                              ; preds = %548, %529
  %531 = load i32, ptr %28, align 4
  %532 = load i32, ptr %15, align 4
  %533 = icmp slt i32 %531, %532
  br i1 %533, label %534, label %551

534:                                              ; preds = %530
  %535 = load i32, ptr %28, align 4
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds i32, ptr %40, i64 %536
  %538 = load i32, ptr %537, align 4
  %539 = icmp sgt i32 %538, 0
  br i1 %539, label %540, label %547

540:                                              ; preds = %534
  %541 = load i32, ptr %28, align 4
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds i32, ptr %40, i64 %542
  %544 = load i32, ptr %543, align 4
  %545 = load i32, ptr %18, align 4
  %546 = add nsw i32 %545, %544
  store i32 %546, ptr %18, align 4
  br label %547

547:                                              ; preds = %540, %534
  br label %548

548:                                              ; preds = %547
  %549 = load i32, ptr %28, align 4
  %550 = add nsw i32 %549, 1
  store i32 %550, ptr %28, align 4
  br label %530, !llvm.loop !106

551:                                              ; preds = %530
  br label %567

552:                                              ; preds = %525
  store i32 0, ptr %29, align 4
  br label %553

553:                                              ; preds = %557, %552
  %554 = load i32, ptr %29, align 4
  %555 = load i32, ptr %15, align 4
  %556 = icmp slt i32 %554, %555
  br i1 %556, label %557, label %566

557:                                              ; preds = %553
  %558 = load i32, ptr %29, align 4
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds i32, ptr %40, i64 %559
  %561 = load i32, ptr %560, align 4
  %562 = load i32, ptr %18, align 4
  %563 = sub nsw i32 %562, %561
  store i32 %563, ptr %18, align 4
  %564 = load i32, ptr %29, align 4
  %565 = add nsw i32 %564, 1
  store i32 %565, ptr %29, align 4
  br label %553, !llvm.loop !107

566:                                              ; preds = %553
  br label %567

567:                                              ; preds = %566, %551
  br label %590

568:                                              ; preds = %393
  %569 = load i32, ptr %18, align 4
  %570 = sub nsw i32 0, %569
  store i32 %570, ptr %18, align 4
  br label %571

571:                                              ; preds = %568, %466, %301, %293, %140
  %572 = load ptr, ptr %10, align 8
  %573 = icmp ne ptr %572, null
  br i1 %573, label %574, label %589

574:                                              ; preds = %571
  %575 = load ptr, ptr %10, align 8
  %576 = load i32, ptr %575, align 4
  %577 = icmp sgt i32 %576, 0
  br i1 %577, label %578, label %583

578:                                              ; preds = %574
  %579 = load ptr, ptr %10, align 8
  %580 = load i32, ptr %579, align 4
  %581 = load i32, ptr %18, align 4
  %582 = add nsw i32 %581, %580
  store i32 %582, ptr %18, align 4
  br label %588

583:                                              ; preds = %574
  %584 = load ptr, ptr %10, align 8
  %585 = load i32, ptr %584, align 4
  %586 = load i32, ptr %18, align 4
  %587 = sub nsw i32 %586, %585
  store i32 %587, ptr %18, align 4
  br label %588

588:                                              ; preds = %583, %578
  br label %589

589:                                              ; preds = %588, %571
  br label %590

590:                                              ; preds = %589, %567
  %591 = load i32, ptr %18, align 4
  %592 = icmp sgt i32 %591, 0
  br i1 %592, label %593, label %595

593:                                              ; preds = %590
  %594 = load i32, ptr %18, align 4
  br label %598

595:                                              ; preds = %590
  %596 = load i32, ptr %18, align 4
  %597 = sub nsw i32 0, %596
  br label %598

598:                                              ; preds = %595, %593
  %599 = phi i32 [ %594, %593 ], [ %597, %595 ]
  %600 = load ptr, ptr %16, align 8
  call void @llvm.stackrestore(ptr %600)
  ret i32 %599
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [8 x i32], align 16
  %10 = alloca [8 x i32], align 16
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 1
  br i1 %12, label %13, label %18

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @atoi(ptr noundef %16) #9
  br label %19

18:                                               ; preds = %2
  br label %19

19:                                               ; preds = %18, %13
  %20 = phi i32 [ %17, %13 ], [ 4, %18 ]
  store i32 %20, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = call i32 @_0_if_only(i32 noundef %21)
  %23 = load i32, ptr %7, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %7, align 4
  %25 = load i32, ptr %6, align 4
  %26 = call i32 @_1_if_else(i32 noundef %25)
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %7, align 4
  %29 = load i32, ptr %6, align 4
  %30 = call i32 @_2_if_with_surrounding_code(i32 noundef %29)
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %7, align 4
  %33 = load i32, ptr %6, align 4
  %34 = call i32 @_3_if_compound(i32 noundef %33)
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %7, align 4
  %37 = load i32, ptr %6, align 4
  %38 = call i32 @_4_if_else_compound(i32 noundef %37)
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %39, %38
  store i32 %40, ptr %7, align 4
  %41 = load i32, ptr %6, align 4
  %42 = call i32 @_5_if_equal(i32 noundef %41, i32 noundef 4)
  %43 = load i32, ptr %7, align 4
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr %7, align 4
  %45 = load i32, ptr %6, align 4
  %46 = call i32 @_6_if_not_equal(i32 noundef %45, i32 noundef 4)
  %47 = load i32, ptr %7, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %7, align 4
  %49 = load i32, ptr %6, align 4
  %50 = call i32 @_7_relational(i32 noundef %49, i32 noundef 4)
  %51 = load i32, ptr %7, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %7, align 4
  %53 = load i32, ptr %6, align 4
  %54 = icmp sgt i32 %53, 0
  %55 = load i32, ptr %6, align 4
  %56 = call i32 @_8_boolean_argument(i1 noundef zeroext %54, i32 noundef %55)
  %57 = load i32, ptr %7, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, ptr %7, align 4
  %59 = load i32, ptr %6, align 4
  %60 = call i32 @_9_if_elseif_else(i32 noundef %59)
  %61 = load i32, ptr %7, align 4
  %62 = add nsw i32 %61, %60
  store i32 %62, ptr %7, align 4
  %63 = load i32, ptr %6, align 4
  %64 = call i32 @_10_multiple_elseif(i32 noundef %63)
  %65 = load i32, ptr %7, align 4
  %66 = add nsw i32 %65, %64
  store i32 %66, ptr %7, align 4
  %67 = load i32, ptr %6, align 4
  %68 = call i32 @_11_elseif_expressions(i32 noundef %67, i32 noundef 4)
  %69 = load i32, ptr %7, align 4
  %70 = add nsw i32 %69, %68
  store i32 %70, ptr %7, align 4
  %71 = load i32, ptr %6, align 4
  %72 = call i32 @_12_and(i32 noundef %71, i32 noundef 3)
  %73 = load i32, ptr %7, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %7, align 4
  %75 = load i32, ptr %6, align 4
  %76 = call i32 @_13_or(i32 noundef %75, i32 noundef -3)
  %77 = load i32, ptr %7, align 4
  %78 = add nsw i32 %77, %76
  store i32 %78, ptr %7, align 4
  %79 = load i32, ptr %6, align 4
  %80 = call i32 @_14_and_or(i32 noundef %79, i32 noundef 2, i32 noundef -1)
  %81 = load i32, ptr %7, align 4
  %82 = add nsw i32 %81, %80
  store i32 %82, ptr %7, align 4
  %83 = load i32, ptr %6, align 4
  %84 = call i32 @_15_or_and(i32 noundef %83, i32 noundef 0, i32 noundef 20)
  %85 = load i32, ptr %7, align 4
  %86 = add nsw i32 %85, %84
  store i32 %86, ptr %7, align 4
  %87 = load i32, ptr %6, align 4
  %88 = call i32 @_16_complex_boolean(i32 noundef %87, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %89 = load i32, ptr %7, align 4
  %90 = add nsw i32 %89, %88
  store i32 %90, ptr %7, align 4
  %91 = load i32, ptr %6, align 4
  %92 = call i32 @_17_nested_arithmetic_condition(i32 noundef %91, i32 noundef 1, i32 noundef 20)
  %93 = load i32, ptr %7, align 4
  %94 = add nsw i32 %93, %92
  store i32 %94, ptr %7, align 4
  %95 = load i32, ptr %6, align 4
  %96 = call i32 @_18_deep_parentheses(i32 noundef %95, i32 noundef 2, i32 noundef 3)
  %97 = load i32, ptr %7, align 4
  %98 = add nsw i32 %97, %96
  store i32 %98, ptr %7, align 4
  %99 = load i32, ptr %6, align 4
  %100 = call i32 @_19_arithmetic_boolean(i32 noundef %99, i32 noundef 2, i32 noundef 5)
  %101 = load i32, ptr %7, align 4
  %102 = add nsw i32 %101, %100
  store i32 %102, ptr %7, align 4
  %103 = load i32, ptr %6, align 4
  %104 = call i32 @_20_nested_boolean_parentheses(i32 noundef %103, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %105 = load i32, ptr %7, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, ptr %7, align 4
  %107 = load i32, ptr %6, align 4
  %108 = call i32 @_21_nested_if(i32 noundef %107, i32 noundef 3)
  %109 = load i32, ptr %7, align 4
  %110 = add nsw i32 %109, %108
  store i32 %110, ptr %7, align 4
  %111 = load i32, ptr %6, align 4
  %112 = call i32 @_22_nested_in_else(i32 noundef %111, i32 noundef 3)
  %113 = load i32, ptr %7, align 4
  %114 = add nsw i32 %113, %112
  store i32 %114, ptr %7, align 4
  %115 = load i32, ptr %6, align 4
  %116 = call i32 @_23_nested_if_else(i32 noundef %115, i32 noundef 3, i32 noundef 5)
  %117 = load i32, ptr %7, align 4
  %118 = add nsw i32 %117, %116
  store i32 %118, ptr %7, align 4
  %119 = load i32, ptr %6, align 4
  %120 = call i32 @_24_three_level_nesting(i32 noundef %119, i32 noundef 3, i32 noundef 5)
  %121 = load i32, ptr %7, align 4
  %122 = add nsw i32 %121, %120
  store i32 %122, ptr %7, align 4
  %123 = load i32, ptr %6, align 4
  %124 = call i32 @_25_deep_nested_values(i32 noundef %123, i32 noundef 3, i32 noundef 10)
  %125 = load i32, ptr %7, align 4
  %126 = add nsw i32 %125, %124
  store i32 %126, ptr %7, align 4
  %127 = load i32, ptr %6, align 4
  %128 = call i32 @_26_nested_and(i32 noundef %127, i32 noundef 3, i32 noundef 5)
  %129 = load i32, ptr %7, align 4
  %130 = add nsw i32 %129, %128
  store i32 %130, ptr %7, align 4
  %131 = load i32, ptr %6, align 4
  %132 = call i32 @_27_nested_or(i32 noundef %131, i32 noundef 0, i32 noundef 20)
  %133 = load i32, ptr %7, align 4
  %134 = add nsw i32 %133, %132
  store i32 %134, ptr %7, align 4
  %135 = load i32, ptr %6, align 4
  %136 = call i32 @_28_nested_complex_boolean(i32 noundef %135, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %137 = load i32, ptr %7, align 4
  %138 = add nsw i32 %137, %136
  store i32 %138, ptr %7, align 4
  %139 = load i32, ptr %6, align 4
  %140 = call i32 @_29_independent_ifs(i32 noundef %139)
  %141 = load i32, ptr %7, align 4
  %142 = add nsw i32 %141, %140
  store i32 %142, ptr %7, align 4
  %143 = load i32, ptr %6, align 4
  %144 = call i32 @_30_independent_if_else(i32 noundef %143, i32 noundef 3)
  %145 = load i32, ptr %7, align 4
  %146 = add nsw i32 %145, %144
  store i32 %146, ptr %7, align 4
  %147 = call i32 @_31_array_condition(i32 noundef 1)
  %148 = load i32, ptr %7, align 4
  %149 = add nsw i32 %148, %147
  store i32 %149, ptr %7, align 4
  %150 = call i32 @_32_array_branches(i32 noundef 2)
  %151 = load i32, ptr %7, align 4
  %152 = add nsw i32 %151, %150
  store i32 %152, ptr %7, align 4
  %153 = call i32 @_33_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %154 = load i32, ptr %7, align 4
  %155 = add nsw i32 %154, %153
  store i32 %155, ptr %7, align 4
  %156 = call i32 @_34_matrix_condition(i32 noundef 1, i32 noundef 1)
  %157 = load i32, ptr %7, align 4
  %158 = add nsw i32 %157, %156
  store i32 %158, ptr %7, align 4
  %159 = call i32 @_35_nested_array(i32 noundef 1, i32 noundef 2)
  %160 = load i32, ptr %7, align 4
  %161 = add nsw i32 %160, %159
  store i32 %161, ptr %7, align 4
  %162 = load i32, ptr %6, align 4
  store i32 %162, ptr %8, align 4
  %163 = call i32 @_36_pointer_condition(ptr noundef %8)
  %164 = load i32, ptr %7, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %7, align 4
  %166 = call i32 @_37_pointer_branches(ptr noundef %8)
  %167 = load i32, ptr %7, align 4
  %168 = add nsw i32 %167, %166
  store i32 %168, ptr %7, align 4
  %169 = call i32 @_38_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %170 = load i32, ptr %7, align 4
  %171 = add nsw i32 %170, %169
  store i32 %171, ptr %7, align 4
  %172 = call i32 @_39_nested_pointer(ptr noundef %8, i32 noundef 3)
  %173 = load i32, ptr %7, align 4
  %174 = add nsw i32 %173, %172
  store i32 %174, ptr %7, align 4
  %175 = load i32, ptr %6, align 4
  store i32 %175, ptr %8, align 4
  %176 = load i32, ptr %6, align 4
  %177 = call i32 @_40_pointer_write(ptr noundef %8, i32 noundef %176)
  %178 = load i32, ptr %7, align 4
  %179 = add nsw i32 %178, %177
  store i32 %179, ptr %7, align 4
  %180 = load i32, ptr %6, align 4
  store i32 %180, ptr %8, align 4
  %181 = load i32, ptr %6, align 4
  %182 = call i32 @_41_pointer_write_nested(ptr noundef %8, i32 noundef %181, i32 noundef 3)
  %183 = load i32, ptr %7, align 4
  %184 = add nsw i32 %183, %182
  store i32 %184, ptr %7, align 4
  %185 = load i32, ptr %6, align 4
  store i32 %185, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %186 = load i32, ptr %6, align 4
  %187 = icmp sgt i32 %186, 0
  br i1 %187, label %188, label %193

188:                                              ; preds = %19
  %189 = load i32, ptr %6, align 4
  %190 = icmp slt i32 %189, 8
  br i1 %190, label %191, label %193

191:                                              ; preds = %188
  %192 = load i32, ptr %6, align 4
  br label %194

193:                                              ; preds = %188, %19
  br label %194

194:                                              ; preds = %193, %191
  %195 = phi i32 [ %192, %191 ], [ 4, %193 ]
  store i32 %195, ptr @g_n, align 4
  %196 = call i32 @_42_global_only()
  %197 = load i32, ptr %7, align 4
  %198 = add nsw i32 %197, %196
  store i32 %198, ptr %7, align 4
  %199 = call i32 @_43_global_and()
  %200 = load i32, ptr %7, align 4
  %201 = add nsw i32 %200, %199
  store i32 %201, ptr %7, align 4
  %202 = call i32 @_44_global_or()
  %203 = load i32, ptr %7, align 4
  %204 = add nsw i32 %203, %202
  store i32 %204, ptr %7, align 4
  %205 = call i32 @_45_global_nested()
  %206 = load i32, ptr %7, align 4
  %207 = add nsw i32 %206, %205
  store i32 %207, ptr %7, align 4
  %208 = call i32 @_46_global_array_only()
  %209 = load i32, ptr %7, align 4
  %210 = add nsw i32 %209, %208
  store i32 %210, ptr %7, align 4
  %211 = call i32 @_47_global_matrix_only()
  %212 = load i32, ptr %7, align 4
  %213 = add nsw i32 %212, %211
  store i32 %213, ptr %7, align 4
  %214 = load i32, ptr %6, align 4
  %215 = call i32 @_48_multiple_returns(i32 noundef %214)
  %216 = load i32, ptr %7, align 4
  %217 = add nsw i32 %216, %215
  store i32 %217, ptr %7, align 4
  %218 = load i32, ptr %6, align 4
  %219 = call i32 @_49_nested_multiple_returns(i32 noundef %218, i32 noundef 3)
  %220 = load i32, ptr %7, align 4
  %221 = add nsw i32 %220, %219
  store i32 %221, ptr %7, align 4
  %222 = load i32, ptr %6, align 4
  %223 = call i32 @_50_complex_multiple_returns(i32 noundef %222, i32 noundef 3, i32 noundef 5)
  %224 = load i32, ptr %7, align 4
  %225 = add nsw i32 %224, %223
  store i32 %225, ptr %7, align 4
  %226 = load i32, ptr %6, align 4
  %227 = call i32 @_51_prefix_code(i32 noundef %226, i32 noundef 2, i32 noundef 3)
  %228 = load i32, ptr %7, align 4
  %229 = add nsw i32 %228, %227
  store i32 %229, ptr %7, align 4
  %230 = load i32, ptr %6, align 4
  %231 = call i32 @_52_suffix_code(i32 noundef %230, i32 noundef 3)
  %232 = load i32, ptr %7, align 4
  %233 = add nsw i32 %232, %231
  store i32 %233, ptr %7, align 4
  %234 = load i32, ptr %6, align 4
  %235 = call i32 @_53_prefix_nested_suffix(i32 noundef %234, i32 noundef 3, i32 noundef 5)
  %236 = load i32, ptr %7, align 4
  %237 = add nsw i32 %236, %235
  store i32 %237, ptr %7, align 4
  %238 = load i32, ptr %6, align 4
  %239 = call i32 @_54_diamond(i32 noundef %238, i32 noundef 3)
  %240 = load i32, ptr %7, align 4
  %241 = add nsw i32 %240, %239
  store i32 %241, ptr %7, align 4
  %242 = load i32, ptr %6, align 4
  %243 = call i32 @_55_multiple_merge_values(i32 noundef %242, i32 noundef 3)
  %244 = load i32, ptr %7, align 4
  %245 = add nsw i32 %244, %243
  store i32 %245, ptr %7, align 4
  %246 = load i32, ptr %6, align 4
  %247 = call i32 @_56_nested_diamonds(i32 noundef %246, i32 noundef 3, i32 noundef 5)
  %248 = load i32, ptr %7, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, ptr %7, align 4
  %250 = load i32, ptr %6, align 4
  %251 = call i32 @_57_ternary_before_if(i32 noundef %250, i32 noundef 3)
  %252 = load i32, ptr %7, align 4
  %253 = add nsw i32 %252, %251
  store i32 %253, ptr %7, align 4
  %254 = load i32, ptr %6, align 4
  %255 = call i32 @_58_ternary_inside_if(i32 noundef %254, i32 noundef 3)
  %256 = load i32, ptr %7, align 4
  %257 = add nsw i32 %256, %255
  store i32 %257, ptr %7, align 4
  %258 = load i32, ptr %6, align 4
  %259 = call i32 @_59_nested_ternary_if(i32 noundef %258, i32 noundef 3, i32 noundef 5)
  %260 = load i32, ptr %7, align 4
  %261 = add nsw i32 %260, %259
  store i32 %261, ptr %7, align 4
  %262 = load i32, ptr %6, align 4
  %263 = call i32 @_60_dynamic_alloca(i32 noundef 4, i32 noundef %262)
  %264 = load i32, ptr %7, align 4
  %265 = add nsw i32 %264, %263
  store i32 %265, ptr %7, align 4
  %266 = load i32, ptr %6, align 4
  %267 = call i32 @_61_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %266)
  %268 = load i32, ptr %7, align 4
  %269 = add nsw i32 %268, %267
  store i32 %269, ptr %7, align 4
  %270 = load i32, ptr %6, align 4
  %271 = call i32 @_62_dynamic_alloca_complex(i32 noundef 6, i32 noundef %270, i32 noundef 3)
  %272 = load i32, ptr %7, align 4
  %273 = add nsw i32 %272, %271
  store i32 %273, ptr %7, align 4
  %274 = load i32, ptr %6, align 4
  %275 = call i32 @_63_malloc_if(i32 noundef 4, i32 noundef %274)
  %276 = load i32, ptr %7, align 4
  %277 = add nsw i32 %276, %275
  store i32 %277, ptr %7, align 4
  %278 = load i32, ptr %6, align 4
  %279 = call i32 @_64_malloc_nested_if(i32 noundef 4, i32 noundef %278, i32 noundef 3)
  %280 = load i32, ptr %7, align 4
  %281 = add nsw i32 %280, %279
  store i32 %281, ptr %7, align 4
  store i32 0, ptr @g_void_result, align 4
  %282 = load i32, ptr %6, align 4
  call void @_65_void_if(i32 noundef %282)
  %283 = load i32, ptr %6, align 4
  call void @_66_void_if_else(i32 noundef %283)
  %284 = load i32, ptr %6, align 4
  call void @_67_void_nested(i32 noundef %284, i32 noundef 3)
  %285 = load i32, ptr %6, align 4
  call void @_68_void_complex(i32 noundef %285, i32 noundef 3, i32 noundef 0)
  call void @_69_void_global_only()
  %286 = load i32, ptr %6, align 4
  store i32 %286, ptr %8, align 4
  %287 = load i32, ptr %6, align 4
  call void @_70_void_pointer(ptr noundef %8, i32 noundef %287)
  %288 = load i32, ptr %6, align 4
  call void @_71_void_array(i32 noundef 1, i32 noundef %288)
  %289 = load i32, ptr @g_void_result, align 4
  %290 = load i32, ptr %7, align 4
  %291 = add nsw i32 %290, %289
  store i32 %291, ptr %7, align 4
  %292 = load i32, ptr %6, align 4
  store i32 %292, ptr %8, align 4
  %293 = load i32, ptr %6, align 4
  %294 = call i32 @_72_complex_control_flow(ptr noundef %8, i32 noundef 1, i32 noundef %293, i32 noundef 3)
  %295 = load i32, ptr %7, align 4
  %296 = add nsw i32 %295, %294
  store i32 %296, ptr %7, align 4
  %297 = load i32, ptr %6, align 4
  %298 = call i32 @_73_complex_merge(i32 noundef %297, i32 noundef 3, i32 noundef 5)
  %299 = load i32, ptr %7, align 4
  %300 = add nsw i32 %299, %298
  store i32 %300, ptr %7, align 4
  %301 = load i32, ptr %6, align 4
  %302 = call i32 @_74_if_stress(ptr noundef %8, i32 noundef 1, i32 noundef %301, i32 noundef 3, i32 noundef 5)
  %303 = load i32, ptr %7, align 4
  %304 = add nsw i32 %303, %302
  store i32 %304, ptr %7, align 4
  %305 = load i32, ptr %6, align 4
  %306 = call i32 @_75_for_simple(i32 noundef 4, i32 noundef %305)
  %307 = load i32, ptr %7, align 4
  %308 = add nsw i32 %307, %306
  store i32 %308, ptr %7, align 4
  %309 = load i32, ptr %6, align 4
  %310 = call i32 @_76_while_simple(i32 noundef 4, i32 noundef %309)
  %311 = load i32, ptr %7, align 4
  %312 = add nsw i32 %311, %310
  store i32 %312, ptr %7, align 4
  %313 = load i32, ptr %6, align 4
  %314 = call i32 @_77_do_while(i32 noundef 4, i32 noundef %313)
  %315 = load i32, ptr %7, align 4
  %316 = add nsw i32 %315, %314
  store i32 %316, ptr %7, align 4
  %317 = call i32 @_78_nested_loops(i32 noundef 3, i32 noundef 4)
  %318 = load i32, ptr %7, align 4
  %319 = add nsw i32 %318, %317
  store i32 %319, ptr %7, align 4
  %320 = call i32 @_79_nested_loop_if(i32 noundef 3, i32 noundef 4)
  %321 = load i32, ptr %7, align 4
  %322 = add nsw i32 %321, %320
  store i32 %322, ptr %7, align 4
  %323 = call i32 @_80_break(i32 noundef 6)
  %324 = load i32, ptr %7, align 4
  %325 = add nsw i32 %324, %323
  store i32 %325, ptr %7, align 4
  %326 = call i32 @_81_continue(i32 noundef 6)
  %327 = load i32, ptr %7, align 4
  %328 = add nsw i32 %327, %326
  store i32 %328, ptr %7, align 4
  %329 = load i32, ptr %6, align 4
  %330 = call i32 @_82_loop_complex_condition(i32 noundef 6, i32 noundef %329)
  %331 = load i32, ptr %7, align 4
  %332 = add nsw i32 %331, %330
  store i32 %332, ptr %7, align 4
  %333 = call i32 @_83_loop_global_array()
  %334 = load i32, ptr %7, align 4
  %335 = add nsw i32 %334, %333
  store i32 %335, ptr %7, align 4
  %336 = load i32, ptr %6, align 4
  %337 = call i32 @_84_loop_pointer(i32 noundef 5, i32 noundef %336)
  %338 = load i32, ptr %7, align 4
  %339 = add nsw i32 %338, %337
  store i32 %339, ptr %7, align 4
  %340 = load i32, ptr %6, align 4
  %341 = call i32 @_85_loop_surrounding_code(i32 noundef 4, i32 noundef %340)
  %342 = load i32, ptr %7, align 4
  %343 = add nsw i32 %342, %341
  store i32 %343, ptr %7, align 4
  %344 = call i32 @_86_triple_nested(i32 noundef 2, i32 noundef 3, i32 noundef 2)
  %345 = load i32, ptr %7, align 4
  %346 = add nsw i32 %345, %344
  store i32 %346, ptr %7, align 4
  %347 = load i32, ptr %6, align 4
  %348 = call i32 @_87_if_OR3(i32 noundef %347, i32 noundef 3, i32 noundef -5)
  %349 = load i32, ptr %7, align 4
  %350 = add nsw i32 %349, %348
  store i32 %350, ptr %7, align 4
  %351 = load i32, ptr %6, align 4
  %352 = call i32 @_88_if_OR3_vla(i32 noundef %351, i32 noundef 3, i32 noundef -5)
  %353 = load i32, ptr %7, align 4
  %354 = add nsw i32 %353, %352
  store i32 %354, ptr %7, align 4
  %355 = load i32, ptr %6, align 4
  %356 = call i32 @_89_loop_vla(i32 noundef 4, i32 noundef %355)
  %357 = load i32, ptr %7, align 4
  %358 = add nsw i32 %357, %356
  store i32 %358, ptr %7, align 4
  %359 = load i32, ptr %6, align 4
  %360 = call i32 @_90_vla_nested_loop(i32 noundef 4, i32 noundef %359)
  %361 = load i32, ptr %7, align 4
  %362 = add nsw i32 %361, %360
  store i32 %362, ptr %7, align 4
  %363 = load i32, ptr %6, align 4
  %364 = call i32 @_91_alloca_inside_loop(i32 noundef 4, i32 noundef %363)
  %365 = load i32, ptr %7, align 4
  %366 = add nsw i32 %365, %364
  store i32 %366, ptr %7, align 4
  %367 = load i32, ptr %6, align 4
  %368 = call i32 @_92_vla_size_from_loop(i32 noundef 5, i32 noundef %367)
  %369 = load i32, ptr %7, align 4
  %370 = add nsw i32 %369, %368
  store i32 %370, ptr %7, align 4
  %371 = call i32 @_93_global_loop()
  %372 = load i32, ptr %7, align 4
  %373 = add nsw i32 %372, %371
  store i32 %373, ptr %7, align 4
  store i32 0, ptr @g_void_result, align 4
  %374 = load i32, ptr %6, align 4
  call void @_94_void_loop(i32 noundef 4, i32 noundef %374)
  %375 = load i32, ptr %6, align 4
  store i32 %375, ptr %8, align 4
  %376 = load i32, ptr %6, align 4
  call void @_95_void_loop_pointer(ptr noundef %8, i32 noundef 4, i32 noundef %376)
  %377 = load i32, ptr @g_void_result, align 4
  %378 = load i32, ptr %7, align 4
  %379 = add nsw i32 %378, %377
  store i32 %379, ptr %7, align 4
  %380 = load i32, ptr %6, align 4
  %381 = call i32 @_96_goto_break(i32 noundef 6, i32 noundef %380)
  %382 = load i32, ptr %7, align 4
  %383 = add nsw i32 %382, %381
  store i32 %383, ptr %7, align 4
  %384 = load i32, ptr %6, align 4
  %385 = call i32 @_97_goto_nested_loop(i32 noundef 5, i32 noundef %384)
  %386 = load i32, ptr %7, align 4
  %387 = add nsw i32 %386, %385
  store i32 %387, ptr %7, align 4
  %388 = load i32, ptr %6, align 4
  %389 = call i32 @_98_goto_vla(i32 noundef 4, i32 noundef %388)
  %390 = load i32, ptr %7, align 4
  %391 = add nsw i32 %390, %389
  store i32 %391, ptr %7, align 4
  %392 = load i32, ptr %6, align 4
  %393 = call i32 @_99_malloc_loop(i32 noundef 4, i32 noundef %392)
  %394 = load i32, ptr %7, align 4
  %395 = add nsw i32 %394, %393
  store i32 %395, ptr %7, align 4
  %396 = load i32, ptr %6, align 4
  store i32 %396, ptr %8, align 4
  %397 = load i32, ptr %6, align 4
  %398 = call i32 @_100_stress(ptr noundef %8, i32 noundef 4, i32 noundef %397, i32 noundef 3)
  %399 = load i32, ptr %7, align 4
  %400 = add nsw i32 %399, %398
  store i32 %400, ptr %7, align 4
  %401 = load i32, ptr %6, align 4
  store i32 %401, ptr %8, align 4
  %402 = load i32, ptr %6, align 4
  %403 = call i32 @_101_stress_goto(ptr noundef %8, i32 noundef 4, i32 noundef %402, i32 noundef 3, i32 noundef 5)
  %404 = load i32, ptr %7, align 4
  %405 = add nsw i32 %404, %403
  store i32 %405, ptr %7, align 4
  %406 = load i32, ptr %6, align 4
  %407 = call i32 @_102_oneblock(i32 noundef %406)
  %408 = load i32, ptr %7, align 4
  %409 = add nsw i32 %408, %407
  store i32 %409, ptr %7, align 4
  %410 = load i32, ptr %6, align 4
  %411 = srem i32 %410, 4
  %412 = load i32, ptr %6, align 4
  %413 = call i32 @_103_switch_if(i32 noundef %411, i32 noundef %412)
  %414 = load i32, ptr %7, align 4
  %415 = add nsw i32 %414, %413
  store i32 %415, ptr %7, align 4
  %416 = load i32, ptr %6, align 4
  %417 = srem i32 %416, 4
  %418 = load i32, ptr %6, align 4
  %419 = call i32 @_104_switch_nested_if(i32 noundef %417, i32 noundef %418, i32 noundef 3)
  %420 = load i32, ptr %7, align 4
  %421 = add nsw i32 %420, %419
  store i32 %421, ptr %7, align 4
  %422 = load i32, ptr %6, align 4
  %423 = srem i32 %422, 4
  %424 = load i32, ptr %6, align 4
  %425 = call i32 @_105_switch_ternary(i32 noundef %423, i32 noundef %424, i32 noundef 3)
  %426 = load i32, ptr %7, align 4
  %427 = add nsw i32 %426, %425
  store i32 %427, ptr %7, align 4
  %428 = load i32, ptr %6, align 4
  %429 = srem i32 %428, 4
  %430 = load i32, ptr %6, align 4
  %431 = call i32 @_106_switch_nested_ternary(i32 noundef %429, i32 noundef %430, i32 noundef 3, i32 noundef 5)
  %432 = load i32, ptr %7, align 4
  %433 = add nsw i32 %432, %431
  store i32 %433, ptr %7, align 4
  %434 = load i32, ptr %6, align 4
  %435 = srem i32 %434, 4
  %436 = load i32, ptr %6, align 4
  %437 = call i32 @_107_switch_for(i32 noundef %435, i32 noundef 4, i32 noundef %436)
  %438 = load i32, ptr %7, align 4
  %439 = add nsw i32 %438, %437
  store i32 %439, ptr %7, align 4
  %440 = load i32, ptr %6, align 4
  %441 = srem i32 %440, 4
  %442 = load i32, ptr %6, align 4
  %443 = call i32 @_108_switch_while(i32 noundef %441, i32 noundef 4, i32 noundef %442)
  %444 = load i32, ptr %7, align 4
  %445 = add nsw i32 %444, %443
  store i32 %445, ptr %7, align 4
  %446 = load i32, ptr %6, align 4
  %447 = srem i32 %446, 4
  %448 = call i32 @_109_switch_nested_for(i32 noundef %447, i32 noundef 3, i32 noundef 4)
  %449 = load i32, ptr %7, align 4
  %450 = add nsw i32 %449, %448
  store i32 %450, ptr %7, align 4
  %451 = load i32, ptr %6, align 4
  %452 = srem i32 %451, 3
  %453 = load i32, ptr %6, align 4
  %454 = call i32 @_110_switch_do_while(i32 noundef %452, i32 noundef 4, i32 noundef %453)
  %455 = load i32, ptr %7, align 4
  %456 = add nsw i32 %455, %454
  store i32 %456, ptr %7, align 4
  %457 = load i32, ptr %6, align 4
  %458 = srem i32 %457, 5
  %459 = call i32 @_111_switch_array(i32 noundef %458, i32 noundef 1)
  %460 = load i32, ptr %7, align 4
  %461 = add nsw i32 %460, %459
  store i32 %461, ptr %7, align 4
  %462 = load i32, ptr %6, align 4
  %463 = srem i32 %462, 4
  %464 = call i32 @_112_switch_matrix_if(i32 noundef %463, i32 noundef 1, i32 noundef 1)
  %465 = load i32, ptr %7, align 4
  %466 = add nsw i32 %465, %464
  store i32 %466, ptr %7, align 4
  %467 = load i32, ptr %6, align 4
  store i32 %467, ptr %8, align 4
  %468 = load i32, ptr %6, align 4
  %469 = srem i32 %468, 5
  %470 = load i32, ptr %6, align 4
  %471 = call i32 @_113_switch_pointer(i32 noundef %469, ptr noundef %8, i32 noundef %470)
  %472 = load i32, ptr %7, align 4
  %473 = add nsw i32 %472, %471
  store i32 %473, ptr %7, align 4
  %474 = load i32, ptr %6, align 4
  store i32 %474, ptr %8, align 4
  %475 = load i32, ptr %6, align 4
  %476 = srem i32 %475, 4
  %477 = call i32 @_114_switch_pointer_array(i32 noundef %476, ptr noundef %8, i32 noundef 1)
  %478 = load i32, ptr %7, align 4
  %479 = add nsw i32 %478, %477
  store i32 %479, ptr %7, align 4
  %480 = load i32, ptr %6, align 4
  %481 = srem i32 %480, 4
  %482 = call i32 @_115_switch_array_loop(i32 noundef %481, i32 noundef 8)
  %483 = load i32, ptr %7, align 4
  %484 = add nsw i32 %483, %482
  store i32 %484, ptr %7, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %9, i8 0, i64 32, i1 false)
  %485 = load i32, ptr %6, align 4
  %486 = srem i32 %485, 4
  %487 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %488 = load i32, ptr %6, align 4
  %489 = call i32 @_116_switch_pointer_loop(i32 noundef %486, ptr noundef %487, i32 noundef 4, i32 noundef %488)
  %490 = load i32, ptr %7, align 4
  %491 = add nsw i32 %490, %489
  store i32 %491, ptr %7, align 4
  %492 = load i32, ptr %6, align 4
  %493 = srem i32 %492, 4
  %494 = load i32, ptr %6, align 4
  %495 = call i32 @_117_switch_ternary_loop(i32 noundef %493, i32 noundef 4, i32 noundef %494, i32 noundef 3)
  %496 = load i32, ptr %7, align 4
  %497 = add nsw i32 %496, %495
  store i32 %497, ptr %7, align 4
  %498 = load i32, ptr %6, align 4
  %499 = srem i32 %498, 3
  %500 = load i32, ptr %6, align 4
  %501 = add nsw i32 %500, 1
  %502 = srem i32 %501, 3
  %503 = load i32, ptr %6, align 4
  %504 = call i32 @_118_nested_switch_if(i32 noundef %499, i32 noundef %502, i32 noundef %503)
  %505 = load i32, ptr %7, align 4
  %506 = add nsw i32 %505, %504
  store i32 %506, ptr %7, align 4
  %507 = load i32, ptr %6, align 4
  %508 = srem i32 %507, 3
  %509 = load i32, ptr %6, align 4
  %510 = add nsw i32 %509, 1
  %511 = srem i32 %510, 3
  %512 = call i32 @_119_nested_switch_loop(i32 noundef %508, i32 noundef %511, i32 noundef 4)
  %513 = load i32, ptr %7, align 4
  %514 = add nsw i32 %513, %512
  store i32 %514, ptr %7, align 4
  %515 = load i32, ptr %6, align 4
  %516 = srem i32 %515, 3
  %517 = load i32, ptr %6, align 4
  %518 = call i32 @_120_switch_nested_for_if_ternary(i32 noundef %516, i32 noundef 3, i32 noundef %517, i32 noundef 3)
  %519 = load i32, ptr %7, align 4
  %520 = add nsw i32 %519, %518
  store i32 %520, ptr %7, align 4
  %521 = load i32, ptr %6, align 4
  %522 = srem i32 %521, 4
  %523 = load i32, ptr %6, align 4
  %524 = call i32 @_121_switch_vla_loop(i32 noundef %522, i32 noundef 4, i32 noundef %523)
  %525 = load i32, ptr %7, align 4
  %526 = add nsw i32 %525, %524
  store i32 %526, ptr %7, align 4
  %527 = load i32, ptr %6, align 4
  %528 = srem i32 %527, 4
  %529 = load i32, ptr %6, align 4
  %530 = call i32 @_122_switch_vla_pointer_ternary(i32 noundef %528, i32 noundef 4, i32 noundef %529)
  %531 = load i32, ptr %7, align 4
  %532 = add nsw i32 %531, %530
  store i32 %532, ptr %7, align 4
  %533 = load i32, ptr %6, align 4
  %534 = srem i32 %533, 4
  %535 = load i32, ptr %6, align 4
  %536 = call i32 @_123_switch_goto(i32 noundef %534, i32 noundef %535)
  %537 = load i32, ptr %7, align 4
  %538 = add nsw i32 %537, %536
  store i32 %538, ptr %7, align 4
  %539 = load i32, ptr %6, align 4
  %540 = srem i32 %539, 4
  %541 = load i32, ptr %6, align 4
  %542 = call i32 @_124_switch_goto_loop(i32 noundef %540, i32 noundef 5, i32 noundef %541)
  %543 = load i32, ptr %7, align 4
  %544 = add nsw i32 %543, %542
  store i32 %544, ptr %7, align 4
  %545 = load i32, ptr %6, align 4
  store i32 %545, ptr %8, align 4
  %546 = load i32, ptr %6, align 4
  %547 = srem i32 %546, 4
  %548 = load i32, ptr %6, align 4
  %549 = call i32 @_125_switch_goto_pointer_array(i32 noundef %547, ptr noundef %8, i32 noundef 1, i32 noundef %548)
  %550 = load i32, ptr %7, align 4
  %551 = add nsw i32 %550, %549
  store i32 %551, ptr %7, align 4
  %552 = load i32, ptr %6, align 4
  %553 = srem i32 %552, 5
  %554 = load i32, ptr %6, align 4
  %555 = call i32 @_126_switch_fallthrough_loop_if(i32 noundef %553, i32 noundef 4, i32 noundef %554)
  %556 = load i32, ptr %7, align 4
  %557 = add nsw i32 %556, %555
  store i32 %557, ptr %7, align 4
  %558 = load i32, ptr %6, align 4
  store i32 %558, ptr %8, align 4
  %559 = load i32, ptr %6, align 4
  %560 = srem i32 %559, 3
  %561 = load i32, ptr %6, align 4
  %562 = add nsw i32 %561, 1
  %563 = srem i32 %562, 3
  %564 = call i32 @_127_nested_switch_array_pointer(i32 noundef %560, i32 noundef %563, ptr noundef %8, i32 noundef 1)
  %565 = load i32, ptr %7, align 4
  %566 = add nsw i32 %565, %564
  store i32 %566, ptr %7, align 4
  %567 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %568 = load i32, ptr %6, align 4
  store i32 %568, ptr %567, align 4
  %569 = getelementptr inbounds i32, ptr %567, i64 1
  %570 = load i32, ptr %6, align 4
  %571 = add nsw i32 %570, 1
  store i32 %571, ptr %569, align 4
  %572 = getelementptr inbounds i32, ptr %569, i64 1
  %573 = load i32, ptr %6, align 4
  %574 = add nsw i32 %573, 2
  store i32 %574, ptr %572, align 4
  %575 = getelementptr inbounds i32, ptr %572, i64 1
  %576 = load i32, ptr %6, align 4
  %577 = add nsw i32 %576, 3
  store i32 %577, ptr %575, align 4
  %578 = getelementptr inbounds i32, ptr %575, i64 1
  %579 = load i32, ptr %6, align 4
  %580 = add nsw i32 %579, 4
  store i32 %580, ptr %578, align 4
  %581 = getelementptr inbounds i32, ptr %578, i64 1
  %582 = load i32, ptr %6, align 4
  %583 = add nsw i32 %582, 5
  store i32 %583, ptr %581, align 4
  %584 = getelementptr inbounds i32, ptr %581, i64 1
  %585 = load i32, ptr %6, align 4
  %586 = add nsw i32 %585, 6
  store i32 %586, ptr %584, align 4
  %587 = getelementptr inbounds i32, ptr %584, i64 1
  %588 = load i32, ptr %6, align 4
  %589 = add nsw i32 %588, 7
  store i32 %589, ptr %587, align 4
  %590 = load i32, ptr %6, align 4
  %591 = srem i32 %590, 4
  %592 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %593 = load i32, ptr %6, align 4
  %594 = call i32 @_128_switch_array_pointer_loops(i32 noundef %591, ptr noundef %592, i32 noundef 4, i32 noundef %593)
  %595 = load i32, ptr %7, align 4
  %596 = add nsw i32 %595, %594
  store i32 %596, ptr %7, align 4
  %597 = load i32, ptr %6, align 4
  %598 = srem i32 %597, 4
  %599 = getelementptr inbounds [8 x i32], ptr %10, i64 0, i64 0
  %600 = load i32, ptr %6, align 4
  %601 = call i32 @_129_switch_vla_nested(i32 noundef %598, ptr noundef %599, i32 noundef 4, i32 noundef %600)
  %602 = load i32, ptr %7, align 4
  %603 = add nsw i32 %602, %601
  store i32 %603, ptr %7, align 4
  %604 = load i32, ptr %6, align 4
  store i32 %604, ptr %8, align 4
  %605 = load i32, ptr %6, align 4
  %606 = srem i32 %605, 5
  %607 = load i32, ptr %6, align 4
  %608 = add nsw i32 %607, 1
  %609 = srem i32 %608, 3
  %610 = load i32, ptr %6, align 4
  %611 = call i32 @_130_switch_stress(i32 noundef %606, i32 noundef %609, ptr noundef %8, i32 noundef 4, i32 noundef %610, i32 noundef 3, i32 noundef 5)
  %612 = load i32, ptr %7, align 4
  %613 = add nsw i32 %612, %611
  store i32 %613, ptr %7, align 4
  %614 = load i32, ptr %7, align 4
  %615 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %614)
  ret i32 0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare i32 @printf(ptr noundef, ...) #6

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }
attributes #9 = { nounwind willreturn memory(read) }

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
