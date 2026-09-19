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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  store i32 %5, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  store i32 %12, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %1, align 4
  ret i32 %17

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %6
    i32 2, label %10
    i32 3, label %11
    i32 4, label %13
    i32 5, label %16
  ]

loop:                                             ; preds = %13, %11, %10, %6, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_goto_two_labels(i32 noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = sub nsw i32 %14, 10
  store i32 %15, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %1, align 4
  ret i32 %17

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %9
    i32 4, label %10
    i32 5, label %13
    i32 6, label %16
  ]

loop:                                             ; preds = %13, %10, %9, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_goto_surrounding_code(i32 noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, 5
  store i32 %17, ptr %2, align 4
  %18 = load i32, ptr %2, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %10
    i32 3, label %11
    i32 4, label %12
    i32 5, label %15
  ]

loop:                                             ; preds = %12, %11, %10, %6, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_03_goto_skip_block(i32 noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = sub nsw i32 %11, 100
  store i32 %12, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 10
  store i32 %15, ptr %2, align 4
  %16 = load i32, ptr %2, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %9
    i32 3, label %10
    i32 4, label %13
  ]

loop:                                             ; preds = %10, %9, %5, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_goto_equal(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  ret i32 %15

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
    i32 5, label %14
  ]

loop:                                             ; preds = %13, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_goto_not_equal(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %13, %14
  store i32 %15, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %2, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %12
    i32 4, label %16
    i32 5, label %20
  ]

loop:                                             ; preds = %16, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_06_relational(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 6, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %13, %14
  %16 = select i1 %15, i32 4, i32 5
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 3, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 1, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 2, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %2, align 4
  ret i32 %22

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
    i32 6, label %19
    i32 7, label %20
    i32 8, label %21
  ]

loop:                                             ; preds = %20, %19, %18, %17, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %13, 3
  store i32 %14, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = mul nsw i32 %16, 3
  store i32 %17, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %7
    i32 2, label %11
    i32 3, label %12
    i32 4, label %15
    i32 5, label %18
  ]

loop:                                             ; preds = %15, %12, %11, %7, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_08_goto_chain(i32 noundef %0) #0 {
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
  store i32 6, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp sgt i32 %10, 5
  %12 = select i1 %11, i32 4, i32 5
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 10
  store i32 %16, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, 100
  store i32 %19, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, 50
  store i32 %22, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %1, align 4
  ret i32 %24

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
    i32 6, label %17
    i32 7, label %20
    i32 8, label %23
  ]

loop:                                             ; preds = %20, %17, %14, %13, %9, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_09_multiple_levels(i32 noundef %0) #0 {
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
  store i32 10, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 0
  %12 = select i1 %11, i32 4, i32 5
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = icmp eq i32 %15, 0
  %17 = select i1 %16, i32 6, i32 7
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = icmp slt i32 %20, 10
  %22 = select i1 %21, i32 8, i32 9
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 1, ptr %1, align 4
  store i32 14, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 14, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  store i32 -2, ptr %1, align 4
  store i32 14, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 0, ptr %1, align 4
  store i32 14, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  store i32 2, ptr %1, align 4
  store i32 14, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %1, align 4
  ret i32 %30

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
    i32 11, label %26
    i32 12, label %27
    i32 13, label %28
    i32 14, label %29
  ]

loop:                                             ; preds = %28, %27, %26, %25, %24, %23, %19, %18, %14, %13, %9, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_goto_expressions(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 8, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp eq i32 %13, %14
  %16 = select i1 %15, i32 4, i32 5
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 10
  %21 = load i32, ptr %4, align 4
  %22 = icmp sgt i32 %20, %21
  %23 = select i1 %22, i32 6, i32 7
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = load i32, ptr %3, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %3, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %3, align 4
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = load i32, ptr %3, align 4
  %38 = load i32, ptr %4, align 4
  %39 = sub nsw i32 %37, %38
  store i32 %39, ptr %2, align 4
  store i32 11, ptr %b, align 4
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
    i32 2, label %11
    i32 3, label %12
    i32 4, label %17
    i32 5, label %18
    i32 6, label %24
    i32 7, label %25
    i32 8, label %29
    i32 9, label %32
    i32 10, label %36
    i32 11, label %40
  ]

loop:                                             ; preds = %36, %32, %29, %25, %24, %18, %17, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_and(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = sub nsw i32 %16, %17
  store i32 %18, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %15
    i32 5, label %19
    i32 6, label %23
  ]

loop:                                             ; preds = %19, %15, %14, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_or(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  %19 = sub nsw i32 %18, 10
  store i32 %19, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %21, %22
  %24 = add nsw i32 %23, 10
  store i32 %24, ptr %2, align 4
  store i32 6, ptr %b, align 4
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
    i32 2, label %10
    i32 3, label %14
    i32 4, label %15
    i32 5, label %20
    i32 6, label %25
  ]

loop:                                             ; preds = %20, %15, %14, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_and_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 6, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  store i32 200, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 100, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  ret i32 %24

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
    i32 7, label %23
  ]

loop:                                             ; preds = %22, %21, %20, %16, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_or_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 6, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  store i32 400, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 300, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  ret i32 %24

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
    i32 7, label %23
  ]

loop:                                             ; preds = %22, %21, %20, %16, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  store i32 7, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %6, align 4
  %30 = sub nsw i32 %28, %29
  %31 = load i32, ptr %7, align 4
  %32 = sub nsw i32 %30, %31
  %33 = load i32, ptr %8, align 4
  %34 = sub nsw i32 %32, %33
  store i32 %34, ptr %4, align 4
  store i32 8, ptr %b, align 4
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
  store i32 8, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load i32, ptr %4, align 4
  ret i32 %44

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
    i32 6, label %27
    i32 7, label %35
    i32 8, label %43
  ]

loop:                                             ; preds = %35, %27, %26, %22, %18, %14, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_nested_arithmetic_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 222, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  store i32 111, ptr %3, align 4
  store i32 5, ptr %b, align 4
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
    i32 2, label %19
    i32 3, label %20
    i32 4, label %21
    i32 5, label %22
  ]

loop:                                             ; preds = %21, %20, %19, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_deep_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %5, align 4
  %27 = sub nsw i32 %25, %26
  %28 = load i32, ptr %6, align 4
  %29 = sub nsw i32 %27, %28
  store i32 %29, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = load i32, ptr %3, align 4
  ret i32 %37

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %23
    i32 3, label %24
    i32 4, label %30
    i32 5, label %36
  ]

loop:                                             ; preds = %30, %24, %23, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_arithmetic_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 5, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 456, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 123, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  ret i32 %27

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
    i32 6, label %26
  ]

loop:                                             ; preds = %25, %24, %23, %15, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_nested_boolean_parentheses(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  store i32 8, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  store i32 888, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  store i32 777, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = load i32, ptr %4, align 4
  ret i32 %39

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
    i32 9, label %38
  ]

loop:                                             ; preds = %37, %36, %35, %30, %25, %20, %15, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_nested_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 %7, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  store i32 %14, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = select i1 %17, i32 5, i32 6
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %4, align 4
  %23 = sub nsw i32 %21, %22
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %5, align 4
  %26 = load i32, ptr %5, align 4
  store i32 %26, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %5, align 4
  %33 = load i32, ptr %5, align 4
  store i32 %33, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %2, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %8
    i32 2, label %12
    i32 3, label %13
    i32 4, label %15
    i32 5, label %19
    i32 6, label %20
    i32 7, label %27
    i32 8, label %34
  ]

loop:                                             ; preds = %27, %20, %19, %15, %13, %12, %8, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_nested_in_else(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 6, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 4, i32 5
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = sub nsw i32 %17, 2
  store i32 %18, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %2, align 4
  ret i32 %27

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %11
    i32 4, label %15
    i32 5, label %16
    i32 6, label %19
    i32 7, label %23
    i32 8, label %26
  ]

loop:                                             ; preds = %23, %19, %16, %15, %11, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_nested_goto_else(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 6, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %6, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 4, i32 5
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %6, align 4
  %20 = sub nsw i32 %19, 2
  store i32 %20, ptr %3, align 4
  store i32 11, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = icmp sgt i32 %22, 0
  %24 = select i1 %23, i32 7, i32 8
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = load i32, ptr %5, align 4
  %29 = sub nsw i32 %27, %28
  store i32 %29, ptr %3, align 4
  store i32 11, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  store i32 %33, ptr %3, align 4
  store i32 11, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %6, align 4
  %36 = mul nsw i32 %35, 2
  store i32 %36, ptr %3, align 4
  store i32 11, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %3, align 4
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %13
    i32 4, label %17
    i32 5, label %18
    i32 6, label %21
    i32 7, label %25
    i32 8, label %26
    i32 9, label %30
    i32 10, label %34
    i32 11, label %37
  ]

loop:                                             ; preds = %34, %30, %26, %25, %21, %18, %17, %13, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_three_level_nesting(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 0, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 -1, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %7, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = icmp sgt i32 %19, 0
  %21 = select i1 %20, i32 6, i32 7
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %24, 20
  store i32 %25, ptr %7, align 4
  %26 = load i32, ptr %7, align 4
  store i32 %26, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 10
  store i32 %29, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %6, align 4
  %32 = icmp sgt i32 %31, 0
  %33 = select i1 %32, i32 10, i32 11
  store i32 %33, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %7, align 4
  %37 = sub nsw i32 %36, 100
  store i32 %37, ptr %7, align 4
  %38 = load i32, ptr %7, align 4
  store i32 %38, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %40 = load i32, ptr %7, align 4
  %41 = add nsw i32 %40, 100
  store i32 %41, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  %43 = load i32, ptr %3, align 4
  ret i32 %43

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %14
    i32 4, label %15
    i32 5, label %18
    i32 6, label %22
    i32 7, label %23
    i32 8, label %27
    i32 9, label %30
    i32 10, label %34
    i32 11, label %35
    i32 12, label %39
    i32 13, label %42
  ]

loop:                                             ; preds = %39, %35, %34, %30, %27, %23, %22, %18, %15, %14, %13, %9, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_deep_nested_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %15 = select i1 %14, i32 2, i32 3
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %6, align 4
  %20 = sub nsw i32 %18, %19
  store i32 %20, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, 10
  store i32 %23, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp sgt i32 %25, %26
  %28 = select i1 %27, i32 6, i32 7
  store i32 %28, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %7, align 4
  %32 = sub nsw i32 %31, 5
  store i32 %32, ptr %7, align 4
  store i32 8, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %6, align 4
  %36 = icmp slt i32 %34, %35
  %37 = select i1 %36, i32 9, i32 10
  store i32 %37, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %40 = load i32, ptr %7, align 4
  %41 = sdiv i32 %40, 2
  store i32 %41, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  %43 = load i32, ptr %7, align 4
  %44 = mul nsw i32 %43, 2
  store i32 %44, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load i32, ptr %7, align 4
  %47 = mul nsw i32 %46, 2
  store i32 %47, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %loop

