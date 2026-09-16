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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  store i32 %12, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %1, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %11
    i32 4, label %13
  ]

break:                                            ; preds = %11, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_1_if_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 10
  store i32 %10, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = sub nsw i32 %12, 10
  store i32 %13, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %1, align 4
  ret i32 %15

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %11
    i32 4, label %14
  ]

break:                                            ; preds = %11, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_2_if_with_surrounding_code(i32 noundef %0) #0 {
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 5
  store i32 %15, ptr %2, align 4
  %16 = load i32, ptr %2, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %10
    i32 3, label %13
  ]

break:                                            ; preds = %10, %6, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_3_if_compound(i32 noundef %0) #0 {
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %1, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %2, align 4
  %12 = load i32, ptr %2, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  ret i32 %15

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %9
    i32 3, label %14
  ]

break:                                            ; preds = %9, %5, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_4_if_else_compound(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %1, align 4
  %6 = icmp sgt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %1, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %1, align 4
  %15 = sub nsw i32 %14, 2
  store i32 %15, ptr %2, align 4
  %16 = load i32, ptr %2, align 4
  %17 = sub nsw i32 %16, 1
  store i32 %17, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %13
    i32 4, label %18
  ]

break:                                            ; preds = %13, %8, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_5_if_equal(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp eq i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %12
    i32 4, label %13
  ]

break:                                            ; preds = %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_6_if_not_equal(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp ne i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = sub nsw i32 %16, %17
  store i32 %18, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %15
    i32 4, label %19
  ]

break:                                            ; preds = %15, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_7_relational(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 1, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %13, %14
  %16 = select i1 %15, i32 4, i32 5
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 2, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp eq i32 %19, %20
  %22 = select i1 %21, i32 6, i32 7
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 3, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 4, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %2, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %24, %23, %18, %17, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_8_boolean_argument(i1 noundef zeroext %0, i32 noundef %1) #0 {
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
  br label %break

7:                                                ; preds = %switch
  %8 = load i8, ptr %3, align 1
  %9 = trunc i8 %8 to i1
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = mul nsw i32 %12, 3
  store i32 %13, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = sub nsw i32 %15, 3
  store i32 %16, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %7
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
  ]

break:                                            ; preds = %14, %11, %7, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_9_if_elseif_else(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 10
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 100
  store i32 %10, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = icmp sgt i32 %12, 5
  %14 = select i1 %13, i32 4, i32 5
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, 50
  store i32 %17, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, 10
  store i32 %20, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %1, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %18, %15, %11, %8, %4, %3
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
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, -10
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 0
  %12 = select i1 %11, i32 4, i32 5
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  store i32 -2, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = icmp eq i32 %15, 0
  %17 = select i1 %16, i32 6, i32 7
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 0, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = icmp slt i32 %20, 10
  %22 = select i1 %21, i32 8, i32 9
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 2, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 1, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %1, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %24, %23, %19, %18, %14, %13, %9, %8, %4, %3
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = icmp eq i32 %15, %16
  %18 = select i1 %17, i32 4, i32 5
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 10
  %26 = load i32, ptr %4, align 4
  %27 = icmp sgt i32 %25, %26
  %28 = select i1 %27, i32 6, i32 7
  store i32 %28, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %3, align 4
  %31 = load i32, ptr %4, align 4
  %32 = sub nsw i32 %30, %31
  store i32 %32, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %4, align 4
  %35 = load i32, ptr %3, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %2, align 4
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %33, %29, %23, %19, %14, %11, %6, %5
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %18
    i32 5, label %22
  ]

break:                                            ; preds = %18, %14, %10, %6, %5
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 3, i32 2
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %15, %16
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %20, %21
  %23 = sub nsw i32 %22, 10
  store i32 %23, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %19
    i32 5, label %24
  ]

break:                                            ; preds = %19, %14, %10, %6, %5
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 4, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 0
  %19 = select i1 %18, i32 4, i32 5
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 100, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 200, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %21, %20, %16, %12, %8, %7
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 0
  %11 = select i1 %10, i32 3, i32 2
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, i32 3, i32 5
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 10
  %19 = select i1 %18, i32 4, i32 5
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 300, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 400, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %21, %20, %16, %12, %8, %7
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
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = icmp slt i32 %15, 10
  %17 = select i1 %16, i32 5, i32 3
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %7, align 4
  %20 = icmp eq i32 %19, 5
  %21 = select i1 %20, i32 4, i32 6
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = icmp ne i32 %23, 0
  %25 = select i1 %24, i32 5, i32 6
  store i32 %25, ptr %b, align 4
  br label %break

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
  br label %break

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
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %4, align 4
  ret i32 %43

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %34, %26, %22, %18, %14, %10, %9
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
  br label %break

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
  br label %break

19:                                               ; preds = %switch
  store i32 111, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 222, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %19
    i32 3, label %20
    i32 4, label %21
  ]

break:                                            ; preds = %20, %19, %8, %7
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
  br label %break

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
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %4, align 4
  %31 = load i32, ptr %5, align 4
  %32 = sub nsw i32 %30, %31
  %33 = load i32, ptr %6, align 4
  %34 = sub nsw i32 %32, %33
  store i32 %34, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %3, align 4
  ret i32 %36

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %23
    i32 3, label %29
    i32 4, label %35
  ]

break:                                            ; preds = %29, %23, %8, %7
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %11, %12
  %14 = select i1 %13, i32 2, i32 4
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sub nsw i32 %16, %17
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %19, 10
  %21 = icmp slt i32 %18, %20
  %22 = select i1 %21, i32 3, i32 4
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 123, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 456, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %3, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %15
    i32 3, label %23
    i32 4, label %24
    i32 5, label %25
  ]

break:                                            ; preds = %24, %23, %15, %8, %7
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
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %11, %12
  %14 = select i1 %13, i32 2, i32 4
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %8, align 4
  %18 = icmp slt i32 %16, %17
  %19 = select i1 %18, i32 6, i32 3
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = load i32, ptr %7, align 4
  %23 = icmp eq i32 %21, %22
  %24 = select i1 %23, i32 6, i32 4
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %6, align 4
  %27 = load i32, ptr %8, align 4
  %28 = icmp eq i32 %26, %27
  %29 = select i1 %28, i32 5, i32 7
  store i32 %29, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %7, align 4
  %33 = icmp slt i32 %31, %32
  %34 = select i1 %33, i32 6, i32 7
  store i32 %34, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  store i32 777, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 888, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %4, align 4
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %36, %35, %30, %25, %20, %15, %10, %9
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
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 6
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 3, i32 4
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %2, align 4
  %23 = load i32, ptr %3, align 4
  %24 = sub nsw i32 %22, %23
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  ret i32 %29

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %27, %21, %15, %11, %7, %5
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 4, i32 5
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = sub nsw i32 %22, 2
  store i32 %23, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %21, %18, %14, %10, %6, %5
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 5
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = icmp sgt i32 %25, 0
  %27 = select i1 %26, i32 6, i32 7
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %6, align 4
  %30 = mul nsw i32 %29, 2
  store i32 %30, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  %33 = sub nsw i32 %32, 2
  store i32 %33, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %3, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %31, %28, %24, %20, %16, %12, %8, %7
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 11
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %6, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = select i1 %17, i32 4, i32 9
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 10
  store i32 %21, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 6, i32 7
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 100
  store i32 %28, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %30, 100
  store i32 %31, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 20
  store i32 %35, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 -1, ptr %6, align 4
  store i32 12, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %6, align 4
  ret i32 %39

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %37, %36, %33, %32, %29, %26, %22, %19, %15, %12, %8, %7
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
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %7, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 2, i32 12
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %7, align 4
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp sgt i32 %20, %21
  %23 = select i1 %22, i32 4, i32 8
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %7, align 4
  %26 = mul nsw i32 %25, 2
  store i32 %26, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %7, align 4
  %29 = srem i32 %28, 3
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 6, i32 7
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %33, 3
  store i32 %34, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %7, align 4
  %37 = sub nsw i32 %36, 3
  store i32 %37, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %7, align 4
  %40 = sub nsw i32 %39, 5
  store i32 %40, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %6, align 4
  %44 = icmp slt i32 %42, %43
  %45 = select i1 %44, i32 10, i32 11
  store i32 %45, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %7, align 4
  %48 = mul nsw i32 %47, 2
  store i32 %48, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %7, align 4
  %51 = sdiv i32 %50, 2
  store i32 %51, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %7, align 4
  %54 = load i32, ptr %6, align 4
  %55 = sub nsw i32 %53, %54
  store i32 %55, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %3, align 4
  ret i32 %57

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %52, %49, %46, %41, %38, %35, %32, %27, %24, %19, %16, %12, %8
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 9
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 3, i32 9
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %6, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = icmp sgt i32 %21, 0
  %23 = select i1 %22, i32 5, i32 7
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = icmp slt i32 %25, 10
  %27 = select i1 %26, i32 6, i32 7
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %6, align 4
  %35 = sub nsw i32 %34, %33
  store i32 %35, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %5, align 4
  store i32 %38, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  ret i32 %40

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %37, %36, %32, %28, %24, %20, %16, %12, %8, %7
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 0
  %11 = select i1 %10, i32 3, i32 2
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp eq i32 %13, 0
  %15 = select i1 %14, i32 3, i32 7
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 10
  %19 = select i1 %18, i32 5, i32 4
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %21, -10
  %23 = select i1 %22, i32 5, i32 6
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 1000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 2000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 3000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %26, %25, %24, %20, %16, %12, %8, %7
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
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 4, i32 3
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %7, align 4
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 4, i32 9
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = icmp sgt i32 %23, 5
  %25 = select i1 %24, i32 6, i32 5
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %6, align 4
  %29 = icmp eq i32 %27, %28
  %30 = select i1 %29, i32 6, i32 8
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %7, align 4
  %33 = icmp slt i32 %32, 10
  %34 = select i1 %33, i32 7, i32 8
  store i32 %34, ptr %b, align 4
  br label %break

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
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %5, align 4
  %45 = load i32, ptr %6, align 4
  %46 = mul nsw i32 %44, %45
  store i32 %46, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %7, align 4
  %49 = load i32, ptr %8, align 4
  %50 = sub nsw i32 %48, %49
  store i32 %50, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %4, align 4
  ret i32 %52

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %47, %43, %35, %31, %26, %22, %18, %14, %10, %9
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %1, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  %14 = icmp sgt i32 %13, 5
  %15 = select i1 %14, i32 4, i32 5
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 20
  store i32 %18, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %1, align 4
  %21 = icmp sgt i32 %20, 10
  %22 = select i1 %21, i32 6, i32 7
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 30
  store i32 %25, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %2, align 4
  ret i32 %27

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %23, %19, %16, %12, %9, %5, %3
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %14, 10
  store i32 %15, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = icmp sgt i32 %17, 0
  %19 = select i1 %18, i32 5, i32 6
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 20
  store i32 %22, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = sub nsw i32 %24, 20
  store i32 %25, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  ret i32 %27

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %23, %20, %16, %13, %10, %6, %5
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
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = sub nsw i32 %17, 2
  store i32 %18, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %1, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %9
    i32 2, label %13
    i32 3, label %16
    i32 4, label %19
  ]

break:                                            ; preds = %16, %13, %9, %4
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
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %1, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %11
    i32 3, label %18
    i32 4, label %25
  ]

break:                                            ; preds = %18, %11, %4, %3
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
  br label %break

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
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp ne i32 %21, 0
  %23 = select i1 %22, i32 3, i32 4
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = mul nsw i32 %28, 10
  store i32 %29, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = mul nsw i32 %34, 10
  store i32 %35, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %2, align 4
  ret i32 %37

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %17
    i32 3, label %24
    i32 4, label %30
    i32 5, label %36
  ]

break:                                            ; preds = %30, %24, %17, %6, %5
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
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 5
  %17 = select i1 %16, i32 2, i32 3
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %22, 2
  store i32 %23, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %14
    i32 2, label %18
    i32 3, label %21
    i32 4, label %24
  ]

break:                                            ; preds = %21, %18, %14, %6
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = icmp sge i32 %7, 0
  %9 = select i1 %8, i32 2, i32 11
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %11, 8
  %13 = select i1 %12, i32 3, i32 11
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = icmp sge i32 %22, 0
  %24 = select i1 %23, i32 5, i32 10
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %3, align 4
  %27 = icmp slt i32 %26, 8
  %28 = select i1 %27, i32 6, i32 10
  store i32 %28, ptr %b, align 4
  br label %break

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
  br label %break

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
  br label %break

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
  br label %break

64:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %4, align 4
  ret i32 %67

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %65, %64, %52, %40, %29, %25, %21, %14, %10, %6, %5
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
  br label %break

4:                                                ; preds = %switch
  %5 = load ptr, ptr %2, align 8
  %6 = load i32, ptr %5, align 4
  %7 = icmp sgt i32 %6, 10
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %10, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, 2
  store i32 %16, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %1, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
  ]

break:                                            ; preds = %13, %9, %4, %3
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
  br label %break

4:                                                ; preds = %switch
  %5 = load ptr, ptr %2, align 8
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load ptr, ptr %2, align 8
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, 100
  store i32 %12, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = sub nsw i32 %15, 100
  store i32 %16, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %1, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
  ]

break:                                            ; preds = %13, %9, %4, %3
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
  br label %break

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
  br label %break

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
  br label %break

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
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %2, align 4
  ret i32 %41

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %18
    i32 3, label %29
    i32 4, label %40
  ]

break:                                            ; preds = %29, %18, %6, %5
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
  br label %break

8:                                                ; preds = %switch
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 6
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %15, align 4
  %17 = icmp sgt i32 %14, %16
  %18 = select i1 %17, i32 3, i32 4
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %4, align 4
  %26 = sub nsw i32 %25, %24
  store i32 %26, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load ptr, ptr %2, align 8
  %30 = load i32, ptr %29, align 4
  %31 = sub nsw i32 0, %30
  store i32 %31, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  ret i32 %33

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %28, %27, %23, %19, %13, %8, %5
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load ptr, ptr %2, align 8
  store i32 %11, ptr %12, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 2
  %16 = load ptr, ptr %2, align 8
  store i32 %15, ptr %16, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %18, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
  ]

break:                                            ; preds = %13, %9, %5, %4
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
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 6
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 3, i32 4
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = load ptr, ptr %3, align 8
  store i32 %18, ptr %19, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %21, %22
  %24 = load ptr, ptr %3, align 8
  store i32 %23, ptr %24, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = sub nsw i32 0, %27
  %29 = load ptr, ptr %3, align 8
  store i32 %28, ptr %29, align 4
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load ptr, ptr %3, align 8
  %32 = load i32, ptr %31, align 4
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %26, %25, %20, %15, %11, %7, %6
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_x, align 4
  %7 = load i32, ptr @g_y, align 4
  %8 = add nsw i32 %6, %7
  store i32 %8, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = sub nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %0, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
  ]

break:                                            ; preds = %9, %5, %1
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_y, align 4
  %7 = icmp slt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_z, align 4
  store i32 %14, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %0, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %15
  ]

