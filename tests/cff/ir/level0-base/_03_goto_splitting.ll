; ModuleID = '_03_goto.bc'
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
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  store i32 %5, ptr %3, align 4
  br label %6

6:                                                ; preds = %4
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %12

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  store i32 %11, ptr %1, align 4
  br label %15

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %1, align 4
  br label %15

15:                                               ; preds = %12, %10
  %16 = load i32, ptr %1, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_goto_two_labels(i32 noundef %0) #0 {
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
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  br label %9

8:                                                ; preds = %4
  br label %12

9:                                                ; preds = %7
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %1, align 4
  br label %15

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = sub nsw i32 %13, 10
  store i32 %14, ptr %1, align 4
  br label %15

15:                                               ; preds = %12, %9
  %16 = load i32, ptr %1, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_goto_surrounding_code(i32 noundef %0) #0 {
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
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %11

10:                                               ; preds = %6
  br label %14

11:                                               ; preds = %9
  %12 = load i32, ptr %2, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %2, align 4
  br label %14

14:                                               ; preds = %11, %10
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 5
  store i32 %16, ptr %2, align 4
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_goto_skip_block(i32 noundef %0) #0 {
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
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  br label %12

9:                                                ; preds = %5
  %10 = load i32, ptr %2, align 4
  %11 = sub nsw i32 %10, 100
  store i32 %11, ptr %2, align 4
  br label %12

