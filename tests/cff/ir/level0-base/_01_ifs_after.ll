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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  store i32 %12, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %1, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %11
    i32 4, label %13
  ]

loop:                                             ; preds = %11, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_if_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 10
  store i32 %10, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = sub nsw i32 %12, 10
  store i32 %13, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %1, align 4
  ret i32 %15

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %11
    i32 4, label %14
  ]

loop:                                             ; preds = %11, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_if_with_surrounding_code(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  %5 = add nsw i32 %4, 3
  store i32 %5, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 5
  store i32 %15, ptr %2, align 4
  %16 = load i32, ptr %2, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %10
    i32 3, label %13
  ]

loop:                                             ; preds = %10, %6, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_if_compound(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  store i32 %4, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr %1, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %2, align 4
  %12 = load i32, ptr %2, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  ret i32 %15

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %9
    i32 3, label %14
  ]

loop:                                             ; preds = %9, %5, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_if_else_compound(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load i32, ptr %1, align 4
  %6 = icmp sgt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %1, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %1, align 4
  %15 = sub nsw i32 %14, 2
  store i32 %15, ptr %2, align 4
  %16 = load i32, ptr %2, align 4
  %17 = sub nsw i32 %16, 1
  store i32 %17, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %13
    i32 4, label %18
  ]

loop:                                             ; preds = %13, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_if_equal(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp eq i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %12
    i32 4, label %13
  ]

loop:                                             ; preds = %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_if_not_equal(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp ne i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = sub nsw i32 %16, %17
  store i32 %18, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %15
    i32 4, label %19
  ]

loop:                                             ; preds = %15, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_relational(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 1, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %13, %14
  %16 = select i1 %15, i32 4, i32 5
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 2, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp eq i32 %19, %20
  %22 = select i1 %21, i32 6, i32 7
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  store i32 3, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 4, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %2, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %12
    i32 4, label %17
    i32 5, label %18
    i32 6, label %23
    i32 7, label %24
    i32 8, label %25
  ]

loop:                                             ; preds = %24, %23, %18, %17, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  %6 = zext i1 %0 to i8
  store i8 %6, ptr %3, align 1
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i8, ptr %3, align 1
  %9 = trunc i8 %8 to i1
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = mul nsw i32 %12, 3
  store i32 %13, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = sub nsw i32 %15, 3
  store i32 %16, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %7
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
  ]

loop:                                             ; preds = %14, %11, %7, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_if_elseif_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 10
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 100
  store i32 %10, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = icmp sgt i32 %12, 5
  %14 = select i1 %13, i32 4, i32 5
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, 50
  store i32 %17, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, 10
  store i32 %20, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %1, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %11
    i32 4, label %15
    i32 5, label %18
    i32 6, label %21
  ]

loop:                                             ; preds = %18, %15, %11, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_multiple_elseif(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, -10
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 0
  %12 = select i1 %11, i32 4, i32 5
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 -2, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = icmp eq i32 %15, 0
  %17 = select i1 %16, i32 6, i32 7
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 0, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = icmp slt i32 %20, 10
  %22 = select i1 %21, i32 8, i32 9
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  store i32 2, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 1, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %1, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %9
    i32 4, label %13
    i32 5, label %14
    i32 6, label %18
    i32 7, label %19
    i32 8, label %23
    i32 9, label %24
    i32 10, label %25
  ]

loop:                                             ; preds = %24, %23, %19, %18, %14, %13, %9, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_elseif_expressions(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = icmp eq i32 %15, %16
  %18 = select i1 %17, i32 4, i32 5
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 10
  %26 = load i32, ptr %4, align 4
  %27 = icmp sgt i32 %25, %26
  %28 = select i1 %27, i32 6, i32 7
  store i32 %28, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %3, align 4
  %31 = load i32, ptr %4, align 4
  %32 = sub nsw i32 %30, %31
  store i32 %32, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %4, align 4
  %35 = load i32, ptr %3, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %2, align 4
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %14
    i32 4, label %19
    i32 5, label %23
    i32 6, label %29
    i32 7, label %33
    i32 8, label %37
  ]

loop:                                             ; preds = %33, %29, %23, %19, %14, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_and(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %18
    i32 5, label %22
  ]

loop:                                             ; preds = %18, %14, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_or(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 3, i32 2
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %15, %16
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %20, %21
  %23 = sub nsw i32 %22, 10
  store i32 %23, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %19
    i32 5, label %24
  ]

loop:                                             ; preds = %19, %14, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_and_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 4, i32 3
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 0
  %19 = select i1 %18, i32 4, i32 5
  store i32 %19, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 100, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  store i32 200, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
    i32 5, label %21
    i32 6, label %22
  ]

loop:                                             ; preds = %21, %20, %16, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_or_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 0
  %11 = select i1 %10, i32 3, i32 2
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, i32 3, i32 5
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 10
  %19 = select i1 %18, i32 4, i32 5
  store i32 %19, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 300, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  store i32 400, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
    i32 5, label %21
    i32 6, label %22
  ]

loop:                                             ; preds = %21, %20, %16, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = icmp slt i32 %15, 10
  %17 = select i1 %16, i32 5, i32 3
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %7, align 4
  %20 = icmp eq i32 %19, 5
  %21 = select i1 %20, i32 4, i32 6
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = icmp ne i32 %23, 0
  %25 = select i1 %24, i32 5, i32 6
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %31, %32
  store i32 %33, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %5, align 4
  %36 = load i32, ptr %6, align 4
  %37 = sub nsw i32 %35, %36
  %38 = load i32, ptr %7, align 4
  %39 = sub nsw i32 %37, %38
  %40 = load i32, ptr %8, align 4
  %41 = sub nsw i32 %39, %40
  store i32 %41, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  %43 = load i32, ptr %4, align 4
  ret i32 %43

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %18
    i32 4, label %22
    i32 5, label %26
    i32 6, label %34
    i32 7, label %42
  ]

loop:                                             ; preds = %34, %26, %22, %18, %14, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_nested_arithmetic_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = sdiv i32 %11, 10
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %13, 1
  %15 = mul nsw i32 %12, %14
  %16 = add nsw i32 %10, %15
  %17 = icmp eq i32 %9, %16
  %18 = select i1 %17, i32 2, i32 3
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 111, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 222, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %19
    i32 3, label %20
    i32 4, label %21
  ]

loop:                                             ; preds = %20, %19, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_deep_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
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
  %22 = select i1 %21, i32 2, i32 3
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %4, align 4
  %31 = load i32, ptr %5, align 4
  %32 = sub nsw i32 %30, %31
  %33 = load i32, ptr %6, align 4
  %34 = sub nsw i32 %32, %33
  store i32 %34, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %3, align 4
  ret i32 %36

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %23
    i32 3, label %29
    i32 4, label %35
  ]

loop:                                             ; preds = %29, %23, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_arithmetic_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %11, %12
  %14 = select i1 %13, i32 2, i32 4
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sub nsw i32 %16, %17
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %19, 10
  %21 = icmp slt i32 %18, %20
  %22 = select i1 %21, i32 3, i32 4
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  store i32 123, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 456, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %3, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %15
    i32 3, label %23
    i32 4, label %24
    i32 5, label %25
  ]

loop:                                             ; preds = %24, %23, %15, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_nested_boolean_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %11, %12
  %14 = select i1 %13, i32 2, i32 4
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %8, align 4
  %18 = icmp slt i32 %16, %17
  %19 = select i1 %18, i32 6, i32 3
  store i32 %19, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = load i32, ptr %7, align 4
  %23 = icmp eq i32 %21, %22
  %24 = select i1 %23, i32 6, i32 4
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %6, align 4
  %27 = load i32, ptr %8, align 4
  %28 = icmp eq i32 %26, %27
  %29 = select i1 %28, i32 5, i32 7
  store i32 %29, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %7, align 4
  %33 = icmp slt i32 %31, %32
  %34 = select i1 %33, i32 6, i32 7
  store i32 %34, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  store i32 777, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  store i32 888, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %4, align 4
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %15
    i32 3, label %20
    i32 4, label %25
    i32 5, label %30
    i32 6, label %35
    i32 7, label %36
    i32 8, label %37
  ]

loop:                                             ; preds = %36, %35, %30, %25, %20, %15, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_nested_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  store i32 %6, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 6
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 3, i32 4
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %2, align 4
  %23 = load i32, ptr %3, align 4
  %24 = sub nsw i32 %22, %23
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  ret i32 %29

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %7
    i32 2, label %11
    i32 3, label %15
    i32 4, label %21
    i32 5, label %27
    i32 6, label %28
  ]

loop:                                             ; preds = %27, %21, %15, %11, %7, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_nested_in_else(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 4, i32 5
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = sub nsw i32 %22, 2
  store i32 %23, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %18
    i32 5, label %21
    i32 6, label %24
  ]

loop:                                             ; preds = %21, %18, %14, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_nested_if_else(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 5
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = icmp sgt i32 %25, 0
  %27 = select i1 %26, i32 6, i32 7
  store i32 %27, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %6, align 4
  %30 = mul nsw i32 %29, 2
  store i32 %30, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  %33 = sub nsw i32 %32, 2
  store i32 %33, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %3, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
    i32 5, label %24
    i32 6, label %28
    i32 7, label %31
    i32 8, label %34
  ]

loop:                                             ; preds = %31, %28, %24, %20, %16, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_three_level_nesting(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 11
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %6, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = select i1 %17, i32 4, i32 9
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 10
  store i32 %21, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 6, i32 7
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 100
  store i32 %28, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %30, 100
  store i32 %31, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 20
  store i32 %35, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  store i32 -1, ptr %6, align 4
  store i32 12, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = load i32, ptr %6, align 4
  ret i32 %39

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %15
    i32 4, label %19
    i32 5, label %22
    i32 6, label %26
    i32 7, label %29
    i32 8, label %32
    i32 9, label %33
    i32 10, label %36
    i32 11, label %37
    i32 12, label %38
  ]

loop:                                             ; preds = %37, %36, %33, %32, %29, %26, %22, %19, %15, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_deep_nested_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %7, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 2, i32 12
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %7, align 4
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp sgt i32 %20, %21
  %23 = select i1 %22, i32 4, i32 8
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %7, align 4
  %26 = mul nsw i32 %25, 2
  store i32 %26, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %7, align 4
  %29 = srem i32 %28, 3
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 6, i32 7
  store i32 %31, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %33, 3
  store i32 %34, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %7, align 4
  %37 = sub nsw i32 %36, 3
  store i32 %37, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = load i32, ptr %7, align 4
  %40 = sub nsw i32 %39, 5
  store i32 %40, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %6, align 4
  %44 = icmp slt i32 %42, %43
  %45 = select i1 %44, i32 10, i32 11
  store i32 %45, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %7, align 4
  %48 = mul nsw i32 %47, 2
  store i32 %48, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  %50 = load i32, ptr %7, align 4
  %51 = sdiv i32 %50, 2
  store i32 %51, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = load i32, ptr %7, align 4
  %54 = load i32, ptr %6, align 4
  %55 = sub nsw i32 %53, %54
  store i32 %55, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

