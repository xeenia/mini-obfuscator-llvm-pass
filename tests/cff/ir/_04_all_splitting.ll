; ModuleID = '_04_all.bc'
source_filename = "_04_all.c"
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
define dso_local i32 @_1_if_else(i32 noundef %0) #0 {
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
define dso_local i32 @_2_if_with_surrounding_code(i32 noundef %0) #0 {
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
define dso_local i32 @_3_if_compound(i32 noundef %0) #0 {
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
define dso_local i32 @_4_if_else_compound(i32 noundef %0) #0 {
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
define dso_local i32 @_5_if_equal(i32 noundef %0, i32 noundef %1) #0 {
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
define dso_local i32 @_6_if_not_equal(i32 noundef %0, i32 noundef %1) #0 {
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
define dso_local i32 @_7_relational(i32 noundef %0, i32 noundef %1) #0 {
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
define dso_local i32 @_8_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
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
define dso_local i32 @_9_if_elseif_else(i32 noundef %0) #0 {
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
define dso_local i32 @_75_for_simple(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %17, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %20

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %4, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  br label %7, !llvm.loop !8

20:                                               ; preds = %7
  %21 = load i32, ptr %4, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_76_while_simple(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %11, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %19

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %5, align 4
  %14 = sub nsw i32 %12, %13
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %5, align 4
  br label %7, !llvm.loop !10

19:                                               ; preds = %7
  %20 = load i32, ptr %4, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_77_do_while(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %16, %6
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %5, align 4
  %10 = mul nsw i32 2, %9
  %11 = add nsw i32 %8, %10
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %5, align 4
  br label %16

16:                                               ; preds = %7
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %2, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %7, label %20, !llvm.loop !11

20:                                               ; preds = %16
  %21 = load i32, ptr %4, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_78_nested_loops(i32 noundef %0, i32 noundef %1) #0 {
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

8:                                                ; preds = %27, %7
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %30

12:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %13

13:                                               ; preds = %23, %12
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %26

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = mul nsw i32 %18, %19
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %4, align 4
  br label %23

23:                                               ; preds = %17
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  br label %13, !llvm.loop !12

26:                                               ; preds = %13
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %5, align 4
  br label %8, !llvm.loop !13

30:                                               ; preds = %8
  %31 = load i32, ptr %4, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_79_nested_loop_if(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %6, align 4
  br label %13

13:                                               ; preds = %33, %12
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %36

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %18, %19
  %21 = srem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %29

23:                                               ; preds = %17
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %4, align 4
  br label %32

29:                                               ; preds = %17
  %30 = load i32, ptr %4, align 4
  %31 = sub nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %32

32:                                               ; preds = %29, %23
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  br label %13, !llvm.loop !14

36:                                               ; preds = %13
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %5, align 4
  br label %8, !llvm.loop !15

40:                                               ; preds = %8
  %41 = load i32, ptr %4, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_80_break(i32 noundef %0) #0 {
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
  %11 = icmp sgt i32 %10, 3
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %21

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 10
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %2, align 4
  br label %18

18:                                               ; preds = %13
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  br label %5, !llvm.loop !16

21:                                               ; preds = %12, %5
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_81_continue(i32 noundef %0) #0 {
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
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  br label %18

14:                                               ; preds = %9
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %2, align 4
  br label %18

18:                                               ; preds = %14, %13
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  br label %5, !llvm.loop !17

21:                                               ; preds = %5
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_82_loop_complex_condition(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i1, align 1
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

7:                                                ; preds = %27, %6
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  store i1 false, ptr %.reg2mem1, align 1
  br i1 %10, label %11, label %18

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  store i1 true, ptr %.reg2mem, align 1
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %15, 3
  store i1 %16, ptr %.reg2mem, align 1
  br label %17

17:                                               ; preds = %14, %11
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  br label %18

18:                                               ; preds = %17, %7
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  br i1 %.reload2, label %19, label %34

19:                                               ; preds = %18
  %20 = load i32, ptr %3, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %19
  %23 = load i32, ptr %3, align 4
  store i32 %23, ptr %.reg2mem3, align 4
  br label %27

24:                                               ; preds = %19
  %25 = load i32, ptr %3, align 4
  %26 = sub nsw i32 0, %25
  store i32 %26, ptr %.reg2mem3, align 4
  br label %27

27:                                               ; preds = %24, %22
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %28, %.reload4
  store i32 %29, ptr %5, align 4
  %30 = load i32, ptr %3, align 4
  %31 = sdiv i32 %30, 2
  store i32 %31, ptr %3, align 4
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %4, align 4
  br label %7, !llvm.loop !18

34:                                               ; preds = %18
  %35 = load i32, ptr %5, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_83_loop_global_array() #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %entry
  store i32 0, ptr %0, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %27, %2
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 8
  br i1 %5, label %6, label %30

6:                                                ; preds = %3
  %7 = load i32, ptr %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %19

12:                                               ; preds = %6
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %0, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %0, align 4
  br label %26

19:                                               ; preds = %6
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %0, align 4
  %25 = sub nsw i32 %24, %23
  store i32 %25, ptr %0, align 4
  br label %26

26:                                               ; preds = %19, %12
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %1, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %1, align 4
  br label %3, !llvm.loop !19

30:                                               ; preds = %3
  %31 = load i32, ptr %0, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_84_loop_pointer(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [8 x i32], align 16
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  %10 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 0
  store ptr %10, ptr %5, align 8
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %11

11:                                               ; preds = %26, %9
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  store i1 false, ptr %.reg2mem, align 1
  br i1 %14, label %15, label %18

15:                                               ; preds = %11
  %16 = load i32, ptr %7, align 4
  %17 = icmp slt i32 %16, 8
  store i1 %17, ptr %.reg2mem, align 1
  br label %18

18:                                               ; preds = %15, %11
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %19, label %29

19:                                               ; preds = %18
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %20, %21
  %23 = load ptr, ptr %5, align 8
  store i32 %22, ptr %23, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds i32, ptr %24, i32 1
  store ptr %25, ptr %5, align 8
  br label %26

26:                                               ; preds = %19
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %7, align 4
  br label %11, !llvm.loop !20

29:                                               ; preds = %18
  store i32 0, ptr %8, align 4
  br label %30

30:                                               ; preds = %46, %29
  %31 = load i32, ptr %8, align 4
  %32 = load i32, ptr %2, align 4
  %33 = icmp slt i32 %31, %32
  store i1 false, ptr %.reg2mem1, align 1
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = load i32, ptr %8, align 4
  %36 = icmp slt i32 %35, 8
  store i1 %36, ptr %.reg2mem1, align 1
  br label %37

37:                                               ; preds = %34, %30
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  br i1 %.reload2, label %38, label %49

38:                                               ; preds = %37
  %39 = load i32, ptr %8, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = mul nsw i32 %42, 2
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, ptr %6, align 4
  br label %46

46:                                               ; preds = %38
  %47 = load i32, ptr %8, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %8, align 4
  br label %30, !llvm.loop !21

49:                                               ; preds = %37
  %50 = load i32, ptr %6, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_85_loop_surrounding_code(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %11

11:                                               ; preds = %29, %8
  %12 = load i32, ptr %6, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %32

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %7, align 4
  br label %19

19:                                               ; preds = %15
  %20 = load i32, ptr %7, align 4
  %21 = icmp sgt i32 %20, 10
  br i1 %21, label %22, label %25

22:                                               ; preds = %19
  %23 = load i32, ptr %7, align 4
  %24 = mul nsw i32 %23, 2
  store i32 %24, ptr %7, align 4
  br label %25

25:                                               ; preds = %22, %19
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %5, align 4
  br label %29

29:                                               ; preds = %25
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %6, align 4
  br label %11, !llvm.loop !22

32:                                               ; preds = %11
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %5, align 4
  br label %36

36:                                               ; preds = %32
  %37 = load i32, ptr %5, align 4
  %38 = icmp sgt i32 %37, 100
  br i1 %38, label %39, label %42

39:                                               ; preds = %36
  %40 = load i32, ptr %5, align 4
  %41 = sub nsw i32 %40, 100
  store i32 %41, ptr %5, align 4
  br label %42

42:                                               ; preds = %39, %36
  %43 = load i32, ptr %5, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_86_triple_nested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  br label %10

10:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %11

11:                                               ; preds = %57, %10
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %60

15:                                               ; preds = %11
  store i32 0, ptr %8, align 4
  br label %16

16:                                               ; preds = %53, %15
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %56

20:                                               ; preds = %16
  store i32 0, ptr %9, align 4
  br label %21

21:                                               ; preds = %49, %20
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %5, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %52

25:                                               ; preds = %21
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %8, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %29, label %36

29:                                               ; preds = %25
  %30 = load i32, ptr %8, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp sgt i32 %30, %31
  br i1 %32, label %33, label %36

33:                                               ; preds = %29
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 10
  store i32 %35, ptr %6, align 4
  br label %48

36:                                               ; preds = %29, %25
  %37 = load i32, ptr %7, align 4
  %38 = load i32, ptr %8, align 4
  %39 = icmp eq i32 %37, %38
  br i1 %39, label %44, label %40

40:                                               ; preds = %36
  %41 = load i32, ptr %8, align 4
  %42 = load i32, ptr %9, align 4
  %43 = icmp eq i32 %41, %42
  br i1 %43, label %44, label %47

44:                                               ; preds = %40, %36
  %45 = load i32, ptr %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %6, align 4
  br label %47

47:                                               ; preds = %44, %40
  br label %48

48:                                               ; preds = %47, %33
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %9, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %9, align 4
  br label %21, !llvm.loop !23

52:                                               ; preds = %21
  br label %53

53:                                               ; preds = %52
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %8, align 4
  br label %16, !llvm.loop !24

56:                                               ; preds = %16
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %7, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %7, align 4
  br label %11, !llvm.loop !25

60:                                               ; preds = %11
  %61 = load i32, ptr %6, align 4
  ret i32 %61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_87_if_OR3(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem5 = alloca i32, align 4
  %.reload.reg2mem = alloca i32, align 4
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
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
  br i1 %10, label %17, label %11

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %40

17:                                               ; preds = %14, %11, %8
  %18 = load i32, ptr %4, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = load i32, ptr %4, align 4
  store i32 %21, ptr %.reg2mem, align 4
  br label %23

22:                                               ; preds = %17
  store i32 0, ptr %.reg2mem, align 4
  br label %23

23:                                               ; preds = %20, %22
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reload.reg2mem, align 4
  br label %24

24:                                               ; preds = %23
  %25 = load i32, ptr %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %24
  %28 = load i32, ptr %5, align 4
  store i32 %28, ptr %.reg2mem1, align 4
  br label %30

29:                                               ; preds = %24
  store i32 0, ptr %.reg2mem1, align 4
  br label %30

30:                                               ; preds = %27, %29
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload.reload = load i32, ptr %.reload.reg2mem, align 4
  %31 = add nsw i32 %.reload.reload, %.reload2
  store i32 %31, ptr %.reg2mem5, align 4
  br label %32

32:                                               ; preds = %30
  %33 = load i32, ptr %6, align 4
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %32
  %36 = load i32, ptr %6, align 4
  store i32 %36, ptr %.reg2mem3, align 4
  br label %38

37:                                               ; preds = %32
  store i32 0, ptr %.reg2mem3, align 4
  br label %38

38:                                               ; preds = %37, %35
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %39 = add nsw i32 %.reload6, %.reload4
  store i32 %39, ptr %3, align 4
  br label %41

40:                                               ; preds = %14
  store i32 0, ptr %3, align 4
  br label %41

41:                                               ; preds = %40, %38
  %42 = load i32, ptr %3, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_88_if_OR3_vla(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem13 = alloca ptr, align 8
  %.reg2mem11 = alloca i32, align 4
  %.reload6.reg2mem = alloca i32, align 4
  %.reg2mem9 = alloca i32, align 4
  %.reg2mem7 = alloca i32, align 4
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  br label %10

10:                                               ; preds = %9
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = load i32, ptr %3, align 4
  store i32 %14, ptr %.reg2mem3, align 4
  br label %28

15:                                               ; preds = %10
  %16 = load i32, ptr %4, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = load i32, ptr %4, align 4
  store i32 %19, ptr %.reg2mem1, align 4
  br label %27

20:                                               ; preds = %15
  %21 = load i32, ptr %5, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %20
  %24 = load i32, ptr %5, align 4
  store i32 %24, ptr %.reg2mem, align 4
  br label %26

25:                                               ; preds = %20
  store i32 1, ptr %.reg2mem, align 4
  br label %26

26:                                               ; preds = %25, %23
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem1, align 4
  br label %27

27:                                               ; preds = %26, %18
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  br label %28

28:                                               ; preds = %13, %27
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %6, align 4
  %29 = load i32, ptr %6, align 4
  %30 = zext i32 %29 to i64
  %31 = call ptr @llvm.stacksave()
  store ptr %31, ptr %7, align 8
  %32 = alloca i32, i64 %30, align 16
  store ptr %32, ptr %.reg2mem13, align 8
  store i64 %30, ptr %8, align 8
  %.reload21 = load ptr, ptr %.reg2mem13, align 8
  %33 = getelementptr inbounds i32, ptr %.reload21, i64 0
  store i32 0, ptr %33, align 16
  br label %34

34:                                               ; preds = %28
  %35 = load i32, ptr %3, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %43, label %37

37:                                               ; preds = %34
  %38 = load i32, ptr %4, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %43, label %40

40:                                               ; preds = %37
  %41 = load i32, ptr %5, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %67

43:                                               ; preds = %40, %37, %34
  %44 = load i32, ptr %3, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %48

46:                                               ; preds = %43
  %47 = load i32, ptr %3, align 4
  store i32 %47, ptr %.reg2mem5, align 4
  br label %49

48:                                               ; preds = %43
  store i32 0, ptr %.reg2mem5, align 4
  br label %49

49:                                               ; preds = %46, %48
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %.reload6.reg2mem, align 4
  br label %50

50:                                               ; preds = %49
  %51 = load i32, ptr %4, align 4
  %52 = icmp sgt i32 %51, 0
  br i1 %52, label %53, label %55

53:                                               ; preds = %50
  %54 = load i32, ptr %4, align 4
  store i32 %54, ptr %.reg2mem7, align 4
  br label %56

55:                                               ; preds = %50
  store i32 0, ptr %.reg2mem7, align 4
  br label %56

56:                                               ; preds = %53, %55
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %.reload6.reload = load i32, ptr %.reload6.reg2mem, align 4
  %57 = add nsw i32 %.reload6.reload, %.reload8
  store i32 %57, ptr %.reg2mem11, align 4
  br label %58

58:                                               ; preds = %56
  %59 = load i32, ptr %5, align 4
  %60 = icmp sgt i32 %59, 0
  br i1 %60, label %61, label %63

61:                                               ; preds = %58
  %62 = load i32, ptr %5, align 4
  store i32 %62, ptr %.reg2mem9, align 4
  br label %64

63:                                               ; preds = %58
  store i32 0, ptr %.reg2mem9, align 4
  br label %64

64:                                               ; preds = %63, %61
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  %.reload12 = load i32, ptr %.reg2mem11, align 4
  %65 = add nsw i32 %.reload12, %.reload10
  %.reload20 = load ptr, ptr %.reg2mem13, align 8
  %66 = getelementptr inbounds i32, ptr %.reload20, i64 0
  store i32 %65, ptr %66, align 16
  br label %67

67:                                               ; preds = %64, %40
  %68 = load i32, ptr %6, align 4
  %69 = icmp sgt i32 %68, 1
  br i1 %69, label %70, label %75

70:                                               ; preds = %67
  %.reload19 = load ptr, ptr %.reg2mem13, align 8
  %71 = getelementptr inbounds i32, ptr %.reload19, i64 0
  %72 = load i32, ptr %71, align 16
  %73 = mul nsw i32 %72, 2
  %.reload18 = load ptr, ptr %.reg2mem13, align 8
  %74 = getelementptr inbounds i32, ptr %.reload18, i64 1
  store i32 %73, ptr %74, align 4
  br label %80

75:                                               ; preds = %67
  %.reload17 = load ptr, ptr %.reg2mem13, align 8
  %76 = getelementptr inbounds i32, ptr %.reload17, i64 0
  %77 = load i32, ptr %76, align 16
  %78 = sub nsw i32 %77, 1
  %.reload16 = load ptr, ptr %.reg2mem13, align 8
  %79 = getelementptr inbounds i32, ptr %.reload16, i64 1
  store i32 %78, ptr %79, align 4
  br label %80

80:                                               ; preds = %75, %70
  %.reload15 = load ptr, ptr %.reg2mem13, align 8
  %81 = getelementptr inbounds i32, ptr %.reload15, i64 0
  %82 = load i32, ptr %81, align 16
  %.reload14 = load ptr, ptr %.reg2mem13, align 8
  %83 = getelementptr inbounds i32, ptr %.reload14, i64 1
  %84 = load i32, ptr %83, align 4
  %85 = add nsw i32 %82, %84
  %86 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %86)
  ret i32 %85
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_89_loop_vla(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  br label %10

10:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %11

11:                                               ; preds = %10
  %12 = load i32, ptr %3, align 4
  %13 = icmp sle i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 -1, ptr %2, align 4
  br label %66

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = zext i32 %16 to i64
  %18 = call ptr @llvm.stacksave()
  store ptr %18, ptr %5, align 8
  %19 = alloca i32, i64 %17, align 16
  store ptr %19, ptr %.reg2mem, align 8
  store i64 %17, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %20

20:                                               ; preds = %31, %15
  %21 = load i32, ptr %8, align 4
  %22 = load i32, ptr %3, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %34

24:                                               ; preds = %20
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %8, align 4
  %29 = sext i32 %28 to i64
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %30 = getelementptr inbounds i32, ptr %.reload3, i64 %29
  store i32 %27, ptr %30, align 4
  br label %31

31:                                               ; preds = %24
  %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %8, align 4
  br label %20, !llvm.loop !26

34:                                               ; preds = %20
  store i32 0, ptr %9, align 4
  br label %35

35:                                               ; preds = %60, %34
  %36 = load i32, ptr %9, align 4
  %37 = load i32, ptr %3, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %63

39:                                               ; preds = %35
  %40 = load i32, ptr %9, align 4
  %41 = sext i32 %40 to i64
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %42 = getelementptr inbounds i32, ptr %.reload2, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %45, label %52

45:                                               ; preds = %39
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %48 = getelementptr inbounds i32, ptr %.reload1, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %7, align 4
  br label %59

52:                                               ; preds = %39
  %53 = load i32, ptr %9, align 4
  %54 = sext i32 %53 to i64
  %.reload = load ptr, ptr %.reg2mem, align 8
  %55 = getelementptr inbounds i32, ptr %.reload, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = load i32, ptr %7, align 4
  %58 = sub nsw i32 %57, %56
  store i32 %58, ptr %7, align 4
  br label %59

59:                                               ; preds = %52, %45
  br label %60

60:                                               ; preds = %59
  %61 = load i32, ptr %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %9, align 4
  br label %35, !llvm.loop !27

63:                                               ; preds = %35
  %64 = load i32, ptr %7, align 4
  store i32 %64, ptr %2, align 4
  %65 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %65)
  br label %66

66:                                               ; preds = %63, %14
  %67 = load i32, ptr %2, align 4
  ret i32 %67
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_90_vla_nested_loop(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  br label %12

12:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %13

13:                                               ; preds = %12
  %14 = load i32, ptr %3, align 4
  %15 = icmp sle i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 -1, ptr %2, align 4
  br label %72

17:                                               ; preds = %13
  %18 = load i32, ptr %3, align 4
  %19 = zext i32 %18 to i64
  %20 = call ptr @llvm.stacksave()
  store ptr %20, ptr %5, align 8
  %21 = alloca i32, i64 %19, align 16
  store i64 %19, ptr %6, align 8
  store ptr %21, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %22

22:                                               ; preds = %50, %17
  %23 = load i32, ptr %8, align 4
  %24 = load i32, ptr %3, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %53

26:                                               ; preds = %22
  %27 = load ptr, ptr %7, align 8
  %28 = load i32, ptr %8, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %27, i64 %29
  store i32 0, ptr %30, align 4
  store i32 0, ptr %9, align 4
  br label %31

31:                                               ; preds = %46, %26
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %8, align 4
  %34 = icmp sle i32 %32, %33
  br i1 %34, label %35, label %49

35:                                               ; preds = %31
  %36 = load i32, ptr %4, align 4
  %37 = load i32, ptr %9, align 4
  %38 = add nsw i32 %37, 1
  %39 = mul nsw i32 %36, %38
  %40 = load ptr, ptr %7, align 8
  %41 = load i32, ptr %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, ptr %40, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = add nsw i32 %44, %39
  store i32 %45, ptr %43, align 4
  br label %46

46:                                               ; preds = %35
  %47 = load i32, ptr %9, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %9, align 4
  br label %31, !llvm.loop !28

49:                                               ; preds = %31
  br label %50

50:                                               ; preds = %49
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %8, align 4
  br label %22, !llvm.loop !29

53:                                               ; preds = %22
  store i32 0, ptr %10, align 4
  store i32 0, ptr %11, align 4
  br label %54

54:                                               ; preds = %66, %53
  %55 = load i32, ptr %11, align 4
  %56 = load i32, ptr %3, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %69

58:                                               ; preds = %54
  %59 = load ptr, ptr %7, align 8
  %60 = load i32, ptr %11, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %59, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = load i32, ptr %10, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %10, align 4
  br label %66

66:                                               ; preds = %58
  %67 = load i32, ptr %11, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %11, align 4
  br label %54, !llvm.loop !30

69:                                               ; preds = %54
  %70 = load i32, ptr %10, align 4
  store i32 %70, ptr %2, align 4
  %71 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %71)
  br label %72

72:                                               ; preds = %69, %16
  %73 = load i32, ptr %2, align 4
  ret i32 %73
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_91_alloca_inside_loop(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %60, %9
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %2, align 4
  %13 = icmp slt i32 %11, %12
  store i1 false, ptr %.reg2mem, align 1
  br i1 %13, label %14, label %17

14:                                               ; preds = %10
  %15 = load i32, ptr %5, align 4
  %16 = icmp slt i32 %15, 4
  store i1 %16, ptr %.reg2mem, align 1
  br label %17

17:                                               ; preds = %14, %10
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %18, label %63

18:                                               ; preds = %17
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  %21 = zext i32 %20 to i64
  %22 = call ptr @llvm.stacksave()
  store ptr %22, ptr %6, align 8
  %23 = alloca i32, i64 %21, align 16
  store ptr %23, ptr %.reg2mem1, align 8
  store i64 %21, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %24

24:                                               ; preds = %35, %18
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %5, align 4
  %27 = icmp sle i32 %25, %26
  br i1 %27, label %28, label %38

28:                                               ; preds = %24
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %8, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %8, align 4
  %33 = sext i32 %32 to i64
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %34 = getelementptr inbounds i32, ptr %.reload5, i64 %33
  store i32 %31, ptr %34, align 4
  br label %35

35:                                               ; preds = %28
  %36 = load i32, ptr %8, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %8, align 4
  br label %24, !llvm.loop !31

38:                                               ; preds = %24
  %39 = load i32, ptr %5, align 4
  %40 = sext i32 %39 to i64
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %41 = getelementptr inbounds i32, ptr %.reload4, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %44, label %51

44:                                               ; preds = %38
  %45 = load i32, ptr %5, align 4
  %46 = sext i32 %45 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %47 = getelementptr inbounds i32, ptr %.reload3, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = load i32, ptr %4, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %4, align 4
  br label %58

51:                                               ; preds = %38
  %52 = load i32, ptr %5, align 4
  %53 = sext i32 %52 to i64
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %54 = getelementptr inbounds i32, ptr %.reload2, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = load i32, ptr %4, align 4
  %57 = sub nsw i32 %56, %55
  store i32 %57, ptr %4, align 4
  br label %58

58:                                               ; preds = %51, %44
  %59 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %59)
  br label %60

60:                                               ; preds = %58
  %61 = load i32, ptr %5, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %5, align 4
  br label %10, !llvm.loop !32

63:                                               ; preds = %17
  %64 = load i32, ptr %4, align 4
  ret i32 %64
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_92_vla_size_from_loop(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  br label %11

11:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %6, align 4
  br label %12

12:                                               ; preds = %28, %11
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp sle i32 %13, %14
  br i1 %15, label %16, label %31

16:                                               ; preds = %12
  %17 = load i32, ptr %6, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  br label %27

24:                                               ; preds = %16
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  br label %27

27:                                               ; preds = %24, %20
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  br label %12, !llvm.loop !33

31:                                               ; preds = %12
  %32 = load i32, ptr %5, align 4
  %33 = zext i32 %32 to i64
  %34 = call ptr @llvm.stacksave()
  store ptr %34, ptr %7, align 8
  %35 = alloca i32, i64 %33, align 16
  store ptr %35, ptr %.reg2mem, align 8
  store i64 %33, ptr %8, align 8
  %36 = load i32, ptr %4, align 4
  %.reload6 = load ptr, ptr %.reg2mem, align 8
  %37 = getelementptr inbounds i32, ptr %.reload6, i64 0
  store i32 %36, ptr %37, align 16
  store i32 1, ptr %9, align 4
  br label %38

38:                                               ; preds = %53, %31
  %39 = load i32, ptr %9, align 4
  %40 = load i32, ptr %5, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %56

42:                                               ; preds = %38
  %43 = load i32, ptr %9, align 4
  %44 = sub nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %46 = getelementptr inbounds i32, ptr %.reload5, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr %9, align 4
  %49 = add nsw i32 %47, %48
  %50 = load i32, ptr %9, align 4
  %51 = sext i32 %50 to i64
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %52 = getelementptr inbounds i32, ptr %.reload4, i64 %51
  store i32 %49, ptr %52, align 4
  br label %53

53:                                               ; preds = %42
  %54 = load i32, ptr %9, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %9, align 4
  br label %38, !llvm.loop !34

56:                                               ; preds = %38
  %57 = load i32, ptr %5, align 4
  %58 = sub nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %60 = getelementptr inbounds i32, ptr %.reload3, i64 %59
  %61 = load i32, ptr %60, align 4
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %62 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %63 = load i32, ptr %62, align 16
  %64 = icmp sgt i32 %61, %63
  br i1 %64, label %65, label %71

65:                                               ; preds = %56
  %66 = load i32, ptr %5, align 4
  %67 = sub nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %69 = getelementptr inbounds i32, ptr %.reload1, i64 %68
  %70 = load i32, ptr %69, align 4
  store i32 %70, ptr %2, align 4
  store i32 1, ptr %10, align 4
  br label %74

71:                                               ; preds = %56
  %.reload = load ptr, ptr %.reg2mem, align 8
  %72 = getelementptr inbounds i32, ptr %.reload, i64 0
  %73 = load i32, ptr %72, align 16
  store i32 %73, ptr %2, align 4
  store i32 1, ptr %10, align 4
  br label %74

74:                                               ; preds = %71, %65
  %75 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %75)
  %76 = load i32, ptr %2, align 4
  ret i32 %76
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_93_global_loop() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  store i32 0, ptr @g_void_result, align 4
  store i32 0, ptr %0, align 4
  br label %2

2:                                                ; preds = %20, %1
  %3 = load i32, ptr %0, align 4
  %4 = load i32, ptr @g_n, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %23

6:                                                ; preds = %2
  %7 = load i32, ptr @g_x, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %6
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr %0, align 4
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
  %21 = load i32, ptr %0, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %0, align 4
  br label %2, !llvm.loop !35

23:                                               ; preds = %2
  %24 = load i32, ptr @g_void_result, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_94_void_loop(i32 noundef %0, i32 noundef %1) #0 {
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

6:                                                ; preds = %22, %5
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  br label %21

17:                                               ; preds = %10
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr @g_void_result, align 4
  %20 = sub nsw i32 %19, %18
  store i32 %20, ptr @g_void_result, align 4
  br label %21

21:                                               ; preds = %17, %13
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %6, !llvm.loop !36

25:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_95_void_loop_pointer(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  br label %8

8:                                                ; preds = %entry
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %9

9:                                                ; preds = %34, %8
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %37

13:                                               ; preds = %9
  %14 = load i32, ptr %6, align 4
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %25

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %18, %19
  %21 = load ptr, ptr %3, align 8
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, ptr %21, i64 %23
  store i32 %20, ptr %24, align 4
  br label %33

25:                                               ; preds = %13
  %26 = load i32, ptr %5, align 4
  %27 = load i32, ptr %6, align 4
  %28 = sub nsw i32 %26, %27
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 %28, ptr %32, align 4
  br label %33

33:                                               ; preds = %25, %17
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %6, align 4
  br label %9, !llvm.loop !37

37:                                               ; preds = %9
  store i32 0, ptr %7, align 4
  br label %38

38:                                               ; preds = %50, %37
  %39 = load i32, ptr %7, align 4
  %40 = load i32, ptr %4, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %53

42:                                               ; preds = %38
  %43 = load ptr, ptr %3, align 8
  %44 = load i32, ptr %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr @g_void_result, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr @g_void_result, align 4
  br label %50

50:                                               ; preds = %42
  %51 = load i32, ptr %7, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %7, align 4
  br label %38, !llvm.loop !38

53:                                               ; preds = %38
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_96_goto_break(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %23, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %26

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = icmp sgt i32 %14, 20
  br i1 %15, label %16, label %17

16:                                               ; preds = %11
  br label %27

17:                                               ; preds = %11
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %4, align 4
  br label %23

23:                                               ; preds = %17
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %5, align 4
  br label %7, !llvm.loop !39

26:                                               ; preds = %7
  br label %27

27:                                               ; preds = %26, %16
  %28 = load i32, ptr %4, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_97_goto_nested_loop(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %33, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %19

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %4, align 4
  %18 = sub nsw i32 %17, %16
  store i32 %18, ptr %4, align 4
  br label %33

19:                                               ; preds = %14
  %20 = load i32, ptr %5, align 4
  %21 = srem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %19
  br label %28

24:                                               ; preds = %19
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %4, align 4
  br label %33

28:                                               ; preds = %23
  %29 = load i32, ptr %5, align 4
  %30 = mul nsw i32 %29, 10
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %4, align 4
  br label %33

33:                                               ; preds = %28, %24, %15
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  br label %7, !llvm.loop !40

36:                                               ; preds = %7
  %37 = load i32, ptr %4, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_98_goto_vla(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i32, align 4
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
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  store i32 %13, ptr %.reg2mem, align 4
  br label %15

14:                                               ; preds = %9
  store i32 1, ptr %.reg2mem, align 4
  br label %15

15:                                               ; preds = %12, %14
  %.reload = load i32, ptr %.reg2mem, align 4
  %16 = zext i32 %.reload to i64
  %17 = call ptr @llvm.stacksave()
  store ptr %17, ptr %5, align 8
  %18 = alloca i32, i64 %16, align 16
  store ptr %18, ptr %.reg2mem1, align 8
  store i64 %16, ptr %6, align 8
  br label %19

19:                                               ; preds = %15
  %20 = load i32, ptr %3, align 4
  %21 = icmp sle i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  br label %50

23:                                               ; preds = %19
  %24 = load i32, ptr %4, align 4
  %.reload7 = load ptr, ptr %.reg2mem1, align 8
  %25 = getelementptr inbounds i32, ptr %.reload7, i64 0
  store i32 %24, ptr %25, align 16
  br label %26

26:                                               ; preds = %23
  %27 = load i32, ptr %3, align 4
  %28 = icmp sgt i32 %27, 2
  br i1 %28, label %29, label %30

29:                                               ; preds = %26
  br label %34

30:                                               ; preds = %26
  %.reload6 = load ptr, ptr %.reg2mem1, align 8
  %31 = getelementptr inbounds i32, ptr %.reload6, i64 0
  %32 = load i32, ptr %31, align 16
  %33 = add nsw i32 %32, 10
  store i32 %33, ptr %31, align 16
  br label %38

34:                                               ; preds = %29
  %35 = load i32, ptr %4, align 4
  %36 = mul nsw i32 %35, 2
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %37 = getelementptr inbounds i32, ptr %.reload5, i64 1
  store i32 %36, ptr %37, align 4
  br label %38

38:                                               ; preds = %34, %30
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %39 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %40 = load i32, ptr %39, align 16
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %43

42:                                               ; preds = %38
  br label %47

43:                                               ; preds = %38
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %44 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %45 = load i32, ptr %44, align 16
  %46 = sub nsw i32 %45, 1
  store i32 %46, ptr %2, align 4
  store i32 1, ptr %7, align 4
  br label %51

47:                                               ; preds = %42
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %48 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %49 = load i32, ptr %48, align 16
  store i32 %49, ptr %2, align 4
  store i32 1, ptr %7, align 4
  br label %51

50:                                               ; preds = %22
  store i32 -1, ptr %2, align 4
  store i32 1, ptr %7, align 4
  br label %51

51:                                               ; preds = %50, %47, %43
  %52 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %52)
  %53 = load i32, ptr %2, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_99_malloc_loop(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
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
  br label %71

14:                                               ; preds = %10
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 4
  %18 = call noalias ptr @malloc(i64 noundef %17) #6
  store ptr %18, ptr %5, align 8
  br label %19

19:                                               ; preds = %14
  %20 = load ptr, ptr %5, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  store i32 -2, ptr %2, align 4
  br label %71

23:                                               ; preds = %19
  store i32 0, ptr %6, align 4
  br label %24

24:                                               ; preds = %49, %23
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %3, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %52

28:                                               ; preds = %24
  %29 = load i32, ptr %6, align 4
  %30 = srem i32 %29, 2
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %40

32:                                               ; preds = %28
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %33, %34
  %36 = load ptr, ptr %5, align 8
  %37 = load i32, ptr %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr %36, i64 %38
  store i32 %35, ptr %39, align 4
  br label %48

40:                                               ; preds = %28
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %6, align 4
  %43 = sub nsw i32 %41, %42
  %44 = load ptr, ptr %5, align 8
  %45 = load i32, ptr %6, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %44, i64 %46
  store i32 %43, ptr %47, align 4
  br label %48

48:                                               ; preds = %40, %32
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %6, align 4
  br label %24, !llvm.loop !41

52:                                               ; preds = %24
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %53

53:                                               ; preds = %65, %52
  %54 = load i32, ptr %8, align 4
  %55 = load i32, ptr %3, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %57, label %68

57:                                               ; preds = %53
  %58 = load ptr, ptr %5, align 8
  %59 = load i32, ptr %8, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %58, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %7, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %7, align 4
  br label %65

65:                                               ; preds = %57
  %66 = load i32, ptr %8, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %8, align 4
  br label %53, !llvm.loop !42

68:                                               ; preds = %53
  %69 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %69) #7
  %70 = load i32, ptr %7, align 4
  store i32 %70, ptr %2, align 4
  br label %71

71:                                               ; preds = %68, %22, %13
  %72 = load i32, ptr %2, align 4
  ret i32 %72
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_100_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem14 = alloca i32, align 4
  %.reg2mem9 = alloca ptr, align 8
  %.reg2mem7 = alloca i32, align 4
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  br label %14

14:                                               ; preds = %entry
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  %15 = load i32, ptr @g_x, align 4
  store i32 %15, ptr %8, align 4
  br label %16

16:                                               ; preds = %14
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = load i32, ptr %5, align 4
  store i32 %20, ptr %.reg2mem, align 4
  br label %22

21:                                               ; preds = %16
  store i32 1, ptr %.reg2mem, align 4
  br label %22

22:                                               ; preds = %21, %19
  %.reload = load i32, ptr %.reg2mem, align 4
  %23 = zext i32 %.reload to i64
  %24 = call ptr @llvm.stacksave()
  store ptr %24, ptr %9, align 8
  %25 = alloca i32, i64 %23, align 16
  store ptr %25, ptr %.reg2mem9, align 8
  store i64 %23, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %26

26:                                               ; preds = %22, %43
  %27 = load i32, ptr %11, align 4
  store i32 %27, ptr %.reg2mem7, align 4
  br label %28

28:                                               ; preds = %26
  %29 = load i32, ptr %5, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %33

31:                                               ; preds = %28
  %32 = load i32, ptr %5, align 4
  store i32 %32, ptr %.reg2mem1, align 4
  br label %34

33:                                               ; preds = %28
  store i32 1, ptr %.reg2mem1, align 4
  br label %34

34:                                               ; preds = %33, %31
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %35 = icmp slt i32 %.reload8, %.reload2
  br i1 %35, label %36, label %46

36:                                               ; preds = %34
  %37 = load i32, ptr %6, align 4
  %38 = load i32, ptr %11, align 4
  %39 = add nsw i32 %37, %38
  %40 = load i32, ptr %11, align 4
  %41 = sext i32 %40 to i64
  %.reload13 = load ptr, ptr %.reg2mem9, align 8
  %42 = getelementptr inbounds i32, ptr %.reload13, i64 %41
  store i32 %39, ptr %42, align 4
  br label %43

43:                                               ; preds = %36
  %44 = load i32, ptr %11, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %11, align 4
  br label %26, !llvm.loop !43

46:                                               ; preds = %34
  store i32 0, ptr %12, align 4
  br label %47

47:                                               ; preds = %46, %130
  %48 = load i32, ptr %12, align 4
  store i32 %48, ptr %.reg2mem14, align 4
  br label %49

49:                                               ; preds = %47
  %50 = load i32, ptr %5, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %54

52:                                               ; preds = %49
  %53 = load i32, ptr %5, align 4
  store i32 %53, ptr %.reg2mem3, align 4
  br label %55

54:                                               ; preds = %49
  store i32 1, ptr %.reg2mem3, align 4
  br label %55

55:                                               ; preds = %54, %52
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload15 = load i32, ptr %.reg2mem14, align 4
  %56 = icmp slt i32 %.reload15, %.reload4
  br i1 %56, label %57, label %133

57:                                               ; preds = %55
  %58 = load i32, ptr %12, align 4
  %59 = sext i32 %58 to i64
  %.reload12 = load ptr, ptr %.reg2mem9, align 8
  %60 = getelementptr inbounds i32, ptr %.reload12, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %7, align 4
  %63 = icmp sgt i32 %61, %62
  br i1 %63, label %64, label %108

64:                                               ; preds = %57
  store i32 0, ptr %13, align 4
  br label %65

65:                                               ; preds = %104, %64
  %66 = load i32, ptr %13, align 4
  %67 = icmp slt i32 %66, 8
  br i1 %67, label %68, label %107

68:                                               ; preds = %65
  %69 = load i32, ptr %13, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = icmp sgt i32 %72, 0
  br i1 %73, label %74, label %90

74:                                               ; preds = %68
  %75 = load i32, ptr %13, align 4
  %76 = srem i32 %75, 2
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %90

78:                                               ; preds = %74
  %79 = load i32, ptr %13, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = load i32, ptr %12, align 4
  %84 = sext i32 %83 to i64
  %.reload11 = load ptr, ptr %.reg2mem9, align 8
  %85 = getelementptr inbounds i32, ptr %.reload11, i64 %84
  %86 = load i32, ptr %85, align 4
  %87 = sub nsw i32 %82, %86
  %88 = load i32, ptr %8, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, ptr %8, align 4
  br label %103

90:                                               ; preds = %74, %68
  %91 = load ptr, ptr %4, align 8
  %92 = icmp ne ptr %91, null
  br i1 %92, label %93, label %102

93:                                               ; preds = %90
  %94 = load ptr, ptr %4, align 8
  %95 = load i32, ptr %94, align 4
  %96 = icmp sgt i32 %95, 0
  br i1 %96, label %97, label %102

97:                                               ; preds = %93
  %98 = load ptr, ptr %4, align 8
  %99 = load i32, ptr %98, align 4
  %100 = load i32, ptr %8, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, ptr %8, align 4
  br label %102

102:                                              ; preds = %97, %93, %90
  br label %103

103:                                              ; preds = %102, %78
  br label %104

104:                                              ; preds = %103
  %105 = load i32, ptr %13, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %13, align 4
  br label %65, !llvm.loop !44

107:                                              ; preds = %65
  br label %129

108:                                              ; preds = %57
  %109 = load i32, ptr %12, align 4
  %110 = sext i32 %109 to i64
  %.reload10 = load ptr, ptr %.reg2mem9, align 8
  %111 = getelementptr inbounds i32, ptr %.reload10, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = load i32, ptr %8, align 4
  %114 = sub nsw i32 %113, %112
  store i32 %114, ptr %8, align 4
  br label %115

115:                                              ; preds = %108
  %116 = load i32, ptr %6, align 4
  %117 = srem i32 %116, 3
  %118 = load i32, ptr %7, align 4
  %119 = load i32, ptr %6, align 4
  %120 = sub nsw i32 %119, 1
  %121 = mul nsw i32 5, %120
  %122 = add nsw i32 %118, %121
  %123 = srem i32 %122, 3
  %124 = icmp eq i32 %117, %123
  br i1 %124, label %125, label %128

125:                                              ; preds = %115
  %126 = load i32, ptr %8, align 4
  %127 = add nsw i32 %126, 7
  store i32 %127, ptr %8, align 4
  br label %128

128:                                              ; preds = %125, %115
  br label %129

129:                                              ; preds = %128, %107
  br label %130

130:                                              ; preds = %129
  %131 = load i32, ptr %12, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, ptr %12, align 4
  br label %47, !llvm.loop !45

133:                                              ; preds = %55
  %134 = load i32, ptr %8, align 4
  %135 = icmp sgt i32 %134, 0
  br i1 %135, label %136, label %138

136:                                              ; preds = %133
  %137 = load i32, ptr %8, align 4
  store i32 %137, ptr %.reg2mem5, align 4
  br label %141

138:                                              ; preds = %133
  %139 = load i32, ptr %8, align 4
  %140 = sub nsw i32 0, %139
  store i32 %140, ptr %.reg2mem5, align 4
  br label %141

141:                                              ; preds = %138, %136
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %142 = load ptr, ptr %9, align 8
  call void @llvm.stackrestore(ptr %142)
  ret i32 %.reload6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_101_stress_goto(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
entry:
  %.reg2mem16 = alloca i32, align 4
  %.reg2mem9 = alloca ptr, align 8
  %.reg2mem7 = alloca i32, align 4
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i64, align 8
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
  %18 = load i32, ptr %8, align 4
  %19 = load i32, ptr @g_x, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %11, align 4
  br label %21

21:                                               ; preds = %17
  %22 = load i32, ptr %7, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %21
  %25 = load i32, ptr %7, align 4
  store i32 %25, ptr %.reg2mem, align 4
  br label %27

26:                                               ; preds = %21
  store i32 1, ptr %.reg2mem, align 4
  br label %27

27:                                               ; preds = %24, %26
  %.reload = load i32, ptr %.reg2mem, align 4
  %28 = zext i32 %.reload to i64
  %29 = call ptr @llvm.stacksave()
  store ptr %29, ptr %12, align 8
  %30 = alloca i32, i64 %28, align 16
  store ptr %30, ptr %.reg2mem9, align 8
  store i64 %28, ptr %13, align 8
  br label %31

31:                                               ; preds = %27
  %32 = load i32, ptr %8, align 4
  %33 = load i32, ptr %9, align 4
  %34 = icmp sgt i32 %32, %33
  br i1 %34, label %35, label %38

35:                                               ; preds = %31
  %36 = load i32, ptr %10, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %45, label %38

38:                                               ; preds = %35, %31
  %39 = load i32, ptr %9, align 4
  %40 = load i32, ptr %10, align 4
  %41 = icmp sgt i32 %39, %40
  br i1 %41, label %42, label %46

42:                                               ; preds = %38
  %43 = load i32, ptr %8, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %42, %35
  br label %73

46:                                               ; preds = %42, %38
  store i32 0, ptr %14, align 4
  br label %47

47:                                               ; preds = %46, %65
  %48 = load i32, ptr %14, align 4
  store i32 %48, ptr %.reg2mem7, align 4
  br label %49

49:                                               ; preds = %47
  %50 = load i32, ptr %7, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %54

52:                                               ; preds = %49
  %53 = load i32, ptr %7, align 4
  store i32 %53, ptr %.reg2mem1, align 4
  br label %55

54:                                               ; preds = %49
  store i32 1, ptr %.reg2mem1, align 4
  br label %55

55:                                               ; preds = %54, %52
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %56 = icmp slt i32 %.reload8, %.reload2
  br i1 %56, label %57, label %68

57:                                               ; preds = %55
  %58 = load i32, ptr %8, align 4
  %59 = sub nsw i32 0, %58
  %60 = load i32, ptr %14, align 4
  %61 = add nsw i32 %59, %60
  %62 = load i32, ptr %14, align 4
  %63 = sext i32 %62 to i64
  %.reload15 = load ptr, ptr %.reg2mem9, align 8
  %64 = getelementptr inbounds i32, ptr %.reload15, i64 %63
  store i32 %61, ptr %64, align 4
  br label %65

65:                                               ; preds = %57
  %66 = load i32, ptr %14, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %14, align 4
  br label %47, !llvm.loop !46

68:                                               ; preds = %55
  %.reload14 = load ptr, ptr %.reg2mem9, align 8
  %69 = getelementptr inbounds i32, ptr %.reload14, i64 0
  %70 = load i32, ptr %69, align 16
  %71 = load i32, ptr %11, align 4
  %72 = sub nsw i32 %71, %70
  store i32 %72, ptr %11, align 4
  br label %156

73:                                               ; preds = %45
  store i32 0, ptr %15, align 4
  br label %74

74:                                               ; preds = %73, %132
  %75 = load i32, ptr %15, align 4
  store i32 %75, ptr %.reg2mem16, align 4
  br label %76

76:                                               ; preds = %74
  %77 = load i32, ptr %7, align 4
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %79, label %81

79:                                               ; preds = %76
  %80 = load i32, ptr %7, align 4
  store i32 %80, ptr %.reg2mem3, align 4
  br label %82

81:                                               ; preds = %76
  store i32 1, ptr %.reg2mem3, align 4
  br label %82

82:                                               ; preds = %81, %79
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload17 = load i32, ptr %.reg2mem16, align 4
  %83 = icmp slt i32 %.reload17, %.reload4
  br i1 %83, label %84, label %135

84:                                               ; preds = %82
  %85 = load i32, ptr %9, align 4
  %86 = load i32, ptr %15, align 4
  %87 = add nsw i32 %85, %86
  %88 = load i32, ptr %15, align 4
  %89 = sext i32 %88 to i64
  %.reload13 = load ptr, ptr %.reg2mem9, align 8
  %90 = getelementptr inbounds i32, ptr %.reload13, i64 %89
  store i32 %87, ptr %90, align 4
  br label %91

91:                                               ; preds = %84
  %92 = load i32, ptr %15, align 4
  %93 = sext i32 %92 to i64
  %.reload12 = load ptr, ptr %.reg2mem9, align 8
  %94 = getelementptr inbounds i32, ptr %.reload12, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = load i32, ptr @g_z, align 4
  %97 = icmp sgt i32 %95, %96
  br i1 %97, label %98, label %117

98:                                               ; preds = %91
  %99 = load ptr, ptr %6, align 8
  %100 = load i32, ptr %99, align 4
  %101 = icmp sgt i32 %100, 0
  br i1 %101, label %102, label %109

102:                                              ; preds = %98
  %103 = load i32, ptr %15, align 4
  %104 = sext i32 %103 to i64
  %.reload11 = load ptr, ptr %.reg2mem9, align 8
  %105 = getelementptr inbounds i32, ptr %.reload11, i64 %104
  %106 = load i32, ptr %105, align 4
  %107 = load i32, ptr %11, align 4
  %108 = add nsw i32 %107, %106
  store i32 %108, ptr %11, align 4
  br label %116

109:                                              ; preds = %98
  %110 = load i32, ptr %15, align 4
  %111 = sext i32 %110 to i64
  %.reload10 = load ptr, ptr %.reg2mem9, align 8
  %112 = getelementptr inbounds i32, ptr %.reload10, i64 %111
  %113 = load i32, ptr %112, align 4
  %114 = load i32, ptr %11, align 4
  %115 = sub nsw i32 %114, %113
  store i32 %115, ptr %11, align 4
  br label %116

116:                                              ; preds = %109, %102
  br label %124

117:                                              ; preds = %91
  %118 = load i32, ptr %15, align 4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %121

120:                                              ; preds = %117
  br label %125

121:                                              ; preds = %117
  %122 = load i32, ptr %11, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, ptr %11, align 4
  br label %124

124:                                              ; preds = %121, %116
  br label %125

125:                                              ; preds = %124, %120
  %126 = load i32, ptr %11, align 4
  %127 = load ptr, ptr %6, align 8
  %128 = load i32, ptr %15, align 4
  %129 = srem i32 %128, 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, ptr %127, i64 %130
  store i32 %126, ptr %131, align 4
  br label %132

132:                                              ; preds = %125
  %133 = load i32, ptr %15, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %15, align 4
  br label %74, !llvm.loop !47

135:                                              ; preds = %82
  %136 = load i32, ptr %11, align 4
  %137 = load i32, ptr @g_z, align 4
  %138 = icmp sgt i32 %136, %137
  br i1 %138, label %139, label %155

139:                                              ; preds = %135
  %140 = load i32, ptr %8, align 4
  %141 = load i32, ptr %9, align 4
  %142 = load i32, ptr %10, align 4
  %143 = sdiv i32 %142, 10
  %144 = load i32, ptr %8, align 4
  %145 = sub nsw i32 %144, 1
  %146 = mul nsw i32 %143, %145
  %147 = add nsw i32 %141, %146
  %148 = icmp eq i32 %140, %147
  br i1 %148, label %149, label %152

149:                                              ; preds = %139
  %150 = load i32, ptr %11, align 4
  %151 = add nsw i32 %150, 100
  store i32 %151, ptr %5, align 4
  store i32 1, ptr %16, align 4
  br label %166

152:                                              ; preds = %139
  %153 = load i32, ptr %11, align 4
  %154 = add nsw i32 %153, 200
  store i32 %154, ptr %5, align 4
  store i32 1, ptr %16, align 4
  br label %166

155:                                              ; preds = %135
  br label %156

156:                                              ; preds = %155, %68
  %157 = load i32, ptr %11, align 4
  %158 = icmp sgt i32 %157, 0
  br i1 %158, label %159, label %162

159:                                              ; preds = %156
  %160 = load i32, ptr %11, align 4
  %161 = mul nsw i32 %160, 2
  store i32 %161, ptr %.reg2mem5, align 4
  br label %165

162:                                              ; preds = %156
  %163 = load i32, ptr %11, align 4
  %164 = sub nsw i32 0, %163
  store i32 %164, ptr %.reg2mem5, align 4
  br label %165

165:                                              ; preds = %162, %159
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %5, align 4
  store i32 1, ptr %16, align 4
  br label %166

166:                                              ; preds = %165, %152, %149
  %167 = load ptr, ptr %12, align 8
  call void @llvm.stackrestore(ptr %167)
  %168 = load i32, ptr %5, align 4
  ret i32 %168
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
  br label %8

8:                                                ; preds = %entry
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %17

12:                                               ; preds = %9
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 1
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 @atoi(ptr noundef %15) #8
  store i32 %16, ptr %.reg2mem, align 4
  br label %18

17:                                               ; preds = %9
  store i32 4, ptr %.reg2mem, align 4
  br label %18

18:                                               ; preds = %12, %17
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %19 = load i32, ptr %5, align 4
  %20 = call i32 @_0_if_only(i32 noundef %19)
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %5, align 4
  %24 = call i32 @_1_if_else(i32 noundef %23)
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %6, align 4
  %27 = load i32, ptr %5, align 4
  %28 = call i32 @_2_if_with_surrounding_code(i32 noundef %27)
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %6, align 4
  %31 = load i32, ptr %5, align 4
  %32 = call i32 @_3_if_compound(i32 noundef %31)
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %6, align 4
  %35 = load i32, ptr %5, align 4
  %36 = call i32 @_4_if_else_compound(i32 noundef %35)
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %6, align 4
  %39 = load i32, ptr %5, align 4
  %40 = call i32 @_5_if_equal(i32 noundef %39, i32 noundef 4)
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, ptr %6, align 4
  %43 = load i32, ptr %5, align 4
  %44 = call i32 @_6_if_not_equal(i32 noundef %43, i32 noundef 4)
  %45 = load i32, ptr %6, align 4
  %46 = add nsw i32 %45, %44
  store i32 %46, ptr %6, align 4
  %47 = load i32, ptr %5, align 4
  %48 = call i32 @_7_relational(i32 noundef %47, i32 noundef 4)
  %49 = load i32, ptr %6, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %6, align 4
  %51 = load i32, ptr %5, align 4
  %52 = icmp sgt i32 %51, 0
  %53 = load i32, ptr %5, align 4
  %54 = call i32 @_8_boolean_argument(i1 noundef zeroext %52, i32 noundef %53)
  %55 = load i32, ptr %6, align 4
  %56 = add nsw i32 %55, %54
  store i32 %56, ptr %6, align 4
  %57 = load i32, ptr %5, align 4
  %58 = call i32 @_9_if_elseif_else(i32 noundef %57)
  %59 = load i32, ptr %6, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %6, align 4
  %61 = load i32, ptr %5, align 4
  %62 = call i32 @_10_multiple_elseif(i32 noundef %61)
  %63 = load i32, ptr %6, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %6, align 4
  %65 = load i32, ptr %5, align 4
  %66 = call i32 @_11_elseif_expressions(i32 noundef %65, i32 noundef 4)
  %67 = load i32, ptr %6, align 4
  %68 = add nsw i32 %67, %66
  store i32 %68, ptr %6, align 4
  %69 = load i32, ptr %5, align 4
  %70 = call i32 @_12_and(i32 noundef %69, i32 noundef 3)
  %71 = load i32, ptr %6, align 4
  %72 = add nsw i32 %71, %70
  store i32 %72, ptr %6, align 4
  %73 = load i32, ptr %5, align 4
  %74 = call i32 @_13_or(i32 noundef %73, i32 noundef -3)
  %75 = load i32, ptr %6, align 4
  %76 = add nsw i32 %75, %74
  store i32 %76, ptr %6, align 4
  %77 = load i32, ptr %5, align 4
  %78 = call i32 @_14_and_or(i32 noundef %77, i32 noundef 2, i32 noundef -1)
  %79 = load i32, ptr %6, align 4
  %80 = add nsw i32 %79, %78
  store i32 %80, ptr %6, align 4
  %81 = load i32, ptr %5, align 4
  %82 = call i32 @_15_or_and(i32 noundef %81, i32 noundef 0, i32 noundef 20)
  %83 = load i32, ptr %6, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, ptr %6, align 4
  %85 = load i32, ptr %5, align 4
  %86 = call i32 @_16_complex_boolean(i32 noundef %85, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %87 = load i32, ptr %6, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, ptr %6, align 4
  %89 = load i32, ptr %5, align 4
  %90 = call i32 @_17_nested_arithmetic_condition(i32 noundef %89, i32 noundef 1, i32 noundef 20)
  %91 = load i32, ptr %6, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %6, align 4
  %93 = load i32, ptr %5, align 4
  %94 = call i32 @_18_deep_parentheses(i32 noundef %93, i32 noundef 2, i32 noundef 3)
  %95 = load i32, ptr %6, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, ptr %6, align 4
  %97 = load i32, ptr %5, align 4
  %98 = call i32 @_19_arithmetic_boolean(i32 noundef %97, i32 noundef 2, i32 noundef 5)
  %99 = load i32, ptr %6, align 4
  %100 = add nsw i32 %99, %98
  store i32 %100, ptr %6, align 4
  %101 = load i32, ptr %5, align 4
  %102 = call i32 @_20_nested_boolean_parentheses(i32 noundef %101, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %103 = load i32, ptr %6, align 4
  %104 = add nsw i32 %103, %102
  store i32 %104, ptr %6, align 4
  %105 = load i32, ptr %5, align 4
  %106 = call i32 @_21_nested_if(i32 noundef %105, i32 noundef 3)
  %107 = load i32, ptr %6, align 4
  %108 = add nsw i32 %107, %106
  store i32 %108, ptr %6, align 4
  %109 = load i32, ptr %5, align 4
  %110 = call i32 @_22_nested_in_else(i32 noundef %109, i32 noundef 3)
  %111 = load i32, ptr %6, align 4
  %112 = add nsw i32 %111, %110
  store i32 %112, ptr %6, align 4
  %113 = load i32, ptr %5, align 4
  %114 = call i32 @_23_nested_if_else(i32 noundef %113, i32 noundef 3, i32 noundef 5)
  %115 = load i32, ptr %6, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %6, align 4
  %117 = load i32, ptr %5, align 4
  %118 = call i32 @_24_three_level_nesting(i32 noundef %117, i32 noundef 3, i32 noundef 5)
  %119 = load i32, ptr %6, align 4
  %120 = add nsw i32 %119, %118
  store i32 %120, ptr %6, align 4
  %121 = load i32, ptr %5, align 4
  %122 = call i32 @_25_deep_nested_values(i32 noundef %121, i32 noundef 3, i32 noundef 10)
  %123 = load i32, ptr %6, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, ptr %6, align 4
  %125 = load i32, ptr %5, align 4
  %126 = call i32 @_26_nested_and(i32 noundef %125, i32 noundef 3, i32 noundef 5)
  %127 = load i32, ptr %6, align 4
  %128 = add nsw i32 %127, %126
  store i32 %128, ptr %6, align 4
  %129 = load i32, ptr %5, align 4
  %130 = call i32 @_27_nested_or(i32 noundef %129, i32 noundef 0, i32 noundef 20)
  %131 = load i32, ptr %6, align 4
  %132 = add nsw i32 %131, %130
  store i32 %132, ptr %6, align 4
  %133 = load i32, ptr %5, align 4
  %134 = call i32 @_28_nested_complex_boolean(i32 noundef %133, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %135 = load i32, ptr %6, align 4
  %136 = add nsw i32 %135, %134
  store i32 %136, ptr %6, align 4
  %137 = load i32, ptr %5, align 4
  %138 = call i32 @_29_independent_ifs(i32 noundef %137)
  %139 = load i32, ptr %6, align 4
  %140 = add nsw i32 %139, %138
  store i32 %140, ptr %6, align 4
  %141 = load i32, ptr %5, align 4
  %142 = call i32 @_30_independent_if_else(i32 noundef %141, i32 noundef 3)
  %143 = load i32, ptr %6, align 4
  %144 = add nsw i32 %143, %142
  store i32 %144, ptr %6, align 4
  %145 = call i32 @_31_array_condition(i32 noundef 1)
  %146 = load i32, ptr %6, align 4
  %147 = add nsw i32 %146, %145
  store i32 %147, ptr %6, align 4
  %148 = call i32 @_32_array_branches(i32 noundef 2)
  %149 = load i32, ptr %6, align 4
  %150 = add nsw i32 %149, %148
  store i32 %150, ptr %6, align 4
  %151 = call i32 @_33_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %152 = load i32, ptr %6, align 4
  %153 = add nsw i32 %152, %151
  store i32 %153, ptr %6, align 4
  %154 = call i32 @_34_matrix_condition(i32 noundef 1, i32 noundef 1)
  %155 = load i32, ptr %6, align 4
  %156 = add nsw i32 %155, %154
  store i32 %156, ptr %6, align 4
  %157 = call i32 @_35_nested_array(i32 noundef 1, i32 noundef 2)
  %158 = load i32, ptr %6, align 4
  %159 = add nsw i32 %158, %157
  store i32 %159, ptr %6, align 4
  %160 = load i32, ptr %5, align 4
  store i32 %160, ptr %7, align 4
  %161 = call i32 @_36_pointer_condition(ptr noundef %7)
  %162 = load i32, ptr %6, align 4
  %163 = add nsw i32 %162, %161
  store i32 %163, ptr %6, align 4
  %164 = call i32 @_37_pointer_branches(ptr noundef %7)
  %165 = load i32, ptr %6, align 4
  %166 = add nsw i32 %165, %164
  store i32 %166, ptr %6, align 4
  %167 = call i32 @_38_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %168 = load i32, ptr %6, align 4
  %169 = add nsw i32 %168, %167
  store i32 %169, ptr %6, align 4
  %170 = call i32 @_39_nested_pointer(ptr noundef %7, i32 noundef 3)
  %171 = load i32, ptr %6, align 4
  %172 = add nsw i32 %171, %170
  store i32 %172, ptr %6, align 4
  %173 = load i32, ptr %5, align 4
  store i32 %173, ptr %7, align 4
  %174 = load i32, ptr %5, align 4
  %175 = call i32 @_40_pointer_write(ptr noundef %7, i32 noundef %174)
  %176 = load i32, ptr %6, align 4
  %177 = add nsw i32 %176, %175
  store i32 %177, ptr %6, align 4
  %178 = load i32, ptr %5, align 4
  store i32 %178, ptr %7, align 4
  %179 = load i32, ptr %5, align 4
  %180 = call i32 @_41_pointer_write_nested(ptr noundef %7, i32 noundef %179, i32 noundef 3)
  %181 = load i32, ptr %6, align 4
  %182 = add nsw i32 %181, %180
  store i32 %182, ptr %6, align 4
  %183 = load i32, ptr %5, align 4
  store i32 %183, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  br label %184

184:                                              ; preds = %18
  %185 = load i32, ptr %5, align 4
  %186 = icmp sgt i32 %185, 0
  br i1 %186, label %187, label %192

187:                                              ; preds = %184
  %188 = load i32, ptr %5, align 4
  %189 = icmp slt i32 %188, 8
  br i1 %189, label %190, label %192

190:                                              ; preds = %187
  %191 = load i32, ptr %5, align 4
  store i32 %191, ptr %.reg2mem1, align 4
  br label %193

192:                                              ; preds = %187, %184
  store i32 4, ptr %.reg2mem1, align 4
  br label %193

193:                                              ; preds = %192, %190
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr @g_n, align 4
  %194 = call i32 @_42_global_only()
  %195 = load i32, ptr %6, align 4
  %196 = add nsw i32 %195, %194
  store i32 %196, ptr %6, align 4
  %197 = call i32 @_43_global_and()
  %198 = load i32, ptr %6, align 4
  %199 = add nsw i32 %198, %197
  store i32 %199, ptr %6, align 4
  %200 = call i32 @_44_global_or()
  %201 = load i32, ptr %6, align 4
  %202 = add nsw i32 %201, %200
  store i32 %202, ptr %6, align 4
  %203 = call i32 @_45_global_nested()
  %204 = load i32, ptr %6, align 4
  %205 = add nsw i32 %204, %203
  store i32 %205, ptr %6, align 4
  %206 = call i32 @_46_global_array_only()
  %207 = load i32, ptr %6, align 4
  %208 = add nsw i32 %207, %206
  store i32 %208, ptr %6, align 4
  %209 = call i32 @_47_global_matrix_only()
  %210 = load i32, ptr %6, align 4
  %211 = add nsw i32 %210, %209
  store i32 %211, ptr %6, align 4
  %212 = load i32, ptr %5, align 4
  %213 = call i32 @_48_multiple_returns(i32 noundef %212)
  %214 = load i32, ptr %6, align 4
  %215 = add nsw i32 %214, %213
  store i32 %215, ptr %6, align 4
  %216 = load i32, ptr %5, align 4
  %217 = call i32 @_49_nested_multiple_returns(i32 noundef %216, i32 noundef 3)
  %218 = load i32, ptr %6, align 4
  %219 = add nsw i32 %218, %217
  store i32 %219, ptr %6, align 4
  %220 = load i32, ptr %5, align 4
  %221 = call i32 @_50_complex_multiple_returns(i32 noundef %220, i32 noundef 3, i32 noundef 5)
  %222 = load i32, ptr %6, align 4
  %223 = add nsw i32 %222, %221
  store i32 %223, ptr %6, align 4
  %224 = load i32, ptr %5, align 4
  %225 = call i32 @_51_prefix_code(i32 noundef %224, i32 noundef 2, i32 noundef 3)
  %226 = load i32, ptr %6, align 4
  %227 = add nsw i32 %226, %225
  store i32 %227, ptr %6, align 4
  %228 = load i32, ptr %5, align 4
  %229 = call i32 @_52_suffix_code(i32 noundef %228, i32 noundef 3)
  %230 = load i32, ptr %6, align 4
  %231 = add nsw i32 %230, %229
  store i32 %231, ptr %6, align 4
  %232 = load i32, ptr %5, align 4
  %233 = call i32 @_53_prefix_nested_suffix(i32 noundef %232, i32 noundef 3, i32 noundef 5)
  %234 = load i32, ptr %6, align 4
  %235 = add nsw i32 %234, %233
  store i32 %235, ptr %6, align 4
  %236 = load i32, ptr %5, align 4
  %237 = call i32 @_54_diamond(i32 noundef %236, i32 noundef 3)
  %238 = load i32, ptr %6, align 4
  %239 = add nsw i32 %238, %237
  store i32 %239, ptr %6, align 4
  %240 = load i32, ptr %5, align 4
  %241 = call i32 @_55_multiple_merge_values(i32 noundef %240, i32 noundef 3)
  %242 = load i32, ptr %6, align 4
  %243 = add nsw i32 %242, %241
  store i32 %243, ptr %6, align 4
  %244 = load i32, ptr %5, align 4
  %245 = call i32 @_56_nested_diamonds(i32 noundef %244, i32 noundef 3, i32 noundef 5)
  %246 = load i32, ptr %6, align 4
  %247 = add nsw i32 %246, %245
  store i32 %247, ptr %6, align 4
  %248 = load i32, ptr %5, align 4
  %249 = call i32 @_57_ternary_before_if(i32 noundef %248, i32 noundef 3)
  %250 = load i32, ptr %6, align 4
  %251 = add nsw i32 %250, %249
  store i32 %251, ptr %6, align 4
  %252 = load i32, ptr %5, align 4
  %253 = call i32 @_58_ternary_inside_if(i32 noundef %252, i32 noundef 3)
  %254 = load i32, ptr %6, align 4
  %255 = add nsw i32 %254, %253
  store i32 %255, ptr %6, align 4
  %256 = load i32, ptr %5, align 4
  %257 = call i32 @_59_nested_ternary_if(i32 noundef %256, i32 noundef 3, i32 noundef 5)
  %258 = load i32, ptr %6, align 4
  %259 = add nsw i32 %258, %257
  store i32 %259, ptr %6, align 4
  %260 = load i32, ptr %5, align 4
  %261 = call i32 @_60_dynamic_alloca(i32 noundef 4, i32 noundef %260)
  %262 = load i32, ptr %6, align 4
  %263 = add nsw i32 %262, %261
  store i32 %263, ptr %6, align 4
  %264 = load i32, ptr %5, align 4
  %265 = call i32 @_61_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %264)
  %266 = load i32, ptr %6, align 4
  %267 = add nsw i32 %266, %265
  store i32 %267, ptr %6, align 4
  %268 = load i32, ptr %5, align 4
  %269 = call i32 @_62_dynamic_alloca_complex(i32 noundef 6, i32 noundef %268, i32 noundef 3)
  %270 = load i32, ptr %6, align 4
  %271 = add nsw i32 %270, %269
  store i32 %271, ptr %6, align 4
  %272 = load i32, ptr %5, align 4
  %273 = call i32 @_63_malloc_if(i32 noundef 4, i32 noundef %272)
  %274 = load i32, ptr %6, align 4
  %275 = add nsw i32 %274, %273
  store i32 %275, ptr %6, align 4
  %276 = load i32, ptr %5, align 4
  %277 = call i32 @_64_malloc_nested_if(i32 noundef 4, i32 noundef %276, i32 noundef 3)
  %278 = load i32, ptr %6, align 4
  %279 = add nsw i32 %278, %277
  store i32 %279, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %280 = load i32, ptr %5, align 4
  call void @_65_void_if(i32 noundef %280)
  %281 = load i32, ptr %5, align 4
  call void @_66_void_if_else(i32 noundef %281)
  %282 = load i32, ptr %5, align 4
  call void @_67_void_nested(i32 noundef %282, i32 noundef 3)
  %283 = load i32, ptr %5, align 4
  call void @_68_void_complex(i32 noundef %283, i32 noundef 3, i32 noundef 0)
  call void @_69_void_global_only()
  %284 = load i32, ptr %5, align 4
  store i32 %284, ptr %7, align 4
  %285 = load i32, ptr %5, align 4
  call void @_70_void_pointer(ptr noundef %7, i32 noundef %285)
  %286 = load i32, ptr %5, align 4
  call void @_71_void_array(i32 noundef 1, i32 noundef %286)
  %287 = load i32, ptr @g_void_result, align 4
  %288 = load i32, ptr %6, align 4
  %289 = add nsw i32 %288, %287
  store i32 %289, ptr %6, align 4
  %290 = load i32, ptr %5, align 4
  store i32 %290, ptr %7, align 4
  %291 = load i32, ptr %5, align 4
  %292 = call i32 @_72_complex_control_flow(ptr noundef %7, i32 noundef 1, i32 noundef %291, i32 noundef 3)
  %293 = load i32, ptr %6, align 4
  %294 = add nsw i32 %293, %292
  store i32 %294, ptr %6, align 4
  %295 = load i32, ptr %5, align 4
  %296 = call i32 @_73_complex_merge(i32 noundef %295, i32 noundef 3, i32 noundef 5)
  %297 = load i32, ptr %6, align 4
  %298 = add nsw i32 %297, %296
  store i32 %298, ptr %6, align 4
  %299 = load i32, ptr %5, align 4
  %300 = call i32 @_74_if_stress(ptr noundef %7, i32 noundef 1, i32 noundef %299, i32 noundef 3, i32 noundef 5)
  %301 = load i32, ptr %6, align 4
  %302 = add nsw i32 %301, %300
  store i32 %302, ptr %6, align 4
  %303 = load i32, ptr %5, align 4
  %304 = call i32 @_75_for_simple(i32 noundef 4, i32 noundef %303)
  %305 = load i32, ptr %6, align 4
  %306 = add nsw i32 %305, %304
  store i32 %306, ptr %6, align 4
  %307 = load i32, ptr %5, align 4
  %308 = call i32 @_76_while_simple(i32 noundef 4, i32 noundef %307)
  %309 = load i32, ptr %6, align 4
  %310 = add nsw i32 %309, %308
  store i32 %310, ptr %6, align 4
  %311 = load i32, ptr %5, align 4
  %312 = call i32 @_77_do_while(i32 noundef 4, i32 noundef %311)
  %313 = load i32, ptr %6, align 4
  %314 = add nsw i32 %313, %312
  store i32 %314, ptr %6, align 4
  %315 = call i32 @_78_nested_loops(i32 noundef 3, i32 noundef 4)
  %316 = load i32, ptr %6, align 4
  %317 = add nsw i32 %316, %315
  store i32 %317, ptr %6, align 4
  %318 = call i32 @_79_nested_loop_if(i32 noundef 3, i32 noundef 4)
  %319 = load i32, ptr %6, align 4
  %320 = add nsw i32 %319, %318
  store i32 %320, ptr %6, align 4
  %321 = call i32 @_80_break(i32 noundef 6)
  %322 = load i32, ptr %6, align 4
  %323 = add nsw i32 %322, %321
  store i32 %323, ptr %6, align 4
  %324 = call i32 @_81_continue(i32 noundef 6)
  %325 = load i32, ptr %6, align 4
  %326 = add nsw i32 %325, %324
  store i32 %326, ptr %6, align 4
  %327 = load i32, ptr %5, align 4
  %328 = call i32 @_82_loop_complex_condition(i32 noundef 6, i32 noundef %327)
  %329 = load i32, ptr %6, align 4
  %330 = add nsw i32 %329, %328
  store i32 %330, ptr %6, align 4
  %331 = call i32 @_83_loop_global_array()
  %332 = load i32, ptr %6, align 4
  %333 = add nsw i32 %332, %331
  store i32 %333, ptr %6, align 4
  %334 = load i32, ptr %5, align 4
  %335 = call i32 @_84_loop_pointer(i32 noundef 5, i32 noundef %334)
  %336 = load i32, ptr %6, align 4
  %337 = add nsw i32 %336, %335
  store i32 %337, ptr %6, align 4
  %338 = load i32, ptr %5, align 4
  %339 = call i32 @_85_loop_surrounding_code(i32 noundef 4, i32 noundef %338)
  %340 = load i32, ptr %6, align 4
  %341 = add nsw i32 %340, %339
  store i32 %341, ptr %6, align 4
  %342 = call i32 @_86_triple_nested(i32 noundef 2, i32 noundef 3, i32 noundef 2)
  %343 = load i32, ptr %6, align 4
  %344 = add nsw i32 %343, %342
  store i32 %344, ptr %6, align 4
  %345 = load i32, ptr %5, align 4
  %346 = call i32 @_87_if_OR3(i32 noundef %345, i32 noundef 3, i32 noundef -5)
  %347 = load i32, ptr %6, align 4
  %348 = add nsw i32 %347, %346
  store i32 %348, ptr %6, align 4
  %349 = load i32, ptr %5, align 4
  %350 = call i32 @_88_if_OR3_vla(i32 noundef %349, i32 noundef 3, i32 noundef -5)
  %351 = load i32, ptr %6, align 4
  %352 = add nsw i32 %351, %350
  store i32 %352, ptr %6, align 4
  %353 = load i32, ptr %5, align 4
  %354 = call i32 @_89_loop_vla(i32 noundef 4, i32 noundef %353)
  %355 = load i32, ptr %6, align 4
  %356 = add nsw i32 %355, %354
  store i32 %356, ptr %6, align 4
  %357 = load i32, ptr %5, align 4
  %358 = call i32 @_90_vla_nested_loop(i32 noundef 4, i32 noundef %357)
  %359 = load i32, ptr %6, align 4
  %360 = add nsw i32 %359, %358
  store i32 %360, ptr %6, align 4
  %361 = load i32, ptr %5, align 4
  %362 = call i32 @_91_alloca_inside_loop(i32 noundef 4, i32 noundef %361)
  %363 = load i32, ptr %6, align 4
  %364 = add nsw i32 %363, %362
  store i32 %364, ptr %6, align 4
  %365 = load i32, ptr %5, align 4
  %366 = call i32 @_92_vla_size_from_loop(i32 noundef 5, i32 noundef %365)
  %367 = load i32, ptr %6, align 4
  %368 = add nsw i32 %367, %366
  store i32 %368, ptr %6, align 4
  %369 = call i32 @_93_global_loop()
  %370 = load i32, ptr %6, align 4
  %371 = add nsw i32 %370, %369
  store i32 %371, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %372 = load i32, ptr %5, align 4
  call void @_94_void_loop(i32 noundef 4, i32 noundef %372)
  %373 = load i32, ptr %5, align 4
  store i32 %373, ptr %7, align 4
  %374 = load i32, ptr %5, align 4
  call void @_95_void_loop_pointer(ptr noundef %7, i32 noundef 4, i32 noundef %374)
  %375 = load i32, ptr @g_void_result, align 4
  %376 = load i32, ptr %6, align 4
  %377 = add nsw i32 %376, %375
  store i32 %377, ptr %6, align 4
  %378 = load i32, ptr %5, align 4
  %379 = call i32 @_96_goto_break(i32 noundef 6, i32 noundef %378)
  %380 = load i32, ptr %6, align 4
  %381 = add nsw i32 %380, %379
  store i32 %381, ptr %6, align 4
  %382 = load i32, ptr %5, align 4
  %383 = call i32 @_97_goto_nested_loop(i32 noundef 5, i32 noundef %382)
  %384 = load i32, ptr %6, align 4
  %385 = add nsw i32 %384, %383
  store i32 %385, ptr %6, align 4
  %386 = load i32, ptr %5, align 4
  %387 = call i32 @_98_goto_vla(i32 noundef 4, i32 noundef %386)
  %388 = load i32, ptr %6, align 4
  %389 = add nsw i32 %388, %387
  store i32 %389, ptr %6, align 4
  %390 = load i32, ptr %5, align 4
  %391 = call i32 @_99_malloc_loop(i32 noundef 4, i32 noundef %390)
  %392 = load i32, ptr %6, align 4
  %393 = add nsw i32 %392, %391
  store i32 %393, ptr %6, align 4
  %394 = load i32, ptr %5, align 4
  store i32 %394, ptr %7, align 4
  %395 = load i32, ptr %5, align 4
  %396 = call i32 @_100_stress(ptr noundef %7, i32 noundef 4, i32 noundef %395, i32 noundef 3)
  %397 = load i32, ptr %6, align 4
  %398 = add nsw i32 %397, %396
  store i32 %398, ptr %6, align 4
  %399 = load i32, ptr %5, align 4
  store i32 %399, ptr %7, align 4
  %400 = load i32, ptr %5, align 4
  %401 = call i32 @_101_stress_goto(ptr noundef %7, i32 noundef 4, i32 noundef %400, i32 noundef 3, i32 noundef 5)
  %402 = load i32, ptr %6, align 4
  %403 = add nsw i32 %402, %401
  store i32 %403, ptr %6, align 4
  %404 = load i32, ptr %5, align 4
  %405 = call i32 @_102_oneblock(i32 noundef %404)
  %406 = load i32, ptr %6, align 4
  %407 = add nsw i32 %406, %405
  store i32 %407, ptr %6, align 4
  %408 = load i32, ptr %6, align 4
  %409 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %408)
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
