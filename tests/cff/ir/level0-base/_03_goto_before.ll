; ModuleID = '_03_goto.c'
source_filename = "_03_goto.c"
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
define dso_local i32 @_00_goto_only(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %5 = load i32, ptr %3, align 4
  store i32 %5, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  br label %11

9:                                                ; preds = %1
  %10 = load i32, ptr %4, align 4
  store i32 %10, ptr %2, align 4
  br label %14

11:                                               ; preds = %8
  %12 = load i32, ptr %4, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %2, align 4
  br label %14

14:                                               ; preds = %11, %9
  %15 = load i32, ptr %2, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_goto_two_labels(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  br label %8

7:                                                ; preds = %1
  br label %11

8:                                                ; preds = %6
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 10
  store i32 %10, ptr %2, align 4
  br label %14

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = sub nsw i32 %12, 10
  store i32 %13, ptr %2, align 4
  br label %14

14:                                               ; preds = %11, %8
  %15 = load i32, ptr %2, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_goto_surrounding_code(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = add nsw i32 %4, 3
  store i32 %5, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  br label %10

9:                                                ; preds = %1
  br label %13

10:                                               ; preds = %8
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %10, %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 5
  store i32 %15, ptr %3, align 4
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_goto_skip_block(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  store i32 %4, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %11

8:                                                ; preds = %1
  %9 = load i32, ptr %3, align 4
  %10 = sub nsw i32 %9, 100
  store i32 %10, ptr %3, align 4
  br label %11

11:                                               ; preds = %8, %7
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %3, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_goto_equal(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %11

10:                                               ; preds = %2
  store i32 200, ptr %3, align 4
  br label %12

11:                                               ; preds = %9
  store i32 100, ptr %3, align 4
  br label %12

12:                                               ; preds = %11, %10
  %13 = load i32, ptr %3, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_goto_not_equal(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %14

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %5, align 4
  %13 = sub nsw i32 %11, %12
  store i32 %13, ptr %3, align 4
  br label %18

14:                                               ; preds = %9
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %3, align 4
  br label %18

18:                                               ; preds = %14, %10
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_relational(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %16

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %10
  br label %17

15:                                               ; preds = %10
  store i32 3, ptr %3, align 4
  br label %18

16:                                               ; preds = %9
  store i32 1, ptr %3, align 4
  br label %18

17:                                               ; preds = %14
  store i32 2, ptr %3, align 4
  br label %18

18:                                               ; preds = %17, %16, %15
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = zext i1 %0 to i8
  store i8 %6, ptr %4, align 1
  store i32 %1, ptr %5, align 4
  %7 = load i8, ptr %4, align 1
  %8 = trunc i8 %7 to i1
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %13

10:                                               ; preds = %2
  %11 = load i32, ptr %5, align 4
  %12 = sub nsw i32 %11, 3
  store i32 %12, ptr %3, align 4
  br label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %5, align 4
  %15 = mul nsw i32 %14, 3
  store i32 %15, ptr %3, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_goto_chain(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 10
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  br label %14

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 5
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %17

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %2, align 4
  br label %20

14:                                               ; preds = %6
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 100
  store i32 %16, ptr %2, align 4
  br label %20

17:                                               ; preds = %10
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 50
  store i32 %19, ptr %2, align 4
  br label %20

20:                                               ; preds = %17, %14, %11
  %21 = load i32, ptr %2, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_multiple_levels(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, -10
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  br label %20

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %21

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %22

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = icmp slt i32 %16, 10
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  br label %23

19:                                               ; preds = %15
  store i32 1, ptr %2, align 4
  br label %24

20:                                               ; preds = %6
  store i32 -1, ptr %2, align 4
  br label %24

21:                                               ; preds = %10
  store i32 -2, ptr %2, align 4
  br label %24

22:                                               ; preds = %14
  store i32 0, ptr %2, align 4
  br label %24

23:                                               ; preds = %18
  store i32 2, ptr %2, align 4
  br label %24

24:                                               ; preds = %23, %22, %21, %20, %19
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_goto_expressions(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %25

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %10
  br label %28

15:                                               ; preds = %10
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %16, 10
  %18 = load i32, ptr %5, align 4
  %19 = icmp sgt i32 %17, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %15
  br label %32

21:                                               ; preds = %15
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %3, align 4
  br label %36

25:                                               ; preds = %9
  %26 = load i32, ptr %4, align 4
  %27 = mul nsw i32 %26, 2
  store i32 %27, ptr %3, align 4
  br label %36

28:                                               ; preds = %14
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, ptr %3, align 4
  br label %36

32:                                               ; preds = %20
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %5, align 4
  %35 = sub nsw i32 %33, %34
  store i32 %35, ptr %3, align 4
  br label %36

36:                                               ; preds = %32, %28, %25, %21
  %37 = load i32, ptr %3, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_and(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %16

12:                                               ; preds = %8, %2
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %5, align 4
  %15 = sub nsw i32 %13, %14
  store i32 %15, ptr %3, align 4
  br label %20

16:                                               ; preds = %11
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  br label %20

20:                                               ; preds = %16, %12
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_or(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %10, label %11, label %12

11:                                               ; preds = %8, %2
  br label %17

12:                                               ; preds = %8
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add nsw i32 %13, %14
  %16 = sub nsw i32 %15, 10
  store i32 %16, ptr %3, align 4
  br label %22

17:                                               ; preds = %11
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %18, %19
  %21 = add nsw i32 %20, 10
  store i32 %21, ptr %3, align 4
  br label %22

22:                                               ; preds = %17, %12
  %23 = load i32, ptr %3, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_and_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %18

17:                                               ; preds = %13
  store i32 200, ptr %4, align 4
  br label %19

18:                                               ; preds = %16
  store i32 100, ptr %4, align 4
  br label %19

19:                                               ; preds = %18, %17
  %20 = load i32, ptr %4, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_or_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %18

17:                                               ; preds = %13, %10
  store i32 400, ptr %4, align 4
  br label %19

18:                                               ; preds = %16
  store i32 300, ptr %4, align 4
  br label %19

19:                                               ; preds = %18, %17
  %20 = load i32, ptr %4, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br i1 %17, label %18, label %22

18:                                               ; preds = %15
  %19 = load i32, ptr %9, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %18, %12
  br label %30

22:                                               ; preds = %18, %15
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %7, align 4
  %25 = sub nsw i32 %23, %24
  %26 = load i32, ptr %8, align 4
  %27 = sub nsw i32 %25, %26
  %28 = load i32, ptr %9, align 4
  %29 = sub nsw i32 %27, %28
  store i32 %29, ptr %5, align 4
  br label %38

30:                                               ; preds = %21
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, ptr %8, align 4
  %35 = add nsw i32 %33, %34
  %36 = load i32, ptr %9, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, ptr %5, align 4
  br label %38

38:                                               ; preds = %30, %22
  %39 = load i32, ptr %5, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_nested_arithmetic_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %19

18:                                               ; preds = %3
  store i32 222, ptr %4, align 4
  br label %20

19:                                               ; preds = %17
  store i32 111, ptr %4, align 4
  br label %20

20:                                               ; preds = %19, %18
  %21 = load i32, ptr %4, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_deep_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %20, label %21, label %22

21:                                               ; preds = %3
  br label %28

22:                                               ; preds = %3
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = sub nsw i32 %23, %24
  %26 = load i32, ptr %7, align 4
  %27 = sub nsw i32 %25, %26
  store i32 %27, ptr %4, align 4
  br label %34

28:                                               ; preds = %21
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %31, %32
  store i32 %33, ptr %4, align 4
  br label %34

34:                                               ; preds = %28, %22
  %35 = load i32, ptr %4, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_arithmetic_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %22

21:                                               ; preds = %13, %3
  store i32 456, ptr %4, align 4
  br label %23

22:                                               ; preds = %20
  store i32 123, ptr %4, align 4
  br label %23

23:                                               ; preds = %22, %21
  %24 = load i32, ptr %4, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_nested_boolean_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br label %31

30:                                               ; preds = %25, %21
  store i32 888, ptr %5, align 4
  br label %32

31:                                               ; preds = %29
  store i32 777, ptr %5, align 4
  br label %32

32:                                               ; preds = %31, %30
  %33 = load i32, ptr %5, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_nested_goto(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %7 = load i32, ptr %4, align 4
  store i32 %7, ptr %6, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  br label %13

11:                                               ; preds = %2
  %12 = load i32, ptr %6, align 4
  store i32 %12, ptr %3, align 4
  br label %31

13:                                               ; preds = %10
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %24

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %5, align 4
  %20 = sub nsw i32 %18, %19
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %6, align 4
  store i32 %23, ptr %3, align 4
  br label %31

24:                                               ; preds = %16
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %6, align 4
  %30 = load i32, ptr %6, align 4
  store i32 %30, ptr %3, align 4
  br label %31

31:                                               ; preds = %24, %17, %11
  %32 = load i32, ptr %3, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_nested_in_else(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %16

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %20

13:                                               ; preds = %9
  %14 = load i32, ptr %5, align 4
  %15 = sub nsw i32 %14, 2
  store i32 %15, ptr %3, align 4
  br label %23

16:                                               ; preds = %8
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  br label %23

20:                                               ; preds = %12
  %21 = load i32, ptr %5, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, ptr %3, align 4
  br label %23

23:                                               ; preds = %20, %16, %13
  %24 = load i32, ptr %3, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_nested_goto_else(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  br label %18

11:                                               ; preds = %3
  %12 = load i32, ptr %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %30

15:                                               ; preds = %11
  %16 = load i32, ptr %7, align 4
  %17 = sub nsw i32 %16, 2
  store i32 %17, ptr %4, align 4
  br label %33

18:                                               ; preds = %10
  %19 = load i32, ptr %6, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  br label %26

22:                                               ; preds = %18
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = sub nsw i32 %23, %24
  store i32 %25, ptr %4, align 4
  br label %33

26:                                               ; preds = %21
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %4, align 4
  br label %33

30:                                               ; preds = %14
  %31 = load i32, ptr %7, align 4
  %32 = mul nsw i32 %31, 2
  store i32 %32, ptr %4, align 4
  br label %33

33:                                               ; preds = %30, %26, %22, %15
  %34 = load i32, ptr %4, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_three_level_nesting(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  br label %13

12:                                               ; preds = %3
  store i32 -1, ptr %4, align 4
  br label %36

13:                                               ; preds = %11
  %14 = load i32, ptr %8, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %8, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %13
  br label %23

19:                                               ; preds = %13
  %20 = load i32, ptr %8, align 4
  %21 = add nsw i32 %20, 20
  store i32 %21, ptr %8, align 4
  %22 = load i32, ptr %8, align 4
  store i32 %22, ptr %4, align 4
  br label %36

23:                                               ; preds = %18
  %24 = load i32, ptr %8, align 4
  %25 = add nsw i32 %24, 10
  store i32 %25, ptr %8, align 4
  %26 = load i32, ptr %7, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %23
  br label %33

29:                                               ; preds = %23
  %30 = load i32, ptr %8, align 4
  %31 = sub nsw i32 %30, 100
  store i32 %31, ptr %8, align 4
  %32 = load i32, ptr %8, align 4
  store i32 %32, ptr %4, align 4
  br label %36

33:                                               ; preds = %28
  %34 = load i32, ptr %8, align 4
  %35 = add nsw i32 %34, 100
  store i32 %35, ptr %4, align 4
  br label %36

36:                                               ; preds = %33, %29, %19, %12
  %37 = load i32, ptr %4, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_deep_nested_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %13, label %14, label %15

14:                                               ; preds = %3
  br label %19

15:                                               ; preds = %3
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %7, align 4
  %18 = sub nsw i32 %16, %17
  store i32 %18, ptr %4, align 4
  br label %52

19:                                               ; preds = %14
  %20 = load i32, ptr %8, align 4
  %21 = add nsw i32 %20, 10
  store i32 %21, ptr %8, align 4
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %7, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %26

25:                                               ; preds = %19
  br label %39

26:                                               ; preds = %19
  %27 = load i32, ptr %8, align 4
  %28 = sub nsw i32 %27, 5
  store i32 %28, ptr %8, align 4
  %29 = load i32, ptr %8, align 4
  %30 = load i32, ptr %7, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %33

32:                                               ; preds = %26
  br label %36

33:                                               ; preds = %26
  %34 = load i32, ptr %8, align 4
  %35 = sdiv i32 %34, 2
  store i32 %35, ptr %4, align 4
  br label %52

36:                                               ; preds = %32
  %37 = load i32, ptr %8, align 4
  %38 = mul nsw i32 %37, 2
  store i32 %38, ptr %4, align 4
  br label %52

39:                                               ; preds = %25
  %40 = load i32, ptr %8, align 4
  %41 = mul nsw i32 %40, 2
  store i32 %41, ptr %8, align 4
  %42 = load i32, ptr %8, align 4
  %43 = srem i32 %42, 3
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %39
  br label %49

46:                                               ; preds = %39
  %47 = load i32, ptr %8, align 4
  %48 = sub nsw i32 %47, 3
  store i32 %48, ptr %4, align 4
  br label %52

49:                                               ; preds = %45
  %50 = load i32, ptr %8, align 4
  %51 = add nsw i32 %50, 3
  store i32 %51, ptr %4, align 4
  br label %52

52:                                               ; preds = %49, %46, %36, %33, %15
  %53 = load i32, ptr %4, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_nested_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %3
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %17

15:                                               ; preds = %11, %3
  %16 = load i32, ptr %7, align 4
  store i32 %16, ptr %4, align 4
  br label %36

17:                                               ; preds = %14
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %8, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %8, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %17
  %24 = load i32, ptr %7, align 4
  %25 = icmp slt i32 %24, 10
  br i1 %25, label %26, label %27

26:                                               ; preds = %23
  br label %32

27:                                               ; preds = %23, %17
  %28 = load i32, ptr %6, align 4
  %29 = load i32, ptr %8, align 4
  %30 = sub nsw i32 %29, %28
  store i32 %30, ptr %8, align 4
  %31 = load i32, ptr %8, align 4
  store i32 %31, ptr %4, align 4
  br label %36

32:                                               ; preds = %26
  %33 = load i32, ptr %8, align 4
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %4, align 4
  br label %36

36:                                               ; preds = %32, %27, %15
  %37 = load i32, ptr %4, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_nested_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %12, label %13, label %14

13:                                               ; preds = %10, %3
  br label %15

14:                                               ; preds = %10
  store i32 3000, ptr %4, align 4
  br label %24

15:                                               ; preds = %13
  %16 = load i32, ptr %7, align 4
  %17 = icmp sgt i32 %16, 10
  br i1 %17, label %21, label %18

18:                                               ; preds = %15
  %19 = load i32, ptr %7, align 4
  %20 = icmp slt i32 %19, -10
  br i1 %20, label %21, label %22

21:                                               ; preds = %18, %15
  br label %23

22:                                               ; preds = %18
  store i32 2000, ptr %4, align 4
  br label %24

23:                                               ; preds = %21
  store i32 1000, ptr %4, align 4
  br label %24

24:                                               ; preds = %23, %22, %14
  %25 = load i32, ptr %4, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_nested_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br i1 %17, label %18, label %19

18:                                               ; preds = %15, %12
  br label %23

19:                                               ; preds = %15
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %9, align 4
  %22 = sub nsw i32 %20, %21
  store i32 %22, ptr %5, align 4
  br label %46

23:                                               ; preds = %18
  %24 = load i32, ptr %9, align 4
  %25 = icmp sgt i32 %24, 5
  br i1 %25, label %30, label %26

26:                                               ; preds = %23
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %7, align 4
  %29 = icmp eq i32 %27, %28
  br i1 %29, label %30, label %34

30:                                               ; preds = %26, %23
  %31 = load i32, ptr %8, align 4
  %32 = icmp slt i32 %31, 10
  br i1 %32, label %33, label %34

33:                                               ; preds = %30
  br label %38

34:                                               ; preds = %30, %26
  %35 = load i32, ptr %6, align 4
  %36 = load i32, ptr %7, align 4
  %37 = mul nsw i32 %35, %36
  store i32 %37, ptr %5, align 4
  br label %46

38:                                               ; preds = %33
  %39 = load i32, ptr %6, align 4
  %40 = load i32, ptr %7, align 4
  %41 = add nsw i32 %39, %40
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %41, %42
  %44 = load i32, ptr %9, align 4
  %45 = add nsw i32 %43, %44
  store i32 %45, ptr %5, align 4
  br label %46

46:                                               ; preds = %38, %34, %19
  %47 = load i32, ptr %5, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_independent_gotos(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %5 = load i32, ptr %3, align 4
  store i32 %5, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  br label %19

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 5
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %22

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 10
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %25

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  store i32 %18, ptr %2, align 4
  br label %40

19:                                               ; preds = %8
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 10
  store i32 %21, ptr %4, align 4
  br label %29

22:                                               ; preds = %32, %12
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 20
  store i32 %24, ptr %4, align 4
  br label %34

25:                                               ; preds = %37, %16
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 30
  store i32 %27, ptr %4, align 4
  %28 = load i32, ptr %4, align 4
  store i32 %28, ptr %2, align 4
  br label %40

29:                                               ; preds = %19
  %30 = load i32, ptr %3, align 4
  %31 = icmp sgt i32 %30, 5
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  br label %22

33:                                               ; preds = %29
  br label %34

34:                                               ; preds = %33, %22
  %35 = load i32, ptr %3, align 4
  %36 = icmp sgt i32 %35, 10
  br i1 %36, label %37, label %38

37:                                               ; preds = %34
  br label %25

38:                                               ; preds = %34
  %39 = load i32, ptr %4, align 4
  store i32 %39, ptr %2, align 4
  br label %40

40:                                               ; preds = %38, %25, %17
  %41 = load i32, ptr %2, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_independent_goto_paths(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %13

10:                                               ; preds = %2
  %11 = load i32, ptr %6, align 4
  %12 = sub nsw i32 %11, 10
  store i32 %12, ptr %6, align 4
  br label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %14, 10
  store i32 %15, ptr %6, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %23

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  %22 = sub nsw i32 %21, 20
  store i32 %22, ptr %3, align 4
  br label %26

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 20
  store i32 %25, ptr %3, align 4
  br label %26

26:                                               ; preds = %23, %20
  %27 = load i32, ptr %3, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_array_condition(i32 noundef %0) #0 {
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
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  br label %15

12:                                               ; preds = %1
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %13, 2
  store i32 %14, ptr %2, align 4
  br label %18

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %2, align 4
  br label %18

18:                                               ; preds = %15, %12
  %19 = load i32, ptr %2, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_array_branches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %5
  %7 = load i32, ptr %6, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  br label %17

10:                                               ; preds = %1
  %11 = load i32, ptr %3, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  %16 = sub nsw i32 %14, %15
  store i32 %16, ptr %2, align 4
  br label %24

17:                                               ; preds = %9
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %23 = add nsw i32 %21, %22
  store i32 %23, ptr %2, align 4
  br label %24

24:                                               ; preds = %17, %10
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_array_complex_condition(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %14, label %15, label %22

15:                                               ; preds = %2
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %15
  br label %28

22:                                               ; preds = %15, %2
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i32 %26, 10
  store i32 %27, ptr %3, align 4
  br label %34

28:                                               ; preds = %21
  %29 = load i32, ptr %4, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = mul nsw i32 %32, 10
  store i32 %33, ptr %3, align 4
  br label %34

34:                                               ; preds = %28, %22
  %35 = load i32, ptr %3, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_matrix_condition(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  br label %20

17:                                               ; preds = %2
  %18 = load i32, ptr %6, align 4
  %19 = sub nsw i32 %18, 2
  store i32 %19, ptr %3, align 4
  br label %23

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, ptr %3, align 4
  br label %23

23:                                               ; preds = %20, %17
  %24 = load i32, ptr %3, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_nested_array(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %14

13:                                               ; preds = %9, %2
  store i32 0, ptr %3, align 4
  br label %65

14:                                               ; preds = %12
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %6, align 4
  %21 = load i32, ptr %5, align 4
  %22 = icmp sge i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %14
  %24 = load i32, ptr %5, align 4
  %25 = icmp slt i32 %24, 8
  br i1 %25, label %26, label %27

26:                                               ; preds = %23
  br label %29

27:                                               ; preds = %23, %14
  %28 = load i32, ptr %6, align 4
  store i32 %28, ptr %3, align 4
  br label %65

29:                                               ; preds = %26
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = icmp sgt i32 %33, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %29
  br label %53

40:                                               ; preds = %29
  %41 = load i32, ptr %5, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = load i32, ptr %4, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = sub nsw i32 %44, %48
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %6, align 4
  %52 = load i32, ptr %6, align 4
  store i32 %52, ptr %3, align 4
  br label %65

53:                                               ; preds = %39
  %54 = load i32, ptr %6, align 4
  %55 = load i32, ptr %4, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = add nsw i32 %54, %58
  %60 = load i32, ptr %5, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = sub nsw i32 %59, %63
  store i32 %64, ptr %3, align 4
  br label %65

65:                                               ; preds = %53, %40, %27, %13
  %66 = load i32, ptr %3, align 4
  ret i32 %66
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_pointer_condition(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 10
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %12

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, 2
  store i32 %11, ptr %2, align 4
  br label %16

12:                                               ; preds = %7
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %13, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %2, align 4
  br label %16

16:                                               ; preds = %12, %8
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_pointer_branches(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load i32, ptr %4, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %12

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %9, align 4
  %11 = sub nsw i32 %10, 100
  store i32 %11, ptr %2, align 4
  br label %16

12:                                               ; preds = %7
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 100
  store i32 %15, ptr %2, align 4
  br label %16

16:                                               ; preds = %12, %8
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_pointer_array(ptr noundef %0, i32 noundef %1) #0 {
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
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  br label %28

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = sub nsw i32 %22, %26
  store i32 %27, ptr %3, align 4
  br label %39

28:                                               ; preds = %16
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %5, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %33, %37
  store i32 %38, ptr %3, align 4
  br label %39

39:                                               ; preds = %28, %17
  %40 = load i32, ptr %3, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_nested_pointer(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  br label %16

13:                                               ; preds = %2
  %14 = load i32, ptr %6, align 4
  %15 = sub nsw i32 0, %14
  store i32 %15, ptr %3, align 4
  br label %31

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %18, align 4
  %20 = icmp sgt i32 %17, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %16
  br label %27

22:                                               ; preds = %16
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = sub nsw i32 %24, %23
  store i32 %25, ptr %6, align 4
  %26 = load i32, ptr %6, align 4
  store i32 %26, ptr %3, align 4
  br label %31

27:                                               ; preds = %21
  %28 = load i32, ptr %6, align 4
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr %3, align 4
  br label %31

31:                                               ; preds = %27, %22, %13
  %32 = load i32, ptr %3, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_pointer_write(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = sub nsw i32 %9, 2
  %11 = load ptr, ptr %3, align 8
  store i32 %10, ptr %11, align 4
  br label %16

12:                                               ; preds = %7
  %13 = load i32, ptr %4, align 4
  %14 = mul nsw i32 %13, 2
  %15 = load ptr, ptr %3, align 8
  store i32 %14, ptr %15, align 4
  br label %16

16:                                               ; preds = %12, %8
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %17, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_pointer_write_nested(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %3
  br label %14

10:                                               ; preds = %3
  %11 = load i32, ptr %5, align 4
  %12 = sub nsw i32 0, %11
  %13 = load ptr, ptr %4, align 8
  store i32 %12, ptr %13, align 4
  br label %28

14:                                               ; preds = %9
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  br label %23

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %6, align 4
  %21 = sub nsw i32 %19, %20
  %22 = load ptr, ptr %4, align 8
  store i32 %21, ptr %22, align 4
  br label %28

23:                                               ; preds = %17
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %24, %25
  %27 = load ptr, ptr %4, align 8
  store i32 %26, ptr %27, align 4
  br label %28

28:                                               ; preds = %23, %18, %10
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %29, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_global_only() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  br label %9

5:                                                ; preds = %0
  %6 = load i32, ptr @g_x, align 4
  %7 = load i32, ptr @g_y, align 4
  %8 = sub nsw i32 %6, %7
  store i32 %8, ptr %1, align 4
  br label %13

9:                                                ; preds = %4
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %1, align 4
  br label %13

13:                                               ; preds = %9, %5
  %14 = load i32, ptr %1, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_global_and() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %0
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  br label %10

8:                                                ; preds = %4, %0
  %9 = load i32, ptr @g_z, align 4
  store i32 %9, ptr %1, align 4
  br label %14

10:                                               ; preds = %7
  %11 = load i32, ptr @g_x, align 4
  %12 = load i32, ptr @g_y, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %1, align 4
  br label %14

14:                                               ; preds = %10, %8
  %15 = load i32, ptr %1, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_global_or() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %0
  %5 = load i32, ptr @g_z, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %4, %0
  br label %10

8:                                                ; preds = %4
  %9 = load i32, ptr @g_y, align 4
  store i32 %9, ptr %1, align 4
  br label %14

10:                                               ; preds = %7
  %11 = load i32, ptr @g_x, align 4
  %12 = load i32, ptr @g_z, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %1, align 4
  br label %14

14:                                               ; preds = %10, %8
  %15 = load i32, ptr %1, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_global_nested() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  br label %7

5:                                                ; preds = %0
  %6 = load i32, ptr @g_z, align 4
  store i32 %6, ptr %1, align 4
  br label %19

7:                                                ; preds = %4
  %8 = load i32, ptr @g_y, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %15

11:                                               ; preds = %7
  %12 = load i32, ptr @g_x, align 4
  %13 = load i32, ptr @g_y, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, ptr %1, align 4
  br label %19

15:                                               ; preds = %10
  %16 = load i32, ptr @g_x, align 4
  %17 = load i32, ptr @g_y, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %1, align 4
  br label %19

19:                                               ; preds = %15, %11, %5
  %20 = load i32, ptr %1, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_global_array_only() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_arr, align 16
  %3 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  br label %8

6:                                                ; preds = %0
  %7 = load i32, ptr @g_arr, align 16
  store i32 %7, ptr %1, align 4
  br label %10

8:                                                ; preds = %5
  %9 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 %9, ptr %1, align 4
  br label %10

10:                                               ; preds = %8, %6
  %11 = load i32, ptr %1, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_matrix_only() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @g_mat, align 16
  %3 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  br label %8

6:                                                ; preds = %0
  %7 = load i32, ptr @g_mat, align 16
  store i32 %7, ptr %1, align 4
  br label %10

8:                                                ; preds = %5
  %9 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  store i32 %9, ptr %1, align 4
  br label %10

10:                                               ; preds = %8, %6
  %11 = load i32, ptr %1, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_multiple_returns(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  br label %16

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %17

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %12, 10
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %18

15:                                               ; preds = %11
  store i32 20, ptr %2, align 4
  br label %19

16:                                               ; preds = %6
  store i32 -1, ptr %2, align 4
  br label %19

17:                                               ; preds = %10
  store i32 0, ptr %2, align 4
  br label %19

18:                                               ; preds = %14
  store i32 10, ptr %2, align 4
  br label %19

19:                                               ; preds = %18, %17, %16, %15
  %20 = load i32, ptr %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_nested_multiple_returns(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %12

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = sub nsw i32 0, %10
  store i32 %11, ptr %3, align 4
  br label %30

12:                                               ; preds = %8
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %24

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %28

20:                                               ; preds = %16
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %3, align 4
  br label %30

24:                                               ; preds = %15
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, ptr %3, align 4
  br label %30

28:                                               ; preds = %19
  %29 = load i32, ptr %4, align 4
  store i32 %29, ptr %3, align 4
  br label %30

30:                                               ; preds = %28, %24, %20, %9
  %31 = load i32, ptr %3, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_complex_multiple_returns(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  br label %31

14:                                               ; preds = %10, %3
  %15 = load i32, ptr %5, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %20, label %17

17:                                               ; preds = %14
  %18 = load i32, ptr %7, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17, %14
  br label %35

21:                                               ; preds = %17
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, ptr %7, align 4
  %26 = mul nsw i32 %25, 2
  %27 = icmp sgt i32 %24, %26
  br i1 %27, label %28, label %29

28:                                               ; preds = %21
  br label %39

29:                                               ; preds = %21
  %30 = load i32, ptr %7, align 4
  store i32 %30, ptr %4, align 4
  br label %43

31:                                               ; preds = %13
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %32, %33
  store i32 %34, ptr %4, align 4
  br label %43

35:                                               ; preds = %20
  %36 = load i32, ptr %5, align 4
  %37 = load i32, ptr %7, align 4
  %38 = sub nsw i32 %36, %37
  store i32 %38, ptr %4, align 4
  br label %43

39:                                               ; preds = %28
  %40 = load i32, ptr %5, align 4
  %41 = load i32, ptr %6, align 4
  %42 = mul nsw i32 %40, %41
  store i32 %42, ptr %4, align 4
  br label %43

43:                                               ; preds = %39, %35, %31, %29
  %44 = load i32, ptr %4, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_50_prefix_code(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %19, label %20, label %21

20:                                               ; preds = %3
  br label %24

21:                                               ; preds = %3
  %22 = load i32, ptr %9, align 4
  %23 = sub nsw i32 %22, 100
  store i32 %23, ptr %9, align 4
  br label %27

24:                                               ; preds = %20
  %25 = load i32, ptr %9, align 4
  %26 = add nsw i32 %25, 100
  store i32 %26, ptr %9, align 4
  br label %27

27:                                               ; preds = %24, %21
  %28 = load i32, ptr %9, align 4
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %8, align 4
  %32 = add nsw i32 %30, %31
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_51_suffix_code(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %13

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %5, align 4
  br label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %5, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %5, align 4
  %19 = load i32, ptr %5, align 4
  %20 = mul nsw i32 %19, 3
  store i32 %20, ptr %5, align 4
  %21 = load i32, ptr %5, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_prefix_nested_suffix(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %12, label %13, label %14

13:                                               ; preds = %3
  br label %17

14:                                               ; preds = %3
  %15 = load i32, ptr %7, align 4
  %16 = sub nsw i32 0, %15
  store i32 %16, ptr %7, align 4
  br label %33

17:                                               ; preds = %13
  %18 = load i32, ptr %7, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, ptr %7, align 4
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp sgt i32 %20, %21
  br i1 %22, label %23, label %24

23:                                               ; preds = %17
  br label %27

24:                                               ; preds = %17
  %25 = load i32, ptr %7, align 4
  %26 = sub nsw i32 %25, 10
  store i32 %26, ptr %7, align 4
  br label %30

27:                                               ; preds = %23
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 10
  store i32 %29, ptr %7, align 4
  br label %30

30:                                               ; preds = %27, %24
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %31, 5
  store i32 %32, ptr %7, align 4
  br label %33

33:                                               ; preds = %30, %14
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %34, %35
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_diamond(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %13

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %11, 20
  store i32 %12, ptr %5, align 4
  br label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 10
  store i32 %15, ptr %5, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %5, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_multiple_merge_values(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %15

10:                                               ; preds = %2
  %11 = load i32, ptr %3, align 4
  %12 = sub nsw i32 %11, 1
  store i32 %12, ptr %5, align 4
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %13, 2
  store i32 %14, ptr %6, align 4
  br label %20

15:                                               ; preds = %9
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, 2
  store i32 %19, ptr %6, align 4
  br label %20

20:                                               ; preds = %15, %10
  %21 = load i32, ptr %5, align 4
  %22 = load i32, ptr %6, align 4
  %23 = mul nsw i32 %21, %22
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_55_nested_diamonds(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  br label %25

13:                                               ; preds = %3
  %14 = load i32, ptr %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %21

17:                                               ; preds = %13
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %5, align 4
  %20 = sub nsw i32 %18, %19
  store i32 %20, ptr %8, align 4
  br label %37

21:                                               ; preds = %16
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %8, align 4
  br label %37

25:                                               ; preds = %12
  %26 = load i32, ptr %6, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  br label %33

29:                                               ; preds = %25
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %6, align 4
  %32 = sub nsw i32 %30, %31
  store i32 %32, ptr %8, align 4
  br label %37

33:                                               ; preds = %28
  %34 = load i32, ptr %5, align 4
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %8, align 4
  br label %37

37:                                               ; preds = %33, %29, %21, %17
  %38 = load i32, ptr %8, align 4
  %39 = icmp sgt i32 %38, 10
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  br label %45

41:                                               ; preds = %37
  %42 = load i32, ptr %8, align 4
  %43 = sub nsw i32 %42, 2
  store i32 %43, ptr %9, align 4
  %44 = load i32, ptr %9, align 4
  store i32 %44, ptr %4, align 4
  br label %49

45:                                               ; preds = %40
  %46 = load i32, ptr %8, align 4
  %47 = mul nsw i32 %46, 2
  store i32 %47, ptr %9, align 4
  %48 = load i32, ptr %9, align 4
  store i32 %48, ptr %4, align 4
  br label %49

49:                                               ; preds = %45, %41
  %50 = load i32, ptr %4, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_ternary_before_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %17, label %18, label %19

18:                                               ; preds = %14
  br label %22

19:                                               ; preds = %14
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 2
  store i32 %21, ptr %3, align 4
  br label %25

22:                                               ; preds = %18
  %23 = load i32, ptr %6, align 4
  %24 = mul nsw i32 %23, 2
  store i32 %24, ptr %3, align 4
  br label %25

25:                                               ; preds = %22, %19
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_ternary_inside_goto(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %20

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load i32, ptr %5, align 4
  %14 = mul nsw i32 %13, 2
  br label %18

15:                                               ; preds = %9
  %16 = load i32, ptr %5, align 4
  %17 = sub nsw i32 %16, 2
  br label %18

18:                                               ; preds = %15, %12
  %19 = phi i32 [ %14, %12 ], [ %17, %15 ]
  store i32 %19, ptr %3, align 4
  br label %33

20:                                               ; preds = %8
  %21 = load i32, ptr %5, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %24, %25
  br label %31

27:                                               ; preds = %20
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %5, align 4
  %30 = sub nsw i32 %28, %29
  br label %31

31:                                               ; preds = %27, %23
  %32 = phi i32 [ %26, %23 ], [ %30, %27 ]
  store i32 %32, ptr %3, align 4
  br label %33

33:                                               ; preds = %31, %18
  %34 = load i32, ptr %3, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_58_nested_ternary_goto(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %35, label %36, label %37

36:                                               ; preds = %32
  br label %39

37:                                               ; preds = %32
  %38 = load i32, ptr %8, align 4
  store i32 %38, ptr %4, align 4
  br label %42

39:                                               ; preds = %36
  %40 = load i32, ptr %8, align 4
  %41 = mul nsw i32 %40, 2
  store i32 %41, ptr %4, align 4
  br label %42

42:                                               ; preds = %39, %37
  %43 = load i32, ptr %4, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_59_dynamic_alloca(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = zext i32 %9 to i64
  %11 = call ptr @llvm.stacksave()
  store ptr %11, ptr %6, align 8
  %12 = alloca i32, i64 %10, align 16
  store i64 %10, ptr %7, align 8
  %13 = load i32, ptr %4, align 4
  %14 = icmp sle i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %2
  br label %42

16:                                               ; preds = %2
  %17 = load i32, ptr %5, align 4
  %18 = getelementptr inbounds i32, ptr %12, i64 0
  store i32 %17, ptr %18, align 16
  %19 = load i32, ptr %4, align 4
  %20 = icmp sgt i32 %19, 1
  br i1 %20, label %21, label %22

21:                                               ; preds = %16
  br label %26

22:                                               ; preds = %16
  %23 = getelementptr inbounds i32, ptr %12, i64 0
  %24 = load i32, ptr %23, align 16
  %25 = add nsw i32 %24, 10
  store i32 %25, ptr %23, align 16
  br label %30

26:                                               ; preds = %21
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 10
  %29 = getelementptr inbounds i32, ptr %12, i64 1
  store i32 %28, ptr %29, align 4
  br label %30

30:                                               ; preds = %26, %22
  %31 = getelementptr inbounds i32, ptr %12, i64 0
  %32 = load i32, ptr %31, align 16
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %30
  br label %39

35:                                               ; preds = %30
  %36 = getelementptr inbounds i32, ptr %12, i64 0
  %37 = load i32, ptr %36, align 16
  %38 = sub nsw i32 %37, 1
  store i32 %38, ptr %3, align 4
  store i32 1, ptr %8, align 4
  br label %43

39:                                               ; preds = %34
  %40 = getelementptr inbounds i32, ptr %12, i64 0
  %41 = load i32, ptr %40, align 16
  store i32 %41, ptr %3, align 4
  store i32 1, ptr %8, align 4
  br label %43

42:                                               ; preds = %15
  store i32 -1, ptr %3, align 4
  store i32 1, ptr %8, align 4
  br label %43

43:                                               ; preds = %42, %39, %35
  %44 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %44)
  %45 = load i32, ptr %3, align 4
  ret i32 %45
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_60_dynamic_alloca_pointer(i32 noundef %0, i32 noundef %1) #0 {
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
  %11 = zext i32 %10 to i64
  %12 = call ptr @llvm.stacksave()
  store ptr %12, ptr %6, align 8
  %13 = alloca i32, i64 %11, align 16
  store i64 %11, ptr %7, align 8
  %14 = load i32, ptr %4, align 4
  %15 = icmp sle i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  br label %53

17:                                               ; preds = %2
  store ptr %13, ptr %8, align 8
  %18 = load i32, ptr %5, align 4
  %19 = load ptr, ptr %8, align 8
  store i32 %18, ptr %19, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp sgt i32 %20, 2
  br i1 %21, label %22, label %23

22:                                               ; preds = %17
  br label %27

23:                                               ; preds = %17
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds i32, ptr %24, i64 0
  %26 = load i32, ptr %25, align 4
  store i32 %26, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %54

27:                                               ; preds = %22
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %28, 1
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds i32, ptr %30, i64 1
  store i32 %29, ptr %31, align 4
  %32 = load ptr, ptr %8, align 8
  %33 = getelementptr inbounds i32, ptr %32, i64 1
  %34 = load i32, ptr %33, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %27
  br label %45

37:                                               ; preds = %27
  %38 = load ptr, ptr %8, align 8
  %39 = getelementptr inbounds i32, ptr %38, i64 0
  %40 = load i32, ptr %39, align 4
  %41 = load ptr, ptr %8, align 8
  %42 = getelementptr inbounds i32, ptr %41, i64 1
  %43 = load i32, ptr %42, align 4
  %44 = sub nsw i32 %40, %43
  store i32 %44, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %54

45:                                               ; preds = %36
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr inbounds i32, ptr %46, i64 1
  %48 = load i32, ptr %47, align 4
  %49 = load ptr, ptr %8, align 8
  %50 = getelementptr inbounds i32, ptr %49, i64 0
  %51 = load i32, ptr %50, align 4
  %52 = add nsw i32 %48, %51
  store i32 %52, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %54

53:                                               ; preds = %16
  store i32 -1, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %54

54:                                               ; preds = %53, %45, %37, %23
  %55 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %55)
  %56 = load i32, ptr %3, align 4
  ret i32 %56
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_61_dynamic_alloca_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %12 = zext i32 %11 to i64
  %13 = call ptr @llvm.stacksave()
  store ptr %13, ptr %8, align 8
  %14 = alloca i32, i64 %12, align 16
  store i64 %12, ptr %9, align 8
  %15 = load i32, ptr %5, align 4
  %16 = icmp sle i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  br label %55

18:                                               ; preds = %3
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %19, %20
  %22 = getelementptr inbounds i32, ptr %14, i64 0
  store i32 %21, ptr %22, align 16
  %23 = load i32, ptr %5, align 4
  %24 = icmp sgt i32 %23, 3
  br i1 %24, label %25, label %30

25:                                               ; preds = %18
  %26 = getelementptr inbounds i32, ptr %14, i64 0
  %27 = load i32, ptr %26, align 16
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %25
  br label %34

30:                                               ; preds = %25, %18
  %31 = getelementptr inbounds i32, ptr %14, i64 0
  %32 = load i32, ptr %31, align 16
  %33 = sub nsw i32 %32, 5
  store i32 %33, ptr %31, align 16
  br label %39

34:                                               ; preds = %29
  %35 = getelementptr inbounds i32, ptr %14, i64 0
  %36 = load i32, ptr %35, align 16
  %37 = mul nsw i32 %36, 2
  %38 = getelementptr inbounds i32, ptr %14, i64 1
  store i32 %37, ptr %38, align 4
  br label %39

39:                                               ; preds = %34, %30
  %40 = getelementptr inbounds i32, ptr %14, i64 0
  %41 = load i32, ptr %40, align 16
  %42 = icmp sgt i32 %41, 10
  br i1 %42, label %46, label %43

43:                                               ; preds = %39
  %44 = load i32, ptr %7, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %47

46:                                               ; preds = %43, %39
  br label %52

47:                                               ; preds = %43
  %48 = getelementptr inbounds i32, ptr %14, i64 0
  %49 = load i32, ptr %48, align 16
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %49, %50
  store i32 %51, ptr %4, align 4
  store i32 1, ptr %10, align 4
  br label %56

52:                                               ; preds = %46
  %53 = getelementptr inbounds i32, ptr %14, i64 0
  %54 = load i32, ptr %53, align 16
  store i32 %54, ptr %4, align 4
  store i32 1, ptr %10, align 4
  br label %56

55:                                               ; preds = %17
  store i32 -100, ptr %4, align 4
  store i32 1, ptr %10, align 4
  br label %56

56:                                               ; preds = %55, %52, %47
  %57 = load ptr, ptr %8, align 8
  call void @llvm.stackrestore(ptr %57)
  %58 = load i32, ptr %4, align 4
  ret i32 %58
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_62_malloc_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %45

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
  br label %44

19:                                               ; preds = %11
  %20 = load i32, ptr %5, align 4
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds i32, ptr %21, i64 0
  store i32 %20, ptr %22, align 4
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds i32, ptr %23, i64 0
  %25 = load i32, ptr %24, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %19
  br label %33

28:                                               ; preds = %19
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds i32, ptr %29, i64 0
  %31 = load i32, ptr %30, align 4
  %32 = sub nsw i32 %31, 2
  store i32 %32, ptr %30, align 4
  br label %38

33:                                               ; preds = %27
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds i32, ptr %34, i64 0
  %36 = load i32, ptr %35, align 4
  %37 = mul nsw i32 %36, 2
  store i32 %37, ptr %35, align 4
  br label %38

38:                                               ; preds = %33, %28
  %39 = load ptr, ptr %6, align 8
  %40 = getelementptr inbounds i32, ptr %39, i64 0
  %41 = load i32, ptr %40, align 4
  store i32 %41, ptr %7, align 4
  %42 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %42) #7
  %43 = load i32, ptr %7, align 4
  store i32 %43, ptr %3, align 4
  br label %46

44:                                               ; preds = %18
  store i32 -2, ptr %3, align 4
  br label %46

45:                                               ; preds = %10
  store i32 -1, ptr %3, align 4
  br label %46

46:                                               ; preds = %45, %44, %38
  %47 = load i32, ptr %3, align 4
  ret i32 %47
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_63_malloc_nested_goto(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %58

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
  br label %57

21:                                               ; preds = %13
  %22 = load i32, ptr %6, align 4
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds i32, ptr %23, i64 0
  store i32 %22, ptr %24, align 4
  %25 = load i32, ptr %6, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %21
  br label %35

28:                                               ; preds = %21
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr inbounds i32, ptr %29, i64 0
  %31 = load i32, ptr %30, align 4
  %32 = sub nsw i32 0, %31
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds i32, ptr %33, i64 0
  store i32 %32, ptr %34, align 4
  br label %51

35:                                               ; preds = %27
  %36 = load i32, ptr %7, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  br label %45

39:                                               ; preds = %35
  %40 = load i32, ptr %7, align 4
  %41 = load ptr, ptr %8, align 8
  %42 = getelementptr inbounds i32, ptr %41, i64 0
  %43 = load i32, ptr %42, align 4
  %44 = sub nsw i32 %43, %40
  store i32 %44, ptr %42, align 4
  br label %51

45:                                               ; preds = %38
  %46 = load i32, ptr %7, align 4
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds i32, ptr %47, i64 0
  %49 = load i32, ptr %48, align 4
  %50 = add nsw i32 %49, %46
  store i32 %50, ptr %48, align 4
  br label %51

51:                                               ; preds = %45, %39, %28
  %52 = load ptr, ptr %8, align 8
  %53 = getelementptr inbounds i32, ptr %52, i64 0
  %54 = load i32, ptr %53, align 4
  store i32 %54, ptr %9, align 4
  %55 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %55) #7
  %56 = load i32, ptr %9, align 4
  store i32 %56, ptr %4, align 4
  br label %59

57:                                               ; preds = %20
  store i32 -2, ptr %4, align 4
  br label %59

58:                                               ; preds = %12
  store i32 -1, ptr %4, align 4
  br label %59

59:                                               ; preds = %58, %57, %51
  %60 = load i32, ptr %4, align 4
  ret i32 %60
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_64_void_goto(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %7

6:                                                ; preds = %1
  br label %11

7:                                                ; preds = %5
  %8 = load i32, ptr %2, align 4
  %9 = load i32, ptr @g_void_result, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, ptr @g_void_result, align 4
  br label %11

11:                                               ; preds = %7, %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_65_void_goto_else(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %10

6:                                                ; preds = %1
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr @g_void_result, align 4
  %9 = sub nsw i32 %8, %7
  store i32 %9, ptr @g_void_result, align 4
  br label %15

10:                                               ; preds = %5
  %11 = load i32, ptr %2, align 4
  %12 = mul nsw i32 %11, 2
  %13 = load i32, ptr @g_void_result, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr @g_void_result, align 4
  br label %15

15:                                               ; preds = %10, %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_66_void_nested(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr @g_void_result, align 4
  %11 = sub nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  br label %28

12:                                               ; preds = %7
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %22

16:                                               ; preds = %12
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %17, %18
  %20 = load i32, ptr @g_void_result, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr @g_void_result, align 4
  br label %28

22:                                               ; preds = %15
  %23 = load i32, ptr %3, align 4
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr @g_void_result, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr @g_void_result, align 4
  br label %28

28:                                               ; preds = %22, %16, %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %14, label %15, label %16

15:                                               ; preds = %12, %9
  br label %24

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr @g_void_result, align 4
  %23 = sub nsw i32 %22, %21
  store i32 %23, ptr @g_void_result, align 4
  br label %32

24:                                               ; preds = %15
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr @g_void_result, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr @g_void_result, align 4
  br label %32

32:                                               ; preds = %24, %16
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_global_only() #0 {
  %1 = load i32, ptr @g_x, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %7

3:                                                ; preds = %0
  %4 = load i32, ptr @g_y, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  br label %11

7:                                                ; preds = %3, %0
  %8 = load i32, ptr @g_z, align 4
  %9 = load i32, ptr @g_void_result, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, ptr @g_void_result, align 4
  br label %15

11:                                               ; preds = %6
  %12 = load i32, ptr @g_x, align 4
  %13 = load i32, ptr @g_void_result, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr @g_void_result, align 4
  br label %15

15:                                               ; preds = %11, %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_69_void_pointer(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = sub nsw i32 %9, 2
  %11 = load ptr, ptr %3, align 8
  store i32 %10, ptr %11, align 4
  br label %16

12:                                               ; preds = %7
  %13 = load i32, ptr %4, align 4
  %14 = mul nsw i32 %13, 2
  %15 = load ptr, ptr %3, align 8
  store i32 %14, ptr %15, align 4
  br label %16

16:                                               ; preds = %12, %8
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr @g_void_result, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr @g_void_result, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_70_void_array(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = icmp sge i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 8
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %12

11:                                               ; preds = %7, %2
  br label %31

12:                                               ; preds = %10
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %15
  store i32 %13, ptr %16, align 4
  %17 = load i32, ptr %3, align 4
  %18 = icmp sge i32 %17, 0
  br i1 %18, label %19, label %23

19:                                               ; preds = %12
  %20 = load i32, ptr %3, align 4
  %21 = icmp slt i32 %20, 8
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  br label %24

23:                                               ; preds = %19, %12
  br label %31

24:                                               ; preds = %22
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = load i32, ptr @g_void_result, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr @g_void_result, align 4
  br label %31

31:                                               ; preds = %24, %23, %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_71_complex_control_flow(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br i1 %14, label %15, label %16

15:                                               ; preds = %4
  br label %53

16:                                               ; preds = %4
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %9, align 4
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %16
  br label %38

21:                                               ; preds = %16
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %10, align 4
  %24 = sub nsw i32 %23, %22
  store i32 %24, ptr %10, align 4
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %9, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr @g_x, align 4
  %29 = add nsw i32 %28, 1
  %30 = icmp sgt i32 %27, %29
  br i1 %30, label %31, label %32

31:                                               ; preds = %21
  br label %35

32:                                               ; preds = %21
  %33 = load i32, ptr %10, align 4
  %34 = sdiv i32 %33, 2
  store i32 %34, ptr %5, align 4
  br label %106

35:                                               ; preds = %31
  %36 = load i32, ptr %10, align 4
  %37 = mul nsw i32 %36, 2
  store i32 %37, ptr %5, align 4
  br label %106

38:                                               ; preds = %20
  %39 = load i32, ptr @g_z, align 4
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %10, align 4
  %42 = load ptr, ptr %6, align 8
  %43 = load i32, ptr %42, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %38
  br label %51

46:                                               ; preds = %38
  %47 = load i32, ptr %10, align 4
  %48 = load ptr, ptr %6, align 8
  %49 = load i32, ptr %48, align 4
  %50 = add nsw i32 %47, %49
  store i32 %50, ptr %5, align 4
  br label %106

51:                                               ; preds = %45
  %52 = load i32, ptr %10, align 4
  store i32 %52, ptr %5, align 4
  br label %106

53:                                               ; preds = %15
  %54 = load i32, ptr %8, align 4
  %55 = load i32, ptr %10, align 4
  %56 = add nsw i32 %55, %54
  store i32 %56, ptr %10, align 4
  %57 = load i32, ptr %7, align 4
  %58 = icmp sge i32 %57, 0
  br i1 %58, label %59, label %63

59:                                               ; preds = %53
  %60 = load i32, ptr %7, align 4
  %61 = icmp slt i32 %60, 8
  br i1 %61, label %62, label %63

62:                                               ; preds = %59
  br label %67

63:                                               ; preds = %59, %53
  %64 = load i32, ptr %10, align 4
  %65 = add nsw i32 %64, 100
  store i32 %65, ptr %10, align 4
  %66 = load i32, ptr %10, align 4
  store i32 %66, ptr %5, align 4
  br label %106

67:                                               ; preds = %62
  %68 = load i32, ptr %7, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = icmp sgt i32 %71, 0
  br i1 %72, label %73, label %74

73:                                               ; preds = %67
  br label %82

74:                                               ; preds = %67
  %75 = load i32, ptr %7, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = load i32, ptr %10, align 4
  %80 = sub nsw i32 %79, %78
  store i32 %80, ptr %10, align 4
  %81 = load i32, ptr %10, align 4
  store i32 %81, ptr %5, align 4
  br label %106

82:                                               ; preds = %73
  %83 = load i32, ptr %7, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %84
  %86 = load i32, ptr %85, align 4
  %87 = load i32, ptr %10, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, ptr %10, align 4
  %89 = load ptr, ptr %6, align 8
  %90 = load i32, ptr %89, align 4
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %95, label %92

92:                                               ; preds = %82
  %93 = load i32, ptr @g_y, align 4
  %94 = icmp slt i32 %93, 0
  br i1 %94, label %95, label %96

95:                                               ; preds = %92, %82
  br label %101

96:                                               ; preds = %92
  %97 = load i32, ptr %10, align 4
  %98 = load ptr, ptr %6, align 8
  %99 = load i32, ptr %98, align 4
  %100 = sub nsw i32 %97, %99
  store i32 %100, ptr %5, align 4
  br label %106

101:                                              ; preds = %95
  %102 = load i32, ptr %10, align 4
  %103 = load ptr, ptr %6, align 8
  %104 = load i32, ptr %103, align 4
  %105 = add nsw i32 %102, %104
  store i32 %105, ptr %5, align 4
  br label %106

106:                                              ; preds = %101, %96, %74, %63, %51, %46, %35, %32
  %107 = load i32, ptr %5, align 4
  ret i32 %107
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_72_complex_merge(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %11, label %12, label %16

12:                                               ; preds = %3
  %13 = load i32, ptr %6, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %34

16:                                               ; preds = %12, %3
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, ptr %8, align 4
  %20 = load i32, ptr %7, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %26, label %22

22:                                               ; preds = %16
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %27

26:                                               ; preds = %22, %16
  br label %31

27:                                               ; preds = %22
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %7, align 4
  %30 = sub nsw i32 %28, %29
  store i32 %30, ptr %9, align 4
  br label %49

31:                                               ; preds = %26
  %32 = load i32, ptr %8, align 4
  %33 = mul nsw i32 %32, 2
  store i32 %33, ptr %9, align 4
  br label %49

34:                                               ; preds = %15
  %35 = load i32, ptr %5, align 4
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, ptr %8, align 4
  %38 = load i32, ptr %7, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %34
  br label %45

41:                                               ; preds = %34
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %8, align 4
  %44 = sub nsw i32 %42, %43
  store i32 %44, ptr %9, align 4
  br label %49

45:                                               ; preds = %40
  %46 = load i32, ptr %7, align 4
  %47 = load i32, ptr %8, align 4
  %48 = add nsw i32 %46, %47
  store i32 %48, ptr %9, align 4
  br label %49

49:                                               ; preds = %45, %41, %31, %27
  %50 = load i32, ptr %9, align 4
  %51 = icmp sgt i32 %50, 20
  br i1 %51, label %52, label %53

52:                                               ; preds = %49
  br label %60

53:                                               ; preds = %49
  %54 = load i32, ptr %9, align 4
  %55 = icmp sgt i32 %54, 10
  br i1 %55, label %56, label %57

56:                                               ; preds = %53
  br label %63

57:                                               ; preds = %53
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %58, 3
  store i32 %59, ptr %4, align 4
  br label %66

60:                                               ; preds = %52
  %61 = load i32, ptr %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %4, align 4
  br label %66

63:                                               ; preds = %56
  %64 = load i32, ptr %9, align 4
  %65 = add nsw i32 %64, 2
  store i32 %65, ptr %4, align 4
  br label %66

66:                                               ; preds = %63, %60, %57
  %67 = load i32, ptr %4, align 4
  ret i32 %67
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_73_goto_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
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
  br i1 %25, label %26, label %30

26:                                               ; preds = %22
  %27 = load i32, ptr %9, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %26, %19
  br label %55

30:                                               ; preds = %26, %22
  %31 = load i32, ptr %12, align 4
  %32 = sub nsw i32 %31, 10
  store i32 %32, ptr %12, align 4
  %33 = load i32, ptr %12, align 4
  %34 = load i32, ptr @g_z, align 4
  %35 = icmp sgt i32 %33, %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %30
  br label %38

37:                                               ; preds = %30
  br label %117

38:                                               ; preds = %36
  %39 = load i32, ptr %9, align 4
  %40 = load i32, ptr %10, align 4
  %41 = load i32, ptr %11, align 4
  %42 = sdiv i32 %41, 10
  %43 = load i32, ptr %9, align 4
  %44 = sub nsw i32 %43, 1
  %45 = mul nsw i32 %42, %44
  %46 = add nsw i32 %40, %45
  %47 = icmp eq i32 %39, %46
  br i1 %47, label %48, label %49

48:                                               ; preds = %38
  br label %52

49:                                               ; preds = %38
  %50 = load i32, ptr %12, align 4
  %51 = add nsw i32 %50, 200
  store i32 %51, ptr %6, align 4
  br label %128

52:                                               ; preds = %48
  %53 = load i32, ptr %12, align 4
  %54 = add nsw i32 %53, 100
  store i32 %54, ptr %6, align 4
  br label %128

55:                                               ; preds = %29
  %56 = load i32, ptr %12, align 4
  %57 = add nsw i32 %56, 10
  store i32 %57, ptr %12, align 4
  %58 = load i32, ptr %8, align 4
  %59 = icmp sge i32 %58, 0
  br i1 %59, label %60, label %64

60:                                               ; preds = %55
  %61 = load i32, ptr %8, align 4
  %62 = icmp slt i32 %61, 8
  br i1 %62, label %63, label %64

63:                                               ; preds = %60
  br label %67

64:                                               ; preds = %60, %55
  %65 = load i32, ptr %12, align 4
  %66 = sub nsw i32 %65, 20
  store i32 %66, ptr %12, align 4
  br label %117

67:                                               ; preds = %63
  %68 = load i32, ptr %8, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = load i32, ptr %12, align 4
  %73 = icmp sgt i32 %71, %72
  br i1 %73, label %74, label %75

74:                                               ; preds = %67
  br label %96

75:                                               ; preds = %67
  %76 = load i32, ptr %8, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = load i32, ptr %12, align 4
  %81 = sub nsw i32 %80, %79
  store i32 %81, ptr %12, align 4
  %82 = load i32, ptr %8, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %91, label %87

87:                                               ; preds = %75
  %88 = load ptr, ptr %7, align 8
  %89 = load i32, ptr %88, align 4
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %92

91:                                               ; preds = %87, %75
  br label %93

92:                                               ; preds = %87
  br label %117

93:                                               ; preds = %91
  %94 = load i32, ptr %12, align 4
  %95 = add nsw i32 %94, 50
  store i32 %95, ptr %12, align 4
  br label %117

96:                                               ; preds = %74
  %97 = load i32, ptr %8, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %98
  %100 = load i32, ptr %99, align 4
  %101 = load i32, ptr %12, align 4
  %102 = add nsw i32 %101, %100
  store i32 %102, ptr %12, align 4
  %103 = load ptr, ptr %7, align 8
  %104 = load i32, ptr %103, align 4
  %105 = icmp sgt i32 %104, 0
  br i1 %105, label %106, label %107

106:                                              ; preds = %96
  br label %112

107:                                              ; preds = %96
  %108 = load ptr, ptr %7, align 8
  %109 = load i32, ptr %108, align 4
  %110 = load i32, ptr %12, align 4
  %111 = sub nsw i32 %110, %109
  store i32 %111, ptr %12, align 4
  br label %117

112:                                              ; preds = %106
  %113 = load ptr, ptr %7, align 8
  %114 = load i32, ptr %113, align 4
  %115 = load i32, ptr %12, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %12, align 4
  br label %117

117:                                              ; preds = %112, %107, %93, %92, %64, %37
  %118 = load i32, ptr %12, align 4
  %119 = icmp sgt i32 %118, 0
  br i1 %119, label %120, label %123

120:                                              ; preds = %117
  %121 = load i32, ptr %12, align 4
  %122 = mul nsw i32 %121, 2
  br label %126

123:                                              ; preds = %117
  %124 = load i32, ptr %12, align 4
  %125 = sub nsw i32 0, %124
  br label %126

126:                                              ; preds = %123, %120
  %127 = phi i32 [ %122, %120 ], [ %125, %123 ]
  store i32 %127, ptr %6, align 4
  br label %128

128:                                              ; preds = %126, %52, %49
  %129 = load i32, ptr %6, align 4
  ret i32 %129
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 1
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 1
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 @atoi(ptr noundef %14) #8
  br label %17

16:                                               ; preds = %2
  br label %17

17:                                               ; preds = %16, %11
  %18 = phi i32 [ %15, %11 ], [ 4, %16 ]
  store i32 %18, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %19 = load i32, ptr %6, align 4
  %20 = call i32 @_00_goto_only(i32 noundef %19)
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %7, align 4
  %23 = load i32, ptr %6, align 4
  %24 = call i32 @_01_goto_two_labels(i32 noundef %23)
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %7, align 4
  %27 = load i32, ptr %6, align 4
  %28 = call i32 @_02_goto_surrounding_code(i32 noundef %27)
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %7, align 4
  %31 = load i32, ptr %6, align 4
  %32 = call i32 @_03_goto_skip_block(i32 noundef %31)
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %7, align 4
  %35 = load i32, ptr %6, align 4
  %36 = call i32 @_04_goto_equal(i32 noundef %35, i32 noundef 4)
  %37 = load i32, ptr %7, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %7, align 4
  %39 = load i32, ptr %6, align 4
  %40 = call i32 @_05_goto_not_equal(i32 noundef %39, i32 noundef 4)
  %41 = load i32, ptr %7, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, ptr %7, align 4
  %43 = load i32, ptr %6, align 4
  %44 = call i32 @_06_relational(i32 noundef %43, i32 noundef 4)
  %45 = load i32, ptr %7, align 4
  %46 = add nsw i32 %45, %44
  store i32 %46, ptr %7, align 4
  %47 = load i32, ptr %6, align 4
  %48 = icmp sgt i32 %47, 0
  %49 = load i32, ptr %6, align 4
  %50 = call i32 @_07_boolean_argument(i1 noundef zeroext %48, i32 noundef %49)
  %51 = load i32, ptr %7, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %7, align 4
  %53 = load i32, ptr %6, align 4
  %54 = call i32 @_08_goto_chain(i32 noundef %53)
  %55 = load i32, ptr %7, align 4
  %56 = add nsw i32 %55, %54
  store i32 %56, ptr %7, align 4
  %57 = load i32, ptr %6, align 4
  %58 = call i32 @_09_multiple_levels(i32 noundef %57)
  %59 = load i32, ptr %7, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %7, align 4
  %61 = load i32, ptr %6, align 4
  %62 = call i32 @_10_goto_expressions(i32 noundef %61, i32 noundef 4)
  %63 = load i32, ptr %7, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %7, align 4
  %65 = load i32, ptr %6, align 4
  %66 = call i32 @_11_and(i32 noundef %65, i32 noundef 3)
  %67 = load i32, ptr %7, align 4
  %68 = add nsw i32 %67, %66
  store i32 %68, ptr %7, align 4
  %69 = load i32, ptr %6, align 4
  %70 = call i32 @_12_or(i32 noundef %69, i32 noundef -3)
  %71 = load i32, ptr %7, align 4
  %72 = add nsw i32 %71, %70
  store i32 %72, ptr %7, align 4
  %73 = load i32, ptr %6, align 4
  %74 = call i32 @_13_and_or(i32 noundef %73, i32 noundef 2, i32 noundef -1)
  %75 = load i32, ptr %7, align 4
  %76 = add nsw i32 %75, %74
  store i32 %76, ptr %7, align 4
  %77 = load i32, ptr %6, align 4
  %78 = call i32 @_14_or_and(i32 noundef %77, i32 noundef 0, i32 noundef 20)
  %79 = load i32, ptr %7, align 4
  %80 = add nsw i32 %79, %78
  store i32 %80, ptr %7, align 4
  %81 = load i32, ptr %6, align 4
  %82 = call i32 @_15_complex_boolean(i32 noundef %81, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %83 = load i32, ptr %7, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, ptr %7, align 4
  %85 = load i32, ptr %6, align 4
  %86 = call i32 @_16_nested_arithmetic_condition(i32 noundef %85, i32 noundef 1, i32 noundef 20)
  %87 = load i32, ptr %7, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, ptr %7, align 4
  %89 = load i32, ptr %6, align 4
  %90 = call i32 @_17_deep_parentheses(i32 noundef %89, i32 noundef 2, i32 noundef 3)
  %91 = load i32, ptr %7, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %7, align 4
  %93 = load i32, ptr %6, align 4
  %94 = call i32 @_18_arithmetic_boolean(i32 noundef %93, i32 noundef 2, i32 noundef 5)
  %95 = load i32, ptr %7, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, ptr %7, align 4
  %97 = load i32, ptr %6, align 4
  %98 = call i32 @_19_nested_boolean_parentheses(i32 noundef %97, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %99 = load i32, ptr %7, align 4
  %100 = add nsw i32 %99, %98
  store i32 %100, ptr %7, align 4
  %101 = load i32, ptr %6, align 4
  %102 = call i32 @_20_nested_goto(i32 noundef %101, i32 noundef 3)
  %103 = load i32, ptr %7, align 4
  %104 = add nsw i32 %103, %102
  store i32 %104, ptr %7, align 4
  %105 = load i32, ptr %6, align 4
  %106 = call i32 @_21_nested_in_else(i32 noundef %105, i32 noundef 3)
  %107 = load i32, ptr %7, align 4
  %108 = add nsw i32 %107, %106
  store i32 %108, ptr %7, align 4
  %109 = load i32, ptr %6, align 4
  %110 = call i32 @_22_nested_goto_else(i32 noundef %109, i32 noundef 3, i32 noundef 5)
  %111 = load i32, ptr %7, align 4
  %112 = add nsw i32 %111, %110
  store i32 %112, ptr %7, align 4
  %113 = load i32, ptr %6, align 4
  %114 = call i32 @_23_three_level_nesting(i32 noundef %113, i32 noundef 3, i32 noundef 5)
  %115 = load i32, ptr %7, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %7, align 4
  %117 = load i32, ptr %6, align 4
  %118 = call i32 @_24_deep_nested_values(i32 noundef %117, i32 noundef 3, i32 noundef 10)
  %119 = load i32, ptr %7, align 4
  %120 = add nsw i32 %119, %118
  store i32 %120, ptr %7, align 4
  %121 = load i32, ptr %6, align 4
  %122 = call i32 @_25_nested_and(i32 noundef %121, i32 noundef 3, i32 noundef 5)
  %123 = load i32, ptr %7, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, ptr %7, align 4
  %125 = load i32, ptr %6, align 4
  %126 = call i32 @_26_nested_or(i32 noundef %125, i32 noundef 0, i32 noundef 20)
  %127 = load i32, ptr %7, align 4
  %128 = add nsw i32 %127, %126
  store i32 %128, ptr %7, align 4
  %129 = load i32, ptr %6, align 4
  %130 = call i32 @_27_nested_complex_boolean(i32 noundef %129, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %131 = load i32, ptr %7, align 4
  %132 = add nsw i32 %131, %130
  store i32 %132, ptr %7, align 4
  %133 = load i32, ptr %6, align 4
  %134 = call i32 @_28_independent_gotos(i32 noundef %133)
  %135 = load i32, ptr %7, align 4
  %136 = add nsw i32 %135, %134
  store i32 %136, ptr %7, align 4
  %137 = load i32, ptr %6, align 4
  %138 = call i32 @_29_independent_goto_paths(i32 noundef %137, i32 noundef 3)
  %139 = load i32, ptr %7, align 4
  %140 = add nsw i32 %139, %138
  store i32 %140, ptr %7, align 4
  %141 = call i32 @_30_array_condition(i32 noundef 1)
  %142 = load i32, ptr %7, align 4
  %143 = add nsw i32 %142, %141
  store i32 %143, ptr %7, align 4
  %144 = call i32 @_31_array_branches(i32 noundef 2)
  %145 = load i32, ptr %7, align 4
  %146 = add nsw i32 %145, %144
  store i32 %146, ptr %7, align 4
  %147 = call i32 @_32_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %148 = load i32, ptr %7, align 4
  %149 = add nsw i32 %148, %147
  store i32 %149, ptr %7, align 4
  %150 = call i32 @_33_matrix_condition(i32 noundef 1, i32 noundef 1)
  %151 = load i32, ptr %7, align 4
  %152 = add nsw i32 %151, %150
  store i32 %152, ptr %7, align 4
  %153 = call i32 @_34_nested_array(i32 noundef 1, i32 noundef 2)
  %154 = load i32, ptr %7, align 4
  %155 = add nsw i32 %154, %153
  store i32 %155, ptr %7, align 4
  %156 = load i32, ptr %6, align 4
  store i32 %156, ptr %8, align 4
  %157 = call i32 @_35_pointer_condition(ptr noundef %8)
  %158 = load i32, ptr %7, align 4
  %159 = add nsw i32 %158, %157
  store i32 %159, ptr %7, align 4
  %160 = call i32 @_36_pointer_branches(ptr noundef %8)
  %161 = load i32, ptr %7, align 4
  %162 = add nsw i32 %161, %160
  store i32 %162, ptr %7, align 4
  %163 = call i32 @_37_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %164 = load i32, ptr %7, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %7, align 4
  %166 = call i32 @_38_nested_pointer(ptr noundef %8, i32 noundef 3)
  %167 = load i32, ptr %7, align 4
  %168 = add nsw i32 %167, %166
  store i32 %168, ptr %7, align 4
  %169 = load i32, ptr %6, align 4
  store i32 %169, ptr %8, align 4
  %170 = load i32, ptr %6, align 4
  %171 = call i32 @_39_pointer_write(ptr noundef %8, i32 noundef %170)
  %172 = load i32, ptr %7, align 4
  %173 = add nsw i32 %172, %171
  store i32 %173, ptr %7, align 4
  %174 = load i32, ptr %6, align 4
  store i32 %174, ptr %8, align 4
  %175 = load i32, ptr %6, align 4
  %176 = call i32 @_40_pointer_write_nested(ptr noundef %8, i32 noundef %175, i32 noundef 3)
  %177 = load i32, ptr %7, align 4
  %178 = add nsw i32 %177, %176
  store i32 %178, ptr %7, align 4
  %179 = load i32, ptr %6, align 4
  store i32 %179, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %180 = call i32 @_41_global_only()
  %181 = load i32, ptr %7, align 4
  %182 = add nsw i32 %181, %180
  store i32 %182, ptr %7, align 4
  %183 = call i32 @_42_global_and()
  %184 = load i32, ptr %7, align 4
  %185 = add nsw i32 %184, %183
  store i32 %185, ptr %7, align 4
  %186 = call i32 @_43_global_or()
  %187 = load i32, ptr %7, align 4
  %188 = add nsw i32 %187, %186
  store i32 %188, ptr %7, align 4
  %189 = call i32 @_44_global_nested()
  %190 = load i32, ptr %7, align 4
  %191 = add nsw i32 %190, %189
  store i32 %191, ptr %7, align 4
  %192 = call i32 @_45_global_array_only()
  %193 = load i32, ptr %7, align 4
  %194 = add nsw i32 %193, %192
  store i32 %194, ptr %7, align 4
  %195 = call i32 @_46_global_matrix_only()
  %196 = load i32, ptr %7, align 4
  %197 = add nsw i32 %196, %195
  store i32 %197, ptr %7, align 4
  %198 = load i32, ptr %6, align 4
  %199 = call i32 @_47_multiple_returns(i32 noundef %198)
  %200 = load i32, ptr %7, align 4
  %201 = add nsw i32 %200, %199
  store i32 %201, ptr %7, align 4
  %202 = load i32, ptr %6, align 4
  %203 = call i32 @_48_nested_multiple_returns(i32 noundef %202, i32 noundef 3)
  %204 = load i32, ptr %7, align 4
  %205 = add nsw i32 %204, %203
  store i32 %205, ptr %7, align 4
  %206 = load i32, ptr %6, align 4
  %207 = call i32 @_49_complex_multiple_returns(i32 noundef %206, i32 noundef 3, i32 noundef 5)
  %208 = load i32, ptr %7, align 4
  %209 = add nsw i32 %208, %207
  store i32 %209, ptr %7, align 4
  %210 = load i32, ptr %6, align 4
  %211 = call i32 @_50_prefix_code(i32 noundef %210, i32 noundef 2, i32 noundef 3)
  %212 = load i32, ptr %7, align 4
  %213 = add nsw i32 %212, %211
  store i32 %213, ptr %7, align 4
  %214 = load i32, ptr %6, align 4
  %215 = call i32 @_51_suffix_code(i32 noundef %214, i32 noundef 3)
  %216 = load i32, ptr %7, align 4
  %217 = add nsw i32 %216, %215
  store i32 %217, ptr %7, align 4
  %218 = load i32, ptr %6, align 4
  %219 = call i32 @_52_prefix_nested_suffix(i32 noundef %218, i32 noundef 3, i32 noundef 5)
  %220 = load i32, ptr %7, align 4
  %221 = add nsw i32 %220, %219
  store i32 %221, ptr %7, align 4
  %222 = load i32, ptr %6, align 4
  %223 = call i32 @_53_diamond(i32 noundef %222, i32 noundef 3)
  %224 = load i32, ptr %7, align 4
  %225 = add nsw i32 %224, %223
  store i32 %225, ptr %7, align 4
  %226 = load i32, ptr %6, align 4
  %227 = call i32 @_54_multiple_merge_values(i32 noundef %226, i32 noundef 3)
  %228 = load i32, ptr %7, align 4
  %229 = add nsw i32 %228, %227
  store i32 %229, ptr %7, align 4
  %230 = load i32, ptr %6, align 4
  %231 = call i32 @_55_nested_diamonds(i32 noundef %230, i32 noundef 3, i32 noundef 5)
  %232 = load i32, ptr %7, align 4
  %233 = add nsw i32 %232, %231
  store i32 %233, ptr %7, align 4
  %234 = load i32, ptr %6, align 4
  %235 = call i32 @_56_ternary_before_goto(i32 noundef %234, i32 noundef 3)
  %236 = load i32, ptr %7, align 4
  %237 = add nsw i32 %236, %235
  store i32 %237, ptr %7, align 4
  %238 = load i32, ptr %6, align 4
  %239 = call i32 @_57_ternary_inside_goto(i32 noundef %238, i32 noundef 3)
  %240 = load i32, ptr %7, align 4
  %241 = add nsw i32 %240, %239
  store i32 %241, ptr %7, align 4
  %242 = load i32, ptr %6, align 4
  %243 = call i32 @_58_nested_ternary_goto(i32 noundef %242, i32 noundef 3, i32 noundef 5)
  %244 = load i32, ptr %7, align 4
  %245 = add nsw i32 %244, %243
  store i32 %245, ptr %7, align 4
  %246 = load i32, ptr %6, align 4
  %247 = call i32 @_59_dynamic_alloca(i32 noundef 4, i32 noundef %246)
  %248 = load i32, ptr %7, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, ptr %7, align 4
  %250 = load i32, ptr %6, align 4
  %251 = call i32 @_60_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %250)
  %252 = load i32, ptr %7, align 4
  %253 = add nsw i32 %252, %251
  store i32 %253, ptr %7, align 4
  %254 = load i32, ptr %6, align 4
  %255 = call i32 @_61_dynamic_alloca_complex(i32 noundef 6, i32 noundef %254, i32 noundef 3)
  %256 = load i32, ptr %7, align 4
  %257 = add nsw i32 %256, %255
  store i32 %257, ptr %7, align 4
  %258 = load i32, ptr %6, align 4
  %259 = call i32 @_62_malloc_goto(i32 noundef 4, i32 noundef %258)
  %260 = load i32, ptr %7, align 4
  %261 = add nsw i32 %260, %259
  store i32 %261, ptr %7, align 4
  %262 = load i32, ptr %6, align 4
  %263 = call i32 @_63_malloc_nested_goto(i32 noundef 4, i32 noundef %262, i32 noundef 3)
  %264 = load i32, ptr %7, align 4
  %265 = add nsw i32 %264, %263
  store i32 %265, ptr %7, align 4
  store i32 0, ptr @g_void_result, align 4
  %266 = load i32, ptr %6, align 4
  call void @_64_void_goto(i32 noundef %266)
  %267 = load i32, ptr %6, align 4
  call void @_65_void_goto_else(i32 noundef %267)
  %268 = load i32, ptr %6, align 4
  call void @_66_void_nested(i32 noundef %268, i32 noundef 3)
  %269 = load i32, ptr %6, align 4
  call void @_67_void_complex(i32 noundef %269, i32 noundef 3, i32 noundef 0)
  call void @_68_void_global_only()
  %270 = load i32, ptr %6, align 4
  store i32 %270, ptr %8, align 4
  %271 = load i32, ptr %6, align 4
  call void @_69_void_pointer(ptr noundef %8, i32 noundef %271)
  %272 = load i32, ptr %6, align 4
  call void @_70_void_array(i32 noundef 1, i32 noundef %272)
  %273 = load i32, ptr @g_void_result, align 4
  %274 = load i32, ptr %7, align 4
  %275 = add nsw i32 %274, %273
  store i32 %275, ptr %7, align 4
  %276 = load i32, ptr %6, align 4
  store i32 %276, ptr %8, align 4
  %277 = load i32, ptr %6, align 4
  %278 = call i32 @_71_complex_control_flow(ptr noundef %8, i32 noundef 1, i32 noundef %277, i32 noundef 3)
  %279 = load i32, ptr %7, align 4
  %280 = add nsw i32 %279, %278
  store i32 %280, ptr %7, align 4
  %281 = load i32, ptr %6, align 4
  %282 = call i32 @_72_complex_merge(i32 noundef %281, i32 noundef 3, i32 noundef 5)
  %283 = load i32, ptr %7, align 4
  %284 = add nsw i32 %283, %282
  store i32 %284, ptr %7, align 4
  %285 = load i32, ptr %6, align 4
  %286 = call i32 @_73_goto_stress(ptr noundef %8, i32 noundef 1, i32 noundef %285, i32 noundef 3, i32 noundef 5)
  %287 = load i32, ptr %7, align 4
  %288 = add nsw i32 %287, %286
  store i32 %288, ptr %7, align 4
  %289 = load i32, ptr %7, align 4
  %290 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %289)
  ret i32 0
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