break:                                            ; preds = %13, %9, %5, %1
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_z, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_z, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_y, align 4
  store i32 %14, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %0, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %15
  ]

break:                                            ; preds = %13, %9, %5, %1
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_y, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr @g_y, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_x, align 4
  %15 = load i32, ptr @g_y, align 4
  %16 = sub nsw i32 %14, %15
  store i32 %16, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr @g_z, align 4
  store i32 %18, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %0, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
    i32 5, label %19
  ]

break:                                            ; preds = %17, %13, %9, %5, %1
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 %7, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_arr, align 16
  store i32 %9, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %0, align 4
  ret i32 %11

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %6
    i32 2, label %8
    i32 3, label %10
  ]

break:                                            ; preds = %8, %6, %1
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  store i32 %7, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_mat, align 16
  store i32 %9, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %0, align 4
  ret i32 %11

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %6
    i32 2, label %8
    i32 3, label %10
  ]

break:                                            ; preds = %8, %6, %1
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
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp eq i32 %10, 0
  %12 = select i1 %11, i32 4, i32 5
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  store i32 0, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %15, 10
  %17 = select i1 %16, i32 6, i32 7
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 10, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  store i32 20, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %1, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %19, %18, %14, %13, %9, %8, %4, %3
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 7
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 5, i32 6
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  store i32 %23, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %25, %26
  store i32 %27, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = sub nsw i32 0, %29
  store i32 %30, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %2, align 4
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %28, %24, %22, %18, %14, %10, %6, %5
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 2, i32 4
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = icmp eq i32 %21, 0
  %23 = select i1 %22, i32 6, i32 5
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = icmp eq i32 %25, 0
  %27 = select i1 %26, i32 6, i32 7
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %29, %30
  store i32 %31, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %33, %34
  %36 = load i32, ptr %6, align 4
  %37 = mul nsw i32 %36, 2
  %38 = icmp sgt i32 %35, %37
  %39 = select i1 %38, i32 8, i32 9
  store i32 %39, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %5, align 4
  %43 = mul nsw i32 %41, %42
  store i32 %43, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %6, align 4
  store i32 %45, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %3, align 4
  ret i32 %47

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %44, %40, %32, %28, %24, %20, %16, %12, %8, %7
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
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %8, align 4
  %20 = icmp sgt i32 %19, 10
  %21 = select i1 %20, i32 2, i32 3
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = add nsw i32 %23, 100
  store i32 %24, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %8, align 4
  %27 = sub nsw i32 %26, 100
  store i32 %27, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %8, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %31, %32
  ret i32 %33

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %18
    i32 2, label %22
    i32 3, label %25
    i32 4, label %28
  ]

break:                                            ; preds = %25, %22, %18, %9
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

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

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
  ]

break:                                            ; preds = %14, %11, %6, %5
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
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 2, i32 7
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %6, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %5, align 4
  %21 = icmp sgt i32 %19, %20
  %22 = select i1 %21, i32 4, i32 5
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 10
  store i32 %25, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = sub nsw i32 %27, 10
  store i32 %28, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 5
  store i32 %31, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %6, align 4
  %34 = sub nsw i32 0, %33
  store i32 %34, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %6, align 4
  %37 = load i32, ptr %5, align 4
  %38 = add nsw i32 %36, %37
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %32, %29, %26, %23, %18, %15, %11, %7
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 20
  store i32 %16, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
  ]

break:                                            ; preds = %14, %11, %6, %5
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
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 2
  store i32 %15, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = sub nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  %19 = load i32, ptr %3, align 4
  %20 = sub nsw i32 %19, 2
  store i32 %20, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = load i32, ptr %5, align 4
  %24 = mul nsw i32 %22, %23
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %16
    i32 4, label %21
  ]

break:                                            ; preds = %16, %11, %7, %6
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
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 6
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 3, i32 4
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = icmp sgt i32 %27, 0
  %29 = select i1 %28, i32 7, i32 8
  store i32 %29, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %31, %32
  store i32 %33, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %5, align 4
  %36 = load i32, ptr %3, align 4
  %37 = sub nsw i32 %35, %36
  store i32 %37, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  %41 = icmp sgt i32 %40, 10
  %42 = select i1 %41, i32 11, i32 12
  store i32 %42, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %6, align 4
  %45 = mul nsw i32 %44, 2
  store i32 %45, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %6, align 4
  %48 = sub nsw i32 %47, 2
  store i32 %48, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %7, align 4
  ret i32 %50

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %46, %43, %39, %38, %34, %30, %26, %25, %21, %17, %13, %9, %8
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
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  store i32 %13, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  store i32 %15, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = icmp sgt i32 %18, 10
  %20 = select i1 %19, i32 6, i32 7
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 2
  store i32 %26, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %2, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %24, %21, %17, %16, %14, %12, %7, %6
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 6
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = icmp sgt i32 %24, 0
  %26 = select i1 %25, i32 7, i32 8
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  %29 = mul nsw i32 %28, 2
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = sub nsw i32 %31, 2
  store i32 %32, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %2, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %33, %30, %27, %23, %22, %18, %14, %10, %6, %5
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
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %10, %11
  %13 = select i1 %12, i32 2, i32 6
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp sgt i32 %15, %16
  %18 = select i1 %17, i32 3, i32 4
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  store i32 %20, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  store i32 %22, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp sgt i32 %25, %26
  %28 = select i1 %27, i32 7, i32 8
  store i32 %28, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  store i32 %30, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  store i32 %32, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %7, align 4
  store i32 11, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %7, align 4
  %37 = icmp sgt i32 %36, 10
  %38 = select i1 %37, i32 12, i32 13
  store i32 %38, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %7, align 4
  %41 = mul nsw i32 %40, 2
  store i32 %41, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %7, align 4
  store i32 %43, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %3, align 4
  ret i32 %45

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %42, %39, %35, %34, %33, %31, %29, %24, %23, %21, %19, %14, %9, %8
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
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sle i32 %10, 0
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

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
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 5, i32 6
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 10
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %28 = getelementptr inbounds i32, ptr %.reload4, i64 1
  store i32 %27, ptr %28, align 4
  store i32 7, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %30 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %31 = load i32, ptr %30, align 16
  %32 = add nsw i32 %31, 10
  store i32 %32, ptr %30, align 16
  store i32 7, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %34 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %35 = load i32, ptr %34, align 16
  %36 = icmp sgt i32 %35, 0
  %37 = select i1 %36, i32 8, i32 9
  store i32 %37, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %39 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %40 = load i32, ptr %39, align 16
  store i32 %40, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 10, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %42 = getelementptr inbounds i32, ptr %.reload, i64 0
  %43 = load i32, ptr %42, align 16
  %44 = sub nsw i32 %43, 1
  store i32 %44, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 10, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %46)
  store i32 11, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %2, align 4
  ret i32 %48

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %45, %41, %38, %33, %29, %25, %21, %14, %13, %9, %8
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
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sle i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

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
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = icmp sgt i32 %23, 2
  %25 = select i1 %24, i32 5, i32 9
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, 1
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds i32, ptr %29, i64 1
  store i32 %28, ptr %30, align 4
  store i32 6, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds i32, ptr %32, i64 1
  %34 = load i32, ptr %33, align 4
  %35 = icmp sgt i32 %34, 0
  %36 = select i1 %35, i32 7, i32 8
  store i32 %36, ptr %b, align 4
  br label %break

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
  br label %break

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
  br label %break

53:                                               ; preds = %switch
  %54 = load ptr, ptr %7, align 8
  %55 = getelementptr inbounds i32, ptr %54, i64 0
  %56 = load i32, ptr %55, align 4
  store i32 %56, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %58)
  store i32 11, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %2, align 4
  ret i32 %60

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %57, %53, %45, %37, %31, %26, %22, %15, %14, %10, %9
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
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = icmp sle i32 %12, 0
  %14 = select i1 %13, i32 2, i32 3
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  store i32 -100, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

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
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = icmp sgt i32 %26, 3
  %28 = select i1 %27, i32 5, i32 7
  store i32 %28, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %.reload6 = load ptr, ptr %.reg2mem, align 8
  %30 = getelementptr inbounds i32, ptr %.reload6, i64 0
  %31 = load i32, ptr %30, align 16
  %32 = icmp sgt i32 %31, 0
  %33 = select i1 %32, i32 6, i32 7
  store i32 %33, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %35 = getelementptr inbounds i32, ptr %.reload5, i64 0
  %36 = load i32, ptr %35, align 16
  %37 = mul nsw i32 %36, 2
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %38 = getelementptr inbounds i32, ptr %.reload4, i64 1
  store i32 %37, ptr %38, align 4
  store i32 8, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %40 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %41 = load i32, ptr %40, align 16
  %42 = sub nsw i32 %41, 5
  store i32 %42, ptr %40, align 16
  store i32 8, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %44 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %45 = load i32, ptr %44, align 16
  %46 = icmp sgt i32 %45, 10
  %47 = select i1 %46, i32 10, i32 9
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %6, align 4
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i32 10, i32 11
  store i32 %51, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %53 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %54 = load i32, ptr %53, align 16
  store i32 %54, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %56 = getelementptr inbounds i32, ptr %.reload, i64 0
  %57 = load i32, ptr %56, align 16
  %58 = load i32, ptr %5, align 4
  %59 = add nsw i32 %57, %58
  store i32 %59, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %61)
  store i32 13, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load i32, ptr %3, align 4
  ret i32 %63

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %60, %55, %52, %48, %43, %39, %34, %29, %25, %16, %15, %11, %10
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
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sle i32 %9, 0
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16) #6
  store ptr %17, ptr %5, align 8
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load ptr, ptr %5, align 8
  %20 = icmp eq ptr %19, null
  %21 = select i1 %20, i32 5, i32 6
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 -2, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds i32, ptr %25, i64 0
  store i32 %24, ptr %26, align 4
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds i32, ptr %28, i64 0
  %30 = load i32, ptr %29, align 4
  %31 = icmp sgt i32 %30, 0
  %32 = select i1 %31, i32 8, i32 9
  store i32 %32, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds i32, ptr %34, i64 0
  %36 = load i32, ptr %35, align 4
  %37 = mul nsw i32 %36, 2
  store i32 %37, ptr %35, align 4
  store i32 10, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds i32, ptr %39, i64 0
  %41 = load i32, ptr %40, align 4
  %42 = sub nsw i32 %41, 2
  store i32 %42, ptr %40, align 4
  store i32 10, ptr %b, align 4
  br label %break

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
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %2, align 4
  ret i32 %50

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %43, %38, %33, %27, %23, %22, %18, %13, %12, %8, %7
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
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sle i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  store i32 -1, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = mul i64 %17, 4
  %19 = call noalias ptr @malloc(i64 noundef %18) #6
  store ptr %19, ptr %7, align 8
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load ptr, ptr %7, align 8
  %22 = icmp eq ptr %21, null
  %23 = select i1 %22, i32 5, i32 6
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 -2, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %5, align 4
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds i32, ptr %27, i64 0
  store i32 %26, ptr %28, align 4
  store i32 7, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  %31 = icmp sgt i32 %30, 0
  %32 = select i1 %31, i32 8, i32 12
  store i32 %32, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  %35 = icmp sgt i32 %34, 0
  %36 = select i1 %35, i32 9, i32 10
  store i32 %36, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %6, align 4
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds i32, ptr %39, i64 0
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %41, %38
  store i32 %42, ptr %40, align 4
  store i32 11, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %6, align 4
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds i32, ptr %45, i64 0
  %47 = load i32, ptr %46, align 4
  %48 = sub nsw i32 %47, %44
  store i32 %48, ptr %46, align 4
  store i32 11, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 0
  %53 = load i32, ptr %52, align 4
  %54 = sub nsw i32 0, %53
  %55 = load ptr, ptr %7, align 8
  %56 = getelementptr inbounds i32, ptr %55, i64 0
  store i32 %54, ptr %56, align 4
  store i32 13, ptr %b, align 4
  br label %break

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
  br label %break

63:                                               ; preds = %switch
  %64 = load i32, ptr %3, align 4
  ret i32 %64

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %57, %50, %49, %43, %37, %33, %29, %25, %24, %20, %15, %14, %10, %9
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
  br label %break

3:                                                ; preds = %switch
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 0
  %6 = select i1 %5, i32 2, i32 3
  store i32 %6, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = load i32, ptr @g_void_result, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, ptr @g_void_result, align 4
  store i32 3, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %7
    i32 3, label %11
  ]

break:                                            ; preds = %7, %3, %2
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
  br label %break

3:                                                ; preds = %switch
  %4 = load i32, ptr %1, align 4
  %5 = icmp sgt i32 %4, 0
  %6 = select i1 %5, i32 2, i32 3
  store i32 %6, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = mul nsw i32 %8, 2
  %10 = load i32, ptr @g_void_result, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  %14 = load i32, ptr @g_void_result, align 4
  %15 = sub nsw i32 %14, %13
  store i32 %15, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %7
    i32 3, label %12
    i32 4, label %16
  ]

break:                                            ; preds = %12, %7, %3, %2
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 6
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 3, i32 4
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr @g_void_result, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = load i32, ptr %3, align 4
  %22 = sub nsw i32 %20, %21
  %23 = load i32, ptr @g_void_result, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %2, align 4
  %28 = load i32, ptr @g_void_result, align 4
  %29 = sub nsw i32 %28, %27
  store i32 %29, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %26, %25, %19, %13, %9, %5, %4
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
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 4, i32 3
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %5, align 4
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 4, i32 5
  store i32 %18, ptr %b, align 4
  br label %break

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
  br label %break

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
  br label %break

35:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %27, %19, %15, %11, %7, %6
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
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp slt i32 %5, 0
  %7 = select i1 %6, i32 2, i32 3
  store i32 %7, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_x, align 4
  %10 = load i32, ptr @g_void_result, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr @g_z, align 4
  %14 = load i32, ptr @g_void_result, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %4
    i32 2, label %8
    i32 3, label %12
    i32 4, label %16
  ]

break:                                            ; preds = %12, %8, %4, %0
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load ptr, ptr %2, align 8
  store i32 %11, ptr %12, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 2
  %16 = load ptr, ptr %2, align 8
  store i32 %15, ptr %16, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load ptr, ptr %2, align 8
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr @g_void_result, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr @g_void_result, align 4
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %17
  ]

