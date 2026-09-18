; ModuleID = '_00_all.bc'
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
  %16 = call noalias ptr @malloc(i64 noundef %15) #7
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
  call void @free(ptr noundef %44) #8
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
  %18 = call noalias ptr @malloc(i64 noundef %17) #7
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
  call void @free(ptr noundef %57) #8
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
  %18 = call noalias ptr @malloc(i64 noundef %17) #7
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
  call void @free(ptr noundef %69) #8
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
define dso_local i32 @_103_switch_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %34 [
    i32 0, label %7
    i32 1, label %17
    i32 2, label %25
  ]

7:                                                ; preds = %5
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %4, align 4
  br label %16

13:                                               ; preds = %7
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 2
  store i32 %15, ptr %4, align 4
  br label %16

16:                                               ; preds = %13, %10
  br label %37

17:                                               ; preds = %5
  %18 = load i32, ptr %3, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  store i32 100, ptr %4, align 4
  br label %24

21:                                               ; preds = %17
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 100
  store i32 %23, ptr %4, align 4
  br label %24

24:                                               ; preds = %21, %20
  br label %37

25:                                               ; preds = %5
  %26 = load i32, ptr %3, align 4
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %25
  %29 = load i32, ptr %3, align 4
  %30 = sub nsw i32 0, %29
  store i32 %30, ptr %4, align 4
  br label %33

31:                                               ; preds = %25
  %32 = load i32, ptr %3, align 4
  store i32 %32, ptr %4, align 4
  br label %33

33:                                               ; preds = %31, %28
  br label %37

34:                                               ; preds = %5
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, 10
  store i32 %36, ptr %4, align 4
  br label %37

37:                                               ; preds = %34, %33, %24, %16
  %38 = load i32, ptr %4, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_104_switch_nested_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %43 [
    i32 0, label %9
    i32 1, label %28
  ]

9:                                                ; preds = %7
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %12
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %6, align 4
  br label %23

19:                                               ; preds = %12
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %5, align 4
  %22 = sub nsw i32 %20, %21
  store i32 %22, ptr %6, align 4
  br label %23

23:                                               ; preds = %19, %15
  br label %27

24:                                               ; preds = %9
  %25 = load i32, ptr %4, align 4
  %26 = sub nsw i32 0, %25
  store i32 %26, ptr %6, align 4
  br label %27

27:                                               ; preds = %24, %23
  br label %53

28:                                               ; preds = %7
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %5, align 4
  %31 = icmp eq i32 %29, %30
  br i1 %31, label %32, label %38

32:                                               ; preds = %28
  %33 = load i32, ptr %4, align 4
  %34 = icmp sgt i32 %33, 10
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  store i32 100, ptr %6, align 4
  br label %37

36:                                               ; preds = %32
  store i32 200, ptr %6, align 4
  br label %37

37:                                               ; preds = %36, %35
  br label %42

38:                                               ; preds = %28
  %39 = load i32, ptr %4, align 4
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %39, %40
  store i32 %41, ptr %6, align 4
  br label %42

42:                                               ; preds = %38, %37
  br label %53

43:                                               ; preds = %7
  %44 = load i32, ptr %5, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %50

46:                                               ; preds = %43
  %47 = load i32, ptr %4, align 4
  %48 = load i32, ptr %5, align 4
  %49 = sdiv i32 %47, %48
  store i32 %49, ptr %6, align 4
  br label %52

50:                                               ; preds = %43
  %51 = load i32, ptr %4, align 4
  store i32 %51, ptr %6, align 4
  br label %52

52:                                               ; preds = %50, %46
  br label %53