56:                                               ; preds = %switch
  %57 = load i32, ptr %3, align 4
  ret i32 %57

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %12
    i32 2, label %16
    i32 3, label %19
    i32 4, label %24
    i32 5, label %27
    i32 6, label %32
    i32 7, label %35
    i32 8, label %38
    i32 9, label %41
    i32 10, label %46
    i32 11, label %49
    i32 12, label %52
    i32 13, label %56
  ]

loop:                                             ; preds = %52, %49, %46, %41, %38, %35, %32, %27, %24, %19, %16, %12, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_nested_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 9
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 3, i32 9
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %6, align 4
  store i32 4, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = icmp sgt i32 %21, 0
  %23 = select i1 %22, i32 5, i32 7
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = icmp slt i32 %25, 10
  %27 = select i1 %26, i32 6, i32 7
  store i32 %27, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %6, align 4
  %35 = sub nsw i32 %34, %33
  store i32 %35, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %5, align 4
  store i32 %38, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  ret i32 %40

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
    i32 5, label %24
    i32 6, label %28
    i32 7, label %32
    i32 8, label %36
    i32 9, label %37
    i32 10, label %39
  ]

loop:                                             ; preds = %37, %36, %32, %28, %24, %20, %16, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_nested_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 0
  %11 = select i1 %10, i32 3, i32 2
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, i32 3, i32 7
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 10
  %19 = select i1 %18, i32 5, i32 4
  store i32 %19, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %21, -10
  %23 = select i1 %22, i32 5, i32 6
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 1000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 2000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  store i32 3000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
    i32 5, label %24
    i32 6, label %25
    i32 7, label %26
    i32 8, label %27
  ]

loop:                                             ; preds = %26, %25, %24, %20, %16, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_nested_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 4, i32 3
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %7, align 4
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 4, i32 9
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = icmp sgt i32 %23, 5
  %25 = select i1 %24, i32 6, i32 5
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %6, align 4
  %29 = icmp eq i32 %27, %28
  %30 = select i1 %29, i32 6, i32 8
  store i32 %30, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %7, align 4
  %33 = icmp slt i32 %32, 10
  %34 = select i1 %33, i32 7, i32 8
  store i32 %34, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %5, align 4
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %36, %37
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %38, %39
  %41 = load i32, ptr %8, align 4
  %42 = add nsw i32 %40, %41
  store i32 %42, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load i32, ptr %5, align 4
  %45 = load i32, ptr %6, align 4
  %46 = mul nsw i32 %44, %45
  store i32 %46, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %loop

47:                                               ; preds = %switch
  %48 = load i32, ptr %7, align 4
  %49 = load i32, ptr %8, align 4
  %50 = sub nsw i32 %48, %49
  store i32 %50, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %loop

51:                                               ; preds = %switch
  %52 = load i32, ptr %4, align 4
  ret i32 %52

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %18
    i32 4, label %22
    i32 5, label %26
    i32 6, label %31
    i32 7, label %35
    i32 8, label %43
    i32 9, label %47
    i32 10, label %51
  ]

loop:                                             ; preds = %47, %43, %35, %31, %26, %22, %18, %14, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_independent_ifs(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  %4 = load i32, ptr %1, align 4
  store i32 %4, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr %1, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  %14 = icmp sgt i32 %13, 5
  %15 = select i1 %14, i32 4, i32 5
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 20
  store i32 %18, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %1, align 4
  %21 = icmp sgt i32 %20, 10
  %22 = select i1 %21, i32 6, i32 7
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 30
  store i32 %25, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %2, align 4
  ret i32 %27

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %9
    i32 3, label %12
    i32 4, label %16
    i32 5, label %19
    i32 6, label %23
    i32 7, label %26
  ]

loop:                                             ; preds = %23, %19, %16, %12, %9, %5, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_independent_if_else(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %14, 10
  store i32 %15, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = icmp sgt i32 %17, 0
  %19 = select i1 %18, i32 5, i32 6
  store i32 %19, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 20
  store i32 %22, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = sub nsw i32 %24, 20
  store i32 %25, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  ret i32 %27

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %13
    i32 4, label %16
    i32 5, label %20
    i32 6, label %23
    i32 7, label %26
  ]

loop:                                             ; preds = %23, %20, %16, %13, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_array_condition(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = sub nsw i32 %17, 2
  store i32 %18, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %1, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %9
    i32 2, label %13
    i32 3, label %16
    i32 4, label %19
  ]

loop:                                             ; preds = %16, %13, %9, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_array_branches(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %1, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %11
    i32 3, label %18
    i32 4, label %25
  ]

loop:                                             ; preds = %18, %11, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_array_complex_condition(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = load i32, ptr %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = icmp sgt i32 %10, %14
  %16 = select i1 %15, i32 2, i32 4
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp ne i32 %21, 0
  %23 = select i1 %22, i32 3, i32 4
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = mul nsw i32 %28, 10
  store i32 %29, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = mul nsw i32 %34, 10
  store i32 %35, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = load i32, ptr %2, align 4
  ret i32 %37

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %17
    i32 3, label %24
    i32 4, label %30
    i32 5, label %36
  ]

loop:                                             ; preds = %30, %24, %17, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_matrix_condition(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
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
  store i32 1, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 5
  %17 = select i1 %16, i32 2, i32 3
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %22, 2
  store i32 %23, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %14
    i32 2, label %18
    i32 3, label %21
    i32 4, label %24
  ]

loop:                                             ; preds = %21, %18, %14, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_nested_array(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = icmp sge i32 %7, 0
  %9 = select i1 %8, i32 2, i32 11
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %11, 8
  %13 = select i1 %12, i32 3, i32 11
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = icmp sge i32 %22, 0
  %24 = select i1 %23, i32 5, i32 10
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %3, align 4
  %27 = icmp slt i32 %26, 8
  %28 = select i1 %27, i32 6, i32 10
  store i32 %28, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %2, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %3, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = icmp sgt i32 %33, %37
  %39 = select i1 %38, i32 7, i32 8
  store i32 %39, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %41 = load i32, ptr %2, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = load i32, ptr %3, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = sub nsw i32 %44, %48
  %50 = load i32, ptr %4, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = load i32, ptr %3, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = load i32, ptr %2, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = sub nsw i32 %56, %60
  %62 = load i32, ptr %4, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %loop

64:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

65:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

66:                                               ; preds = %switch
  %67 = load i32, ptr %4, align 4
  ret i32 %67

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %21
    i32 5, label %25
    i32 6, label %29
    i32 7, label %40
    i32 8, label %52
    i32 9, label %64
    i32 10, label %65
    i32 11, label %66
  ]

loop:                                             ; preds = %65, %64, %52, %40, %29, %25, %21, %14, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_pointer_condition(ptr noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load ptr, ptr %2, align 8
  %6 = load i32, ptr %5, align 4
  %7 = icmp sgt i32 %6, 10
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %10, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, 2
  store i32 %16, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %1, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
  ]

loop:                                             ; preds = %13, %9, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_pointer_branches(ptr noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load ptr, ptr %2, align 8
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 100
  store i32 %12, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = sub nsw i32 %15, 100
  store i32 %16, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %1, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
  ]

loop:                                             ; preds = %13, %9, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_pointer_array(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
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
  %17 = select i1 %16, i32 2, i32 3
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %19, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %4, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = add nsw i32 %23, %27
  store i32 %28, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load ptr, ptr %3, align 8
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, ptr %30, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = sub nsw i32 %34, %38
  store i32 %39, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %41 = load i32, ptr %2, align 4
  ret i32 %41

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %18
    i32 3, label %29
    i32 4, label %40
  ]

loop:                                             ; preds = %29, %18, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_nested_pointer(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 6
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %15, align 4
  %17 = icmp sgt i32 %14, %16
  %18 = select i1 %17, i32 3, i32 4
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %4, align 4
  %26 = sub nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load ptr, ptr %2, align 8
  %30 = load i32, ptr %29, align 4
  %31 = sub nsw i32 0, %30
  store i32 %31, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  ret i32 %33

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %8
    i32 2, label %13
    i32 3, label %19
    i32 4, label %23
    i32 5, label %27
    i32 6, label %28
    i32 7, label %32
  ]

loop:                                             ; preds = %28, %27, %23, %19, %13, %8, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_pointer_write(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load ptr, ptr %2, align 8
  store i32 %11, ptr %12, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 2
  %16 = load ptr, ptr %2, align 8
  store i32 %15, ptr %16, align 4
  store i32 4, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %18, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
  ]

loop:                                             ; preds = %13, %9, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_pointer_write_nested(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 6
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 3, i32 4
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = load ptr, ptr %3, align 8
  store i32 %18, ptr %19, align 4
  store i32 5, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %21, %22
  %24 = load ptr, ptr %3, align 8
  store i32 %23, ptr %24, align 4
  store i32 5, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = sub nsw i32 0, %27
  %29 = load ptr, ptr %3, align 8
  store i32 %28, ptr %29, align 4
  store i32 7, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load ptr, ptr %3, align 8
  %32 = load i32, ptr %31, align 4
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %15
    i32 4, label %20
    i32 5, label %25
    i32 6, label %26
    i32 7, label %30
  ]

loop:                                             ; preds = %26, %25, %20, %15, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_global_only() #0 {
entry:
  %0 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  %4 = select i1 %3, i32 1, i32 2
  store i32 %4, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_x, align 4
  %7 = load i32, ptr @g_y, align 4
  %8 = add nsw i32 %6, %7
  store i32 %8, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = sub nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %0, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
  ]

loop:                                             ; preds = %9, %5, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_global_and() #0 {
entry:
  %0 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  %4 = select i1 %3, i32 1, i32 3
  store i32 %4, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_y, align 4
  %7 = icmp slt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_z, align 4
  store i32 %14, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %0, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %15
  ]

loop:                                             ; preds = %13, %9, %5, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_global_or() #0 {
entry:
  %0 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp eq i32 %2, 0
  %4 = select i1 %3, i32 2, i32 1
  store i32 %4, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_z, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_z, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_y, align 4
  store i32 %14, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %0, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %15
  ]

loop:                                             ; preds = %13, %9, %5, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_global_nested() #0 {
entry:
  %0 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp sgt i32 %2, 0
  %4 = select i1 %3, i32 1, i32 4
  store i32 %4, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_y, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_x, align 4
  %15 = load i32, ptr @g_y, align 4
  %16 = sub nsw i32 %14, %15
  store i32 %16, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr @g_z, align 4
  store i32 %18, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %0, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
    i32 5, label %19
  ]