break:                                            ; preds = %13, %9, %5, %4
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
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = icmp sge i32 %6, 0
  %8 = select i1 %7, i32 2, i32 4
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 8
  %12 = select i1 %11, i32 3, i32 4
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %16
  store i32 %14, ptr %17, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = icmp sge i32 %19, 0
  %21 = select i1 %20, i32 5, i32 7
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  %24 = icmp slt i32 %23, 8
  %25 = select i1 %24, i32 6, i32 7
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %2, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr @g_void_result, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %26, %22, %18, %13, %9, %5, %4
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
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %8, align 4
  %15 = icmp sgt i32 %13, %14
  %16 = select i1 %15, i32 2, i32 15
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %9, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %9, align 4
  store i32 3, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  %23 = icmp sge i32 %22, 0
  %24 = select i1 %23, i32 4, i32 13
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %26, 8
  %28 = select i1 %27, i32 5, i32 13
  store i32 %28, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = icmp sgt i32 %33, 0
  %35 = select i1 %34, i32 6, i32 11
  store i32 %35, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = load i32, ptr %9, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, ptr %9, align 4
  store i32 7, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load ptr, ptr %5, align 8
  %45 = load i32, ptr %44, align 4
  %46 = icmp sgt i32 %45, 0
  %47 = select i1 %46, i32 9, i32 8
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr @g_y, align 4
  %50 = icmp slt i32 %49, 0
  %51 = select i1 %50, i32 9, i32 10
  store i32 %51, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %9, align 4
  %54 = load ptr, ptr %5, align 8
  %55 = load i32, ptr %54, align 4
  %56 = add nsw i32 %53, %55
  store i32 %56, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load i32, ptr %9, align 4
  %59 = load ptr, ptr %5, align 8
  %60 = load i32, ptr %59, align 4
  %61 = sub nsw i32 %58, %60
  store i32 %61, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = load i32, ptr %9, align 4
  %68 = sub nsw i32 %67, %66
  store i32 %68, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %break

69:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %9, align 4
  %72 = add nsw i32 %71, 100
  store i32 %72, ptr %9, align 4
  store i32 14, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  store i32 24, ptr %b, align 4
  br label %break

74:                                               ; preds = %switch
  %75 = load i32, ptr %7, align 4
  %76 = load i32, ptr %8, align 4
  %77 = icmp eq i32 %75, %76
  %78 = select i1 %77, i32 16, i32 20
  store i32 %78, ptr %b, align 4
  br label %break

79:                                               ; preds = %switch
  %80 = load i32, ptr @g_z, align 4
  %81 = load i32, ptr %9, align 4
  %82 = add nsw i32 %81, %80
  store i32 %82, ptr %9, align 4
  store i32 17, ptr %b, align 4
  br label %break

83:                                               ; preds = %switch
  %84 = load ptr, ptr %5, align 8
  %85 = load i32, ptr %84, align 4
  %86 = icmp eq i32 %85, 0
  %87 = select i1 %86, i32 18, i32 19
  store i32 %87, ptr %b, align 4
  br label %break

88:                                               ; preds = %switch
  %89 = load i32, ptr %9, align 4
  store i32 %89, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load i32, ptr %9, align 4
  %92 = load ptr, ptr %5, align 8
  %93 = load i32, ptr %92, align 4
  %94 = add nsw i32 %91, %93
  store i32 %94, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

95:                                               ; preds = %switch
  %96 = load i32, ptr %8, align 4
  %97 = load i32, ptr %9, align 4
  %98 = sub nsw i32 %97, %96
  store i32 %98, ptr %9, align 4
  store i32 21, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  %100 = load i32, ptr %7, align 4
  %101 = load i32, ptr %8, align 4
  %102 = add nsw i32 %100, %101
  %103 = load i32, ptr @g_x, align 4
  %104 = add nsw i32 %103, 1
  %105 = icmp sgt i32 %102, %104
  %106 = select i1 %105, i32 22, i32 23
  store i32 %106, ptr %b, align 4
  br label %break

107:                                              ; preds = %switch
  %108 = load i32, ptr %9, align 4
  %109 = mul nsw i32 %108, 2
  store i32 %109, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

110:                                              ; preds = %switch
  %111 = load i32, ptr %9, align 4
  %112 = sdiv i32 %111, 2
  store i32 %112, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

113:                                              ; preds = %switch
  %114 = load i32, ptr %9, align 4
  store i32 %114, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

115:                                              ; preds = %switch
  %116 = load i32, ptr %4, align 4
  ret i32 %116

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %113, %110, %107, %99, %95, %90, %88, %83, %79, %74, %73, %70, %69, %62, %57, %52, %48, %43, %36, %29, %25, %21, %17, %12, %10
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
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 8
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 3, i32 8
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, ptr %7, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 5, i32 6
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %7, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %4, align 4
  %37 = load i32, ptr %5, align 4
  %38 = sub nsw i32 %36, %37
  store i32 %38, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  %41 = icmp eq i32 %40, 0
  %42 = select i1 %41, i32 11, i32 10
  store i32 %42, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %4, align 4
  %45 = load i32, ptr %5, align 4
  %46 = icmp eq i32 %44, %45
  %47 = select i1 %46, i32 11, i32 12
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %7, align 4
  %50 = mul nsw i32 %49, 2
  store i32 %50, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %7, align 4
  %53 = load i32, ptr %6, align 4
  %54 = sub nsw i32 %52, %53
  store i32 %54, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %8, align 4
  %58 = icmp sgt i32 %57, 20
  %59 = select i1 %58, i32 15, i32 16
  store i32 %59, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  %64 = load i32, ptr %8, align 4
  %65 = icmp sgt i32 %64, 10
  %66 = select i1 %65, i32 17, i32 18
  store i32 %66, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  %68 = load i32, ptr %8, align 4
  %69 = add nsw i32 %68, 2
  store i32 %69, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %71, 3
  store i32 %72, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %74 = load i32, ptr %3, align 4
  ret i32 %74

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %70, %67, %63, %60, %56, %55, %51, %48, %43, %39, %35, %34, %30, %26, %22, %18, %14, %10, %9
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
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %9, align 4
  %19 = icmp sgt i32 %17, %18
  %20 = select i1 %19, i32 2, i32 3
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %10, align 4
  %23 = icmp ne i32 %22, 0
  %24 = select i1 %23, i32 5, i32 3
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %10, align 4
  %28 = icmp sgt i32 %26, %27
  %29 = select i1 %28, i32 4, i32 22
  store i32 %29, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %8, align 4
  %32 = icmp ne i32 %31, 0
  %33 = select i1 %32, i32 5, i32 22
  store i32 %33, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %11, align 4
  %36 = add nsw i32 %35, 10
  store i32 %36, ptr %11, align 4
  store i32 6, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %7, align 4
  %39 = icmp sge i32 %38, 0
  %40 = select i1 %39, i32 7, i32 20
  store i32 %40, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = icmp slt i32 %42, 8
  %44 = select i1 %43, i32 8, i32 20
  store i32 %44, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %11, align 4
  %51 = icmp sgt i32 %49, %50
  %52 = select i1 %51, i32 9, i32 14
  store i32 %52, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %7, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = load i32, ptr %11, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %11, align 4
  store i32 10, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load ptr, ptr %6, align 8
  %62 = load i32, ptr %61, align 4
  %63 = icmp sgt i32 %62, 0
  %64 = select i1 %63, i32 11, i32 12
  store i32 %64, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %66 = load ptr, ptr %6, align 8
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %11, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %11, align 4
  store i32 13, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load ptr, ptr %6, align 8
  %72 = load i32, ptr %71, align 4
  %73 = load i32, ptr %11, align 4
  %74 = sub nsw i32 %73, %72
  store i32 %74, ptr %11, align 4
  store i32 13, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load i32, ptr %7, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = load i32, ptr %11, align 4
  %82 = sub nsw i32 %81, %80
  store i32 %82, ptr %11, align 4
  store i32 15, ptr %b, align 4
  br label %break

83:                                               ; preds = %switch
  %84 = load i32, ptr %7, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = icmp eq i32 %87, 0
  %89 = select i1 %88, i32 17, i32 16
  store i32 %89, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load ptr, ptr %6, align 8
  %92 = load i32, ptr %91, align 4
  %93 = icmp eq i32 %92, 0
  %94 = select i1 %93, i32 17, i32 18
  store i32 %94, ptr %b, align 4
  br label %break

95:                                               ; preds = %switch
  %96 = load i32, ptr %11, align 4
  %97 = add nsw i32 %96, 50
  store i32 %97, ptr %11, align 4
  store i32 18, ptr %b, align 4
  br label %break

98:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %break

100:                                              ; preds = %switch
  %101 = load i32, ptr %11, align 4
  %102 = sub nsw i32 %101, 20
  store i32 %102, ptr %11, align 4
  store i32 21, ptr %b, align 4
  br label %break

103:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %break

104:                                              ; preds = %switch
  %105 = load i32, ptr %11, align 4
  %106 = sub nsw i32 %105, 10
  store i32 %106, ptr %11, align 4
  store i32 23, ptr %b, align 4
  br label %break

107:                                              ; preds = %switch
  %108 = load i32, ptr %11, align 4
  %109 = load i32, ptr @g_z, align 4
  %110 = icmp sgt i32 %108, %109
  %111 = select i1 %110, i32 24, i32 27
  store i32 %111, ptr %b, align 4
  br label %break

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
  br label %break

123:                                              ; preds = %switch
  %124 = load i32, ptr %11, align 4
  %125 = add nsw i32 %124, 100
  store i32 %125, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %break

126:                                              ; preds = %switch
  %127 = load i32, ptr %11, align 4
  %128 = add nsw i32 %127, 200
  store i32 %128, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %break

129:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %break

130:                                              ; preds = %switch
  %131 = load i32, ptr %11, align 4
  %132 = icmp sgt i32 %131, 0
  %133 = select i1 %132, i32 29, i32 30
  store i32 %133, ptr %b, align 4
  br label %break

134:                                              ; preds = %switch
  %135 = load i32, ptr %11, align 4
  %136 = mul nsw i32 %135, 2
  store i32 %136, ptr %.reg2mem, align 4
  store i32 31, ptr %b, align 4
  br label %break

137:                                              ; preds = %switch
  %138 = load i32, ptr %11, align 4
  %139 = sub nsw i32 0, %138
  store i32 %139, ptr %.reg2mem, align 4
  store i32 31, ptr %b, align 4
  br label %break

140:                                              ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %break

141:                                              ; preds = %switch
  %142 = load i32, ptr %5, align 4
  ret i32 %142

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
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

break:                                            ; preds = %140, %137, %134, %130, %129, %126, %123, %112, %107, %104, %103, %100, %99, %98, %95, %90, %83, %76, %75, %70, %65, %60, %53, %45, %41, %37, %34, %30, %25, %21, %16, %12
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_75_for_simple(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 4
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %18
    i32 4, label %21
  ]

break:                                            ; preds = %18, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_76_while_simple(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %5, align 4
  %15 = sub nsw i32 %13, %14
  %16 = load i32, ptr %4, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %20
  ]

break:                                            ; preds = %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_77_do_while(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
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
  store i32 2, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %2, align 4
  %19 = icmp slt i32 %17, %18
  %20 = select i1 %19, i32 1, i32 3
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %16
    i32 3, label %21
  ]

break:                                            ; preds = %16, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_78_nested_loops(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %9, %10
  %12 = select i1 %11, i32 2, i32 8
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %3, align 4
  %17 = icmp slt i32 %15, %16
  %18 = select i1 %17, i32 4, i32 6
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = mul nsw i32 %20, %21
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  ret i32 %33

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %13
    i32 3, label %14
    i32 4, label %19
    i32 5, label %25
    i32 6, label %28
    i32 7, label %29
    i32 8, label %32
  ]

break:                                            ; preds = %29, %28, %25, %19, %14, %13, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_79_nested_loop_if(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %9, %10
  %12 = select i1 %11, i32 2, i32 11
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %3, align 4
  %17 = icmp slt i32 %15, %16
  %18 = select i1 %17, i32 4, i32 9
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %20, %21
  %23 = srem i32 %22, 2
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 5, i32 6
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = sub nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %5, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %4, align 4
  ret i32 %44

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %13
    i32 3, label %14
    i32 4, label %19
    i32 5, label %26
    i32 6, label %32
    i32 7, label %35
    i32 8, label %36
    i32 9, label %39
    i32 10, label %40
    i32 11, label %43
  ]

break:                                            ; preds = %40, %39, %36, %35, %32, %26, %19, %14, %13, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_80_break(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  %9 = select i1 %8, i32 2, i32 6
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 3
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = mul nsw i32 %16, 10
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %14
    i32 4, label %15
    i32 5, label %20
    i32 6, label %23
  ]

break:                                            ; preds = %20, %15, %14, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_81_continue(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  %9 = select i1 %8, i32 2, i32 6
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %13, i32 3, i32 4
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %15
    i32 4, label %16
    i32 5, label %20
    i32 6, label %23
  ]

break:                                            ; preds = %20, %16, %15, %10, %5, %4
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  store i1 false, ptr %.reg2mem1, align 1
  %11 = select i1 %10, i32 2, i32 5
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = icmp sgt i32 %13, 0
  store i1 true, ptr %.reg2mem, align 1
  %15 = select i1 %14, i32 4, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %17, 3
  store i1 %18, ptr %.reg2mem, align 1
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %21 = select i1 %.reload2, i32 6, i32 10
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 7, i32 8
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  store i32 %27, ptr %.reg2mem3, align 4
  store i32 9, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = sub nsw i32 0, %29
  store i32 %30, ptr %.reg2mem3, align 4
  store i32 9, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, %.reload4
  store i32 %33, ptr %5, align 4
  %34 = load i32, ptr %3, align 4
  %35 = sdiv i32 %34, 2
  store i32 %35, ptr %3, align 4
  %36 = load i32, ptr %4, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %5, align 4
  ret i32 %39

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b5 = load i32, ptr %b, align 4
  switch i32 %b5, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %16
    i32 4, label %19
    i32 5, label %20
    i32 6, label %22
    i32 7, label %26
    i32 8, label %28
    i32 9, label %31
    i32 10, label %38
  ]

break:                                            ; preds = %31, %28, %26, %22, %20, %19, %16, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_83_loop_global_array() #0 {
entry:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

2:                                                ; preds = %switch
  store i32 0, ptr %0, align 4
  store i32 0, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %break

3:                                                ; preds = %switch
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 8
  %6 = select i1 %5, i32 2, i32 7
  store i32 %6, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %0, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %1, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr %0, align 4
  %27 = sub nsw i32 %26, %25
  store i32 %27, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %1, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %0, align 4
  ret i32 %33

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %7
    i32 3, label %14
    i32 4, label %21
    i32 5, label %28
    i32 6, label %29
    i32 7, label %32
  ]

break:                                            ; preds = %29, %28, %21, %14, %7, %3, %2
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  %10 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 0
  store ptr %10, ptr %5, align 8
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  store i1 false, ptr %.reg2mem, align 1
  %15 = select i1 %14, i32 2, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %7, align 4
  %18 = icmp slt i32 %17, 8
  store i1 %18, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %20 = select i1 %.reload, i32 4, i32 6
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %7, align 4
  %24 = add nsw i32 %22, %23
  %25 = load ptr, ptr %5, align 8
  store i32 %24, ptr %25, align 4
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds i32, ptr %26, i32 1
  store ptr %27, ptr %5, align 8
  store i32 5, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %8, align 4
  %34 = load i32, ptr %2, align 4
  %35 = icmp slt i32 %33, %34
  store i1 false, ptr %.reg2mem1, align 1
  %36 = select i1 %35, i32 8, i32 9
  store i32 %36, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %8, align 4
  %39 = icmp slt i32 %38, 8
  store i1 %39, ptr %.reg2mem1, align 1
  store i32 9, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %41 = select i1 %.reload2, i32 10, i32 12
  store i32 %41, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %8, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = mul nsw i32 %46, 2
  %48 = load i32, ptr %6, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %6, align 4
  store i32 11, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %6, align 4
  ret i32 %54

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %16
    i32 3, label %19
    i32 4, label %21
    i32 5, label %28
    i32 6, label %31
    i32 7, label %32
    i32 8, label %37
    i32 9, label %40
    i32 10, label %42
    i32 11, label %50
    i32 12, label %53
  ]