48:                                               ; preds = %switch
  %49 = load i32, ptr %7, align 4
  %50 = srem i32 %49, 3
  %51 = icmp eq i32 %50, 0
  %52 = select i1 %51, i32 14, i32 15
  store i32 %52, ptr %b, align 4
  br label %loop

53:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %loop

54:                                               ; preds = %switch
  %55 = load i32, ptr %7, align 4
  %56 = sub nsw i32 %55, 3
  store i32 %56, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %loop

57:                                               ; preds = %switch
  %58 = load i32, ptr %7, align 4
  %59 = add nsw i32 %58, 3
  store i32 %59, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load i32, ptr %3, align 4
  ret i32 %61

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %12
    i32 2, label %16
    i32 3, label %17
    i32 4, label %21
    i32 5, label %24
    i32 6, label %29
    i32 7, label %30
    i32 8, label %33
    i32 9, label %38
    i32 10, label %39
    i32 11, label %42
    i32 12, label %45
    i32 13, label %48
    i32 14, label %53
    i32 15, label %54
    i32 16, label %57
    i32 17, label %60
  ]

loop:                                             ; preds = %57, %54, %53, %48, %45, %42, %39, %38, %33, %30, %29, %24, %21, %17, %16, %12, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_nested_and(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 0, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 4
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 3, i32 4
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %6, align 4
  store i32 %19, ptr %3, align 4
  store i32 11, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %7, align 4
  store i32 6, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = icmp sgt i32 %25, 0
  %27 = select i1 %26, i32 7, i32 9
  store i32 %27, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %6, align 4
  %30 = icmp slt i32 %29, 10
  %31 = select i1 %30, i32 8, i32 9
  store i32 %31, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  %35 = load i32, ptr %7, align 4
  %36 = sub nsw i32 %35, %34
  store i32 %36, ptr %7, align 4
  %37 = load i32, ptr %7, align 4
  store i32 %37, ptr %3, align 4
  store i32 11, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = load i32, ptr %7, align 4
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %39, %40
  store i32 %41, ptr %3, align 4
  store i32 11, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  %43 = load i32, ptr %3, align 4
  ret i32 %43

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %17
    i32 4, label %18
    i32 5, label %20
    i32 6, label %24
    i32 7, label %28
    i32 8, label %32
    i32 9, label %33
    i32 10, label %38
    i32 11, label %42
  ]

loop:                                             ; preds = %38, %33, %32, %28, %24, %20, %18, %17, %13, %9, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_nested_or(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 3000, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %6, align 4
  %20 = icmp sgt i32 %19, 10
  %21 = select i1 %20, i32 7, i32 6
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  %24 = icmp slt i32 %23, -10
  %25 = select i1 %24, i32 7, i32 8
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 2000, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  store i32 1000, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %3, align 4
  ret i32 %30

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %17
    i32 5, label %18
    i32 6, label %22
    i32 7, label %26
    i32 8, label %27
    i32 9, label %28
    i32 10, label %29
  ]

loop:                                             ; preds = %28, %27, %26, %22, %18, %17, %16, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_nested_complex_boolean(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  %21 = select i1 %20, i32 4, i32 5
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %8, align 4
  %26 = sub nsw i32 %24, %25
  store i32 %26, ptr %4, align 4
  store i32 12, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %8, align 4
  %29 = icmp sgt i32 %28, 5
  %30 = select i1 %29, i32 8, i32 7
  store i32 %30, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %6, align 4
  %34 = icmp eq i32 %32, %33
  %35 = select i1 %34, i32 8, i32 10
  store i32 %35, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = load i32, ptr %7, align 4
  %38 = icmp slt i32 %37, 10
  %39 = select i1 %38, i32 9, i32 10
  store i32 %39, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %5, align 4
  %43 = load i32, ptr %6, align 4
  %44 = mul nsw i32 %42, %43
  store i32 %44, ptr %4, align 4
  store i32 12, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load i32, ptr %5, align 4
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %46, %47
  %49 = load i32, ptr %7, align 4
  %50 = add nsw i32 %48, %49
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %50, %51
  store i32 %52, ptr %4, align 4
  store i32 12, ptr %b, align 4
  br label %loop

53:                                               ; preds = %switch
  %54 = load i32, ptr %4, align 4
  ret i32 %54

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
    i32 5, label %23
    i32 6, label %27
    i32 7, label %31
    i32 8, label %36
    i32 9, label %40
    i32 10, label %41
    i32 11, label %45
    i32 12, label %53
  ]

loop:                                             ; preds = %45, %41, %40, %36, %31, %27, %23, %22, %18, %14, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_independent_gotos(i32 noundef %0) #0 {
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
  store i32 %5, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = icmp sgt i32 %12, 5
  %14 = select i1 %13, i32 4, i32 5
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = icmp sgt i32 %17, 10
  %19 = select i1 %18, i32 6, i32 7
  store i32 %19, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  store i32 %22, ptr %1, align 4
  store i32 17, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 10
  store i32 %25, ptr %3, align 4
  store i32 11, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %27, 20
  store i32 %28, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, 30
  store i32 %31, ptr %3, align 4
  %32 = load i32, ptr %3, align 4
  store i32 %32, ptr %1, align 4
  store i32 17, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %2, align 4
  %35 = icmp sgt i32 %34, 5
  %36 = select i1 %35, i32 12, i32 13
  store i32 %36, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %40 = load i32, ptr %2, align 4
  %41 = icmp sgt i32 %40, 10
  %42 = select i1 %41, i32 15, i32 16
  store i32 %42, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  %45 = load i32, ptr %3, align 4
  store i32 %45, ptr %1, align 4
  store i32 17, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %1, align 4
  ret i32 %47

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %6
    i32 2, label %10
    i32 3, label %11
    i32 4, label %15
    i32 5, label %16
    i32 6, label %20
    i32 7, label %21
    i32 8, label %23
    i32 9, label %26
    i32 10, label %29
    i32 11, label %33
    i32 12, label %37
    i32 13, label %38
    i32 14, label %39
    i32 15, label %43
    i32 16, label %44
    i32 17, label %46
  ]

loop:                                             ; preds = %44, %43, %39, %38, %37, %33, %29, %26, %23, %21, %20, %16, %15, %11, %10, %6, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_independent_goto_paths(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = sub nsw i32 %13, 10
  store i32 %14, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, 10
  store i32 %17, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = icmp sgt i32 %19, 0
  %21 = select i1 %20, i32 6, i32 7
  store i32 %21, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %5, align 4
  %25 = sub nsw i32 %24, 20
  store i32 %25, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 20
  store i32 %28, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %2, align 4
  ret i32 %30

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %12
    i32 4, label %15
    i32 5, label %18
    i32 6, label %22
    i32 7, label %23
    i32 8, label %26
    i32 9, label %29
  ]

loop:                                             ; preds = %26, %23, %22, %18, %15, %12, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_array_condition(i32 noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = sub nsw i32 %15, 2
  store i32 %16, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %1, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %9
    i32 2, label %13
    i32 3, label %14
    i32 4, label %17
    i32 5, label %20
  ]

loop:                                             ; preds = %17, %14, %13, %9, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_array_branches(i32 noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  %18 = sub nsw i32 %16, %17
  store i32 %18, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %1, align 4
  ret i32 %27

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %11
    i32 3, label %12
    i32 4, label %19
    i32 5, label %26
  ]

loop:                                             ; preds = %19, %12, %11, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_array_complex_condition(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 5, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = mul nsw i32 %29, 10
  store i32 %30, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = mul nsw i32 %35, 10
  store i32 %36, ptr %2, align 4
  store i32 6, ptr %b, align 4
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
    i32 2, label %17
    i32 3, label %24
    i32 4, label %25
    i32 5, label %31
    i32 6, label %37
  ]

loop:                                             ; preds = %31, %25, %24, %17, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_matrix_condition(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = sub nsw i32 %20, 2
  store i32 %21, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = mul nsw i32 %23, 2
  store i32 %24, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %2, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %14
    i32 2, label %18
    i32 3, label %19
    i32 4, label %22
    i32 5, label %25
  ]

loop:                                             ; preds = %22, %19, %18, %14, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_nested_array(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = icmp sge i32 %8, 0
  %10 = select i1 %9, i32 2, i32 4
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %12, 8
  %14 = select i1 %13, i32 3, i32 4
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = icmp sge i32 %25, 0
  %27 = select i1 %26, i32 7, i32 9
  store i32 %27, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = icmp slt i32 %29, 8
  %31 = select i1 %30, i32 8, i32 9
  store i32 %31, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  store i32 %34, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %3, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = load i32, ptr %4, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = icmp sgt i32 %39, %43
  %45 = select i1 %44, i32 11, i32 12
  store i32 %45, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %loop

47:                                               ; preds = %switch
  %48 = load i32, ptr %4, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = load i32, ptr %3, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = sub nsw i32 %51, %55
  %57 = load i32, ptr %5, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, ptr %5, align 4
  %59 = load i32, ptr %5, align 4
  store i32 %59, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load i32, ptr %5, align 4
  %62 = load i32, ptr %3, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = add nsw i32 %61, %65
  %67 = load i32, ptr %4, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = sub nsw i32 %66, %70
  store i32 %71, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

72:                                               ; preds = %switch
  %73 = load i32, ptr %2, align 4
  ret i32 %73

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %15
    i32 4, label %16
    i32 5, label %17
    i32 6, label %24
    i32 7, label %28
    i32 8, label %32
    i32 9, label %33
    i32 10, label %35
    i32 11, label %46
    i32 12, label %47
    i32 13, label %60
    i32 14, label %72
  ]

loop:                                             ; preds = %60, %47, %46, %35, %33, %32, %28, %24, %17, %16, %15, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_pointer_condition(ptr noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %11, align 4
  %13 = add nsw i32 %12, 2
  store i32 %13, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %15, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %1, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %10
    i32 4, label %14
    i32 5, label %18
  ]

loop:                                             ; preds = %14, %10, %9, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_pointer_branches(ptr noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %11, align 4
  %13 = sub nsw i32 %12, 100
  store i32 %13, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %15, align 4
  %17 = add nsw i32 %16, 100
  store i32 %17, ptr %1, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %1, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %10
    i32 4, label %14
    i32 5, label %18
  ]