loop:                                             ; preds = %17, %13, %9, %5, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_array_only() #0 {
entry:
  %0 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_arr, align 16
  %3 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %4 = icmp slt i32 %2, %3
  %5 = select i1 %4, i32 1, i32 2
  store i32 %5, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 %7, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_arr, align 16
  store i32 %9, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %0, align 4
  ret i32 %11

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %6
    i32 2, label %8
    i32 3, label %10
  ]

loop:                                             ; preds = %8, %6, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_global_matrix_only() #0 {
entry:
  %0 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_mat, align 16
  %3 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  %4 = icmp slt i32 %2, %3
  %5 = select i1 %4, i32 1, i32 2
  store i32 %5, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  store i32 %7, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_mat, align 16
  store i32 %9, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %0, align 4
  ret i32 %11

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %6
    i32 2, label %8
    i32 3, label %10
  ]

loop:                                             ; preds = %8, %6, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_multiple_returns(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp eq i32 %10, 0
  %12 = select i1 %11, i32 4, i32 5
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 0, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %15, 10
  %17 = select i1 %16, i32 6, i32 7
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 10, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 20, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %1, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %9
    i32 4, label %13
    i32 5, label %14
    i32 6, label %18
    i32 7, label %19
    i32 8, label %20
  ]

loop:                                             ; preds = %19, %18, %14, %13, %9, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_nested_multiple_returns(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 7
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 5, i32 6
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  store i32 %23, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %25, %26
  store i32 %27, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = sub nsw i32 0, %29
  store i32 %30, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %2, align 4
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %18
    i32 5, label %22
    i32 6, label %24
    i32 7, label %28
    i32 8, label %31
  ]

loop:                                             ; preds = %28, %24, %22, %18, %14, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_50_complex_multiple_returns(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 4
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 6, i32 5
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, i32 6, i32 7
  store i32 %27, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %29, %30
  store i32 %31, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %33, %34
  %36 = load i32, ptr %6, align 4
  %37 = mul nsw i32 %36, 2
  %38 = icmp sgt i32 %35, %37
  %39 = select i1 %38, i32 8, i32 9
  store i32 %39, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %5, align 4
  %43 = mul nsw i32 %41, %42
  store i32 %43, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  %45 = load i32, ptr %6, align 4
  store i32 %45, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %3, align 4
  ret i32 %47

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
    i32 5, label %24
    i32 6, label %28
    i32 7, label %32
    i32 8, label %40
    i32 9, label %44
    i32 10, label %46
  ]

loop:                                             ; preds = %44, %40, %32, %28, %24, %20, %16, %12, %8, %7
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
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
  store i32 1, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %8, align 4
  %20 = icmp sgt i32 %19, 10
  %21 = select i1 %20, i32 2, i32 3
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = add nsw i32 %23, 100
  store i32 %24, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %8, align 4
  %27 = sub nsw i32 %26, 100
  store i32 %27, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %8, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %31, %32
  ret i32 %33

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %18
    i32 2, label %22
    i32 3, label %25
    i32 4, label %28
  ]

loop:                                             ; preds = %25, %22, %18, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_suffix_code(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, 10
  store i32 %19, ptr %4, align 4
  %20 = load i32, ptr %4, align 4
  %21 = mul nsw i32 %20, 3
  store i32 %21, ptr %4, align 4
  %22 = load i32, ptr %4, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
  ]

loop:                                             ; preds = %14, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_prefix_nested_suffix(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 2, i32 7
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %6, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %5, align 4
  %21 = icmp sgt i32 %19, %20
  %22 = select i1 %21, i32 4, i32 5
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 10
  store i32 %25, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = sub nsw i32 %27, 10
  store i32 %28, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 5
  store i32 %31, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %6, align 4
  %34 = sub nsw i32 0, %33
  store i32 %34, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %6, align 4
  %37 = load i32, ptr %5, align 4
  %38 = add nsw i32 %36, %37
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %11
    i32 2, label %15
    i32 3, label %18
    i32 4, label %23
    i32 5, label %26
    i32 6, label %29
    i32 7, label %32
    i32 8, label %35
  ]

loop:                                             ; preds = %32, %29, %26, %23, %18, %15, %11, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_diamond(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 20
  store i32 %16, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
  ]

loop:                                             ; preds = %14, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_55_multiple_merge_values(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 2
  store i32 %15, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = sub nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  %19 = load i32, ptr %3, align 4
  %20 = sub nsw i32 %19, 2
  store i32 %20, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = load i32, ptr %5, align 4
  %24 = mul nsw i32 %22, %23
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %16
    i32 4, label %21
  ]

loop:                                             ; preds = %16, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_nested_diamonds(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 6
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 3, i32 4
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = icmp sgt i32 %27, 0
  %29 = select i1 %28, i32 7, i32 8
  store i32 %29, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %31, %32
  store i32 %33, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %5, align 4
  %36 = load i32, ptr %3, align 4
  %37 = sub nsw i32 %35, %36
  store i32 %37, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  %41 = icmp sgt i32 %40, 10
  %42 = select i1 %41, i32 11, i32 12
  store i32 %42, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load i32, ptr %6, align 4
  %45 = mul nsw i32 %44, 2
  store i32 %45, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %6, align 4
  %48 = sub nsw i32 %47, 2
  store i32 %48, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  %50 = load i32, ptr %7, align 4
  ret i32 %50

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %17
    i32 4, label %21
    i32 5, label %25
    i32 6, label %26
    i32 7, label %30
    i32 8, label %34
    i32 9, label %38
    i32 10, label %39
    i32 11, label %43
    i32 12, label %46
    i32 13, label %49
  ]

loop:                                             ; preds = %46, %43, %39, %38, %34, %30, %26, %25, %21, %17, %13, %9, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_ternary_before_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  store i32 %13, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  store i32 %15, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = icmp sgt i32 %18, 10
  %20 = select i1 %19, i32 6, i32 7
  store i32 %20, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 2
  store i32 %26, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %2, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %14
    i32 4, label %16
    i32 5, label %17
    i32 6, label %21
    i32 7, label %24
    i32 8, label %27
  ]

loop:                                             ; preds = %24, %21, %17, %16, %14, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_58_ternary_inside_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 6
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = icmp sgt i32 %24, 0
  %26 = select i1 %25, i32 7, i32 8
  store i32 %26, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  %29 = mul nsw i32 %28, 2
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = sub nsw i32 %31, 2
  store i32 %32, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %2, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %18
    i32 5, label %22
    i32 6, label %23
    i32 7, label %27
    i32 8, label %30
    i32 9, label %33
    i32 10, label %34
  ]

loop:                                             ; preds = %33, %30, %27, %23, %22, %18, %14, %10, %6, %5
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %10, %11
  %13 = select i1 %12, i32 2, i32 6
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp sgt i32 %15, %16
  %18 = select i1 %17, i32 3, i32 4
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  store i32 %20, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  store i32 %22, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp sgt i32 %25, %26
  %28 = select i1 %27, i32 7, i32 8
  store i32 %28, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  store i32 %30, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  store i32 %32, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %7, align 4
  store i32 11, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %7, align 4
  %37 = icmp sgt i32 %36, 10
  %38 = select i1 %37, i32 12, i32 13
  store i32 %38, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %40 = load i32, ptr %7, align 4
  %41 = mul nsw i32 %40, 2
  store i32 %41, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  %43 = load i32, ptr %7, align 4
  store i32 %43, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  %45 = load i32, ptr %3, align 4
  ret i32 %45

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b5 = load i32, ptr %b, align 4
  switch i32 %b5, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %14
    i32 3, label %19
    i32 4, label %21
    i32 5, label %23
    i32 6, label %24
    i32 7, label %29
    i32 8, label %31
    i32 9, label %33
    i32 10, label %34
    i32 11, label %35
    i32 12, label %39
    i32 13, label %42
    i32 14, label %44
  ]

loop:                                             ; preds = %42, %39, %35, %34, %33, %31, %29, %24, %23, %21, %19, %14, %9, %8
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sle i32 %10, 0
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = zext i32 %15 to i64
  %17 = call ptr @llvm.stacksave()
  store ptr %17, ptr %5, align 8
  %18 = alloca i32, i64 %16, align 16
  store ptr %18, ptr %.reg2mem, align 8
  store i64 %16, ptr %6, align 8
  %19 = load i32, ptr %4, align 4
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %20 = getelementptr inbounds i32, ptr %.reload5, i64 0
  store i32 %19, ptr %20, align 16
  store i32 4, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 5, i32 6
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 10
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %28 = getelementptr inbounds i32, ptr %.reload4, i64 1
  store i32 %27, ptr %28, align 4
  store i32 7, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %30 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %31 = load i32, ptr %30, align 16
  %32 = add nsw i32 %31, 10
  store i32 %32, ptr %30, align 16
  store i32 7, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %34 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %35 = load i32, ptr %34, align 16
  %36 = icmp sgt i32 %35, 0
  %37 = select i1 %36, i32 8, i32 9
  store i32 %37, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %39 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %40 = load i32, ptr %39, align 16
  store i32 %40, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 10, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %42 = getelementptr inbounds i32, ptr %.reload, i64 0
  %43 = load i32, ptr %42, align 16
  %44 = sub nsw i32 %43, 1
  store i32 %44, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 10, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %46)
  store i32 11, ptr %b, align 4
  br label %loop

47:                                               ; preds = %switch
  %48 = load i32, ptr %2, align 4
  ret i32 %48

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %14
    i32 4, label %21
    i32 5, label %25
    i32 6, label %29
    i32 7, label %33
    i32 8, label %38
    i32 9, label %41
    i32 10, label %45
    i32 11, label %47
  ]

loop:                                             ; preds = %45, %41, %38, %33, %29, %25, %21, %14, %13, %9, %8
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sle i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = zext i32 %16 to i64
  %18 = call ptr @llvm.stacksave()
  store ptr %18, ptr %5, align 8
  %19 = alloca i32, i64 %17, align 16
  store i64 %17, ptr %6, align 8
  store ptr %19, ptr %7, align 8
  %20 = load i32, ptr %4, align 4
  %21 = load ptr, ptr %7, align 8
  store i32 %20, ptr %21, align 4
  store i32 4, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = icmp sgt i32 %23, 2
  %25 = select i1 %24, i32 5, i32 9
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, 1
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds i32, ptr %29, i64 1
  store i32 %28, ptr %30, align 4
  store i32 6, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds i32, ptr %32, i64 1
  %34 = load i32, ptr %33, align 4
  %35 = icmp sgt i32 %34, 0
  %36 = select i1 %35, i32 7, i32 8
  store i32 %36, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds i32, ptr %38, i64 1
  %40 = load i32, ptr %39, align 4
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds i32, ptr %41, i64 0
  %43 = load i32, ptr %42, align 4
  %44 = add nsw i32 %40, %43
  store i32 %44, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds i32, ptr %46, i64 0
  %48 = load i32, ptr %47, align 4
  %49 = load ptr, ptr %7, align 8
  %50 = getelementptr inbounds i32, ptr %49, i64 1
  %51 = load i32, ptr %50, align 4
  %52 = sub nsw i32 %48, %51
  store i32 %52, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %loop