break:                                            ; preds = %50, %42, %40, %37, %32, %31, %28, %21, %19, %16, %11, %9
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %6, align 4
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %12, %13
  %15 = select i1 %14, i32 2, i32 7
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %7, align 4
  %22 = icmp sgt i32 %21, 10
  %23 = select i1 %22, i32 4, i32 5
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %7, align 4
  %26 = mul nsw i32 %25, 2
  store i32 %26, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %7, align 4
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %4, align 4
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, ptr %5, align 4
  store i32 8, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %5, align 4
  %40 = icmp sgt i32 %39, 100
  %41 = select i1 %40, i32 9, i32 10
  store i32 %41, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %5, align 4
  %44 = sub nsw i32 %43, 100
  store i32 %44, ptr %5, align 4
  store i32 10, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %5, align 4
  ret i32 %46

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %11
    i32 2, label %16
    i32 3, label %20
    i32 4, label %24
    i32 5, label %27
    i32 6, label %31
    i32 7, label %34
    i32 8, label %38
    i32 9, label %42
    i32 10, label %45
  ]

break:                                            ; preds = %42, %38, %34, %31, %27, %24, %20, %16, %11, %8
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

10:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  %15 = select i1 %14, i32 2, i32 19
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 3, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %8, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  %21 = select i1 %20, i32 4, i32 17
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %5, align 4
  %26 = icmp slt i32 %24, %25
  %27 = select i1 %26, i32 6, i32 15
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %7, align 4
  %30 = load i32, ptr %8, align 4
  %31 = icmp sgt i32 %29, %30
  %32 = select i1 %31, i32 7, i32 9
  store i32 %32, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %8, align 4
  %35 = load i32, ptr %9, align 4
  %36 = icmp sgt i32 %34, %35
  %37 = select i1 %36, i32 8, i32 9
  store i32 %37, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %6, align 4
  %40 = add nsw i32 %39, 10
  store i32 %40, ptr %6, align 4
  store i32 13, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %8, align 4
  %44 = icmp eq i32 %42, %43
  %45 = select i1 %44, i32 11, i32 10
  store i32 %45, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %8, align 4
  %48 = load i32, ptr %9, align 4
  %49 = icmp eq i32 %47, %48
  %50 = select i1 %49, i32 11, i32 12
  store i32 %50, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %6, align 4
  store i32 12, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %9, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %8, align 4
  store i32 3, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  store i32 18, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load i32, ptr %7, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  %68 = load i32, ptr %6, align 4
  ret i32 %68

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %16
    i32 3, label %17
    i32 4, label %22
    i32 5, label %23
    i32 6, label %28
    i32 7, label %33
    i32 8, label %38
    i32 9, label %41
    i32 10, label %46
    i32 11, label %51
    i32 12, label %54
    i32 13, label %55
    i32 14, label %56
    i32 15, label %59
    i32 16, label %60
    i32 17, label %63
    i32 18, label %64
    i32 19, label %67
  ]

break:                                            ; preds = %64, %63, %60, %59, %56, %55, %54, %51, %46, %41, %38, %33, %28, %23, %22, %17, %16, %11, %10
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  %11 = select i1 %10, i32 4, i32 2
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 4, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 0
  %19 = select i1 %18, i32 4, i32 16
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = icmp sgt i32 %21, 0
  %23 = select i1 %22, i32 5, i32 6
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  store i32 %25, ptr %.reg2mem, align 4
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem, align 4
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reload.reg2mem, align 4
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  %30 = icmp sgt i32 %29, 0
  %31 = select i1 %30, i32 9, i32 10
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %5, align 4
  store i32 %33, ptr %.reg2mem1, align 4
  store i32 11, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem1, align 4
  store i32 11, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload.reload = load i32, ptr %.reload.reg2mem, align 4
  %36 = add nsw i32 %.reload.reload, %.reload2
  store i32 %36, ptr %.reg2mem5, align 4
  store i32 12, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %6, align 4
  %39 = icmp sgt i32 %38, 0
  %40 = select i1 %39, i32 13, i32 14
  store i32 %40, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %6, align 4
  store i32 %42, ptr %.reg2mem3, align 4
  store i32 15, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem3, align 4
  store i32 15, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %45 = add nsw i32 %.reload6, %.reload4
  store i32 %45, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  store i32 0, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %3, align 4
  ret i32 %48

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
    i32 5, label %24
    i32 6, label %26
    i32 7, label %27
    i32 8, label %28
    i32 9, label %32
    i32 10, label %34
    i32 11, label %35
    i32 12, label %37
    i32 13, label %41
    i32 14, label %43
    i32 15, label %44
    i32 16, label %46
    i32 17, label %47
  ]

break:                                            ; preds = %46, %44, %43, %41, %37, %35, %34, %32, %28, %27, %26, %24, %20, %16, %12, %8, %7
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  store i32 %15, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = icmp sgt i32 %17, 0
  %19 = select i1 %18, i32 4, i32 5
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  store i32 %21, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 6, i32 7
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  store i32 %27, ptr %.reg2mem, align 4
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 8, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %6, align 4
  %32 = load i32, ptr %6, align 4
  %33 = zext i32 %32 to i64
  %34 = call ptr @llvm.stacksave()
  store ptr %34, ptr %7, align 8
  %35 = alloca i32, i64 %33, align 16
  store ptr %35, ptr %.reg2mem13, align 8
  store i64 %33, ptr %8, align 8
  %.reload21 = load ptr, ptr %.reg2mem13, align 8
  %36 = getelementptr inbounds i32, ptr %.reload21, i64 0
  store i32 0, ptr %36, align 16
  store i32 11, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %3, align 4
  %39 = icmp sgt i32 %38, 0
  %40 = select i1 %39, i32 14, i32 12
  store i32 %40, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %4, align 4
  %43 = icmp sgt i32 %42, 0
  %44 = select i1 %43, i32 14, i32 13
  store i32 %44, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %5, align 4
  %47 = icmp sgt i32 %46, 0
  %48 = select i1 %47, i32 14, i32 26
  store i32 %48, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %3, align 4
  %51 = icmp sgt i32 %50, 0
  %52 = select i1 %51, i32 15, i32 16
  store i32 %52, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %3, align 4
  store i32 %54, ptr %.reg2mem5, align 4
  store i32 17, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem5, align 4
  store i32 17, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %.reload6.reg2mem, align 4
  store i32 18, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load i32, ptr %4, align 4
  %59 = icmp sgt i32 %58, 0
  %60 = select i1 %59, i32 19, i32 20
  store i32 %60, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
  %62 = load i32, ptr %4, align 4
  store i32 %62, ptr %.reg2mem7, align 4
  store i32 21, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem7, align 4
  store i32 21, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %.reload6.reload = load i32, ptr %.reload6.reg2mem, align 4
  %65 = add nsw i32 %.reload6.reload, %.reload8
  store i32 %65, ptr %.reg2mem11, align 4
  store i32 22, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %5, align 4
  %68 = icmp sgt i32 %67, 0
  %69 = select i1 %68, i32 23, i32 24
  store i32 %69, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %5, align 4
  store i32 %71, ptr %.reg2mem9, align 4
  store i32 25, ptr %b, align 4
  br label %break

72:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem9, align 4
  store i32 25, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  %.reload12 = load i32, ptr %.reg2mem11, align 4
  %74 = add nsw i32 %.reload12, %.reload10
  %.reload20 = load ptr, ptr %.reg2mem13, align 8
  %75 = getelementptr inbounds i32, ptr %.reload20, i64 0
  store i32 %74, ptr %75, align 16
  store i32 26, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load i32, ptr %6, align 4
  %78 = icmp sgt i32 %77, 1
  %79 = select i1 %78, i32 27, i32 28
  store i32 %79, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
  %.reload19 = load ptr, ptr %.reg2mem13, align 8
  %81 = getelementptr inbounds i32, ptr %.reload19, i64 0
  %82 = load i32, ptr %81, align 16
  %83 = mul nsw i32 %82, 2
  %.reload18 = load ptr, ptr %.reg2mem13, align 8
  %84 = getelementptr inbounds i32, ptr %.reload18, i64 1
  store i32 %83, ptr %84, align 4
  store i32 29, ptr %b, align 4
  br label %break

85:                                               ; preds = %switch
  %.reload17 = load ptr, ptr %.reg2mem13, align 8
  %86 = getelementptr inbounds i32, ptr %.reload17, i64 0
  %87 = load i32, ptr %86, align 16
  %88 = sub nsw i32 %87, 1
  %.reload16 = load ptr, ptr %.reg2mem13, align 8
  %89 = getelementptr inbounds i32, ptr %.reload16, i64 1
  store i32 %88, ptr %89, align 4
  store i32 29, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %.reload15 = load ptr, ptr %.reg2mem13, align 8
  %91 = getelementptr inbounds i32, ptr %.reload15, i64 0
  %92 = load i32, ptr %91, align 16
  %.reload14 = load ptr, ptr %.reg2mem13, align 8
  %93 = getelementptr inbounds i32, ptr %.reload14, i64 1
  %94 = load i32, ptr %93, align 4
  %95 = add nsw i32 %92, %94
  %96 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %96)
  ret i32 %95

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b22 = load i32, ptr %b, align 4
  switch i32 %b22, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %16
    i32 4, label %20
    i32 5, label %22
    i32 6, label %26
    i32 7, label %28
    i32 8, label %29
    i32 9, label %30
    i32 10, label %31
    i32 11, label %37
    i32 12, label %41
    i32 13, label %45
    i32 14, label %49
    i32 15, label %53
    i32 16, label %55
    i32 17, label %56
    i32 18, label %57
    i32 19, label %61
    i32 20, label %63
    i32 21, label %64
    i32 22, label %66
    i32 23, label %70
    i32 24, label %72
    i32 25, label %73
    i32 26, label %76
    i32 27, label %80
    i32 28, label %85
    i32 29, label %90
  ]

break:                                            ; preds = %85, %80, %76, %73, %72, %70, %66, %64, %63, %61, %57, %56, %55, %53, %49, %45, %41, %37, %31, %30, %29, %28, %26, %22, %20, %16, %14, %10, %9
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

10:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp sle i32 %12, 0
  %14 = select i1 %13, i32 2, i32 3
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = zext i32 %17 to i64
  %19 = call ptr @llvm.stacksave()
  store ptr %19, ptr %5, align 8
  %20 = alloca i32, i64 %18, align 16
  store ptr %20, ptr %.reg2mem, align 8
  store i64 %18, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %3, align 4
  %24 = icmp slt i32 %22, %23
  %25 = select i1 %24, i32 5, i32 7
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = load i32, ptr %8, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %8, align 4
  %31 = sext i32 %30 to i64
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %32 = getelementptr inbounds i32, ptr %.reload3, i64 %31
  store i32 %29, ptr %32, align 4
  store i32 6, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %8, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 8, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %9, align 4
  %39 = load i32, ptr %3, align 4
  %40 = icmp slt i32 %38, %39
  %41 = select i1 %40, i32 9, i32 14
  store i32 %41, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %9, align 4
  %44 = sext i32 %43 to i64
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %45 = getelementptr inbounds i32, ptr %.reload2, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = icmp sgt i32 %46, 0
  %48 = select i1 %47, i32 10, i32 11
  store i32 %48, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %9, align 4
  %51 = sext i32 %50 to i64
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %52 = getelementptr inbounds i32, ptr %.reload1, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %7, align 4
  store i32 12, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %9, align 4
  %58 = sext i32 %57 to i64
  %.reload = load ptr, ptr %.reg2mem, align 8
  %59 = getelementptr inbounds i32, ptr %.reload, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = load i32, ptr %7, align 4
  %62 = sub nsw i32 %61, %60
  store i32 %62, ptr %7, align 4
  store i32 12, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load i32, ptr %9, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %9, align 4
  store i32 8, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  %68 = load i32, ptr %7, align 4
  store i32 %68, ptr %2, align 4
  %69 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %69)
  store i32 15, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %2, align 4
  ret i32 %71

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %15
    i32 3, label %16
    i32 4, label %21
    i32 5, label %26
    i32 6, label %33
    i32 7, label %36
    i32 8, label %37
    i32 9, label %42
    i32 10, label %49
    i32 11, label %56
    i32 12, label %63
    i32 13, label %64
    i32 14, label %67
    i32 15, label %70
  ]

break:                                            ; preds = %67, %64, %63, %56, %49, %42, %37, %36, %33, %26, %21, %16, %15, %11, %10
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

12:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = icmp sle i32 %14, 0
  %16 = select i1 %15, i32 2, i32 3
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = zext i32 %19 to i64
  %21 = call ptr @llvm.stacksave()
  store ptr %21, ptr %5, align 8
  %22 = alloca i32, i64 %20, align 16
  store i64 %20, ptr %6, align 8
  store ptr %22, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %8, align 4
  %25 = load i32, ptr %3, align 4
  %26 = icmp slt i32 %24, %25
  %27 = select i1 %26, i32 5, i32 11
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load ptr, ptr %7, align 8
  %30 = load i32, ptr %8, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 0, ptr %32, align 4
  store i32 0, ptr %9, align 4
  store i32 6, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %9, align 4
  %35 = load i32, ptr %8, align 4
  %36 = icmp sle i32 %34, %35
  %37 = select i1 %36, i32 7, i32 9
  store i32 %37, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %4, align 4
  %40 = load i32, ptr %9, align 4
  %41 = add nsw i32 %40, 1
  %42 = mul nsw i32 %39, %41
  %43 = load ptr, ptr %7, align 8
  %44 = load i32, ptr %8, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = add nsw i32 %47, %42
  store i32 %48, ptr %46, align 4
  store i32 8, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %9, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %9, align 4
  store i32 6, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 0, ptr %11, align 4
  store i32 12, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load i32, ptr %11, align 4
  %59 = load i32, ptr %3, align 4
  %60 = icmp slt i32 %58, %59
  %61 = select i1 %60, i32 13, i32 15
  store i32 %61, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load ptr, ptr %7, align 8
  %64 = load i32, ptr %11, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %63, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %10, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %10, align 4
  store i32 14, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %11, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %11, align 4
  store i32 12, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %74 = load i32, ptr %10, align 4
  store i32 %74, ptr %2, align 4
  %75 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %75)
  store i32 16, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load i32, ptr %2, align 4
  ret i32 %77

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %12
    i32 1, label %13
    i32 2, label %17
    i32 3, label %18
    i32 4, label %23
    i32 5, label %28
    i32 6, label %33
    i32 7, label %38
    i32 8, label %49
    i32 9, label %52
    i32 10, label %53
    i32 11, label %56
    i32 12, label %57
    i32 13, label %62
    i32 14, label %70
    i32 15, label %73
    i32 16, label %76
  ]