loop:                                             ; preds = %14, %10, %9, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_pointer_array(ptr noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %4, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, ptr %20, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = sub nsw i32 %24, %28
  store i32 %29, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load ptr, ptr %3, align 8
  %32 = load i32, ptr %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, ptr %31, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = load i32, ptr %4, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = add nsw i32 %35, %39
  store i32 %40, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %2, align 4
  ret i32 %42

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %18
    i32 3, label %19
    i32 4, label %30
    i32 5, label %41
  ]

loop:                                             ; preds = %30, %19, %18, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_nested_pointer(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load ptr, ptr %3, align 8
  %11 = load i32, ptr %10, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %5, align 4
  %17 = sub nsw i32 0, %16
  store i32 %17, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %20, align 4
  %22 = icmp sgt i32 %19, %21
  %23 = select i1 %22, i32 5, i32 6
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = load i32, ptr %5, align 4
  %28 = sub nsw i32 %27, %26
  store i32 %28, ptr %5, align 4
  %29 = load i32, ptr %5, align 4
  store i32 %29, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %31, %32
  store i32 %33, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %2, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %9
    i32 2, label %14
    i32 3, label %15
    i32 4, label %18
    i32 5, label %24
    i32 6, label %25
    i32 7, label %30
    i32 8, label %34
  ]

loop:                                             ; preds = %30, %25, %24, %18, %15, %14, %9, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_pointer_write(ptr noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = sub nsw i32 %11, 2
  %13 = load ptr, ptr %2, align 8
  store i32 %12, ptr %13, align 4
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = mul nsw i32 %15, 2
  %17 = load ptr, ptr %2, align 8
  store i32 %16, ptr %17, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load ptr, ptr %2, align 8
  %20 = load i32, ptr %19, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %10
    i32 4, label %14
    i32 5, label %18
  ]

loop:                                             ; preds = %14, %10, %9, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_pointer_write_nested(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 0, %13
  %15 = load ptr, ptr %3, align 8
  store i32 %14, ptr %15, align 4
  store i32 8, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 0
  %19 = select i1 %18, i32 5, i32 6
  store i32 %19, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = load i32, ptr %5, align 4
  %24 = sub nsw i32 %22, %23
  %25 = load ptr, ptr %3, align 8
  store i32 %24, ptr %25, align 4
  store i32 8, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %27, %28
  %30 = load ptr, ptr %3, align 8
  store i32 %29, ptr %30, align 4
  store i32 8, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load ptr, ptr %3, align 8
  %33 = load i32, ptr %32, align 4
  ret i32 %33

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %12
    i32 4, label %16
    i32 5, label %20
    i32 6, label %21
    i32 7, label %26
    i32 8, label %31
  ]

loop:                                             ; preds = %26, %21, %20, %16, %12, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_global_only() #0 {
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
  store i32 3, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_x, align 4
  %8 = load i32, ptr @g_y, align 4
  %9 = sub nsw i32 %7, %8
  store i32 %9, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr @g_x, align 4
  %12 = load i32, ptr @g_y, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %0, align 4
  ret i32 %15

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %6
    i32 3, label %10
    i32 4, label %14
  ]

loop:                                             ; preds = %10, %6, %5, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_global_and() #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr @g_z, align 4
  store i32 %11, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr @g_x, align 4
  %14 = load i32, ptr @g_y, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %0, align 4
  ret i32 %17

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %10
    i32 4, label %12
    i32 5, label %16
  ]

loop:                                             ; preds = %12, %10, %9, %5, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_global_or() #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr @g_y, align 4
  store i32 %11, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr @g_x, align 4
  %14 = load i32, ptr @g_z, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %0, align 4
  ret i32 %17

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %10
    i32 4, label %12
    i32 5, label %16
  ]

loop:                                             ; preds = %12, %10, %9, %5, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_global_nested() #0 {
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
  store i32 3, ptr %b, align 4
  br label %loop

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_z, align 4
  store i32 %7, ptr %0, align 4
  store i32 7, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_y, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 4, i32 5
  store i32 %11, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_x, align 4
  %15 = load i32, ptr @g_y, align 4
  %16 = sub nsw i32 %14, %15
  store i32 %16, ptr %0, align 4
  store i32 7, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr @g_x, align 4
  %19 = load i32, ptr @g_y, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %0, align 4
  store i32 7, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %0, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %6
    i32 3, label %8
    i32 4, label %12
    i32 5, label %13
    i32 6, label %17
    i32 7, label %21
  ]

loop:                                             ; preds = %17, %13, %12, %8, %6, %5, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_global_array_only() #0 {
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
  store i32 3, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr @g_arr, align 16
  store i32 %8, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 %10, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %0, align 4
  ret i32 %12

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %6
    i32 2, label %7
    i32 3, label %9
    i32 4, label %11
  ]

loop:                                             ; preds = %9, %7, %6, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_matrix_only() #0 {
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
  store i32 3, ptr %b, align 4
  br label %loop

7:                                                ; preds = %switch
  %8 = load i32, ptr @g_mat, align 16
  store i32 %8, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  store i32 %10, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %0, align 4
  ret i32 %12

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %6
    i32 2, label %7
    i32 3, label %9
    i32 4, label %11
  ]

loop:                                             ; preds = %9, %7, %6, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_multiple_returns(i32 noundef %0) #0 {
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
  store i32 8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp eq i32 %10, 0
  %12 = select i1 %11, i32 4, i32 5
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %15, 10
  %17 = select i1 %16, i32 6, i32 7
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 20, ptr %1, align 4
  store i32 11, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 11, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  store i32 0, ptr %1, align 4
  store i32 11, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  store i32 10, ptr %1, align 4
  store i32 11, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %1, align 4
  ret i32 %24

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
    i32 9, label %21
    i32 10, label %22
    i32 11, label %23
  ]

loop:                                             ; preds = %22, %21, %20, %19, %18, %14, %13, %9, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_nested_multiple_returns(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = sub nsw i32 0, %12
  store i32 %13, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 5, i32 6
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 7, i32 8
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %25, %26
  store i32 %27, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  %33 = load i32, ptr %3, align 4
  store i32 %33, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %2, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %11
    i32 4, label %14
    i32 5, label %18
    i32 6, label %19
    i32 7, label %23
    i32 8, label %24
    i32 9, label %28
    i32 10, label %32
    i32 11, label %34
  ]

loop:                                             ; preds = %32, %28, %24, %23, %19, %18, %14, %11, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_complex_multiple_returns(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 10, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 6, i32 5
  store i32 %20, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 6, i32 7
  store i32 %24, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %6, align 4
  %31 = mul nsw i32 %30, 2
  %32 = icmp sgt i32 %29, %31
  %33 = select i1 %32, i32 8, i32 9
  store i32 %33, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %6, align 4
  store i32 %36, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %4, align 4
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %38, %39
  store i32 %40, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %4, align 4
  %43 = load i32, ptr %6, align 4
  %44 = sub nsw i32 %42, %43
  store i32 %44, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load i32, ptr %4, align 4
  %47 = load i32, ptr %5, align 4
  %48 = mul nsw i32 %46, %47
  store i32 %48, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  %50 = load i32, ptr %3, align 4
  ret i32 %50

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %17
    i32 5, label %21
    i32 6, label %25
    i32 7, label %26
    i32 8, label %34
    i32 9, label %35
    i32 10, label %37
    i32 11, label %41
    i32 12, label %45
    i32 13, label %49
  ]

loop:                                             ; preds = %45, %41, %37, %35, %34, %26, %25, %21, %17, %16, %12, %8, %7
  br label %switch
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
  store i32 4, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %8, align 4
  %25 = sub nsw i32 %24, 100
  store i32 %25, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %8, align 4
  %28 = add nsw i32 %27, 100
  store i32 %28, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  %30 = load i32, ptr %8, align 4
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %32, %33
  ret i32 %34

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %18
    i32 2, label %22
    i32 3, label %23
    i32 4, label %26
    i32 5, label %29
  ]

loop:                                             ; preds = %26, %23, %22, %18, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_51_suffix_code(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 10
  store i32 %20, ptr %4, align 4
  %21 = load i32, ptr %4, align 4
  %22 = mul nsw i32 %21, 3
  store i32 %22, ptr %4, align 4
  %23 = load i32, ptr %4, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %12
    i32 4, label %15
    i32 5, label %18
  ]

loop:                                             ; preds = %15, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_prefix_nested_suffix(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %14 = select i1 %13, i32 2, i32 3
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = sub nsw i32 0, %17
  store i32 %18, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %6, align 4
  %21 = mul nsw i32 %20, 2
  store i32 %21, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp sgt i32 %23, %24
  %26 = select i1 %25, i32 6, i32 7
  store i32 %26, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %6, align 4
  %30 = sub nsw i32 %29, 10
  store i32 %30, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  %33 = add nsw i32 %32, 10
  store i32 %33, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, 5
  store i32 %36, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %6, align 4
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %38, %39
  ret i32 %40

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %11
    i32 2, label %15
    i32 3, label %16
    i32 4, label %19
    i32 5, label %22
    i32 6, label %27
    i32 7, label %28
    i32 8, label %31
    i32 9, label %34
    i32 10, label %37
  ]

loop:                                             ; preds = %34, %31, %28, %27, %22, %19, %16, %15, %11, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_diamond(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 20
  store i32 %14, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, 10
  store i32 %17, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %12
    i32 4, label %15
    i32 5, label %18
  ]

loop:                                             ; preds = %15, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_multiple_merge_values(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = sub nsw i32 %13, 1
  store i32 %14, ptr %4, align 4
  %15 = load i32, ptr %3, align 4
  %16 = sub nsw i32 %15, 2
  store i32 %16, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %4, align 4
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 2
  store i32 %21, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = mul nsw i32 %23, %24
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %12
    i32 4, label %17
    i32 5, label %22
  ]

loop:                                             ; preds = %17, %12, %11, %7, %6
  br label %switch
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
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %6, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = select i1 %17, i32 4, i32 5
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %4, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %7, align 4
  store i32 11, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, ptr %7, align 4
  store i32 11, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  %30 = icmp sgt i32 %29, 0
  %31 = select i1 %30, i32 8, i32 9
  store i32 %31, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %4, align 4
  %35 = load i32, ptr %5, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %7, align 4
  store i32 11, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %4, align 4
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %38, %39
  store i32 %40, ptr %7, align 4
  store i32 11, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = icmp sgt i32 %42, 10
  %44 = select i1 %43, i32 12, i32 13
  store i32 %44, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %7, align 4
  %48 = sub nsw i32 %47, 2
  store i32 %48, ptr %8, align 4
  %49 = load i32, ptr %8, align 4
  store i32 %49, ptr %3, align 4
  store i32 15, ptr %b, align 4
  br label %loop