53:                                               ; preds = %switch
  %54 = load ptr, ptr %7, align 8
  %55 = getelementptr inbounds i32, ptr %54, i64 0
  %56 = load i32, ptr %55, align 4
  store i32 %56, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %loop

57:                                               ; preds = %switch
  %58 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %58)
  store i32 11, ptr %b, align 4
  br label %loop

59:                                               ; preds = %switch
  %60 = load i32, ptr %2, align 4
  ret i32 %60

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %15
    i32 4, label %22
    i32 5, label %26
    i32 6, label %31
    i32 7, label %37
    i32 8, label %45
    i32 9, label %53
    i32 10, label %57
    i32 11, label %59
  ]

loop:                                             ; preds = %57, %53, %45, %37, %31, %26, %22, %15, %14, %10, %9
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

10:                                               ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = icmp sle i32 %12, 0
  %14 = select i1 %13, i32 2, i32 3
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 -100, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = zext i32 %17 to i64
  %19 = call ptr @llvm.stacksave()
  store ptr %19, ptr %7, align 8
  %20 = alloca i32, i64 %18, align 16
  store ptr %20, ptr %.reg2mem, align 8
  store i64 %18, ptr %8, align 8
  %21 = load i32, ptr %5, align 4
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %21, %22
  %.reload7 = load ptr, ptr %.reg2mem, align 8
  %24 = getelementptr inbounds i32, ptr %.reload7, i64 0
  store i32 %23, ptr %24, align 16
  store i32 4, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = icmp sgt i32 %26, 3
  %28 = select i1 %27, i32 5, i32 7
  store i32 %28, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %.reload6 = load ptr, ptr %.reg2mem, align 8
  %30 = getelementptr inbounds i32, ptr %.reload6, i64 0
  %31 = load i32, ptr %30, align 16
  %32 = icmp sgt i32 %31, 0
  %33 = select i1 %32, i32 6, i32 7
  store i32 %33, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %35 = getelementptr inbounds i32, ptr %.reload5, i64 0
  %36 = load i32, ptr %35, align 16
  %37 = mul nsw i32 %36, 2
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %38 = getelementptr inbounds i32, ptr %.reload4, i64 1
  store i32 %37, ptr %38, align 4
  store i32 8, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %40 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %41 = load i32, ptr %40, align 16
  %42 = sub nsw i32 %41, 5
  store i32 %42, ptr %40, align 16
  store i32 8, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %44 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %45 = load i32, ptr %44, align 16
  %46 = icmp sgt i32 %45, 10
  %47 = select i1 %46, i32 10, i32 9
  store i32 %47, ptr %b, align 4
  br label %loop

48:                                               ; preds = %switch
  %49 = load i32, ptr %6, align 4
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i32 10, i32 11
  store i32 %51, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %53 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %54 = load i32, ptr %53, align 16
  store i32 %54, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %loop

55:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %56 = getelementptr inbounds i32, ptr %.reload, i64 0
  %57 = load i32, ptr %56, align 16
  %58 = load i32, ptr %5, align 4
  %59 = add nsw i32 %57, %58
  store i32 %59, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %61)
  store i32 13, ptr %b, align 4
  br label %loop

62:                                               ; preds = %switch
  %63 = load i32, ptr %3, align 4
  ret i32 %63

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b8 = load i32, ptr %b, align 4
  switch i32 %b8, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %15
    i32 3, label %16
    i32 4, label %25
    i32 5, label %29
    i32 6, label %34
    i32 7, label %39
    i32 8, label %43
    i32 9, label %48
    i32 10, label %52
    i32 11, label %55
    i32 12, label %60
    i32 13, label %62
  ]

loop:                                             ; preds = %60, %55, %52, %48, %43, %39, %34, %29, %25, %16, %15, %11, %10
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_63_malloc_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sle i32 %9, 0
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16) #6
  store ptr %17, ptr %5, align 8
  store i32 4, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load ptr, ptr %5, align 8
  %20 = icmp eq ptr %19, null
  %21 = select i1 %20, i32 5, i32 6
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 -2, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds i32, ptr %25, i64 0
  store i32 %24, ptr %26, align 4
  store i32 7, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds i32, ptr %28, i64 0
  %30 = load i32, ptr %29, align 4
  %31 = icmp sgt i32 %30, 0
  %32 = select i1 %31, i32 8, i32 9
  store i32 %32, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds i32, ptr %34, i64 0
  %36 = load i32, ptr %35, align 4
  %37 = mul nsw i32 %36, 2
  store i32 %37, ptr %35, align 4
  store i32 10, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds i32, ptr %39, i64 0
  %41 = load i32, ptr %40, align 4
  %42 = sub nsw i32 %41, 2
  store i32 %42, ptr %40, align 4
  store i32 10, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load ptr, ptr %5, align 8
  %45 = getelementptr inbounds i32, ptr %44, i64 0
  %46 = load i32, ptr %45, align 4
  store i32 %46, ptr %6, align 4
  %47 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %47) #7
  %48 = load i32, ptr %6, align 4
  store i32 %48, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  %50 = load i32, ptr %2, align 4
  ret i32 %50

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %13
    i32 4, label %18
    i32 5, label %22
    i32 6, label %23
    i32 7, label %27
    i32 8, label %33
    i32 9, label %38
    i32 10, label %43
    i32 11, label %49
  ]

loop:                                             ; preds = %43, %38, %33, %27, %23, %22, %18, %13, %12, %8, %7
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sle i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 -1, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = mul i64 %17, 4
  %19 = call noalias ptr @malloc(i64 noundef %18) #6
  store ptr %19, ptr %7, align 8
  store i32 4, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load ptr, ptr %7, align 8
  %22 = icmp eq ptr %21, null
  %23 = select i1 %22, i32 5, i32 6
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 -2, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %5, align 4
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds i32, ptr %27, i64 0
  store i32 %26, ptr %28, align 4
  store i32 7, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  %31 = icmp sgt i32 %30, 0
  %32 = select i1 %31, i32 8, i32 12
  store i32 %32, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  %35 = icmp sgt i32 %34, 0
  %36 = select i1 %35, i32 9, i32 10
  store i32 %36, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %6, align 4
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds i32, ptr %39, i64 0
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %41, %38
  store i32 %42, ptr %40, align 4
  store i32 11, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load i32, ptr %6, align 4
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds i32, ptr %45, i64 0
  %47 = load i32, ptr %46, align 4
  %48 = sub nsw i32 %47, %44
  store i32 %48, ptr %46, align 4
  store i32 11, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %loop

50:                                               ; preds = %switch
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 0
  %53 = load i32, ptr %52, align 4
  %54 = sub nsw i32 0, %53
  %55 = load ptr, ptr %7, align 8
  %56 = getelementptr inbounds i32, ptr %55, i64 0
  store i32 %54, ptr %56, align 4
  store i32 13, ptr %b, align 4
  br label %loop

57:                                               ; preds = %switch
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds i32, ptr %58, i64 0
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %8, align 4
  %61 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %61) #7
  %62 = load i32, ptr %8, align 4
  store i32 %62, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

63:                                               ; preds = %switch
  %64 = load i32, ptr %3, align 4
  ret i32 %64

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %15
    i32 4, label %20
    i32 5, label %24
    i32 6, label %25
    i32 7, label %29
    i32 8, label %33
    i32 9, label %37
    i32 10, label %43
    i32 11, label %49
    i32 12, label %50
    i32 13, label %57
    i32 14, label %63
  ]

loop:                                             ; preds = %57, %50, %49, %43, %37, %33, %29, %25, %24, %20, %15, %14, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_65_void_if(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

2:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %loop

3:                                                ; preds = %switch
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 0
  %6 = select i1 %5, i32 2, i32 3
  store i32 %6, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = load i32, ptr @g_void_result, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, ptr @g_void_result, align 4
  store i32 3, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %7
    i32 3, label %11
  ]

loop:                                             ; preds = %7, %3, %2
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_66_void_if_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

2:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %loop

3:                                                ; preds = %switch
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 0
  %6 = select i1 %5, i32 2, i32 3
  store i32 %6, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = mul nsw i32 %8, 2
  %10 = load i32, ptr @g_void_result, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  %14 = load i32, ptr @g_void_result, align 4
  %15 = sub nsw i32 %14, %13
  store i32 %15, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %7
    i32 3, label %12
    i32 4, label %16
  ]

loop:                                             ; preds = %12, %7, %3, %2
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_nested(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 6
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 3, i32 4
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr @g_void_result, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = load i32, ptr %3, align 4
  %22 = sub nsw i32 %20, %21
  %23 = load i32, ptr @g_void_result, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %2, align 4
  %28 = load i32, ptr @g_void_result, align 4
  %29 = sub nsw i32 %28, %27
  store i32 %29, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %19
    i32 5, label %25
    i32 6, label %26
    i32 7, label %30
  ]

loop:                                             ; preds = %26, %25, %19, %13, %9, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 4, i32 3
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %5, align 4
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 4, i32 5
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, ptr @g_void_result, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr @g_void_result, align 4
  store i32 6, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr @g_void_result, align 4
  %34 = sub nsw i32 %33, %32
  store i32 %34, ptr @g_void_result, align 4
  store i32 6, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %15
    i32 4, label %19
    i32 5, label %27
    i32 6, label %35
  ]

loop:                                             ; preds = %27, %19, %15, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_69_void_global_only() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

0:                                                ; preds = %switch
  %1 = load i32, ptr @g_x, align 4
  %2 = icmp sgt i32 %1, 0
  %3 = select i1 %2, i32 1, i32 3
  store i32 %3, ptr %b, align 4
  br label %loop

4:                                                ; preds = %switch
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp slt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_x, align 4
  %10 = load i32, ptr @g_void_result, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr @g_z, align 4
  %14 = load i32, ptr @g_void_result, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %4
    i32 2, label %8
    i32 3, label %12
    i32 4, label %16
  ]

loop:                                             ; preds = %12, %8, %4, %0
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_70_void_pointer(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load ptr, ptr %2, align 8
  store i32 %11, ptr %12, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 2
  %16 = load ptr, ptr %2, align 8
  store i32 %15, ptr %16, align 4
  store i32 4, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr @g_void_result, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr @g_void_result, align 4
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
  ]