break:                                            ; preds = %73, %70, %62, %57, %56, %53, %52, %49, %38, %33, %28, %23, %18, %17, %13, %12
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %2, align 4
  %13 = icmp slt i32 %11, %12
  store i1 false, ptr %.reg2mem, align 1
  %14 = select i1 %13, i32 2, i32 3
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %5, align 4
  %17 = icmp slt i32 %16, 4
  store i1 %17, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %19 = select i1 %.reload, i32 4, i32 13
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  %23 = zext i32 %22 to i64
  %24 = call ptr @llvm.stacksave()
  store ptr %24, ptr %6, align 8
  %25 = alloca i32, i64 %23, align 16
  store ptr %25, ptr %.reg2mem1, align 8
  store i64 %23, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %8, align 4
  %28 = load i32, ptr %5, align 4
  %29 = icmp sle i32 %27, %28
  %30 = select i1 %29, i32 6, i32 8
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %3, align 4
  %33 = load i32, ptr %8, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32, ptr %8, align 4
  %36 = sext i32 %35 to i64
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %37 = getelementptr inbounds i32, ptr %.reload5, i64 %36
  store i32 %34, ptr %37, align 4
  store i32 7, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %5, align 4
  %43 = sext i32 %42 to i64
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %44 = getelementptr inbounds i32, ptr %.reload4, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = icmp sgt i32 %45, 0
  %47 = select i1 %46, i32 9, i32 10
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %5, align 4
  %50 = sext i32 %49 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %51 = getelementptr inbounds i32, ptr %.reload3, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = load i32, ptr %4, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %4, align 4
  store i32 11, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %5, align 4
  %57 = sext i32 %56 to i64
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %58 = getelementptr inbounds i32, ptr %.reload2, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %4, align 4
  %61 = sub nsw i32 %60, %59
  store i32 %61, ptr %4, align 4
  store i32 11, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %63)
  store i32 12, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load i32, ptr %5, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  %68 = load i32, ptr %4, align 4
  ret i32 %68

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %15
    i32 3, label %18
    i32 4, label %20
    i32 5, label %26
    i32 6, label %31
    i32 7, label %38
    i32 8, label %41
    i32 9, label %48
    i32 10, label %55
    i32 11, label %62
    i32 12, label %64
    i32 13, label %67
  ]

break:                                            ; preds = %64, %62, %55, %48, %41, %38, %31, %26, %20, %18, %15, %10, %9
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

11:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp sle i32 %13, %14
  %16 = select i1 %15, i32 2, i32 7
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %6, align 4
  %19 = srem i32 %18, 2
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 3, i32 4
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  %35 = zext i32 %34 to i64
  %36 = call ptr @llvm.stacksave()
  store ptr %36, ptr %7, align 8
  %37 = alloca i32, i64 %35, align 16
  store ptr %37, ptr %.reg2mem, align 8
  store i64 %35, ptr %8, align 8
  %38 = load i32, ptr %4, align 4
  %.reload6 = load ptr, ptr %.reg2mem, align 8
  %39 = getelementptr inbounds i32, ptr %.reload6, i64 0
  store i32 %38, ptr %39, align 16
  store i32 1, ptr %9, align 4
  store i32 8, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %9, align 4
  %42 = load i32, ptr %5, align 4
  %43 = icmp slt i32 %41, %42
  %44 = select i1 %43, i32 9, i32 11
  store i32 %44, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %9, align 4
  %47 = sub nsw i32 %46, 1
  %48 = sext i32 %47 to i64
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %49 = getelementptr inbounds i32, ptr %.reload5, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %9, align 4
  %52 = add nsw i32 %50, %51
  %53 = load i32, ptr %9, align 4
  %54 = sext i32 %53 to i64
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %55 = getelementptr inbounds i32, ptr %.reload4, i64 %54
  store i32 %52, ptr %55, align 4
  store i32 10, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %9, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %9, align 4
  store i32 8, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %5, align 4
  %61 = sub nsw i32 %60, 1
  %62 = sext i32 %61 to i64
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %63 = getelementptr inbounds i32, ptr %.reload3, i64 %62
  %64 = load i32, ptr %63, align 4
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %65 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %66 = load i32, ptr %65, align 16
  %67 = icmp sgt i32 %64, %66
  %68 = select i1 %67, i32 12, i32 13
  store i32 %68, ptr %b, align 4
  br label %break

69:                                               ; preds = %switch
  %70 = load i32, ptr %5, align 4
  %71 = sub nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %73 = getelementptr inbounds i32, ptr %.reload1, i64 %72
  %74 = load i32, ptr %73, align 4
  store i32 %74, ptr %2, align 4
  store i32 1, ptr %10, align 4
  store i32 14, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %76 = getelementptr inbounds i32, ptr %.reload, i64 0
  %77 = load i32, ptr %76, align 16
  store i32 %77, ptr %2, align 4
  store i32 1, ptr %10, align 4
  store i32 14, ptr %b, align 4
  br label %break

78:                                               ; preds = %switch
  %79 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %79)
  %80 = load i32, ptr %2, align 4
  ret i32 %80

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %11
    i32 1, label %12
    i32 2, label %17
    i32 3, label %22
    i32 4, label %26
    i32 5, label %29
    i32 6, label %30
    i32 7, label %33
    i32 8, label %40
    i32 9, label %45
    i32 10, label %56
    i32 11, label %59
    i32 12, label %69
    i32 13, label %75
    i32 14, label %78
  ]

break:                                            ; preds = %75, %69, %59, %56, %45, %40, %33, %30, %29, %26, %22, %17, %12, %11
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_93_global_loop() #0 {
entry:
  %0 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

1:                                                ; preds = %switch
  store i32 0, ptr @g_void_result, align 4
  store i32 0, ptr %0, align 4
  store i32 1, ptr %b, align 4
  br label %break

2:                                                ; preds = %switch
  %3 = load i32, ptr %0, align 4
  %4 = load i32, ptr @g_n, align 4
  %5 = icmp slt i32 %3, %4
  %6 = select i1 %5, i32 2, i32 7
  store i32 %6, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr @g_x, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 3, i32 4
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr @g_x, align 4
  %13 = load i32, ptr %0, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr @g_z, align 4
  %19 = load i32, ptr @g_void_result, align 4
  %20 = sub nsw i32 %19, %18
  store i32 %20, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %0, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %0, align 4
  store i32 1, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr @g_void_result, align 4
  ret i32 %26

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %2
    i32 2, label %7
    i32 3, label %11
    i32 4, label %17
    i32 5, label %21
    i32 6, label %22
    i32 7, label %25
  ]

break:                                            ; preds = %22, %21, %17, %11, %7, %2, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_94_void_loop(i32 noundef %0, i32 noundef %1) #0 {
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
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 7
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  %14 = select i1 %13, i32 3, i32 4
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr @g_void_result, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr @g_void_result, align 4
  %22 = sub nsw i32 %21, %20
  store i32 %22, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %15
    i32 4, label %19
    i32 5, label %23
    i32 6, label %24
    i32 7, label %27
  ]

break:                                            ; preds = %24, %23, %19, %15, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_95_void_loop_pointer(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %10, %11
  %13 = select i1 %12, i32 2, i32 7
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = srem i32 %15, 2
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 3, i32 4
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %20, %21
  %23 = load ptr, ptr %3, align 8
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %23, i64 %25
  store i32 %22, ptr %26, align 4
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %6, align 4
  %30 = sub nsw i32 %28, %29
  %31 = load ptr, ptr %3, align 8
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, ptr %31, i64 %33
  store i32 %30, ptr %34, align 4
  store i32 5, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 8, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %7, align 4
  %42 = load i32, ptr %4, align 4
  %43 = icmp slt i32 %41, %42
  %44 = select i1 %43, i32 9, i32 11
  store i32 %44, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load ptr, ptr %3, align 8
  %47 = load i32, ptr %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, ptr %46, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr @g_void_result, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr @g_void_result, align 4
  store i32 10, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %7, align 4
  store i32 8, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %14
    i32 3, label %19
    i32 4, label %27
    i32 5, label %35
    i32 6, label %36
    i32 7, label %39
    i32 8, label %40
    i32 9, label %45
    i32 10, label %53
    i32 11, label %56
  ]

break:                                            ; preds = %53, %45, %40, %39, %36, %35, %27, %19, %14, %9, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_96_goto_break(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 6
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add nsw i32 %13, %14
  %16 = icmp sgt i32 %15, 20
  %17 = select i1 %16, i32 3, i32 4
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %4, align 4
  ret i32 %30

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %18
    i32 4, label %19
    i32 5, label %25
    i32 6, label %28
    i32 7, label %29
  ]

break:                                            ; preds = %28, %25, %19, %18, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_97_goto_nested_loop(i32 noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 10
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = srem i32 %22, 2
  %24 = icmp eq i32 %23, 0
  %25 = select i1 %24, i32 6, i32 7
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  %33 = mul nsw i32 %32, 10
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %5, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %4, align 4
  ret i32 %40

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %16
    i32 4, label %17
    i32 5, label %21
    i32 6, label %26
    i32 7, label %27
    i32 8, label %31
    i32 9, label %36
    i32 10, label %39
  ]

break:                                            ; preds = %36, %31, %27, %26, %21, %17, %16, %12, %7, %6
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  store i32 %14, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %17 = zext i32 %.reload to i64
  %18 = call ptr @llvm.stacksave()
  store ptr %18, ptr %5, align 8
  %19 = alloca i32, i64 %17, align 16
  store ptr %19, ptr %.reg2mem1, align 8
  store i64 %17, ptr %6, align 8
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = icmp sle i32 %21, 0
  %23 = select i1 %22, i32 6, i32 7
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %.reload7 = load ptr, ptr %.reg2mem1, align 8
  %27 = getelementptr inbounds i32, ptr %.reload7, i64 0
  store i32 %26, ptr %27, align 16
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = icmp sgt i32 %29, 2
  %31 = select i1 %30, i32 9, i32 10
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %.reload6 = load ptr, ptr %.reg2mem1, align 8
  %34 = getelementptr inbounds i32, ptr %.reload6, i64 0
  %35 = load i32, ptr %34, align 16
  %36 = add nsw i32 %35, 10
  store i32 %36, ptr %34, align 16
  store i32 12, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %4, align 4
  %39 = mul nsw i32 %38, 2
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %40 = getelementptr inbounds i32, ptr %.reload5, i64 1
  store i32 %39, ptr %40, align 4
  store i32 12, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %42 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %43 = load i32, ptr %42, align 16
  %44 = icmp sgt i32 %43, 0
  %45 = select i1 %44, i32 13, i32 14
  store i32 %45, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  store i32 15, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %48 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %49 = load i32, ptr %48, align 16
  %50 = sub nsw i32 %49, 1
  store i32 %50, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 17, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %52 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %53 = load i32, ptr %52, align 16
  store i32 %53, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 17, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 17, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %56)
  %57 = load i32, ptr %2, align 4
  ret i32 %57

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b8 = load i32, ptr %b, align 4
  switch i32 %b8, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %15
    i32 4, label %16
    i32 5, label %20
    i32 6, label %24
    i32 7, label %25
    i32 8, label %28
    i32 9, label %32
    i32 10, label %33
    i32 11, label %37
    i32 12, label %41
    i32 13, label %46
    i32 14, label %47
    i32 15, label %51
    i32 16, label %54
    i32 17, label %55
  ]

break:                                            ; preds = %54, %51, %47, %46, %41, %37, %33, %32, %28, %25, %24, %20, %16, %15, %13, %9, %8
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sle i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 18, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = mul i64 %17, 4
  %19 = call noalias ptr @malloc(i64 noundef %18) #6
  store ptr %19, ptr %5, align 8
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load ptr, ptr %5, align 8
  %22 = icmp eq ptr %21, null
  %23 = select i1 %22, i32 5, i32 6
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 -2, ptr %2, align 4
  store i32 18, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %3, align 4
  %29 = icmp slt i32 %27, %28
  %30 = select i1 %29, i32 8, i32 13
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  %33 = srem i32 %32, 2
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 9, i32 10
  store i32 %35, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %4, align 4
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %37, %38
  %40 = load ptr, ptr %5, align 8
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, ptr %40, i64 %42
  store i32 %39, ptr %43, align 4
  store i32 11, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %4, align 4
  %46 = load i32, ptr %6, align 4
  %47 = sub nsw i32 %45, %46
  %48 = load ptr, ptr %5, align 8
  %49 = load i32, ptr %6, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, ptr %48, i64 %50
  store i32 %47, ptr %51, align 4
  store i32 11, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %6, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 14, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load i32, ptr %8, align 4
  %59 = load i32, ptr %3, align 4
  %60 = icmp slt i32 %58, %59
  %61 = select i1 %60, i32 15, i32 17
  store i32 %61, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load ptr, ptr %5, align 8
  %64 = load i32, ptr %8, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %63, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %7, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %7, align 4
  store i32 16, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %8, align 4
  store i32 14, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %74 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %74) #7
  %75 = load i32, ptr %7, align 4
  store i32 %75, ptr %2, align 4
  store i32 18, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load i32, ptr %2, align 4
  ret i32 %77

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %15
    i32 4, label %20
    i32 5, label %24
    i32 6, label %25
    i32 7, label %26
    i32 8, label %31
    i32 9, label %36
    i32 10, label %44
    i32 11, label %52
    i32 12, label %53
    i32 13, label %56
    i32 14, label %57
    i32 15, label %62
    i32 16, label %70
    i32 17, label %73
    i32 18, label %76
  ]

break:                                            ; preds = %73, %70, %62, %57, %56, %53, %52, %44, %36, %31, %26, %25, %24, %20, %15, %14, %10, %9
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