12:                                               ; preds = %9, %8
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 10
  store i32 %14, ptr %2, align 4
  %15 = load i32, ptr %2, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_goto_equal(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %12

11:                                               ; preds = %6
  store i32 200, ptr %2, align 4
  br label %13

12:                                               ; preds = %10
  store i32 100, ptr %2, align 4
  br label %13

13:                                               ; preds = %12, %11
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_goto_not_equal(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  br label %15

11:                                               ; preds = %6
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, ptr %2, align 4
  br label %19

15:                                               ; preds = %10
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %2, align 4
  br label %19

19:                                               ; preds = %15, %11
  %20 = load i32, ptr %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_relational(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %17

11:                                               ; preds = %6
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  br label %18

16:                                               ; preds = %11
  store i32 3, ptr %2, align 4
  br label %19

17:                                               ; preds = %10
  store i32 1, ptr %2, align 4
  br label %19

18:                                               ; preds = %15
  store i32 2, ptr %2, align 4
  br label %19

19:                                               ; preds = %18, %17, %16
  %20 = load i32, ptr %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
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
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %14

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = sub nsw i32 %12, 3
  store i32 %13, ptr %2, align 4
  br label %17

14:                                               ; preds = %10
  %15 = load i32, ptr %4, align 4
  %16 = mul nsw i32 %15, 3
  store i32 %16, ptr %2, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_goto_chain(i32 noundef %0) #0 {
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
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  br label %15

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = icmp sgt i32 %9, 5
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %18

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 10
  store i32 %14, ptr %1, align 4
  br label %21

15:                                               ; preds = %7
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, 100
  store i32 %17, ptr %1, align 4
  br label %21

18:                                               ; preds = %11
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, 50
  store i32 %20, ptr %1, align 4
  br label %21

21:                                               ; preds = %18, %15, %12
  %22 = load i32, ptr %1, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_multiple_levels(i32 noundef %0) #0 {
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
  br label %21

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %22

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %23

16:                                               ; preds = %12
  %17 = load i32, ptr %2, align 4
  %18 = icmp slt i32 %17, 10
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %24

20:                                               ; preds = %16
  store i32 1, ptr %1, align 4
  br label %25

21:                                               ; preds = %7
  store i32 -1, ptr %1, align 4
  br label %25

22:                                               ; preds = %11
  store i32 -2, ptr %1, align 4
  br label %25

23:                                               ; preds = %15
  store i32 0, ptr %1, align 4
  br label %25

24:                                               ; preds = %19
  store i32 2, ptr %1, align 4
  br label %25

25:                                               ; preds = %24, %23, %22, %21, %20
  %26 = load i32, ptr %1, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_goto_expressions(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  br label %26

11:                                               ; preds = %6
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp eq i32 %12, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  br label %29

16:                                               ; preds = %11
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 10
  %19 = load i32, ptr %4, align 4
  %20 = icmp sgt i32 %18, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %16
  br label %33

22:                                               ; preds = %16
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %3, align 4
  %25 = sub nsw i32 %23, %24
  store i32 %25, ptr %2, align 4
  br label %37

26:                                               ; preds = %10
  %27 = load i32, ptr %3, align 4
  %28 = mul nsw i32 %27, 2
  store i32 %28, ptr %2, align 4
  br label %37

29:                                               ; preds = %15
  %30 = load i32, ptr %3, align 4
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %30, %31
  store i32 %32, ptr %2, align 4
  br label %37

33:                                               ; preds = %21
  %34 = load i32, ptr %3, align 4
  %35 = load i32, ptr %4, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %2, align 4
  br label %37

37:                                               ; preds = %33, %29, %26, %22
  %38 = load i32, ptr %2, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_and(i32 noundef %0, i32 noundef %1) #0 {
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
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %17

13:                                               ; preds = %9, %6
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = sub nsw i32 %14, %15
  store i32 %16, ptr %2, align 4
  br label %21

17:                                               ; preds = %12
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %2, align 4
  br label %21

21:                                               ; preds = %17, %13
  %22 = load i32, ptr %2, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_or(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %11, label %12, label %13

12:                                               ; preds = %9, %6
  br label %18

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %14, %15
  %17 = sub nsw i32 %16, 10
  store i32 %17, ptr %2, align 4
  br label %23

18:                                               ; preds = %12
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %19, %20
  %22 = add nsw i32 %21, 10
  store i32 %22, ptr %2, align 4
  br label %23

23:                                               ; preds = %18, %13
  %24 = load i32, ptr %2, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_and_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %19

18:                                               ; preds = %14
  store i32 200, ptr %3, align 4
  br label %20

19:                                               ; preds = %17
  store i32 100, ptr %3, align 4
  br label %20

20:                                               ; preds = %19, %18
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_or_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %19

18:                                               ; preds = %14, %11
  store i32 400, ptr %3, align 4
  br label %20

19:                                               ; preds = %17
  store i32 300, ptr %3, align 4
  br label %20

20:                                               ; preds = %19, %18
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br i1 %18, label %19, label %23

19:                                               ; preds = %16
  %20 = load i32, ptr %8, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %19, %13
  br label %31

23:                                               ; preds = %19, %16
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %6, align 4
  %26 = sub nsw i32 %24, %25
  %27 = load i32, ptr %7, align 4
  %28 = sub nsw i32 %26, %27
  %29 = load i32, ptr %8, align 4
  %30 = sub nsw i32 %28, %29
  store i32 %30, ptr %4, align 4
  br label %39

31:                                               ; preds = %22
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %36, %37
  store i32 %38, ptr %4, align 4
  br label %39

39:                                               ; preds = %31, %23
  %40 = load i32, ptr %4, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_nested_arithmetic_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %20

19:                                               ; preds = %8
  store i32 222, ptr %3, align 4
  br label %21

20:                                               ; preds = %18
  store i32 111, ptr %3, align 4
  br label %21

21:                                               ; preds = %20, %19
  %22 = load i32, ptr %3, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_deep_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %21, label %22, label %23

22:                                               ; preds = %8
  br label %29

23:                                               ; preds = %8
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %5, align 4
  %26 = sub nsw i32 %24, %25
  %27 = load i32, ptr %6, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, ptr %3, align 4
  br label %35

29:                                               ; preds = %22
  %30 = load i32, ptr %4, align 4
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %32, %33
  store i32 %34, ptr %3, align 4
  br label %35

35:                                               ; preds = %29, %23
  %36 = load i32, ptr %3, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_arithmetic_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %23

22:                                               ; preds = %14, %8
  store i32 456, ptr %3, align 4
  br label %24

23:                                               ; preds = %21
  store i32 123, ptr %3, align 4
  br label %24

24:                                               ; preds = %23, %22
  %25 = load i32, ptr %3, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_nested_boolean_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br label %32

31:                                               ; preds = %26, %22
  store i32 888, ptr %4, align 4
  br label %33

32:                                               ; preds = %30
  store i32 777, ptr %4, align 4
  br label %33

33:                                               ; preds = %32, %31
  %34 = load i32, ptr %4, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_nested_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 %7, ptr %5, align 4
  br label %8

8:                                                ; preds = %6
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %14

12:                                               ; preds = %8
  %13 = load i32, ptr %5, align 4
  store i32 %13, ptr %2, align 4
  br label %32

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  br label %25

18:                                               ; preds = %14
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %19, %20
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  %24 = load i32, ptr %5, align 4
  store i32 %24, ptr %2, align 4
  br label %32

25:                                               ; preds = %17
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %5, align 4
  %31 = load i32, ptr %5, align 4
  store i32 %31, ptr %2, align 4
  br label %32

32:                                               ; preds = %25, %18, %12
  %33 = load i32, ptr %2, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_nested_in_else(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %17

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  br label %21

14:                                               ; preds = %10
  %15 = load i32, ptr %4, align 4
  %16 = sub nsw i32 %15, 2
  store i32 %16, ptr %2, align 4
  br label %24

17:                                               ; preds = %9
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %2, align 4
  br label %24

21:                                               ; preds = %13
  %22 = load i32, ptr %4, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, ptr %2, align 4
  br label %24

24:                                               ; preds = %21, %17, %14
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_nested_goto_else(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %19

12:                                               ; preds = %8
  %13 = load i32, ptr %6, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %31

16:                                               ; preds = %12
  %17 = load i32, ptr %6, align 4
  %18 = sub nsw i32 %17, 2
  store i32 %18, ptr %3, align 4
  br label %34

19:                                               ; preds = %11
  %20 = load i32, ptr %5, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  br label %27

23:                                               ; preds = %19
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %5, align 4
  %26 = sub nsw i32 %24, %25
  store i32 %26, ptr %3, align 4
  br label %34

27:                                               ; preds = %22
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr %3, align 4
  br label %34

31:                                               ; preds = %15
  %32 = load i32, ptr %6, align 4
  %33 = mul nsw i32 %32, 2
  store i32 %33, ptr %3, align 4
  br label %34

34:                                               ; preds = %31, %27, %23, %16
  %35 = load i32, ptr %3, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_three_level_nesting(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %14

13:                                               ; preds = %9
  store i32 -1, ptr %3, align 4
  br label %39

14:                                               ; preds = %12
  %15 = load i32, ptr %7, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %7, align 4
  br label %17

17:                                               ; preds = %14
  %18 = load i32, ptr %5, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  br label %25

21:                                               ; preds = %17
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, 20
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  store i32 %24, ptr %3, align 4
  br label %39

25:                                               ; preds = %20
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, 10
  store i32 %27, ptr %7, align 4
  br label %28

28:                                               ; preds = %25
  %29 = load i32, ptr %6, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %32

31:                                               ; preds = %28
  br label %36

32:                                               ; preds = %28
  %33 = load i32, ptr %7, align 4
  %34 = sub nsw i32 %33, 100
  store i32 %34, ptr %7, align 4
  %35 = load i32, ptr %7, align 4
  store i32 %35, ptr %3, align 4
  br label %39

36:                                               ; preds = %31
  %37 = load i32, ptr %7, align 4
  %38 = add nsw i32 %37, 100
  store i32 %38, ptr %3, align 4
  br label %39

39:                                               ; preds = %36, %32, %21, %13
  %40 = load i32, ptr %3, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_deep_nested_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %20

16:                                               ; preds = %12
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %6, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  br label %56

20:                                               ; preds = %15
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %21, 10
  store i32 %22, ptr %7, align 4
  br label %23

23:                                               ; preds = %20
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %6, align 4
  %26 = icmp sgt i32 %24, %25
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  br label %42

28:                                               ; preds = %23
  %29 = load i32, ptr %7, align 4
  %30 = sub nsw i32 %29, 5
  store i32 %30, ptr %7, align 4
  br label %31

31:                                               ; preds = %28
  %32 = load i32, ptr %7, align 4
  %33 = load i32, ptr %6, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %36

35:                                               ; preds = %31
  br label %39

36:                                               ; preds = %31
  %37 = load i32, ptr %7, align 4
  %38 = sdiv i32 %37, 2
  store i32 %38, ptr %3, align 4
  br label %56

39:                                               ; preds = %35
  %40 = load i32, ptr %7, align 4
  %41 = mul nsw i32 %40, 2
  store i32 %41, ptr %3, align 4
  br label %56

42:                                               ; preds = %27
  %43 = load i32, ptr %7, align 4
  %44 = mul nsw i32 %43, 2
  store i32 %44, ptr %7, align 4
  br label %45

45:                                               ; preds = %42
  %46 = load i32, ptr %7, align 4
  %47 = srem i32 %46, 3
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %50

49:                                               ; preds = %45
  br label %53

50:                                               ; preds = %45
  %51 = load i32, ptr %7, align 4
  %52 = sub nsw i32 %51, 3
  store i32 %52, ptr %3, align 4
  br label %56

53:                                               ; preds = %49
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, 3
  store i32 %55, ptr %3, align 4
  br label %56

56:                                               ; preds = %53, %50, %39, %36, %16
  %57 = load i32, ptr %3, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_nested_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %18

16:                                               ; preds = %12, %9
  %17 = load i32, ptr %6, align 4
  store i32 %17, ptr %3, align 4
  br label %38

18:                                               ; preds = %15
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %7, align 4
  br label %22

22:                                               ; preds = %18
  %23 = load i32, ptr %6, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %29

25:                                               ; preds = %22
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %26, 10
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  br label %34

29:                                               ; preds = %25, %22
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %7, align 4
  %32 = sub nsw i32 %31, %30
  store i32 %32, ptr %7, align 4
  %33 = load i32, ptr %7, align 4
  store i32 %33, ptr %3, align 4
  br label %38

34:                                               ; preds = %28
  %35 = load i32, ptr %7, align 4
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, ptr %3, align 4
  br label %38

38:                                               ; preds = %34, %29, %16
  %39 = load i32, ptr %3, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_nested_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %8
  br label %16

15:                                               ; preds = %11
  store i32 3000, ptr %3, align 4
  br label %25

16:                                               ; preds = %14
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 10
  br i1 %18, label %22, label %19

19:                                               ; preds = %16
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %20, -10
  br i1 %21, label %22, label %23

22:                                               ; preds = %19, %16
  br label %24

23:                                               ; preds = %19
  store i32 2000, ptr %3, align 4
  br label %25

24:                                               ; preds = %22
  store i32 1000, ptr %3, align 4
  br label %25

25:                                               ; preds = %24, %23, %15
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_nested_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br i1 %18, label %19, label %20

19:                                               ; preds = %16, %13
  br label %24

20:                                               ; preds = %16
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %8, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %4, align 4
  br label %47

24:                                               ; preds = %19
  %25 = load i32, ptr %8, align 4
  %26 = icmp sgt i32 %25, 5
  br i1 %26, label %31, label %27

27:                                               ; preds = %24
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %6, align 4
  %30 = icmp eq i32 %28, %29
  br i1 %30, label %31, label %35

31:                                               ; preds = %27, %24
  %32 = load i32, ptr %7, align 4
  %33 = icmp slt i32 %32, 10
  br i1 %33, label %34, label %35

34:                                               ; preds = %31
  br label %39

35:                                               ; preds = %31, %27
  %36 = load i32, ptr %5, align 4
  %37 = load i32, ptr %6, align 4
  %38 = mul nsw i32 %36, %37
  store i32 %38, ptr %4, align 4
  br label %47

39:                                               ; preds = %34
  %40 = load i32, ptr %5, align 4
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %40, %41
  %43 = load i32, ptr %7, align 4
  %44 = add nsw i32 %42, %43
  %45 = load i32, ptr %8, align 4
  %46 = add nsw i32 %44, %45
  store i32 %46, ptr %4, align 4
  br label %47

47:                                               ; preds = %39, %35, %20
  %48 = load i32, ptr %4, align 4
  ret i32 %48
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_independent_gotos(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %entry
  store i32 %0, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  store i32 %5, ptr %3, align 4
  br label %6

6:                                                ; preds = %4
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %20

10:                                               ; preds = %6
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 5
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  br label %23

14:                                               ; preds = %10
  %15 = load i32, ptr %2, align 4
  %16 = icmp sgt i32 %15, 10
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  br label %26

18:                                               ; preds = %14
  %19 = load i32, ptr %3, align 4
  store i32 %19, ptr %1, align 4
  br label %41

20:                                               ; preds = %9
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 10
  store i32 %22, ptr %3, align 4
  br label %30

23:                                               ; preds = %33, %13
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 20
  store i32 %25, ptr %3, align 4
  br label %35

26:                                               ; preds = %38, %17
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %27, 30
  store i32 %28, ptr %3, align 4
  %29 = load i32, ptr %3, align 4
  store i32 %29, ptr %1, align 4
  br label %41

30:                                               ; preds = %20
  %31 = load i32, ptr %2, align 4
  %32 = icmp sgt i32 %31, 5
  br i1 %32, label %33, label %34

33:                                               ; preds = %30
  br label %23

34:                                               ; preds = %30
  br label %35

35:                                               ; preds = %34, %23
  %36 = load i32, ptr %2, align 4
  %37 = icmp sgt i32 %36, 10
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  br label %26

39:                                               ; preds = %35
  %40 = load i32, ptr %3, align 4
  store i32 %40, ptr %1, align 4
  br label %41

41:                                               ; preds = %39, %26, %18
  %42 = load i32, ptr %1, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_independent_goto_paths(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %14

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = sub nsw i32 %12, 10
  store i32 %13, ptr %5, align 4
  br label %17

14:                                               ; preds = %10
  %15 = load i32, ptr %5, align 4
  %16 = add nsw i32 %15, 10
  store i32 %16, ptr %5, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %4, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  br label %24

21:                                               ; preds = %17
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %22, 20
  store i32 %23, ptr %2, align 4
  br label %27

24:                                               ; preds = %20
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 20
  store i32 %26, ptr %2, align 4
  br label %27

27:                                               ; preds = %24, %21
  %28 = load i32, ptr %2, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_array_condition(i32 noundef %0) #0 {
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
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 2
  store i32 %15, ptr %1, align 4
  br label %19

16:                                               ; preds = %12
  %17 = load i32, ptr %3, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %1, align 4
  br label %19

19:                                               ; preds = %16, %13
  %20 = load i32, ptr %1, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_array_branches(i32 noundef %0) #0 {
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
  br i1 %9, label %10, label %11

10:                                               ; preds = %4
  br label %18

11:                                               ; preds = %4
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  %17 = sub nsw i32 %15, %16
  store i32 %17, ptr %1, align 4
  br label %25

18:                                               ; preds = %10
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %1, align 4
  br label %25

25:                                               ; preds = %18, %11
  %26 = load i32, ptr %1, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_array_complex_condition(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %15, label %16, label %23

16:                                               ; preds = %6
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %16
  br label %29

23:                                               ; preds = %16, %6
  %24 = load i32, ptr %4, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = mul nsw i32 %27, 10
  store i32 %28, ptr %2, align 4
  br label %35

29:                                               ; preds = %22
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = mul nsw i32 %33, 10
  store i32 %34, ptr %2, align 4
  br label %35

35:                                               ; preds = %29, %23
  %36 = load i32, ptr %2, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_matrix_condition(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  br label %21

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = sub nsw i32 %19, 2
  store i32 %20, ptr %2, align 4
  br label %24

21:                                               ; preds = %17
  %22 = load i32, ptr %5, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, ptr %2, align 4
  br label %24

24:                                               ; preds = %21, %18
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_nested_array(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %3, align 4
  %9 = icmp sge i32 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 8
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  br label %15

14:                                               ; preds = %10, %7
  store i32 0, ptr %2, align 4
  br label %67

15:                                               ; preds = %13
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %5, align 4
  br label %22

22:                                               ; preds = %15
  %23 = load i32, ptr %4, align 4
  %24 = icmp sge i32 %23, 0
  br i1 %24, label %25, label %29

25:                                               ; preds = %22
  %26 = load i32, ptr %4, align 4
  %27 = icmp slt i32 %26, 8
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  br label %31

29:                                               ; preds = %25, %22
  %30 = load i32, ptr %5, align 4
  store i32 %30, ptr %2, align 4
  br label %67

31:                                               ; preds = %28
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = load i32, ptr %4, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = icmp sgt i32 %35, %39
  br i1 %40, label %41, label %42

41:                                               ; preds = %31
  br label %55

42:                                               ; preds = %31
  %43 = load i32, ptr %4, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = load i32, ptr %3, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = sub nsw i32 %46, %50
  %52 = load i32, ptr %5, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, ptr %5, align 4
  %54 = load i32, ptr %5, align 4
  store i32 %54, ptr %2, align 4
  br label %67

55:                                               ; preds = %41
  %56 = load i32, ptr %5, align 4
  %57 = load i32, ptr %3, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = add nsw i32 %56, %60
  %62 = load i32, ptr %4, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = sub nsw i32 %61, %65
  store i32 %66, ptr %2, align 4
  br label %67

67:                                               ; preds = %55, %42, %29, %14
  %68 = load i32, ptr %2, align 4
  ret i32 %68
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_pointer_condition(ptr noundef %0) #0 {
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
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  br label %13

9:                                                ; preds = %4
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 2
  store i32 %12, ptr %1, align 4
  br label %17

13:                                               ; preds = %8
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %1, align 4
  br label %17

17:                                               ; preds = %13, %9
  %18 = load i32, ptr %1, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_pointer_branches(ptr noundef %0) #0 {
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
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  br label %13

9:                                                ; preds = %4
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %10, align 4
  %12 = sub nsw i32 %11, 100
  store i32 %12, ptr %1, align 4
  br label %17

13:                                               ; preds = %8
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, 100
  store i32 %16, ptr %1, align 4
  br label %17

17:                                               ; preds = %13, %9
  %18 = load i32, ptr %1, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_pointer_array(ptr noundef %0, i32 noundef %1) #0 {
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
  br i1 %16, label %17, label %18

17:                                               ; preds = %6
  br label %29

18:                                               ; preds = %6
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %19, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %4, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = sub nsw i32 %23, %27
  store i32 %28, ptr %2, align 4
  br label %40

29:                                               ; preds = %17
  %30 = load ptr, ptr %3, align 8
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, ptr %30, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %34, %38
  store i32 %39, ptr %2, align 4
  br label %40

40:                                               ; preds = %29, %18
  %41 = load i32, ptr %2, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_nested_pointer(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %entry
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %5, align 4
  br label %9

9:                                                ; preds = %6
  %10 = load ptr, ptr %3, align 8
  %11 = load i32, ptr %10, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  br label %17

14:                                               ; preds = %9
  %15 = load i32, ptr %5, align 4
  %16 = sub nsw i32 0, %15
  store i32 %16, ptr %2, align 4
  br label %32

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %19, align 4
  %21 = icmp sgt i32 %18, %20
  br i1 %21, label %22, label %23

22:                                               ; preds = %17
  br label %28

23:                                               ; preds = %17
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %5, align 4
  %26 = sub nsw i32 %25, %24
  store i32 %26, ptr %5, align 4
  %27 = load i32, ptr %5, align 4
  store i32 %27, ptr %2, align 4
  br label %32

28:                                               ; preds = %22
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, ptr %2, align 4
  br label %32

32:                                               ; preds = %28, %23, %14
  %33 = load i32, ptr %2, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_pointer_write(ptr noundef %0, i32 noundef %1) #0 {
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
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  br label %13

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = sub nsw i32 %10, 2
  %12 = load ptr, ptr %2, align 8
  store i32 %11, ptr %12, align 4
  br label %17

13:                                               ; preds = %8
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  %16 = load ptr, ptr %2, align 8
  store i32 %15, ptr %16, align 4
  br label %17

17:                                               ; preds = %13, %9
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %18, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_pointer_write_nested(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %15

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = sub nsw i32 0, %12
  %14 = load ptr, ptr %3, align 8
  store i32 %13, ptr %14, align 4
  br label %29

15:                                               ; preds = %10
  %16 = load i32, ptr %5, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  br label %24

19:                                               ; preds = %15
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %5, align 4
  %22 = sub nsw i32 %20, %21
  %23 = load ptr, ptr %3, align 8
  store i32 %22, ptr %23, align 4
  br label %29

24:                                               ; preds = %18
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  %28 = load ptr, ptr %3, align 8
  store i32 %27, ptr %28, align 4
  br label %29

29:                                               ; preds = %24, %19, %11
  %30 = load ptr, ptr %3, align 8
  %31 = load i32, ptr %30, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_global_only() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  br label %9

5:                                                ; preds = %1
  %6 = load i32, ptr @g_x, align 4
  %7 = load i32, ptr @g_y, align 4
  %8 = sub nsw i32 %6, %7
  store i32 %8, ptr %0, align 4
  br label %13

9:                                                ; preds = %4
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  br label %13

13:                                               ; preds = %9, %5
  %14 = load i32, ptr %0, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_global_and() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %1
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  br label %10

8:                                                ; preds = %4, %1
  %9 = load i32, ptr @g_z, align 4
  store i32 %9, ptr %0, align 4
  br label %14

10:                                               ; preds = %7
  %11 = load i32, ptr @g_x, align 4
  %12 = load i32, ptr @g_y, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %0, align 4
  br label %14

14:                                               ; preds = %10, %8
  %15 = load i32, ptr %0, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_global_or() #0 {
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
  br i1 %6, label %7, label %8

7:                                                ; preds = %4, %1
  br label %10

8:                                                ; preds = %4
  %9 = load i32, ptr @g_y, align 4
  store i32 %9, ptr %0, align 4
  br label %14

10:                                               ; preds = %7
  %11 = load i32, ptr @g_x, align 4
  %12 = load i32, ptr @g_z, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %0, align 4
  br label %14

14:                                               ; preds = %10, %8
  %15 = load i32, ptr %0, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_global_nested() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  br label %7

5:                                                ; preds = %1
  %6 = load i32, ptr @g_z, align 4
  store i32 %6, ptr %0, align 4
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
  store i32 %14, ptr %0, align 4
  br label %19

15:                                               ; preds = %10
  %16 = load i32, ptr @g_x, align 4
  %17 = load i32, ptr @g_y, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %0, align 4
  br label %19

19:                                               ; preds = %15, %11, %5
  %20 = load i32, ptr %0, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_global_array_only() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_arr, align 16
  %3 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %8

6:                                                ; preds = %1
  %7 = load i32, ptr @g_arr, align 16
  store i32 %7, ptr %0, align 4
  br label %10

8:                                                ; preds = %5
  %9 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 %9, ptr %0, align 4
  br label %10

10:                                               ; preds = %8, %6
  %11 = load i32, ptr %0, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_matrix_only() #0 {
entry:
  %0 = alloca i32, align 4
  br label %1

1:                                                ; preds = %entry
  %2 = load i32, ptr @g_mat, align 16
  %3 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %8

6:                                                ; preds = %1
  %7 = load i32, ptr @g_mat, align 16
  store i32 %7, ptr %0, align 4
  br label %10

8:                                                ; preds = %5
  %9 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  store i32 %9, ptr %0, align 4
  br label %10

10:                                               ; preds = %8, %6
  %11 = load i32, ptr %0, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_multiple_returns(i32 noundef %0) #0 {
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
  br label %17

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %18

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %13, 10
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %19

16:                                               ; preds = %12
  store i32 20, ptr %1, align 4
  br label %20

17:                                               ; preds = %7
  store i32 -1, ptr %1, align 4
  br label %20

18:                                               ; preds = %11
  store i32 0, ptr %1, align 4
  br label %20

19:                                               ; preds = %15
  store i32 10, ptr %1, align 4
  br label %20

20:                                               ; preds = %19, %18, %17, %16
  %21 = load i32, ptr %1, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_nested_multiple_returns(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %13

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = sub nsw i32 0, %11
  store i32 %12, ptr %2, align 4
  br label %31

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %25

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  br label %29

21:                                               ; preds = %17
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %2, align 4
  br label %31

25:                                               ; preds = %16
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %2, align 4
  br label %31

29:                                               ; preds = %20
  %30 = load i32, ptr %3, align 4
  store i32 %30, ptr %2, align 4
  br label %31

31:                                               ; preds = %29, %25, %21, %10
  %32 = load i32, ptr %2, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_complex_multiple_returns(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %32

15:                                               ; preds = %11, %8
  %16 = load i32, ptr %4, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %21, label %18

18:                                               ; preds = %15
  %19 = load i32, ptr %6, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %18, %15
  br label %36

22:                                               ; preds = %18
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %6, align 4
  %27 = mul nsw i32 %26, 2
  %28 = icmp sgt i32 %25, %27
  br i1 %28, label %29, label %30

29:                                               ; preds = %22
  br label %40

30:                                               ; preds = %22
  %31 = load i32, ptr %6, align 4
  store i32 %31, ptr %3, align 4
  br label %44

32:                                               ; preds = %14
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %3, align 4
  br label %44

36:                                               ; preds = %21
  %37 = load i32, ptr %4, align 4
  %38 = load i32, ptr %6, align 4
  %39 = sub nsw i32 %37, %38
  store i32 %39, ptr %3, align 4
  br label %44

40:                                               ; preds = %29
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %5, align 4
  %43 = mul nsw i32 %41, %42
  store i32 %43, ptr %3, align 4
  br label %44

44:                                               ; preds = %40, %36, %32, %30
  %45 = load i32, ptr %3, align 4
  ret i32 %45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_50_prefix_code(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  br label %25

22:                                               ; preds = %18
  %23 = load i32, ptr %8, align 4
  %24 = sub nsw i32 %23, 100
  store i32 %24, ptr %8, align 4
  br label %28

25:                                               ; preds = %21
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %26, 100
  store i32 %27, ptr %8, align 4
  br label %28

28:                                               ; preds = %25, %22
  %29 = load i32, ptr %8, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %31, %32
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_51_suffix_code(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  br label %14

11:                                               ; preds = %6
  %12 = load i32, ptr %3, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %4, align 4
  br label %17

14:                                               ; preds = %10
  %15 = load i32, ptr %2, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %4, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, 10
  store i32 %19, ptr %4, align 4
  %20 = load i32, ptr %4, align 4
  %21 = mul nsw i32 %20, 3
  store i32 %21, ptr %4, align 4
  %22 = load i32, ptr %4, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_prefix_nested_suffix(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  br label %18

15:                                               ; preds = %11
  %16 = load i32, ptr %6, align 4
  %17 = sub nsw i32 0, %16
  store i32 %17, ptr %6, align 4
  br label %35

18:                                               ; preds = %14
  %19 = load i32, ptr %6, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, ptr %6, align 4
  br label %21

21:                                               ; preds = %18
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr %5, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %26

25:                                               ; preds = %21
  br label %29

26:                                               ; preds = %21
  %27 = load i32, ptr %6, align 4
  %28 = sub nsw i32 %27, 10
  store i32 %28, ptr %6, align 4
  br label %32

29:                                               ; preds = %25
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 10
  store i32 %31, ptr %6, align 4
  br label %32

32:                                               ; preds = %29, %26
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, 5
  store i32 %34, ptr %6, align 4
  br label %35

35:                                               ; preds = %32, %15
  %36 = load i32, ptr %6, align 4
  %37 = load i32, ptr %5, align 4
  %38 = add nsw i32 %36, %37
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_diamond(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  br label %14

11:                                               ; preds = %6
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 20
  store i32 %13, ptr %4, align 4
  br label %17

14:                                               ; preds = %10
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 10
  store i32 %16, ptr %4, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %4, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_multiple_merge_values(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %16

11:                                               ; preds = %7
  %12 = load i32, ptr %2, align 4
  %13 = sub nsw i32 %12, 1
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 2
  store i32 %15, ptr %5, align 4
  br label %21

16:                                               ; preds = %10
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 2
  store i32 %20, ptr %5, align 4
  br label %21

21:                                               ; preds = %16, %11
  %22 = load i32, ptr %4, align 4
  %23 = load i32, ptr %5, align 4
  %24 = mul nsw i32 %22, %23
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_55_nested_diamonds(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  br label %26

14:                                               ; preds = %10
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  br label %22

18:                                               ; preds = %14
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %7, align 4
  br label %38

22:                                               ; preds = %17
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, ptr %7, align 4
  br label %38

26:                                               ; preds = %13
  %27 = load i32, ptr %5, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %26
  br label %34

30:                                               ; preds = %26
  %31 = load i32, ptr %4, align 4
  %32 = load i32, ptr %5, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %7, align 4
  br label %38

34:                                               ; preds = %29
  %35 = load i32, ptr %4, align 4
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, ptr %7, align 4
  br label %38

38:                                               ; preds = %34, %30, %22, %18
  %39 = load i32, ptr %7, align 4
  %40 = icmp sgt i32 %39, 10
  br i1 %40, label %41, label %42

41:                                               ; preds = %38
  br label %46

42:                                               ; preds = %38
  %43 = load i32, ptr %7, align 4
  %44 = sub nsw i32 %43, 2
  store i32 %44, ptr %8, align 4
  %45 = load i32, ptr %8, align 4
  store i32 %45, ptr %3, align 4
  br label %50

46:                                               ; preds = %41
  %47 = load i32, ptr %7, align 4
  %48 = mul nsw i32 %47, 2
  store i32 %48, ptr %8, align 4
  %49 = load i32, ptr %8, align 4
  store i32 %49, ptr %3, align 4
  br label %50

50:                                               ; preds = %46, %42
  %51 = load i32, ptr %3, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_ternary_before_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %23

20:                                               ; preds = %16
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 2
  store i32 %22, ptr %2, align 4
  br label %26

23:                                               ; preds = %19
  %24 = load i32, ptr %5, align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, ptr %2, align 4
  br label %26

26:                                               ; preds = %23, %20
  %27 = load i32, ptr %2, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_ternary_inside_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %20

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, ptr %4, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %.reg2mem, align 4
  br label %19

16:                                               ; preds = %10
  %17 = load i32, ptr %4, align 4
  %18 = sub nsw i32 %17, 2
  store i32 %18, ptr %.reg2mem, align 4
  br label %19

19:                                               ; preds = %16, %13
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  br label %32

20:                                               ; preds = %9
  %21 = load i32, ptr %4, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %24, %25
  store i32 %26, ptr %.reg2mem1, align 4
  br label %31

27:                                               ; preds = %20
  %28 = load i32, ptr %3, align 4
  %29 = load i32, ptr %4, align 4
  %30 = sub nsw i32 %28, %29
  store i32 %30, ptr %.reg2mem1, align 4
  br label %31

31:                                               ; preds = %27, %23
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %2, align 4
  br label %32

32:                                               ; preds = %31, %19
  %33 = load i32, ptr %2, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_58_nested_ternary_goto(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  br label %38

36:                                               ; preds = %32
  %37 = load i32, ptr %7, align 4
  store i32 %37, ptr %3, align 4
  br label %41

38:                                               ; preds = %35
  %39 = load i32, ptr %7, align 4
  %40 = mul nsw i32 %39, 2
  store i32 %40, ptr %3, align 4
  br label %41

41:                                               ; preds = %38, %36
  %42 = load i32, ptr %3, align 4
  ret i32 %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_59_dynamic_alloca(i32 noundef %0, i32 noundef %1) #0 {
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
  %9 = load i32, ptr %3, align 4
  %10 = zext i32 %9 to i64
  %11 = call ptr @llvm.stacksave()
  store ptr %11, ptr %5, align 8
  %12 = alloca i32, i64 %10, align 16
  store ptr %12, ptr %.reg2mem, align 8
  store i64 %10, ptr %6, align 8
  br label %13

13:                                               ; preds = %8
  %14 = load i32, ptr %3, align 4
  %15 = icmp sle i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %44

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %19 = getelementptr inbounds i32, ptr %.reload5, i64 0
  store i32 %18, ptr %19, align 16
  br label %20

20:                                               ; preds = %17
  %21 = load i32, ptr %3, align 4
  %22 = icmp sgt i32 %21, 1
  br i1 %22, label %23, label %24

23:                                               ; preds = %20
  br label %28

24:                                               ; preds = %20
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %25 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %26 = load i32, ptr %25, align 16
  %27 = add nsw i32 %26, 10
  store i32 %27, ptr %25, align 16
  br label %32

28:                                               ; preds = %23
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %29, 10
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %31 = getelementptr inbounds i32, ptr %.reload3, i64 1
  store i32 %30, ptr %31, align 4
  br label %32

32:                                               ; preds = %28, %24
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %33 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %34 = load i32, ptr %33, align 16
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %32
  br label %41

37:                                               ; preds = %32
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %38 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %39 = load i32, ptr %38, align 16
  %40 = sub nsw i32 %39, 1
  store i32 %40, ptr %2, align 4
  store i32 1, ptr %7, align 4
  br label %45

41:                                               ; preds = %36
  %.reload = load ptr, ptr %.reg2mem, align 8
  %42 = getelementptr inbounds i32, ptr %.reload, i64 0
  %43 = load i32, ptr %42, align 16
  store i32 %43, ptr %2, align 4
  store i32 1, ptr %7, align 4
  br label %45

44:                                               ; preds = %16
  store i32 -1, ptr %2, align 4
  store i32 1, ptr %7, align 4
  br label %45

45:                                               ; preds = %44, %41, %37
  %46 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %46)
  %47 = load i32, ptr %2, align 4
  ret i32 %47
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_60_dynamic_alloca_pointer(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca ptr, align 8
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
  %10 = load i32, ptr %3, align 4
  %11 = zext i32 %10 to i64
  %12 = call ptr @llvm.stacksave()
  store ptr %12, ptr %5, align 8
  %13 = alloca i32, i64 %11, align 16
  store ptr %13, ptr %.reg2mem, align 8
  store i64 %11, ptr %6, align 8
  br label %14

14:                                               ; preds = %9
  %15 = load i32, ptr %3, align 4
  %16 = icmp sle i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  br label %56

18:                                               ; preds = %14
  %.reload = load ptr, ptr %.reg2mem, align 8
  store ptr %.reload, ptr %7, align 8
  %19 = load i32, ptr %4, align 4
  %20 = load ptr, ptr %7, align 8
  store i32 %19, ptr %20, align 4
  br label %21

21:                                               ; preds = %18
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %22, 2
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  br label %29

25:                                               ; preds = %21
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds i32, ptr %26, i64 0
  %28 = load i32, ptr %27, align 4
  store i32 %28, ptr %2, align 4
  store i32 1, ptr %8, align 4
  br label %57

29:                                               ; preds = %24
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds i32, ptr %32, i64 1
  store i32 %31, ptr %33, align 4
  br label %34

34:                                               ; preds = %29
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 1
  %37 = load i32, ptr %36, align 4
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %39, label %40

39:                                               ; preds = %34
  br label %48

40:                                               ; preds = %34
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds i32, ptr %41, i64 0
  %43 = load i32, ptr %42, align 4
  %44 = load ptr, ptr %7, align 8
  %45 = getelementptr inbounds i32, ptr %44, i64 1
  %46 = load i32, ptr %45, align 4
  %47 = sub nsw i32 %43, %46
  store i32 %47, ptr %2, align 4
  store i32 1, ptr %8, align 4
  br label %57

48:                                               ; preds = %39
  %49 = load ptr, ptr %7, align 8
  %50 = getelementptr inbounds i32, ptr %49, i64 1
  %51 = load i32, ptr %50, align 4
  %52 = load ptr, ptr %7, align 8
  %53 = getelementptr inbounds i32, ptr %52, i64 0
  %54 = load i32, ptr %53, align 4
  %55 = add nsw i32 %51, %54
  store i32 %55, ptr %2, align 4
  store i32 1, ptr %8, align 4
  br label %57

56:                                               ; preds = %17
  store i32 -1, ptr %2, align 4
  store i32 1, ptr %8, align 4
  br label %57

57:                                               ; preds = %56, %48, %40, %25
  %58 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %58)
  %59 = load i32, ptr %2, align 4
  ret i32 %59
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_61_dynamic_alloca_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %11 = load i32, ptr %4, align 4
  %12 = zext i32 %11 to i64
  %13 = call ptr @llvm.stacksave()
  store ptr %13, ptr %7, align 8
  %14 = alloca i32, i64 %12, align 16
  store ptr %14, ptr %.reg2mem, align 8
  store i64 %12, ptr %8, align 8
  br label %15

15:                                               ; preds = %10
  %16 = load i32, ptr %4, align 4
  %17 = icmp sle i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  br label %57

19:                                               ; preds = %15
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %20, %21
  %.reload7 = load ptr, ptr %.reg2mem, align 8
  %23 = getelementptr inbounds i32, ptr %.reload7, i64 0
  store i32 %22, ptr %23, align 16
  br label %24

24:                                               ; preds = %19
  %25 = load i32, ptr %4, align 4
  %26 = icmp sgt i32 %25, 3
  br i1 %26, label %27, label %32

27:                                               ; preds = %24
  %.reload6 = load ptr, ptr %.reg2mem, align 8
  %28 = getelementptr inbounds i32, ptr %.reload6, i64 0
  %29 = load i32, ptr %28, align 16
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %32

31:                                               ; preds = %27
  br label %36

32:                                               ; preds = %27, %24
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %33 = getelementptr inbounds i32, ptr %.reload5, i64 0
  %34 = load i32, ptr %33, align 16
  %35 = sub nsw i32 %34, 5
  store i32 %35, ptr %33, align 16
  br label %41

36:                                               ; preds = %31
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %37 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %38 = load i32, ptr %37, align 16
  %39 = mul nsw i32 %38, 2
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %40 = getelementptr inbounds i32, ptr %.reload3, i64 1
  store i32 %39, ptr %40, align 4
  br label %41

41:                                               ; preds = %36, %32
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %42 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %43 = load i32, ptr %42, align 16
  %44 = icmp sgt i32 %43, 10
  br i1 %44, label %48, label %45

45:                                               ; preds = %41
  %46 = load i32, ptr %6, align 4
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %45, %41
  br label %54

49:                                               ; preds = %45
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %50 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %51 = load i32, ptr %50, align 16
  %52 = load i32, ptr %5, align 4
  %53 = add nsw i32 %51, %52
  store i32 %53, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %58

54:                                               ; preds = %48
  %.reload = load ptr, ptr %.reg2mem, align 8
  %55 = getelementptr inbounds i32, ptr %.reload, i64 0
  %56 = load i32, ptr %55, align 16
  store i32 %56, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %58

57:                                               ; preds = %18
  store i32 -100, ptr %3, align 4
  store i32 1, ptr %9, align 4
  br label %58

58:                                               ; preds = %57, %54, %49
  %59 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %59)
  %60 = load i32, ptr %3, align 4
  ret i32 %60
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_62_malloc_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %48

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
  br label %47

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
  br i1 %29, label %30, label %31

30:                                               ; preds = %25
  br label %36

31:                                               ; preds = %25
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds i32, ptr %32, i64 0
  %34 = load i32, ptr %33, align 4
  %35 = sub nsw i32 %34, 2
  store i32 %35, ptr %33, align 4
  br label %41

36:                                               ; preds = %30
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds i32, ptr %37, i64 0
  %39 = load i32, ptr %38, align 4
  %40 = mul nsw i32 %39, 2
  store i32 %40, ptr %38, align 4
  br label %41

41:                                               ; preds = %36, %31
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds i32, ptr %42, i64 0
  %44 = load i32, ptr %43, align 4
  store i32 %44, ptr %6, align 4
  %45 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %45) #7
  %46 = load i32, ptr %6, align 4
  store i32 %46, ptr %2, align 4
  br label %49

47:                                               ; preds = %20
  store i32 -2, ptr %2, align 4
  br label %49

48:                                               ; preds = %11
  store i32 -1, ptr %2, align 4
  br label %49

49:                                               ; preds = %48, %47, %41
  %50 = load i32, ptr %2, align 4
  ret i32 %50
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_63_malloc_nested_goto(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br label %61

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
  br label %60

23:                                               ; preds = %19
  %24 = load i32, ptr %5, align 4
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds i32, ptr %25, i64 0
  store i32 %24, ptr %26, align 4
  br label %27

27:                                               ; preds = %23
  %28 = load i32, ptr %5, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  br label %38

31:                                               ; preds = %27
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds i32, ptr %32, i64 0
  %34 = load i32, ptr %33, align 4
  %35 = sub nsw i32 0, %34
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr inbounds i32, ptr %36, i64 0
  store i32 %35, ptr %37, align 4
  br label %54

38:                                               ; preds = %30
  %39 = load i32, ptr %6, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %41, label %42

41:                                               ; preds = %38
  br label %48

42:                                               ; preds = %38
  %43 = load i32, ptr %6, align 4
  %44 = load ptr, ptr %7, align 8
  %45 = getelementptr inbounds i32, ptr %44, i64 0
  %46 = load i32, ptr %45, align 4
  %47 = sub nsw i32 %46, %43
  store i32 %47, ptr %45, align 4
  br label %54

48:                                               ; preds = %41
  %49 = load i32, ptr %6, align 4
  %50 = load ptr, ptr %7, align 8
  %51 = getelementptr inbounds i32, ptr %50, i64 0
  %52 = load i32, ptr %51, align 4
  %53 = add nsw i32 %52, %49
  store i32 %53, ptr %51, align 4
  br label %54

54:                                               ; preds = %48, %42, %31
  %55 = load ptr, ptr %7, align 8
  %56 = getelementptr inbounds i32, ptr %55, i64 0
  %57 = load i32, ptr %56, align 4
  store i32 %57, ptr %8, align 4
  %58 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %58) #7
  %59 = load i32, ptr %8, align 4
  store i32 %59, ptr %3, align 4
  br label %62

60:                                               ; preds = %22
  store i32 -2, ptr %3, align 4
  br label %62

61:                                               ; preds = %13
  store i32 -1, ptr %3, align 4
  br label %62

62:                                               ; preds = %61, %60, %54
  %63 = load i32, ptr %3, align 4
  ret i32 %63
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_64_void_goto(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  br label %3

3:                                                ; preds = %2
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  br label %8

7:                                                ; preds = %3
  br label %12

8:                                                ; preds = %6
  %9 = load i32, ptr %1, align 4
  %10 = load i32, ptr @g_void_result, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_65_void_goto_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %entry
  store i32 %0, ptr %1, align 4
  br label %3

3:                                                ; preds = %2
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  br label %11

7:                                                ; preds = %3
  %8 = load i32, ptr %1, align 4
  %9 = load i32, ptr @g_void_result, align 4
  %10 = sub nsw i32 %9, %8
  store i32 %10, ptr @g_void_result, align 4
  br label %16

11:                                               ; preds = %6
  %12 = load i32, ptr %1, align 4
  %13 = mul nsw i32 %12, 2
  %14 = load i32, ptr @g_void_result, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr @g_void_result, align 4
  br label %16

16:                                               ; preds = %11, %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_66_void_nested(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  br label %13

9:                                                ; preds = %5
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr @g_void_result, align 4
  %12 = sub nsw i32 %11, %10
  store i32 %12, ptr @g_void_result, align 4
  br label %29

13:                                               ; preds = %8
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %23

17:                                               ; preds = %13
  %18 = load i32, ptr %2, align 4
  %19 = load i32, ptr %3, align 4
  %20 = sub nsw i32 %18, %19
  %21 = load i32, ptr @g_void_result, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr @g_void_result, align 4
  br label %29

23:                                               ; preds = %16
  %24 = load i32, ptr %2, align 4
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr @g_void_result, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr @g_void_result, align 4
  br label %29

29:                                               ; preds = %23, %17, %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %15, label %16, label %17

16:                                               ; preds = %13, %10
  br label %25

17:                                               ; preds = %13
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32, ptr @g_void_result, align 4
  %24 = sub nsw i32 %23, %22
  store i32 %24, ptr @g_void_result, align 4
  br label %33

25:                                               ; preds = %16
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr @g_void_result, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr @g_void_result, align 4
  br label %33

33:                                               ; preds = %25, %17
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_global_only() #0 {
entry:
  br label %0

0:                                                ; preds = %entry
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
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  br label %13

9:                                                ; preds = %5
  %10 = load i32, ptr %3, align 4
  %11 = sub nsw i32 %10, 2
  %12 = load ptr, ptr %2, align 8
  store i32 %11, ptr %12, align 4
  br label %17

13:                                               ; preds = %8
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  %16 = load ptr, ptr %2, align 8
  store i32 %15, ptr %16, align 4
  br label %17

17:                                               ; preds = %13, %9
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr @g_void_result, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr @g_void_result, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_70_void_array(i32 noundef %0, i32 noundef %1) #0 {
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
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 8
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %13

12:                                               ; preds = %8, %5
  br label %33

13:                                               ; preds = %11
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %16
  store i32 %14, ptr %17, align 4
  br label %18

18:                                               ; preds = %13
  %19 = load i32, ptr %2, align 4
  %20 = icmp sge i32 %19, 0
  br i1 %20, label %21, label %25

21:                                               ; preds = %18
  %22 = load i32, ptr %2, align 4
  %23 = icmp slt i32 %22, 8
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  br label %26

25:                                               ; preds = %21, %18
  br label %33

26:                                               ; preds = %24
  %27 = load i32, ptr %2, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr @g_void_result, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr @g_void_result, align 4
  br label %33

33:                                               ; preds = %26, %25, %12
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_71_complex_control_flow(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  br label %56

17:                                               ; preds = %12
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %8, align 4
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %40

22:                                               ; preds = %17
  %23 = load i32, ptr %8, align 4
  %24 = load i32, ptr %9, align 4
  %25 = sub nsw i32 %24, %23
  store i32 %25, ptr %9, align 4
  br label %26

26:                                               ; preds = %22
  %27 = load i32, ptr %7, align 4
  %28 = load i32, ptr %8, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr @g_x, align 4
  %31 = add nsw i32 %30, 1
  %32 = icmp sgt i32 %29, %31
  br i1 %32, label %33, label %34

33:                                               ; preds = %26
  br label %37

34:                                               ; preds = %26
  %35 = load i32, ptr %9, align 4
  %36 = sdiv i32 %35, 2
  store i32 %36, ptr %4, align 4
  br label %111

37:                                               ; preds = %33
  %38 = load i32, ptr %9, align 4
  %39 = mul nsw i32 %38, 2
  store i32 %39, ptr %4, align 4
  br label %111

40:                                               ; preds = %21
  %41 = load i32, ptr @g_z, align 4
  %42 = load i32, ptr %9, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %9, align 4
  br label %44

44:                                               ; preds = %40
  %45 = load ptr, ptr %5, align 8
  %46 = load i32, ptr %45, align 4
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %44
  br label %54

49:                                               ; preds = %44
  %50 = load i32, ptr %9, align 4
  %51 = load ptr, ptr %5, align 8
  %52 = load i32, ptr %51, align 4
  %53 = add nsw i32 %50, %52
  store i32 %53, ptr %4, align 4
  br label %111

54:                                               ; preds = %48
  %55 = load i32, ptr %9, align 4
  store i32 %55, ptr %4, align 4
  br label %111

56:                                               ; preds = %16
  %57 = load i32, ptr %7, align 4
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %9, align 4
  br label %60

60:                                               ; preds = %56
  %61 = load i32, ptr %6, align 4
  %62 = icmp sge i32 %61, 0
  br i1 %62, label %63, label %67

63:                                               ; preds = %60
  %64 = load i32, ptr %6, align 4
  %65 = icmp slt i32 %64, 8
  br i1 %65, label %66, label %67

66:                                               ; preds = %63
  br label %71

67:                                               ; preds = %63, %60
  %68 = load i32, ptr %9, align 4
  %69 = add nsw i32 %68, 100
  store i32 %69, ptr %9, align 4
  %70 = load i32, ptr %9, align 4
  store i32 %70, ptr %4, align 4
  br label %111

71:                                               ; preds = %66
  %72 = load i32, ptr %6, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %73
  %75 = load i32, ptr %74, align 4
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %77, label %78

77:                                               ; preds = %71
  br label %86

78:                                               ; preds = %71
  %79 = load i32, ptr %6, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = load i32, ptr %9, align 4
  %84 = sub nsw i32 %83, %82
  store i32 %84, ptr %9, align 4
  %85 = load i32, ptr %9, align 4
  store i32 %85, ptr %4, align 4
  br label %111

86:                                               ; preds = %77
  %87 = load i32, ptr %6, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = load i32, ptr %9, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %9, align 4
  br label %93

93:                                               ; preds = %86
  %94 = load ptr, ptr %5, align 8
  %95 = load i32, ptr %94, align 4
  %96 = icmp sgt i32 %95, 0
  br i1 %96, label %100, label %97

97:                                               ; preds = %93
  %98 = load i32, ptr @g_y, align 4
  %99 = icmp slt i32 %98, 0
  br i1 %99, label %100, label %101

100:                                              ; preds = %97, %93
  br label %106

101:                                              ; preds = %97
  %102 = load i32, ptr %9, align 4
  %103 = load ptr, ptr %5, align 8
  %104 = load i32, ptr %103, align 4
  %105 = sub nsw i32 %102, %104
  store i32 %105, ptr %4, align 4
  br label %111

106:                                              ; preds = %100
  %107 = load i32, ptr %9, align 4
  %108 = load ptr, ptr %5, align 8
  %109 = load i32, ptr %108, align 4
  %110 = add nsw i32 %107, %109
  store i32 %110, ptr %4, align 4
  br label %111

111:                                              ; preds = %106, %101, %78, %67, %54, %49, %37, %34
  %112 = load i32, ptr %4, align 4
  ret i32 %112
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_72_complex_merge(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %36

17:                                               ; preds = %10, %13
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %5, align 4
  %20 = sub nsw i32 %18, %19
  store i32 %20, ptr %7, align 4
  br label %21

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %28, label %24

24:                                               ; preds = %21
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %29

28:                                               ; preds = %24, %21
  br label %33

29:                                               ; preds = %24
  %30 = load i32, ptr %7, align 4
  %31 = load i32, ptr %6, align 4
  %32 = sub nsw i32 %30, %31
  store i32 %32, ptr %8, align 4
  br label %52

33:                                               ; preds = %28
  %34 = load i32, ptr %7, align 4
  %35 = mul nsw i32 %34, 2
  store i32 %35, ptr %8, align 4
  br label %52

36:                                               ; preds = %16
  %37 = load i32, ptr %4, align 4
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %37, %38
  store i32 %39, ptr %7, align 4
  br label %40

40:                                               ; preds = %36
  %41 = load i32, ptr %6, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %40
  br label %48

44:                                               ; preds = %40
  %45 = load i32, ptr %6, align 4
  %46 = load i32, ptr %7, align 4
  %47 = sub nsw i32 %45, %46
  store i32 %47, ptr %8, align 4
  br label %52

48:                                               ; preds = %43
  %49 = load i32, ptr %6, align 4
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %49, %50
  store i32 %51, ptr %8, align 4
  br label %52

52:                                               ; preds = %48, %44, %33, %29
  %53 = load i32, ptr %8, align 4
  %54 = icmp sgt i32 %53, 20
  br i1 %54, label %55, label %56

55:                                               ; preds = %52
  br label %63

56:                                               ; preds = %52
  %57 = load i32, ptr %8, align 4
  %58 = icmp sgt i32 %57, 10
  br i1 %58, label %59, label %60

59:                                               ; preds = %56
  br label %66

60:                                               ; preds = %56
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 3
  store i32 %62, ptr %3, align 4
  br label %69

63:                                               ; preds = %55
  %64 = load i32, ptr %8, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %3, align 4
  br label %69

66:                                               ; preds = %59
  %67 = load i32, ptr %8, align 4
  %68 = add nsw i32 %67, 2
  store i32 %68, ptr %3, align 4
  br label %69

69:                                               ; preds = %66, %63, %60
  %70 = load i32, ptr %3, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_73_goto_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
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
  br i1 %26, label %27, label %31

27:                                               ; preds = %23
  %28 = load i32, ptr %8, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %27, %20
  br label %57

31:                                               ; preds = %23, %27
  %32 = load i32, ptr %11, align 4
  %33 = sub nsw i32 %32, 10
  store i32 %33, ptr %11, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %11, align 4
  %36 = load i32, ptr @g_z, align 4
  %37 = icmp sgt i32 %35, %36
  br i1 %37, label %38, label %39

38:                                               ; preds = %34
  br label %40

39:                                               ; preds = %34
  br label %122

40:                                               ; preds = %38
  %41 = load i32, ptr %8, align 4
  %42 = load i32, ptr %9, align 4
  %43 = load i32, ptr %10, align 4
  %44 = sdiv i32 %43, 10
  %45 = load i32, ptr %8, align 4
  %46 = sub nsw i32 %45, 1
  %47 = mul nsw i32 %44, %46
  %48 = add nsw i32 %42, %47
  %49 = icmp eq i32 %41, %48
  br i1 %49, label %50, label %51

50:                                               ; preds = %40
  br label %54

51:                                               ; preds = %40
  %52 = load i32, ptr %11, align 4
  %53 = add nsw i32 %52, 200
  store i32 %53, ptr %5, align 4
  br label %132

54:                                               ; preds = %50
  %55 = load i32, ptr %11, align 4
  %56 = add nsw i32 %55, 100
  store i32 %56, ptr %5, align 4
  br label %132

57:                                               ; preds = %30
  %58 = load i32, ptr %11, align 4
  %59 = add nsw i32 %58, 10
  store i32 %59, ptr %11, align 4
  br label %60

60:                                               ; preds = %57
  %61 = load i32, ptr %7, align 4
  %62 = icmp sge i32 %61, 0
  br i1 %62, label %63, label %67

63:                                               ; preds = %60
  %64 = load i32, ptr %7, align 4
  %65 = icmp slt i32 %64, 8
  br i1 %65, label %66, label %67

66:                                               ; preds = %63
  br label %70

67:                                               ; preds = %63, %60
  %68 = load i32, ptr %11, align 4
  %69 = sub nsw i32 %68, 20
  store i32 %69, ptr %11, align 4
  br label %122

70:                                               ; preds = %66
  %71 = load i32, ptr %7, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %72
  %74 = load i32, ptr %73, align 4
  %75 = load i32, ptr %11, align 4
  %76 = icmp sgt i32 %74, %75
  br i1 %76, label %77, label %78

77:                                               ; preds = %70
  br label %100

78:                                               ; preds = %70
  %79 = load i32, ptr %7, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = load i32, ptr %11, align 4
  %84 = sub nsw i32 %83, %82
  store i32 %84, ptr %11, align 4
  br label %85

85:                                               ; preds = %78
  %86 = load i32, ptr %7, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %95, label %91

91:                                               ; preds = %85
  %92 = load ptr, ptr %6, align 8
  %93 = load i32, ptr %92, align 4
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %96

95:                                               ; preds = %91, %85
  br label %97

96:                                               ; preds = %91
  br label %122

97:                                               ; preds = %95
  %98 = load i32, ptr %11, align 4
  %99 = add nsw i32 %98, 50
  store i32 %99, ptr %11, align 4
  br label %122

100:                                              ; preds = %77
  %101 = load i32, ptr %7, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %102
  %104 = load i32, ptr %103, align 4
  %105 = load i32, ptr %11, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, ptr %11, align 4
  br label %107

107:                                              ; preds = %100
  %108 = load ptr, ptr %6, align 8
  %109 = load i32, ptr %108, align 4
  %110 = icmp sgt i32 %109, 0
  br i1 %110, label %111, label %112

111:                                              ; preds = %107
  br label %117

112:                                              ; preds = %107
  %113 = load ptr, ptr %6, align 8
  %114 = load i32, ptr %113, align 4
  %115 = load i32, ptr %11, align 4
  %116 = sub nsw i32 %115, %114
  store i32 %116, ptr %11, align 4
  br label %122

117:                                              ; preds = %111
  %118 = load ptr, ptr %6, align 8
  %119 = load i32, ptr %118, align 4
  %120 = load i32, ptr %11, align 4
  %121 = add nsw i32 %120, %119
  store i32 %121, ptr %11, align 4
  br label %122

122:                                              ; preds = %117, %112, %97, %96, %67, %39
  %123 = load i32, ptr %11, align 4
  %124 = icmp sgt i32 %123, 0
  br i1 %124, label %125, label %128

125:                                              ; preds = %122
  %126 = load i32, ptr %11, align 4
  %127 = mul nsw i32 %126, 2
  store i32 %127, ptr %.reg2mem, align 4
  br label %131

128:                                              ; preds = %122
  %129 = load i32, ptr %11, align 4
  %130 = sub nsw i32 0, %129
  store i32 %130, ptr %.reg2mem, align 4
  br label %131

131:                                              ; preds = %128, %125
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  br label %132

132:                                              ; preds = %131, %54, %51
  %133 = load i32, ptr %5, align 4
  ret i32 %133
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
entry:
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

18:                                               ; preds = %17, %12
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %19 = load i32, ptr %5, align 4
  %20 = call i32 @_00_goto_only(i32 noundef %19)
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %5, align 4
  %24 = call i32 @_01_goto_two_labels(i32 noundef %23)
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %6, align 4
  %27 = load i32, ptr %5, align 4
  %28 = call i32 @_02_goto_surrounding_code(i32 noundef %27)
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %6, align 4
  %31 = load i32, ptr %5, align 4
  %32 = call i32 @_03_goto_skip_block(i32 noundef %31)
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %6, align 4
  %35 = load i32, ptr %5, align 4
  %36 = call i32 @_04_goto_equal(i32 noundef %35, i32 noundef 4)
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %6, align 4
  %39 = load i32, ptr %5, align 4
  %40 = call i32 @_05_goto_not_equal(i32 noundef %39, i32 noundef 4)
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, ptr %6, align 4
  %43 = load i32, ptr %5, align 4
  %44 = call i32 @_06_relational(i32 noundef %43, i32 noundef 4)
  %45 = load i32, ptr %6, align 4
  %46 = add nsw i32 %45, %44
  store i32 %46, ptr %6, align 4
  %47 = load i32, ptr %5, align 4
  %48 = icmp sgt i32 %47, 0
  %49 = load i32, ptr %5, align 4
  %50 = call i32 @_07_boolean_argument(i1 noundef zeroext %48, i32 noundef %49)
  %51 = load i32, ptr %6, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %6, align 4
  %53 = load i32, ptr %5, align 4
  %54 = call i32 @_08_goto_chain(i32 noundef %53)
  %55 = load i32, ptr %6, align 4
  %56 = add nsw i32 %55, %54
  store i32 %56, ptr %6, align 4
  %57 = load i32, ptr %5, align 4
  %58 = call i32 @_09_multiple_levels(i32 noundef %57)
  %59 = load i32, ptr %6, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %6, align 4
  %61 = load i32, ptr %5, align 4
  %62 = call i32 @_10_goto_expressions(i32 noundef %61, i32 noundef 4)
  %63 = load i32, ptr %6, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %6, align 4
  %65 = load i32, ptr %5, align 4
  %66 = call i32 @_11_and(i32 noundef %65, i32 noundef 3)
  %67 = load i32, ptr %6, align 4
  %68 = add nsw i32 %67, %66
  store i32 %68, ptr %6, align 4
  %69 = load i32, ptr %5, align 4
  %70 = call i32 @_12_or(i32 noundef %69, i32 noundef -3)
  %71 = load i32, ptr %6, align 4
  %72 = add nsw i32 %71, %70
  store i32 %72, ptr %6, align 4
  %73 = load i32, ptr %5, align 4
  %74 = call i32 @_13_and_or(i32 noundef %73, i32 noundef 2, i32 noundef -1)
  %75 = load i32, ptr %6, align 4
  %76 = add nsw i32 %75, %74
  store i32 %76, ptr %6, align 4
  %77 = load i32, ptr %5, align 4
  %78 = call i32 @_14_or_and(i32 noundef %77, i32 noundef 0, i32 noundef 20)
  %79 = load i32, ptr %6, align 4
  %80 = add nsw i32 %79, %78
  store i32 %80, ptr %6, align 4
  %81 = load i32, ptr %5, align 4
  %82 = call i32 @_15_complex_boolean(i32 noundef %81, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %83 = load i32, ptr %6, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, ptr %6, align 4
  %85 = load i32, ptr %5, align 4
  %86 = call i32 @_16_nested_arithmetic_condition(i32 noundef %85, i32 noundef 1, i32 noundef 20)
  %87 = load i32, ptr %6, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, ptr %6, align 4
  %89 = load i32, ptr %5, align 4
  %90 = call i32 @_17_deep_parentheses(i32 noundef %89, i32 noundef 2, i32 noundef 3)
  %91 = load i32, ptr %6, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %6, align 4
  %93 = load i32, ptr %5, align 4
  %94 = call i32 @_18_arithmetic_boolean(i32 noundef %93, i32 noundef 2, i32 noundef 5)
  %95 = load i32, ptr %6, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, ptr %6, align 4
  %97 = load i32, ptr %5, align 4
  %98 = call i32 @_19_nested_boolean_parentheses(i32 noundef %97, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %99 = load i32, ptr %6, align 4
  %100 = add nsw i32 %99, %98
  store i32 %100, ptr %6, align 4
  %101 = load i32, ptr %5, align 4
  %102 = call i32 @_20_nested_goto(i32 noundef %101, i32 noundef 3)
  %103 = load i32, ptr %6, align 4
  %104 = add nsw i32 %103, %102
  store i32 %104, ptr %6, align 4
  %105 = load i32, ptr %5, align 4
  %106 = call i32 @_21_nested_in_else(i32 noundef %105, i32 noundef 3)
  %107 = load i32, ptr %6, align 4
  %108 = add nsw i32 %107, %106
  store i32 %108, ptr %6, align 4
  %109 = load i32, ptr %5, align 4
  %110 = call i32 @_22_nested_goto_else(i32 noundef %109, i32 noundef 3, i32 noundef 5)
  %111 = load i32, ptr %6, align 4
  %112 = add nsw i32 %111, %110
  store i32 %112, ptr %6, align 4
  %113 = load i32, ptr %5, align 4
  %114 = call i32 @_23_three_level_nesting(i32 noundef %113, i32 noundef 3, i32 noundef 5)
  %115 = load i32, ptr %6, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %6, align 4
  %117 = load i32, ptr %5, align 4
  %118 = call i32 @_24_deep_nested_values(i32 noundef %117, i32 noundef 3, i32 noundef 10)
  %119 = load i32, ptr %6, align 4
  %120 = add nsw i32 %119, %118
  store i32 %120, ptr %6, align 4
  %121 = load i32, ptr %5, align 4
  %122 = call i32 @_25_nested_and(i32 noundef %121, i32 noundef 3, i32 noundef 5)
  %123 = load i32, ptr %6, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, ptr %6, align 4
  %125 = load i32, ptr %5, align 4
  %126 = call i32 @_26_nested_or(i32 noundef %125, i32 noundef 0, i32 noundef 20)
  %127 = load i32, ptr %6, align 4
  %128 = add nsw i32 %127, %126
  store i32 %128, ptr %6, align 4
  %129 = load i32, ptr %5, align 4
  %130 = call i32 @_27_nested_complex_boolean(i32 noundef %129, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %131 = load i32, ptr %6, align 4
  %132 = add nsw i32 %131, %130
  store i32 %132, ptr %6, align 4
  %133 = load i32, ptr %5, align 4
  %134 = call i32 @_28_independent_gotos(i32 noundef %133)
  %135 = load i32, ptr %6, align 4
  %136 = add nsw i32 %135, %134
  store i32 %136, ptr %6, align 4
  %137 = load i32, ptr %5, align 4
  %138 = call i32 @_29_independent_goto_paths(i32 noundef %137, i32 noundef 3)
  %139 = load i32, ptr %6, align 4
  %140 = add nsw i32 %139, %138
  store i32 %140, ptr %6, align 4
  %141 = call i32 @_30_array_condition(i32 noundef 1)
  %142 = load i32, ptr %6, align 4
  %143 = add nsw i32 %142, %141
  store i32 %143, ptr %6, align 4
  %144 = call i32 @_31_array_branches(i32 noundef 2)
  %145 = load i32, ptr %6, align 4
  %146 = add nsw i32 %145, %144
  store i32 %146, ptr %6, align 4
  %147 = call i32 @_32_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %148 = load i32, ptr %6, align 4
  %149 = add nsw i32 %148, %147
  store i32 %149, ptr %6, align 4
  %150 = call i32 @_33_matrix_condition(i32 noundef 1, i32 noundef 1)
  %151 = load i32, ptr %6, align 4
  %152 = add nsw i32 %151, %150
  store i32 %152, ptr %6, align 4
  %153 = call i32 @_34_nested_array(i32 noundef 1, i32 noundef 2)
  %154 = load i32, ptr %6, align 4
  %155 = add nsw i32 %154, %153
  store i32 %155, ptr %6, align 4
  %156 = load i32, ptr %5, align 4
  store i32 %156, ptr %7, align 4
  %157 = call i32 @_35_pointer_condition(ptr noundef %7)
  %158 = load i32, ptr %6, align 4
  %159 = add nsw i32 %158, %157
  store i32 %159, ptr %6, align 4
  %160 = call i32 @_36_pointer_branches(ptr noundef %7)
  %161 = load i32, ptr %6, align 4
  %162 = add nsw i32 %161, %160
  store i32 %162, ptr %6, align 4
  %163 = call i32 @_37_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %164 = load i32, ptr %6, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %6, align 4
  %166 = call i32 @_38_nested_pointer(ptr noundef %7, i32 noundef 3)
  %167 = load i32, ptr %6, align 4
  %168 = add nsw i32 %167, %166
  store i32 %168, ptr %6, align 4
  %169 = load i32, ptr %5, align 4
  store i32 %169, ptr %7, align 4
  %170 = load i32, ptr %5, align 4
  %171 = call i32 @_39_pointer_write(ptr noundef %7, i32 noundef %170)
  %172 = load i32, ptr %6, align 4
  %173 = add nsw i32 %172, %171
  store i32 %173, ptr %6, align 4
  %174 = load i32, ptr %5, align 4
  store i32 %174, ptr %7, align 4
  %175 = load i32, ptr %5, align 4
  %176 = call i32 @_40_pointer_write_nested(ptr noundef %7, i32 noundef %175, i32 noundef 3)
  %177 = load i32, ptr %6, align 4
  %178 = add nsw i32 %177, %176
  store i32 %178, ptr %6, align 4
  %179 = load i32, ptr %5, align 4
  store i32 %179, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %180 = call i32 @_41_global_only()
  %181 = load i32, ptr %6, align 4
  %182 = add nsw i32 %181, %180
  store i32 %182, ptr %6, align 4
  %183 = call i32 @_42_global_and()
  %184 = load i32, ptr %6, align 4
  %185 = add nsw i32 %184, %183
  store i32 %185, ptr %6, align 4
  %186 = call i32 @_43_global_or()
  %187 = load i32, ptr %6, align 4
  %188 = add nsw i32 %187, %186
  store i32 %188, ptr %6, align 4
  %189 = call i32 @_44_global_nested()
  %190 = load i32, ptr %6, align 4
  %191 = add nsw i32 %190, %189
  store i32 %191, ptr %6, align 4
  %192 = call i32 @_45_global_array_only()
  %193 = load i32, ptr %6, align 4
  %194 = add nsw i32 %193, %192
  store i32 %194, ptr %6, align 4
  %195 = call i32 @_46_global_matrix_only()
  %196 = load i32, ptr %6, align 4
  %197 = add nsw i32 %196, %195
  store i32 %197, ptr %6, align 4
  %198 = load i32, ptr %5, align 4
  %199 = call i32 @_47_multiple_returns(i32 noundef %198)
  %200 = load i32, ptr %6, align 4
  %201 = add nsw i32 %200, %199
  store i32 %201, ptr %6, align 4
  %202 = load i32, ptr %5, align 4
  %203 = call i32 @_48_nested_multiple_returns(i32 noundef %202, i32 noundef 3)
  %204 = load i32, ptr %6, align 4
  %205 = add nsw i32 %204, %203
  store i32 %205, ptr %6, align 4
  %206 = load i32, ptr %5, align 4
  %207 = call i32 @_49_complex_multiple_returns(i32 noundef %206, i32 noundef 3, i32 noundef 5)
  %208 = load i32, ptr %6, align 4
  %209 = add nsw i32 %208, %207
  store i32 %209, ptr %6, align 4
  %210 = load i32, ptr %5, align 4
  %211 = call i32 @_50_prefix_code(i32 noundef %210, i32 noundef 2, i32 noundef 3)
  %212 = load i32, ptr %6, align 4
  %213 = add nsw i32 %212, %211
  store i32 %213, ptr %6, align 4
  %214 = load i32, ptr %5, align 4
  %215 = call i32 @_51_suffix_code(i32 noundef %214, i32 noundef 3)
  %216 = load i32, ptr %6, align 4
  %217 = add nsw i32 %216, %215
  store i32 %217, ptr %6, align 4
  %218 = load i32, ptr %5, align 4
  %219 = call i32 @_52_prefix_nested_suffix(i32 noundef %218, i32 noundef 3, i32 noundef 5)
  %220 = load i32, ptr %6, align 4
  %221 = add nsw i32 %220, %219
  store i32 %221, ptr %6, align 4
  %222 = load i32, ptr %5, align 4
  %223 = call i32 @_53_diamond(i32 noundef %222, i32 noundef 3)
  %224 = load i32, ptr %6, align 4
  %225 = add nsw i32 %224, %223
  store i32 %225, ptr %6, align 4
  %226 = load i32, ptr %5, align 4
  %227 = call i32 @_54_multiple_merge_values(i32 noundef %226, i32 noundef 3)
  %228 = load i32, ptr %6, align 4
  %229 = add nsw i32 %228, %227
  store i32 %229, ptr %6, align 4
  %230 = load i32, ptr %5, align 4
  %231 = call i32 @_55_nested_diamonds(i32 noundef %230, i32 noundef 3, i32 noundef 5)
  %232 = load i32, ptr %6, align 4
  %233 = add nsw i32 %232, %231
  store i32 %233, ptr %6, align 4
  %234 = load i32, ptr %5, align 4
  %235 = call i32 @_56_ternary_before_goto(i32 noundef %234, i32 noundef 3)
  %236 = load i32, ptr %6, align 4
  %237 = add nsw i32 %236, %235
  store i32 %237, ptr %6, align 4
  %238 = load i32, ptr %5, align 4
  %239 = call i32 @_57_ternary_inside_goto(i32 noundef %238, i32 noundef 3)
  %240 = load i32, ptr %6, align 4
  %241 = add nsw i32 %240, %239
  store i32 %241, ptr %6, align 4
  %242 = load i32, ptr %5, align 4
  %243 = call i32 @_58_nested_ternary_goto(i32 noundef %242, i32 noundef 3, i32 noundef 5)
  %244 = load i32, ptr %6, align 4
  %245 = add nsw i32 %244, %243
  store i32 %245, ptr %6, align 4
  %246 = load i32, ptr %5, align 4
  %247 = call i32 @_59_dynamic_alloca(i32 noundef 4, i32 noundef %246)
  %248 = load i32, ptr %6, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, ptr %6, align 4
  %250 = load i32, ptr %5, align 4
  %251 = call i32 @_60_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %250)
  %252 = load i32, ptr %6, align 4
  %253 = add nsw i32 %252, %251
  store i32 %253, ptr %6, align 4
  %254 = load i32, ptr %5, align 4
  %255 = call i32 @_61_dynamic_alloca_complex(i32 noundef 6, i32 noundef %254, i32 noundef 3)
  %256 = load i32, ptr %6, align 4
  %257 = add nsw i32 %256, %255
  store i32 %257, ptr %6, align 4
  %258 = load i32, ptr %5, align 4
  %259 = call i32 @_62_malloc_goto(i32 noundef 4, i32 noundef %258)
  %260 = load i32, ptr %6, align 4
  %261 = add nsw i32 %260, %259
  store i32 %261, ptr %6, align 4
  %262 = load i32, ptr %5, align 4
  %263 = call i32 @_63_malloc_nested_goto(i32 noundef 4, i32 noundef %262, i32 noundef 3)
  %264 = load i32, ptr %6, align 4
  %265 = add nsw i32 %264, %263
  store i32 %265, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %266 = load i32, ptr %5, align 4
  call void @_64_void_goto(i32 noundef %266)
  %267 = load i32, ptr %5, align 4
  call void @_65_void_goto_else(i32 noundef %267)
  %268 = load i32, ptr %5, align 4
  call void @_66_void_nested(i32 noundef %268, i32 noundef 3)
  %269 = load i32, ptr %5, align 4
  call void @_67_void_complex(i32 noundef %269, i32 noundef 3, i32 noundef 0)
  call void @_68_void_global_only()
  %270 = load i32, ptr %5, align 4
  store i32 %270, ptr %7, align 4
  %271 = load i32, ptr %5, align 4
  call void @_69_void_pointer(ptr noundef %7, i32 noundef %271)
  %272 = load i32, ptr %5, align 4
  call void @_70_void_array(i32 noundef 1, i32 noundef %272)
  %273 = load i32, ptr @g_void_result, align 4
  %274 = load i32, ptr %6, align 4
  %275 = add nsw i32 %274, %273
  store i32 %275, ptr %6, align 4
  %276 = load i32, ptr %5, align 4
  store i32 %276, ptr %7, align 4
  %277 = load i32, ptr %5, align 4
  %278 = call i32 @_71_complex_control_flow(ptr noundef %7, i32 noundef 1, i32 noundef %277, i32 noundef 3)
  %279 = load i32, ptr %6, align 4
  %280 = add nsw i32 %279, %278
  store i32 %280, ptr %6, align 4
  %281 = load i32, ptr %5, align 4
  %282 = call i32 @_72_complex_merge(i32 noundef %281, i32 noundef 3, i32 noundef 5)
  %283 = load i32, ptr %6, align 4
  %284 = add nsw i32 %283, %282
  store i32 %284, ptr %6, align 4
  %285 = load i32, ptr %5, align 4
  %286 = call i32 @_73_goto_stress(ptr noundef %7, i32 noundef 1, i32 noundef %285, i32 noundef 3, i32 noundef 5)
  %287 = load i32, ptr %6, align 4
  %288 = add nsw i32 %287, %286
  store i32 %288, ptr %6, align 4
  %289 = load i32, ptr %6, align 4
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