loop:                                             ; preds = %13, %9, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_71_void_array(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = icmp sge i32 %6, 0
  %8 = select i1 %7, i32 2, i32 4
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 8
  %12 = select i1 %11, i32 3, i32 4
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %16
  store i32 %14, ptr %17, align 4
  store i32 4, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = icmp sge i32 %19, 0
  %21 = select i1 %20, i32 5, i32 7
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  %24 = icmp slt i32 %23, 8
  %25 = select i1 %24, i32 6, i32 7
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %2, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr @g_void_result, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %18
    i32 5, label %22
    i32 6, label %26
    i32 7, label %33
  ]

loop:                                             ; preds = %26, %22, %18, %13, %9, %5, %4
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

10:                                               ; preds = %switch
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %11 = load i32, ptr @g_x, align 4
  store i32 %11, ptr %9, align 4
  store i32 1, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %8, align 4
  %15 = icmp sgt i32 %13, %14
  %16 = select i1 %15, i32 2, i32 15
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %9, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %9, align 4
  store i32 3, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  %23 = icmp sge i32 %22, 0
  %24 = select i1 %23, i32 4, i32 13
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %26, 8
  %28 = select i1 %27, i32 5, i32 13
  store i32 %28, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = icmp sgt i32 %33, 0
  %35 = select i1 %34, i32 6, i32 11
  store i32 %35, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = load i32, ptr %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = load i32, ptr %9, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, ptr %9, align 4
  store i32 7, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load ptr, ptr %5, align 8
  %45 = load i32, ptr %44, align 4
  %46 = icmp sgt i32 %45, 0
  %47 = select i1 %46, i32 9, i32 8
  store i32 %47, ptr %b, align 4
  br label %loop

48:                                               ; preds = %switch
  %49 = load i32, ptr @g_y, align 4
  %50 = icmp slt i32 %49, 0
  %51 = select i1 %50, i32 9, i32 10
  store i32 %51, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = load i32, ptr %9, align 4
  %54 = load ptr, ptr %5, align 8
  %55 = load i32, ptr %54, align 4
  %56 = add nsw i32 %53, %55
  store i32 %56, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %loop

57:                                               ; preds = %switch
  %58 = load i32, ptr %9, align 4
  %59 = load ptr, ptr %5, align 8
  %60 = load i32, ptr %59, align 4
  %61 = sub nsw i32 %58, %60
  store i32 %61, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %loop

62:                                               ; preds = %switch
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = load i32, ptr %9, align 4
  %68 = sub nsw i32 %67, %66
  store i32 %68, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %loop

69:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

70:                                               ; preds = %switch
  %71 = load i32, ptr %9, align 4
  %72 = add nsw i32 %71, 100
  store i32 %72, ptr %9, align 4
  store i32 14, ptr %b, align 4
  br label %loop

73:                                               ; preds = %switch
  store i32 24, ptr %b, align 4
  br label %loop

74:                                               ; preds = %switch
  %75 = load i32, ptr %7, align 4
  %76 = load i32, ptr %8, align 4
  %77 = icmp eq i32 %75, %76
  %78 = select i1 %77, i32 16, i32 20
  store i32 %78, ptr %b, align 4
  br label %loop

79:                                               ; preds = %switch
  %80 = load i32, ptr @g_z, align 4
  %81 = load i32, ptr %9, align 4
  %82 = add nsw i32 %81, %80
  store i32 %82, ptr %9, align 4
  store i32 17, ptr %b, align 4
  br label %loop

83:                                               ; preds = %switch
  %84 = load ptr, ptr %5, align 8
  %85 = load i32, ptr %84, align 4
  %86 = icmp eq i32 %85, 0
  %87 = select i1 %86, i32 18, i32 19
  store i32 %87, ptr %b, align 4
  br label %loop

88:                                               ; preds = %switch
  %89 = load i32, ptr %9, align 4
  store i32 %89, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %loop

90:                                               ; preds = %switch
  %91 = load i32, ptr %9, align 4
  %92 = load ptr, ptr %5, align 8
  %93 = load i32, ptr %92, align 4
  %94 = add nsw i32 %91, %93
  store i32 %94, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %loop

95:                                               ; preds = %switch
  %96 = load i32, ptr %8, align 4
  %97 = load i32, ptr %9, align 4
  %98 = sub nsw i32 %97, %96
  store i32 %98, ptr %9, align 4
  store i32 21, ptr %b, align 4
  br label %loop

99:                                               ; preds = %switch
  %100 = load i32, ptr %7, align 4
  %101 = load i32, ptr %8, align 4
  %102 = add nsw i32 %100, %101
  %103 = load i32, ptr @g_x, align 4
  %104 = add nsw i32 %103, 1
  %105 = icmp sgt i32 %102, %104
  %106 = select i1 %105, i32 22, i32 23
  store i32 %106, ptr %b, align 4
  br label %loop

107:                                              ; preds = %switch
  %108 = load i32, ptr %9, align 4
  %109 = mul nsw i32 %108, 2
  store i32 %109, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %loop

110:                                              ; preds = %switch
  %111 = load i32, ptr %9, align 4
  %112 = sdiv i32 %111, 2
  store i32 %112, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %loop

113:                                              ; preds = %switch
  %114 = load i32, ptr %9, align 4
  store i32 %114, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %loop

115:                                              ; preds = %switch
  %116 = load i32, ptr %4, align 4
  ret i32 %116

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %10
    i32 1, label %12
    i32 2, label %17
    i32 3, label %21
    i32 4, label %25
    i32 5, label %29
    i32 6, label %36
    i32 7, label %43
    i32 8, label %48
    i32 9, label %52
    i32 10, label %57
    i32 11, label %62
    i32 12, label %69
    i32 13, label %70
    i32 14, label %73
    i32 15, label %74
    i32 16, label %79
    i32 17, label %83
    i32 18, label %88
    i32 19, label %90
    i32 20, label %95
    i32 21, label %99
    i32 22, label %107
    i32 23, label %110
    i32 24, label %113
    i32 25, label %115
  ]

loop:                                             ; preds = %113, %110, %107, %99, %95, %90, %88, %83, %79, %74, %73, %70, %69, %62, %57, %52, %48, %43, %36, %29, %25, %21, %17, %12, %10
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 8
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 3, i32 8
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, ptr %7, align 4
  store i32 4, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 5, i32 6
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %7, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %4, align 4
  %37 = load i32, ptr %5, align 4
  %38 = sub nsw i32 %36, %37
  store i32 %38, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  %41 = icmp eq i32 %40, 0
  %42 = select i1 %41, i32 11, i32 10
  store i32 %42, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load i32, ptr %4, align 4
  %45 = load i32, ptr %5, align 4
  %46 = icmp eq i32 %44, %45
  %47 = select i1 %46, i32 11, i32 12
  store i32 %47, ptr %b, align 4
  br label %loop

48:                                               ; preds = %switch
  %49 = load i32, ptr %7, align 4
  %50 = mul nsw i32 %49, 2
  store i32 %50, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %loop

51:                                               ; preds = %switch
  %52 = load i32, ptr %7, align 4
  %53 = load i32, ptr %6, align 4
  %54 = sub nsw i32 %52, %53
  store i32 %54, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %loop

55:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

56:                                               ; preds = %switch
  %57 = load i32, ptr %8, align 4
  %58 = icmp sgt i32 %57, 20
  %59 = select i1 %58, i32 15, i32 16
  store i32 %59, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %loop

63:                                               ; preds = %switch
  %64 = load i32, ptr %8, align 4
  %65 = icmp sgt i32 %64, 10
  %66 = select i1 %65, i32 17, i32 18
  store i32 %66, ptr %b, align 4
  br label %loop

67:                                               ; preds = %switch
  %68 = load i32, ptr %8, align 4
  %69 = add nsw i32 %68, 2
  store i32 %69, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %loop

70:                                               ; preds = %switch
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %71, 3
  store i32 %72, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %loop

73:                                               ; preds = %switch
  %74 = load i32, ptr %3, align 4
  ret i32 %74

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %18
    i32 4, label %22
    i32 5, label %26
    i32 6, label %30
    i32 7, label %34
    i32 8, label %35
    i32 9, label %39
    i32 10, label %43
    i32 11, label %48
    i32 12, label %51
    i32 13, label %55
    i32 14, label %56
    i32 15, label %60
    i32 16, label %63
    i32 17, label %67
    i32 18, label %70
    i32 19, label %73
  ]

loop:                                             ; preds = %70, %67, %63, %60, %56, %55, %51, %48, %43, %39, %35, %34, %30, %26, %22, %18, %14, %10, %9
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

12:                                               ; preds = %switch
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %13 = load i32, ptr %8, align 4
  %14 = load i32, ptr @g_x, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %11, align 4
  store i32 1, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %9, align 4
  %19 = icmp sgt i32 %17, %18
  %20 = select i1 %19, i32 2, i32 3
  store i32 %20, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %10, align 4
  %23 = icmp ne i32 %22, 0
  %24 = select i1 %23, i32 5, i32 3
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %10, align 4
  %28 = icmp sgt i32 %26, %27
  %29 = select i1 %28, i32 4, i32 22
  store i32 %29, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %8, align 4
  %32 = icmp ne i32 %31, 0
  %33 = select i1 %32, i32 5, i32 22
  store i32 %33, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %11, align 4
  %36 = add nsw i32 %35, 10
  store i32 %36, ptr %11, align 4
  store i32 6, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %7, align 4
  %39 = icmp sge i32 %38, 0
  %40 = select i1 %39, i32 7, i32 20
  store i32 %40, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = icmp slt i32 %42, 8
  %44 = select i1 %43, i32 8, i32 20
  store i32 %44, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load i32, ptr %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %11, align 4
  %51 = icmp sgt i32 %49, %50
  %52 = select i1 %51, i32 9, i32 14
  store i32 %52, ptr %b, align 4
  br label %loop

53:                                               ; preds = %switch
  %54 = load i32, ptr %7, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = load i32, ptr %11, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %11, align 4
  store i32 10, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load ptr, ptr %6, align 8
  %62 = load i32, ptr %61, align 4
  %63 = icmp sgt i32 %62, 0
  %64 = select i1 %63, i32 11, i32 12
  store i32 %64, ptr %b, align 4
  br label %loop

65:                                               ; preds = %switch
  %66 = load ptr, ptr %6, align 8
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %11, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %11, align 4
  store i32 13, ptr %b, align 4
  br label %loop

70:                                               ; preds = %switch
  %71 = load ptr, ptr %6, align 8
  %72 = load i32, ptr %71, align 4
  %73 = load i32, ptr %11, align 4
  %74 = sub nsw i32 %73, %72
  store i32 %74, ptr %11, align 4
  store i32 13, ptr %b, align 4
  br label %loop

75:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %loop

76:                                               ; preds = %switch
  %77 = load i32, ptr %7, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = load i32, ptr %11, align 4
  %82 = sub nsw i32 %81, %80
  store i32 %82, ptr %11, align 4
  store i32 15, ptr %b, align 4
  br label %loop