14:                                               ; preds = %switch
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  %15 = load i32, ptr @g_x, align 4
  store i32 %15, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 0
  %19 = select i1 %18, i32 2, i32 3
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  store i32 %21, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %24 = zext i32 %.reload to i64
  %25 = call ptr @llvm.stacksave()
  store ptr %25, ptr %9, align 8
  %26 = alloca i32, i64 %24, align 16
  store ptr %26, ptr %.reg2mem9, align 8
  store i64 %24, ptr %10, align 8
  store i32 0, ptr %11, align 4
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %11, align 4
  store i32 %28, ptr %.reg2mem7, align 4
  store i32 6, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  %31 = icmp sgt i32 %30, 0
  %32 = select i1 %31, i32 7, i32 8
  store i32 %32, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  store i32 %34, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %37 = icmp slt i32 %.reload8, %.reload2
  %38 = select i1 %37, i32 10, i32 12
  store i32 %38, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  %41 = load i32, ptr %11, align 4
  %42 = add nsw i32 %40, %41
  %43 = load i32, ptr %11, align 4
  %44 = sext i32 %43 to i64
  %.reload13 = load ptr, ptr %.reg2mem9, align 8
  %45 = getelementptr inbounds i32, ptr %.reload13, i64 %44
  store i32 %42, ptr %45, align 4
  store i32 11, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %11, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %11, align 4
  store i32 5, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 13, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %12, align 4
  store i32 %51, ptr %.reg2mem14, align 4
  store i32 14, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %5, align 4
  %54 = icmp sgt i32 %53, 0
  %55 = select i1 %54, i32 15, i32 16
  store i32 %55, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %5, align 4
  store i32 %57, ptr %.reg2mem3, align 4
  store i32 17, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem3, align 4
  store i32 17, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload15 = load i32, ptr %.reg2mem14, align 4
  %60 = icmp slt i32 %.reload15, %.reload4
  %61 = select i1 %60, i32 18, i32 37
  store i32 %61, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load i32, ptr %12, align 4
  %64 = sext i32 %63 to i64
  %.reload12 = load ptr, ptr %.reg2mem9, align 8
  %65 = getelementptr inbounds i32, ptr %.reload12, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = load i32, ptr %7, align 4
  %68 = icmp sgt i32 %66, %67
  %69 = select i1 %68, i32 19, i32 31
  store i32 %69, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  store i32 0, ptr %13, align 4
  store i32 20, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %72 = load i32, ptr %13, align 4
  %73 = icmp slt i32 %72, 8
  %74 = select i1 %73, i32 21, i32 30
  store i32 %74, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  %76 = load i32, ptr %13, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = icmp sgt i32 %79, 0
  %81 = select i1 %80, i32 22, i32 24
  store i32 %81, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  %83 = load i32, ptr %13, align 4
  %84 = srem i32 %83, 2
  %85 = icmp eq i32 %84, 0
  %86 = select i1 %85, i32 23, i32 24
  store i32 %86, ptr %b, align 4
  br label %break

87:                                               ; preds = %switch
  %88 = load i32, ptr %13, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = load i32, ptr %12, align 4
  %93 = sext i32 %92 to i64
  %.reload11 = load ptr, ptr %.reg2mem9, align 8
  %94 = getelementptr inbounds i32, ptr %.reload11, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = sub nsw i32 %91, %95
  %97 = load i32, ptr %8, align 4
  %98 = add nsw i32 %97, %96
  store i32 %98, ptr %8, align 4
  store i32 28, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  %100 = load ptr, ptr %4, align 8
  %101 = icmp ne ptr %100, null
  %102 = select i1 %101, i32 25, i32 27
  store i32 %102, ptr %b, align 4
  br label %break

103:                                              ; preds = %switch
  %104 = load ptr, ptr %4, align 8
  %105 = load i32, ptr %104, align 4
  %106 = icmp sgt i32 %105, 0
  %107 = select i1 %106, i32 26, i32 27
  store i32 %107, ptr %b, align 4
  br label %break

108:                                              ; preds = %switch
  %109 = load ptr, ptr %4, align 8
  %110 = load i32, ptr %109, align 4
  %111 = load i32, ptr %8, align 4
  %112 = add nsw i32 %111, %110
  store i32 %112, ptr %8, align 4
  store i32 27, ptr %b, align 4
  br label %break

113:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %break

114:                                              ; preds = %switch
  store i32 29, ptr %b, align 4
  br label %break

115:                                              ; preds = %switch
  %116 = load i32, ptr %13, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %13, align 4
  store i32 20, ptr %b, align 4
  br label %break

118:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

119:                                              ; preds = %switch
  %120 = load i32, ptr %12, align 4
  %121 = sext i32 %120 to i64
  %.reload10 = load ptr, ptr %.reg2mem9, align 8
  %122 = getelementptr inbounds i32, ptr %.reload10, i64 %121
  %123 = load i32, ptr %122, align 4
  %124 = load i32, ptr %8, align 4
  %125 = sub nsw i32 %124, %123
  store i32 %125, ptr %8, align 4
  store i32 32, ptr %b, align 4
  br label %break

126:                                              ; preds = %switch
  %127 = load i32, ptr %6, align 4
  %128 = srem i32 %127, 3
  %129 = load i32, ptr %7, align 4
  %130 = load i32, ptr %6, align 4
  %131 = sub nsw i32 %130, 1
  %132 = mul nsw i32 5, %131
  %133 = add nsw i32 %129, %132
  %134 = srem i32 %133, 3
  %135 = icmp eq i32 %128, %134
  %136 = select i1 %135, i32 33, i32 34
  store i32 %136, ptr %b, align 4
  br label %break

137:                                              ; preds = %switch
  %138 = load i32, ptr %8, align 4
  %139 = add nsw i32 %138, 7
  store i32 %139, ptr %8, align 4
  store i32 34, ptr %b, align 4
  br label %break

140:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

141:                                              ; preds = %switch
  store i32 36, ptr %b, align 4
  br label %break

142:                                              ; preds = %switch
  %143 = load i32, ptr %12, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, ptr %12, align 4
  store i32 13, ptr %b, align 4
  br label %break

145:                                              ; preds = %switch
  %146 = load i32, ptr %8, align 4
  %147 = icmp sgt i32 %146, 0
  %148 = select i1 %147, i32 38, i32 39
  store i32 %148, ptr %b, align 4
  br label %break

149:                                              ; preds = %switch
  %150 = load i32, ptr %8, align 4
  store i32 %150, ptr %.reg2mem5, align 4
  store i32 40, ptr %b, align 4
  br label %break

151:                                              ; preds = %switch
  %152 = load i32, ptr %8, align 4
  %153 = sub nsw i32 0, %152
  store i32 %153, ptr %.reg2mem5, align 4
  store i32 40, ptr %b, align 4
  br label %break

154:                                              ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %155 = load ptr, ptr %9, align 8
  call void @llvm.stackrestore(ptr %155)
  ret i32 %.reload6

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b16 = load i32, ptr %b, align 4
  switch i32 %b16, label %default [
    i32 0, label %14
    i32 1, label %16
    i32 2, label %20
    i32 3, label %22
    i32 4, label %23
    i32 5, label %27
    i32 6, label %29
    i32 7, label %33
    i32 8, label %35
    i32 9, label %36
    i32 10, label %39
    i32 11, label %46
    i32 12, label %49
    i32 13, label %50
    i32 14, label %52
    i32 15, label %56
    i32 16, label %58
    i32 17, label %59
    i32 18, label %62
    i32 19, label %70
    i32 20, label %71
    i32 21, label %75
    i32 22, label %82
    i32 23, label %87
    i32 24, label %99
    i32 25, label %103
    i32 26, label %108
    i32 27, label %113
    i32 28, label %114
    i32 29, label %115
    i32 30, label %118
    i32 31, label %119
    i32 32, label %126
    i32 33, label %137
    i32 34, label %140
    i32 35, label %141
    i32 36, label %142
    i32 37, label %145
    i32 38, label %149
    i32 39, label %151
    i32 40, label %154
  ]

break:                                            ; preds = %151, %149, %145, %142, %141, %140, %137, %126, %119, %118, %115, %114, %113, %108, %103, %99, %87, %82, %75, %71, %70, %62, %59, %58, %56, %52, %50, %49, %46, %39, %36, %35, %33, %29, %27, %23, %22, %20, %16, %14
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

17:                                               ; preds = %switch
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %18 = load i32, ptr %8, align 4
  %19 = load i32, ptr @g_x, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %11, align 4
  store i32 1, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %7, align 4
  %23 = icmp sgt i32 %22, 0
  %24 = select i1 %23, i32 2, i32 3
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %7, align 4
  store i32 %26, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %29 = zext i32 %.reload to i64
  %30 = call ptr @llvm.stacksave()
  store ptr %30, ptr %12, align 8
  %31 = alloca i32, i64 %29, align 16
  store ptr %31, ptr %.reg2mem9, align 8
  store i64 %29, ptr %13, align 8
  store i32 5, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %8, align 4
  %34 = load i32, ptr %9, align 4
  %35 = icmp sgt i32 %33, %34
  %36 = select i1 %35, i32 6, i32 7
  store i32 %36, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %10, align 4
  %39 = icmp ne i32 %38, 0
  %40 = select i1 %39, i32 9, i32 7
  store i32 %40, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %9, align 4
  %43 = load i32, ptr %10, align 4
  %44 = icmp sgt i32 %42, %43
  %45 = select i1 %44, i32 8, i32 10
  store i32 %45, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %8, align 4
  %48 = icmp ne i32 %47, 0
  %49 = select i1 %48, i32 9, i32 10
  store i32 %49, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  store i32 0, ptr %14, align 4
  store i32 11, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %14, align 4
  store i32 %53, ptr %.reg2mem7, align 4
  store i32 12, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  %55 = load i32, ptr %7, align 4
  %56 = icmp sgt i32 %55, 0
  %57 = select i1 %56, i32 13, i32 14
  store i32 %57, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %7, align 4
  store i32 %59, ptr %.reg2mem1, align 4
  store i32 15, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem1, align 4
  store i32 15, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %62 = icmp slt i32 %.reload8, %.reload2
  %63 = select i1 %62, i32 16, i32 18
  store i32 %63, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load i32, ptr %8, align 4
  %66 = sub nsw i32 0, %65
  %67 = load i32, ptr %14, align 4
  %68 = add nsw i32 %66, %67
  %69 = load i32, ptr %14, align 4
  %70 = sext i32 %69 to i64
  %.reload15 = load ptr, ptr %.reg2mem9, align 8
  %71 = getelementptr inbounds i32, ptr %.reload15, i64 %70
  store i32 %68, ptr %71, align 4
  store i32 17, ptr %b, align 4
  br label %break

72:                                               ; preds = %switch
  %73 = load i32, ptr %14, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %14, align 4
  store i32 11, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  %.reload14 = load ptr, ptr %.reg2mem9, align 8
  %76 = getelementptr inbounds i32, ptr %.reload14, i64 0
  %77 = load i32, ptr %76, align 16
  %78 = load i32, ptr %11, align 4
  %79 = sub nsw i32 %78, %77
  store i32 %79, ptr %11, align 4
  store i32 42, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
  store i32 0, ptr %15, align 4
  store i32 20, ptr %b, align 4
  br label %break

81:                                               ; preds = %switch
  %82 = load i32, ptr %15, align 4
  store i32 %82, ptr %.reg2mem16, align 4
  store i32 21, ptr %b, align 4
  br label %break

83:                                               ; preds = %switch
  %84 = load i32, ptr %7, align 4
  %85 = icmp sgt i32 %84, 0
  %86 = select i1 %85, i32 22, i32 23
  store i32 %86, ptr %b, align 4
  br label %break

87:                                               ; preds = %switch
  %88 = load i32, ptr %7, align 4
  store i32 %88, ptr %.reg2mem3, align 4
  store i32 24, ptr %b, align 4
  br label %break

89:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem3, align 4
  store i32 24, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload17 = load i32, ptr %.reg2mem16, align 4
  %91 = icmp slt i32 %.reload17, %.reload4
  %92 = select i1 %91, i32 25, i32 37
  store i32 %92, ptr %b, align 4
  br label %break

93:                                               ; preds = %switch
  %94 = load i32, ptr %9, align 4
  %95 = load i32, ptr %15, align 4
  %96 = add nsw i32 %94, %95
  %97 = load i32, ptr %15, align 4
  %98 = sext i32 %97 to i64
  %.reload13 = load ptr, ptr %.reg2mem9, align 8
  %99 = getelementptr inbounds i32, ptr %.reload13, i64 %98
  store i32 %96, ptr %99, align 4
  store i32 26, ptr %b, align 4
  br label %break

100:                                              ; preds = %switch
  %101 = load i32, ptr %15, align 4
  %102 = sext i32 %101 to i64
  %.reload12 = load ptr, ptr %.reg2mem9, align 8
  %103 = getelementptr inbounds i32, ptr %.reload12, i64 %102
  %104 = load i32, ptr %103, align 4
  %105 = load i32, ptr @g_z, align 4
  %106 = icmp sgt i32 %104, %105
  %107 = select i1 %106, i32 27, i32 31
  store i32 %107, ptr %b, align 4
  br label %break

108:                                              ; preds = %switch
  %109 = load ptr, ptr %6, align 8
  %110 = load i32, ptr %109, align 4
  %111 = icmp sgt i32 %110, 0
  %112 = select i1 %111, i32 28, i32 29
  store i32 %112, ptr %b, align 4
  br label %break

113:                                              ; preds = %switch
  %114 = load i32, ptr %15, align 4
  %115 = sext i32 %114 to i64
  %.reload11 = load ptr, ptr %.reg2mem9, align 8
  %116 = getelementptr inbounds i32, ptr %.reload11, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = load i32, ptr %11, align 4
  %119 = add nsw i32 %118, %117
  store i32 %119, ptr %11, align 4
  store i32 30, ptr %b, align 4
  br label %break

120:                                              ; preds = %switch
  %121 = load i32, ptr %15, align 4
  %122 = sext i32 %121 to i64
  %.reload10 = load ptr, ptr %.reg2mem9, align 8
  %123 = getelementptr inbounds i32, ptr %.reload10, i64 %122
  %124 = load i32, ptr %123, align 4
  %125 = load i32, ptr %11, align 4
  %126 = sub nsw i32 %125, %124
  store i32 %126, ptr %11, align 4
  store i32 30, ptr %b, align 4
  br label %break

127:                                              ; preds = %switch
  store i32 34, ptr %b, align 4
  br label %break

128:                                              ; preds = %switch
  %129 = load i32, ptr %15, align 4
  %130 = icmp eq i32 %129, 0
  %131 = select i1 %130, i32 32, i32 33
  store i32 %131, ptr %b, align 4
  br label %break

132:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

133:                                              ; preds = %switch
  %134 = load i32, ptr %11, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, ptr %11, align 4
  store i32 34, ptr %b, align 4
  br label %break

136:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

137:                                              ; preds = %switch
  %138 = load i32, ptr %11, align 4
  %139 = load ptr, ptr %6, align 8
  %140 = load i32, ptr %15, align 4
  %141 = srem i32 %140, 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, ptr %139, i64 %142
  store i32 %138, ptr %143, align 4
  store i32 36, ptr %b, align 4
  br label %break

144:                                              ; preds = %switch
  %145 = load i32, ptr %15, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, ptr %15, align 4
  store i32 20, ptr %b, align 4
  br label %break

147:                                              ; preds = %switch
  %148 = load i32, ptr %11, align 4
  %149 = load i32, ptr @g_z, align 4
  %150 = icmp sgt i32 %148, %149
  %151 = select i1 %150, i32 38, i32 41
  store i32 %151, ptr %b, align 4
  br label %break