50:                                               ; preds = %switch
  %51 = load i32, ptr %7, align 4
  %52 = mul nsw i32 %51, 2
  store i32 %52, ptr %8, align 4
  %53 = load i32, ptr %8, align 4
  store i32 %53, ptr %3, align 4
  store i32 15, ptr %b, align 4
  br label %loop

54:                                               ; preds = %switch
  %55 = load i32, ptr %3, align 4
  ret i32 %55

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %15
    i32 4, label %19
    i32 5, label %20
    i32 6, label %24
    i32 7, label %28
    i32 8, label %32
    i32 9, label %33
    i32 10, label %37
    i32 11, label %41
    i32 12, label %45
    i32 13, label %46
    i32 14, label %50
    i32 15, label %54
  ]

loop:                                             ; preds = %50, %46, %45, %41, %37, %33, %32, %28, %24, %20, %19, %15, %14, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_ternary_before_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 8, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, 2
  store i32 %24, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %5, align 4
  %27 = mul nsw i32 %26, 2
  store i32 %27, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %2, align 4
  ret i32 %29

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
    i32 7, label %22
    i32 8, label %25
    i32 9, label %28
  ]

loop:                                             ; preds = %25, %22, %21, %17, %16, %14, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_ternary_inside_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 4, i32 5
  store i32 %14, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %.reg2mem, align 4
  store i32 6, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %19, 2
  store i32 %20, ptr %.reg2mem, align 4
  store i32 6, ptr %b, align 4
  br label %loop

21:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %4, align 4
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 8, i32 9
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 10, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %3, align 4
  %32 = load i32, ptr %4, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %.reg2mem1, align 4
  store i32 10, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %2, align 4
  ret i32 %36

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %11
    i32 4, label %15
    i32 5, label %18
    i32 6, label %21
    i32 7, label %22
    i32 8, label %26
    i32 9, label %30
    i32 10, label %34
    i32 11, label %35
  ]

loop:                                             ; preds = %34, %30, %26, %22, %21, %18, %15, %11, %10, %6, %5
  br label %switch
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
  store i32 14, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %41 = load i32, ptr %7, align 4
  store i32 %41, ptr %3, align 4
  store i32 15, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  %43 = load i32, ptr %7, align 4
  %44 = mul nsw i32 %43, 2
  store i32 %44, ptr %3, align 4
  store i32 15, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load i32, ptr %3, align 4
  ret i32 %46

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
    i32 13, label %40
    i32 14, label %42
    i32 15, label %45
  ]

loop:                                             ; preds = %42, %40, %39, %35, %34, %33, %31, %29, %24, %23, %21, %19, %14, %9, %8
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %3, align 4
  %10 = zext i32 %9 to i64
  %11 = call ptr @llvm.stacksave()
  store ptr %11, ptr %5, align 8
  %12 = alloca i32, i64 %10, align 16
  store ptr %12, ptr %.reg2mem, align 8
  store i64 %10, ptr %6, align 8
  store i32 1, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = icmp sle i32 %14, 0
  %16 = select i1 %15, i32 2, i32 3
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
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
  store i32 7, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %27 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %28 = load i32, ptr %27, align 16
  %29 = add nsw i32 %28, 10
  store i32 %29, ptr %27, align 16
  store i32 8, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 10
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %33 = getelementptr inbounds i32, ptr %.reload3, i64 1
  store i32 %32, ptr %33, align 4
  store i32 8, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %35 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %36 = load i32, ptr %35, align 16
  %37 = icmp sgt i32 %36, 0
  %38 = select i1 %37, i32 9, i32 10
  store i32 %38, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %41 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %42 = load i32, ptr %41, align 16
  %43 = sub nsw i32 %42, 1
  store i32 %43, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %45 = getelementptr inbounds i32, ptr %.reload, i64 0
  %46 = load i32, ptr %45, align 16
  store i32 %46, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %loop

47:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %loop

48:                                               ; preds = %switch
  %49 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %49)
  %50 = load i32, ptr %2, align 4
  ret i32 %50

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %8
    i32 1, label %13
    i32 2, label %17
    i32 3, label %18
    i32 4, label %21
    i32 5, label %25
    i32 6, label %26
    i32 7, label %30
    i32 8, label %34
    i32 9, label %39
    i32 10, label %40
    i32 11, label %44
    i32 12, label %47
    i32 13, label %48
  ]

loop:                                             ; preds = %47, %44, %40, %39, %34, %30, %26, %25, %21, %18, %17, %13, %8
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = zext i32 %10 to i64
  %12 = call ptr @llvm.stacksave()
  store ptr %12, ptr %5, align 8
  %13 = alloca i32, i64 %11, align 16
  store ptr %13, ptr %.reg2mem, align 8
  store i64 %11, ptr %6, align 8
  store i32 1, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = icmp sle i32 %15, 0
  %17 = select i1 %16, i32 2, i32 3
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  store ptr %.reload, ptr %7, align 8
  %20 = load i32, ptr %4, align 4
  %21 = load ptr, ptr %7, align 8
  store i32 %20, ptr %21, align 4
  store i32 4, ptr %b, align 4
  br label %loop

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = icmp sgt i32 %23, 2
  %25 = select i1 %24, i32 5, i32 6
  store i32 %25, ptr %b, align 4
  br label %loop

26:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load ptr, ptr %7, align 8
  %29 = getelementptr inbounds i32, ptr %28, i64 0
  %30 = load i32, ptr %29, align 4
  store i32 %30, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, 1
  %34 = load ptr, ptr %7, align 8
  %35 = getelementptr inbounds i32, ptr %34, i64 1
  store i32 %33, ptr %35, align 4
  store i32 8, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  %37 = load ptr, ptr %7, align 8
  %38 = getelementptr inbounds i32, ptr %37, i64 1
  %39 = load i32, ptr %38, align 4
  %40 = icmp sgt i32 %39, 0
  %41 = select i1 %40, i32 9, i32 10
  store i32 %41, ptr %b, align 4
  br label %loop

42:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load ptr, ptr %7, align 8
  %45 = getelementptr inbounds i32, ptr %44, i64 0
  %46 = load i32, ptr %45, align 4
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds i32, ptr %47, i64 1
  %49 = load i32, ptr %48, align 4
  %50 = sub nsw i32 %46, %49
  store i32 %50, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %loop

51:                                               ; preds = %switch
  %52 = load ptr, ptr %7, align 8
  %53 = getelementptr inbounds i32, ptr %52, i64 1
  %54 = load i32, ptr %53, align 4
  %55 = load ptr, ptr %7, align 8
  %56 = getelementptr inbounds i32, ptr %55, i64 0
  %57 = load i32, ptr %56, align 4
  %58 = add nsw i32 %54, %57
  store i32 %58, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %loop

59:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %61)
  %62 = load i32, ptr %2, align 4
  ret i32 %62

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %14
    i32 2, label %18
    i32 3, label %19
    i32 4, label %22
    i32 5, label %26
    i32 6, label %27
    i32 7, label %31
    i32 8, label %36
    i32 9, label %42
    i32 10, label %43
    i32 11, label %51
    i32 12, label %59
    i32 13, label %60
  ]

loop:                                             ; preds = %59, %51, %43, %42, %36, %31, %27, %26, %22, %19, %18, %14, %9
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

10:                                               ; preds = %switch
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
  store i32 1, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = icmp sle i32 %16, 0
  %18 = select i1 %17, i32 2, i32 3
  store i32 %18, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
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
  store i32 8, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %36 = getelementptr inbounds i32, ptr %.reload5, i64 0
  %37 = load i32, ptr %36, align 16
  %38 = sub nsw i32 %37, 5
  store i32 %38, ptr %36, align 16
  store i32 9, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %40 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %41 = load i32, ptr %40, align 16
  %42 = mul nsw i32 %41, 2
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %43 = getelementptr inbounds i32, ptr %.reload3, i64 1
  store i32 %42, ptr %43, align 4
  store i32 9, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %45 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %46 = load i32, ptr %45, align 16
  %47 = icmp sgt i32 %46, 10
  %48 = select i1 %47, i32 11, i32 10
  store i32 %48, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  %50 = load i32, ptr %6, align 4
  %51 = icmp eq i32 %50, 0
  %52 = select i1 %51, i32 11, i32 12
  store i32 %52, ptr %b, align 4
  br label %loop

53:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %loop

54:                                               ; preds = %switch
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %55 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %56 = load i32, ptr %55, align 16
  %57 = load i32, ptr %5, align 4
  %58 = add nsw i32 %56, %57
  store i32 %58, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 15, ptr %b, align 4
  br label %loop

59:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %60 = getelementptr inbounds i32, ptr %.reload, i64 0
  %61 = load i32, ptr %60, align 16
  store i32 %61, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 15, ptr %b, align 4
  br label %loop

62:                                               ; preds = %switch
  store i32 -100, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 15, ptr %b, align 4
  br label %loop

63:                                               ; preds = %switch
  %64 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %64)
  %65 = load i32, ptr %3, align 4
  ret i32 %65

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b8 = load i32, ptr %b, align 4
  switch i32 %b8, label %default [
    i32 0, label %10
    i32 1, label %15
    i32 2, label %19
    i32 3, label %20
    i32 4, label %25
    i32 5, label %29
    i32 6, label %34
    i32 7, label %35
    i32 8, label %39
    i32 9, label %44
    i32 10, label %49
    i32 11, label %53
    i32 12, label %54
    i32 13, label %59
    i32 14, label %62
    i32 15, label %63
  ]

loop:                                             ; preds = %62, %59, %54, %53, %49, %44, %39, %35, %34, %29, %25, %20, %19, %15, %10
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_62_malloc_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 13, ptr %b, align 4
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
  store i32 12, ptr %b, align 4
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
  store i32 10, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 0
  %37 = load i32, ptr %36, align 4
  %38 = sub nsw i32 %37, 2
  store i32 %38, ptr %36, align 4
  store i32 11, ptr %b, align 4
  br label %loop

39:                                               ; preds = %switch
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds i32, ptr %40, i64 0
  %42 = load i32, ptr %41, align 4
  %43 = mul nsw i32 %42, 2
  store i32 %43, ptr %41, align 4
  store i32 11, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds i32, ptr %45, i64 0
  %47 = load i32, ptr %46, align 4
  store i32 %47, ptr %6, align 4
  %48 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %48) #7
  %49 = load i32, ptr %6, align 4
  store i32 %49, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

