; ModuleID = '_01_ifs.bc'
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
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %3
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  %8 = load i32, ptr %2, align 4
  %9 = mul nsw i32 %8, 2
  store i32 %9, ptr %1, align 4
  br label %12

10:                                               ; preds = %4
  %11 = load i32, ptr %2, align 4
  store i32 %11, ptr %1, align 4
  br label %12

12:                                               ; preds = %10, %7
  %13 = load i32, ptr %1, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_if_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %3
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  %8 = load i32, ptr %2, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %1, align 4
  br label %13

10:                                               ; preds = %4
  %11 = load i32, ptr %2, align 4
  %12 = sub nsw i32 %11, 10
  store i32 %12, ptr %1, align 4
  br label %13

13:                                               ; preds = %10, %7
  %14 = load i32, ptr %1, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_if_with_surrounding_code(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  %5 = add nsw i32 %4, 3
  store i32 %5, ptr %2, align 4
  br label %6

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %6
  %10 = load i32, ptr %2, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %2, align 4
  br label %12

12:                                               ; preds = %9, %6
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 5
  store i32 %14, ptr %2, align 4
  %15 = load i32, ptr %2, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_if_compound(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  store i32 %4, ptr %2, align 4
  br label %5

5:                                                ; preds = %3
  %6 = load i32, ptr %1, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %13

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 10
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %2, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %8, %5
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_if_else_compound(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  br label %4

4:                                                ; preds = %3
  %5 = load i32, ptr %1, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %4
  %8 = load i32, ptr %1, align 4
  %9 = mul nsw i32 %8, 2
  store i32 %9, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %2, align 4
  br label %17

12:                                               ; preds = %4
  %13 = load i32, ptr %1, align 4
  %14 = sub nsw i32 %13, 2
  store i32 %14, ptr %2, align 4
  %15 = load i32, ptr %2, align 4
  %16 = sub nsw i32 %15, 1
  store i32 %16, ptr %2, align 4
  br label %17

17:                                               ; preds = %12, %7
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_if_equal(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp eq i32 %7, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  store i32 100, ptr %2, align 4
  br label %12

11:                                               ; preds = %6
  store i32 200, ptr %2, align 4
  br label %12

12:                                               ; preds = %11, %10
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_if_not_equal(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp ne i32 %7, %8
  br i1 %9, label %10, label %14

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %2, align 4
  br label %18

14:                                               ; preds = %6
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = sub nsw i32 %15, %16
  store i32 %17, ptr %2, align 4
  br label %18

18:                                               ; preds = %14, %10
  %19 = load i32, ptr %2, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_relational(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  store i32 1, ptr %2, align 4
  br label %22

11:                                               ; preds = %6
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  store i32 2, ptr %2, align 4
  br label %22

16:                                               ; preds = %11
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %16
  store i32 3, ptr %2, align 4
  br label %22

21:                                               ; preds = %16
  store i32 4, ptr %2, align 4
  br label %22

22:                                               ; preds = %21, %20, %15, %10
  %23 = load i32, ptr %2, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  %6 = zext i1 %0 to i8
  store i8 %6, ptr %3, align 1
  store i32 %1, ptr %4, align 4
  br label %7

7:                                                ; preds = %5
  %8 = load i8, ptr %3, align 1
  %9 = trunc i8 %8 to i1
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = load i32, ptr %4, align 4
  %12 = mul nsw i32 %11, 3
  store i32 %12, ptr %2, align 4
  br label %16

13:                                               ; preds = %7
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %14, 3
  store i32 %15, ptr %2, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_if_elseif_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %3
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 10
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  %8 = load i32, ptr %2, align 4
  %9 = add nsw i32 %8, 100
  store i32 %9, ptr %1, align 4
  br label %19

10:                                               ; preds = %4
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 5
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 50
  store i32 %15, ptr %1, align 4
  br label %19

16:                                               ; preds = %10
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %1, align 4
  br label %19

19:                                               ; preds = %16, %13, %7
  %20 = load i32, ptr %1, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_multiple_elseif(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %3
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, -10
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  store i32 -1, ptr %1, align 4
  br label %21

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  store i32 -2, ptr %1, align 4
  br label %21

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  store i32 0, ptr %1, align 4
  br label %21

16:                                               ; preds = %12
  %17 = load i32, ptr %2, align 4
  %18 = icmp slt i32 %17, 10
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  store i32 2, ptr %1, align 4
  br label %21

20:                                               ; preds = %16
  store i32 1, ptr %1, align 4
  br label %21

21:                                               ; preds = %20, %19, %15, %11, %7
  %22 = load i32, ptr %1, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_elseif_expressions(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %7, %8
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %2, align 4
  br label %34

13:                                               ; preds = %6
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp eq i32 %14, %15
  br i1 %16, label %17, label %21

17:                                               ; preds = %13
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %2, align 4
  br label %34

21:                                               ; preds = %13
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 10
  %24 = load i32, ptr %4, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %26, label %30

26:                                               ; preds = %21
  %27 = load i32, ptr %3, align 4
  %28 = load i32, ptr %4, align 4
  %29 = sub nsw i32 %27, %28
  store i32 %29, ptr %2, align 4
  br label %34

30:                                               ; preds = %21
  %31 = load i32, ptr %4, align 4
  %32 = load i32, ptr %3, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %2, align 4
  br label %34

34:                                               ; preds = %30, %26, %17, %10
  %35 = load i32, ptr %2, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_and(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %2, align 4
  br label %20

16:                                               ; preds = %9, %6
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, ptr %2, align 4
  br label %20

20:                                               ; preds = %16, %12
  %21 = load i32, ptr %2, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_or(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %17

12:                                               ; preds = %9, %6
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  %16 = add nsw i32 %15, 10
  store i32 %16, ptr %2, align 4
  br label %22

17:                                               ; preds = %9
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = sub nsw i32 %20, 10
  store i32 %21, ptr %2, align 4
  br label %22

22:                                               ; preds = %17, %12
  %23 = load i32, ptr %2, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_and_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %11, %8
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %11
  store i32 100, ptr %3, align 4
  br label %19

18:                                               ; preds = %14
  store i32 200, ptr %3, align 4
  br label %19

19:                                               ; preds = %18, %17
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_or_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %11, %8
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 10
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  store i32 300, ptr %3, align 4
  br label %19

18:                                               ; preds = %14, %11
  store i32 400, ptr %3, align 4
  br label %19

19:                                               ; preds = %18, %17
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %14, 10
  br i1 %15, label %22, label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %7, align 4
  %18 = icmp eq i32 %17, 5
  br i1 %18, label %19, label %30

19:                                               ; preds = %16
  %20 = load i32, ptr %8, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %30

22:                                               ; preds = %19, %13
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %8, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %4, align 4
  br label %38

30:                                               ; preds = %19, %16
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %6, align 4
  %33 = sub nsw i32 %31, %32
  %34 = load i32, ptr %7, align 4
  %35 = sub nsw i32 %33, %34
  %36 = load i32, ptr %8, align 4
  %37 = sub nsw i32 %35, %36
  store i32 %37, ptr %4, align 4
  br label %38

38:                                               ; preds = %30, %22
  %39 = load i32, ptr %4, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_nested_arithmetic_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = sdiv i32 %11, 10
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %13, 1
  %15 = mul nsw i32 %12, %14
  %16 = add nsw i32 %10, %15
  %17 = icmp eq i32 %9, %16
  br i1 %17, label %18, label %19

18:                                               ; preds = %8
  store i32 111, ptr %3, align 4
  br label %20

19:                                               ; preds = %8
  store i32 222, ptr %3, align 4
  br label %20

20:                                               ; preds = %19, %18
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_deep_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  %12 = load i32, ptr %6, align 4
  %13 = sub nsw i32 %12, 1
  %14 = mul nsw i32 %11, %13
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, 2
  %18 = sub nsw i32 %15, %17
  %19 = load i32, ptr %6, align 4
  %20 = mul nsw i32 %18, %19
  %21 = icmp eq i32 %14, %20
  br i1 %21, label %22, label %28

22:                                               ; preds = %8
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, ptr %3, align 4
  br label %34

28:                                               ; preds = %8
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %5, align 4
  %31 = sub nsw i32 %29, %30
  %32 = load i32, ptr %6, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %3, align 4
  br label %34

34:                                               ; preds = %28, %22
  %35 = load i32, ptr %3, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_arithmetic_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %11, %12
  br i1 %13, label %14, label %22

14:                                               ; preds = %8
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = sub nsw i32 %15, %16
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, 10
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %14
  store i32 123, ptr %3, align 4
  br label %23

22:                                               ; preds = %14, %8
  store i32 456, ptr %3, align 4
  br label %23

23:                                               ; preds = %22, %21
  %24 = load i32, ptr %3, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_nested_boolean_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %11, %12
  br i1 %13, label %14, label %22

14:                                               ; preds = %10
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %8, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %30, label %18

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %7, align 4
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %30, label %22

22:                                               ; preds = %18, %10
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %8, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %31

26:                                               ; preds = %22
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %7, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %31

30:                                               ; preds = %26, %18, %14
  store i32 777, ptr %4, align 4
  br label %32

31:                                               ; preds = %26, %22
  store i32 888, ptr %4, align 4
  br label %32

32:                                               ; preds = %31, %30
  %33 = load i32, ptr %4, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_nested_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  store i32 %6, ptr %4, align 4
  br label %7

7:                                                ; preds = %5
  %8 = load i32, ptr %2, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %26

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %19

13:                                               ; preds = %10
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %4, align 4
  br label %25

19:                                               ; preds = %10
  %20 = load i32, ptr %2, align 4
  %21 = load i32, ptr %3, align 4
  %22 = sub nsw i32 %20, %21
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %4, align 4
  br label %25

25:                                               ; preds = %19, %13
  br label %26

26:                                               ; preds = %25, %7
  %27 = load i32, ptr %4, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_nested_in_else(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %6
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %2, align 4
  br label %22

13:                                               ; preds = %6
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  %17 = load i32, ptr %4, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %2, align 4
  br label %22

19:                                               ; preds = %13
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %20, 2
  store i32 %21, ptr %2, align 4
  br label %22

22:                                               ; preds = %19, %16, %9
  %23 = load i32, ptr %2, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_nested_if_else(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %3, align 4
  br label %31

18:                                               ; preds = %11
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %3, align 4
  br label %31

22:                                               ; preds = %8
  %23 = load i32, ptr %6, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %22
  %26 = load i32, ptr %6, align 4
  %27 = mul nsw i32 %26, 2
  store i32 %27, ptr %3, align 4
  br label %31

28:                                               ; preds = %22
  %29 = load i32, ptr %6, align 4
  %30 = sub nsw i32 %29, 2
  store i32 %30, ptr %3, align 4
  br label %31

31:                                               ; preds = %28, %25, %18, %14
  %32 = load i32, ptr %3, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_three_level_nesting(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %34

11:                                               ; preds = %8
  %12 = load i32, ptr %6, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %6, align 4
  br label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %30

17:                                               ; preds = %14
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, 10
  store i32 %19, ptr %6, align 4
  br label %20

20:                                               ; preds = %17
  %21 = load i32, ptr %5, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %20
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 100
  store i32 %25, ptr %6, align 4
  br label %29

26:                                               ; preds = %20
  %27 = load i32, ptr %6, align 4
  %28 = sub nsw i32 %27, 100
  store i32 %28, ptr %6, align 4
  br label %29

29:                                               ; preds = %26, %23
  br label %33

30:                                               ; preds = %14
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, 20
  store i32 %32, ptr %6, align 4
  br label %33

33:                                               ; preds = %30, %29
  br label %35

34:                                               ; preds = %8
  store i32 -1, ptr %6, align 4
  br label %35

35:                                               ; preds = %34, %33
  %36 = load i32, ptr %6, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_deep_nested_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %7, align 4
  br label %12

12:                                               ; preds = %8
  %13 = load i32, ptr %7, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %48

15:                                               ; preds = %12
  %16 = load i32, ptr %7, align 4
  %17 = add nsw i32 %16, 10
  store i32 %17, ptr %7, align 4
  br label %18

18:                                               ; preds = %15
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp sgt i32 %19, %20
  br i1 %21, label %22, label %35

22:                                               ; preds = %18
  %23 = load i32, ptr %7, align 4
  %24 = mul nsw i32 %23, 2
  store i32 %24, ptr %7, align 4
  br label %25

25:                                               ; preds = %22
  %26 = load i32, ptr %7, align 4
  %27 = srem i32 %26, 3
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %25
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %30, 3
  store i32 %31, ptr %3, align 4
  br label %52

32:                                               ; preds = %25
  %33 = load i32, ptr %7, align 4
  %34 = sub nsw i32 %33, 3
  store i32 %34, ptr %3, align 4
  br label %52

35:                                               ; preds = %18
  %36 = load i32, ptr %7, align 4
  %37 = sub nsw i32 %36, 5
  store i32 %37, ptr %7, align 4
  br label %38

38:                                               ; preds = %35
  %39 = load i32, ptr %7, align 4
  %40 = load i32, ptr %6, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %45

42:                                               ; preds = %38
  %43 = load i32, ptr %7, align 4
  %44 = mul nsw i32 %43, 2
  store i32 %44, ptr %3, align 4
  br label %52

45:                                               ; preds = %38
  %46 = load i32, ptr %7, align 4
  %47 = sdiv i32 %46, 2
  store i32 %47, ptr %3, align 4
  br label %52

48:                                               ; preds = %12
  %49 = load i32, ptr %7, align 4
  %50 = load i32, ptr %6, align 4
  %51 = sub nsw i32 %49, %50
  store i32 %51, ptr %3, align 4
  br label %52

52:                                               ; preds = %48, %45, %42, %32, %29
  %53 = load i32, ptr %3, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_nested_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %33

11:                                               ; preds = %8
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %33

14:                                               ; preds = %11
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %6, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %6, align 4
  br label %18

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %28

21:                                               ; preds = %18
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %22, 10
  br i1 %23, label %24, label %28

24:                                               ; preds = %21
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  br label %32

28:                                               ; preds = %21, %18
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  br label %32

32:                                               ; preds = %28, %24
  br label %35

33:                                               ; preds = %11, %8
  %34 = load i32, ptr %5, align 4
  store i32 %34, ptr %6, align 4
  br label %35

35:                                               ; preds = %33, %32
  %36 = load i32, ptr %6, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_nested_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %22

14:                                               ; preds = %11, %8
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 10
  br i1 %16, label %20, label %17

17:                                               ; preds = %14
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, -10
  br i1 %19, label %20, label %21

20:                                               ; preds = %17, %14
  store i32 1000, ptr %3, align 4
  br label %23

21:                                               ; preds = %17
  store i32 2000, ptr %3, align 4
  br label %23

22:                                               ; preds = %11
  store i32 3000, ptr %3, align 4
  br label %23

23:                                               ; preds = %22, %21, %20
  %24 = load i32, ptr %3, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_nested_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, ptr %6, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %19, label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %7, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %41

19:                                               ; preds = %16, %13
  %20 = load i32, ptr %8, align 4
  %21 = icmp sgt i32 %20, 5
  br i1 %21, label %26, label %22

22:                                               ; preds = %19
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %37

26:                                               ; preds = %22, %19
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %27, 10
  br i1 %28, label %29, label %37

29:                                               ; preds = %26
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %4, align 4
  br label %45

37:                                               ; preds = %26, %22
  %38 = load i32, ptr %5, align 4
  %39 = load i32, ptr %6, align 4
  %40 = mul nsw i32 %38, %39
  store i32 %40, ptr %4, align 4
  br label %45

41:                                               ; preds = %16
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %8, align 4
  %44 = sub nsw i32 %42, %43
  store i32 %44, ptr %4, align 4
  br label %45

45:                                               ; preds = %41, %37, %29
  %46 = load i32, ptr %4, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_independent_ifs(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  store i32 %4, ptr %2, align 4
  br label %5

5:                                                ; preds = %3
  %6 = load i32, ptr %1, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 10
  store i32 %10, ptr %2, align 4
  br label %11

11:                                               ; preds = %8, %5
  %12 = load i32, ptr %1, align 4
  %13 = icmp sgt i32 %12, 5
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 20
  store i32 %16, ptr %2, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %1, align 4
  %19 = icmp sgt i32 %18, 10
  br i1 %19, label %20, label %23

20:                                               ; preds = %17
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, 30
  store i32 %22, ptr %2, align 4
  br label %23

23:                                               ; preds = %20, %17
  %24 = load i32, ptr %2, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_independent_if_else(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %4, align 4
  br label %15

12:                                               ; preds = %6
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %13, 10
  store i32 %14, ptr %4, align 4
  br label %15

15:                                               ; preds = %12, %9
  %16 = load i32, ptr %3, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %15
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 20
  store i32 %20, ptr %4, align 4
  br label %24

21:                                               ; preds = %15
  %22 = load i32, ptr %4, align 4
  %23 = sub nsw i32 %22, 20
  store i32 %23, ptr %4, align 4
  br label %24

24:                                               ; preds = %21, %18
  %25 = load i32, ptr %4, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_array_condition(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %3, align 4
  br label %9

9:                                                ; preds = %4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %1, align 4
  br label %18

15:                                               ; preds = %9
  %16 = load i32, ptr %3, align 4
  %17 = sub nsw i32 %16, 2
  store i32 %17, ptr %1, align 4
  br label %18

18:                                               ; preds = %15, %12
  %19 = load i32, ptr %1, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_array_branches(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %3
  %5 = load i32, ptr %2, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %17

10:                                               ; preds = %4
  %11 = load i32, ptr %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %1, align 4
  br label %24

17:                                               ; preds = %4
  %18 = load i32, ptr %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %1, align 4
  br label %24

24:                                               ; preds = %17, %10
  %25 = load i32, ptr %1, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_array_complex_condition(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = load i32, ptr %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = icmp sgt i32 %10, %14
  br i1 %15, label %16, label %28

16:                                               ; preds = %6
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %16
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i32 %26, 10
  store i32 %27, ptr %2, align 4
  br label %34

28:                                               ; preds = %16, %6
  %29 = load i32, ptr %4, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = mul nsw i32 %32, 10
  store i32 %33, ptr %2, align 4
  br label %34

34:                                               ; preds = %28, %22
  %35 = load i32, ptr %2, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_matrix_condition(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %8
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [3 x i32], ptr %9, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  store i32 %13, ptr %5, align 4
  br label %14

14:                                               ; preds = %6
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 5
  br i1 %16, label %17, label %20

17:                                               ; preds = %14
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, ptr %2, align 4
  br label %23

20:                                               ; preds = %14
  %21 = load i32, ptr %5, align 4
  %22 = sub nsw i32 %21, 2
  store i32 %22, ptr %2, align 4
  br label %23

23:                                               ; preds = %20, %17
  %24 = load i32, ptr %2, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_nested_array(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %2, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %61

9:                                                ; preds = %6
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %12, label %61

12:                                               ; preds = %9
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %4, align 4
  br label %19

19:                                               ; preds = %12
  %20 = load i32, ptr %3, align 4
  %21 = icmp sge i32 %20, 0
  br i1 %21, label %22, label %60

22:                                               ; preds = %19
  %23 = load i32, ptr %3, align 4
  %24 = icmp slt i32 %23, 8
  br i1 %24, label %25, label %60

25:                                               ; preds = %22
  %26 = load i32, ptr %2, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = icmp sgt i32 %29, %33
  br i1 %34, label %35, label %47

35:                                               ; preds = %25
  %36 = load i32, ptr %2, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = load i32, ptr %3, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = sub nsw i32 %39, %43
  %45 = load i32, ptr %4, align 4
  %46 = add nsw i32 %45, %44
  store i32 %46, ptr %4, align 4
  br label %59

47:                                               ; preds = %25
  %48 = load i32, ptr %3, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = load i32, ptr %2, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = sub nsw i32 %51, %55
  %57 = load i32, ptr %4, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, ptr %4, align 4
  br label %59

59:                                               ; preds = %47, %35
  br label %60

60:                                               ; preds = %59, %22, %19
  br label %61

61:                                               ; preds = %60, %9, %6
  %62 = load i32, ptr %4, align 4
  ret i32 %62
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_pointer_condition(ptr noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  br label %3

3:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  br label %4

4:                                                ; preds = %3
  %5 = load ptr, ptr %2, align 8
  %6 = load i32, ptr %5, align 4
  %7 = icmp sgt i32 %6, 10
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %9, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %1, align 4
  br label %16

12:                                               ; preds = %4
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 2
  store i32 %15, ptr %1, align 4
  br label %16

16:                                               ; preds = %12, %8
  %17 = load i32, ptr %1, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_pointer_branches(ptr noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  br label %3

3:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  br label %4

4:                                                ; preds = %3
  %5 = load ptr, ptr %2, align 8
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, 100
  store i32 %11, ptr %1, align 4
  br label %16

12:                                               ; preds = %4
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %13, align 4
  %15 = sub nsw i32 %14, 100
  store i32 %15, ptr %1, align 4
  br label %16

16:                                               ; preds = %12, %8
  %17 = load i32, ptr %1, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_pointer_array(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32, ptr %7, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = icmp sgt i32 %11, %15
  br i1 %16, label %17, label %28

17:                                               ; preds = %6
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %22, %26
  store i32 %27, ptr %2, align 4
  br label %39

28:                                               ; preds = %6
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %4, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = sub nsw i32 %33, %37
  store i32 %38, ptr %2, align 4
  br label %39

39:                                               ; preds = %28, %17
  %40 = load i32, ptr %2, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_nested_pointer(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr %4, align 4
  br label %8

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %26

12:                                               ; preds = %8
  %13 = load i32, ptr %3, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = icmp sgt i32 %13, %15
  br i1 %16, label %17, label %21

17:                                               ; preds = %12
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  br label %25

21:                                               ; preds = %12
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %23, %22
  store i32 %24, ptr %4, align 4
  br label %25

25:                                               ; preds = %21, %17
  br label %30

26:                                               ; preds = %8
  %27 = load ptr, ptr %2, align 8
  %28 = load i32, ptr %27, align 4
  %29 = sub nsw i32 0, %28
  store i32 %29, ptr %4, align 4
  br label %30

30:                                               ; preds = %26, %25
  %31 = load i32, ptr %4, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_pointer_write(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  br label %5

5:                                                ; preds = %4
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = mul nsw i32 %9, 2
  %11 = load ptr, ptr %2, align 8
  store i32 %10, ptr %11, align 4
  br label %16

12:                                               ; preds = %5
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 2
  %15 = load ptr, ptr %2, align 8
  store i32 %14, ptr %15, align 4
  br label %16

16:                                               ; preds = %12, %8
  %17 = load ptr, ptr %2, align 8
  %18 = load i32, ptr %17, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_pointer_write_nested(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %24

10:                                               ; preds = %7
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %18

13:                                               ; preds = %10
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %5, align 4
  %16 = add nsw i32 %14, %15
  %17 = load ptr, ptr %3, align 8
  store i32 %16, ptr %17, align 4
  br label %23

18:                                               ; preds = %10
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = sub nsw i32 %19, %20
  %22 = load ptr, ptr %3, align 8
  store i32 %21, ptr %22, align 4
  br label %23

23:                                               ; preds = %18, %13
  br label %28

24:                                               ; preds = %7
  %25 = load i32, ptr %4, align 4
  %26 = sub nsw i32 0, %25
  %27 = load ptr, ptr %3, align 8
  store i32 %26, ptr %27, align 4
  br label %28

28:                                               ; preds = %24, %23
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %29, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_global_only() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %1
  %5 = load i32, ptr @g_x, align 4
  %6 = load i32, ptr @g_y, align 4
  %7 = add nsw i32 %5, %6
  store i32 %7, ptr %0, align 4
  br label %12

8:                                                ; preds = %1
  %9 = load i32, ptr @g_x, align 4
  %10 = load i32, ptr @g_y, align 4
  %11 = sub nsw i32 %9, %10
  store i32 %11, ptr %0, align 4
  br label %12

12:                                               ; preds = %8, %4
  %13 = load i32, ptr %0, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_global_and() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %11

4:                                                ; preds = %1
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_y, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %0, align 4
  br label %13

11:                                               ; preds = %4, %1
  %12 = load i32, ptr @g_z, align 4
  store i32 %12, ptr %0, align 4
  br label %13

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %0, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_global_or() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %7, label %4

4:                                                ; preds = %1
  %5 = load i32, ptr @g_z, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %4, %1
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_z, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %0, align 4
  br label %13

11:                                               ; preds = %4
  %12 = load i32, ptr @g_y, align 4
  store i32 %12, ptr %0, align 4
  br label %13

13:                                               ; preds = %11, %7
  %14 = load i32, ptr %0, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_global_nested() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %15

4:                                                ; preds = %1
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_y, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %0, align 4
  br label %17

11:                                               ; preds = %4
  %12 = load i32, ptr @g_x, align 4
  %13 = load i32, ptr @g_y, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, ptr %0, align 4
  br label %17

15:                                               ; preds = %1
  %16 = load i32, ptr @g_z, align 4
  store i32 %16, ptr %0, align 4
  br label %17

17:                                               ; preds = %15, %11, %7
  %18 = load i32, ptr %0, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_array_only() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_arr, align 16
  %3 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 %6, ptr %0, align 4
  br label %9

7:                                                ; preds = %1
  %8 = load i32, ptr @g_arr, align 16
  store i32 %8, ptr %0, align 4
  br label %9

9:                                                ; preds = %7, %5
  %10 = load i32, ptr %0, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_global_matrix_only() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_mat, align 16
  %3 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  store i32 %6, ptr %0, align 4
  br label %9

7:                                                ; preds = %1
  %8 = load i32, ptr @g_mat, align 16
  store i32 %8, ptr %0, align 4
  br label %9

9:                                                ; preds = %7, %5
  %10 = load i32, ptr %0, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_multiple_returns(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %3
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  store i32 -1, ptr %1, align 4
  br label %17

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  store i32 0, ptr %1, align 4
  br label %17

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %13, 10
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  store i32 10, ptr %1, align 4
  br label %17

16:                                               ; preds = %12
  store i32 20, ptr %1, align 4
  br label %17

17:                                               ; preds = %16, %15, %11, %7
  %18 = load i32, ptr %1, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_nested_multiple_returns(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %25

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %2, align 4
  br label %28

16:                                               ; preds = %9
  %17 = load i32, ptr %4, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = load i32, ptr %3, align 4
  store i32 %20, ptr %2, align 4
  br label %28

21:                                               ; preds = %16
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %2, align 4
  br label %28

25:                                               ; preds = %6
  %26 = load i32, ptr %3, align 4
  %27 = sub nsw i32 0, %26
  store i32 %27, ptr %2, align 4
  br label %28

28:                                               ; preds = %25, %21, %19, %12
  %29 = load i32, ptr %2, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_50_complex_multiple_returns(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %18

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %3, align 4
  br label %41

18:                                               ; preds = %11, %8
  %19 = load i32, ptr %4, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %24, label %21

21:                                               ; preds = %18
  %22 = load i32, ptr %6, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %28

24:                                               ; preds = %21, %18
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %6, align 4
  %27 = sub nsw i32 %25, %26
  store i32 %27, ptr %3, align 4
  br label %41

28:                                               ; preds = %21
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %6, align 4
  %33 = mul nsw i32 %32, 2
  %34 = icmp sgt i32 %31, %33
  br i1 %34, label %35, label %39

35:                                               ; preds = %28
  %36 = load i32, ptr %4, align 4
  %37 = load i32, ptr %5, align 4
  %38 = mul nsw i32 %36, %37
  store i32 %38, ptr %3, align 4
  br label %41

39:                                               ; preds = %28
  %40 = load i32, ptr %6, align 4
  store i32 %40, ptr %3, align 4
  br label %41

41:                                               ; preds = %39, %35, %24, %14
  %42 = load i32, ptr %3, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_51_prefix_code(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %6, align 4
  %13 = load i32, ptr %6, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %7, align 4
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %5, align 4
  %17 = sub nsw i32 %15, %16
  store i32 %17, ptr %8, align 4
  br label %18

18:                                               ; preds = %9
  %19 = load i32, ptr %8, align 4
  %20 = icmp sgt i32 %19, 10
  br i1 %20, label %21, label %24

21:                                               ; preds = %18
  %22 = load i32, ptr %8, align 4
  %23 = add nsw i32 %22, 100
  store i32 %23, ptr %8, align 4
  br label %27

24:                                               ; preds = %18
  %25 = load i32, ptr %8, align 4
  %26 = sub nsw i32 %25, 100
  store i32 %26, ptr %8, align 4
  br label %27

27:                                               ; preds = %24, %21
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %30, %31
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_suffix_code(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %7, %8
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = load i32, ptr %2, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %4, align 4
  br label %16

13:                                               ; preds = %6
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %4, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %4, align 4
  %19 = load i32, ptr %4, align 4
  %20 = mul nsw i32 %19, 3
  store i32 %20, ptr %4, align 4
  %21 = load i32, ptr %4, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_prefix_nested_suffix(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %6, align 4
  br label %11

11:                                               ; preds = %7
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %30

14:                                               ; preds = %11
  %15 = load i32, ptr %6, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %6, align 4
  br label %17

17:                                               ; preds = %14
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp sgt i32 %18, %19
  br i1 %20, label %21, label %24

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, 10
  store i32 %23, ptr %6, align 4
  br label %27

24:                                               ; preds = %17
  %25 = load i32, ptr %6, align 4
  %26 = sub nsw i32 %25, 10
  store i32 %26, ptr %6, align 4
  br label %27

27:                                               ; preds = %24, %21
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 5
  store i32 %29, ptr %6, align 4
  br label %33

30:                                               ; preds = %11
  %31 = load i32, ptr %6, align 4
  %32 = sub nsw i32 0, %31
  store i32 %32, ptr %6, align 4
  br label %33

33:                                               ; preds = %30, %27
  %34 = load i32, ptr %6, align 4
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %34, %35
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_diamond(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %7, %8
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %4, align 4
  br label %16

13:                                               ; preds = %6
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 20
  store i32 %15, ptr %4, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %4, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_55_multiple_merge_values(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %7
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 2
  store i32 %14, ptr %5, align 4
  br label %20

15:                                               ; preds = %7
  %16 = load i32, ptr %2, align 4
  %17 = sub nsw i32 %16, 1
  store i32 %17, ptr %4, align 4
  %18 = load i32, ptr %3, align 4
  %19 = sub nsw i32 %18, 2
  store i32 %19, ptr %5, align 4
  br label %20

20:                                               ; preds = %15, %10
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = mul nsw i32 %21, %22
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_nested_diamonds(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
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
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %12
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %6, align 4
  br label %23

19:                                               ; preds = %12
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = sub nsw i32 %20, %21
  store i32 %22, ptr %6, align 4
  br label %23

23:                                               ; preds = %19, %15
  br label %36

24:                                               ; preds = %9
  %25 = load i32, ptr %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %31

27:                                               ; preds = %24
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr %6, align 4
  br label %35

31:                                               ; preds = %24
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %3, align 4
  %34 = sub nsw i32 %32, %33
  store i32 %34, ptr %6, align 4
  br label %35

35:                                               ; preds = %31, %27
  br label %36

36:                                               ; preds = %35, %23
  %37 = load i32, ptr %6, align 4
  %38 = icmp sgt i32 %37, 10
  br i1 %38, label %39, label %42

39:                                               ; preds = %36
  %40 = load i32, ptr %6, align 4
  %41 = mul nsw i32 %40, 2
  store i32 %41, ptr %7, align 4
  br label %45

42:                                               ; preds = %36
  %43 = load i32, ptr %6, align 4
  %44 = sub nsw i32 %43, 2
  store i32 %44, ptr %7, align 4
  br label %45

45:                                               ; preds = %42, %39
  %46 = load i32, ptr %7, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_ternary_before_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %8, %9
  br i1 %10, label %11, label %13

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  store i32 %12, ptr %.reg2mem, align 4
  br label %15

13:                                               ; preds = %7
  %14 = load i32, ptr %4, align 4
  store i32 %14, ptr %.reg2mem, align 4
  br label %15

15:                                               ; preds = %11, %13
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  br label %16

16:                                               ; preds = %15
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 10
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = load i32, ptr %5, align 4
  %21 = mul nsw i32 %20, 2
  store i32 %21, ptr %2, align 4
  br label %25

22:                                               ; preds = %16
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, 2
  store i32 %24, ptr %2, align 4
  br label %25

25:                                               ; preds = %22, %19
  %26 = load i32, ptr %2, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_58_ternary_inside_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %21

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %.reg2mem, align 4
  br label %20

16:                                               ; preds = %9
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, ptr %.reg2mem, align 4
  br label %20

20:                                               ; preds = %16, %12
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  br label %31

21:                                               ; preds = %6
  %22 = load i32, ptr %4, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %21
  %25 = load i32, ptr %4, align 4
  %26 = mul nsw i32 %25, 2
  store i32 %26, ptr %.reg2mem1, align 4
  br label %30

27:                                               ; preds = %21
  %28 = load i32, ptr %4, align 4
  %29 = sub nsw i32 %28, 2
  store i32 %29, ptr %.reg2mem1, align 4
  br label %30

30:                                               ; preds = %27, %24
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %2, align 4
  br label %31

31:                                               ; preds = %30, %20
  %32 = load i32, ptr %2, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_59_nested_ternary_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %22

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %17, label %19

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  store i32 %18, ptr %.reg2mem, align 4
  br label %21

19:                                               ; preds = %13
  %20 = load i32, ptr %6, align 4
  store i32 %20, ptr %.reg2mem, align 4
  br label %21

21:                                               ; preds = %19, %17
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem3, align 4
  br label %31

22:                                               ; preds = %9
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %26, label %28

26:                                               ; preds = %22
  %27 = load i32, ptr %5, align 4
  store i32 %27, ptr %.reg2mem1, align 4
  br label %30

28:                                               ; preds = %22
  %29 = load i32, ptr %6, align 4
  store i32 %29, ptr %.reg2mem1, align 4
  br label %30

30:                                               ; preds = %28, %26
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  br label %31

31:                                               ; preds = %21, %30
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %7, align 4
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %7, align 4
  %34 = icmp sgt i32 %33, 10
  br i1 %34, label %35, label %38

35:                                               ; preds = %32
  %36 = load i32, ptr %7, align 4
  %37 = mul nsw i32 %36, 2
  store i32 %37, ptr %3, align 4
  br label %40

38:                                               ; preds = %32
  %39 = load i32, ptr %7, align 4
  store i32 %39, ptr %3, align 4
  br label %40

40:                                               ; preds = %38, %35
  %41 = load i32, ptr %3, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_60_dynamic_alloca(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %3, align 4
  %11 = icmp sle i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  store i32 -1, ptr %2, align 4
  br label %44

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = zext i32 %14 to i64
  %16 = call ptr @llvm.stacksave()
  store ptr %16, ptr %5, align 8
  %17 = alloca i32, i64 %15, align 16
  store ptr %17, ptr %.reg2mem, align 8
  store i64 %15, ptr %6, align 8
  %18 = load i32, ptr %4, align 4
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %19 = getelementptr inbounds i32, ptr %.reload5, i64 0
  store i32 %18, ptr %19, align 16
  br label %20

20:                                               ; preds = %13
  %21 = load i32, ptr %3, align 4
  %22 = icmp sgt i32 %21, 1
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %24, 10
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %26 = getelementptr inbounds i32, ptr %.reload4, i64 1
  store i32 %25, ptr %26, align 4
  br label %31

27:                                               ; preds = %20
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %28 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %29 = load i32, ptr %28, align 16
  %30 = add nsw i32 %29, 10
  store i32 %30, ptr %28, align 16
  br label %31

31:                                               ; preds = %27, %23
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %32 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %33 = load i32, ptr %32, align 16
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %38

35:                                               ; preds = %31
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %36 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %37 = load i32, ptr %36, align 16
  store i32 %37, ptr %2, align 4
  store i32 1, ptr %7, align 4
  br label %42

38:                                               ; preds = %31
  %.reload = load ptr, ptr %.reg2mem, align 8
  %39 = getelementptr inbounds i32, ptr %.reload, i64 0
  %40 = load i32, ptr %39, align 16
  %41 = sub nsw i32 %40, 1
  store i32 %41, ptr %2, align 4
  store i32 1, ptr %7, align 4
  br label %42

42:                                               ; preds = %38, %35
  %43 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %43)
  br label %44

44:                                               ; preds = %42, %12
  %45 = load i32, ptr %2, align 4
  ret i32 %45
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_61_dynamic_alloca_pointer(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %3, align 4
  %12 = icmp sle i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  store i32 -1, ptr %2, align 4
  br label %56

14:                                               ; preds = %10
  %15 = load i32, ptr %3, align 4
  %16 = zext i32 %15 to i64
  %17 = call ptr @llvm.stacksave()
  store ptr %17, ptr %5, align 8
  %18 = alloca i32, i64 %16, align 16
  store i64 %16, ptr %6, align 8
  store ptr %18, ptr %7, align 8
  %19 = load i32, ptr %4, align 4
  %20 = load ptr, ptr %7, align 8
  store i32 %19, ptr %20, align 4
  br label %21

21:                                               ; preds = %14
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %22, 2
  br i1 %23, label %24, label %50

24:                                               ; preds = %21
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds i32, ptr %27, i64 1
  store i32 %26, ptr %28, align 4
  br label %29

29:                                               ; preds = %24
  %30 = load ptr, ptr %7, align 8
  %31 = getelementptr inbounds i32, ptr %30, i64 1
  %32 = load i32, ptr %31, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %42

34:                                               ; preds = %29
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 1
  %37 = load i32, ptr %36, align 4
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds i32, ptr %38, i64 0
  %40 = load i32, ptr %39, align 4
  %41 = add nsw i32 %37, %40
  store i32 %41, ptr %2, align 4
  store i32 1, ptr %8, align 4
  br label %54

42:                                               ; preds = %29
  %43 = load ptr, ptr %7, align 8
  %44 = getelementptr inbounds i32, ptr %43, i64 0
  %45 = load i32, ptr %44, align 4
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds i32, ptr %46, i64 1
  %48 = load i32, ptr %47, align 4
  %49 = sub nsw i32 %45, %48
  store i32 %49, ptr %2, align 4
  store i32 1, ptr %8, align 4
  br label %54

50:                                               ; preds = %21
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 0
  %53 = load i32, ptr %52, align 4
  store i32 %53, ptr %2, align 4
  store i32 1, ptr %8, align 4
  br label %54

54:                                               ; preds = %50, %42, %34
  %55 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %55)
  br label %56

56:                                               ; preds = %54, %13
  %57 = load i32, ptr %2, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_62_dynamic_alloca_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  br label %10

10:                                               ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %11

11:                                               ; preds = %10
  %12 = load i32, ptr %4, align 4
  %13 = icmp sle i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 -100, ptr %3, align 4
  br label %57

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = zext i32 %16 to i64
  %18 = call ptr @llvm.stacksave()
  store ptr %18, ptr %7, align 8
  %19 = alloca i32, i64 %17, align 16
  store ptr %19, ptr %.reg2mem, align 8
  store i64 %17, ptr %8, align 8
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %20, %21
  %.reload7 = load ptr, ptr %.reg2mem, align 8
  %23 = getelementptr inbounds i32, ptr %.reload7, i64 0
  store i32 %22, ptr %23, align 16
  br label %24

24:                                               ; preds = %15
  %25 = load i32, ptr %4, align 4
  %26 = icmp sgt i32 %25, 3
  br i1 %26, label %27, label %36

27:                                               ; preds = %24
  %.reload6 = load ptr, ptr %.reg2mem, align 8
  %28 = getelementptr inbounds i32, ptr %.reload6, i64 0
  %29 = load i32, ptr %28, align 16
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %36

31:                                               ; preds = %27
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %32 = getelementptr inbounds i32, ptr %.reload5, i64 0
  %33 = load i32, ptr %32, align 16
  %34 = mul nsw i32 %33, 2
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %35 = getelementptr inbounds i32, ptr %.reload4, i64 1
  store i32 %34, ptr %35, align 4
  br label %40

36:                                               ; preds = %27, %24
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %37 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %38 = load i32, ptr %37, align 16
  %39 = sub nsw i32 %38, 5
  store i32 %39, ptr %37, align 16
  br label %40

40:                                               ; preds = %36, %31
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %41 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %42 = load i32, ptr %41, align 16
  %43 = icmp sgt i32 %42, 10
  br i1 %43, label %47, label %44

44:                                               ; preds = %40
  %45 = load i32, ptr %6, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %50

47:                                               ; preds = %44, %40
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %48 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %49 = load i32, ptr %48, align 16
  store i32 %49, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %55

50:                                               ; preds = %44
  %.reload = load ptr, ptr %.reg2mem, align 8
  %51 = getelementptr inbounds i32, ptr %.reload, i64 0
  %52 = load i32, ptr %51, align 16
  %53 = load i32, ptr %5, align 4
  %54 = add nsw i32 %52, %53
  store i32 %54, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %55

55:                                               ; preds = %50, %47
  %56 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %56)
  br label %57

57:                                               ; preds = %55, %14
  %58 = load i32, ptr %3, align 4
  ret i32 %58
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_63_malloc_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %3, align 4
  %10 = icmp sle i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  store i32 -1, ptr %2, align 4
  br label %46

12:                                               ; preds = %8
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = mul i64 %14, 4
  %16 = call noalias ptr @malloc(i64 noundef %15) #6
  store ptr %16, ptr %5, align 8
  br label %17

17:                                               ; preds = %12
  %18 = load ptr, ptr %5, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  store i32 -2, ptr %2, align 4
  br label %46

21:                                               ; preds = %17
  %22 = load i32, ptr %4, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds i32, ptr %23, i64 0
  store i32 %22, ptr %24, align 4
  br label %25

25:                                               ; preds = %21
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds i32, ptr %26, i64 0
  %28 = load i32, ptr %27, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %35

30:                                               ; preds = %25
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds i32, ptr %31, i64 0
  %33 = load i32, ptr %32, align 4
  %34 = mul nsw i32 %33, 2
  store i32 %34, ptr %32, align 4
  br label %40

35:                                               ; preds = %25
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds i32, ptr %36, i64 0
  %38 = load i32, ptr %37, align 4
  %39 = sub nsw i32 %38, 2
  store i32 %39, ptr %37, align 4
  br label %40

40:                                               ; preds = %35, %30
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds i32, ptr %41, i64 0
  %43 = load i32, ptr %42, align 4
  store i32 %43, ptr %6, align 4
  %44 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %44) #7
  %45 = load i32, ptr %6, align 4
  store i32 %45, ptr %2, align 4
  br label %46

46:                                               ; preds = %40, %20, %11
  %47 = load i32, ptr %2, align 4
  ret i32 %47
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_64_malloc_nested_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %4, align 4
  %12 = icmp sle i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  store i32 -1, ptr %3, align 4
  br label %59

14:                                               ; preds = %10
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 4
  %18 = call noalias ptr @malloc(i64 noundef %17) #6
  store ptr %18, ptr %7, align 8
  br label %19

19:                                               ; preds = %14
  %20 = load ptr, ptr %7, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  store i32 -2, ptr %3, align 4
  br label %59

23:                                               ; preds = %19
  %24 = load i32, ptr %5, align 4
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds i32, ptr %25, i64 0
  store i32 %24, ptr %26, align 4
  br label %27

27:                                               ; preds = %23
  %28 = load i32, ptr %5, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %46

30:                                               ; preds = %27
  %31 = load i32, ptr %6, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %39

33:                                               ; preds = %30
  %34 = load i32, ptr %6, align 4
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 0
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %37, %34
  store i32 %38, ptr %36, align 4
  br label %45

39:                                               ; preds = %30
  %40 = load i32, ptr %6, align 4
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds i32, ptr %41, i64 0
  %43 = load i32, ptr %42, align 4
  %44 = sub nsw i32 %43, %40
  store i32 %44, ptr %42, align 4
  br label %45

45:                                               ; preds = %39, %33
  br label %53

46:                                               ; preds = %27
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds i32, ptr %47, i64 0
  %49 = load i32, ptr %48, align 4
  %50 = sub nsw i32 0, %49
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 0
  store i32 %50, ptr %52, align 4
  br label %53

53:                                               ; preds = %46, %45
  %54 = load ptr, ptr %7, align 8
  %55 = getelementptr inbounds i32, ptr %54, i64 0
  %56 = load i32, ptr %55, align 4
  store i32 %56, ptr %8, align 4
  %57 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %57) #7
  %58 = load i32, ptr %8, align 4
  store i32 %58, ptr %3, align 4
  br label %59

59:                                               ; preds = %53, %22, %13
  %60 = load i32, ptr %3, align 4
  ret i32 %60
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_65_void_if(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  br label %3

3:                                                ; preds = %2
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4
  %8 = load i32, ptr @g_void_result, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_void_result, align 4
  br label %10

10:                                               ; preds = %6, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_66_void_if_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  br label %3

3:                                                ; preds = %2
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %11

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4
  %8 = mul nsw i32 %7, 2
  %9 = load i32, ptr @g_void_result, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, ptr @g_void_result, align 4
  br label %15

11:                                               ; preds = %3
  %12 = load i32, ptr %1, align 4
  %13 = load i32, ptr @g_void_result, align 4
  %14 = sub nsw i32 %13, %12
  store i32 %14, ptr @g_void_result, align 4
  br label %15

15:                                               ; preds = %11, %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_nested(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %5

5:                                                ; preds = %4
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %24

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %17

11:                                               ; preds = %8
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  br label %23

17:                                               ; preds = %8
  %18 = load i32, ptr %2, align 4
  %19 = load i32, ptr %3, align 4
  %20 = sub nsw i32 %18, %19
  %21 = load i32, ptr @g_void_result, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr @g_void_result, align 4
  br label %23

23:                                               ; preds = %17, %11
  br label %28

24:                                               ; preds = %5
  %25 = load i32, ptr %2, align 4
  %26 = load i32, ptr @g_void_result, align 4
  %27 = sub nsw i32 %26, %25
  store i32 %27, ptr @g_void_result, align 4
  br label %28

28:                                               ; preds = %24, %23
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %16, label %13

13:                                               ; preds = %10, %7
  %14 = load i32, ptr %5, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %24

16:                                               ; preds = %13, %10
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr @g_void_result, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr @g_void_result, align 4
  br label %32

24:                                               ; preds = %13
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr @g_void_result, align 4
  %31 = sub nsw i32 %30, %29
  store i32 %31, ptr @g_void_result, align 4
  br label %32

32:                                               ; preds = %24, %16
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_69_void_global_only() #0 {
entry:
  br label %0

0:                                                ; preds = %entry
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
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  br label %5

5:                                                ; preds = %4
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = mul nsw i32 %9, 2
  %11 = load ptr, ptr %2, align 8
  store i32 %10, ptr %11, align 4
  br label %16

12:                                               ; preds = %5
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 2
  %15 = load ptr, ptr %2, align 8
  store i32 %14, ptr %15, align 4
  br label %16

16:                                               ; preds = %12, %8
  %17 = load ptr, ptr %2, align 8
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr @g_void_result, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr @g_void_result, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_71_void_array(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  br label %5

5:                                                ; preds = %4
  %6 = load i32, ptr %2, align 4
  %7 = icmp sge i32 %6, 0
  br i1 %7, label %8, label %16

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 8
  br i1 %10, label %11, label %16

11:                                               ; preds = %8
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  store i32 %12, ptr %15, align 4
  br label %16

16:                                               ; preds = %11, %8, %5
  %17 = load i32, ptr %2, align 4
  %18 = icmp sge i32 %17, 0
  br i1 %18, label %19, label %29

19:                                               ; preds = %16
  %20 = load i32, ptr %2, align 4
  %21 = icmp slt i32 %20, 8
  br i1 %21, label %22, label %29

22:                                               ; preds = %19
  %23 = load i32, ptr %2, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr @g_void_result, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr @g_void_result, align 4
  br label %29

29:                                               ; preds = %22, %19, %16
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_72_complex_control_flow(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  br label %10

10:                                               ; preds = %entry
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %11 = load i32, ptr @g_x, align 4
  store i32 %11, ptr %9, align 4
  br label %12

12:                                               ; preds = %10
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %8, align 4
  %15 = icmp sgt i32 %13, %14
  br i1 %15, label %16, label %68

16:                                               ; preds = %12
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %9, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %9, align 4
  br label %20

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  %22 = icmp sge i32 %21, 0
  br i1 %22, label %23, label %64

23:                                               ; preds = %20
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %24, 8
  br i1 %25, label %26, label %64

26:                                               ; preds = %23
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %56

32:                                               ; preds = %26
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = load i32, ptr %9, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %9, align 4
  br label %39

39:                                               ; preds = %32
  %40 = load ptr, ptr %5, align 8
  %41 = load i32, ptr %40, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %46, label %43

43:                                               ; preds = %39
  %44 = load i32, ptr @g_y, align 4
  %45 = icmp slt i32 %44, 0
  br i1 %45, label %46, label %51

46:                                               ; preds = %43, %39
  %47 = load i32, ptr %9, align 4
  %48 = load ptr, ptr %5, align 8
  %49 = load i32, ptr %48, align 4
  %50 = add nsw i32 %47, %49
  store i32 %50, ptr %4, align 4
  br label %106

51:                                               ; preds = %43
  %52 = load i32, ptr %9, align 4
  %53 = load ptr, ptr %5, align 8
  %54 = load i32, ptr %53, align 4
  %55 = sub nsw i32 %52, %54
  store i32 %55, ptr %4, align 4
  br label %106

56:                                               ; preds = %26
  %57 = load i32, ptr %6, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = load i32, ptr %9, align 4
  %62 = sub nsw i32 %61, %60
  store i32 %62, ptr %9, align 4
  br label %63

63:                                               ; preds = %56
  br label %67

64:                                               ; preds = %23, %20
  %65 = load i32, ptr %9, align 4
  %66 = add nsw i32 %65, 100
  store i32 %66, ptr %9, align 4
  br label %67

67:                                               ; preds = %64, %63
  br label %104

68:                                               ; preds = %12
  %69 = load i32, ptr %7, align 4
  %70 = load i32, ptr %8, align 4
  %71 = icmp eq i32 %69, %70
  br i1 %71, label %72, label %87

72:                                               ; preds = %68
  %73 = load i32, ptr @g_z, align 4
  %74 = load i32, ptr %9, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %9, align 4
  br label %76

76:                                               ; preds = %72
  %77 = load ptr, ptr %5, align 8
  %78 = load i32, ptr %77, align 4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %82

80:                                               ; preds = %76
  %81 = load i32, ptr %9, align 4
  store i32 %81, ptr %4, align 4
  br label %106

82:                                               ; preds = %76
  %83 = load i32, ptr %9, align 4
  %84 = load ptr, ptr %5, align 8
  %85 = load i32, ptr %84, align 4
  %86 = add nsw i32 %83, %85
  store i32 %86, ptr %4, align 4
  br label %106

87:                                               ; preds = %68
  %88 = load i32, ptr %8, align 4
  %89 = load i32, ptr %9, align 4
  %90 = sub nsw i32 %89, %88
  store i32 %90, ptr %9, align 4
  br label %91

91:                                               ; preds = %87
  %92 = load i32, ptr %7, align 4
  %93 = load i32, ptr %8, align 4
  %94 = add nsw i32 %92, %93
  %95 = load i32, ptr @g_x, align 4
  %96 = add nsw i32 %95, 1
  %97 = icmp sgt i32 %94, %96
  br i1 %97, label %98, label %101

98:                                               ; preds = %91
  %99 = load i32, ptr %9, align 4
  %100 = mul nsw i32 %99, 2
  store i32 %100, ptr %4, align 4
  br label %106

101:                                              ; preds = %91
  %102 = load i32, ptr %9, align 4
  %103 = sdiv i32 %102, 2
  store i32 %103, ptr %4, align 4
  br label %106

104:                                              ; preds = %67
  %105 = load i32, ptr %9, align 4
  store i32 %105, ptr %4, align 4
  br label %106

106:                                              ; preds = %104, %101, %98, %82, %80, %51, %46
  %107 = load i32, ptr %4, align 4
  ret i32 %107
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_73_complex_merge(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %32

13:                                               ; preds = %10
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %32

16:                                               ; preds = %13
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %7, align 4
  br label %20

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %24, %25
  store i32 %26, ptr %8, align 4
  br label %31

27:                                               ; preds = %20
  %28 = load i32, ptr %6, align 4
  %29 = load i32, ptr %7, align 4
  %30 = sub nsw i32 %28, %29
  store i32 %30, ptr %8, align 4
  br label %31

31:                                               ; preds = %27, %23
  br label %51

32:                                               ; preds = %10, %13
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %5, align 4
  %35 = sub nsw i32 %33, %34
  store i32 %35, ptr %7, align 4
  br label %36

36:                                               ; preds = %32
  %37 = load i32, ptr %6, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %43, label %39

39:                                               ; preds = %36
  %40 = load i32, ptr %4, align 4
  %41 = load i32, ptr %5, align 4
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %46

43:                                               ; preds = %39, %36
  %44 = load i32, ptr %7, align 4
  %45 = mul nsw i32 %44, 2
  store i32 %45, ptr %8, align 4
  br label %50

46:                                               ; preds = %39
  %47 = load i32, ptr %7, align 4
  %48 = load i32, ptr %6, align 4
  %49 = sub nsw i32 %47, %48
  store i32 %49, ptr %8, align 4
  br label %50

50:                                               ; preds = %46, %43
  br label %51

51:                                               ; preds = %50, %31
  %52 = load i32, ptr %8, align 4
  %53 = icmp sgt i32 %52, 20
  br i1 %53, label %54, label %57

54:                                               ; preds = %51
  %55 = load i32, ptr %8, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %3, align 4
  br label %66

57:                                               ; preds = %51
  %58 = load i32, ptr %8, align 4
  %59 = icmp sgt i32 %58, 10
  br i1 %59, label %60, label %63

60:                                               ; preds = %57
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 2
  store i32 %62, ptr %3, align 4
  br label %66

63:                                               ; preds = %57
  %64 = load i32, ptr %8, align 4
  %65 = add nsw i32 %64, 3
  store i32 %65, ptr %3, align 4
  br label %66

66:                                               ; preds = %63, %60, %54
  %67 = load i32, ptr %3, align 4
  ret i32 %67
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_74_if_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  br label %12

12:                                               ; preds = %entry
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %13 = load i32, ptr %8, align 4
  %14 = load i32, ptr @g_x, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %11, align 4
  br label %16

16:                                               ; preds = %12
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %9, align 4
  %19 = icmp sgt i32 %17, %18
  br i1 %19, label %20, label %23

20:                                               ; preds = %16
  %21 = load i32, ptr %10, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %30, label %23

23:                                               ; preds = %20, %16
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %10, align 4
  %26 = icmp sgt i32 %24, %25
  br i1 %26, label %27, label %94

27:                                               ; preds = %23
  %28 = load i32, ptr %8, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %94

30:                                               ; preds = %20, %27
  %31 = load i32, ptr %11, align 4
  %32 = add nsw i32 %31, 10
  store i32 %32, ptr %11, align 4
  br label %33

33:                                               ; preds = %30
  %34 = load i32, ptr %7, align 4
  %35 = icmp sge i32 %34, 0
  br i1 %35, label %36, label %90

36:                                               ; preds = %33
  %37 = load i32, ptr %7, align 4
  %38 = icmp slt i32 %37, 8
  br i1 %38, label %39, label %90

39:                                               ; preds = %36
  %40 = load i32, ptr %7, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = load i32, ptr %11, align 4
  %45 = icmp sgt i32 %43, %44
  br i1 %45, label %46, label %68

46:                                               ; preds = %39
  %47 = load i32, ptr %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %11, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %11, align 4
  br label %53

53:                                               ; preds = %46
  %54 = load ptr, ptr %6, align 8
  %55 = load i32, ptr %54, align 4
  %56 = icmp sgt i32 %55, 0
  br i1 %56, label %57, label %62

57:                                               ; preds = %53
  %58 = load ptr, ptr %6, align 8
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %11, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, ptr %11, align 4
  br label %67

62:                                               ; preds = %53
  %63 = load ptr, ptr %6, align 8
  %64 = load i32, ptr %63, align 4
  %65 = load i32, ptr %11, align 4
  %66 = sub nsw i32 %65, %64
  store i32 %66, ptr %11, align 4
  br label %67

67:                                               ; preds = %62, %57
  br label %89

68:                                               ; preds = %39
  %69 = load i32, ptr %7, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = load i32, ptr %11, align 4
  %74 = sub nsw i32 %73, %72
  store i32 %74, ptr %11, align 4
  br label %75

75:                                               ; preds = %68
  %76 = load i32, ptr %7, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %85, label %81

81:                                               ; preds = %75
  %82 = load ptr, ptr %6, align 8
  %83 = load i32, ptr %82, align 4
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %85, label %88

85:                                               ; preds = %81, %75
  %86 = load i32, ptr %11, align 4
  %87 = add nsw i32 %86, 50
  store i32 %87, ptr %11, align 4
  br label %88

88:                                               ; preds = %85, %81
  br label %89

89:                                               ; preds = %88, %67
  br label %93

90:                                               ; preds = %36, %33
  %91 = load i32, ptr %11, align 4
  %92 = sub nsw i32 %91, 20
  store i32 %92, ptr %11, align 4
  br label %93

93:                                               ; preds = %90, %89
  br label %118

94:                                               ; preds = %23, %27
  %95 = load i32, ptr %11, align 4
  %96 = sub nsw i32 %95, 10
  store i32 %96, ptr %11, align 4
  br label %97

97:                                               ; preds = %94
  %98 = load i32, ptr %11, align 4
  %99 = load i32, ptr @g_z, align 4
  %100 = icmp sgt i32 %98, %99
  br i1 %100, label %101, label %117

101:                                              ; preds = %97
  %102 = load i32, ptr %8, align 4
  %103 = load i32, ptr %9, align 4
  %104 = load i32, ptr %10, align 4
  %105 = sdiv i32 %104, 10
  %106 = load i32, ptr %8, align 4
  %107 = sub nsw i32 %106, 1
  %108 = mul nsw i32 %105, %107
  %109 = add nsw i32 %103, %108
  %110 = icmp eq i32 %102, %109
  br i1 %110, label %111, label %114

111:                                              ; preds = %101
  %112 = load i32, ptr %11, align 4
  %113 = add nsw i32 %112, 100
  store i32 %113, ptr %5, align 4
  br label %128

114:                                              ; preds = %101
  %115 = load i32, ptr %11, align 4
  %116 = add nsw i32 %115, 200
  store i32 %116, ptr %5, align 4
  br label %128

117:                                              ; preds = %97
  br label %118

118:                                              ; preds = %117, %93
  %119 = load i32, ptr %11, align 4
  %120 = icmp sgt i32 %119, 0
  br i1 %120, label %121, label %124

121:                                              ; preds = %118
  %122 = load i32, ptr %11, align 4
  %123 = mul nsw i32 %122, 2
  store i32 %123, ptr %.reg2mem, align 4
  br label %127

124:                                              ; preds = %118
  %125 = load i32, ptr %11, align 4
  %126 = sub nsw i32 0, %125
  store i32 %126, ptr %.reg2mem, align 4
  br label %127

127:                                              ; preds = %124, %121
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  br label %128

128:                                              ; preds = %127, %114, %111
  %129 = load i32, ptr %5, align 4
  ret i32 %129
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
  br label %9

9:                                                ; preds = %entry
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 1
  br i1 %12, label %13, label %18

13:                                               ; preds = %10
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @atoi(ptr noundef %16) #8
  store i32 %17, ptr %.reg2mem, align 4
  br label %19

18:                                               ; preds = %10
  store i32 4, ptr %.reg2mem, align 4
  br label %19

19:                                               ; preds = %13, %18
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %3, align 4
  %22 = icmp sgt i32 %21, 2
  br i1 %22, label %23, label %28

23:                                               ; preds = %20
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds ptr, ptr %24, i64 2
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 @atoi(ptr noundef %26) #8
  store i32 %27, ptr %.reg2mem1, align 4
  br label %29

28:                                               ; preds = %20
  store i32 -1, ptr %.reg2mem1, align 4
  br label %29

29:                                               ; preds = %23, %28
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %30 = load i32, ptr %5, align 4
  %31 = call i32 @_00_if_only(i32 noundef %30)
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %7, align 4
  %34 = load i32, ptr %5, align 4
  %35 = call i32 @_01_if_else(i32 noundef %34)
  %36 = load i32, ptr %7, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, ptr %7, align 4
  %38 = load i32, ptr %5, align 4
  %39 = call i32 @_02_if_with_surrounding_code(i32 noundef %38)
  %40 = load i32, ptr %7, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %7, align 4
  %42 = load i32, ptr %5, align 4
  %43 = call i32 @_03_if_compound(i32 noundef %42)
  %44 = load i32, ptr %7, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, ptr %7, align 4
  %46 = load i32, ptr %5, align 4
  %47 = call i32 @_04_if_else_compound(i32 noundef %46)
  %48 = load i32, ptr %7, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %7, align 4
  br label %50

50:                                               ; preds = %29
  %51 = load i32, ptr %6, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %56

53:                                               ; preds = %50
  %54 = load i32, ptr %7, align 4
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %54)
  store i32 0, ptr %2, align 4
  br label %425

56:                                               ; preds = %50
  %57 = load i32, ptr %5, align 4
  %58 = call i32 @_05_if_equal(i32 noundef %57, i32 noundef 4)
  %59 = load i32, ptr %7, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %7, align 4
  %61 = load i32, ptr %5, align 4
  %62 = call i32 @_06_if_not_equal(i32 noundef %61, i32 noundef 4)
  %63 = load i32, ptr %7, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %7, align 4
  %65 = load i32, ptr %5, align 4
  %66 = call i32 @_07_relational(i32 noundef %65, i32 noundef 4)
  %67 = load i32, ptr %7, align 4
  %68 = add nsw i32 %67, %66
  store i32 %68, ptr %7, align 4
  %69 = load i32, ptr %5, align 4
  %70 = icmp sgt i32 %69, 0
  %71 = load i32, ptr %5, align 4
  %72 = call i32 @_08_boolean_argument(i1 noundef zeroext %70, i32 noundef %71)
  %73 = load i32, ptr %7, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %7, align 4
  br label %75

75:                                               ; preds = %56
  %76 = load i32, ptr %6, align 4
  %77 = icmp eq i32 %76, 1
  br i1 %77, label %78, label %81

78:                                               ; preds = %75
  %79 = load i32, ptr %7, align 4
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %79)
  store i32 0, ptr %2, align 4
  br label %425

81:                                               ; preds = %75
  %82 = load i32, ptr %5, align 4
  %83 = call i32 @_09_if_elseif_else(i32 noundef %82)
  %84 = load i32, ptr %7, align 4
  %85 = add nsw i32 %84, %83
  store i32 %85, ptr %7, align 4
  %86 = load i32, ptr %5, align 4
  %87 = call i32 @_10_multiple_elseif(i32 noundef %86)
  %88 = load i32, ptr %7, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, ptr %7, align 4
  %90 = load i32, ptr %5, align 4
  %91 = call i32 @_11_elseif_expressions(i32 noundef %90, i32 noundef 4)
  %92 = load i32, ptr %7, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, ptr %7, align 4
  br label %94

94:                                               ; preds = %81
  %95 = load i32, ptr %6, align 4
  %96 = icmp eq i32 %95, 2
  br i1 %96, label %97, label %100

97:                                               ; preds = %94
  %98 = load i32, ptr %7, align 4
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %98)
  store i32 0, ptr %2, align 4
  br label %425

100:                                              ; preds = %94
  %101 = load i32, ptr %5, align 4
  %102 = call i32 @_12_and(i32 noundef %101, i32 noundef 3)
  %103 = load i32, ptr %7, align 4
  %104 = add nsw i32 %103, %102
  store i32 %104, ptr %7, align 4
  %105 = load i32, ptr %5, align 4
  %106 = call i32 @_13_or(i32 noundef %105, i32 noundef -3)
  %107 = load i32, ptr %7, align 4
  %108 = add nsw i32 %107, %106
  store i32 %108, ptr %7, align 4
  %109 = load i32, ptr %5, align 4
  %110 = call i32 @_14_and_or(i32 noundef %109, i32 noundef 2, i32 noundef -1)
  %111 = load i32, ptr %7, align 4
  %112 = add nsw i32 %111, %110
  store i32 %112, ptr %7, align 4
  %113 = load i32, ptr %5, align 4
  %114 = call i32 @_15_or_and(i32 noundef %113, i32 noundef 0, i32 noundef 20)
  %115 = load i32, ptr %7, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %7, align 4
  %117 = load i32, ptr %5, align 4
  %118 = call i32 @_16_complex_boolean(i32 noundef %117, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %119 = load i32, ptr %7, align 4
  %120 = add nsw i32 %119, %118
  store i32 %120, ptr %7, align 4
  br label %121

121:                                              ; preds = %100
  %122 = load i32, ptr %6, align 4
  %123 = icmp eq i32 %122, 3
  br i1 %123, label %124, label %127

124:                                              ; preds = %121
  %125 = load i32, ptr %7, align 4
  %126 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %125)
  store i32 0, ptr %2, align 4
  br label %425

127:                                              ; preds = %121
  %128 = load i32, ptr %5, align 4
  %129 = call i32 @_17_nested_arithmetic_condition(i32 noundef %128, i32 noundef 1, i32 noundef 20)
  %130 = load i32, ptr %7, align 4
  %131 = add nsw i32 %130, %129
  store i32 %131, ptr %7, align 4
  %132 = load i32, ptr %5, align 4
  %133 = call i32 @_18_deep_parentheses(i32 noundef %132, i32 noundef 2, i32 noundef 3)
  %134 = load i32, ptr %7, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, ptr %7, align 4
  %136 = load i32, ptr %5, align 4
  %137 = call i32 @_19_arithmetic_boolean(i32 noundef %136, i32 noundef 2, i32 noundef 5)
  %138 = load i32, ptr %7, align 4
  %139 = add nsw i32 %138, %137
  store i32 %139, ptr %7, align 4
  %140 = load i32, ptr %5, align 4
  %141 = call i32 @_20_nested_boolean_parentheses(i32 noundef %140, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %142 = load i32, ptr %7, align 4
  %143 = add nsw i32 %142, %141
  store i32 %143, ptr %7, align 4
  br label %144

144:                                              ; preds = %127
  %145 = load i32, ptr %6, align 4
  %146 = icmp eq i32 %145, 4
  br i1 %146, label %147, label %150

147:                                              ; preds = %144
  %148 = load i32, ptr %7, align 4
  %149 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %148)
  store i32 0, ptr %2, align 4
  br label %425

150:                                              ; preds = %144
  %151 = load i32, ptr %5, align 4
  %152 = call i32 @_21_nested_if(i32 noundef %151, i32 noundef 3)
  %153 = load i32, ptr %7, align 4
  %154 = add nsw i32 %153, %152
  store i32 %154, ptr %7, align 4
  %155 = load i32, ptr %5, align 4
  %156 = call i32 @_22_nested_in_else(i32 noundef %155, i32 noundef 3)
  %157 = load i32, ptr %7, align 4
  %158 = add nsw i32 %157, %156
  store i32 %158, ptr %7, align 4
  %159 = load i32, ptr %5, align 4
  %160 = call i32 @_23_nested_if_else(i32 noundef %159, i32 noundef 3, i32 noundef 5)
  %161 = load i32, ptr %7, align 4
  %162 = add nsw i32 %161, %160
  store i32 %162, ptr %7, align 4
  %163 = load i32, ptr %5, align 4
  %164 = call i32 @_24_three_level_nesting(i32 noundef %163, i32 noundef 3, i32 noundef 5)
  %165 = load i32, ptr %7, align 4
  %166 = add nsw i32 %165, %164
  store i32 %166, ptr %7, align 4
  %167 = load i32, ptr %5, align 4
  %168 = call i32 @_25_deep_nested_values(i32 noundef %167, i32 noundef 3, i32 noundef 10)
  %169 = load i32, ptr %7, align 4
  %170 = add nsw i32 %169, %168
  store i32 %170, ptr %7, align 4
  %171 = load i32, ptr %5, align 4
  %172 = call i32 @_26_nested_and(i32 noundef %171, i32 noundef 3, i32 noundef 5)
  %173 = load i32, ptr %7, align 4
  %174 = add nsw i32 %173, %172
  store i32 %174, ptr %7, align 4
  %175 = load i32, ptr %5, align 4
  %176 = call i32 @_27_nested_or(i32 noundef %175, i32 noundef 0, i32 noundef 20)
  %177 = load i32, ptr %7, align 4
  %178 = add nsw i32 %177, %176
  store i32 %178, ptr %7, align 4
  %179 = load i32, ptr %5, align 4
  %180 = call i32 @_28_nested_complex_boolean(i32 noundef %179, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %181 = load i32, ptr %7, align 4
  %182 = add nsw i32 %181, %180
  store i32 %182, ptr %7, align 4
  br label %183

183:                                              ; preds = %150
  %184 = load i32, ptr %6, align 4
  %185 = icmp eq i32 %184, 5
  br i1 %185, label %186, label %189

186:                                              ; preds = %183
  %187 = load i32, ptr %7, align 4
  %188 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %187)
  store i32 0, ptr %2, align 4
  br label %425

189:                                              ; preds = %183
  %190 = load i32, ptr %5, align 4
  %191 = call i32 @_29_independent_ifs(i32 noundef %190)
  %192 = load i32, ptr %7, align 4
  %193 = add nsw i32 %192, %191
  store i32 %193, ptr %7, align 4
  %194 = load i32, ptr %5, align 4
  %195 = call i32 @_30_independent_if_else(i32 noundef %194, i32 noundef 3)
  %196 = load i32, ptr %7, align 4
  %197 = add nsw i32 %196, %195
  store i32 %197, ptr %7, align 4
  br label %198

198:                                              ; preds = %189
  %199 = load i32, ptr %6, align 4
  %200 = icmp eq i32 %199, 6
  br i1 %200, label %201, label %204

201:                                              ; preds = %198
  %202 = load i32, ptr %7, align 4
  %203 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %202)
  store i32 0, ptr %2, align 4
  br label %425

204:                                              ; preds = %198
  %205 = call i32 @_31_array_condition(i32 noundef 1)
  %206 = load i32, ptr %7, align 4
  %207 = add nsw i32 %206, %205
  store i32 %207, ptr %7, align 4
  %208 = call i32 @_32_array_branches(i32 noundef 2)
  %209 = load i32, ptr %7, align 4
  %210 = add nsw i32 %209, %208
  store i32 %210, ptr %7, align 4
  %211 = call i32 @_33_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %212 = load i32, ptr %7, align 4
  %213 = add nsw i32 %212, %211
  store i32 %213, ptr %7, align 4
  %214 = call i32 @_34_matrix_condition(i32 noundef 1, i32 noundef 1)
  %215 = load i32, ptr %7, align 4
  %216 = add nsw i32 %215, %214
  store i32 %216, ptr %7, align 4
  %217 = call i32 @_35_nested_array(i32 noundef 1, i32 noundef 2)
  %218 = load i32, ptr %7, align 4
  %219 = add nsw i32 %218, %217
  store i32 %219, ptr %7, align 4
  br label %220

220:                                              ; preds = %204
  %221 = load i32, ptr %6, align 4
  %222 = icmp eq i32 %221, 7
  br i1 %222, label %223, label %226

223:                                              ; preds = %220
  %224 = load i32, ptr %7, align 4
  %225 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %224)
  store i32 0, ptr %2, align 4
  br label %425

226:                                              ; preds = %220
  %227 = load i32, ptr %5, align 4
  store i32 %227, ptr %8, align 4
  %228 = call i32 @_36_pointer_condition(ptr noundef %8)
  %229 = load i32, ptr %7, align 4
  %230 = add nsw i32 %229, %228
  store i32 %230, ptr %7, align 4
  %231 = call i32 @_37_pointer_branches(ptr noundef %8)
  %232 = load i32, ptr %7, align 4
  %233 = add nsw i32 %232, %231
  store i32 %233, ptr %7, align 4
  %234 = call i32 @_38_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %235 = load i32, ptr %7, align 4
  %236 = add nsw i32 %235, %234
  store i32 %236, ptr %7, align 4
  %237 = call i32 @_39_nested_pointer(ptr noundef %8, i32 noundef 3)
  %238 = load i32, ptr %7, align 4
  %239 = add nsw i32 %238, %237
  store i32 %239, ptr %7, align 4
  %240 = load i32, ptr %5, align 4
  store i32 %240, ptr %8, align 4
  %241 = load i32, ptr %5, align 4
  %242 = call i32 @_40_pointer_write(ptr noundef %8, i32 noundef %241)
  %243 = load i32, ptr %7, align 4
  %244 = add nsw i32 %243, %242
  store i32 %244, ptr %7, align 4
  %245 = load i32, ptr %5, align 4
  store i32 %245, ptr %8, align 4
  %246 = load i32, ptr %5, align 4
  %247 = call i32 @_41_pointer_write_nested(ptr noundef %8, i32 noundef %246, i32 noundef 3)
  %248 = load i32, ptr %7, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, ptr %7, align 4
  br label %250

250:                                              ; preds = %226
  %251 = load i32, ptr %6, align 4
  %252 = icmp eq i32 %251, 8
  br i1 %252, label %253, label %256

253:                                              ; preds = %250
  %254 = load i32, ptr %7, align 4
  %255 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %254)
  store i32 0, ptr %2, align 4
  br label %425

256:                                              ; preds = %250
  %257 = load i32, ptr %5, align 4
  store i32 %257, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %258 = call i32 @_42_global_only()
  %259 = load i32, ptr %7, align 4
  %260 = add nsw i32 %259, %258
  store i32 %260, ptr %7, align 4
  %261 = call i32 @_43_global_and()
  %262 = load i32, ptr %7, align 4
  %263 = add nsw i32 %262, %261
  store i32 %263, ptr %7, align 4
  %264 = call i32 @_44_global_or()
  %265 = load i32, ptr %7, align 4
  %266 = add nsw i32 %265, %264
  store i32 %266, ptr %7, align 4
  %267 = call i32 @_45_global_nested()
  %268 = load i32, ptr %7, align 4
  %269 = add nsw i32 %268, %267
  store i32 %269, ptr %7, align 4
  %270 = call i32 @_46_global_array_only()
  %271 = load i32, ptr %7, align 4
  %272 = add nsw i32 %271, %270
  store i32 %272, ptr %7, align 4
  %273 = call i32 @_47_global_matrix_only()
  %274 = load i32, ptr %7, align 4
  %275 = add nsw i32 %274, %273
  store i32 %275, ptr %7, align 4
  br label %276

276:                                              ; preds = %256
  %277 = load i32, ptr %6, align 4
  %278 = icmp eq i32 %277, 9
  br i1 %278, label %279, label %282

279:                                              ; preds = %276
  %280 = load i32, ptr %7, align 4
  %281 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %280)
  store i32 0, ptr %2, align 4
  br label %425

282:                                              ; preds = %276
  %283 = load i32, ptr %5, align 4
  %284 = call i32 @_48_multiple_returns(i32 noundef %283)
  %285 = load i32, ptr %7, align 4
  %286 = add nsw i32 %285, %284
  store i32 %286, ptr %7, align 4
  %287 = load i32, ptr %5, align 4
  %288 = call i32 @_49_nested_multiple_returns(i32 noundef %287, i32 noundef 3)
  %289 = load i32, ptr %7, align 4
  %290 = add nsw i32 %289, %288
  store i32 %290, ptr %7, align 4
  %291 = load i32, ptr %5, align 4
  %292 = call i32 @_50_complex_multiple_returns(i32 noundef %291, i32 noundef 3, i32 noundef 5)
  %293 = load i32, ptr %7, align 4
  %294 = add nsw i32 %293, %292
  store i32 %294, ptr %7, align 4
  br label %295

295:                                              ; preds = %282
  %296 = load i32, ptr %6, align 4
  %297 = icmp eq i32 %296, 10
  br i1 %297, label %298, label %301

298:                                              ; preds = %295
  %299 = load i32, ptr %7, align 4
  %300 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %299)
  store i32 0, ptr %2, align 4
  br label %425

301:                                              ; preds = %295
  %302 = load i32, ptr %5, align 4
  %303 = call i32 @_51_prefix_code(i32 noundef %302, i32 noundef 2, i32 noundef 3)
  %304 = load i32, ptr %7, align 4
  %305 = add nsw i32 %304, %303
  store i32 %305, ptr %7, align 4
  %306 = load i32, ptr %5, align 4
  %307 = call i32 @_52_suffix_code(i32 noundef %306, i32 noundef 3)
  %308 = load i32, ptr %7, align 4
  %309 = add nsw i32 %308, %307
  store i32 %309, ptr %7, align 4
  %310 = load i32, ptr %5, align 4
  %311 = call i32 @_53_prefix_nested_suffix(i32 noundef %310, i32 noundef 3, i32 noundef 5)
  %312 = load i32, ptr %7, align 4
  %313 = add nsw i32 %312, %311
  store i32 %313, ptr %7, align 4
  br label %314

314:                                              ; preds = %301
  %315 = load i32, ptr %6, align 4
  %316 = icmp eq i32 %315, 11
  br i1 %316, label %317, label %320

317:                                              ; preds = %314
  %318 = load i32, ptr %7, align 4
  %319 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %318)
  store i32 0, ptr %2, align 4
  br label %425

320:                                              ; preds = %314
  %321 = load i32, ptr %5, align 4
  %322 = call i32 @_54_diamond(i32 noundef %321, i32 noundef 3)
  %323 = load i32, ptr %7, align 4
  %324 = add nsw i32 %323, %322
  store i32 %324, ptr %7, align 4
  %325 = load i32, ptr %5, align 4
  %326 = call i32 @_55_multiple_merge_values(i32 noundef %325, i32 noundef 3)
  %327 = load i32, ptr %7, align 4
  %328 = add nsw i32 %327, %326
  store i32 %328, ptr %7, align 4
  %329 = load i32, ptr %5, align 4
  %330 = call i32 @_56_nested_diamonds(i32 noundef %329, i32 noundef 3, i32 noundef 5)
  %331 = load i32, ptr %7, align 4
  %332 = add nsw i32 %331, %330
  store i32 %332, ptr %7, align 4
  br label %333

333:                                              ; preds = %320
  %334 = load i32, ptr %6, align 4
  %335 = icmp eq i32 %334, 12
  br i1 %335, label %336, label %339

336:                                              ; preds = %333
  %337 = load i32, ptr %7, align 4
  %338 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %337)
  store i32 0, ptr %2, align 4
  br label %425

339:                                              ; preds = %333
  %340 = load i32, ptr %5, align 4
  %341 = call i32 @_57_ternary_before_if(i32 noundef %340, i32 noundef 3)
  %342 = load i32, ptr %7, align 4
  %343 = add nsw i32 %342, %341
  store i32 %343, ptr %7, align 4
  %344 = load i32, ptr %5, align 4
  %345 = call i32 @_58_ternary_inside_if(i32 noundef %344, i32 noundef 3)
  %346 = load i32, ptr %7, align 4
  %347 = add nsw i32 %346, %345
  store i32 %347, ptr %7, align 4
  %348 = load i32, ptr %5, align 4
  %349 = call i32 @_59_nested_ternary_if(i32 noundef %348, i32 noundef 3, i32 noundef 5)
  %350 = load i32, ptr %7, align 4
  %351 = add nsw i32 %350, %349
  store i32 %351, ptr %7, align 4
  br label %352

352:                                              ; preds = %339
  %353 = load i32, ptr %6, align 4
  %354 = icmp eq i32 %353, 13
  br i1 %354, label %355, label %358

355:                                              ; preds = %352
  %356 = load i32, ptr %7, align 4
  %357 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %356)
  store i32 0, ptr %2, align 4
  br label %425

358:                                              ; preds = %352
  %359 = load i32, ptr %5, align 4
  %360 = call i32 @_60_dynamic_alloca(i32 noundef 4, i32 noundef %359)
  %361 = load i32, ptr %7, align 4
  %362 = add nsw i32 %361, %360
  store i32 %362, ptr %7, align 4
  %363 = load i32, ptr %5, align 4
  %364 = call i32 @_61_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %363)
  %365 = load i32, ptr %7, align 4
  %366 = add nsw i32 %365, %364
  store i32 %366, ptr %7, align 4
  %367 = load i32, ptr %5, align 4
  %368 = call i32 @_62_dynamic_alloca_complex(i32 noundef 6, i32 noundef %367, i32 noundef 3)
  %369 = load i32, ptr %7, align 4
  %370 = add nsw i32 %369, %368
  store i32 %370, ptr %7, align 4
  br label %371

371:                                              ; preds = %358
  %372 = load i32, ptr %6, align 4
  %373 = icmp eq i32 %372, 14
  br i1 %373, label %374, label %377

374:                                              ; preds = %371
  %375 = load i32, ptr %7, align 4
  %376 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %375)
  store i32 0, ptr %2, align 4
  br label %425

377:                                              ; preds = %371
  %378 = load i32, ptr %5, align 4
  %379 = call i32 @_63_malloc_if(i32 noundef 4, i32 noundef %378)
  %380 = load i32, ptr %7, align 4
  %381 = add nsw i32 %380, %379
  store i32 %381, ptr %7, align 4
  %382 = load i32, ptr %5, align 4
  %383 = call i32 @_64_malloc_nested_if(i32 noundef 4, i32 noundef %382, i32 noundef 3)
  %384 = load i32, ptr %7, align 4
  %385 = add nsw i32 %384, %383
  store i32 %385, ptr %7, align 4
  br label %386

386:                                              ; preds = %377
  %387 = load i32, ptr %6, align 4
  %388 = icmp eq i32 %387, 15
  br i1 %388, label %389, label %392

389:                                              ; preds = %386
  %390 = load i32, ptr %7, align 4
  %391 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %390)
  store i32 0, ptr %2, align 4
  br label %425

392:                                              ; preds = %386
  store i32 0, ptr @g_void_result, align 4
  %393 = load i32, ptr %5, align 4
  call void @_65_void_if(i32 noundef %393)
  %394 = load i32, ptr %5, align 4
  call void @_66_void_if_else(i32 noundef %394)
  %395 = load i32, ptr %5, align 4
  call void @_67_void_nested(i32 noundef %395, i32 noundef 3)
  %396 = load i32, ptr %5, align 4
  call void @_68_void_complex(i32 noundef %396, i32 noundef 3, i32 noundef 0)
  call void @_69_void_global_only()
  %397 = load i32, ptr %5, align 4
  store i32 %397, ptr %8, align 4
  %398 = load i32, ptr %5, align 4
  call void @_70_void_pointer(ptr noundef %8, i32 noundef %398)
  %399 = load i32, ptr %5, align 4
  call void @_71_void_array(i32 noundef 1, i32 noundef %399)
  br label %400

400:                                              ; preds = %392
  %401 = load i32, ptr %6, align 4
  %402 = icmp eq i32 %401, 16
  br i1 %402, label %403, label %406

403:                                              ; preds = %400
  %404 = load i32, ptr %7, align 4
  %405 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %404)
  store i32 0, ptr %2, align 4
  br label %425

406:                                              ; preds = %400
  %407 = load i32, ptr @g_void_result, align 4
  %408 = load i32, ptr %7, align 4
  %409 = add nsw i32 %408, %407
  store i32 %409, ptr %7, align 4
  %410 = load i32, ptr %5, align 4
  store i32 %410, ptr %8, align 4
  %411 = load i32, ptr %5, align 4
  %412 = call i32 @_72_complex_control_flow(ptr noundef %8, i32 noundef 1, i32 noundef %411, i32 noundef 3)
  %413 = load i32, ptr %7, align 4
  %414 = add nsw i32 %413, %412
  store i32 %414, ptr %7, align 4
  %415 = load i32, ptr %5, align 4
  %416 = call i32 @_73_complex_merge(i32 noundef %415, i32 noundef 3, i32 noundef 5)
  %417 = load i32, ptr %7, align 4
  %418 = add nsw i32 %417, %416
  store i32 %418, ptr %7, align 4
  %419 = load i32, ptr %5, align 4
  %420 = call i32 @_74_if_stress(ptr noundef %8, i32 noundef 1, i32 noundef %419, i32 noundef 3, i32 noundef 5)
  %421 = load i32, ptr %7, align 4
  %422 = add nsw i32 %421, %420
  store i32 %422, ptr %7, align 4
  %423 = load i32, ptr %7, align 4
  %424 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %423)
  store i32 0, ptr %2, align 4
  br label %425

425:                                              ; preds = %406, %403, %389, %374, %355, %336, %317, %298, %279, %253, %223, %201, %186, %147, %124, %97, %78, %53
  %426 = load i32, ptr %2, align 4
  ret i32 %426
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