152:                                              ; preds = %switch
  %153 = load i32, ptr %8, align 4
  %154 = load i32, ptr %9, align 4
  %155 = load i32, ptr %10, align 4
  %156 = sdiv i32 %155, 10
  %157 = load i32, ptr %8, align 4
  %158 = sub nsw i32 %157, 1
  %159 = mul nsw i32 %156, %158
  %160 = add nsw i32 %154, %159
  %161 = icmp eq i32 %153, %160
  %162 = select i1 %161, i32 39, i32 40
  store i32 %162, ptr %b, align 4
  br label %break

163:                                              ; preds = %switch
  %164 = load i32, ptr %11, align 4
  %165 = add nsw i32 %164, 100
  store i32 %165, ptr %5, align 4
  store i32 1, ptr %16, align 4
  store i32 46, ptr %b, align 4
  br label %break

166:                                              ; preds = %switch
  %167 = load i32, ptr %11, align 4
  %168 = add nsw i32 %167, 200
  store i32 %168, ptr %5, align 4
  store i32 1, ptr %16, align 4
  store i32 46, ptr %b, align 4
  br label %break

169:                                              ; preds = %switch
  store i32 42, ptr %b, align 4
  br label %break

170:                                              ; preds = %switch
  %171 = load i32, ptr %11, align 4
  %172 = icmp sgt i32 %171, 0
  %173 = select i1 %172, i32 43, i32 44
  store i32 %173, ptr %b, align 4
  br label %break

174:                                              ; preds = %switch
  %175 = load i32, ptr %11, align 4
  %176 = mul nsw i32 %175, 2
  store i32 %176, ptr %.reg2mem5, align 4
  store i32 45, ptr %b, align 4
  br label %break

177:                                              ; preds = %switch
  %178 = load i32, ptr %11, align 4
  %179 = sub nsw i32 0, %178
  store i32 %179, ptr %.reg2mem5, align 4
  store i32 45, ptr %b, align 4
  br label %break

180:                                              ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %5, align 4
  store i32 1, ptr %16, align 4
  store i32 46, ptr %b, align 4
  br label %break

181:                                              ; preds = %switch
  %182 = load ptr, ptr %12, align 8
  call void @llvm.stackrestore(ptr %182)
  %183 = load i32, ptr %5, align 4
  ret i32 %183

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b18 = load i32, ptr %b, align 4
  switch i32 %b18, label %default [
    i32 0, label %17
    i32 1, label %21
    i32 2, label %25
    i32 3, label %27
    i32 4, label %28
    i32 5, label %32
    i32 6, label %37
    i32 7, label %41
    i32 8, label %46
    i32 9, label %50
    i32 10, label %51
    i32 11, label %52
    i32 12, label %54
    i32 13, label %58
    i32 14, label %60
    i32 15, label %61
    i32 16, label %64
    i32 17, label %72
    i32 18, label %75
    i32 19, label %80
    i32 20, label %81
    i32 21, label %83
    i32 22, label %87
    i32 23, label %89
    i32 24, label %90
    i32 25, label %93
    i32 26, label %100
    i32 27, label %108
    i32 28, label %113
    i32 29, label %120
    i32 30, label %127
    i32 31, label %128
    i32 32, label %132
    i32 33, label %133
    i32 34, label %136
    i32 35, label %137
    i32 36, label %144
    i32 37, label %147
    i32 38, label %152
    i32 39, label %163
    i32 40, label %166
    i32 41, label %169
    i32 42, label %170
    i32 43, label %174
    i32 44, label %177
    i32 45, label %180
    i32 46, label %181
  ]