50:                                               ; preds = %switch
  store i32 -2, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

51:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 14, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = load i32, ptr %2, align 4
  ret i32 %53

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
    i32 9, label %34
    i32 10, label %39
    i32 11, label %44
    i32 12, label %50
    i32 13, label %51
    i32 14, label %52
  ]

loop:                                             ; preds = %51, %50, %44, %39, %34, %33, %27, %23, %22, %18, %13, %12, %8, %7
  br label %switch
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
  store i32 16, ptr %b, align 4
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
  store i32 15, ptr %b, align 4
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
  %32 = select i1 %31, i32 8, i32 9
  store i32 %32, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 0
  %37 = load i32, ptr %36, align 4
  %38 = sub nsw i32 0, %37
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds i32, ptr %39, i64 0
  store i32 %38, ptr %40, align 4
  store i32 14, ptr %b, align 4
  br label %loop

41:                                               ; preds = %switch
  %42 = load i32, ptr %6, align 4
  %43 = icmp sgt i32 %42, 0
  %44 = select i1 %43, i32 11, i32 12
  store i32 %44, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %loop

46:                                               ; preds = %switch
  %47 = load i32, ptr %6, align 4
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds i32, ptr %48, i64 0
  %50 = load i32, ptr %49, align 4
  %51 = sub nsw i32 %50, %47
  store i32 %51, ptr %49, align 4
  store i32 14, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  %53 = load i32, ptr %6, align 4
  %54 = load ptr, ptr %7, align 8
  %55 = getelementptr inbounds i32, ptr %54, i64 0
  %56 = load i32, ptr %55, align 4
  %57 = add nsw i32 %56, %53
  store i32 %57, ptr %55, align 4
  store i32 14, ptr %b, align 4
  br label %loop

58:                                               ; preds = %switch
  %59 = load ptr, ptr %7, align 8
  %60 = getelementptr inbounds i32, ptr %59, i64 0
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %8, align 4
  %62 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %62) #7
  %63 = load i32, ptr %8, align 4
  store i32 %63, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %loop

64:                                               ; preds = %switch
  store i32 -2, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %loop

65:                                               ; preds = %switch
  store i32 -1, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %loop

66:                                               ; preds = %switch
  %67 = load i32, ptr %3, align 4
  ret i32 %67

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
    i32 9, label %34
    i32 10, label %41
    i32 11, label %45
    i32 12, label %46
    i32 13, label %52
    i32 14, label %58
    i32 15, label %64
    i32 16, label %65
    i32 17, label %66
  ]

loop:                                             ; preds = %65, %64, %58, %52, %46, %45, %41, %34, %33, %29, %25, %24, %20, %15, %14, %10, %9
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_64_void_goto(i32 noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %1, align 4
  %11 = load i32, ptr @g_void_result, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %13
  ]

loop:                                             ; preds = %9, %8, %7, %3, %2
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_65_void_goto_else(i32 noundef %0) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

8:                                                ; preds = %switch
  %9 = load i32, ptr %1, align 4
  %10 = load i32, ptr @g_void_result, align 4
  %11 = sub nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %loop

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  %14 = mul nsw i32 %13, 2
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %7
    i32 3, label %8
    i32 4, label %12
    i32 5, label %17
  ]

loop:                                             ; preds = %12, %8, %7, %3, %2
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_66_void_nested(i32 noundef %0, i32 noundef %1) #0 {
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
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr @g_void_result, align 4
  %13 = sub nsw i32 %12, %11
  store i32 %13, ptr @g_void_result, align 4
  store i32 8, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 5, i32 6
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = load i32, ptr %3, align 4
  %22 = sub nsw i32 %20, %21
  %23 = load i32, ptr @g_void_result, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr @g_void_result, align 4
  store i32 8, ptr %b, align 4
  br label %loop

25:                                               ; preds = %switch
  %26 = load i32, ptr %2, align 4
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr @g_void_result, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr @g_void_result, align 4
  store i32 8, ptr %b, align 4
  br label %loop

31:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %10
    i32 4, label %14
    i32 5, label %18
    i32 6, label %19
    i32 7, label %25
    i32 8, label %31
  ]

loop:                                             ; preds = %25, %19, %18, %14, %10, %9, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_complex(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  store i32 6, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr @g_void_result, align 4
  %27 = sub nsw i32 %26, %25
  store i32 %27, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, ptr @g_void_result, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
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
    i32 5, label %20
    i32 6, label %28
    i32 7, label %36
  ]

loop:                                             ; preds = %28, %20, %19, %15, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_global_only() #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_z, align 4
  %11 = load i32, ptr @g_void_result, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_x, align 4
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %4
    i32 2, label %8
    i32 3, label %9
    i32 4, label %13
    i32 5, label %17
  ]

loop:                                             ; preds = %13, %9, %8, %4, %0
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_69_void_pointer(ptr noundef %0, i32 noundef %1) #0 {
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
  store i32 4, ptr %b, align 4
  br label %loop

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = sub nsw i32 %11, 2
  %13 = load ptr, ptr %2, align 8
  store i32 %12, ptr %13, align 4
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = mul nsw i32 %15, 2
  %17 = load ptr, ptr %2, align 8
  store i32 %16, ptr %17, align 4
  store i32 5, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load ptr, ptr %2, align 8
  %20 = load i32, ptr %19, align 4
  %21 = load i32, ptr @g_void_result, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr @g_void_result, align 4
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %10
    i32 4, label %14
    i32 5, label %18
  ]

loop:                                             ; preds = %14, %10, %9, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_70_void_array(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 5, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %2, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %18
  store i32 %16, ptr %19, align 4
  store i32 6, ptr %b, align 4
  br label %loop

20:                                               ; preds = %switch
  %21 = load i32, ptr %2, align 4
  %22 = icmp sge i32 %21, 0
  %23 = select i1 %22, i32 7, i32 9
  store i32 %23, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  %26 = icmp slt i32 %25, 8
  %27 = select i1 %26, i32 8, i32 9
  store i32 %27, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

29:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %2, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr @g_void_result, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr @g_void_result, align 4
  store i32 11, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
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
    i32 4, label %14
    i32 5, label %15
    i32 6, label %20
    i32 7, label %24
    i32 8, label %28
    i32 9, label %29
    i32 10, label %30
    i32 11, label %37
  ]

loop:                                             ; preds = %30, %29, %28, %24, %20, %15, %14, %13, %9, %5, %4
  br label %switch
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
  %16 = select i1 %15, i32 2, i32 3
  store i32 %16, ptr %b, align 4
  br label %loop

17:                                               ; preds = %switch
  store i32 15, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %8, align 4
  %21 = icmp eq i32 %19, %20
  %22 = select i1 %21, i32 4, i32 5
  store i32 %22, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

24:                                               ; preds = %switch
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %9, align 4
  %27 = sub nsw i32 %26, %25
  store i32 %27, ptr %9, align 4
  store i32 6, ptr %b, align 4
  br label %loop

28:                                               ; preds = %switch
  %29 = load i32, ptr %7, align 4
  %30 = load i32, ptr %8, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr @g_x, align 4
  %33 = add nsw i32 %32, 1
  %34 = icmp sgt i32 %31, %33
  %35 = select i1 %34, i32 7, i32 8
  store i32 %35, ptr %b, align 4
  br label %loop

36:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %9, align 4
  %39 = sdiv i32 %38, 2
  store i32 %39, ptr %4, align 4
  store i32 29, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %41 = load i32, ptr %9, align 4
  %42 = mul nsw i32 %41, 2
  store i32 %42, ptr %4, align 4
  store i32 29, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  %44 = load i32, ptr @g_z, align 4
  %45 = load i32, ptr %9, align 4
  %46 = add nsw i32 %45, %44
  store i32 %46, ptr %9, align 4
  store i32 11, ptr %b, align 4
  br label %loop

47:                                               ; preds = %switch
  %48 = load ptr, ptr %5, align 8
  %49 = load i32, ptr %48, align 4
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i32 12, i32 13
  store i32 %51, ptr %b, align 4
  br label %loop

52:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

53:                                               ; preds = %switch
  %54 = load i32, ptr %9, align 4
  %55 = load ptr, ptr %5, align 8
  %56 = load i32, ptr %55, align 4
  %57 = add nsw i32 %54, %56
  store i32 %57, ptr %4, align 4
  store i32 29, ptr %b, align 4
  br label %loop

58:                                               ; preds = %switch
  %59 = load i32, ptr %9, align 4
  store i32 %59, ptr %4, align 4
  store i32 29, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load i32, ptr %7, align 4
  %62 = load i32, ptr %9, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %9, align 4
  store i32 16, ptr %b, align 4
  br label %loop

64:                                               ; preds = %switch
  %65 = load i32, ptr %6, align 4
  %66 = icmp sge i32 %65, 0
  %67 = select i1 %66, i32 17, i32 19
  store i32 %67, ptr %b, align 4
  br label %loop

68:                                               ; preds = %switch
  %69 = load i32, ptr %6, align 4
  %70 = icmp slt i32 %69, 8
  %71 = select i1 %70, i32 18, i32 19
  store i32 %71, ptr %b, align 4
  br label %loop

72:                                               ; preds = %switch
  store i32 20, ptr %b, align 4
  br label %loop

73:                                               ; preds = %switch
  %74 = load i32, ptr %9, align 4
  %75 = add nsw i32 %74, 100
  store i32 %75, ptr %9, align 4
  %76 = load i32, ptr %9, align 4
  store i32 %76, ptr %4, align 4
  store i32 29, ptr %b, align 4
  br label %loop

77:                                               ; preds = %switch
  %78 = load i32, ptr %6, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = icmp sgt i32 %81, 0
  %83 = select i1 %82, i32 21, i32 22
  store i32 %83, ptr %b, align 4
  br label %loop

84:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %loop

85:                                               ; preds = %switch
  %86 = load i32, ptr %6, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = load i32, ptr %9, align 4
  %91 = sub nsw i32 %90, %89
  store i32 %91, ptr %9, align 4
  %92 = load i32, ptr %9, align 4
  store i32 %92, ptr %4, align 4
  store i32 29, ptr %b, align 4
  br label %loop

93:                                               ; preds = %switch
  %94 = load i32, ptr %6, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %95
  %97 = load i32, ptr %96, align 4
  %98 = load i32, ptr %9, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, ptr %9, align 4
  store i32 24, ptr %b, align 4
  br label %loop

100:                                              ; preds = %switch
  %101 = load ptr, ptr %5, align 8
  %102 = load i32, ptr %101, align 4
  %103 = icmp sgt i32 %102, 0
  %104 = select i1 %103, i32 26, i32 25
  store i32 %104, ptr %b, align 4
  br label %loop