83:                                               ; preds = %switch
  %84 = load i32, ptr %7, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = icmp eq i32 %87, 0
  %89 = select i1 %88, i32 17, i32 16
  store i32 %89, ptr %b, align 4
  br label %loop

90:                                               ; preds = %switch
  %91 = load ptr, ptr %6, align 8
  %92 = load i32, ptr %91, align 4
  %93 = icmp eq i32 %92, 0
  %94 = select i1 %93, i32 17, i32 18
  store i32 %94, ptr %b, align 4
  br label %loop

95:                                               ; preds = %switch
  %96 = load i32, ptr %11, align 4
  %97 = add nsw i32 %96, 50
  store i32 %97, ptr %11, align 4
  store i32 18, ptr %b, align 4
  br label %loop

98:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %loop

99:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %loop

100:                                              ; preds = %switch
  %101 = load i32, ptr %11, align 4
  %102 = sub nsw i32 %101, 20
  store i32 %102, ptr %11, align 4
  store i32 21, ptr %b, align 4
  br label %loop

103:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %loop

104:                                              ; preds = %switch
  %105 = load i32, ptr %11, align 4
  %106 = sub nsw i32 %105, 10
  store i32 %106, ptr %11, align 4
  store i32 23, ptr %b, align 4
  br label %loop

107:                                              ; preds = %switch
  %108 = load i32, ptr %11, align 4
  %109 = load i32, ptr @g_z, align 4
  %110 = icmp sgt i32 %108, %109
  %111 = select i1 %110, i32 24, i32 27
  store i32 %111, ptr %b, align 4
  br label %loop

112:                                              ; preds = %switch
  %113 = load i32, ptr %8, align 4
  %114 = load i32, ptr %9, align 4
  %115 = load i32, ptr %10, align 4
  %116 = sdiv i32 %115, 10
  %117 = load i32, ptr %8, align 4
  %118 = sub nsw i32 %117, 1
  %119 = mul nsw i32 %116, %118
  %120 = add nsw i32 %114, %119
  %121 = icmp eq i32 %113, %120
  %122 = select i1 %121, i32 25, i32 26
  store i32 %122, ptr %b, align 4
  br label %loop

123:                                              ; preds = %switch
  %124 = load i32, ptr %11, align 4
  %125 = add nsw i32 %124, 100
  store i32 %125, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %loop

126:                                              ; preds = %switch
  %127 = load i32, ptr %11, align 4
  %128 = add nsw i32 %127, 200
  store i32 %128, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %loop

129:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %loop

130:                                              ; preds = %switch
  %131 = load i32, ptr %11, align 4
  %132 = icmp sgt i32 %131, 0
  %133 = select i1 %132, i32 29, i32 30
  store i32 %133, ptr %b, align 4
  br label %loop

134:                                              ; preds = %switch
  %135 = load i32, ptr %11, align 4
  %136 = mul nsw i32 %135, 2
  store i32 %136, ptr %.reg2mem, align 4
  store i32 31, ptr %b, align 4
  br label %loop

137:                                              ; preds = %switch
  %138 = load i32, ptr %11, align 4
  %139 = sub nsw i32 0, %138
  store i32 %139, ptr %.reg2mem, align 4
  store i32 31, ptr %b, align 4
  br label %loop

140:                                              ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %loop

141:                                              ; preds = %switch
  %142 = load i32, ptr %5, align 4
  ret i32 %142

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %12
    i32 1, label %16
    i32 2, label %21
    i32 3, label %25
    i32 4, label %30
    i32 5, label %34
    i32 6, label %37
    i32 7, label %41
    i32 8, label %45
    i32 9, label %53
    i32 10, label %60
    i32 11, label %65
    i32 12, label %70
    i32 13, label %75
    i32 14, label %76
    i32 15, label %83
    i32 16, label %90
    i32 17, label %95
    i32 18, label %98
    i32 19, label %99
    i32 20, label %100
    i32 21, label %103
    i32 22, label %104
    i32 23, label %107
    i32 24, label %112
    i32 25, label %123
    i32 26, label %126
    i32 27, label %129
    i32 28, label %130
    i32 29, label %134
    i32 30, label %137
    i32 31, label %140
    i32 32, label %141
  ]

loop:                                             ; preds = %140, %137, %134, %130, %129, %126, %123, %112, %107, %104, %103, %100, %99, %98, %95, %90, %83, %76, %75, %70, %65, %60, %53, %45, %41, %37, %34, %30, %25, %21, %16, %12
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 1
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #8
  store i32 %18, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 4, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %22, 2
  %24 = select i1 %23, i32 6, i32 7
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 2
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 @atoi(ptr noundef %28) #8
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  store i32 -1, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %32 = load i32, ptr %5, align 4
  %33 = call i32 @_00_if_only(i32 noundef %32)
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %7, align 4
  %36 = load i32, ptr %5, align 4
  %37 = call i32 @_01_if_else(i32 noundef %36)
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %7, align 4
  %40 = load i32, ptr %5, align 4
  %41 = call i32 @_02_if_with_surrounding_code(i32 noundef %40)
  %42 = load i32, ptr %7, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %7, align 4
  %44 = load i32, ptr %5, align 4
  %45 = call i32 @_03_if_compound(i32 noundef %44)
  %46 = load i32, ptr %7, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %7, align 4
  %48 = load i32, ptr %5, align 4
  %49 = call i32 @_04_if_else_compound(i32 noundef %48)
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = load i32, ptr %6, align 4
  %54 = icmp eq i32 %53, 0
  %55 = select i1 %54, i32 10, i32 11
  store i32 %55, ptr %b, align 4
  br label %loop

56:                                               ; preds = %switch
  %57 = load i32, ptr %7, align 4
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %57)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

59:                                               ; preds = %switch
  %60 = load i32, ptr %5, align 4
  %61 = call i32 @_05_if_equal(i32 noundef %60, i32 noundef 4)
  %62 = load i32, ptr %7, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %7, align 4
  %64 = load i32, ptr %5, align 4
  %65 = call i32 @_06_if_not_equal(i32 noundef %64, i32 noundef 4)
  %66 = load i32, ptr %7, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %7, align 4
  %68 = load i32, ptr %5, align 4
  %69 = call i32 @_07_relational(i32 noundef %68, i32 noundef 4)
  %70 = load i32, ptr %7, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, ptr %7, align 4
  %72 = load i32, ptr %5, align 4
  %73 = icmp sgt i32 %72, 0
  %74 = load i32, ptr %5, align 4
  %75 = call i32 @_08_boolean_argument(i1 noundef zeroext %73, i32 noundef %74)
  %76 = load i32, ptr %7, align 4
  %77 = add nsw i32 %76, %75
  store i32 %77, ptr %7, align 4
  store i32 12, ptr %b, align 4
  br label %loop

78:                                               ; preds = %switch
  %79 = load i32, ptr %6, align 4
  %80 = icmp eq i32 %79, 1
  %81 = select i1 %80, i32 13, i32 14
  store i32 %81, ptr %b, align 4
  br label %loop

82:                                               ; preds = %switch
  %83 = load i32, ptr %7, align 4
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %83)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

85:                                               ; preds = %switch
  %86 = load i32, ptr %5, align 4
  %87 = call i32 @_09_if_elseif_else(i32 noundef %86)
  %88 = load i32, ptr %7, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, ptr %7, align 4
  %90 = load i32, ptr %5, align 4
  %91 = call i32 @_10_multiple_elseif(i32 noundef %90)
  %92 = load i32, ptr %7, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, ptr %7, align 4
  %94 = load i32, ptr %5, align 4
  %95 = call i32 @_11_elseif_expressions(i32 noundef %94, i32 noundef 4)
  %96 = load i32, ptr %7, align 4
  %97 = add nsw i32 %96, %95
  store i32 %97, ptr %7, align 4
  store i32 15, ptr %b, align 4
  br label %loop

98:                                               ; preds = %switch
  %99 = load i32, ptr %6, align 4
  %100 = icmp eq i32 %99, 2
  %101 = select i1 %100, i32 16, i32 17
  store i32 %101, ptr %b, align 4
  br label %loop

102:                                              ; preds = %switch
  %103 = load i32, ptr %7, align 4
  %104 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %103)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

105:                                              ; preds = %switch
  %106 = load i32, ptr %5, align 4
  %107 = call i32 @_12_and(i32 noundef %106, i32 noundef 3)
  %108 = load i32, ptr %7, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %7, align 4
  %110 = load i32, ptr %5, align 4
  %111 = call i32 @_13_or(i32 noundef %110, i32 noundef -3)
  %112 = load i32, ptr %7, align 4
  %113 = add nsw i32 %112, %111
  store i32 %113, ptr %7, align 4
  %114 = load i32, ptr %5, align 4
  %115 = call i32 @_14_and_or(i32 noundef %114, i32 noundef 2, i32 noundef -1)
  %116 = load i32, ptr %7, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, ptr %7, align 4
  %118 = load i32, ptr %5, align 4
  %119 = call i32 @_15_or_and(i32 noundef %118, i32 noundef 0, i32 noundef 20)
  %120 = load i32, ptr %7, align 4
  %121 = add nsw i32 %120, %119
  store i32 %121, ptr %7, align 4
  %122 = load i32, ptr %5, align 4
  %123 = call i32 @_16_complex_boolean(i32 noundef %122, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %124 = load i32, ptr %7, align 4
  %125 = add nsw i32 %124, %123
  store i32 %125, ptr %7, align 4
  store i32 18, ptr %b, align 4
  br label %loop

126:                                              ; preds = %switch
  %127 = load i32, ptr %6, align 4
  %128 = icmp eq i32 %127, 3
  %129 = select i1 %128, i32 19, i32 20
  store i32 %129, ptr %b, align 4
  br label %loop

130:                                              ; preds = %switch
  %131 = load i32, ptr %7, align 4
  %132 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %131)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

133:                                              ; preds = %switch
  %134 = load i32, ptr %5, align 4
  %135 = call i32 @_17_nested_arithmetic_condition(i32 noundef %134, i32 noundef 1, i32 noundef 20)
  %136 = load i32, ptr %7, align 4
  %137 = add nsw i32 %136, %135
  store i32 %137, ptr %7, align 4
  %138 = load i32, ptr %5, align 4
  %139 = call i32 @_18_deep_parentheses(i32 noundef %138, i32 noundef 2, i32 noundef 3)
  %140 = load i32, ptr %7, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, ptr %7, align 4
  %142 = load i32, ptr %5, align 4
  %143 = call i32 @_19_arithmetic_boolean(i32 noundef %142, i32 noundef 2, i32 noundef 5)
  %144 = load i32, ptr %7, align 4
  %145 = add nsw i32 %144, %143
  store i32 %145, ptr %7, align 4
  %146 = load i32, ptr %5, align 4
  %147 = call i32 @_20_nested_boolean_parentheses(i32 noundef %146, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %148 = load i32, ptr %7, align 4
  %149 = add nsw i32 %148, %147
  store i32 %149, ptr %7, align 4
  store i32 21, ptr %b, align 4
  br label %loop

150:                                              ; preds = %switch
  %151 = load i32, ptr %6, align 4
  %152 = icmp eq i32 %151, 4
  %153 = select i1 %152, i32 22, i32 23
  store i32 %153, ptr %b, align 4
  br label %loop

154:                                              ; preds = %switch
  %155 = load i32, ptr %7, align 4
  %156 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %155)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