break:                                            ; preds = %180, %177, %174, %170, %169, %166, %163, %152, %147, %144, %137, %136, %133, %132, %128, %127, %120, %113, %108, %100, %93, %90, %89, %87, %83, %81, %80, %75, %72, %64, %61, %60, %58, %54, %52, %51, %50, %46, %41, %37, %32, %28, %27, %25, %21, %17
  br label %switch
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 1
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @atoi(ptr noundef %16) #8
  store i32 %17, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 4, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %20 = load i32, ptr %5, align 4
  %21 = call i32 @_0_if_only(i32 noundef %20)
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %6, align 4
  %24 = load i32, ptr %5, align 4
  %25 = call i32 @_1_if_else(i32 noundef %24)
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  %28 = load i32, ptr %5, align 4
  %29 = call i32 @_2_if_with_surrounding_code(i32 noundef %28)
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  %32 = load i32, ptr %5, align 4
  %33 = call i32 @_3_if_compound(i32 noundef %32)
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %6, align 4
  %36 = load i32, ptr %5, align 4
  %37 = call i32 @_4_if_else_compound(i32 noundef %36)
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %6, align 4
  %40 = load i32, ptr %5, align 4
  %41 = call i32 @_5_if_equal(i32 noundef %40, i32 noundef 4)
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %6, align 4
  %44 = load i32, ptr %5, align 4
  %45 = call i32 @_6_if_not_equal(i32 noundef %44, i32 noundef 4)
  %46 = load i32, ptr %6, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %6, align 4
  %48 = load i32, ptr %5, align 4
  %49 = call i32 @_7_relational(i32 noundef %48, i32 noundef 4)
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %6, align 4
  %52 = load i32, ptr %5, align 4
  %53 = icmp sgt i32 %52, 0
  %54 = load i32, ptr %5, align 4
  %55 = call i32 @_8_boolean_argument(i1 noundef zeroext %53, i32 noundef %54)
  %56 = load i32, ptr %6, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %6, align 4
  %58 = load i32, ptr %5, align 4
  %59 = call i32 @_9_if_elseif_else(i32 noundef %58)
  %60 = load i32, ptr %6, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, ptr %6, align 4
  %62 = load i32, ptr %5, align 4
  %63 = call i32 @_10_multiple_elseif(i32 noundef %62)
  %64 = load i32, ptr %6, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %6, align 4
  %66 = load i32, ptr %5, align 4
  %67 = call i32 @_11_elseif_expressions(i32 noundef %66, i32 noundef 4)
  %68 = load i32, ptr %6, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %6, align 4
  %70 = load i32, ptr %5, align 4
  %71 = call i32 @_12_and(i32 noundef %70, i32 noundef 3)
  %72 = load i32, ptr %6, align 4
  %73 = add nsw i32 %72, %71
  store i32 %73, ptr %6, align 4
  %74 = load i32, ptr %5, align 4
  %75 = call i32 @_13_or(i32 noundef %74, i32 noundef -3)
  %76 = load i32, ptr %6, align 4
  %77 = add nsw i32 %76, %75
  store i32 %77, ptr %6, align 4
  %78 = load i32, ptr %5, align 4
  %79 = call i32 @_14_and_or(i32 noundef %78, i32 noundef 2, i32 noundef -1)
  %80 = load i32, ptr %6, align 4
  %81 = add nsw i32 %80, %79
  store i32 %81, ptr %6, align 4
  %82 = load i32, ptr %5, align 4
  %83 = call i32 @_15_or_and(i32 noundef %82, i32 noundef 0, i32 noundef 20)
  %84 = load i32, ptr %6, align 4
  %85 = add nsw i32 %84, %83
  store i32 %85, ptr %6, align 4
  %86 = load i32, ptr %5, align 4
  %87 = call i32 @_16_complex_boolean(i32 noundef %86, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %88 = load i32, ptr %6, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, ptr %6, align 4
  %90 = load i32, ptr %5, align 4
  %91 = call i32 @_17_nested_arithmetic_condition(i32 noundef %90, i32 noundef 1, i32 noundef 20)
  %92 = load i32, ptr %6, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, ptr %6, align 4
  %94 = load i32, ptr %5, align 4
  %95 = call i32 @_18_deep_parentheses(i32 noundef %94, i32 noundef 2, i32 noundef 3)
  %96 = load i32, ptr %6, align 4
  %97 = add nsw i32 %96, %95
  store i32 %97, ptr %6, align 4
  %98 = load i32, ptr %5, align 4
  %99 = call i32 @_19_arithmetic_boolean(i32 noundef %98, i32 noundef 2, i32 noundef 5)
  %100 = load i32, ptr %6, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, ptr %6, align 4
  %102 = load i32, ptr %5, align 4
  %103 = call i32 @_20_nested_boolean_parentheses(i32 noundef %102, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %104 = load i32, ptr %6, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, ptr %6, align 4
  %106 = load i32, ptr %5, align 4
  %107 = call i32 @_21_nested_if(i32 noundef %106, i32 noundef 3)
  %108 = load i32, ptr %6, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %6, align 4
  %110 = load i32, ptr %5, align 4
  %111 = call i32 @_22_nested_in_else(i32 noundef %110, i32 noundef 3)
  %112 = load i32, ptr %6, align 4
  %113 = add nsw i32 %112, %111
  store i32 %113, ptr %6, align 4
  %114 = load i32, ptr %5, align 4
  %115 = call i32 @_23_nested_if_else(i32 noundef %114, i32 noundef 3, i32 noundef 5)
  %116 = load i32, ptr %6, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, ptr %6, align 4
  %118 = load i32, ptr %5, align 4
  %119 = call i32 @_24_three_level_nesting(i32 noundef %118, i32 noundef 3, i32 noundef 5)
  %120 = load i32, ptr %6, align 4
  %121 = add nsw i32 %120, %119
  store i32 %121, ptr %6, align 4
  %122 = load i32, ptr %5, align 4
  %123 = call i32 @_25_deep_nested_values(i32 noundef %122, i32 noundef 3, i32 noundef 10)
  %124 = load i32, ptr %6, align 4
  %125 = add nsw i32 %124, %123
  store i32 %125, ptr %6, align 4
  %126 = load i32, ptr %5, align 4
  %127 = call i32 @_26_nested_and(i32 noundef %126, i32 noundef 3, i32 noundef 5)
  %128 = load i32, ptr %6, align 4
  %129 = add nsw i32 %128, %127
  store i32 %129, ptr %6, align 4
  %130 = load i32, ptr %5, align 4
  %131 = call i32 @_27_nested_or(i32 noundef %130, i32 noundef 0, i32 noundef 20)
  %132 = load i32, ptr %6, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, ptr %6, align 4
  %134 = load i32, ptr %5, align 4
  %135 = call i32 @_28_nested_complex_boolean(i32 noundef %134, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %136 = load i32, ptr %6, align 4
  %137 = add nsw i32 %136, %135
  store i32 %137, ptr %6, align 4
  %138 = load i32, ptr %5, align 4
  %139 = call i32 @_29_independent_ifs(i32 noundef %138)
  %140 = load i32, ptr %6, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, ptr %6, align 4
  %142 = load i32, ptr %5, align 4
  %143 = call i32 @_30_independent_if_else(i32 noundef %142, i32 noundef 3)
  %144 = load i32, ptr %6, align 4
  %145 = add nsw i32 %144, %143
  store i32 %145, ptr %6, align 4
  %146 = call i32 @_31_array_condition(i32 noundef 1)
  %147 = load i32, ptr %6, align 4
  %148 = add nsw i32 %147, %146
  store i32 %148, ptr %6, align 4
  %149 = call i32 @_32_array_branches(i32 noundef 2)
  %150 = load i32, ptr %6, align 4
  %151 = add nsw i32 %150, %149
  store i32 %151, ptr %6, align 4
  %152 = call i32 @_33_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %153 = load i32, ptr %6, align 4
  %154 = add nsw i32 %153, %152
  store i32 %154, ptr %6, align 4
  %155 = call i32 @_34_matrix_condition(i32 noundef 1, i32 noundef 1)
  %156 = load i32, ptr %6, align 4
  %157 = add nsw i32 %156, %155
  store i32 %157, ptr %6, align 4
  %158 = call i32 @_35_nested_array(i32 noundef 1, i32 noundef 2)
  %159 = load i32, ptr %6, align 4
  %160 = add nsw i32 %159, %158
  store i32 %160, ptr %6, align 4
  %161 = load i32, ptr %5, align 4
  store i32 %161, ptr %7, align 4
  %162 = call i32 @_36_pointer_condition(ptr noundef %7)
  %163 = load i32, ptr %6, align 4
  %164 = add nsw i32 %163, %162
  store i32 %164, ptr %6, align 4
  %165 = call i32 @_37_pointer_branches(ptr noundef %7)
  %166 = load i32, ptr %6, align 4
  %167 = add nsw i32 %166, %165
  store i32 %167, ptr %6, align 4
  %168 = call i32 @_38_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %169 = load i32, ptr %6, align 4
  %170 = add nsw i32 %169, %168
  store i32 %170, ptr %6, align 4
  %171 = call i32 @_39_nested_pointer(ptr noundef %7, i32 noundef 3)
  %172 = load i32, ptr %6, align 4
  %173 = add nsw i32 %172, %171
  store i32 %173, ptr %6, align 4
  %174 = load i32, ptr %5, align 4
  store i32 %174, ptr %7, align 4
  %175 = load i32, ptr %5, align 4
  %176 = call i32 @_40_pointer_write(ptr noundef %7, i32 noundef %175)
  %177 = load i32, ptr %6, align 4
  %178 = add nsw i32 %177, %176
  store i32 %178, ptr %6, align 4
  %179 = load i32, ptr %5, align 4
  store i32 %179, ptr %7, align 4
  %180 = load i32, ptr %5, align 4
  %181 = call i32 @_41_pointer_write_nested(ptr noundef %7, i32 noundef %180, i32 noundef 3)
  %182 = load i32, ptr %6, align 4
  %183 = add nsw i32 %182, %181
  store i32 %183, ptr %6, align 4
  %184 = load i32, ptr %5, align 4
  store i32 %184, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  store i32 5, ptr %b, align 4
  br label %break

185:                                              ; preds = %switch
  %186 = load i32, ptr %5, align 4
  %187 = icmp sgt i32 %186, 0
  %188 = select i1 %187, i32 6, i32 8
  store i32 %188, ptr %b, align 4
  br label %break

189:                                              ; preds = %switch
  %190 = load i32, ptr %5, align 4
  %191 = icmp slt i32 %190, 8
  %192 = select i1 %191, i32 7, i32 8
  store i32 %192, ptr %b, align 4
  br label %break

193:                                              ; preds = %switch
  %194 = load i32, ptr %5, align 4
  store i32 %194, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

195:                                              ; preds = %switch
  store i32 4, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

196:                                              ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr @g_n, align 4
  %197 = call i32 @_42_global_only()
  %198 = load i32, ptr %6, align 4
  %199 = add nsw i32 %198, %197
  store i32 %199, ptr %6, align 4
  %200 = call i32 @_43_global_and()
  %201 = load i32, ptr %6, align 4
  %202 = add nsw i32 %201, %200
  store i32 %202, ptr %6, align 4
  %203 = call i32 @_44_global_or()
  %204 = load i32, ptr %6, align 4
  %205 = add nsw i32 %204, %203
  store i32 %205, ptr %6, align 4
  %206 = call i32 @_45_global_nested()
  %207 = load i32, ptr %6, align 4
  %208 = add nsw i32 %207, %206
  store i32 %208, ptr %6, align 4
  %209 = call i32 @_46_global_array_only()
  %210 = load i32, ptr %6, align 4
  %211 = add nsw i32 %210, %209
  store i32 %211, ptr %6, align 4
  %212 = call i32 @_47_global_matrix_only()
  %213 = load i32, ptr %6, align 4
  %214 = add nsw i32 %213, %212
  store i32 %214, ptr %6, align 4
  %215 = load i32, ptr %5, align 4
  %216 = call i32 @_48_multiple_returns(i32 noundef %215)
  %217 = load i32, ptr %6, align 4
  %218 = add nsw i32 %217, %216
  store i32 %218, ptr %6, align 4
  %219 = load i32, ptr %5, align 4
  %220 = call i32 @_49_nested_multiple_returns(i32 noundef %219, i32 noundef 3)
  %221 = load i32, ptr %6, align 4
  %222 = add nsw i32 %221, %220
  store i32 %222, ptr %6, align 4
  %223 = load i32, ptr %5, align 4
  %224 = call i32 @_50_complex_multiple_returns(i32 noundef %223, i32 noundef 3, i32 noundef 5)
  %225 = load i32, ptr %6, align 4
  %226 = add nsw i32 %225, %224
  store i32 %226, ptr %6, align 4
  %227 = load i32, ptr %5, align 4
  %228 = call i32 @_51_prefix_code(i32 noundef %227, i32 noundef 2, i32 noundef 3)
  %229 = load i32, ptr %6, align 4
  %230 = add nsw i32 %229, %228
  store i32 %230, ptr %6, align 4
  %231 = load i32, ptr %5, align 4
  %232 = call i32 @_52_suffix_code(i32 noundef %231, i32 noundef 3)
  %233 = load i32, ptr %6, align 4
  %234 = add nsw i32 %233, %232
  store i32 %234, ptr %6, align 4
  %235 = load i32, ptr %5, align 4
  %236 = call i32 @_53_prefix_nested_suffix(i32 noundef %235, i32 noundef 3, i32 noundef 5)
  %237 = load i32, ptr %6, align 4
  %238 = add nsw i32 %237, %236
  store i32 %238, ptr %6, align 4
  %239 = load i32, ptr %5, align 4
  %240 = call i32 @_54_diamond(i32 noundef %239, i32 noundef 3)
  %241 = load i32, ptr %6, align 4
  %242 = add nsw i32 %241, %240
  store i32 %242, ptr %6, align 4
  %243 = load i32, ptr %5, align 4
  %244 = call i32 @_55_multiple_merge_values(i32 noundef %243, i32 noundef 3)
  %245 = load i32, ptr %6, align 4
  %246 = add nsw i32 %245, %244
  store i32 %246, ptr %6, align 4
  %247 = load i32, ptr %5, align 4
  %248 = call i32 @_56_nested_diamonds(i32 noundef %247, i32 noundef 3, i32 noundef 5)
  %249 = load i32, ptr %6, align 4
  %250 = add nsw i32 %249, %248
  store i32 %250, ptr %6, align 4
  %251 = load i32, ptr %5, align 4
  %252 = call i32 @_57_ternary_before_if(i32 noundef %251, i32 noundef 3)
  %253 = load i32, ptr %6, align 4
  %254 = add nsw i32 %253, %252
  store i32 %254, ptr %6, align 4
  %255 = load i32, ptr %5, align 4
  %256 = call i32 @_58_ternary_inside_if(i32 noundef %255, i32 noundef 3)
  %257 = load i32, ptr %6, align 4
  %258 = add nsw i32 %257, %256
  store i32 %258, ptr %6, align 4
  %259 = load i32, ptr %5, align 4
  %260 = call i32 @_59_nested_ternary_if(i32 noundef %259, i32 noundef 3, i32 noundef 5)
  %261 = load i32, ptr %6, align 4
  %262 = add nsw i32 %261, %260
  store i32 %262, ptr %6, align 4
  %263 = load i32, ptr %5, align 4
  %264 = call i32 @_60_dynamic_alloca(i32 noundef 4, i32 noundef %263)
  %265 = load i32, ptr %6, align 4
  %266 = add nsw i32 %265, %264
  store i32 %266, ptr %6, align 4
  %267 = load i32, ptr %5, align 4
  %268 = call i32 @_61_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %267)
  %269 = load i32, ptr %6, align 4
  %270 = add nsw i32 %269, %268
  store i32 %270, ptr %6, align 4
  %271 = load i32, ptr %5, align 4
  %272 = call i32 @_62_dynamic_alloca_complex(i32 noundef 6, i32 noundef %271, i32 noundef 3)
  %273 = load i32, ptr %6, align 4
  %274 = add nsw i32 %273, %272
  store i32 %274, ptr %6, align 4
  %275 = load i32, ptr %5, align 4
  %276 = call i32 @_63_malloc_if(i32 noundef 4, i32 noundef %275)
  %277 = load i32, ptr %6, align 4
  %278 = add nsw i32 %277, %276
  store i32 %278, ptr %6, align 4
  %279 = load i32, ptr %5, align 4
  %280 = call i32 @_64_malloc_nested_if(i32 noundef 4, i32 noundef %279, i32 noundef 3)
  %281 = load i32, ptr %6, align 4
  %282 = add nsw i32 %281, %280
  store i32 %282, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %283 = load i32, ptr %5, align 4
  call void @_65_void_if(i32 noundef %283)
  %284 = load i32, ptr %5, align 4
  call void @_66_void_if_else(i32 noundef %284)
  %285 = load i32, ptr %5, align 4
  call void @_67_void_nested(i32 noundef %285, i32 noundef 3)
  %286 = load i32, ptr %5, align 4
  call void @_68_void_complex(i32 noundef %286, i32 noundef 3, i32 noundef 0)
  call void @_69_void_global_only()
  %287 = load i32, ptr %5, align 4
  store i32 %287, ptr %7, align 4
  %288 = load i32, ptr %5, align 4
  call void @_70_void_pointer(ptr noundef %7, i32 noundef %288)
  %289 = load i32, ptr %5, align 4
  call void @_71_void_array(i32 noundef 1, i32 noundef %289)
  %290 = load i32, ptr @g_void_result, align 4
  %291 = load i32, ptr %6, align 4
  %292 = add nsw i32 %291, %290
  store i32 %292, ptr %6, align 4
  %293 = load i32, ptr %5, align 4
  store i32 %293, ptr %7, align 4
  %294 = load i32, ptr %5, align 4
  %295 = call i32 @_72_complex_control_flow(ptr noundef %7, i32 noundef 1, i32 noundef %294, i32 noundef 3)
  %296 = load i32, ptr %6, align 4
  %297 = add nsw i32 %296, %295
  store i32 %297, ptr %6, align 4
  %298 = load i32, ptr %5, align 4
  %299 = call i32 @_73_complex_merge(i32 noundef %298, i32 noundef 3, i32 noundef 5)
  %300 = load i32, ptr %6, align 4
  %301 = add nsw i32 %300, %299
  store i32 %301, ptr %6, align 4
  %302 = load i32, ptr %5, align 4
  %303 = call i32 @_74_if_stress(ptr noundef %7, i32 noundef 1, i32 noundef %302, i32 noundef 3, i32 noundef 5)
  %304 = load i32, ptr %6, align 4
  %305 = add nsw i32 %304, %303
  store i32 %305, ptr %6, align 4
  %306 = load i32, ptr %5, align 4
  %307 = call i32 @_75_for_simple(i32 noundef 4, i32 noundef %306)
  %308 = load i32, ptr %6, align 4
  %309 = add nsw i32 %308, %307
  store i32 %309, ptr %6, align 4
  %310 = load i32, ptr %5, align 4
  %311 = call i32 @_76_while_simple(i32 noundef 4, i32 noundef %310)
  %312 = load i32, ptr %6, align 4
  %313 = add nsw i32 %312, %311
  store i32 %313, ptr %6, align 4
  %314 = load i32, ptr %5, align 4
  %315 = call i32 @_77_do_while(i32 noundef 4, i32 noundef %314)
  %316 = load i32, ptr %6, align 4
  %317 = add nsw i32 %316, %315
  store i32 %317, ptr %6, align 4
  %318 = call i32 @_78_nested_loops(i32 noundef 3, i32 noundef 4)
  %319 = load i32, ptr %6, align 4
  %320 = add nsw i32 %319, %318
  store i32 %320, ptr %6, align 4
  %321 = call i32 @_79_nested_loop_if(i32 noundef 3, i32 noundef 4)
  %322 = load i32, ptr %6, align 4
  %323 = add nsw i32 %322, %321
  store i32 %323, ptr %6, align 4
  %324 = call i32 @_80_break(i32 noundef 6)
  %325 = load i32, ptr %6, align 4
  %326 = add nsw i32 %325, %324
  store i32 %326, ptr %6, align 4
  %327 = call i32 @_81_continue(i32 noundef 6)
  %328 = load i32, ptr %6, align 4
  %329 = add nsw i32 %328, %327
  store i32 %329, ptr %6, align 4
  %330 = load i32, ptr %5, align 4
  %331 = call i32 @_82_loop_complex_condition(i32 noundef 6, i32 noundef %330)
  %332 = load i32, ptr %6, align 4
  %333 = add nsw i32 %332, %331
  store i32 %333, ptr %6, align 4
  %334 = call i32 @_83_loop_global_array()
  %335 = load i32, ptr %6, align 4
  %336 = add nsw i32 %335, %334
  store i32 %336, ptr %6, align 4
  %337 = load i32, ptr %5, align 4
  %338 = call i32 @_84_loop_pointer(i32 noundef 5, i32 noundef %337)
  %339 = load i32, ptr %6, align 4
  %340 = add nsw i32 %339, %338
  store i32 %340, ptr %6, align 4
  %341 = load i32, ptr %5, align 4
  %342 = call i32 @_85_loop_surrounding_code(i32 noundef 4, i32 noundef %341)
  %343 = load i32, ptr %6, align 4
  %344 = add nsw i32 %343, %342
  store i32 %344, ptr %6, align 4
  %345 = call i32 @_86_triple_nested(i32 noundef 2, i32 noundef 3, i32 noundef 2)
  %346 = load i32, ptr %6, align 4
  %347 = add nsw i32 %346, %345
  store i32 %347, ptr %6, align 4
  %348 = load i32, ptr %5, align 4
  %349 = call i32 @_87_if_OR3(i32 noundef %348, i32 noundef 3, i32 noundef -5)
  %350 = load i32, ptr %6, align 4
  %351 = add nsw i32 %350, %349
  store i32 %351, ptr %6, align 4
  %352 = load i32, ptr %5, align 4
  %353 = call i32 @_88_if_OR3_vla(i32 noundef %352, i32 noundef 3, i32 noundef -5)
  %354 = load i32, ptr %6, align 4
  %355 = add nsw i32 %354, %353
  store i32 %355, ptr %6, align 4
  %356 = load i32, ptr %5, align 4
  %357 = call i32 @_89_loop_vla(i32 noundef 4, i32 noundef %356)
  %358 = load i32, ptr %6, align 4
  %359 = add nsw i32 %358, %357
  store i32 %359, ptr %6, align 4
  %360 = load i32, ptr %5, align 4
  %361 = call i32 @_90_vla_nested_loop(i32 noundef 4, i32 noundef %360)
  %362 = load i32, ptr %6, align 4
  %363 = add nsw i32 %362, %361
  store i32 %363, ptr %6, align 4
  %364 = load i32, ptr %5, align 4
  %365 = call i32 @_91_alloca_inside_loop(i32 noundef 4, i32 noundef %364)
  %366 = load i32, ptr %6, align 4
  %367 = add nsw i32 %366, %365
  store i32 %367, ptr %6, align 4
  %368 = load i32, ptr %5, align 4
  %369 = call i32 @_92_vla_size_from_loop(i32 noundef 5, i32 noundef %368)
  %370 = load i32, ptr %6, align 4
  %371 = add nsw i32 %370, %369
  store i32 %371, ptr %6, align 4
  %372 = call i32 @_93_global_loop()
  %373 = load i32, ptr %6, align 4
  %374 = add nsw i32 %373, %372
  store i32 %374, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %375 = load i32, ptr %5, align 4
  call void @_94_void_loop(i32 noundef 4, i32 noundef %375)
  %376 = load i32, ptr %5, align 4
  store i32 %376, ptr %7, align 4
  %377 = load i32, ptr %5, align 4
  call void @_95_void_loop_pointer(ptr noundef %7, i32 noundef 4, i32 noundef %377)
  %378 = load i32, ptr @g_void_result, align 4
  %379 = load i32, ptr %6, align 4
  %380 = add nsw i32 %379, %378
  store i32 %380, ptr %6, align 4
  %381 = load i32, ptr %5, align 4
  %382 = call i32 @_96_goto_break(i32 noundef 6, i32 noundef %381)
  %383 = load i32, ptr %6, align 4
  %384 = add nsw i32 %383, %382
  store i32 %384, ptr %6, align 4
  %385 = load i32, ptr %5, align 4
  %386 = call i32 @_97_goto_nested_loop(i32 noundef 5, i32 noundef %385)
  %387 = load i32, ptr %6, align 4
  %388 = add nsw i32 %387, %386
  store i32 %388, ptr %6, align 4
  %389 = load i32, ptr %5, align 4
  %390 = call i32 @_98_goto_vla(i32 noundef 4, i32 noundef %389)
  %391 = load i32, ptr %6, align 4
  %392 = add nsw i32 %391, %390
  store i32 %392, ptr %6, align 4
  %393 = load i32, ptr %5, align 4
  %394 = call i32 @_99_malloc_loop(i32 noundef 4, i32 noundef %393)
  %395 = load i32, ptr %6, align 4
  %396 = add nsw i32 %395, %394
  store i32 %396, ptr %6, align 4
  %397 = load i32, ptr %5, align 4
  store i32 %397, ptr %7, align 4
  %398 = load i32, ptr %5, align 4
  %399 = call i32 @_100_stress(ptr noundef %7, i32 noundef 4, i32 noundef %398, i32 noundef 3)
  %400 = load i32, ptr %6, align 4
  %401 = add nsw i32 %400, %399
  store i32 %401, ptr %6, align 4
  %402 = load i32, ptr %5, align 4
  store i32 %402, ptr %7, align 4
  %403 = load i32, ptr %5, align 4
  %404 = call i32 @_101_stress_goto(ptr noundef %7, i32 noundef 4, i32 noundef %403, i32 noundef 3, i32 noundef 5)
  %405 = load i32, ptr %6, align 4
  %406 = add nsw i32 %405, %404
  store i32 %406, ptr %6, align 4
  %407 = load i32, ptr %5, align 4
  %408 = call i32 @_102_oneblock(i32 noundef %407)
  %409 = load i32, ptr %6, align 4
  %410 = add nsw i32 %409, %408
  store i32 %410, ptr %6, align 4
  %411 = load i32, ptr %6, align 4
  %412 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %411)
  ret i32 0

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %18
    i32 4, label %19
    i32 5, label %185
    i32 6, label %189
    i32 7, label %193
    i32 8, label %195
    i32 9, label %196
  ]

break:                                            ; preds = %195, %193, %189, %185, %19, %18, %13, %9, %8
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