105:                                              ; preds = %switch
  %106 = load i32, ptr @g_y, align 4
  %107 = icmp slt i32 %106, 0
  %108 = select i1 %107, i32 26, i32 27
  store i32 %108, ptr %b, align 4
  br label %loop

109:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %loop

110:                                              ; preds = %switch
  %111 = load i32, ptr %9, align 4
  %112 = load ptr, ptr %5, align 8
  %113 = load i32, ptr %112, align 4
  %114 = sub nsw i32 %111, %113
  store i32 %114, ptr %4, align 4
  store i32 29, ptr %b, align 4
  br label %loop

115:                                              ; preds = %switch
  %116 = load i32, ptr %9, align 4
  %117 = load ptr, ptr %5, align 8
  %118 = load i32, ptr %117, align 4
  %119 = add nsw i32 %116, %118
  store i32 %119, ptr %4, align 4
  store i32 29, ptr %b, align 4
  br label %loop

120:                                              ; preds = %switch
  %121 = load i32, ptr %4, align 4
  ret i32 %121

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %10
    i32 1, label %12
    i32 2, label %17
    i32 3, label %18
    i32 4, label %23
    i32 5, label %24
    i32 6, label %28
    i32 7, label %36
    i32 8, label %37
    i32 9, label %40
    i32 10, label %43
    i32 11, label %47
    i32 12, label %52
    i32 13, label %53
    i32 14, label %58
    i32 15, label %60
    i32 16, label %64
    i32 17, label %68
    i32 18, label %72
    i32 19, label %73
    i32 20, label %77
    i32 21, label %84
    i32 22, label %85
    i32 23, label %93
    i32 24, label %100
    i32 25, label %105
    i32 26, label %109
    i32 27, label %110
    i32 28, label %115
    i32 29, label %120
  ]

loop:                                             ; preds = %115, %110, %109, %105, %100, %93, %85, %84, %77, %73, %72, %68, %64, %60, %58, %53, %52, %47, %43, %40, %37, %36, %28, %24, %23, %18, %17, %12, %10
  br label %switch
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
  %13 = select i1 %12, i32 2, i32 4
  store i32 %13, ptr %b, align 4
  br label %loop

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 3, i32 4
  store i32 %17, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %5, align 4
  %22 = sub nsw i32 %20, %21
  store i32 %22, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %loop

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 7, i32 6
  store i32 %26, ptr %b, align 4
  br label %loop

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp eq i32 %28, %29
  %31 = select i1 %30, i32 7, i32 8
  store i32 %31, ptr %b, align 4
  br label %loop

32:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %loop

33:                                               ; preds = %switch
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %6, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %8, align 4
  store i32 15, ptr %b, align 4
  br label %loop

37:                                               ; preds = %switch
  %38 = load i32, ptr %7, align 4
  %39 = mul nsw i32 %38, 2
  store i32 %39, ptr %8, align 4
  store i32 15, ptr %b, align 4
  br label %loop

40:                                               ; preds = %switch
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %5, align 4
  %43 = add nsw i32 %41, %42
  store i32 %43, ptr %7, align 4
  store i32 11, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  %45 = load i32, ptr %6, align 4
  %46 = icmp sgt i32 %45, 0
  %47 = select i1 %46, i32 12, i32 13
  store i32 %47, ptr %b, align 4
  br label %loop

48:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

49:                                               ; preds = %switch
  %50 = load i32, ptr %6, align 4
  %51 = load i32, ptr %7, align 4
  %52 = sub nsw i32 %50, %51
  store i32 %52, ptr %8, align 4
  store i32 15, ptr %b, align 4
  br label %loop

53:                                               ; preds = %switch
  %54 = load i32, ptr %6, align 4
  %55 = load i32, ptr %7, align 4
  %56 = add nsw i32 %54, %55
  store i32 %56, ptr %8, align 4
  store i32 15, ptr %b, align 4
  br label %loop

57:                                               ; preds = %switch
  %58 = load i32, ptr %8, align 4
  %59 = icmp sgt i32 %58, 20
  %60 = select i1 %59, i32 16, i32 17
  store i32 %60, ptr %b, align 4
  br label %loop

61:                                               ; preds = %switch
  store i32 20, ptr %b, align 4
  br label %loop

62:                                               ; preds = %switch
  %63 = load i32, ptr %8, align 4
  %64 = icmp sgt i32 %63, 10
  %65 = select i1 %64, i32 18, i32 19
  store i32 %65, ptr %b, align 4
  br label %loop

66:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %loop

67:                                               ; preds = %switch
  %68 = load i32, ptr %8, align 4
  %69 = add nsw i32 %68, 3
  store i32 %69, ptr %3, align 4
  store i32 22, ptr %b, align 4
  br label %loop

70:                                               ; preds = %switch
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %3, align 4
  store i32 22, ptr %b, align 4
  br label %loop

73:                                               ; preds = %switch
  %74 = load i32, ptr %8, align 4
  %75 = add nsw i32 %74, 2
  store i32 %75, ptr %3, align 4
  store i32 22, ptr %b, align 4
  br label %loop

76:                                               ; preds = %switch
  %77 = load i32, ptr %3, align 4
  ret i32 %77

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %18
    i32 4, label %19
    i32 5, label %23
    i32 6, label %27
    i32 7, label %32
    i32 8, label %33
    i32 9, label %37
    i32 10, label %40
    i32 11, label %44
    i32 12, label %48
    i32 13, label %49
    i32 14, label %53
    i32 15, label %57
    i32 16, label %61
    i32 17, label %62
    i32 18, label %66
    i32 19, label %67
    i32 20, label %70
    i32 21, label %73
    i32 22, label %76
  ]

loop:                                             ; preds = %73, %70, %67, %66, %62, %61, %57, %53, %49, %48, %44, %40, %37, %33, %32, %27, %23, %19, %18, %14, %10, %9
  br label %switch
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
  %29 = select i1 %28, i32 4, i32 6
  store i32 %29, ptr %b, align 4
  br label %loop

30:                                               ; preds = %switch
  %31 = load i32, ptr %8, align 4
  %32 = icmp ne i32 %31, 0
  %33 = select i1 %32, i32 5, i32 6
  store i32 %33, ptr %b, align 4
  br label %loop

34:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %loop

35:                                               ; preds = %switch
  %36 = load i32, ptr %11, align 4
  %37 = sub nsw i32 %36, 10
  store i32 %37, ptr %11, align 4
  store i32 7, ptr %b, align 4
  br label %loop

38:                                               ; preds = %switch
  %39 = load i32, ptr %11, align 4
  %40 = load i32, ptr @g_z, align 4
  %41 = icmp sgt i32 %39, %40
  %42 = select i1 %41, i32 8, i32 9
  store i32 %42, ptr %b, align 4
  br label %loop

43:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %loop

44:                                               ; preds = %switch
  store i32 32, ptr %b, align 4
  br label %loop

45:                                               ; preds = %switch
  %46 = load i32, ptr %8, align 4
  %47 = load i32, ptr %9, align 4
  %48 = load i32, ptr %10, align 4
  %49 = sdiv i32 %48, 10
  %50 = load i32, ptr %8, align 4
  %51 = sub nsw i32 %50, 1
  %52 = mul nsw i32 %49, %51
  %53 = add nsw i32 %47, %52
  %54 = icmp eq i32 %46, %53
  %55 = select i1 %54, i32 11, i32 12
  store i32 %55, ptr %b, align 4
  br label %loop

56:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %loop

57:                                               ; preds = %switch
  %58 = load i32, ptr %11, align 4
  %59 = add nsw i32 %58, 200
  store i32 %59, ptr %5, align 4
  store i32 36, ptr %b, align 4
  br label %loop

60:                                               ; preds = %switch
  %61 = load i32, ptr %11, align 4
  %62 = add nsw i32 %61, 100
  store i32 %62, ptr %5, align 4
  store i32 36, ptr %b, align 4
  br label %loop

63:                                               ; preds = %switch
  %64 = load i32, ptr %11, align 4
  %65 = add nsw i32 %64, 10
  store i32 %65, ptr %11, align 4
  store i32 15, ptr %b, align 4
  br label %loop

66:                                               ; preds = %switch
  %67 = load i32, ptr %7, align 4
  %68 = icmp sge i32 %67, 0
  %69 = select i1 %68, i32 16, i32 18
  store i32 %69, ptr %b, align 4
  br label %loop

70:                                               ; preds = %switch
  %71 = load i32, ptr %7, align 4
  %72 = icmp slt i32 %71, 8
  %73 = select i1 %72, i32 17, i32 18
  store i32 %73, ptr %b, align 4
  br label %loop

74:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %loop

75:                                               ; preds = %switch
  %76 = load i32, ptr %11, align 4
  %77 = sub nsw i32 %76, 20
  store i32 %77, ptr %11, align 4
  store i32 32, ptr %b, align 4
  br label %loop

78:                                               ; preds = %switch
  %79 = load i32, ptr %7, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = load i32, ptr %11, align 4
  %84 = icmp sgt i32 %82, %83
  %85 = select i1 %84, i32 20, i32 21
  store i32 %85, ptr %b, align 4
  br label %loop

86:                                               ; preds = %switch
  store i32 27, ptr %b, align 4
  br label %loop

87:                                               ; preds = %switch
  %88 = load i32, ptr %7, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = load i32, ptr %11, align 4
  %93 = sub nsw i32 %92, %91
  store i32 %93, ptr %11, align 4
  store i32 22, ptr %b, align 4
  br label %loop

94:                                               ; preds = %switch
  %95 = load i32, ptr %7, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %96
  %98 = load i32, ptr %97, align 4
  %99 = icmp eq i32 %98, 0
  %100 = select i1 %99, i32 24, i32 23
  store i32 %100, ptr %b, align 4
  br label %loop

101:                                              ; preds = %switch
  %102 = load ptr, ptr %6, align 8
  %103 = load i32, ptr %102, align 4
  %104 = icmp eq i32 %103, 0
  %105 = select i1 %104, i32 24, i32 25
  store i32 %105, ptr %b, align 4
  br label %loop

106:                                              ; preds = %switch
  store i32 26, ptr %b, align 4
  br label %loop

107:                                              ; preds = %switch
  store i32 32, ptr %b, align 4
  br label %loop

108:                                              ; preds = %switch
  %109 = load i32, ptr %11, align 4
  %110 = add nsw i32 %109, 50
  store i32 %110, ptr %11, align 4
  store i32 32, ptr %b, align 4
  br label %loop