157:                                              ; preds = %switch
  %158 = load i32, ptr %5, align 4
  %159 = call i32 @_21_nested_if(i32 noundef %158, i32 noundef 3)
  %160 = load i32, ptr %7, align 4
  %161 = add nsw i32 %160, %159
  store i32 %161, ptr %7, align 4
  %162 = load i32, ptr %5, align 4
  %163 = call i32 @_22_nested_in_else(i32 noundef %162, i32 noundef 3)
  %164 = load i32, ptr %7, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %7, align 4
  %166 = load i32, ptr %5, align 4
  %167 = call i32 @_23_nested_if_else(i32 noundef %166, i32 noundef 3, i32 noundef 5)
  %168 = load i32, ptr %7, align 4
  %169 = add nsw i32 %168, %167
  store i32 %169, ptr %7, align 4
  %170 = load i32, ptr %5, align 4
  %171 = call i32 @_24_three_level_nesting(i32 noundef %170, i32 noundef 3, i32 noundef 5)
  %172 = load i32, ptr %7, align 4
  %173 = add nsw i32 %172, %171
  store i32 %173, ptr %7, align 4
  %174 = load i32, ptr %5, align 4
  %175 = call i32 @_25_deep_nested_values(i32 noundef %174, i32 noundef 3, i32 noundef 10)
  %176 = load i32, ptr %7, align 4
  %177 = add nsw i32 %176, %175
  store i32 %177, ptr %7, align 4
  %178 = load i32, ptr %5, align 4
  %179 = call i32 @_26_nested_and(i32 noundef %178, i32 noundef 3, i32 noundef 5)
  %180 = load i32, ptr %7, align 4
  %181 = add nsw i32 %180, %179
  store i32 %181, ptr %7, align 4
  %182 = load i32, ptr %5, align 4
  %183 = call i32 @_27_nested_or(i32 noundef %182, i32 noundef 0, i32 noundef 20)
  %184 = load i32, ptr %7, align 4
  %185 = add nsw i32 %184, %183
  store i32 %185, ptr %7, align 4
  %186 = load i32, ptr %5, align 4
  %187 = call i32 @_28_nested_complex_boolean(i32 noundef %186, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %188 = load i32, ptr %7, align 4
  %189 = add nsw i32 %188, %187
  store i32 %189, ptr %7, align 4
  store i32 24, ptr %b, align 4
  br label %loop

190:                                              ; preds = %switch
  %191 = load i32, ptr %6, align 4
  %192 = icmp eq i32 %191, 5
  %193 = select i1 %192, i32 25, i32 26
  store i32 %193, ptr %b, align 4
  br label %loop

194:                                              ; preds = %switch
  %195 = load i32, ptr %7, align 4
  %196 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %195)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

197:                                              ; preds = %switch
  %198 = load i32, ptr %5, align 4
  %199 = call i32 @_29_independent_ifs(i32 noundef %198)
  %200 = load i32, ptr %7, align 4
  %201 = add nsw i32 %200, %199
  store i32 %201, ptr %7, align 4
  %202 = load i32, ptr %5, align 4
  %203 = call i32 @_30_independent_if_else(i32 noundef %202, i32 noundef 3)
  %204 = load i32, ptr %7, align 4
  %205 = add nsw i32 %204, %203
  store i32 %205, ptr %7, align 4
  store i32 27, ptr %b, align 4
  br label %loop

206:                                              ; preds = %switch
  %207 = load i32, ptr %6, align 4
  %208 = icmp eq i32 %207, 6
  %209 = select i1 %208, i32 28, i32 29
  store i32 %209, ptr %b, align 4
  br label %loop

210:                                              ; preds = %switch
  %211 = load i32, ptr %7, align 4
  %212 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %211)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

213:                                              ; preds = %switch
  %214 = call i32 @_31_array_condition(i32 noundef 1)
  %215 = load i32, ptr %7, align 4
  %216 = add nsw i32 %215, %214
  store i32 %216, ptr %7, align 4
  %217 = call i32 @_32_array_branches(i32 noundef 2)
  %218 = load i32, ptr %7, align 4
  %219 = add nsw i32 %218, %217
  store i32 %219, ptr %7, align 4
  %220 = call i32 @_33_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %221 = load i32, ptr %7, align 4
  %222 = add nsw i32 %221, %220
  store i32 %222, ptr %7, align 4
  %223 = call i32 @_34_matrix_condition(i32 noundef 1, i32 noundef 1)
  %224 = load i32, ptr %7, align 4
  %225 = add nsw i32 %224, %223
  store i32 %225, ptr %7, align 4
  %226 = call i32 @_35_nested_array(i32 noundef 1, i32 noundef 2)
  %227 = load i32, ptr %7, align 4
  %228 = add nsw i32 %227, %226
  store i32 %228, ptr %7, align 4
  store i32 30, ptr %b, align 4
  br label %loop

229:                                              ; preds = %switch
  %230 = load i32, ptr %6, align 4
  %231 = icmp eq i32 %230, 7
  %232 = select i1 %231, i32 31, i32 32
  store i32 %232, ptr %b, align 4
  br label %loop

233:                                              ; preds = %switch
  %234 = load i32, ptr %7, align 4
  %235 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %234)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

236:                                              ; preds = %switch
  %237 = load i32, ptr %5, align 4
  store i32 %237, ptr %8, align 4
  %238 = call i32 @_36_pointer_condition(ptr noundef %8)
  %239 = load i32, ptr %7, align 4
  %240 = add nsw i32 %239, %238
  store i32 %240, ptr %7, align 4
  %241 = call i32 @_37_pointer_branches(ptr noundef %8)
  %242 = load i32, ptr %7, align 4
  %243 = add nsw i32 %242, %241
  store i32 %243, ptr %7, align 4
  %244 = call i32 @_38_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %245 = load i32, ptr %7, align 4
  %246 = add nsw i32 %245, %244
  store i32 %246, ptr %7, align 4
  %247 = call i32 @_39_nested_pointer(ptr noundef %8, i32 noundef 3)
  %248 = load i32, ptr %7, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, ptr %7, align 4
  %250 = load i32, ptr %5, align 4
  store i32 %250, ptr %8, align 4
  %251 = load i32, ptr %5, align 4
  %252 = call i32 @_40_pointer_write(ptr noundef %8, i32 noundef %251)
  %253 = load i32, ptr %7, align 4
  %254 = add nsw i32 %253, %252
  store i32 %254, ptr %7, align 4
  %255 = load i32, ptr %5, align 4
  store i32 %255, ptr %8, align 4
  %256 = load i32, ptr %5, align 4
  %257 = call i32 @_41_pointer_write_nested(ptr noundef %8, i32 noundef %256, i32 noundef 3)
  %258 = load i32, ptr %7, align 4
  %259 = add nsw i32 %258, %257
  store i32 %259, ptr %7, align 4
  store i32 33, ptr %b, align 4
  br label %loop

260:                                              ; preds = %switch
  %261 = load i32, ptr %6, align 4
  %262 = icmp eq i32 %261, 8
  %263 = select i1 %262, i32 34, i32 35
  store i32 %263, ptr %b, align 4
  br label %loop

264:                                              ; preds = %switch
  %265 = load i32, ptr %7, align 4
  %266 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %265)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

267:                                              ; preds = %switch
  %268 = load i32, ptr %5, align 4
  store i32 %268, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %269 = call i32 @_42_global_only()
  %270 = load i32, ptr %7, align 4
  %271 = add nsw i32 %270, %269
  store i32 %271, ptr %7, align 4
  %272 = call i32 @_43_global_and()
  %273 = load i32, ptr %7, align 4
  %274 = add nsw i32 %273, %272
  store i32 %274, ptr %7, align 4
  %275 = call i32 @_44_global_or()
  %276 = load i32, ptr %7, align 4
  %277 = add nsw i32 %276, %275
  store i32 %277, ptr %7, align 4
  %278 = call i32 @_45_global_nested()
  %279 = load i32, ptr %7, align 4
  %280 = add nsw i32 %279, %278
  store i32 %280, ptr %7, align 4
  %281 = call i32 @_46_global_array_only()
  %282 = load i32, ptr %7, align 4
  %283 = add nsw i32 %282, %281
  store i32 %283, ptr %7, align 4
  %284 = call i32 @_47_global_matrix_only()
  %285 = load i32, ptr %7, align 4
  %286 = add nsw i32 %285, %284
  store i32 %286, ptr %7, align 4
  store i32 36, ptr %b, align 4
  br label %loop

287:                                              ; preds = %switch
  %288 = load i32, ptr %6, align 4
  %289 = icmp eq i32 %288, 9
  %290 = select i1 %289, i32 37, i32 38
  store i32 %290, ptr %b, align 4
  br label %loop

291:                                              ; preds = %switch
  %292 = load i32, ptr %7, align 4
  %293 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %292)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

294:                                              ; preds = %switch
  %295 = load i32, ptr %5, align 4
  %296 = call i32 @_48_multiple_returns(i32 noundef %295)
  %297 = load i32, ptr %7, align 4
  %298 = add nsw i32 %297, %296
  store i32 %298, ptr %7, align 4
  %299 = load i32, ptr %5, align 4
  %300 = call i32 @_49_nested_multiple_returns(i32 noundef %299, i32 noundef 3)
  %301 = load i32, ptr %7, align 4
  %302 = add nsw i32 %301, %300
  store i32 %302, ptr %7, align 4
  %303 = load i32, ptr %5, align 4
  %304 = call i32 @_50_complex_multiple_returns(i32 noundef %303, i32 noundef 3, i32 noundef 5)
  %305 = load i32, ptr %7, align 4
  %306 = add nsw i32 %305, %304
  store i32 %306, ptr %7, align 4
  store i32 39, ptr %b, align 4
  br label %loop

307:                                              ; preds = %switch
  %308 = load i32, ptr %6, align 4
  %309 = icmp eq i32 %308, 10
  %310 = select i1 %309, i32 40, i32 41
  store i32 %310, ptr %b, align 4
  br label %loop

311:                                              ; preds = %switch
  %312 = load i32, ptr %7, align 4
  %313 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %312)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