53:                                               ; preds = %52, %42, %27
  %54 = load i32, ptr %6, align 4
  ret i32 %54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_105_switch_ternary(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
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
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %35 [
    i32 0, label %9
    i32 1, label %18
    i32 2, label %29
  ]

9:                                                ; preds = %7
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  store i32 %14, ptr %.reg2mem, align 4
  br label %17

15:                                               ; preds = %9
  %16 = load i32, ptr %5, align 4
  store i32 %16, ptr %.reg2mem, align 4
  br label %17

17:                                               ; preds = %15, %13
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %6, align 4
  br label %47

18:                                               ; preds = %7
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %25

22:                                               ; preds = %18
  %23 = load i32, ptr %4, align 4
  %24 = mul nsw i32 %23, 2
  store i32 %24, ptr %.reg2mem1, align 4
  br label %28

25:                                               ; preds = %18
  %26 = load i32, ptr %5, align 4
  %27 = mul nsw i32 %26, 2
  store i32 %27, ptr %.reg2mem1, align 4
  br label %28

28:                                               ; preds = %25, %22
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  br label %47

29:                                               ; preds = %7
  %30 = load i32, ptr %4, align 4
  %31 = load i32, ptr %5, align 4
  %32 = icmp eq i32 %30, %31
  %33 = zext i1 %32 to i64
  %34 = select i1 %32, i32 100, i32 -100
  store i32 %34, ptr %6, align 4
  br label %47

35:                                               ; preds = %7
  %36 = load i32, ptr %4, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %42

38:                                               ; preds = %35
  %39 = load i32, ptr %4, align 4
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %39, %40
  store i32 %41, ptr %.reg2mem3, align 4
  br label %46

42:                                               ; preds = %35
  %43 = load i32, ptr %4, align 4
  %44 = load i32, ptr %5, align 4
  %45 = sub nsw i32 %43, %44
  store i32 %45, ptr %.reg2mem3, align 4
  br label %46

46:                                               ; preds = %42, %38
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %6, align 4
  br label %47

47:                                               ; preds = %46, %29, %28, %17
  %48 = load i32, ptr %6, align 4
  ret i32 %48
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_106_switch_nested_ternary(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem15 = alloca i32, align 4
  %.reg2mem13 = alloca i32, align 4
  %.reg2mem11 = alloca i32, align 4
  %.reg2mem9 = alloca i32, align 4
  %.reg2mem7 = alloca i32, align 4
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
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
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %77 [
    i32 0, label %11
    i32 1, label %34
    i32 2, label %60
  ]

11:                                               ; preds = %9
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %6, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %15, label %24

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %7, align 4
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %15
  %20 = load i32, ptr %5, align 4
  store i32 %20, ptr %.reg2mem, align 4
  br label %23

21:                                               ; preds = %15
  %22 = load i32, ptr %7, align 4
  store i32 %22, ptr %.reg2mem, align 4
  br label %23

23:                                               ; preds = %21, %19
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem3, align 4
  br label %33

24:                                               ; preds = %11
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %7, align 4
  %27 = icmp sgt i32 %25, %26
  br i1 %27, label %28, label %30

28:                                               ; preds = %24
  %29 = load i32, ptr %6, align 4
  store i32 %29, ptr %.reg2mem1, align 4
  br label %32

30:                                               ; preds = %24
  %31 = load i32, ptr %7, align 4
  store i32 %31, ptr %.reg2mem1, align 4
  br label %32

32:                                               ; preds = %30, %28
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  br label %33

33:                                               ; preds = %32, %23
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %8, align 4
  br label %91

34:                                               ; preds = %9
  %35 = load i32, ptr %5, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %49

37:                                               ; preds = %34
  %38 = load i32, ptr %6, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %44

40:                                               ; preds = %37
  %41 = load i32, ptr %5, align 4
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %41, %42
  store i32 %43, ptr %.reg2mem5, align 4
  br label %48

44:                                               ; preds = %37
  %45 = load i32, ptr %5, align 4
  %46 = load i32, ptr %6, align 4
  %47 = sub nsw i32 %45, %46
  store i32 %47, ptr %.reg2mem5, align 4
  br label %48

48:                                               ; preds = %44, %40
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %.reg2mem9, align 4
  br label %59

49:                                               ; preds = %34
  %50 = load i32, ptr %7, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %49
  %53 = load i32, ptr %7, align 4
  %54 = mul nsw i32 %53, 2
  store i32 %54, ptr %.reg2mem7, align 4
  br label %58

55:                                               ; preds = %49
  %56 = load i32, ptr %7, align 4
  %57 = sub nsw i32 %56, 2
  store i32 %57, ptr %.reg2mem7, align 4
  br label %58

58:                                               ; preds = %55, %52
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  store i32 %.reload8, ptr %.reg2mem9, align 4
  br label %59

59:                                               ; preds = %58, %48
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  store i32 %.reload10, ptr %8, align 4
  br label %91

60:                                               ; preds = %9
  %61 = load i32, ptr %5, align 4
  %62 = load i32, ptr %6, align 4
  %63 = icmp eq i32 %61, %62
  br i1 %63, label %64, label %70

64:                                               ; preds = %60
  %65 = load i32, ptr %6, align 4
  %66 = load i32, ptr %7, align 4
  %67 = icmp eq i32 %65, %66
  %68 = zext i1 %67 to i64
  %69 = select i1 %67, i32 1, i32 2
  store i32 %69, ptr %.reg2mem11, align 4
  br label %76

70:                                               ; preds = %60
  %71 = load i32, ptr %5, align 4
  %72 = load i32, ptr %7, align 4
  %73 = icmp eq i32 %71, %72
  %74 = zext i1 %73 to i64
  %75 = select i1 %73, i32 3, i32 4
  store i32 %75, ptr %.reg2mem11, align 4
  br label %76

76:                                               ; preds = %70, %64
  %.reload12 = load i32, ptr %.reg2mem11, align 4
  store i32 %.reload12, ptr %8, align 4
  br label %91

77:                                               ; preds = %9
  %78 = load i32, ptr %5, align 4
  %79 = icmp sgt i32 %78, 0
  br i1 %79, label %80, label %82

80:                                               ; preds = %77
  %81 = load i32, ptr %5, align 4
  store i32 %81, ptr %.reg2mem15, align 4
  br label %90

82:                                               ; preds = %77
  %83 = load i32, ptr %6, align 4
  %84 = icmp sgt i32 %83, 0
  br i1 %84, label %85, label %87

85:                                               ; preds = %82
  %86 = load i32, ptr %6, align 4
  store i32 %86, ptr %.reg2mem13, align 4
  br label %89

87:                                               ; preds = %82
  %88 = load i32, ptr %7, align 4
  store i32 %88, ptr %.reg2mem13, align 4
  br label %89

89:                                               ; preds = %87, %85
  %.reload14 = load i32, ptr %.reg2mem13, align 4
  store i32 %.reload14, ptr %.reg2mem15, align 4
  br label %90

90:                                               ; preds = %89, %80
  %.reload16 = load i32, ptr %.reg2mem15, align 4
  store i32 %.reload16, ptr %8, align 4
  br label %91

91:                                               ; preds = %90, %76, %59, %33
  %92 = load i32, ptr %8, align 4
  ret i32 %92
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_107_switch_for(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 0, ptr %6, align 4
  %12 = load i32, ptr %3, align 4
  switch i32 %12, label %61 [
    i32 0, label %13
    i32 1, label %28
    i32 2, label %43
  ]

13:                                               ; preds = %11
  store i32 0, ptr %7, align 4
  br label %14

14:                                               ; preds = %24, %13
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %27

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %6, align 4
  br label %24

24:                                               ; preds = %18
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %7, align 4
  br label %14, !llvm.loop !48

27:                                               ; preds = %14
  br label %74

28:                                               ; preds = %11
  store i32 0, ptr %8, align 4
  br label %29

29:                                               ; preds = %39, %28
  %30 = load i32, ptr %8, align 4
  %31 = load i32, ptr %4, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %42

33:                                               ; preds = %29
  %34 = load i32, ptr %5, align 4
  %35 = load i32, ptr %8, align 4
  %36 = mul nsw i32 %34, %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %6, align 4
  br label %39

39:                                               ; preds = %33
  %40 = load i32, ptr %8, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %8, align 4
  br label %29, !llvm.loop !49

42:                                               ; preds = %29
  br label %74

43:                                               ; preds = %11
  store i32 0, ptr %9, align 4
  br label %44

44:                                               ; preds = %57, %43
  %45 = load i32, ptr %9, align 4
  %46 = load i32, ptr %4, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %60

48:                                               ; preds = %44
  %49 = load i32, ptr %9, align 4
  %50 = srem i32 %49, 2
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %56

52:                                               ; preds = %48
  %53 = load i32, ptr %9, align 4
  %54 = load i32, ptr %6, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %6, align 4
  br label %56

56:                                               ; preds = %52, %48
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %9, align 4
  br label %44, !llvm.loop !50

60:                                               ; preds = %44
  br label %74

61:                                               ; preds = %11
  store i32 0, ptr %10, align 4
  br label %62

62:                                               ; preds = %70, %61
  %63 = load i32, ptr %10, align 4
  %64 = load i32, ptr %4, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %73

66:                                               ; preds = %62
  %67 = load i32, ptr %10, align 4
  %68 = load i32, ptr %6, align 4
  %69 = sub nsw i32 %68, %67
  store i32 %69, ptr %6, align 4
  br label %70

70:                                               ; preds = %66
  %71 = load i32, ptr %10, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %10, align 4
  br label %62, !llvm.loop !51

73:                                               ; preds = %62
  br label %74

74:                                               ; preds = %73, %60, %42, %27
  %75 = load i32, ptr %6, align 4
  ret i32 %75
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_108_switch_while(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %11 = load i32, ptr %3, align 4
  switch i32 %11, label %52 [
    i32 0, label %12
    i32 1, label %26
    i32 2, label %40
  ]

12:                                               ; preds = %10
  store i32 0, ptr %7, align 4
  br label %13

13:                                               ; preds = %17, %12
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %25

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %7, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %7, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %7, align 4
  br label %13, !llvm.loop !52

25:                                               ; preds = %13
  br label %56

26:                                               ; preds = %10
  store i32 0, ptr %8, align 4
  br label %27

27:                                               ; preds = %31, %26
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %4, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %39

31:                                               ; preds = %27
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %8, align 4
  %34 = sub nsw i32 %32, %33
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %6, align 4
  %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %8, align 4
  br label %27, !llvm.loop !53

39:                                               ; preds = %27
  br label %56

40:                                               ; preds = %10
  %41 = load i32, ptr %4, align 4
  store i32 %41, ptr %9, align 4
  br label %42

42:                                               ; preds = %45, %40
  %43 = load i32, ptr %9, align 4
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %45, label %51

45:                                               ; preds = %42
  %46 = load i32, ptr %9, align 4
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %6, align 4
  %49 = load i32, ptr %9, align 4
  %50 = add nsw i32 %49, -1
  store i32 %50, ptr %9, align 4
  br label %42, !llvm.loop !54

51:                                               ; preds = %42
  br label %56

52:                                               ; preds = %10
  %53 = load i32, ptr %4, align 4
  %54 = load i32, ptr %5, align 4
  %55 = add nsw i32 %53, %54
  store i32 %55, ptr %6, align 4
  br label %56

56:                                               ; preds = %52, %51, %39, %25
  %57 = load i32, ptr %6, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_109_switch_nested_for(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  br label %13

13:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %14 = load i32, ptr %3, align 4
  switch i32 %14, label %102 [
    i32 0, label %15
    i32 1, label %39
    i32 2, label %73
  ]

15:                                               ; preds = %13
  store i32 0, ptr %7, align 4
  br label %16

16:                                               ; preds = %35, %15
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %38

20:                                               ; preds = %16
  store i32 0, ptr %8, align 4
  br label %21

21:                                               ; preds = %31, %20
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %5, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %34

25:                                               ; preds = %21
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %8, align 4
  %28 = mul nsw i32 %26, %27
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %6, align 4
  br label %31

31:                                               ; preds = %25
  %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %8, align 4
  br label %21, !llvm.loop !55

34:                                               ; preds = %21
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %7, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %7, align 4
  br label %16, !llvm.loop !56

38:                                               ; preds = %16
  br label %106

39:                                               ; preds = %13
  store i32 0, ptr %9, align 4
  br label %40

40:                                               ; preds = %69, %39
  %41 = load i32, ptr %9, align 4
  %42 = load i32, ptr %4, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %72

44:                                               ; preds = %40
  store i32 0, ptr %10, align 4
  br label %45

45:                                               ; preds = %65, %44
  %46 = load i32, ptr %10, align 4
  %47 = load i32, ptr %5, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %68

49:                                               ; preds = %45
  %50 = load i32, ptr %9, align 4
  %51 = load i32, ptr %10, align 4
  %52 = add nsw i32 %50, %51
  %53 = srem i32 %52, 2
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %61

55:                                               ; preds = %49
  %56 = load i32, ptr %9, align 4
  %57 = load i32, ptr %10, align 4
  %58 = add nsw i32 %56, %57
  %59 = load i32, ptr %6, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %6, align 4
  br label %64

61:                                               ; preds = %49
  %62 = load i32, ptr %6, align 4
  %63 = sub nsw i32 %62, 1
  store i32 %63, ptr %6, align 4
  br label %64

64:                                               ; preds = %61, %55
  br label %65

65:                                               ; preds = %64
  %66 = load i32, ptr %10, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %10, align 4
  br label %45, !llvm.loop !57

68:                                               ; preds = %45
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %9, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %9, align 4
  br label %40, !llvm.loop !58

72:                                               ; preds = %40
  br label %106

73:                                               ; preds = %13
  store i32 0, ptr %11, align 4
  br label %74

74:                                               ; preds = %98, %73
  %75 = load i32, ptr %11, align 4
  %76 = load i32, ptr %4, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %101

78:                                               ; preds = %74
  store i32 0, ptr %12, align 4
  br label %79

79:                                               ; preds = %94, %78
  %80 = load i32, ptr %12, align 4
  %81 = load i32, ptr %5, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %97

83:                                               ; preds = %79
  %84 = load i32, ptr %11, align 4
  %85 = load i32, ptr %12, align 4
  %86 = icmp sgt i32 %84, %85
  br i1 %86, label %87, label %89

87:                                               ; preds = %83
  %88 = load i32, ptr %11, align 4
  store i32 %88, ptr %.reg2mem, align 4
  br label %91

89:                                               ; preds = %83
  %90 = load i32, ptr %12, align 4
  store i32 %90, ptr %.reg2mem, align 4
  br label %91

91:                                               ; preds = %89, %87
  %.reload = load i32, ptr %.reg2mem, align 4
  %92 = load i32, ptr %6, align 4
  %93 = add nsw i32 %92, %.reload
  store i32 %93, ptr %6, align 4
  br label %94

94:                                               ; preds = %91
  %95 = load i32, ptr %12, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, ptr %12, align 4
  br label %79, !llvm.loop !59

97:                                               ; preds = %79
  br label %98

98:                                               ; preds = %97
  %99 = load i32, ptr %11, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, ptr %11, align 4
  br label %74, !llvm.loop !60

101:                                              ; preds = %74
  br label %106

102:                                              ; preds = %13
  %103 = load i32, ptr %4, align 4
  %104 = load i32, ptr %5, align 4
  %105 = mul nsw i32 %103, %104
  store i32 %105, ptr %6, align 4
  br label %106

106:                                              ; preds = %102, %101, %72, %38
  %107 = load i32, ptr %6, align 4
  ret i32 %107
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_110_switch_do_while(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 0, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %46 [
    i32 0, label %11
    i32 1, label %25
  ]

11:                                               ; preds = %9
  store i32 0, ptr %7, align 4
  br label %12

12:                                               ; preds = %20, %11
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %7, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %6, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %6, align 4
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %7, align 4
  br label %20

20:                                               ; preds = %12
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %4, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %12, label %24, !llvm.loop !61

24:                                               ; preds = %20
  br label %48

25:                                               ; preds = %9
  store i32 0, ptr %8, align 4
  br label %26

26:                                               ; preds = %41, %25
  %27 = load i32, ptr %8, align 4
  %28 = srem i32 %27, 2
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

30:                                               ; preds = %26
  %31 = load i32, ptr %8, align 4
  %32 = load i32, ptr %6, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %6, align 4
  br label %38

34:                                               ; preds = %26
  %35 = load i32, ptr %8, align 4
  %36 = load i32, ptr %6, align 4
  %37 = sub nsw i32 %36, %35
  store i32 %37, ptr %6, align 4
  br label %38

38:                                               ; preds = %34, %30
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %8, align 4
  br label %41

41:                                               ; preds = %38
  %42 = load i32, ptr %8, align 4
  %43 = load i32, ptr %4, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %26, label %45, !llvm.loop !62

45:                                               ; preds = %41
  br label %48

46:                                               ; preds = %9
  %47 = load i32, ptr %5, align 4
  store i32 %47, ptr %6, align 4
  br label %48

48:                                               ; preds = %46, %45, %24
  %49 = load i32, ptr %6, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_111_switch_array(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %32 [
    i32 0, label %7
    i32 1, label %12
    i32 2, label %18
    i32 3, label %25
  ]

7:                                                ; preds = %5
  %8 = load i32, ptr %3, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  store i32 %11, ptr %4, align 4
  br label %46

12:                                               ; preds = %5
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %4, align 4
  br label %46

18:                                               ; preds = %5
  %19 = load i32, ptr %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr @g_arr, align 16
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %4, align 4
  br label %46

25:                                               ; preds = %5
  %26 = load i32, ptr %3, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %31 = sub nsw i32 %29, %30
  store i32 %31, ptr %4, align 4
  br label %46

32:                                               ; preds = %5
  %33 = load i32, ptr @g_arr, align 16
  %34 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %4, align 4
  br label %36

36:                                               ; preds = %32
  %37 = load i32, ptr %4, align 4
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %39, label %42

39:                                               ; preds = %36
  %40 = load i32, ptr %4, align 4
  %41 = mul nsw i32 %40, 2
  store i32 %41, ptr %4, align 4
  br label %45

42:                                               ; preds = %36
  %43 = load i32, ptr %4, align 4
  %44 = sub nsw i32 %43, 2
  store i32 %44, ptr %4, align 4
  br label %45

45:                                               ; preds = %42, %39
  br label %46

46:                                               ; preds = %45, %25, %18, %12, %7
  %47 = load i32, ptr %4, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_112_switch_matrix_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %63 [
    i32 0, label %9
    i32 1, label %27
    i32 2, label %44
  ]

9:                                                ; preds = %7
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %11
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [3 x i32], ptr %12, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  store i32 %16, ptr %6, align 4
  br label %17

17:                                               ; preds = %9
  %18 = load i32, ptr %6, align 4
  %19 = icmp sgt i32 %18, 5
  br i1 %19, label %20, label %23

20:                                               ; preds = %17
  %21 = load i32, ptr %6, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, ptr %6, align 4
  br label %26

23:                                               ; preds = %17
  %24 = load i32, ptr %6, align 4
  %25 = sub nsw i32 %24, 2
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %23, %20
  br label %73

27:                                               ; preds = %7
  %28 = load i32, ptr %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [3 x i32], ptr @g_mat, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = load i32, ptr %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2), i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = add nsw i32 %31, %35
  store i32 %36, ptr %6, align 4
  br label %37

37:                                               ; preds = %27
  %38 = load i32, ptr %6, align 4
  %39 = icmp sgt i32 %38, 10
  br i1 %39, label %40, label %43

40:                                               ; preds = %37
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 10
  store i32 %42, ptr %6, align 4
  br label %43

43:                                               ; preds = %40, %37
  br label %73

44:                                               ; preds = %7
  %45 = load i32, ptr %4, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %46
  %48 = getelementptr inbounds [3 x i32], ptr %47, i64 0, i64 0
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %4, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %51
  %53 = getelementptr inbounds [3 x i32], ptr %52, i64 0, i64 2
  %54 = load i32, ptr %53, align 4
  %55 = sub nsw i32 %49, %54
  store i32 %55, ptr %6, align 4
  br label %56

56:                                               ; preds = %44
  %57 = load i32, ptr %6, align 4
  %58 = icmp slt i32 %57, 0
  br i1 %58, label %59, label %62

59:                                               ; preds = %56
  %60 = load i32, ptr %6, align 4
  %61 = sub nsw i32 0, %60
  store i32 %61, ptr %6, align 4
  br label %62

62:                                               ; preds = %59, %56
  br label %73

63:                                               ; preds = %7
  %64 = load i32, ptr @g_mat, align 16
  store i32 %64, ptr %6, align 4
  br label %65

65:                                               ; preds = %63
  %66 = load i32, ptr %4, align 4
  %67 = load i32, ptr %5, align 4
  %68 = icmp eq i32 %66, %67
  br i1 %68, label %69, label %72

69:                                               ; preds = %65
  %70 = load i32, ptr %6, align 4
  %71 = add nsw i32 %70, 100
  store i32 %71, ptr %6, align 4
  br label %72

72:                                               ; preds = %69, %65
  br label %73

73:                                               ; preds = %72, %62, %43, %26
  %74 = load i32, ptr %6, align 4
  ret i32 %74
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_113_switch_pointer(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %42 [
    i32 0, label %9
    i32 1, label %14
    i32 2, label %20
    i32 3, label %26
  ]

9:                                                ; preds = %7
  %10 = load i32, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  store i32 %10, ptr %11, align 4
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %12, align 4
  store i32 %13, ptr %6, align 4
  br label %45

14:                                               ; preds = %7
  %15 = load i32, ptr %5, align 4
  %16 = mul nsw i32 %15, 2
  %17 = load ptr, ptr %4, align 8
  store i32 %16, ptr %17, align 4
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %18, align 4
  store i32 %19, ptr %6, align 4
  br label %45

20:                                               ; preds = %7
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 %22, 10
  store i32 %23, ptr %21, align 4
  %24 = load ptr, ptr %4, align 8
  %25 = load i32, ptr %24, align 4
  store i32 %25, ptr %6, align 4
  br label %45

26:                                               ; preds = %7
  %27 = load ptr, ptr %4, align 8
  %28 = load i32, ptr %27, align 4
  %29 = sub nsw i32 %28, 10
  store i32 %29, ptr %27, align 4
  br label %30

30:                                               ; preds = %26
  %31 = load ptr, ptr %4, align 8
  %32 = load i32, ptr %31, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = load ptr, ptr %4, align 8
  %36 = load i32, ptr %35, align 4
  store i32 %36, ptr %6, align 4
  br label %41

37:                                               ; preds = %30
  %38 = load ptr, ptr %4, align 8
  %39 = load i32, ptr %38, align 4
  %40 = sub nsw i32 0, %39
  store i32 %40, ptr %6, align 4
  br label %41

41:                                               ; preds = %37, %34
  br label %45

42:                                               ; preds = %7
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %43, align 4
  store i32 %44, ptr %6, align 4
  br label %45

45:                                               ; preds = %42, %41, %20, %14, %9
  %46 = load i32, ptr %6, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_114_switch_pointer_array(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  br label %7

7:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %70 [
    i32 0, label %9
    i32 1, label %23
    i32 2, label %38
  ]

9:                                                ; preds = %7
  %10 = load i32, ptr %5, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = load ptr, ptr %4, align 8
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %14, i64 %16
  store i32 %13, ptr %17, align 4
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  %22 = load i32, ptr %21, align 4
  store i32 %22, ptr %6, align 4
  br label %81

23:                                               ; preds = %7
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = mul nsw i32 %27, 2
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %5, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 %28, ptr %32, align 4
  %33 = load ptr, ptr %4, align 8
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr %33, i64 %35
  %37 = load i32, ptr %36, align 4
  store i32 %37, ptr %6, align 4
  br label %81

38:                                               ; preds = %7
  %39 = load i32, ptr %5, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %5, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = add nsw i32 %47, %42
  store i32 %48, ptr %46, align 4
  br label %49

49:                                               ; preds = %38
  %50 = load ptr, ptr %4, align 8
  %51 = load i32, ptr %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr %50, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %62

56:                                               ; preds = %49
  %57 = load ptr, ptr %4, align 8
  %58 = load i32, ptr %5, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %6, align 4
  br label %69

62:                                               ; preds = %49
  %63 = load ptr, ptr %4, align 8
  %64 = load i32, ptr %5, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %63, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = sub nsw i32 0, %67
  store i32 %68, ptr %6, align 4
  br label %69

69:                                               ; preds = %62, %56
  br label %81

70:                                               ; preds = %7
  %71 = load ptr, ptr %4, align 8
  %72 = load i32, ptr %5, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, ptr %71, i64 %73
  %75 = load i32, ptr %74, align 4
  %76 = load i32, ptr %5, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = add nsw i32 %75, %79
  store i32 %80, ptr %6, align 4
  br label %81

81:                                               ; preds = %70, %69, %23, %9
  %82 = load i32, ptr %6, align 4
  ret i32 %82
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_115_switch_array_loop(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca i1, align 1
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %10 = load i32, ptr %2, align 4
  switch i32 %10, label %99 [
    i32 0, label %11
    i32 1, label %31
    i32 2, label %65
  ]

11:                                               ; preds = %9
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %27, %11
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  store i1 false, ptr %.reg2mem, align 1
  br i1 %15, label %16, label %19

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %17, 8
  store i1 %18, ptr %.reg2mem, align 1
  br label %19

19:                                               ; preds = %16, %12
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %20, label %30

20:                                               ; preds = %19
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  br label %27

27:                                               ; preds = %20
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %5, align 4
  br label %12, !llvm.loop !63

30:                                               ; preds = %19
  br label %115

31:                                               ; preds = %9
  store i32 0, ptr %6, align 4
  br label %32

32:                                               ; preds = %61, %31
  %33 = load i32, ptr %6, align 4
  %34 = load i32, ptr %3, align 4
  %35 = icmp slt i32 %33, %34
  store i1 false, ptr %.reg2mem1, align 1
  br i1 %35, label %36, label %39

36:                                               ; preds = %32
  %37 = load i32, ptr %6, align 4
  %38 = icmp slt i32 %37, 8
  store i1 %38, ptr %.reg2mem1, align 1
  br label %39

39:                                               ; preds = %36, %32
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  br i1 %.reload2, label %40, label %64

40:                                               ; preds = %39
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %53

46:                                               ; preds = %40
  %47 = load i32, ptr %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %4, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %4, align 4
  br label %60

53:                                               ; preds = %40
  %54 = load i32, ptr %6, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = load i32, ptr %4, align 4
  %59 = sub nsw i32 %58, %57
  store i32 %59, ptr %4, align 4
  br label %60

60:                                               ; preds = %53, %46
  br label %61

61:                                               ; preds = %60
  %62 = load i32, ptr %6, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %6, align 4
  br label %32, !llvm.loop !64

64:                                               ; preds = %39
  br label %115

65:                                               ; preds = %9
  store i32 0, ptr %7, align 4
  br label %66

66:                                               ; preds = %95, %65
  %67 = load i32, ptr %7, align 4
  %68 = load i32, ptr %3, align 4
  %69 = icmp slt i32 %67, %68
  store i1 false, ptr %.reg2mem3, align 1
  br i1 %69, label %70, label %73

70:                                               ; preds = %66
  %71 = load i32, ptr %7, align 4
  %72 = icmp slt i32 %71, 8
  store i1 %72, ptr %.reg2mem3, align 1
  br label %73

73:                                               ; preds = %70, %66
  %.reload4 = load i1, ptr %.reg2mem3, align 1
  br i1 %.reload4, label %74, label %98

74:                                               ; preds = %73
  %75 = load i32, ptr %7, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = icmp sgt i32 %78, 0
  br i1 %79, label %80, label %86

80:                                               ; preds = %74
  %81 = load i32, ptr %7, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = mul nsw i32 %84, 2
  store i32 %85, ptr %.reg2mem5, align 4
  br label %92

86:                                               ; preds = %74
  %87 = load i32, ptr %7, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = sub nsw i32 %90, 2
  store i32 %91, ptr %.reg2mem5, align 4
  br label %92

92:                                               ; preds = %86, %80
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %93 = load i32, ptr %4, align 4
  %94 = add nsw i32 %93, %.reload6
  store i32 %94, ptr %4, align 4
  br label %95

95:                                               ; preds = %92
  %96 = load i32, ptr %7, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %7, align 4
  br label %66, !llvm.loop !65

98:                                               ; preds = %73
  br label %115

99:                                               ; preds = %9
  %100 = load i32, ptr @g_arr, align 16
  store i32 %100, ptr %4, align 4
  store i32 1, ptr %8, align 4
  br label %101

101:                                              ; preds = %111, %99
  %102 = load i32, ptr %8, align 4
  %103 = icmp slt i32 %102, 8
  br i1 %103, label %104, label %114

104:                                              ; preds = %101
  %105 = load i32, ptr %8, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %106
  %108 = load i32, ptr %107, align 4
  %109 = load i32, ptr %4, align 4
  %110 = add nsw i32 %109, %108
  store i32 %110, ptr %4, align 4
  br label %111

111:                                              ; preds = %104
  %112 = load i32, ptr %8, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %8, align 4
  br label %101, !llvm.loop !66

114:                                              ; preds = %101
  br label %115

115:                                              ; preds = %114, %98, %64, %30
  %116 = load i32, ptr %4, align 4
  ret i32 %116
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_116_switch_pointer_loop(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
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
  br label %13

13:                                               ; preds = %entry
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %121 [
    i32 0, label %15
    i32 1, label %48
    i32 2, label %89
  ]

15:                                               ; preds = %13
  store i32 0, ptr %9, align 4
  br label %16

16:                                               ; preds = %28, %15
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %31

20:                                               ; preds = %16
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %9, align 4
  %23 = add nsw i32 %21, %22
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %9, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %24, i64 %26
  store i32 %23, ptr %27, align 4
  br label %28

28:                                               ; preds = %20
  %29 = load i32, ptr %9, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %9, align 4
  br label %16, !llvm.loop !67

31:                                               ; preds = %16
  store i32 0, ptr %10, align 4
  br label %32

32:                                               ; preds = %44, %31
  %33 = load i32, ptr %10, align 4
  %34 = load i32, ptr %6, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %47

36:                                               ; preds = %32
  %37 = load ptr, ptr %5, align 8
  %38 = load i32, ptr %10, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %37, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %8, align 4
  br label %44

44:                                               ; preds = %36
  %45 = load i32, ptr %10, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %10, align 4
  br label %32, !llvm.loop !68

47:                                               ; preds = %32
  br label %132

48:                                               ; preds = %13
  store i32 0, ptr %11, align 4
  br label %49

49:                                               ; preds = %85, %48
  %50 = load i32, ptr %11, align 4
  %51 = load i32, ptr %6, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %88

53:                                               ; preds = %49
  %54 = load i32, ptr %7, align 4
  %55 = load i32, ptr %11, align 4
  %56 = sub nsw i32 %54, %55
  %57 = load ptr, ptr %5, align 8
  %58 = load i32, ptr %11, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  store i32 %56, ptr %60, align 4
  br label %61

61:                                               ; preds = %53
  %62 = load ptr, ptr %5, align 8
  %63 = load i32, ptr %11, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %62, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = icmp sgt i32 %66, 0
  br i1 %67, label %68, label %76

68:                                               ; preds = %61
  %69 = load ptr, ptr %5, align 8
  %70 = load i32, ptr %11, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr %69, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = load i32, ptr %8, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %8, align 4
  br label %84

76:                                               ; preds = %61
  %77 = load ptr, ptr %5, align 8
  %78 = load i32, ptr %11, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, ptr %77, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = load i32, ptr %8, align 4
  %83 = sub nsw i32 %82, %81
  store i32 %83, ptr %8, align 4
  br label %84

84:                                               ; preds = %76, %68
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %11, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %11, align 4
  br label %49, !llvm.loop !69

88:                                               ; preds = %49
  br label %132

89:                                               ; preds = %13
  store i32 0, ptr %12, align 4
  br label %90

90:                                               ; preds = %111, %89
  %91 = load i32, ptr %12, align 4
  %92 = load i32, ptr %6, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %114

94:                                               ; preds = %90
  %95 = load i32, ptr %12, align 4
  %96 = srem i32 %95, 2
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %102

98:                                               ; preds = %94
  %99 = load i32, ptr %7, align 4
  %100 = load i32, ptr %12, align 4
  %101 = add nsw i32 %99, %100
  store i32 %101, ptr %.reg2mem, align 4
  br label %106

102:                                              ; preds = %94
  %103 = load i32, ptr %7, align 4
  %104 = load i32, ptr %12, align 4
  %105 = sub nsw i32 %103, %104
  store i32 %105, ptr %.reg2mem, align 4
  br label %106

106:                                              ; preds = %102, %98
  %.reload = load i32, ptr %.reg2mem, align 4
  %107 = load ptr, ptr %5, align 8
  %108 = load i32, ptr %12, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, ptr %107, i64 %109
  store i32 %.reload, ptr %110, align 4
  br label %111

111:                                              ; preds = %106
  %112 = load i32, ptr %12, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %12, align 4
  br label %90, !llvm.loop !70

114:                                              ; preds = %90
  %115 = load ptr, ptr %5, align 8
  %116 = load i32, ptr %6, align 4
  %117 = sub nsw i32 %116, 1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, ptr %115, i64 %118
  %120 = load i32, ptr %119, align 4
  store i32 %120, ptr %8, align 4
  br label %132

121:                                              ; preds = %13
  %122 = load ptr, ptr %5, align 8
  %123 = getelementptr inbounds i32, ptr %122, i64 0
  %124 = load i32, ptr %123, align 4
  store i32 %124, ptr %8, align 4
  br label %125

125:                                              ; preds = %121
  %126 = load i32, ptr %8, align 4
  %127 = icmp slt i32 %126, 0
  br i1 %127, label %128, label %131

128:                                              ; preds = %125
  %129 = load i32, ptr %8, align 4
  %130 = sub nsw i32 0, %129
  store i32 %130, ptr %8, align 4
  br label %131

131:                                              ; preds = %128, %125
  br label %132

132:                                              ; preds = %131, %114, %88, %47
  %133 = load i32, ptr %8, align 4
  ret i32 %133
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_117_switch_ternary_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  br label %13

13:                                               ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %91 [
    i32 0, label %15
    i32 1, label %39
    i32 2, label %60
  ]

15:                                               ; preds = %13
  store i32 0, ptr %9, align 4
  br label %16

16:                                               ; preds = %35, %15
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %38

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %7, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %28

24:                                               ; preds = %20
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %9, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, ptr %.reg2mem, align 4
  br label %32

28:                                               ; preds = %20
  %29 = load i32, ptr %7, align 4
  %30 = load i32, ptr %9, align 4
  %31 = sub nsw i32 %29, %30
  store i32 %31, ptr %.reg2mem, align 4
  br label %32

32:                                               ; preds = %28, %24
  %.reload = load i32, ptr %.reg2mem, align 4
  %33 = load i32, ptr %8, align 4
  %34 = add nsw i32 %33, %.reload
  store i32 %34, ptr %8, align 4
  br label %35

35:                                               ; preds = %32
  %36 = load i32, ptr %9, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %9, align 4
  br label %16, !llvm.loop !71

38:                                               ; preds = %16
  br label %100

39:                                               ; preds = %13
  store i32 0, ptr %10, align 4
  br label %40

40:                                               ; preds = %56, %39
  %41 = load i32, ptr %10, align 4
  %42 = load i32, ptr %5, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %59

44:                                               ; preds = %40
  %45 = load i32, ptr %10, align 4
  %46 = srem i32 %45, 2
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %50

48:                                               ; preds = %44
  %49 = load i32, ptr %6, align 4
  store i32 %49, ptr %.reg2mem1, align 4
  br label %52

50:                                               ; preds = %44
  %51 = load i32, ptr %7, align 4
  store i32 %51, ptr %.reg2mem1, align 4
  br label %52

52:                                               ; preds = %50, %48
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %11, align 4
  %53 = load i32, ptr %11, align 4
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %8, align 4
  br label %56

56:                                               ; preds = %52
  %57 = load i32, ptr %10, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %10, align 4
  br label %40, !llvm.loop !72

59:                                               ; preds = %40
  br label %100

60:                                               ; preds = %13
  store i32 0, ptr %12, align 4
  br label %61

61:                                               ; preds = %87, %60
  %62 = load i32, ptr %12, align 4
  %63 = load i32, ptr %5, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %90

65:                                               ; preds = %61
  %66 = load i32, ptr %12, align 4
  %67 = icmp sgt i32 %66, 2
  br i1 %67, label %68, label %82

68:                                               ; preds = %65
  %69 = load i32, ptr %6, align 4
  %70 = icmp sgt i32 %69, 0
  br i1 %70, label %71, label %75

71:                                               ; preds = %68
  %72 = load i32, ptr %6, align 4
  %73 = load i32, ptr %12, align 4
  %74 = mul nsw i32 %72, %73
  store i32 %74, ptr %.reg2mem3, align 4
  br label %79

75:                                               ; preds = %68
  %76 = load i32, ptr %7, align 4
  %77 = load i32, ptr %12, align 4
  %78 = mul nsw i32 %76, %77
  store i32 %78, ptr %.reg2mem3, align 4
  br label %79

79:                                               ; preds = %75, %71
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %80 = load i32, ptr %8, align 4
  %81 = add nsw i32 %80, %.reload4
  store i32 %81, ptr %8, align 4
  br label %86

82:                                               ; preds = %65
  %83 = load i32, ptr %12, align 4
  %84 = load i32, ptr %8, align 4
  %85 = add nsw i32 %84, %83
  store i32 %85, ptr %8, align 4
  br label %86

86:                                               ; preds = %82, %79
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %12, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %12, align 4
  br label %61, !llvm.loop !73

90:                                               ; preds = %61
  br label %100

91:                                               ; preds = %13
  %92 = load i32, ptr %6, align 4
  %93 = load i32, ptr %7, align 4
  %94 = icmp sgt i32 %92, %93
  br i1 %94, label %95, label %97

95:                                               ; preds = %91
  %96 = load i32, ptr %6, align 4
  store i32 %96, ptr %.reg2mem5, align 4
  br label %99

97:                                               ; preds = %91
  %98 = load i32, ptr %7, align 4
  store i32 %98, ptr %.reg2mem5, align 4
  br label %99

99:                                               ; preds = %97, %95
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %8, align 4
  br label %100

100:                                              ; preds = %99, %90, %59, %38
  %101 = load i32, ptr %8, align 4
  ret i32 %101
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_118_nested_switch_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %48 [
    i32 0, label %9
    i32 1, label %30
  ]

9:                                                ; preds = %7
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %17 [
    i32 0, label %11
    i32 1, label %14
  ]

11:                                               ; preds = %9
  %12 = load i32, ptr %5, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %6, align 4
  br label %20

14:                                               ; preds = %9
  %15 = load i32, ptr %5, align 4
  %16 = add nsw i32 %15, 20
  store i32 %16, ptr %6, align 4
  br label %20

17:                                               ; preds = %9
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 30
  store i32 %19, ptr %6, align 4
  br label %20

20:                                               ; preds = %17, %14, %11
  %21 = load i32, ptr %6, align 4
  %22 = icmp sgt i32 %21, 20
  br i1 %22, label %23, label %26

23:                                               ; preds = %20
  %24 = load i32, ptr %6, align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, ptr %6, align 4
  br label %29

26:                                               ; preds = %20
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 5
  store i32 %28, ptr %6, align 4
  br label %29

29:                                               ; preds = %26, %23
  br label %50

30:                                               ; preds = %7
  %31 = load i32, ptr %4, align 4
  switch i32 %31, label %38 [
    i32 0, label %32
    i32 1, label %35
  ]

32:                                               ; preds = %30
  %33 = load i32, ptr %5, align 4
  %34 = sub nsw i32 %33, 10
  store i32 %34, ptr %6, align 4
  br label %41

35:                                               ; preds = %30
  %36 = load i32, ptr %5, align 4
  %37 = sub nsw i32 %36, 20
  store i32 %37, ptr %6, align 4
  br label %41

38:                                               ; preds = %30
  %39 = load i32, ptr %5, align 4
  %40 = sub nsw i32 %39, 30
  store i32 %40, ptr %6, align 4
  br label %41

41:                                               ; preds = %38, %35, %32
  %42 = load i32, ptr %6, align 4
  %43 = icmp slt i32 %42, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %41
  %45 = load i32, ptr %6, align 4
  %46 = sub nsw i32 0, %45
  store i32 %46, ptr %6, align 4
  br label %47

47:                                               ; preds = %44, %41
  br label %50

48:                                               ; preds = %7
  %49 = load i32, ptr %5, align 4
  store i32 %49, ptr %6, align 4
  br label %50

50:                                               ; preds = %48, %47, %29
  %51 = load i32, ptr %6, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_119_nested_switch_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 0, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %60 [
    i32 0, label %11
    i32 1, label %36
  ]

11:                                               ; preds = %9
  store i32 0, ptr %7, align 4
  br label %12

12:                                               ; preds = %32, %11
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %35

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4
  switch i32 %17, label %27 [
    i32 0, label %18
    i32 1, label %22
  ]

18:                                               ; preds = %16
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %6, align 4
  br label %31

22:                                               ; preds = %16
  %23 = load i32, ptr %7, align 4
  %24 = mul nsw i32 %23, 2
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %6, align 4
  br label %31

27:                                               ; preds = %16
  %28 = load i32, ptr %7, align 4
  %29 = load i32, ptr %6, align 4
  %30 = sub nsw i32 %29, %28
  store i32 %30, ptr %6, align 4
  br label %31

31:                                               ; preds = %27, %22, %18
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %7, align 4
  br label %12, !llvm.loop !74

35:                                               ; preds = %12
  br label %62

36:                                               ; preds = %9
  store i32 0, ptr %8, align 4
  br label %37

37:                                               ; preds = %56, %36
  %38 = load i32, ptr %8, align 4
  %39 = load i32, ptr %5, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %59

41:                                               ; preds = %37
  %42 = load i32, ptr %4, align 4
  switch i32 %42, label %53 [
    i32 0, label %43
    i32 1, label %48
  ]

43:                                               ; preds = %41
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, 10
  %46 = load i32, ptr %6, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %6, align 4
  br label %56

48:                                               ; preds = %41
  %49 = load i32, ptr %8, align 4
  %50 = mul nsw i32 %49, 3
  %51 = load i32, ptr %6, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %6, align 4
  br label %56

53:                                               ; preds = %41
  %54 = load i32, ptr %6, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %6, align 4
  br label %56

56:                                               ; preds = %53, %48, %43
  %57 = load i32, ptr %8, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %8, align 4
  br label %37, !llvm.loop !75

59:                                               ; preds = %37
  br label %62

60:                                               ; preds = %9
  %61 = load i32, ptr %5, align 4
  store i32 %61, ptr %6, align 4
  br label %62

62:                                               ; preds = %60, %59, %35
  %63 = load i32, ptr %6, align 4
  ret i32 %63
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_120_switch_nested_for_if_ternary(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem7 = alloca i32, align 4
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  br label %13

13:                                               ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %111 [
    i32 0, label %15
    i32 1, label %64
  ]

15:                                               ; preds = %13
  store i32 0, ptr %9, align 4
  br label %16

16:                                               ; preds = %60, %15
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %63

20:                                               ; preds = %16
  store i32 0, ptr %10, align 4
  br label %21

21:                                               ; preds = %56, %20
  %22 = load i32, ptr %10, align 4
  %23 = load i32, ptr %5, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %59

25:                                               ; preds = %21
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %10, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %29, label %44

29:                                               ; preds = %25
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %7, align 4
  %32 = icmp sgt i32 %30, %31
  br i1 %32, label %33, label %37

33:                                               ; preds = %29
  %34 = load i32, ptr %6, align 4
  %35 = load i32, ptr %9, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %.reg2mem, align 4
  br label %41

37:                                               ; preds = %29
  %38 = load i32, ptr %7, align 4
  %39 = load i32, ptr %10, align 4
  %40 = add nsw i32 %38, %39
  store i32 %40, ptr %.reg2mem, align 4
  br label %41

41:                                               ; preds = %37, %33
  %.reload = load i32, ptr %.reg2mem, align 4
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %42, %.reload
  store i32 %43, ptr %8, align 4
  br label %55

44:                                               ; preds = %25
  %45 = load i32, ptr %6, align 4
  %46 = load i32, ptr %7, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %50

48:                                               ; preds = %44
  %49 = load i32, ptr %9, align 4
  store i32 %49, ptr %.reg2mem1, align 4
  br label %52

50:                                               ; preds = %44
  %51 = load i32, ptr %10, align 4
  store i32 %51, ptr %.reg2mem1, align 4
  br label %52

52:                                               ; preds = %50, %48
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %53 = load i32, ptr %8, align 4
  %54 = sub nsw i32 %53, %.reload2
  store i32 %54, ptr %8, align 4
  br label %55

55:                                               ; preds = %52, %41
  br label %56

56:                                               ; preds = %55
  %57 = load i32, ptr %10, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %10, align 4
  br label %21, !llvm.loop !76

59:                                               ; preds = %21
  br label %60

60:                                               ; preds = %59
  %61 = load i32, ptr %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %9, align 4
  br label %16, !llvm.loop !77

63:                                               ; preds = %16
  br label %124

64:                                               ; preds = %13
  store i32 0, ptr %11, align 4
  br label %65

65:                                               ; preds = %107, %64
  %66 = load i32, ptr %11, align 4
  %67 = load i32, ptr %5, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %110

69:                                               ; preds = %65
  %70 = load i32, ptr %11, align 4
  %71 = srem i32 %70, 2
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %95

73:                                               ; preds = %69
  store i32 0, ptr %12, align 4
  br label %74

74:                                               ; preds = %91, %73
  %75 = load i32, ptr %12, align 4
  %76 = icmp slt i32 %75, 2
  br i1 %76, label %77, label %94

77:                                               ; preds = %74
  %78 = load i32, ptr %6, align 4
  %79 = icmp sgt i32 %78, 0
  br i1 %79, label %80, label %84

80:                                               ; preds = %77
  %81 = load i32, ptr %6, align 4
  %82 = load i32, ptr %12, align 4
  %83 = add nsw i32 %81, %82
  store i32 %83, ptr %.reg2mem3, align 4
  br label %88

84:                                               ; preds = %77
  %85 = load i32, ptr %7, align 4
  %86 = load i32, ptr %12, align 4
  %87 = sub nsw i32 %85, %86
  store i32 %87, ptr %.reg2mem3, align 4
  br label %88

88:                                               ; preds = %84, %80
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %89 = load i32, ptr %8, align 4
  %90 = add nsw i32 %89, %.reload4
  store i32 %90, ptr %8, align 4
  br label %91

91:                                               ; preds = %88
  %92 = load i32, ptr %12, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %12, align 4
  br label %74, !llvm.loop !78

94:                                               ; preds = %74
  br label %106

95:                                               ; preds = %69
  %96 = load i32, ptr %6, align 4
  %97 = load i32, ptr %7, align 4
  %98 = icmp sgt i32 %96, %97
  br i1 %98, label %99, label %101

99:                                               ; preds = %95
  %100 = load i32, ptr %6, align 4
  store i32 %100, ptr %.reg2mem5, align 4
  br label %103

101:                                              ; preds = %95
  %102 = load i32, ptr %7, align 4
  store i32 %102, ptr %.reg2mem5, align 4
  br label %103

103:                                              ; preds = %101, %99
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %104 = load i32, ptr %8, align 4
  %105 = add nsw i32 %104, %.reload6
  store i32 %105, ptr %8, align 4
  br label %106

106:                                              ; preds = %103, %94
  br label %107

107:                                              ; preds = %106
  %108 = load i32, ptr %11, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %11, align 4
  br label %65, !llvm.loop !79

110:                                              ; preds = %65
  br label %124

111:                                              ; preds = %13
  %112 = load i32, ptr %6, align 4
  %113 = load i32, ptr %7, align 4
  %114 = icmp sgt i32 %112, %113
  br i1 %114, label %115, label %119

115:                                              ; preds = %111
  %116 = load i32, ptr %6, align 4
  %117 = load i32, ptr %7, align 4
  %118 = sub nsw i32 %116, %117
  store i32 %118, ptr %.reg2mem7, align 4
  br label %123

119:                                              ; preds = %111
  %120 = load i32, ptr %7, align 4
  %121 = load i32, ptr %6, align 4
  %122 = sub nsw i32 %120, %121
  store i32 %122, ptr %.reg2mem7, align 4
  br label %123

123:                                              ; preds = %119, %115
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  store i32 %.reload8, ptr %8, align 4
  br label %124

124:                                              ; preds = %123, %110, %63
  %125 = load i32, ptr %8, align 4
  ret i32 %125
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_121_switch_vla_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  br label %13

13:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  br label %14

14:                                               ; preds = %13
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = load i32, ptr %4, align 4
  store i32 %18, ptr %.reg2mem, align 4
  br label %20

19:                                               ; preds = %14
  store i32 1, ptr %.reg2mem, align 4
  br label %20

20:                                               ; preds = %19, %17
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %6, align 4
  %21 = load i32, ptr %6, align 4
  %22 = zext i32 %21 to i64
  %23 = call ptr @llvm.stacksave()
  store ptr %23, ptr %7, align 8
  %24 = alloca i32, i64 %22, align 16
  store ptr %24, ptr %.reg2mem1, align 8
  store i64 %22, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %25

25:                                               ; preds = %36, %20
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %6, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %39

29:                                               ; preds = %25
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %9, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %9, align 4
  %34 = sext i32 %33 to i64
  %.reload9 = load ptr, ptr %.reg2mem1, align 8
  %35 = getelementptr inbounds i32, ptr %.reload9, i64 %34
  store i32 %32, ptr %35, align 4
  br label %36

36:                                               ; preds = %29
  %37 = load i32, ptr %9, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %9, align 4
  br label %25, !llvm.loop !80

39:                                               ; preds = %25
  store i32 0, ptr %10, align 4
  %40 = load i32, ptr %3, align 4
  switch i32 %40, label %102 [
    i32 0, label %41
    i32 1, label %57
    i32 2, label %87
  ]

41:                                               ; preds = %39
  store i32 0, ptr %11, align 4
  br label %42

42:                                               ; preds = %53, %41
  %43 = load i32, ptr %11, align 4
  %44 = load i32, ptr %6, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %56

46:                                               ; preds = %42
  %47 = load i32, ptr %11, align 4
  %48 = sext i32 %47 to i64
  %.reload8 = load ptr, ptr %.reg2mem1, align 8
  %49 = getelementptr inbounds i32, ptr %.reload8, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %10, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %10, align 4
  br label %53

53:                                               ; preds = %46
  %54 = load i32, ptr %11, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %11, align 4
  br label %42, !llvm.loop !81

56:                                               ; preds = %42
  br label %105

57:                                               ; preds = %39
  store i32 0, ptr %12, align 4
  br label %58

58:                                               ; preds = %83, %57
  %59 = load i32, ptr %12, align 4
  %60 = load i32, ptr %6, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %86

62:                                               ; preds = %58
  %63 = load i32, ptr %12, align 4
  %64 = sext i32 %63 to i64
  %.reload7 = load ptr, ptr %.reg2mem1, align 8
  %65 = getelementptr inbounds i32, ptr %.reload7, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = icmp sgt i32 %66, 0
  br i1 %67, label %68, label %75

68:                                               ; preds = %62
  %69 = load i32, ptr %12, align 4
  %70 = sext i32 %69 to i64
  %.reload6 = load ptr, ptr %.reg2mem1, align 8
  %71 = getelementptr inbounds i32, ptr %.reload6, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = load i32, ptr %10, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %10, align 4
  br label %82

75:                                               ; preds = %62
  %76 = load i32, ptr %12, align 4
  %77 = sext i32 %76 to i64
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %78 = getelementptr inbounds i32, ptr %.reload5, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = load i32, ptr %10, align 4
  %81 = sub nsw i32 %80, %79
  store i32 %81, ptr %10, align 4
  br label %82

82:                                               ; preds = %75, %68
  br label %83

83:                                               ; preds = %82
  %84 = load i32, ptr %12, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %12, align 4
  br label %58, !llvm.loop !82

86:                                               ; preds = %58
  br label %105

87:                                               ; preds = %39
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %88 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %89 = load i32, ptr %88, align 16
  store i32 %89, ptr %10, align 4
  br label %90

90:                                               ; preds = %87
  %91 = load i32, ptr %6, align 4
  %92 = icmp sgt i32 %91, 1
  br i1 %92, label %93, label %101

93:                                               ; preds = %90
  %94 = load i32, ptr %6, align 4
  %95 = sub nsw i32 %94, 1
  %96 = sext i32 %95 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %97 = getelementptr inbounds i32, ptr %.reload3, i64 %96
  %98 = load i32, ptr %97, align 4
  %99 = load i32, ptr %10, align 4
  %100 = add nsw i32 %99, %98
  store i32 %100, ptr %10, align 4
  br label %101

101:                                              ; preds = %93, %90
  br label %105

102:                                              ; preds = %39
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %103 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %104 = load i32, ptr %103, align 16
  store i32 %104, ptr %10, align 4
  br label %105

105:                                              ; preds = %102, %101, %86, %56
  %106 = load i32, ptr %10, align 4
  %107 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %107)
  ret i32 %106
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_122_switch_vla_pointer_ternary(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  br label %13

13:                                               ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  br label %14

14:                                               ; preds = %13
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = load i32, ptr %4, align 4
  store i32 %18, ptr %.reg2mem, align 4
  br label %20

19:                                               ; preds = %14
  store i32 1, ptr %.reg2mem, align 4
  br label %20

20:                                               ; preds = %19, %17
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %6, align 4
  %21 = load i32, ptr %6, align 4
  %22 = zext i32 %21 to i64
  %23 = call ptr @llvm.stacksave()
  store ptr %23, ptr %7, align 8
  %24 = alloca i32, i64 %22, align 16
  store i64 %22, ptr %8, align 8
  store ptr %24, ptr %9, align 8
  store i32 0, ptr %10, align 4
  br label %25

25:                                               ; preds = %46, %20
  %26 = load i32, ptr %10, align 4
  %27 = load i32, ptr %6, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %49

29:                                               ; preds = %25
  %30 = load i32, ptr %10, align 4
  %31 = srem i32 %30, 2
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %37

33:                                               ; preds = %29
  %34 = load i32, ptr %5, align 4
  %35 = load i32, ptr %10, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %.reg2mem1, align 4
  br label %41

37:                                               ; preds = %29
  %38 = load i32, ptr %5, align 4
  %39 = load i32, ptr %10, align 4
  %40 = sub nsw i32 %38, %39
  store i32 %40, ptr %.reg2mem1, align 4
  br label %41

41:                                               ; preds = %37, %33
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %42 = load ptr, ptr %9, align 8
  %43 = load i32, ptr %10, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  store i32 %.reload2, ptr %45, align 4
  br label %46

46:                                               ; preds = %41
  %47 = load i32, ptr %10, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %10, align 4
  br label %25, !llvm.loop !83

49:                                               ; preds = %25
  store i32 0, ptr %11, align 4
  %50 = load i32, ptr %3, align 4
  switch i32 %50, label %78 [
    i32 0, label %51
    i32 1, label %55
    i32 2, label %62
  ]

51:                                               ; preds = %49
  %52 = load ptr, ptr %9, align 8
  %53 = getelementptr inbounds i32, ptr %52, i64 0
  %54 = load i32, ptr %53, align 4
  store i32 %54, ptr %11, align 4
  br label %95

55:                                               ; preds = %49
  %56 = load ptr, ptr %9, align 8
  %57 = load i32, ptr %6, align 4
  %58 = sub nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %56, i64 %59
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %11, align 4
  br label %95

62:                                               ; preds = %49
  %63 = load ptr, ptr %9, align 8
  %64 = getelementptr inbounds i32, ptr %63, i64 0
  %65 = load i32, ptr %64, align 4
  %66 = icmp sgt i32 %65, 0
  br i1 %66, label %67, label %72

67:                                               ; preds = %62
  %68 = load ptr, ptr %9, align 8
  %69 = getelementptr inbounds i32, ptr %68, i64 0
  %70 = load i32, ptr %69, align 4
  %71 = mul nsw i32 %70, 2
  store i32 %71, ptr %.reg2mem3, align 4
  br label %77

72:                                               ; preds = %62
  %73 = load ptr, ptr %9, align 8
  %74 = getelementptr inbounds i32, ptr %73, i64 0
  %75 = load i32, ptr %74, align 4
  %76 = sub nsw i32 %75, 2
  store i32 %76, ptr %.reg2mem3, align 4
  br label %77

77:                                               ; preds = %72, %67
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %11, align 4
  br label %95

78:                                               ; preds = %49
  store i32 0, ptr %12, align 4
  br label %79

79:                                               ; preds = %91, %78
  %80 = load i32, ptr %12, align 4
  %81 = load i32, ptr %6, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %94

83:                                               ; preds = %79
  %84 = load ptr, ptr %9, align 8
  %85 = load i32, ptr %12, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, ptr %84, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = load i32, ptr %11, align 4
  %90 = add nsw i32 %89, %88
  store i32 %90, ptr %11, align 4
  br label %91

91:                                               ; preds = %83
  %92 = load i32, ptr %12, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %12, align 4
  br label %79, !llvm.loop !84

94:                                               ; preds = %79
  br label %95

95:                                               ; preds = %94, %77, %55, %51
  %96 = load i32, ptr %11, align 4
  %97 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %97)
  ret i32 %96
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_123_switch_goto(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %16 [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %13
  ]

7:                                                ; preds = %5
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %4, align 4
  br label %28

10:                                               ; preds = %5
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %4, align 4
  br label %18

13:                                               ; preds = %5
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 10
  store i32 %15, ptr %4, align 4
  br label %21

16:                                               ; preds = %5
  %17 = load i32, ptr %3, align 4
  store i32 %17, ptr %4, align 4
  br label %28

18:                                               ; preds = %10
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 5
  store i32 %20, ptr %4, align 4
  br label %21

21:                                               ; preds = %18, %13
  %22 = load i32, ptr %4, align 4
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %21
  %25 = load i32, ptr %4, align 4
  %26 = sub nsw i32 0, %25
  store i32 %26, ptr %4, align 4
  br label %27

27:                                               ; preds = %24, %21
  br label %28

28:                                               ; preds = %27, %16, %7
  %29 = load i32, ptr %4, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_124_switch_goto_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem = alloca i1, align 1
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
  store i32 0, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %67 [
    i32 0, label %11
    i32 1, label %32
    i32 2, label %51
  ]

11:                                               ; preds = %9
  store i32 0, ptr %7, align 4
  br label %12

12:                                               ; preds = %28, %11
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %31

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %17, %18
  %20 = icmp sgt i32 %19, 20
  br i1 %20, label %21, label %22

21:                                               ; preds = %16
  br label %70

22:                                               ; preds = %16
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  br label %28

28:                                               ; preds = %22
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %7, align 4
  br label %12, !llvm.loop !85

31:                                               ; preds = %12
  br label %69

32:                                               ; preds = %9
  store i32 0, ptr %8, align 4
  br label %33

33:                                               ; preds = %47, %32
  %34 = load i32, ptr %8, align 4
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %50

37:                                               ; preds = %33
  %38 = load i32, ptr %5, align 4
  %39 = load i32, ptr %8, align 4
  %40 = sub nsw i32 %38, %39
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, ptr %6, align 4
  br label %43

43:                                               ; preds = %37
  %44 = load i32, ptr %6, align 4
  %45 = icmp sgt i32 %44, 30
  br i1 %45, label %46, label %47

46:                                               ; preds = %43
  br label %70

47:                                               ; preds = %43
  %48 = load i32, ptr %8, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %8, align 4
  br label %33, !llvm.loop !86

50:                                               ; preds = %33
  br label %69

51:                                               ; preds = %9
  br label %52

52:                                               ; preds = %65, %51
  %53 = load i32, ptr %5, align 4
  %54 = load i32, ptr %6, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %6, align 4
  %56 = load i32, ptr %5, align 4
  %57 = add nsw i32 %56, -1
  store i32 %57, ptr %5, align 4
  br label %58

58:                                               ; preds = %52
  %59 = load i32, ptr %5, align 4
  %60 = icmp sgt i32 %59, 0
  store i1 false, ptr %.reg2mem, align 1
  br i1 %60, label %61, label %65

61:                                               ; preds = %58
  %62 = load i32, ptr %4, align 4
  %63 = add nsw i32 %62, -1
  store i32 %63, ptr %4, align 4
  %64 = icmp sgt i32 %62, 0
  store i1 %64, ptr %.reg2mem, align 1
  br label %65

65:                                               ; preds = %61, %58
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %52, label %66, !llvm.loop !87

66:                                               ; preds = %65
  br label %70

67:                                               ; preds = %9
  %68 = load i32, ptr %5, align 4
  store i32 %68, ptr %6, align 4
  br label %70

69:                                               ; preds = %50, %31
  br label %70

70:                                               ; preds = %69, %67, %66, %46, %21
  %71 = load i32, ptr %6, align 4
  ret i32 %71
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_125_switch_goto_pointer_array(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %39 [
    i32 0, label %11
    i32 1, label %22
    i32 2, label %33
  ]

11:                                               ; preds = %9
  %12 = load i32, ptr %6, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %7, align 4
  %17 = add nsw i32 %15, %16
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %6, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  store i32 %17, ptr %21, align 4
  br label %48

22:                                               ; preds = %9
  %23 = load i32, ptr %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %7, align 4
  %28 = mul nsw i32 %26, %27
  %29 = load ptr, ptr %5, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 %28, ptr %32, align 4
  br label %48

33:                                               ; preds = %9
  %34 = load i32, ptr %7, align 4
  %35 = load ptr, ptr %5, align 8
  %36 = load i32, ptr %6, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  store i32 %34, ptr %38, align 4
  br label %41

39:                                               ; preds = %9
  %40 = load i32, ptr @g_arr, align 16
  store i32 %40, ptr %8, align 4
  br label %69

41:                                               ; preds = %33
  %42 = load ptr, ptr %5, align 8
  %43 = load i32, ptr %6, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = add nsw i32 %46, 10
  store i32 %47, ptr %45, align 4
  br label %48

48:                                               ; preds = %41, %22, %11
  %49 = load ptr, ptr %5, align 8
  %50 = load i32, ptr %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %49, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %55, label %61

55:                                               ; preds = %48
  %56 = load ptr, ptr %5, align 8
  %57 = load i32, ptr %6, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %56, i64 %58
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %8, align 4
  br label %68

61:                                               ; preds = %48
  %62 = load ptr, ptr %5, align 8
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %62, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = sub nsw i32 0, %66
  store i32 %67, ptr %8, align 4
  br label %68

68:                                               ; preds = %61, %55
  br label %69

69:                                               ; preds = %68, %39
  %70 = load i32, ptr %8, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_126_switch_fallthrough_loop_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem = alloca i32, align 4
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
  store i32 0, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %63 [
    i32 0, label %11
    i32 1, label %14
    i32 2, label %40
    i32 3, label %43
  ]

11:                                               ; preds = %9
  %12 = load i32, ptr %6, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %6, align 4
  br label %14

14:                                               ; preds = %11, %9
  store i32 0, ptr %7, align 4
  br label %15

15:                                               ; preds = %36, %14
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %39

19:                                               ; preds = %15
  %20 = load i32, ptr %7, align 4
  %21 = srem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %29

23:                                               ; preds = %19
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %6, align 4
  br label %35

29:                                               ; preds = %19
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %7, align 4
  %32 = sub nsw i32 %30, %31
  %33 = load i32, ptr %6, align 4
  %34 = sub nsw i32 %33, %32
  store i32 %34, ptr %6, align 4
  br label %35

35:                                               ; preds = %29, %23
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %7, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %7, align 4
  br label %15, !llvm.loop !88

39:                                               ; preds = %15
  br label %65

40:                                               ; preds = %9
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 20
  store i32 %42, ptr %6, align 4
  br label %43

43:                                               ; preds = %40, %9
  store i32 0, ptr %8, align 4
  br label %44

44:                                               ; preds = %59, %43
  %45 = load i32, ptr %8, align 4
  %46 = load i32, ptr %4, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %62

48:                                               ; preds = %44
  %49 = load i32, ptr %8, align 4
  %50 = icmp sgt i32 %49, 2
  br i1 %50, label %51, label %54

51:                                               ; preds = %48
  %52 = load i32, ptr %8, align 4
  %53 = mul nsw i32 %52, 2
  store i32 %53, ptr %.reg2mem, align 4
  br label %56

54:                                               ; preds = %48
  %55 = load i32, ptr %8, align 4
  store i32 %55, ptr %.reg2mem, align 4
  br label %56

56:                                               ; preds = %54, %51
  %.reload = load i32, ptr %.reg2mem, align 4
  %57 = load i32, ptr %6, align 4
  %58 = add nsw i32 %57, %.reload
  store i32 %58, ptr %6, align 4
  br label %59

59:                                               ; preds = %56
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %8, align 4
  br label %44, !llvm.loop !89

62:                                               ; preds = %44
  br label %65

63:                                               ; preds = %9
  %64 = load i32, ptr %5, align 4
  store i32 %64, ptr %6, align 4
  br label %65

65:                                               ; preds = %63, %62, %39
  %66 = load i32, ptr %6, align 4
  ret i32 %66
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_127_nested_switch_array_pointer(i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  br label %9

9:                                                ; preds = %entry
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %84 [
    i32 0, label %11
    i32 1, label %48
  ]

11:                                               ; preds = %9
  %12 = load i32, ptr %5, align 4
  switch i32 %12, label %32 [
    i32 0, label %13
    i32 1, label %22
  ]

13:                                               ; preds = %11
  %14 = load i32, ptr %7, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  store i32 %17, ptr %21, align 4
  br label %42

22:                                               ; preds = %11
  %23 = load i32, ptr %7, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i32 %26, 2
  %28 = load ptr, ptr %6, align 8
  %29 = load i32, ptr %7, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %28, i64 %30
  store i32 %27, ptr %31, align 4
  br label %42

32:                                               ; preds = %11
  %33 = load i32, ptr %7, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = add nsw i32 %36, 10
  %38 = load ptr, ptr %6, align 8
  %39 = load i32, ptr %7, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %38, i64 %40
  store i32 %37, ptr %41, align 4
  br label %42

42:                                               ; preds = %32, %22, %13
  %43 = load ptr, ptr %6, align 8
  %44 = load i32, ptr %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  store i32 %47, ptr %8, align 4
  br label %90

48:                                               ; preds = %9
  %49 = load i32, ptr %5, align 4
  switch i32 %49, label %72 [
    i32 0, label %50
    i32 1, label %61
  ]

50:                                               ; preds = %48
  %51 = load i32, ptr %7, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = load ptr, ptr %6, align 8
  %56 = load i32, ptr %7, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %55, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = add nsw i32 %54, %59
  store i32 %60, ptr %8, align 4
  br label %83

61:                                               ; preds = %48
  %62 = load i32, ptr %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = load ptr, ptr %6, align 8
  %67 = load i32, ptr %7, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr %66, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = sub nsw i32 %65, %70
  store i32 %71, ptr %8, align 4
  br label %83

72:                                               ; preds = %48
  %73 = load i32, ptr %7, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %74
  %76 = load i32, ptr %75, align 4
  %77 = load ptr, ptr %6, align 8
  %78 = load i32, ptr %7, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, ptr %77, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = mul nsw i32 %76, %81
  store i32 %82, ptr %8, align 4
  br label %83

83:                                               ; preds = %72, %61, %50
  br label %90

84:                                               ; preds = %9
  %85 = load ptr, ptr %6, align 8
  %86 = load i32, ptr %7, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, ptr %85, i64 %87
  %89 = load i32, ptr %88, align 4
  store i32 %89, ptr %8, align 4
  br label %90

90:                                               ; preds = %84, %83, %42
  %91 = load i32, ptr %8, align 4
  %92 = icmp sgt i32 %91, 0
  br i1 %92, label %93, label %97

93:                                               ; preds = %90
  %94 = load i32, ptr @g_arr, align 16
  %95 = load i32, ptr %8, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, ptr %8, align 4
  br label %101

97:                                               ; preds = %90
  %98 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %99 = load i32, ptr %8, align 4
  %100 = sub nsw i32 %99, %98
  store i32 %100, ptr %8, align 4
  br label %101

101:                                              ; preds = %97, %93
  %102 = load i32, ptr %8, align 4
  ret i32 %102
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_128_switch_array_pointer_loops(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem7 = alloca i32, align 4
  %.reg2mem5 = alloca i1, align 1
  %.reg2mem3 = alloca i1, align 1
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i1, align 1
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  br label %13

13:                                               ; preds = %entry
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %166 [
    i32 0, label %15
    i32 1, label %77
    i32 2, label %129
  ]

15:                                               ; preds = %13
  store i32 0, ptr %9, align 4
  br label %16

16:                                               ; preds = %73, %15
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  store i1 false, ptr %.reg2mem, align 1
  br i1 %19, label %20, label %23

20:                                               ; preds = %16
  %21 = load i32, ptr %9, align 4
  %22 = icmp slt i32 %21, 8
  store i1 %22, ptr %.reg2mem, align 1
  br label %23

23:                                               ; preds = %20, %16
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %24, label %76

24:                                               ; preds = %23
  %25 = load i32, ptr %9, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %37

30:                                               ; preds = %24
  %31 = load i32, ptr %9, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %.reg2mem1, align 4
  br label %44

37:                                               ; preds = %24
  %38 = load i32, ptr %9, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = load i32, ptr %7, align 4
  %43 = sub nsw i32 %41, %42
  store i32 %43, ptr %.reg2mem1, align 4
  br label %44

44:                                               ; preds = %30, %37
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %45 = load ptr, ptr %5, align 8
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %45, i64 %47
  store i32 %.reload2, ptr %48, align 4
  br label %49

49:                                               ; preds = %44
  %50 = load ptr, ptr %5, align 8
  %51 = load i32, ptr %9, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr %50, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %64

56:                                               ; preds = %49
  %57 = load ptr, ptr %5, align 8
  %58 = load i32, ptr %9, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %8, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %8, align 4
  br label %72

64:                                               ; preds = %49
  %65 = load ptr, ptr %5, align 8
  %66 = load i32, ptr %9, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, ptr %65, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = load i32, ptr %8, align 4
  %71 = sub nsw i32 %70, %69
  store i32 %71, ptr %8, align 4
  br label %72

72:                                               ; preds = %64, %56
  br label %73

73:                                               ; preds = %72
  %74 = load i32, ptr %9, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %9, align 4
  br label %16, !llvm.loop !90

76:                                               ; preds = %23
  br label %179

77:                                               ; preds = %13
  store i32 0, ptr %10, align 4
  br label %78

78:                                               ; preds = %125, %77
  %79 = load i32, ptr %10, align 4
  %80 = load i32, ptr %6, align 4
  %81 = icmp slt i32 %79, %80
  store i1 false, ptr %.reg2mem3, align 1
  br i1 %81, label %82, label %85

82:                                               ; preds = %78
  %83 = load i32, ptr %10, align 4
  %84 = icmp slt i32 %83, 8
  store i1 %84, ptr %.reg2mem3, align 1
  br label %85

85:                                               ; preds = %82, %78
  %.reload4 = load i1, ptr %.reg2mem3, align 1
  br i1 %.reload4, label %86, label %128

86:                                               ; preds = %85
  %87 = load i32, ptr %7, align 4
  %88 = load i32, ptr %10, align 4
  %89 = add nsw i32 %87, %88
  %90 = load ptr, ptr %5, align 8
  %91 = load i32, ptr %10, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, ptr %90, i64 %92
  store i32 %89, ptr %93, align 4
  store i32 0, ptr %11, align 4
  br label %94

94:                                               ; preds = %121, %86
  %95 = load i32, ptr %11, align 4
  %96 = icmp slt i32 %95, 2
  br i1 %96, label %97, label %124

97:                                               ; preds = %94
  %98 = load i32, ptr %10, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %99
  %101 = load i32, ptr %100, align 4
  %102 = load i32, ptr %11, align 4
  %103 = icmp sgt i32 %101, %102
  br i1 %103, label %104, label %112

104:                                              ; preds = %97
  %105 = load ptr, ptr %5, align 8
  %106 = load i32, ptr %10, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, ptr %105, i64 %107
  %109 = load i32, ptr %108, align 4
  %110 = load i32, ptr %8, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, ptr %8, align 4
  br label %120

112:                                              ; preds = %97
  %113 = load ptr, ptr %5, align 8
  %114 = load i32, ptr %10, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, ptr %113, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = load i32, ptr %8, align 4
  %119 = sub nsw i32 %118, %117
  store i32 %119, ptr %8, align 4
  br label %120

120:                                              ; preds = %112, %104
  br label %121

121:                                              ; preds = %120
  %122 = load i32, ptr %11, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, ptr %11, align 4
  br label %94, !llvm.loop !91

124:                                              ; preds = %94
  br label %125

125:                                              ; preds = %124
  %126 = load i32, ptr %10, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, ptr %10, align 4
  br label %78, !llvm.loop !92

128:                                              ; preds = %85
  br label %179

129:                                              ; preds = %13
  store i32 0, ptr %12, align 4
  br label %130

130:                                              ; preds = %162, %129
  %131 = load i32, ptr %12, align 4
  %132 = load i32, ptr %6, align 4
  %133 = icmp slt i32 %131, %132
  store i1 false, ptr %.reg2mem5, align 1
  br i1 %133, label %134, label %137

134:                                              ; preds = %130
  %135 = load i32, ptr %12, align 4
  %136 = icmp slt i32 %135, 8
  store i1 %136, ptr %.reg2mem5, align 1
  br label %137

137:                                              ; preds = %134, %130
  %.reload6 = load i1, ptr %.reg2mem5, align 1
  br i1 %.reload6, label %138, label %165

138:                                              ; preds = %137
  %139 = load ptr, ptr %5, align 8
  %140 = load i32, ptr %12, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, ptr %139, i64 %141
  %143 = load i32, ptr %142, align 4
  %144 = icmp sgt i32 %143, 0
  br i1 %144, label %145, label %152

145:                                              ; preds = %138
  %146 = load ptr, ptr %5, align 8
  %147 = load i32, ptr %12, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, ptr %146, i64 %148
  %150 = load i32, ptr %149, align 4
  %151 = mul nsw i32 %150, 2
  store i32 %151, ptr %.reg2mem7, align 4
  br label %159

152:                                              ; preds = %138
  %153 = load ptr, ptr %5, align 8
  %154 = load i32, ptr %12, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, ptr %153, i64 %155
  %157 = load i32, ptr %156, align 4
  %158 = sub nsw i32 %157, 2
  store i32 %158, ptr %.reg2mem7, align 4
  br label %159

159:                                              ; preds = %152, %145
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %160 = load i32, ptr %8, align 4
  %161 = add nsw i32 %160, %.reload8
  store i32 %161, ptr %8, align 4
  br label %162

162:                                              ; preds = %159
  %163 = load i32, ptr %12, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, ptr %12, align 4
  br label %130, !llvm.loop !93

165:                                              ; preds = %137
  br label %179

166:                                              ; preds = %13
  %167 = load ptr, ptr %5, align 8
  %168 = getelementptr inbounds i32, ptr %167, i64 0
  %169 = load i32, ptr %168, align 4
  store i32 %169, ptr %8, align 4
  br label %170

170:                                              ; preds = %166
  %171 = load i32, ptr %8, align 4
  %172 = load i32, ptr @g_arr, align 16
  %173 = icmp sgt i32 %171, %172
  br i1 %173, label %174, label %178

174:                                              ; preds = %170
  %175 = load i32, ptr @g_arr, align 16
  %176 = load i32, ptr %8, align 4
  %177 = add nsw i32 %176, %175
  store i32 %177, ptr %8, align 4
  br label %178

178:                                              ; preds = %174, %170
  br label %179

179:                                              ; preds = %178, %165, %128, %76
  %180 = load i32, ptr %8, align 4
  ret i32 %180
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_129_switch_vla_nested(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  br label %17

17:                                               ; preds = %entry
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  br label %18

18:                                               ; preds = %17
  %19 = load i32, ptr %6, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %18
  %22 = load i32, ptr %6, align 4
  store i32 %22, ptr %.reg2mem, align 4
  br label %24

23:                                               ; preds = %18
  store i32 1, ptr %.reg2mem, align 4
  br label %24

24:                                               ; preds = %23, %21
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %8, align 4
  %25 = load i32, ptr %8, align 4
  %26 = zext i32 %25 to i64
  %27 = call ptr @llvm.stacksave()
  store ptr %27, ptr %9, align 8
  %28 = alloca i32, i64 %26, align 16
  store ptr %28, ptr %.reg2mem1, align 8
  store i64 %26, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %29

29:                                               ; preds = %44, %24
  %30 = load i32, ptr %11, align 4
  %31 = load i32, ptr %8, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %47

33:                                               ; preds = %29
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %11, align 4
  %36 = srem i32 %35, 8
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = add nsw i32 %34, %39
  %41 = load i32, ptr %11, align 4
  %42 = sext i32 %41 to i64
  %.reload9 = load ptr, ptr %.reg2mem1, align 8
  %43 = getelementptr inbounds i32, ptr %.reload9, i64 %42
  store i32 %40, ptr %43, align 4
  br label %44

44:                                               ; preds = %33
  %45 = load i32, ptr %11, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %11, align 4
  br label %29, !llvm.loop !94

47:                                               ; preds = %29
  store i32 0, ptr %12, align 4
  %48 = load i32, ptr %4, align 4
  switch i32 %48, label %176 [
    i32 0, label %49
    i32 1, label %79
    i32 2, label %126
  ]

49:                                               ; preds = %47
  store i32 0, ptr %13, align 4
  br label %50

50:                                               ; preds = %75, %49
  %51 = load i32, ptr %13, align 4
  %52 = load i32, ptr %8, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %78

54:                                               ; preds = %50
  %55 = load i32, ptr %13, align 4
  %56 = sext i32 %55 to i64
  %.reload8 = load ptr, ptr %.reg2mem1, align 8
  %57 = getelementptr inbounds i32, ptr %.reload8, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %67

60:                                               ; preds = %54
  %61 = load i32, ptr %13, align 4
  %62 = sext i32 %61 to i64
  %.reload7 = load ptr, ptr %.reg2mem1, align 8
  %63 = getelementptr inbounds i32, ptr %.reload7, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = load i32, ptr %12, align 4
  %66 = add nsw i32 %65, %64
  store i32 %66, ptr %12, align 4
  br label %74

67:                                               ; preds = %54
  %68 = load i32, ptr %13, align 4
  %69 = sext i32 %68 to i64
  %.reload6 = load ptr, ptr %.reg2mem1, align 8
  %70 = getelementptr inbounds i32, ptr %.reload6, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = load i32, ptr %12, align 4
  %73 = sub nsw i32 %72, %71
  store i32 %73, ptr %12, align 4
  br label %74

74:                                               ; preds = %67, %60
  br label %75

75:                                               ; preds = %74
  %76 = load i32, ptr %13, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %13, align 4
  br label %50, !llvm.loop !95

78:                                               ; preds = %50
  br label %179

79:                                               ; preds = %47
  store i32 0, ptr %14, align 4
  br label %80

80:                                               ; preds = %122, %79
  %81 = load i32, ptr %14, align 4
  %82 = load i32, ptr %8, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %125

84:                                               ; preds = %80
  store i32 0, ptr %15, align 4
  br label %85

85:                                               ; preds = %118, %84
  %86 = load i32, ptr %15, align 4
  %87 = load i32, ptr %14, align 4
  %88 = icmp sle i32 %86, %87
  br i1 %88, label %89, label %121

89:                                               ; preds = %85
  %90 = load ptr, ptr %5, align 8
  %91 = load i32, ptr %15, align 4
  %92 = srem i32 %91, 8
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, ptr %90, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = load i32, ptr %14, align 4
  %97 = sext i32 %96 to i64
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %98 = getelementptr inbounds i32, ptr %.reload5, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = icmp sgt i32 %95, %99
  br i1 %100, label %101, label %110

101:                                              ; preds = %89
  %102 = load ptr, ptr %5, align 8
  %103 = load i32, ptr %15, align 4
  %104 = srem i32 %103, 8
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, ptr %102, i64 %105
  %107 = load i32, ptr %106, align 4
  %108 = load i32, ptr %12, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %12, align 4
  br label %117

110:                                              ; preds = %89
  %111 = load i32, ptr %14, align 4
  %112 = sext i32 %111 to i64
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %113 = getelementptr inbounds i32, ptr %.reload4, i64 %112
  %114 = load i32, ptr %113, align 4
  %115 = load i32, ptr %12, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %12, align 4
  br label %117

117:                                              ; preds = %110, %101
  br label %118

118:                                              ; preds = %117
  %119 = load i32, ptr %15, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %15, align 4
  br label %85, !llvm.loop !96

121:                                              ; preds = %85
  br label %122

122:                                              ; preds = %121
  %123 = load i32, ptr %14, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, ptr %14, align 4
  br label %80, !llvm.loop !97

125:                                              ; preds = %80
  br label %179

126:                                              ; preds = %47
  store i32 0, ptr %16, align 4
  br label %127

127:                                              ; preds = %172, %126
  %128 = load i32, ptr %16, align 4
  %129 = load i32, ptr %8, align 4
  %130 = icmp slt i32 %128, %129
  br i1 %130, label %131, label %175

131:                                              ; preds = %127
  %132 = load i32, ptr %16, align 4
  %133 = sext i32 %132 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %134 = getelementptr inbounds i32, ptr %.reload3, i64 %133
  %135 = load i32, ptr %134, align 4
  %136 = load ptr, ptr %5, align 8
  %137 = load i32, ptr %16, align 4
  %138 = srem i32 %137, 8
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, ptr %136, i64 %139
  store i32 %135, ptr %140, align 4
  br label %141

141:                                              ; preds = %131
  %142 = load ptr, ptr %5, align 8
  %143 = load i32, ptr %16, align 4
  %144 = srem i32 %143, 8
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, ptr %142, i64 %145
  %147 = load i32, ptr %146, align 4
  %148 = load i32, ptr %16, align 4
  %149 = srem i32 %148, 8
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %150
  %152 = load i32, ptr %151, align 4
  %153 = icmp sgt i32 %147, %152
  br i1 %153, label %154, label %163

154:                                              ; preds = %141
  %155 = load ptr, ptr %5, align 8
  %156 = load i32, ptr %16, align 4
  %157 = srem i32 %156, 8
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, ptr %155, i64 %158
  %160 = load i32, ptr %159, align 4
  %161 = load i32, ptr %12, align 4
  %162 = add nsw i32 %161, %160
  store i32 %162, ptr %12, align 4
  br label %171

163:                                              ; preds = %141
  %164 = load i32, ptr %16, align 4
  %165 = srem i32 %164, 8
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %166
  %168 = load i32, ptr %167, align 4
  %169 = load i32, ptr %12, align 4
  %170 = sub nsw i32 %169, %168
  store i32 %170, ptr %12, align 4
  br label %171

171:                                              ; preds = %163, %154
  br label %172

172:                                              ; preds = %171
  %173 = load i32, ptr %16, align 4
  %174 = add nsw i32 %173, 1
  store i32 %174, ptr %16, align 4
  br label %127, !llvm.loop !98

175:                                              ; preds = %127
  br label %179

176:                                              ; preds = %47
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %177 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %178 = load i32, ptr %177, align 16
  store i32 %178, ptr %12, align 4
  br label %179

179:                                              ; preds = %176, %175, %125, %78
  %180 = load i32, ptr %12, align 4
  %181 = load ptr, ptr %9, align 8
  call void @llvm.stackrestore(ptr %181)
  ret i32 %180
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_130_switch_stress(i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 {
entry:
  %.reg2mem19 = alloca ptr, align 8
  %.reg2mem17 = alloca i32, align 4
  %.reg2mem15 = alloca i32, align 4
  %.reg2mem13 = alloca i32, align 4
  %.reg2mem11 = alloca i32, align 4
  %.reg2mem9 = alloca i32, align 4
  %.reg2mem7 = alloca i32, align 4
  %.reg2mem5 = alloca i32, align 4
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
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
  br label %29

29:                                               ; preds = %entry
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  store i32 %6, ptr %13, align 4
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %10, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %35

33:                                               ; preds = %30
  %34 = load i32, ptr %10, align 4
  store i32 %34, ptr %.reg2mem, align 4
  br label %36

35:                                               ; preds = %30
  store i32 1, ptr %.reg2mem, align 4
  br label %36

36:                                               ; preds = %35, %33
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %14, align 4
  %37 = load i32, ptr %14, align 4
  %38 = zext i32 %37 to i64
  %39 = call ptr @llvm.stacksave()
  store ptr %39, ptr %15, align 8
  %40 = alloca i32, i64 %38, align 16
  store ptr %40, ptr %.reg2mem19, align 8
  store i64 %38, ptr %16, align 8
  %41 = load i32, ptr %11, align 4
  %42 = load i32, ptr @g_x, align 4
  %43 = add nsw i32 %41, %42
  store i32 %43, ptr %17, align 4
  store i32 0, ptr %18, align 4
  br label %44

44:                                               ; preds = %64, %36
  %45 = load i32, ptr %18, align 4
  %46 = load i32, ptr %14, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %67

48:                                               ; preds = %44
  %49 = load i32, ptr %18, align 4
  %50 = srem i32 %49, 2
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %56

52:                                               ; preds = %48
  %53 = load i32, ptr %11, align 4
  %54 = load i32, ptr %18, align 4
  %55 = add nsw i32 %53, %54
  store i32 %55, ptr %.reg2mem1, align 4
  br label %60

56:                                               ; preds = %48
  %57 = load i32, ptr %12, align 4
  %58 = load i32, ptr %18, align 4
  %59 = sub nsw i32 %57, %58
  store i32 %59, ptr %.reg2mem1, align 4
  br label %60

60:                                               ; preds = %56, %52
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %61 = load i32, ptr %18, align 4
  %62 = sext i32 %61 to i64
  %.reload40 = load ptr, ptr %.reg2mem19, align 8
  %63 = getelementptr inbounds i32, ptr %.reload40, i64 %62
  store i32 %.reload2, ptr %63, align 4
  br label %64

64:                                               ; preds = %60
  %65 = load i32, ptr %18, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %18, align 4
  br label %44, !llvm.loop !99

67:                                               ; preds = %44
  %68 = load i32, ptr %7, align 4
  switch i32 %68, label %463 [
    i32 0, label %69
    i32 1, label %146
    i32 2, label %299
    i32 3, label %395
  ]

69:                                               ; preds = %67
  store i32 0, ptr %19, align 4
  br label %70

70:                                               ; preds = %142, %69
  %71 = load i32, ptr %19, align 4
  %72 = load i32, ptr %14, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %145

74:                                               ; preds = %70
  %75 = load i32, ptr %19, align 4
  %76 = sext i32 %75 to i64
  %.reload39 = load ptr, ptr %.reg2mem19, align 8
  %77 = getelementptr inbounds i32, ptr %.reload39, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = load i32, ptr %12, align 4
  %80 = icmp sgt i32 %78, %79
  br i1 %80, label %81, label %109

81:                                               ; preds = %74
  %82 = load ptr, ptr %9, align 8
  %83 = icmp ne ptr %82, null
  br i1 %83, label %84, label %101

84:                                               ; preds = %81
  %85 = load ptr, ptr %9, align 8
  %86 = load i32, ptr %19, align 4
  %87 = srem i32 %86, 8
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, ptr %85, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %92, label %101

92:                                               ; preds = %84
  %93 = load ptr, ptr %9, align 8
  %94 = load i32, ptr %19, align 4
  %95 = srem i32 %94, 8
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, ptr %93, i64 %96
  %98 = load i32, ptr %97, align 4
  %99 = load i32, ptr %17, align 4
  %100 = add nsw i32 %99, %98
  store i32 %100, ptr %17, align 4
  br label %108

101:                                              ; preds = %84, %81
  %102 = load i32, ptr %19, align 4
  %103 = sext i32 %102 to i64
  %.reload38 = load ptr, ptr %.reg2mem19, align 8
  %104 = getelementptr inbounds i32, ptr %.reload38, i64 %103
  %105 = load i32, ptr %104, align 4
  %106 = load i32, ptr %17, align 4
  %107 = add nsw i32 %106, %105
  store i32 %107, ptr %17, align 4
  br label %108

108:                                              ; preds = %101, %92
  br label %137

109:                                              ; preds = %74
  %110 = load i32, ptr %19, align 4
  %111 = sext i32 %110 to i64
  %.reload37 = load ptr, ptr %.reg2mem19, align 8
  %112 = getelementptr inbounds i32, ptr %.reload37, i64 %111
  %113 = load i32, ptr %112, align 4
  %114 = load i32, ptr %17, align 4
  %115 = sub nsw i32 %114, %113
  store i32 %115, ptr %17, align 4
  br label %116

116:                                              ; preds = %109
  %117 = load i32, ptr %19, align 4
  %118 = srem i32 %117, 2
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %128

120:                                              ; preds = %116
  %121 = load i32, ptr %19, align 4
  %122 = srem i32 %121, 8
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %123
  %125 = load i32, ptr %124, align 4
  %126 = load i32, ptr %17, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, ptr %17, align 4
  br label %136

128:                                              ; preds = %116
  %129 = load i32, ptr %19, align 4
  %130 = srem i32 %129, 8
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %131
  %133 = load i32, ptr %132, align 4
  %134 = load i32, ptr %17, align 4
  %135 = sub nsw i32 %134, %133
  store i32 %135, ptr %17, align 4
  br label %136

136:                                              ; preds = %128, %120
  br label %137

137:                                              ; preds = %136, %108
  %138 = load i32, ptr %17, align 4
  %139 = icmp sgt i32 %138, 100
  br i1 %139, label %140, label %141

140:                                              ; preds = %137
  br label %567

141:                                              ; preds = %137
  br label %142

142:                                              ; preds = %141
  %143 = load i32, ptr %19, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, ptr %19, align 4
  br label %70, !llvm.loop !100

145:                                              ; preds = %70
  br label %521

146:                                              ; preds = %67
  %147 = load i32, ptr %8, align 4
  switch i32 %147, label %268 [
    i32 0, label %148
    i32 1, label %178
    i32 2, label %218
  ]

148:                                              ; preds = %146
  store i32 0, ptr %20, align 4
  br label %149

149:                                              ; preds = %174, %148
  %150 = load i32, ptr %20, align 4
  %151 = load i32, ptr %14, align 4
  %152 = icmp slt i32 %150, %151
  br i1 %152, label %153, label %177

153:                                              ; preds = %149
  %154 = load i32, ptr %20, align 4
  %155 = sext i32 %154 to i64
  %.reload36 = load ptr, ptr %.reg2mem19, align 8
  %156 = getelementptr inbounds i32, ptr %.reload36, i64 %155
  %157 = load i32, ptr %156, align 4
  %158 = icmp sgt i32 %157, 0
  br i1 %158, label %159, label %166

159:                                              ; preds = %153
  %160 = load i32, ptr %20, align 4
  %161 = sext i32 %160 to i64
  %.reload35 = load ptr, ptr %.reg2mem19, align 8
  %162 = getelementptr inbounds i32, ptr %.reload35, i64 %161
  %163 = load i32, ptr %162, align 4
  %164 = load i32, ptr %17, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %17, align 4
  br label %173

166:                                              ; preds = %153
  %167 = load i32, ptr %20, align 4
  %168 = sext i32 %167 to i64
  %.reload34 = load ptr, ptr %.reg2mem19, align 8
  %169 = getelementptr inbounds i32, ptr %.reload34, i64 %168
  %170 = load i32, ptr %169, align 4
  %171 = load i32, ptr %17, align 4
  %172 = sub nsw i32 %171, %170
  store i32 %172, ptr %17, align 4
  br label %173

173:                                              ; preds = %166, %159
  br label %174

174:                                              ; preds = %173
  %175 = load i32, ptr %20, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, ptr %20, align 4
  br label %149, !llvm.loop !101

177:                                              ; preds = %149
  br label %293

178:                                              ; preds = %146
  store i32 0, ptr %21, align 4
  br label %179

179:                                              ; preds = %214, %178
  %180 = load i32, ptr %21, align 4
  %181 = load i32, ptr %14, align 4
  %182 = icmp slt i32 %180, %181
  br i1 %182, label %183, label %217

183:                                              ; preds = %179
  %184 = load i32, ptr %21, align 4
  %185 = sext i32 %184 to i64
  %.reload33 = load ptr, ptr %.reg2mem19, align 8
  %186 = getelementptr inbounds i32, ptr %.reload33, i64 %185
  %187 = load i32, ptr %186, align 4
  %188 = icmp sgt i32 %187, 0
  br i1 %188, label %189, label %194

189:                                              ; preds = %183
  %190 = load i32, ptr %21, align 4
  %191 = sext i32 %190 to i64
  %.reload32 = load ptr, ptr %.reg2mem19, align 8
  %192 = getelementptr inbounds i32, ptr %.reload32, i64 %191
  %193 = load i32, ptr %192, align 4
  store i32 %193, ptr %.reg2mem3, align 4
  br label %200

194:                                              ; preds = %183
  %195 = load i32, ptr %21, align 4
  %196 = sext i32 %195 to i64
  %.reload31 = load ptr, ptr %.reg2mem19, align 8
  %197 = getelementptr inbounds i32, ptr %.reload31, i64 %196
  %198 = load i32, ptr %197, align 4
  %199 = sub nsw i32 0, %198
  store i32 %199, ptr %.reg2mem3, align 4
  br label %200

200:                                              ; preds = %194, %189
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %201 = load ptr, ptr %9, align 8
  %202 = load i32, ptr %21, align 4
  %203 = srem i32 %202, 8
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds i32, ptr %201, i64 %204
  store i32 %.reload4, ptr %205, align 4
  %206 = load ptr, ptr %9, align 8
  %207 = load i32, ptr %21, align 4
  %208 = srem i32 %207, 8
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds i32, ptr %206, i64 %209
  %211 = load i32, ptr %210, align 4
  %212 = load i32, ptr %17, align 4
  %213 = add nsw i32 %212, %211
  store i32 %213, ptr %17, align 4
  br label %214

214:                                              ; preds = %200
  %215 = load i32, ptr %21, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, ptr %21, align 4
  br label %179, !llvm.loop !102

217:                                              ; preds = %179
  br label %293

218:                                              ; preds = %146
  store i32 0, ptr %22, align 4
  br label %219

219:                                              ; preds = %264, %218
  %220 = load i32, ptr %22, align 4
  %221 = load i32, ptr %14, align 4
  %222 = icmp slt i32 %220, %221
  br i1 %222, label %223, label %267

223:                                              ; preds = %219
  %224 = load ptr, ptr %9, align 8
  %225 = icmp ne ptr %224, null
  br i1 %225, label %226, label %257

226:                                              ; preds = %223
  %227 = load ptr, ptr %9, align 8
  %228 = load i32, ptr %22, align 4
  %229 = srem i32 %228, 8
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds i32, ptr %227, i64 %230
  %232 = load i32, ptr %231, align 4
  %233 = load i32, ptr %22, align 4
  %234 = srem i32 %233, 8
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %235
  %237 = load i32, ptr %236, align 4
  %238 = icmp sgt i32 %232, %237
  br i1 %238, label %239, label %248

239:                                              ; preds = %226
  %240 = load ptr, ptr %9, align 8
  %241 = load i32, ptr %22, align 4
  %242 = srem i32 %241, 8
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds i32, ptr %240, i64 %243
  %245 = load i32, ptr %244, align 4
  %246 = load i32, ptr %17, align 4
  %247 = add nsw i32 %246, %245
  store i32 %247, ptr %17, align 4
  br label %256

248:                                              ; preds = %226
  %249 = load i32, ptr %22, align 4
  %250 = srem i32 %249, 8
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %251
  %253 = load i32, ptr %252, align 4
  %254 = load i32, ptr %17, align 4
  %255 = add nsw i32 %254, %253
  store i32 %255, ptr %17, align 4
  br label %256

256:                                              ; preds = %248, %239
  br label %264

257:                                              ; preds = %223
  %258 = load i32, ptr %22, align 4
  %259 = sext i32 %258 to i64
  %.reload30 = load ptr, ptr %.reg2mem19, align 8
  %260 = getelementptr inbounds i32, ptr %.reload30, i64 %259
  %261 = load i32, ptr %260, align 4
  %262 = load i32, ptr %17, align 4
  %263 = add nsw i32 %262, %261
  store i32 %263, ptr %17, align 4
  br label %264

264:                                              ; preds = %257, %256
  %265 = load i32, ptr %22, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, ptr %22, align 4
  br label %219, !llvm.loop !103

267:                                              ; preds = %219
  br label %293

268:                                              ; preds = %146
  %269 = load i32, ptr %11, align 4
  %270 = load i32, ptr %12, align 4
  %271 = icmp sgt i32 %269, %270
  br i1 %271, label %272, label %281

272:                                              ; preds = %268
  %273 = load i32, ptr %11, align 4
  %274 = load i32, ptr %13, align 4
  %275 = icmp sgt i32 %273, %274
  br i1 %275, label %276, label %278

276:                                              ; preds = %272
  %277 = load i32, ptr %11, align 4
  store i32 %277, ptr %.reg2mem5, align 4
  br label %280

278:                                              ; preds = %272
  %279 = load i32, ptr %13, align 4
  store i32 %279, ptr %.reg2mem5, align 4
  br label %280

280:                                              ; preds = %278, %276
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %.reg2mem9, align 4
  br label %290

281:                                              ; preds = %268
  %282 = load i32, ptr %12, align 4
  %283 = load i32, ptr %13, align 4
  %284 = icmp sgt i32 %282, %283
  br i1 %284, label %285, label %287

285:                                              ; preds = %281
  %286 = load i32, ptr %12, align 4
  store i32 %286, ptr %.reg2mem7, align 4
  br label %289

287:                                              ; preds = %281
  %288 = load i32, ptr %13, align 4
  store i32 %288, ptr %.reg2mem7, align 4
  br label %289

289:                                              ; preds = %287, %285
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  store i32 %.reload8, ptr %.reg2mem9, align 4
  br label %290

290:                                              ; preds = %289, %280
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  %291 = load i32, ptr %17, align 4
  %292 = add nsw i32 %291, %.reload10
  store i32 %292, ptr %17, align 4
  br label %567

293:                                              ; preds = %267, %217, %177
  %294 = load i32, ptr %17, align 4
  %295 = load i32, ptr @g_z, align 4
  %296 = icmp sgt i32 %294, %295
  br i1 %296, label %297, label %298

297:                                              ; preds = %293
  br label %567

298:                                              ; preds = %293
  br label %521

299:                                              ; preds = %67
  store i32 0, ptr %23, align 4
  br label %300

300:                                              ; preds = %391, %299
  %301 = load i32, ptr %23, align 4
  %302 = load i32, ptr %14, align 4
  %303 = icmp slt i32 %301, %302
  br i1 %303, label %304, label %394

304:                                              ; preds = %300
  %305 = load i32, ptr %11, align 4
  %306 = load i32, ptr %23, align 4
  %307 = add nsw i32 %305, %306
  %308 = srem i32 %307, 3
  switch i32 %308, label %365 [
    i32 0, label %309
    i32 1, label %317
  ]

309:                                              ; preds = %304
  %310 = load i32, ptr %23, align 4
  %311 = srem i32 %310, 8
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %312
  %314 = load i32, ptr %313, align 4
  %315 = load i32, ptr %17, align 4
  %316 = add nsw i32 %315, %314
  store i32 %316, ptr %17, align 4
  br label %386

317:                                              ; preds = %304
  %318 = load ptr, ptr %9, align 8
  %319 = icmp ne ptr %318, null
  br i1 %319, label %320, label %357

320:                                              ; preds = %317
  %321 = load i32, ptr %23, align 4
  %322 = sext i32 %321 to i64
  %.reload29 = load ptr, ptr %.reg2mem19, align 8
  %323 = getelementptr inbounds i32, ptr %.reload29, i64 %322
  %324 = load i32, ptr %323, align 4
  %325 = load ptr, ptr %9, align 8
  %326 = load i32, ptr %23, align 4
  %327 = srem i32 %326, 8
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds i32, ptr %325, i64 %328
  store i32 %324, ptr %329, align 4
  br label %330

330:                                              ; preds = %320
  %331 = load ptr, ptr %9, align 8
  %332 = load i32, ptr %23, align 4
  %333 = srem i32 %332, 8
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds i32, ptr %331, i64 %334
  %336 = load i32, ptr %335, align 4
  %337 = icmp sgt i32 %336, 0
  br i1 %337, label %338, label %347

338:                                              ; preds = %330
  %339 = load ptr, ptr %9, align 8
  %340 = load i32, ptr %23, align 4
  %341 = srem i32 %340, 8
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds i32, ptr %339, i64 %342
  %344 = load i32, ptr %343, align 4
  %345 = load i32, ptr %17, align 4
  %346 = add nsw i32 %345, %344
  store i32 %346, ptr %17, align 4
  br label %356

347:                                              ; preds = %330
  %348 = load ptr, ptr %9, align 8
  %349 = load i32, ptr %23, align 4
  %350 = srem i32 %349, 8
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds i32, ptr %348, i64 %351
  %353 = load i32, ptr %352, align 4
  %354 = load i32, ptr %17, align 4
  %355 = sub nsw i32 %354, %353
  store i32 %355, ptr %17, align 4
  br label %356

356:                                              ; preds = %347, %338
  br label %364

357:                                              ; preds = %317
  %358 = load i32, ptr %23, align 4
  %359 = sext i32 %358 to i64
  %.reload28 = load ptr, ptr %.reg2mem19, align 8
  %360 = getelementptr inbounds i32, ptr %.reload28, i64 %359
  %361 = load i32, ptr %360, align 4
  %362 = load i32, ptr %17, align 4
  %363 = add nsw i32 %362, %361
  store i32 %363, ptr %17, align 4
  br label %364

364:                                              ; preds = %357, %356
  br label %386

365:                                              ; preds = %304
  %366 = load i32, ptr %23, align 4
  %367 = sext i32 %366 to i64
  %.reload27 = load ptr, ptr %.reg2mem19, align 8
  %368 = getelementptr inbounds i32, ptr %.reload27, i64 %367
  %369 = load i32, ptr %368, align 4
  %370 = icmp sgt i32 %369, 0
  br i1 %370, label %371, label %377

371:                                              ; preds = %365
  %372 = load i32, ptr %23, align 4
  %373 = sext i32 %372 to i64
  %.reload26 = load ptr, ptr %.reg2mem19, align 8
  %374 = getelementptr inbounds i32, ptr %.reload26, i64 %373
  %375 = load i32, ptr %374, align 4
  %376 = mul nsw i32 %375, 2
  store i32 %376, ptr %.reg2mem11, align 4
  br label %383

377:                                              ; preds = %365
  %378 = load i32, ptr %23, align 4
  %379 = sext i32 %378 to i64
  %.reload25 = load ptr, ptr %.reg2mem19, align 8
  %380 = getelementptr inbounds i32, ptr %.reload25, i64 %379
  %381 = load i32, ptr %380, align 4
  %382 = sub nsw i32 %381, 2
  store i32 %382, ptr %.reg2mem11, align 4
  br label %383

383:                                              ; preds = %377, %371
  %.reload12 = load i32, ptr %.reg2mem11, align 4
  %384 = load i32, ptr %17, align 4
  %385 = add nsw i32 %384, %.reload12
  store i32 %385, ptr %17, align 4
  br label %386

386:                                              ; preds = %383, %364, %309
  %387 = load i32, ptr %17, align 4
  %388 = icmp slt i32 %387, -100
  br i1 %388, label %389, label %390

389:                                              ; preds = %386
  br label %564

390:                                              ; preds = %386
  br label %391

391:                                              ; preds = %390
  %392 = load i32, ptr %23, align 4
  %393 = add nsw i32 %392, 1
  store i32 %393, ptr %23, align 4
  br label %300, !llvm.loop !104

394:                                              ; preds = %300
  br label %521

395:                                              ; preds = %67
  %396 = load i32, ptr %11, align 4
  %397 = load i32, ptr %12, align 4
  %398 = icmp sgt i32 %396, %397
  br i1 %398, label %399, label %440

399:                                              ; preds = %395
  store i32 0, ptr %24, align 4
  br label %400

400:                                              ; preds = %436, %399
  %401 = load i32, ptr %24, align 4
  %402 = load i32, ptr %14, align 4
  %403 = icmp slt i32 %401, %402
  br i1 %403, label %404, label %439

404:                                              ; preds = %400
  %405 = load i32, ptr %13, align 4
  %406 = load i32, ptr %24, align 4
  %407 = icmp sgt i32 %405, %406
  br i1 %407, label %408, label %428

408:                                              ; preds = %404
  %409 = load i32, ptr %24, align 4
  %410 = sext i32 %409 to i64
  %.reload24 = load ptr, ptr %.reg2mem19, align 8
  %411 = getelementptr inbounds i32, ptr %.reload24, i64 %410
  %412 = load i32, ptr %411, align 4
  %413 = load i32, ptr %17, align 4
  %414 = add nsw i32 %413, %412
  store i32 %414, ptr %17, align 4
  br label %415

415:                                              ; preds = %408
  %416 = load ptr, ptr %9, align 8
  %417 = icmp ne ptr %416, null
  br i1 %417, label %418, label %427

418:                                              ; preds = %415
  %419 = load ptr, ptr %9, align 8
  %420 = load i32, ptr %419, align 4
  %421 = icmp sgt i32 %420, 0
  br i1 %421, label %422, label %427

422:                                              ; preds = %418
  %423 = load ptr, ptr %9, align 8
  %424 = load i32, ptr %423, align 4
  %425 = load i32, ptr %17, align 4
  %426 = add nsw i32 %425, %424
  store i32 %426, ptr %17, align 4
  br label %427

427:                                              ; preds = %422, %418, %415
  br label %435

428:                                              ; preds = %404
  %429 = load i32, ptr %24, align 4
  %430 = sext i32 %429 to i64
  %.reload23 = load ptr, ptr %.reg2mem19, align 8
  %431 = getelementptr inbounds i32, ptr %.reload23, i64 %430
  %432 = load i32, ptr %431, align 4
  %433 = load i32, ptr %17, align 4
  %434 = sub nsw i32 %433, %432
  store i32 %434, ptr %17, align 4
  br label %435

435:                                              ; preds = %428, %427
  br label %436

436:                                              ; preds = %435
  %437 = load i32, ptr %24, align 4
  %438 = add nsw i32 %437, 1
  store i32 %438, ptr %24, align 4
  br label %400, !llvm.loop !105

439:                                              ; preds = %400
  br label %462

440:                                              ; preds = %395
  store i32 0, ptr %25, align 4
  br label %441

441:                                              ; preds = %457, %440
  %442 = load i32, ptr %11, align 4
  %443 = icmp sgt i32 %442, 0
  br i1 %443, label %444, label %448

444:                                              ; preds = %441
  %445 = load i32, ptr %11, align 4
  %446 = load i32, ptr %25, align 4
  %447 = add nsw i32 %445, %446
  store i32 %447, ptr %.reg2mem13, align 4
  br label %452

448:                                              ; preds = %441
  %449 = load i32, ptr %12, align 4
  %450 = load i32, ptr %25, align 4
  %451 = sub nsw i32 %449, %450
  store i32 %451, ptr %.reg2mem13, align 4
  br label %452

452:                                              ; preds = %448, %444
  %.reload14 = load i32, ptr %.reg2mem13, align 4
  %453 = load i32, ptr %17, align 4
  %454 = add nsw i32 %453, %.reload14
  store i32 %454, ptr %17, align 4
  %455 = load i32, ptr %25, align 4
  %456 = add nsw i32 %455, 1
  store i32 %456, ptr %25, align 4
  br label %457

457:                                              ; preds = %452
  %458 = load i32, ptr %25, align 4
  %459 = load i32, ptr %14, align 4
  %460 = icmp slt i32 %458, %459
  br i1 %460, label %441, label %461, !llvm.loop !106

461:                                              ; preds = %457
  br label %462

462:                                              ; preds = %461, %439
  br label %567

463:                                              ; preds = %67
  %464 = load ptr, ptr %9, align 8
  %465 = icmp ne ptr %464, null
  br i1 %465, label %466, label %492

466:                                              ; preds = %463
  %467 = load i32, ptr %11, align 4
  %468 = load i32, ptr %12, align 4
  %469 = icmp sgt i32 %467, %468
  br i1 %469, label %470, label %472

470:                                              ; preds = %466
  %471 = load i32, ptr %11, align 4
  store i32 %471, ptr %.reg2mem15, align 4
  br label %474

472:                                              ; preds = %466
  %473 = load i32, ptr %12, align 4
  store i32 %473, ptr %.reg2mem15, align 4
  br label %474

474:                                              ; preds = %470, %472
  %.reload16 = load i32, ptr %.reg2mem15, align 4
  %475 = load ptr, ptr %9, align 8
  store i32 %.reload16, ptr %475, align 4
  br label %476

476:                                              ; preds = %474
  %477 = load ptr, ptr %9, align 8
  %478 = load i32, ptr %477, align 4
  %479 = load i32, ptr @g_z, align 4
  %480 = icmp sgt i32 %478, %479
  br i1 %480, label %481, label %486

481:                                              ; preds = %476
  %482 = load ptr, ptr %9, align 8
  %483 = load i32, ptr %482, align 4
  %484 = load i32, ptr %17, align 4
  %485 = add nsw i32 %484, %483
  store i32 %485, ptr %17, align 4
  br label %491

486:                                              ; preds = %476
  %487 = load ptr, ptr %9, align 8
  %488 = load i32, ptr %487, align 4
  %489 = load i32, ptr %17, align 4
  %490 = sub nsw i32 %489, %488
  store i32 %490, ptr %17, align 4
  br label %491

491:                                              ; preds = %486, %481
  br label %492

492:                                              ; preds = %491, %463
  store i32 0, ptr %26, align 4
  br label %493

493:                                              ; preds = %517, %492
  %494 = load i32, ptr %26, align 4
  %495 = icmp slt i32 %494, 8
  br i1 %495, label %496, label %520

496:                                              ; preds = %493
  %497 = load i32, ptr %26, align 4
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %498
  %500 = load i32, ptr %499, align 4
  %501 = icmp sgt i32 %500, 0
  br i1 %501, label %502, label %509

502:                                              ; preds = %496
  %503 = load i32, ptr %26, align 4
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %504
  %506 = load i32, ptr %505, align 4
  %507 = load i32, ptr %17, align 4
  %508 = add nsw i32 %507, %506
  store i32 %508, ptr %17, align 4
  br label %516

509:                                              ; preds = %496
  %510 = load i32, ptr %26, align 4
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %511
  %513 = load i32, ptr %512, align 4
  %514 = load i32, ptr %17, align 4
  %515 = sub nsw i32 %514, %513
  store i32 %515, ptr %17, align 4
  br label %516

516:                                              ; preds = %509, %502
  br label %517

517:                                              ; preds = %516
  %518 = load i32, ptr %26, align 4
  %519 = add nsw i32 %518, 1
  store i32 %519, ptr %26, align 4
  br label %493, !llvm.loop !107

520:                                              ; preds = %493
  br label %521

521:                                              ; preds = %520, %394, %298, %145
  %522 = load i32, ptr %17, align 4
  %523 = srem i32 %522, 2
  %524 = icmp eq i32 %523, 0
  br i1 %524, label %525, label %548

525:                                              ; preds = %521
  store i32 0, ptr %27, align 4
  br label %526

526:                                              ; preds = %544, %525
  %527 = load i32, ptr %27, align 4
  %528 = load i32, ptr %14, align 4
  %529 = icmp slt i32 %527, %528
  br i1 %529, label %530, label %547

530:                                              ; preds = %526
  %531 = load i32, ptr %27, align 4
  %532 = sext i32 %531 to i64
  %.reload22 = load ptr, ptr %.reg2mem19, align 8
  %533 = getelementptr inbounds i32, ptr %.reload22, i64 %532
  %534 = load i32, ptr %533, align 4
  %535 = icmp sgt i32 %534, 0
  br i1 %535, label %536, label %543

536:                                              ; preds = %530
  %537 = load i32, ptr %27, align 4
  %538 = sext i32 %537 to i64
  %.reload21 = load ptr, ptr %.reg2mem19, align 8
  %539 = getelementptr inbounds i32, ptr %.reload21, i64 %538
  %540 = load i32, ptr %539, align 4
  %541 = load i32, ptr %17, align 4
  %542 = add nsw i32 %541, %540
  store i32 %542, ptr %17, align 4
  br label %543

543:                                              ; preds = %536, %530
  br label %544

544:                                              ; preds = %543
  %545 = load i32, ptr %27, align 4
  %546 = add nsw i32 %545, 1
  store i32 %546, ptr %27, align 4
  br label %526, !llvm.loop !108

547:                                              ; preds = %526
  br label %563

548:                                              ; preds = %521
  store i32 0, ptr %28, align 4
  br label %549

549:                                              ; preds = %553, %548
  %550 = load i32, ptr %28, align 4
  %551 = load i32, ptr %14, align 4
  %552 = icmp slt i32 %550, %551
  br i1 %552, label %553, label %562

553:                                              ; preds = %549
  %554 = load i32, ptr %28, align 4
  %555 = sext i32 %554 to i64
  %.reload20 = load ptr, ptr %.reg2mem19, align 8
  %556 = getelementptr inbounds i32, ptr %.reload20, i64 %555
  %557 = load i32, ptr %556, align 4
  %558 = load i32, ptr %17, align 4
  %559 = sub nsw i32 %558, %557
  store i32 %559, ptr %17, align 4
  %560 = load i32, ptr %28, align 4
  %561 = add nsw i32 %560, 1
  store i32 %561, ptr %28, align 4
  br label %549, !llvm.loop !109

562:                                              ; preds = %549
  br label %563

563:                                              ; preds = %562, %547
  br label %586

564:                                              ; preds = %389
  %565 = load i32, ptr %17, align 4
  %566 = sub nsw i32 0, %565
  store i32 %566, ptr %17, align 4
  br label %567

567:                                              ; preds = %564, %462, %297, %290, %140
  %568 = load ptr, ptr %9, align 8
  %569 = icmp ne ptr %568, null
  br i1 %569, label %570, label %585

570:                                              ; preds = %567
  %571 = load ptr, ptr %9, align 8
  %572 = load i32, ptr %571, align 4
  %573 = icmp sgt i32 %572, 0
  br i1 %573, label %574, label %579

574:                                              ; preds = %570
  %575 = load ptr, ptr %9, align 8
  %576 = load i32, ptr %575, align 4
  %577 = load i32, ptr %17, align 4
  %578 = add nsw i32 %577, %576
  store i32 %578, ptr %17, align 4
  br label %584

579:                                              ; preds = %570
  %580 = load ptr, ptr %9, align 8
  %581 = load i32, ptr %580, align 4
  %582 = load i32, ptr %17, align 4
  %583 = sub nsw i32 %582, %581
  store i32 %583, ptr %17, align 4
  br label %584

584:                                              ; preds = %579, %574
  br label %585

585:                                              ; preds = %584, %567
  br label %586

586:                                              ; preds = %585, %563
  %587 = load i32, ptr %17, align 4
  %588 = icmp sgt i32 %587, 0
  br i1 %588, label %589, label %591

589:                                              ; preds = %586
  %590 = load i32, ptr %17, align 4
  store i32 %590, ptr %.reg2mem17, align 4
  br label %594

591:                                              ; preds = %586
  %592 = load i32, ptr %17, align 4
  %593 = sub nsw i32 0, %592
  store i32 %593, ptr %.reg2mem17, align 4
  br label %594

594:                                              ; preds = %591, %589
  %.reload18 = load i32, ptr %.reg2mem17, align 4
  %595 = load ptr, ptr %15, align 8
  call void @llvm.stackrestore(ptr %595)
  ret i32 %.reload18
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
  %8 = alloca [8 x i32], align 16
  %9 = alloca [8 x i32], align 16
  br label %10

10:                                               ; preds = %entry
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  br label %11

11:                                               ; preds = %10
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 1
  br i1 %13, label %14, label %19

14:                                               ; preds = %11
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #9
  store i32 %18, ptr %.reg2mem, align 4
  br label %20

19:                                               ; preds = %11
  store i32 4, ptr %.reg2mem, align 4
  br label %20

20:                                               ; preds = %14, %19
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %21 = load i32, ptr %5, align 4
  %22 = call i32 @_0_if_only(i32 noundef %21)
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %6, align 4
  %25 = load i32, ptr %5, align 4
  %26 = call i32 @_1_if_else(i32 noundef %25)
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %6, align 4
  %29 = load i32, ptr %5, align 4
  %30 = call i32 @_2_if_with_surrounding_code(i32 noundef %29)
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %6, align 4
  %33 = load i32, ptr %5, align 4
  %34 = call i32 @_3_if_compound(i32 noundef %33)
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %6, align 4
  %37 = load i32, ptr %5, align 4
  %38 = call i32 @_4_if_else_compound(i32 noundef %37)
  %39 = load i32, ptr %6, align 4
  %40 = add nsw i32 %39, %38
  store i32 %40, ptr %6, align 4
  %41 = load i32, ptr %5, align 4
  %42 = call i32 @_5_if_equal(i32 noundef %41, i32 noundef 4)
  %43 = load i32, ptr %6, align 4
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr %6, align 4
  %45 = load i32, ptr %5, align 4
  %46 = call i32 @_6_if_not_equal(i32 noundef %45, i32 noundef 4)
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %6, align 4
  %49 = load i32, ptr %5, align 4
  %50 = call i32 @_7_relational(i32 noundef %49, i32 noundef 4)
  %51 = load i32, ptr %6, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %6, align 4
  %53 = load i32, ptr %5, align 4
  %54 = icmp sgt i32 %53, 0
  %55 = load i32, ptr %5, align 4
  %56 = call i32 @_8_boolean_argument(i1 noundef zeroext %54, i32 noundef %55)
  %57 = load i32, ptr %6, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, ptr %6, align 4
  %59 = load i32, ptr %5, align 4
  %60 = call i32 @_9_if_elseif_else(i32 noundef %59)
  %61 = load i32, ptr %6, align 4
  %62 = add nsw i32 %61, %60
  store i32 %62, ptr %6, align 4
  %63 = load i32, ptr %5, align 4
  %64 = call i32 @_10_multiple_elseif(i32 noundef %63)
  %65 = load i32, ptr %6, align 4
  %66 = add nsw i32 %65, %64
  store i32 %66, ptr %6, align 4
  %67 = load i32, ptr %5, align 4
  %68 = call i32 @_11_elseif_expressions(i32 noundef %67, i32 noundef 4)
  %69 = load i32, ptr %6, align 4
  %70 = add nsw i32 %69, %68
  store i32 %70, ptr %6, align 4
  %71 = load i32, ptr %5, align 4
  %72 = call i32 @_12_and(i32 noundef %71, i32 noundef 3)
  %73 = load i32, ptr %6, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %6, align 4
  %75 = load i32, ptr %5, align 4
  %76 = call i32 @_13_or(i32 noundef %75, i32 noundef -3)
  %77 = load i32, ptr %6, align 4
  %78 = add nsw i32 %77, %76
  store i32 %78, ptr %6, align 4
  %79 = load i32, ptr %5, align 4
  %80 = call i32 @_14_and_or(i32 noundef %79, i32 noundef 2, i32 noundef -1)
  %81 = load i32, ptr %6, align 4
  %82 = add nsw i32 %81, %80
  store i32 %82, ptr %6, align 4
  %83 = load i32, ptr %5, align 4
  %84 = call i32 @_15_or_and(i32 noundef %83, i32 noundef 0, i32 noundef 20)
  %85 = load i32, ptr %6, align 4
  %86 = add nsw i32 %85, %84
  store i32 %86, ptr %6, align 4
  %87 = load i32, ptr %5, align 4
  %88 = call i32 @_16_complex_boolean(i32 noundef %87, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %89 = load i32, ptr %6, align 4
  %90 = add nsw i32 %89, %88
  store i32 %90, ptr %6, align 4
  %91 = load i32, ptr %5, align 4
  %92 = call i32 @_17_nested_arithmetic_condition(i32 noundef %91, i32 noundef 1, i32 noundef 20)
  %93 = load i32, ptr %6, align 4
  %94 = add nsw i32 %93, %92
  store i32 %94, ptr %6, align 4
  %95 = load i32, ptr %5, align 4
  %96 = call i32 @_18_deep_parentheses(i32 noundef %95, i32 noundef 2, i32 noundef 3)
  %97 = load i32, ptr %6, align 4
  %98 = add nsw i32 %97, %96
  store i32 %98, ptr %6, align 4
  %99 = load i32, ptr %5, align 4
  %100 = call i32 @_19_arithmetic_boolean(i32 noundef %99, i32 noundef 2, i32 noundef 5)
  %101 = load i32, ptr %6, align 4
  %102 = add nsw i32 %101, %100
  store i32 %102, ptr %6, align 4
  %103 = load i32, ptr %5, align 4
  %104 = call i32 @_20_nested_boolean_parentheses(i32 noundef %103, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %105 = load i32, ptr %6, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, ptr %6, align 4
  %107 = load i32, ptr %5, align 4
  %108 = call i32 @_21_nested_if(i32 noundef %107, i32 noundef 3)
  %109 = load i32, ptr %6, align 4
  %110 = add nsw i32 %109, %108
  store i32 %110, ptr %6, align 4
  %111 = load i32, ptr %5, align 4
  %112 = call i32 @_22_nested_in_else(i32 noundef %111, i32 noundef 3)
  %113 = load i32, ptr %6, align 4
  %114 = add nsw i32 %113, %112
  store i32 %114, ptr %6, align 4
  %115 = load i32, ptr %5, align 4
  %116 = call i32 @_23_nested_if_else(i32 noundef %115, i32 noundef 3, i32 noundef 5)
  %117 = load i32, ptr %6, align 4
  %118 = add nsw i32 %117, %116
  store i32 %118, ptr %6, align 4
  %119 = load i32, ptr %5, align 4
  %120 = call i32 @_24_three_level_nesting(i32 noundef %119, i32 noundef 3, i32 noundef 5)
  %121 = load i32, ptr %6, align 4
  %122 = add nsw i32 %121, %120
  store i32 %122, ptr %6, align 4
  %123 = load i32, ptr %5, align 4
  %124 = call i32 @_25_deep_nested_values(i32 noundef %123, i32 noundef 3, i32 noundef 10)
  %125 = load i32, ptr %6, align 4
  %126 = add nsw i32 %125, %124
  store i32 %126, ptr %6, align 4
  %127 = load i32, ptr %5, align 4
  %128 = call i32 @_26_nested_and(i32 noundef %127, i32 noundef 3, i32 noundef 5)
  %129 = load i32, ptr %6, align 4
  %130 = add nsw i32 %129, %128
  store i32 %130, ptr %6, align 4
  %131 = load i32, ptr %5, align 4
  %132 = call i32 @_27_nested_or(i32 noundef %131, i32 noundef 0, i32 noundef 20)
  %133 = load i32, ptr %6, align 4
  %134 = add nsw i32 %133, %132
  store i32 %134, ptr %6, align 4
  %135 = load i32, ptr %5, align 4
  %136 = call i32 @_28_nested_complex_boolean(i32 noundef %135, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %137 = load i32, ptr %6, align 4
  %138 = add nsw i32 %137, %136
  store i32 %138, ptr %6, align 4
  %139 = load i32, ptr %5, align 4
  %140 = call i32 @_29_independent_ifs(i32 noundef %139)
  %141 = load i32, ptr %6, align 4
  %142 = add nsw i32 %141, %140
  store i32 %142, ptr %6, align 4
  %143 = load i32, ptr %5, align 4
  %144 = call i32 @_30_independent_if_else(i32 noundef %143, i32 noundef 3)
  %145 = load i32, ptr %6, align 4
  %146 = add nsw i32 %145, %144
  store i32 %146, ptr %6, align 4
  %147 = call i32 @_31_array_condition(i32 noundef 1)
  %148 = load i32, ptr %6, align 4
  %149 = add nsw i32 %148, %147
  store i32 %149, ptr %6, align 4
  %150 = call i32 @_32_array_branches(i32 noundef 2)
  %151 = load i32, ptr %6, align 4
  %152 = add nsw i32 %151, %150
  store i32 %152, ptr %6, align 4
  %153 = call i32 @_33_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %154 = load i32, ptr %6, align 4
  %155 = add nsw i32 %154, %153
  store i32 %155, ptr %6, align 4
  %156 = call i32 @_34_matrix_condition(i32 noundef 1, i32 noundef 1)
  %157 = load i32, ptr %6, align 4
  %158 = add nsw i32 %157, %156
  store i32 %158, ptr %6, align 4
  %159 = call i32 @_35_nested_array(i32 noundef 1, i32 noundef 2)
  %160 = load i32, ptr %6, align 4
  %161 = add nsw i32 %160, %159
  store i32 %161, ptr %6, align 4
  %162 = load i32, ptr %5, align 4
  store i32 %162, ptr %7, align 4
  %163 = call i32 @_36_pointer_condition(ptr noundef %7)
  %164 = load i32, ptr %6, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %6, align 4
  %166 = call i32 @_37_pointer_branches(ptr noundef %7)
  %167 = load i32, ptr %6, align 4
  %168 = add nsw i32 %167, %166
  store i32 %168, ptr %6, align 4
  %169 = call i32 @_38_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %170 = load i32, ptr %6, align 4
  %171 = add nsw i32 %170, %169
  store i32 %171, ptr %6, align 4
  %172 = call i32 @_39_nested_pointer(ptr noundef %7, i32 noundef 3)
  %173 = load i32, ptr %6, align 4
  %174 = add nsw i32 %173, %172
  store i32 %174, ptr %6, align 4
  %175 = load i32, ptr %5, align 4
  store i32 %175, ptr %7, align 4
  %176 = load i32, ptr %5, align 4
  %177 = call i32 @_40_pointer_write(ptr noundef %7, i32 noundef %176)
  %178 = load i32, ptr %6, align 4
  %179 = add nsw i32 %178, %177
  store i32 %179, ptr %6, align 4
  %180 = load i32, ptr %5, align 4
  store i32 %180, ptr %7, align 4
  %181 = load i32, ptr %5, align 4
  %182 = call i32 @_41_pointer_write_nested(ptr noundef %7, i32 noundef %181, i32 noundef 3)
  %183 = load i32, ptr %6, align 4
  %184 = add nsw i32 %183, %182
  store i32 %184, ptr %6, align 4
  %185 = load i32, ptr %5, align 4
  store i32 %185, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  br label %186

186:                                              ; preds = %20
  %187 = load i32, ptr %5, align 4
  %188 = icmp sgt i32 %187, 0
  br i1 %188, label %189, label %194

189:                                              ; preds = %186
  %190 = load i32, ptr %5, align 4
  %191 = icmp slt i32 %190, 8
  br i1 %191, label %192, label %194

192:                                              ; preds = %189
  %193 = load i32, ptr %5, align 4
  store i32 %193, ptr %.reg2mem1, align 4
  br label %195

194:                                              ; preds = %189, %186
  store i32 4, ptr %.reg2mem1, align 4
  br label %195

195:                                              ; preds = %194, %192
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr @g_n, align 4
  %196 = call i32 @_42_global_only()
  %197 = load i32, ptr %6, align 4
  %198 = add nsw i32 %197, %196
  store i32 %198, ptr %6, align 4
  %199 = call i32 @_43_global_and()
  %200 = load i32, ptr %6, align 4
  %201 = add nsw i32 %200, %199
  store i32 %201, ptr %6, align 4
  %202 = call i32 @_44_global_or()
  %203 = load i32, ptr %6, align 4
  %204 = add nsw i32 %203, %202
  store i32 %204, ptr %6, align 4
  %205 = call i32 @_45_global_nested()
  %206 = load i32, ptr %6, align 4
  %207 = add nsw i32 %206, %205
  store i32 %207, ptr %6, align 4
  %208 = call i32 @_46_global_array_only()
  %209 = load i32, ptr %6, align 4
  %210 = add nsw i32 %209, %208
  store i32 %210, ptr %6, align 4
  %211 = call i32 @_47_global_matrix_only()
  %212 = load i32, ptr %6, align 4
  %213 = add nsw i32 %212, %211
  store i32 %213, ptr %6, align 4
  %214 = load i32, ptr %5, align 4
  %215 = call i32 @_48_multiple_returns(i32 noundef %214)
  %216 = load i32, ptr %6, align 4
  %217 = add nsw i32 %216, %215
  store i32 %217, ptr %6, align 4
  %218 = load i32, ptr %5, align 4
  %219 = call i32 @_49_nested_multiple_returns(i32 noundef %218, i32 noundef 3)
  %220 = load i32, ptr %6, align 4
  %221 = add nsw i32 %220, %219
  store i32 %221, ptr %6, align 4
  %222 = load i32, ptr %5, align 4
  %223 = call i32 @_50_complex_multiple_returns(i32 noundef %222, i32 noundef 3, i32 noundef 5)
  %224 = load i32, ptr %6, align 4
  %225 = add nsw i32 %224, %223
  store i32 %225, ptr %6, align 4
  %226 = load i32, ptr %5, align 4
  %227 = call i32 @_51_prefix_code(i32 noundef %226, i32 noundef 2, i32 noundef 3)
  %228 = load i32, ptr %6, align 4
  %229 = add nsw i32 %228, %227
  store i32 %229, ptr %6, align 4
  %230 = load i32, ptr %5, align 4
  %231 = call i32 @_52_suffix_code(i32 noundef %230, i32 noundef 3)
  %232 = load i32, ptr %6, align 4
  %233 = add nsw i32 %232, %231
  store i32 %233, ptr %6, align 4
  %234 = load i32, ptr %5, align 4
  %235 = call i32 @_53_prefix_nested_suffix(i32 noundef %234, i32 noundef 3, i32 noundef 5)
  %236 = load i32, ptr %6, align 4
  %237 = add nsw i32 %236, %235
  store i32 %237, ptr %6, align 4
  %238 = load i32, ptr %5, align 4
  %239 = call i32 @_54_diamond(i32 noundef %238, i32 noundef 3)
  %240 = load i32, ptr %6, align 4
  %241 = add nsw i32 %240, %239
  store i32 %241, ptr %6, align 4
  %242 = load i32, ptr %5, align 4
  %243 = call i32 @_55_multiple_merge_values(i32 noundef %242, i32 noundef 3)
  %244 = load i32, ptr %6, align 4
  %245 = add nsw i32 %244, %243
  store i32 %245, ptr %6, align 4
  %246 = load i32, ptr %5, align 4
  %247 = call i32 @_56_nested_diamonds(i32 noundef %246, i32 noundef 3, i32 noundef 5)
  %248 = load i32, ptr %6, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, ptr %6, align 4
  %250 = load i32, ptr %5, align 4
  %251 = call i32 @_57_ternary_before_if(i32 noundef %250, i32 noundef 3)
  %252 = load i32, ptr %6, align 4
  %253 = add nsw i32 %252, %251
  store i32 %253, ptr %6, align 4
  %254 = load i32, ptr %5, align 4
  %255 = call i32 @_58_ternary_inside_if(i32 noundef %254, i32 noundef 3)
  %256 = load i32, ptr %6, align 4
  %257 = add nsw i32 %256, %255
  store i32 %257, ptr %6, align 4
  %258 = load i32, ptr %5, align 4
  %259 = call i32 @_59_nested_ternary_if(i32 noundef %258, i32 noundef 3, i32 noundef 5)
  %260 = load i32, ptr %6, align 4
  %261 = add nsw i32 %260, %259
  store i32 %261, ptr %6, align 4
  %262 = load i32, ptr %5, align 4
  %263 = call i32 @_60_dynamic_alloca(i32 noundef 4, i32 noundef %262)
  %264 = load i32, ptr %6, align 4
  %265 = add nsw i32 %264, %263
  store i32 %265, ptr %6, align 4
  %266 = load i32, ptr %5, align 4
  %267 = call i32 @_61_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %266)
  %268 = load i32, ptr %6, align 4
  %269 = add nsw i32 %268, %267
  store i32 %269, ptr %6, align 4
  %270 = load i32, ptr %5, align 4
  %271 = call i32 @_62_dynamic_alloca_complex(i32 noundef 6, i32 noundef %270, i32 noundef 3)
  %272 = load i32, ptr %6, align 4
  %273 = add nsw i32 %272, %271
  store i32 %273, ptr %6, align 4
  %274 = load i32, ptr %5, align 4
  %275 = call i32 @_63_malloc_if(i32 noundef 4, i32 noundef %274)
  %276 = load i32, ptr %6, align 4
  %277 = add nsw i32 %276, %275
  store i32 %277, ptr %6, align 4
  %278 = load i32, ptr %5, align 4
  %279 = call i32 @_64_malloc_nested_if(i32 noundef 4, i32 noundef %278, i32 noundef 3)
  %280 = load i32, ptr %6, align 4
  %281 = add nsw i32 %280, %279
  store i32 %281, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %282 = load i32, ptr %5, align 4
  call void @_65_void_if(i32 noundef %282)
  %283 = load i32, ptr %5, align 4
  call void @_66_void_if_else(i32 noundef %283)
  %284 = load i32, ptr %5, align 4
  call void @_67_void_nested(i32 noundef %284, i32 noundef 3)
  %285 = load i32, ptr %5, align 4
  call void @_68_void_complex(i32 noundef %285, i32 noundef 3, i32 noundef 0)
  call void @_69_void_global_only()
  %286 = load i32, ptr %5, align 4
  store i32 %286, ptr %7, align 4
  %287 = load i32, ptr %5, align 4
  call void @_70_void_pointer(ptr noundef %7, i32 noundef %287)
  %288 = load i32, ptr %5, align 4
  call void @_71_void_array(i32 noundef 1, i32 noundef %288)
  %289 = load i32, ptr @g_void_result, align 4
  %290 = load i32, ptr %6, align 4
  %291 = add nsw i32 %290, %289
  store i32 %291, ptr %6, align 4
  %292 = load i32, ptr %5, align 4
  store i32 %292, ptr %7, align 4
  %293 = load i32, ptr %5, align 4
  %294 = call i32 @_72_complex_control_flow(ptr noundef %7, i32 noundef 1, i32 noundef %293, i32 noundef 3)
  %295 = load i32, ptr %6, align 4
  %296 = add nsw i32 %295, %294
  store i32 %296, ptr %6, align 4
  %297 = load i32, ptr %5, align 4
  %298 = call i32 @_73_complex_merge(i32 noundef %297, i32 noundef 3, i32 noundef 5)
  %299 = load i32, ptr %6, align 4
  %300 = add nsw i32 %299, %298
  store i32 %300, ptr %6, align 4
  %301 = load i32, ptr %5, align 4
  %302 = call i32 @_74_if_stress(ptr noundef %7, i32 noundef 1, i32 noundef %301, i32 noundef 3, i32 noundef 5)
  %303 = load i32, ptr %6, align 4
  %304 = add nsw i32 %303, %302
  store i32 %304, ptr %6, align 4
  %305 = load i32, ptr %5, align 4
  %306 = call i32 @_75_for_simple(i32 noundef 4, i32 noundef %305)
  %307 = load i32, ptr %6, align 4
  %308 = add nsw i32 %307, %306
  store i32 %308, ptr %6, align 4
  %309 = load i32, ptr %5, align 4
  %310 = call i32 @_76_while_simple(i32 noundef 4, i32 noundef %309)
  %311 = load i32, ptr %6, align 4
  %312 = add nsw i32 %311, %310
  store i32 %312, ptr %6, align 4
  %313 = load i32, ptr %5, align 4
  %314 = call i32 @_77_do_while(i32 noundef 4, i32 noundef %313)
  %315 = load i32, ptr %6, align 4
  %316 = add nsw i32 %315, %314
  store i32 %316, ptr %6, align 4
  %317 = call i32 @_78_nested_loops(i32 noundef 3, i32 noundef 4)
  %318 = load i32, ptr %6, align 4
  %319 = add nsw i32 %318, %317
  store i32 %319, ptr %6, align 4
  %320 = call i32 @_79_nested_loop_if(i32 noundef 3, i32 noundef 4)
  %321 = load i32, ptr %6, align 4
  %322 = add nsw i32 %321, %320
  store i32 %322, ptr %6, align 4
  %323 = call i32 @_80_break(i32 noundef 6)
  %324 = load i32, ptr %6, align 4
  %325 = add nsw i32 %324, %323
  store i32 %325, ptr %6, align 4
  %326 = call i32 @_81_continue(i32 noundef 6)
  %327 = load i32, ptr %6, align 4
  %328 = add nsw i32 %327, %326
  store i32 %328, ptr %6, align 4
  %329 = load i32, ptr %5, align 4
  %330 = call i32 @_82_loop_complex_condition(i32 noundef 6, i32 noundef %329)
  %331 = load i32, ptr %6, align 4
  %332 = add nsw i32 %331, %330
  store i32 %332, ptr %6, align 4
  %333 = call i32 @_83_loop_global_array()
  %334 = load i32, ptr %6, align 4
  %335 = add nsw i32 %334, %333
  store i32 %335, ptr %6, align 4
  %336 = load i32, ptr %5, align 4
  %337 = call i32 @_84_loop_pointer(i32 noundef 5, i32 noundef %336)
  %338 = load i32, ptr %6, align 4
  %339 = add nsw i32 %338, %337
  store i32 %339, ptr %6, align 4
  %340 = load i32, ptr %5, align 4
  %341 = call i32 @_85_loop_surrounding_code(i32 noundef 4, i32 noundef %340)
  %342 = load i32, ptr %6, align 4
  %343 = add nsw i32 %342, %341
  store i32 %343, ptr %6, align 4
  %344 = call i32 @_86_triple_nested(i32 noundef 2, i32 noundef 3, i32 noundef 2)
  %345 = load i32, ptr %6, align 4
  %346 = add nsw i32 %345, %344
  store i32 %346, ptr %6, align 4
  %347 = load i32, ptr %5, align 4
  %348 = call i32 @_87_if_OR3(i32 noundef %347, i32 noundef 3, i32 noundef -5)
  %349 = load i32, ptr %6, align 4
  %350 = add nsw i32 %349, %348
  store i32 %350, ptr %6, align 4
  %351 = load i32, ptr %5, align 4
  %352 = call i32 @_88_if_OR3_vla(i32 noundef %351, i32 noundef 3, i32 noundef -5)
  %353 = load i32, ptr %6, align 4
  %354 = add nsw i32 %353, %352
  store i32 %354, ptr %6, align 4
  %355 = load i32, ptr %5, align 4
  %356 = call i32 @_89_loop_vla(i32 noundef 4, i32 noundef %355)
  %357 = load i32, ptr %6, align 4
  %358 = add nsw i32 %357, %356
  store i32 %358, ptr %6, align 4
  %359 = load i32, ptr %5, align 4
  %360 = call i32 @_90_vla_nested_loop(i32 noundef 4, i32 noundef %359)
  %361 = load i32, ptr %6, align 4
  %362 = add nsw i32 %361, %360
  store i32 %362, ptr %6, align 4
  %363 = load i32, ptr %5, align 4
  %364 = call i32 @_91_alloca_inside_loop(i32 noundef 4, i32 noundef %363)
  %365 = load i32, ptr %6, align 4
  %366 = add nsw i32 %365, %364
  store i32 %366, ptr %6, align 4
  %367 = load i32, ptr %5, align 4
  %368 = call i32 @_92_vla_size_from_loop(i32 noundef 5, i32 noundef %367)
  %369 = load i32, ptr %6, align 4
  %370 = add nsw i32 %369, %368
  store i32 %370, ptr %6, align 4
  %371 = call i32 @_93_global_loop()
  %372 = load i32, ptr %6, align 4
  %373 = add nsw i32 %372, %371
  store i32 %373, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %374 = load i32, ptr %5, align 4
  call void @_94_void_loop(i32 noundef 4, i32 noundef %374)
  %375 = load i32, ptr %5, align 4
  store i32 %375, ptr %7, align 4
  %376 = load i32, ptr %5, align 4
  call void @_95_void_loop_pointer(ptr noundef %7, i32 noundef 4, i32 noundef %376)
  %377 = load i32, ptr @g_void_result, align 4
  %378 = load i32, ptr %6, align 4
  %379 = add nsw i32 %378, %377
  store i32 %379, ptr %6, align 4
  %380 = load i32, ptr %5, align 4
  %381 = call i32 @_96_goto_break(i32 noundef 6, i32 noundef %380)
  %382 = load i32, ptr %6, align 4
  %383 = add nsw i32 %382, %381
  store i32 %383, ptr %6, align 4
  %384 = load i32, ptr %5, align 4
  %385 = call i32 @_97_goto_nested_loop(i32 noundef 5, i32 noundef %384)
  %386 = load i32, ptr %6, align 4
  %387 = add nsw i32 %386, %385
  store i32 %387, ptr %6, align 4
  %388 = load i32, ptr %5, align 4
  %389 = call i32 @_98_goto_vla(i32 noundef 4, i32 noundef %388)
  %390 = load i32, ptr %6, align 4
  %391 = add nsw i32 %390, %389
  store i32 %391, ptr %6, align 4
  %392 = load i32, ptr %5, align 4
  %393 = call i32 @_99_malloc_loop(i32 noundef 4, i32 noundef %392)
  %394 = load i32, ptr %6, align 4
  %395 = add nsw i32 %394, %393
  store i32 %395, ptr %6, align 4
  %396 = load i32, ptr %5, align 4
  store i32 %396, ptr %7, align 4
  %397 = load i32, ptr %5, align 4
  %398 = call i32 @_100_stress(ptr noundef %7, i32 noundef 4, i32 noundef %397, i32 noundef 3)
  %399 = load i32, ptr %6, align 4
  %400 = add nsw i32 %399, %398
  store i32 %400, ptr %6, align 4
  %401 = load i32, ptr %5, align 4
  store i32 %401, ptr %7, align 4
  %402 = load i32, ptr %5, align 4
  %403 = call i32 @_101_stress_goto(ptr noundef %7, i32 noundef 4, i32 noundef %402, i32 noundef 3, i32 noundef 5)
  %404 = load i32, ptr %6, align 4
  %405 = add nsw i32 %404, %403
  store i32 %405, ptr %6, align 4
  %406 = load i32, ptr %5, align 4
  %407 = call i32 @_102_oneblock(i32 noundef %406)
  %408 = load i32, ptr %6, align 4
  %409 = add nsw i32 %408, %407
  store i32 %409, ptr %6, align 4
  %410 = load i32, ptr %5, align 4
  %411 = srem i32 %410, 4
  %412 = load i32, ptr %5, align 4
  %413 = call i32 @_103_switch_if(i32 noundef %411, i32 noundef %412)
  %414 = load i32, ptr %6, align 4
  %415 = add nsw i32 %414, %413
  store i32 %415, ptr %6, align 4
  %416 = load i32, ptr %5, align 4
  %417 = srem i32 %416, 4
  %418 = load i32, ptr %5, align 4
  %419 = call i32 @_104_switch_nested_if(i32 noundef %417, i32 noundef %418, i32 noundef 3)
  %420 = load i32, ptr %6, align 4
  %421 = add nsw i32 %420, %419
  store i32 %421, ptr %6, align 4
  %422 = load i32, ptr %5, align 4
  %423 = srem i32 %422, 4
  %424 = load i32, ptr %5, align 4
  %425 = call i32 @_105_switch_ternary(i32 noundef %423, i32 noundef %424, i32 noundef 3)
  %426 = load i32, ptr %6, align 4
  %427 = add nsw i32 %426, %425
  store i32 %427, ptr %6, align 4
  %428 = load i32, ptr %5, align 4
  %429 = srem i32 %428, 4
  %430 = load i32, ptr %5, align 4
  %431 = call i32 @_106_switch_nested_ternary(i32 noundef %429, i32 noundef %430, i32 noundef 3, i32 noundef 5)
  %432 = load i32, ptr %6, align 4
  %433 = add nsw i32 %432, %431
  store i32 %433, ptr %6, align 4
  %434 = load i32, ptr %5, align 4
  %435 = srem i32 %434, 4
  %436 = load i32, ptr %5, align 4
  %437 = call i32 @_107_switch_for(i32 noundef %435, i32 noundef 4, i32 noundef %436)
  %438 = load i32, ptr %6, align 4
  %439 = add nsw i32 %438, %437
  store i32 %439, ptr %6, align 4
  %440 = load i32, ptr %5, align 4
  %441 = srem i32 %440, 4
  %442 = load i32, ptr %5, align 4
  %443 = call i32 @_108_switch_while(i32 noundef %441, i32 noundef 4, i32 noundef %442)
  %444 = load i32, ptr %6, align 4
  %445 = add nsw i32 %444, %443
  store i32 %445, ptr %6, align 4
  %446 = load i32, ptr %5, align 4
  %447 = srem i32 %446, 4
  %448 = call i32 @_109_switch_nested_for(i32 noundef %447, i32 noundef 3, i32 noundef 4)
  %449 = load i32, ptr %6, align 4
  %450 = add nsw i32 %449, %448
  store i32 %450, ptr %6, align 4
  %451 = load i32, ptr %5, align 4
  %452 = srem i32 %451, 3
  %453 = load i32, ptr %5, align 4
  %454 = call i32 @_110_switch_do_while(i32 noundef %452, i32 noundef 4, i32 noundef %453)
  %455 = load i32, ptr %6, align 4
  %456 = add nsw i32 %455, %454
  store i32 %456, ptr %6, align 4
  %457 = load i32, ptr %5, align 4
  %458 = srem i32 %457, 5
  %459 = call i32 @_111_switch_array(i32 noundef %458, i32 noundef 1)
  %460 = load i32, ptr %6, align 4
  %461 = add nsw i32 %460, %459
  store i32 %461, ptr %6, align 4
  %462 = load i32, ptr %5, align 4
  %463 = srem i32 %462, 4
  %464 = call i32 @_112_switch_matrix_if(i32 noundef %463, i32 noundef 1, i32 noundef 1)
  %465 = load i32, ptr %6, align 4
  %466 = add nsw i32 %465, %464
  store i32 %466, ptr %6, align 4
  %467 = load i32, ptr %5, align 4
  store i32 %467, ptr %7, align 4
  %468 = load i32, ptr %5, align 4
  %469 = srem i32 %468, 5
  %470 = load i32, ptr %5, align 4
  %471 = call i32 @_113_switch_pointer(i32 noundef %469, ptr noundef %7, i32 noundef %470)
  %472 = load i32, ptr %6, align 4
  %473 = add nsw i32 %472, %471
  store i32 %473, ptr %6, align 4
  %474 = load i32, ptr %5, align 4
  store i32 %474, ptr %7, align 4
  %475 = load i32, ptr %5, align 4
  %476 = srem i32 %475, 4
  %477 = call i32 @_114_switch_pointer_array(i32 noundef %476, ptr noundef %7, i32 noundef 1)
  %478 = load i32, ptr %6, align 4
  %479 = add nsw i32 %478, %477
  store i32 %479, ptr %6, align 4
  %480 = load i32, ptr %5, align 4
  %481 = srem i32 %480, 4
  %482 = call i32 @_115_switch_array_loop(i32 noundef %481, i32 noundef 8)
  %483 = load i32, ptr %6, align 4
  %484 = add nsw i32 %483, %482
  store i32 %484, ptr %6, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %8, i8 0, i64 32, i1 false)
  %485 = load i32, ptr %5, align 4
  %486 = srem i32 %485, 4
  %487 = getelementptr inbounds [8 x i32], ptr %8, i64 0, i64 0
  %488 = load i32, ptr %5, align 4
  %489 = call i32 @_116_switch_pointer_loop(i32 noundef %486, ptr noundef %487, i32 noundef 4, i32 noundef %488)
  %490 = load i32, ptr %6, align 4
  %491 = add nsw i32 %490, %489
  store i32 %491, ptr %6, align 4
  %492 = load i32, ptr %5, align 4
  %493 = srem i32 %492, 4
  %494 = load i32, ptr %5, align 4
  %495 = call i32 @_117_switch_ternary_loop(i32 noundef %493, i32 noundef 4, i32 noundef %494, i32 noundef 3)
  %496 = load i32, ptr %6, align 4
  %497 = add nsw i32 %496, %495
  store i32 %497, ptr %6, align 4
  %498 = load i32, ptr %5, align 4
  %499 = srem i32 %498, 3
  %500 = load i32, ptr %5, align 4
  %501 = add nsw i32 %500, 1
  %502 = srem i32 %501, 3
  %503 = load i32, ptr %5, align 4
  %504 = call i32 @_118_nested_switch_if(i32 noundef %499, i32 noundef %502, i32 noundef %503)
  %505 = load i32, ptr %6, align 4
  %506 = add nsw i32 %505, %504
  store i32 %506, ptr %6, align 4
  %507 = load i32, ptr %5, align 4
  %508 = srem i32 %507, 3
  %509 = load i32, ptr %5, align 4
  %510 = add nsw i32 %509, 1
  %511 = srem i32 %510, 3
  %512 = call i32 @_119_nested_switch_loop(i32 noundef %508, i32 noundef %511, i32 noundef 4)
  %513 = load i32, ptr %6, align 4
  %514 = add nsw i32 %513, %512
  store i32 %514, ptr %6, align 4
  %515 = load i32, ptr %5, align 4
  %516 = srem i32 %515, 3
  %517 = load i32, ptr %5, align 4
  %518 = call i32 @_120_switch_nested_for_if_ternary(i32 noundef %516, i32 noundef 3, i32 noundef %517, i32 noundef 3)
  %519 = load i32, ptr %6, align 4
  %520 = add nsw i32 %519, %518
  store i32 %520, ptr %6, align 4
  %521 = load i32, ptr %5, align 4
  %522 = srem i32 %521, 4
  %523 = load i32, ptr %5, align 4
  %524 = call i32 @_121_switch_vla_loop(i32 noundef %522, i32 noundef 4, i32 noundef %523)
  %525 = load i32, ptr %6, align 4
  %526 = add nsw i32 %525, %524
  store i32 %526, ptr %6, align 4
  %527 = load i32, ptr %5, align 4
  %528 = srem i32 %527, 4
  %529 = load i32, ptr %5, align 4
  %530 = call i32 @_122_switch_vla_pointer_ternary(i32 noundef %528, i32 noundef 4, i32 noundef %529)
  %531 = load i32, ptr %6, align 4
  %532 = add nsw i32 %531, %530
  store i32 %532, ptr %6, align 4
  %533 = load i32, ptr %5, align 4
  %534 = srem i32 %533, 4
  %535 = load i32, ptr %5, align 4
  %536 = call i32 @_123_switch_goto(i32 noundef %534, i32 noundef %535)
  %537 = load i32, ptr %6, align 4
  %538 = add nsw i32 %537, %536
  store i32 %538, ptr %6, align 4
  %539 = load i32, ptr %5, align 4
  %540 = srem i32 %539, 4
  %541 = load i32, ptr %5, align 4
  %542 = call i32 @_124_switch_goto_loop(i32 noundef %540, i32 noundef 5, i32 noundef %541)
  %543 = load i32, ptr %6, align 4
  %544 = add nsw i32 %543, %542
  store i32 %544, ptr %6, align 4
  %545 = load i32, ptr %5, align 4
  store i32 %545, ptr %7, align 4
  %546 = load i32, ptr %5, align 4
  %547 = srem i32 %546, 4
  %548 = load i32, ptr %5, align 4
  %549 = call i32 @_125_switch_goto_pointer_array(i32 noundef %547, ptr noundef %7, i32 noundef 1, i32 noundef %548)
  %550 = load i32, ptr %6, align 4
  %551 = add nsw i32 %550, %549
  store i32 %551, ptr %6, align 4
  %552 = load i32, ptr %5, align 4
  %553 = srem i32 %552, 5
  %554 = load i32, ptr %5, align 4
  %555 = call i32 @_126_switch_fallthrough_loop_if(i32 noundef %553, i32 noundef 4, i32 noundef %554)
  %556 = load i32, ptr %6, align 4
  %557 = add nsw i32 %556, %555
  store i32 %557, ptr %6, align 4
  %558 = load i32, ptr %5, align 4
  store i32 %558, ptr %7, align 4
  %559 = load i32, ptr %5, align 4
  %560 = srem i32 %559, 3
  %561 = load i32, ptr %5, align 4
  %562 = add nsw i32 %561, 1
  %563 = srem i32 %562, 3
  %564 = call i32 @_127_nested_switch_array_pointer(i32 noundef %560, i32 noundef %563, ptr noundef %7, i32 noundef 1)
  %565 = load i32, ptr %6, align 4
  %566 = add nsw i32 %565, %564
  store i32 %566, ptr %6, align 4
  %567 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %568 = load i32, ptr %5, align 4
  store i32 %568, ptr %567, align 4
  %569 = getelementptr inbounds i32, ptr %567, i64 1
  %570 = load i32, ptr %5, align 4
  %571 = add nsw i32 %570, 1
  store i32 %571, ptr %569, align 4
  %572 = getelementptr inbounds i32, ptr %569, i64 1
  %573 = load i32, ptr %5, align 4
  %574 = add nsw i32 %573, 2
  store i32 %574, ptr %572, align 4
  %575 = getelementptr inbounds i32, ptr %572, i64 1
  %576 = load i32, ptr %5, align 4
  %577 = add nsw i32 %576, 3
  store i32 %577, ptr %575, align 4
  %578 = getelementptr inbounds i32, ptr %575, i64 1
  %579 = load i32, ptr %5, align 4
  %580 = add nsw i32 %579, 4
  store i32 %580, ptr %578, align 4
  %581 = getelementptr inbounds i32, ptr %578, i64 1
  %582 = load i32, ptr %5, align 4
  %583 = add nsw i32 %582, 5
  store i32 %583, ptr %581, align 4
  %584 = getelementptr inbounds i32, ptr %581, i64 1
  %585 = load i32, ptr %5, align 4
  %586 = add nsw i32 %585, 6
  store i32 %586, ptr %584, align 4
  %587 = getelementptr inbounds i32, ptr %584, i64 1
  %588 = load i32, ptr %5, align 4
  %589 = add nsw i32 %588, 7
  store i32 %589, ptr %587, align 4
  %590 = load i32, ptr %5, align 4
  %591 = srem i32 %590, 4
  %592 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %593 = load i32, ptr %5, align 4
  %594 = call i32 @_128_switch_array_pointer_loops(i32 noundef %591, ptr noundef %592, i32 noundef 4, i32 noundef %593)
  %595 = load i32, ptr %6, align 4
  %596 = add nsw i32 %595, %594
  store i32 %596, ptr %6, align 4
  %597 = load i32, ptr %5, align 4
  %598 = srem i32 %597, 4
  %599 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %600 = load i32, ptr %5, align 4
  %601 = call i32 @_129_switch_vla_nested(i32 noundef %598, ptr noundef %599, i32 noundef 4, i32 noundef %600)
  %602 = load i32, ptr %6, align 4
  %603 = add nsw i32 %602, %601
  store i32 %603, ptr %6, align 4
  %604 = load i32, ptr %5, align 4
  store i32 %604, ptr %7, align 4
  %605 = load i32, ptr %5, align 4
  %606 = srem i32 %605, 5
  %607 = load i32, ptr %5, align 4
  %608 = add nsw i32 %607, 1
  %609 = srem i32 %608, 3
  %610 = load i32, ptr %5, align 4
  %611 = call i32 @_130_switch_stress(i32 noundef %606, i32 noundef %609, ptr noundef %7, i32 noundef 4, i32 noundef %610, i32 noundef 3, i32 noundef 5)
  %612 = load i32, ptr %6, align 4
  %613 = add nsw i32 %612, %611
  store i32 %613, ptr %6, align 4
  %614 = load i32, ptr %6, align 4
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