111:                                              ; preds = %switch
  %112 = load i32, ptr %7, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %113
  %115 = load i32, ptr %114, align 4
  %116 = load i32, ptr %11, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, ptr %11, align 4
  store i32 28, ptr %b, align 4
  br label %loop

118:                                              ; preds = %switch
  %119 = load ptr, ptr %6, align 8
  %120 = load i32, ptr %119, align 4
  %121 = icmp sgt i32 %120, 0
  %122 = select i1 %121, i32 29, i32 30
  store i32 %122, ptr %b, align 4
  br label %loop

123:                                              ; preds = %switch
  store i32 31, ptr %b, align 4
  br label %loop

124:                                              ; preds = %switch
  %125 = load ptr, ptr %6, align 8
  %126 = load i32, ptr %125, align 4
  %127 = load i32, ptr %11, align 4
  %128 = sub nsw i32 %127, %126
  store i32 %128, ptr %11, align 4
  store i32 32, ptr %b, align 4
  br label %loop

129:                                              ; preds = %switch
  %130 = load ptr, ptr %6, align 8
  %131 = load i32, ptr %130, align 4
  %132 = load i32, ptr %11, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, ptr %11, align 4
  store i32 32, ptr %b, align 4
  br label %loop

134:                                              ; preds = %switch
  %135 = load i32, ptr %11, align 4
  %136 = icmp sgt i32 %135, 0
  %137 = select i1 %136, i32 33, i32 34
  store i32 %137, ptr %b, align 4
  br label %loop

138:                                              ; preds = %switch
  %139 = load i32, ptr %11, align 4
  %140 = mul nsw i32 %139, 2
  store i32 %140, ptr %.reg2mem, align 4
  store i32 35, ptr %b, align 4
  br label %loop

141:                                              ; preds = %switch
  %142 = load i32, ptr %11, align 4
  %143 = sub nsw i32 0, %142
  store i32 %143, ptr %.reg2mem, align 4
  store i32 35, ptr %b, align 4
  br label %loop

144:                                              ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 36, ptr %b, align 4
  br label %loop

145:                                              ; preds = %switch
  %146 = load i32, ptr %5, align 4
  ret i32 %146

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
    i32 6, label %35
    i32 7, label %38
    i32 8, label %43
    i32 9, label %44
    i32 10, label %45
    i32 11, label %56
    i32 12, label %57
    i32 13, label %60
    i32 14, label %63
    i32 15, label %66
    i32 16, label %70
    i32 17, label %74
    i32 18, label %75
    i32 19, label %78
    i32 20, label %86
    i32 21, label %87
    i32 22, label %94
    i32 23, label %101
    i32 24, label %106
    i32 25, label %107
    i32 26, label %108
    i32 27, label %111
    i32 28, label %118
    i32 29, label %123
    i32 30, label %124
    i32 31, label %129
    i32 32, label %134
    i32 33, label %138
    i32 34, label %141
    i32 35, label %144
    i32 36, label %145
  ]

loop:                                             ; preds = %144, %141, %138, %134, %129, %124, %123, %118, %111, %108, %107, %106, %101, %94, %87, %86, %78, %75, %74, %70, %66, %63, %60, %57, %56, %45, %44, %43, %38, %35, %34, %30, %25, %21, %16, %12
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %b, align 4
  br label %loop

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 1
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %loop

13:                                               ; preds = %switch
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @atoi(ptr noundef %16) #8
  store i32 %17, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %loop

18:                                               ; preds = %switch
  store i32 4, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %loop

19:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %20 = load i32, ptr %5, align 4
  %21 = call i32 @_00_goto_only(i32 noundef %20)
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %6, align 4
  %24 = load i32, ptr %5, align 4
  %25 = call i32 @_01_goto_two_labels(i32 noundef %24)
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  %28 = load i32, ptr %5, align 4
  %29 = call i32 @_02_goto_surrounding_code(i32 noundef %28)
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  %32 = load i32, ptr %5, align 4
  %33 = call i32 @_03_goto_skip_block(i32 noundef %32)
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %6, align 4
  %36 = load i32, ptr %5, align 4
  %37 = call i32 @_04_goto_equal(i32 noundef %36, i32 noundef 4)
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %6, align 4
  %40 = load i32, ptr %5, align 4
  %41 = call i32 @_05_goto_not_equal(i32 noundef %40, i32 noundef 4)
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %6, align 4
  %44 = load i32, ptr %5, align 4
  %45 = call i32 @_06_relational(i32 noundef %44, i32 noundef 4)
  %46 = load i32, ptr %6, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %6, align 4
  %48 = load i32, ptr %5, align 4
  %49 = icmp sgt i32 %48, 0
  %50 = load i32, ptr %5, align 4
  %51 = call i32 @_07_boolean_argument(i1 noundef zeroext %49, i32 noundef %50)
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, ptr %6, align 4
  %54 = load i32, ptr %5, align 4
  %55 = call i32 @_08_goto_chain(i32 noundef %54)
  %56 = load i32, ptr %6, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %6, align 4
  %58 = load i32, ptr %5, align 4
  %59 = call i32 @_09_multiple_levels(i32 noundef %58)
  %60 = load i32, ptr %6, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, ptr %6, align 4
  %62 = load i32, ptr %5, align 4
  %63 = call i32 @_10_goto_expressions(i32 noundef %62, i32 noundef 4)
  %64 = load i32, ptr %6, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %6, align 4
  %66 = load i32, ptr %5, align 4
  %67 = call i32 @_11_and(i32 noundef %66, i32 noundef 3)
  %68 = load i32, ptr %6, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %6, align 4
  %70 = load i32, ptr %5, align 4
  %71 = call i32 @_12_or(i32 noundef %70, i32 noundef -3)
  %72 = load i32, ptr %6, align 4
  %73 = add nsw i32 %72, %71
  store i32 %73, ptr %6, align 4
  %74 = load i32, ptr %5, align 4
  %75 = call i32 @_13_and_or(i32 noundef %74, i32 noundef 2, i32 noundef -1)
  %76 = load i32, ptr %6, align 4
  %77 = add nsw i32 %76, %75
  store i32 %77, ptr %6, align 4
  %78 = load i32, ptr %5, align 4
  %79 = call i32 @_14_or_and(i32 noundef %78, i32 noundef 0, i32 noundef 20)
  %80 = load i32, ptr %6, align 4
  %81 = add nsw i32 %80, %79
  store i32 %81, ptr %6, align 4
  %82 = load i32, ptr %5, align 4
  %83 = call i32 @_15_complex_boolean(i32 noundef %82, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %84 = load i32, ptr %6, align 4
  %85 = add nsw i32 %84, %83
  store i32 %85, ptr %6, align 4
  %86 = load i32, ptr %5, align 4
  %87 = call i32 @_16_nested_arithmetic_condition(i32 noundef %86, i32 noundef 1, i32 noundef 20)
  %88 = load i32, ptr %6, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, ptr %6, align 4
  %90 = load i32, ptr %5, align 4
  %91 = call i32 @_17_deep_parentheses(i32 noundef %90, i32 noundef 2, i32 noundef 3)
  %92 = load i32, ptr %6, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, ptr %6, align 4
  %94 = load i32, ptr %5, align 4
  %95 = call i32 @_18_arithmetic_boolean(i32 noundef %94, i32 noundef 2, i32 noundef 5)
  %96 = load i32, ptr %6, align 4
  %97 = add nsw i32 %96, %95
  store i32 %97, ptr %6, align 4
  %98 = load i32, ptr %5, align 4
  %99 = call i32 @_19_nested_boolean_parentheses(i32 noundef %98, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %100 = load i32, ptr %6, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, ptr %6, align 4
  %102 = load i32, ptr %5, align 4
  %103 = call i32 @_20_nested_goto(i32 noundef %102, i32 noundef 3)
  %104 = load i32, ptr %6, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, ptr %6, align 4
  %106 = load i32, ptr %5, align 4
  %107 = call i32 @_21_nested_in_else(i32 noundef %106, i32 noundef 3)
  %108 = load i32, ptr %6, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %6, align 4
  %110 = load i32, ptr %5, align 4
  %111 = call i32 @_22_nested_goto_else(i32 noundef %110, i32 noundef 3, i32 noundef 5)
  %112 = load i32, ptr %6, align 4
  %113 = add nsw i32 %112, %111
  store i32 %113, ptr %6, align 4
  %114 = load i32, ptr %5, align 4
  %115 = call i32 @_23_three_level_nesting(i32 noundef %114, i32 noundef 3, i32 noundef 5)
  %116 = load i32, ptr %6, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, ptr %6, align 4
  %118 = load i32, ptr %5, align 4
  %119 = call i32 @_24_deep_nested_values(i32 noundef %118, i32 noundef 3, i32 noundef 10)
  %120 = load i32, ptr %6, align 4
  %121 = add nsw i32 %120, %119
  store i32 %121, ptr %6, align 4
  %122 = load i32, ptr %5, align 4
  %123 = call i32 @_25_nested_and(i32 noundef %122, i32 noundef 3, i32 noundef 5)
  %124 = load i32, ptr %6, align 4
  %125 = add nsw i32 %124, %123
  store i32 %125, ptr %6, align 4
  %126 = load i32, ptr %5, align 4
  %127 = call i32 @_26_nested_or(i32 noundef %126, i32 noundef 0, i32 noundef 20)
  %128 = load i32, ptr %6, align 4
  %129 = add nsw i32 %128, %127
  store i32 %129, ptr %6, align 4
  %130 = load i32, ptr %5, align 4
  %131 = call i32 @_27_nested_complex_boolean(i32 noundef %130, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %132 = load i32, ptr %6, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, ptr %6, align 4
  %134 = load i32, ptr %5, align 4
  %135 = call i32 @_28_independent_gotos(i32 noundef %134)
  %136 = load i32, ptr %6, align 4
  %137 = add nsw i32 %136, %135
  store i32 %137, ptr %6, align 4
  %138 = load i32, ptr %5, align 4
  %139 = call i32 @_29_independent_goto_paths(i32 noundef %138, i32 noundef 3)
  %140 = load i32, ptr %6, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, ptr %6, align 4
  %142 = call i32 @_30_array_condition(i32 noundef 1)
  %143 = load i32, ptr %6, align 4
  %144 = add nsw i32 %143, %142
  store i32 %144, ptr %6, align 4
  %145 = call i32 @_31_array_branches(i32 noundef 2)
  %146 = load i32, ptr %6, align 4
  %147 = add nsw i32 %146, %145
  store i32 %147, ptr %6, align 4
  %148 = call i32 @_32_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %149 = load i32, ptr %6, align 4
  %150 = add nsw i32 %149, %148
  store i32 %150, ptr %6, align 4
  %151 = call i32 @_33_matrix_condition(i32 noundef 1, i32 noundef 1)
  %152 = load i32, ptr %6, align 4
  %153 = add nsw i32 %152, %151
  store i32 %153, ptr %6, align 4
  %154 = call i32 @_34_nested_array(i32 noundef 1, i32 noundef 2)
  %155 = load i32, ptr %6, align 4
  %156 = add nsw i32 %155, %154
  store i32 %156, ptr %6, align 4
  %157 = load i32, ptr %5, align 4
  store i32 %157, ptr %7, align 4
  %158 = call i32 @_35_pointer_condition(ptr noundef %7)
  %159 = load i32, ptr %6, align 4
  %160 = add nsw i32 %159, %158
  store i32 %160, ptr %6, align 4
  %161 = call i32 @_36_pointer_branches(ptr noundef %7)
  %162 = load i32, ptr %6, align 4
  %163 = add nsw i32 %162, %161
  store i32 %163, ptr %6, align 4
  %164 = call i32 @_37_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %165 = load i32, ptr %6, align 4
  %166 = add nsw i32 %165, %164
  store i32 %166, ptr %6, align 4
  %167 = call i32 @_38_nested_pointer(ptr noundef %7, i32 noundef 3)
  %168 = load i32, ptr %6, align 4
  %169 = add nsw i32 %168, %167
  store i32 %169, ptr %6, align 4
  %170 = load i32, ptr %5, align 4
  store i32 %170, ptr %7, align 4
  %171 = load i32, ptr %5, align 4
  %172 = call i32 @_39_pointer_write(ptr noundef %7, i32 noundef %171)
  %173 = load i32, ptr %6, align 4
  %174 = add nsw i32 %173, %172
  store i32 %174, ptr %6, align 4
  %175 = load i32, ptr %5, align 4
  store i32 %175, ptr %7, align 4
  %176 = load i32, ptr %5, align 4
  %177 = call i32 @_40_pointer_write_nested(ptr noundef %7, i32 noundef %176, i32 noundef 3)
  %178 = load i32, ptr %6, align 4
  %179 = add nsw i32 %178, %177
  store i32 %179, ptr %6, align 4
  %180 = load i32, ptr %5, align 4
  store i32 %180, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %181 = call i32 @_41_global_only()
  %182 = load i32, ptr %6, align 4
  %183 = add nsw i32 %182, %181
  store i32 %183, ptr %6, align 4
  %184 = call i32 @_42_global_and()
  %185 = load i32, ptr %6, align 4
  %186 = add nsw i32 %185, %184
  store i32 %186, ptr %6, align 4
  %187 = call i32 @_43_global_or()
  %188 = load i32, ptr %6, align 4
  %189 = add nsw i32 %188, %187
  store i32 %189, ptr %6, align 4
  %190 = call i32 @_44_global_nested()
  %191 = load i32, ptr %6, align 4
  %192 = add nsw i32 %191, %190
  store i32 %192, ptr %6, align 4
  %193 = call i32 @_45_global_array_only()
  %194 = load i32, ptr %6, align 4
  %195 = add nsw i32 %194, %193
  store i32 %195, ptr %6, align 4
  %196 = call i32 @_46_global_matrix_only()
  %197 = load i32, ptr %6, align 4
  %198 = add nsw i32 %197, %196
  store i32 %198, ptr %6, align 4
  %199 = load i32, ptr %5, align 4
  %200 = call i32 @_47_multiple_returns(i32 noundef %199)
  %201 = load i32, ptr %6, align 4
  %202 = add nsw i32 %201, %200
  store i32 %202, ptr %6, align 4
  %203 = load i32, ptr %5, align 4
  %204 = call i32 @_48_nested_multiple_returns(i32 noundef %203, i32 noundef 3)
  %205 = load i32, ptr %6, align 4
  %206 = add nsw i32 %205, %204
  store i32 %206, ptr %6, align 4
  %207 = load i32, ptr %5, align 4
  %208 = call i32 @_49_complex_multiple_returns(i32 noundef %207, i32 noundef 3, i32 noundef 5)
  %209 = load i32, ptr %6, align 4
  %210 = add nsw i32 %209, %208
  store i32 %210, ptr %6, align 4
  %211 = load i32, ptr %5, align 4
  %212 = call i32 @_50_prefix_code(i32 noundef %211, i32 noundef 2, i32 noundef 3)
  %213 = load i32, ptr %6, align 4
  %214 = add nsw i32 %213, %212
  store i32 %214, ptr %6, align 4
  %215 = load i32, ptr %5, align 4
  %216 = call i32 @_51_suffix_code(i32 noundef %215, i32 noundef 3)
  %217 = load i32, ptr %6, align 4
  %218 = add nsw i32 %217, %216
  store i32 %218, ptr %6, align 4
  %219 = load i32, ptr %5, align 4
  %220 = call i32 @_52_prefix_nested_suffix(i32 noundef %219, i32 noundef 3, i32 noundef 5)
  %221 = load i32, ptr %6, align 4
  %222 = add nsw i32 %221, %220
  store i32 %222, ptr %6, align 4
  %223 = load i32, ptr %5, align 4
  %224 = call i32 @_53_diamond(i32 noundef %223, i32 noundef 3)
  %225 = load i32, ptr %6, align 4
  %226 = add nsw i32 %225, %224
  store i32 %226, ptr %6, align 4
  %227 = load i32, ptr %5, align 4
  %228 = call i32 @_54_multiple_merge_values(i32 noundef %227, i32 noundef 3)
  %229 = load i32, ptr %6, align 4
  %230 = add nsw i32 %229, %228
  store i32 %230, ptr %6, align 4
  %231 = load i32, ptr %5, align 4
  %232 = call i32 @_55_nested_diamonds(i32 noundef %231, i32 noundef 3, i32 noundef 5)
  %233 = load i32, ptr %6, align 4
  %234 = add nsw i32 %233, %232
  store i32 %234, ptr %6, align 4
  %235 = load i32, ptr %5, align 4
  %236 = call i32 @_56_ternary_before_goto(i32 noundef %235, i32 noundef 3)
  %237 = load i32, ptr %6, align 4
  %238 = add nsw i32 %237, %236
  store i32 %238, ptr %6, align 4
  %239 = load i32, ptr %5, align 4
  %240 = call i32 @_57_ternary_inside_goto(i32 noundef %239, i32 noundef 3)
  %241 = load i32, ptr %6, align 4
  %242 = add nsw i32 %241, %240
  store i32 %242, ptr %6, align 4
  %243 = load i32, ptr %5, align 4
  %244 = call i32 @_58_nested_ternary_goto(i32 noundef %243, i32 noundef 3, i32 noundef 5)
  %245 = load i32, ptr %6, align 4
  %246 = add nsw i32 %245, %244
  store i32 %246, ptr %6, align 4
  %247 = load i32, ptr %5, align 4
  %248 = call i32 @_59_dynamic_alloca(i32 noundef 4, i32 noundef %247)
  %249 = load i32, ptr %6, align 4
  %250 = add nsw i32 %249, %248
  store i32 %250, ptr %6, align 4
  %251 = load i32, ptr %5, align 4
  %252 = call i32 @_60_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %251)
  %253 = load i32, ptr %6, align 4
  %254 = add nsw i32 %253, %252
  store i32 %254, ptr %6, align 4
  %255 = load i32, ptr %5, align 4
  %256 = call i32 @_61_dynamic_alloca_complex(i32 noundef 6, i32 noundef %255, i32 noundef 3)
  %257 = load i32, ptr %6, align 4
  %258 = add nsw i32 %257, %256
  store i32 %258, ptr %6, align 4
  %259 = load i32, ptr %5, align 4
  %260 = call i32 @_62_malloc_goto(i32 noundef 4, i32 noundef %259)
  %261 = load i32, ptr %6, align 4
  %262 = add nsw i32 %261, %260
  store i32 %262, ptr %6, align 4
  %263 = load i32, ptr %5, align 4
  %264 = call i32 @_63_malloc_nested_goto(i32 noundef 4, i32 noundef %263, i32 noundef 3)
  %265 = load i32, ptr %6, align 4
  %266 = add nsw i32 %265, %264
  store i32 %266, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %267 = load i32, ptr %5, align 4
  call void @_64_void_goto(i32 noundef %267)
  %268 = load i32, ptr %5, align 4
  call void @_65_void_goto_else(i32 noundef %268)
  %269 = load i32, ptr %5, align 4
  call void @_66_void_nested(i32 noundef %269, i32 noundef 3)
  %270 = load i32, ptr %5, align 4
  call void @_67_void_complex(i32 noundef %270, i32 noundef 3, i32 noundef 0)
  call void @_68_void_global_only()
  %271 = load i32, ptr %5, align 4
  store i32 %271, ptr %7, align 4
  %272 = load i32, ptr %5, align 4
  call void @_69_void_pointer(ptr noundef %7, i32 noundef %272)
  %273 = load i32, ptr %5, align 4
  call void @_70_void_array(i32 noundef 1, i32 noundef %273)
  %274 = load i32, ptr @g_void_result, align 4
  %275 = load i32, ptr %6, align 4
  %276 = add nsw i32 %275, %274
  store i32 %276, ptr %6, align 4
  %277 = load i32, ptr %5, align 4
  store i32 %277, ptr %7, align 4
  %278 = load i32, ptr %5, align 4
  %279 = call i32 @_71_complex_control_flow(ptr noundef %7, i32 noundef 1, i32 noundef %278, i32 noundef 3)
  %280 = load i32, ptr %6, align 4
  %281 = add nsw i32 %280, %279
  store i32 %281, ptr %6, align 4
  %282 = load i32, ptr %5, align 4
  %283 = call i32 @_72_complex_merge(i32 noundef %282, i32 noundef 3, i32 noundef 5)
  %284 = load i32, ptr %6, align 4
  %285 = add nsw i32 %284, %283
  store i32 %285, ptr %6, align 4
  %286 = load i32, ptr %5, align 4
  %287 = call i32 @_73_goto_stress(ptr noundef %7, i32 noundef 1, i32 noundef %286, i32 noundef 3, i32 noundef 5)
  %288 = load i32, ptr %6, align 4
  %289 = add nsw i32 %288, %287
  store i32 %289, ptr %6, align 4
  %290 = load i32, ptr %6, align 4
  %291 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %290)
  ret i32 0

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %loop
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %18
    i32 4, label %19
  ]

loop:                                             ; preds = %18, %13, %9, %8
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