314:                                              ; preds = %switch
  %315 = load i32, ptr %5, align 4
  %316 = call i32 @_51_prefix_code(i32 noundef %315, i32 noundef 2, i32 noundef 3)
  %317 = load i32, ptr %7, align 4
  %318 = add nsw i32 %317, %316
  store i32 %318, ptr %7, align 4
  %319 = load i32, ptr %5, align 4
  %320 = call i32 @_52_suffix_code(i32 noundef %319, i32 noundef 3)
  %321 = load i32, ptr %7, align 4
  %322 = add nsw i32 %321, %320
  store i32 %322, ptr %7, align 4
  %323 = load i32, ptr %5, align 4
  %324 = call i32 @_53_prefix_nested_suffix(i32 noundef %323, i32 noundef 3, i32 noundef 5)
  %325 = load i32, ptr %7, align 4
  %326 = add nsw i32 %325, %324
  store i32 %326, ptr %7, align 4
  store i32 42, ptr %b, align 4
  br label %loop

327:                                              ; preds = %switch
  %328 = load i32, ptr %6, align 4
  %329 = icmp eq i32 %328, 11
  %330 = select i1 %329, i32 43, i32 44
  store i32 %330, ptr %b, align 4
  br label %loop

331:                                              ; preds = %switch
  %332 = load i32, ptr %7, align 4
  %333 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %332)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

334:                                              ; preds = %switch
  %335 = load i32, ptr %5, align 4
  %336 = call i32 @_54_diamond(i32 noundef %335, i32 noundef 3)
  %337 = load i32, ptr %7, align 4
  %338 = add nsw i32 %337, %336
  store i32 %338, ptr %7, align 4
  %339 = load i32, ptr %5, align 4
  %340 = call i32 @_55_multiple_merge_values(i32 noundef %339, i32 noundef 3)
  %341 = load i32, ptr %7, align 4
  %342 = add nsw i32 %341, %340
  store i32 %342, ptr %7, align 4
  %343 = load i32, ptr %5, align 4
  %344 = call i32 @_56_nested_diamonds(i32 noundef %343, i32 noundef 3, i32 noundef 5)
  %345 = load i32, ptr %7, align 4
  %346 = add nsw i32 %345, %344
  store i32 %346, ptr %7, align 4
  store i32 45, ptr %b, align 4
  br label %loop

347:                                              ; preds = %switch
  %348 = load i32, ptr %6, align 4
  %349 = icmp eq i32 %348, 12
  %350 = select i1 %349, i32 46, i32 47
  store i32 %350, ptr %b, align 4
  br label %loop

351:                                              ; preds = %switch
  %352 = load i32, ptr %7, align 4
  %353 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %352)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

354:                                              ; preds = %switch
  %355 = load i32, ptr %5, align 4
  %356 = call i32 @_57_ternary_before_if(i32 noundef %355, i32 noundef 3)
  %357 = load i32, ptr %7, align 4
  %358 = add nsw i32 %357, %356
  store i32 %358, ptr %7, align 4
  %359 = load i32, ptr %5, align 4
  %360 = call i32 @_58_ternary_inside_if(i32 noundef %359, i32 noundef 3)
  %361 = load i32, ptr %7, align 4
  %362 = add nsw i32 %361, %360
  store i32 %362, ptr %7, align 4
  %363 = load i32, ptr %5, align 4
  %364 = call i32 @_59_nested_ternary_if(i32 noundef %363, i32 noundef 3, i32 noundef 5)
  %365 = load i32, ptr %7, align 4
  %366 = add nsw i32 %365, %364
  store i32 %366, ptr %7, align 4
  store i32 48, ptr %b, align 4
  br label %loop

367:                                              ; preds = %switch
  %368 = load i32, ptr %6, align 4
  %369 = icmp eq i32 %368, 13
  %370 = select i1 %369, i32 49, i32 50
  store i32 %370, ptr %b, align 4
  br label %loop

371:                                              ; preds = %switch
  %372 = load i32, ptr %7, align 4
  %373 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %372)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

374:                                              ; preds = %switch
  %375 = load i32, ptr %5, align 4
  %376 = call i32 @_60_dynamic_alloca(i32 noundef 4, i32 noundef %375)
  %377 = load i32, ptr %7, align 4
  %378 = add nsw i32 %377, %376
  store i32 %378, ptr %7, align 4
  %379 = load i32, ptr %5, align 4
  %380 = call i32 @_61_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %379)
  %381 = load i32, ptr %7, align 4
  %382 = add nsw i32 %381, %380
  store i32 %382, ptr %7, align 4
  %383 = load i32, ptr %5, align 4
  %384 = call i32 @_62_dynamic_alloca_complex(i32 noundef 6, i32 noundef %383, i32 noundef 3)
  %385 = load i32, ptr %7, align 4
  %386 = add nsw i32 %385, %384
  store i32 %386, ptr %7, align 4
  store i32 51, ptr %b, align 4
  br label %loop

387:                                              ; preds = %switch
  %388 = load i32, ptr %6, align 4
  %389 = icmp eq i32 %388, 14
  %390 = select i1 %389, i32 52, i32 53
  store i32 %390, ptr %b, align 4
  br label %loop

391:                                              ; preds = %switch
  %392 = load i32, ptr %7, align 4
  %393 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %392)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

394:                                              ; preds = %switch
  %395 = load i32, ptr %5, align 4
  %396 = call i32 @_63_malloc_if(i32 noundef 4, i32 noundef %395)
  %397 = load i32, ptr %7, align 4
  %398 = add nsw i32 %397, %396
  store i32 %398, ptr %7, align 4
  %399 = load i32, ptr %5, align 4
  %400 = call i32 @_64_malloc_nested_if(i32 noundef 4, i32 noundef %399, i32 noundef 3)
  %401 = load i32, ptr %7, align 4
  %402 = add nsw i32 %401, %400
  store i32 %402, ptr %7, align 4
  store i32 54, ptr %b, align 4
  br label %loop

403:                                              ; preds = %switch
  %404 = load i32, ptr %6, align 4
  %405 = icmp eq i32 %404, 15
  %406 = select i1 %405, i32 55, i32 56
  store i32 %406, ptr %b, align 4
  br label %loop

407:                                              ; preds = %switch
  %408 = load i32, ptr %7, align 4
  %409 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %408)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

410:                                              ; preds = %switch
  store i32 0, ptr @g_void_result, align 4
  %411 = load i32, ptr %5, align 4
  call void @_65_void_if(i32 noundef %411)
  %412 = load i32, ptr %5, align 4
  call void @_66_void_if_else(i32 noundef %412)
  %413 = load i32, ptr %5, align 4
  call void @_67_void_nested(i32 noundef %413, i32 noundef 3)
  %414 = load i32, ptr %5, align 4
  call void @_68_void_complex(i32 noundef %414, i32 noundef 3, i32 noundef 0)
  call void @_69_void_global_only()
  %415 = load i32, ptr %5, align 4
  store i32 %415, ptr %8, align 4
  %416 = load i32, ptr %5, align 4
  call void @_70_void_pointer(ptr noundef %8, i32 noundef %416)
  %417 = load i32, ptr %5, align 4
  call void @_71_void_array(i32 noundef 1, i32 noundef %417)
  store i32 57, ptr %b, align 4
  br label %loop

418:                                              ; preds = %switch
  %419 = load i32, ptr %6, align 4
  %420 = icmp eq i32 %419, 16
  %421 = select i1 %420, i32 58, i32 59
  store i32 %421, ptr %b, align 4
  br label %loop

422:                                              ; preds = %switch
  %423 = load i32, ptr %7, align 4
  %424 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %423)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

425:                                              ; preds = %switch
  %426 = load i32, ptr @g_void_result, align 4
  %427 = load i32, ptr %7, align 4
  %428 = add nsw i32 %427, %426
  store i32 %428, ptr %7, align 4
  %429 = load i32, ptr %5, align 4
  store i32 %429, ptr %8, align 4
  %430 = load i32, ptr %5, align 4
  %431 = call i32 @_72_complex_control_flow(ptr noundef %8, i32 noundef 1, i32 noundef %430, i32 noundef 3)
  %432 = load i32, ptr %7, align 4
  %433 = add nsw i32 %432, %431
  store i32 %433, ptr %7, align 4
  %434 = load i32, ptr %5, align 4
  %435 = call i32 @_73_complex_merge(i32 noundef %434, i32 noundef 3, i32 noundef 5)
  %436 = load i32, ptr %7, align 4
  %437 = add nsw i32 %436, %435
  store i32 %437, ptr %7, align 4
  %438 = load i32, ptr %5, align 4
  %439 = call i32 @_74_if_stress(ptr noundef %8, i32 noundef 1, i32 noundef %438, i32 noundef 3, i32 noundef 5)
  %440 = load i32, ptr %7, align 4
  %441 = add nsw i32 %440, %439
  store i32 %441, ptr %7, align 4
  %442 = load i32, ptr %7, align 4
  %443 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %442)
  store i32 0, ptr %2, align 4
  store i32 60, ptr %b, align 4
  br label %loop

444:                                              ; preds = %switch
  %445 = load i32, ptr %2, align 4
  ret i32 %445

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %19
    i32 4, label %20
    i32 5, label %21
    i32 6, label %25
    i32 7, label %30
    i32 8, label %31
    i32 9, label %52
    i32 10, label %56
    i32 11, label %59
    i32 12, label %78
    i32 13, label %82
    i32 14, label %85
    i32 15, label %98
    i32 16, label %102
    i32 17, label %105
    i32 18, label %126
    i32 19, label %130
    i32 20, label %133
    i32 21, label %150
    i32 22, label %154
    i32 23, label %157
    i32 24, label %190
    i32 25, label %194
    i32 26, label %197
    i32 27, label %206
    i32 28, label %210
    i32 29, label %213
    i32 30, label %229
    i32 31, label %233
    i32 32, label %236
    i32 33, label %260
    i32 34, label %264
    i32 35, label %267
    i32 36, label %287
    i32 37, label %291
    i32 38, label %294
    i32 39, label %307
    i32 40, label %311
    i32 41, label %314
    i32 42, label %327
    i32 43, label %331
    i32 44, label %334
    i32 45, label %347
    i32 46, label %351
    i32 47, label %354
    i32 48, label %367
    i32 49, label %371
    i32 50, label %374
    i32 51, label %387
    i32 52, label %391
    i32 53, label %394
    i32 54, label %403
    i32 55, label %407
    i32 56, label %410
    i32 57, label %418
    i32 58, label %422
    i32 59, label %425
    i32 60, label %444
  ]

loop:                                             ; preds = %425, %422, %418, %410, %407, %403, %394, %391, %387, %374, %371, %367, %354, %351, %347, %334, %331, %327, %314, %311, %307, %294, %291, %287, %267, %264, %260, %236, %233, %229, %213, %210, %206, %197, %194, %190, %157, %154, %150, %133, %130, %126, %105, %102, %98, %85, %82, %78, %59, %56, %52, %31, %30, %25, %21, %20, %19, %14, %10, %9
  br label %switch
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
