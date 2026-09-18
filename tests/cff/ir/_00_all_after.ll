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
  %17 = call noalias ptr @malloc(i64 noundef %16) #7
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
  call void @free(ptr noundef %47) #8
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
  %19 = call noalias ptr @malloc(i64 noundef %18) #7
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
  call void @free(ptr noundef %61) #8
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
  %19 = call noalias ptr @malloc(i64 noundef %18) #7
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
  call void @free(ptr noundef %74) #8
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
define dso_local i32 @_103_switch_if(i32 noundef %0, i32 noundef %1) #0 {
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
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = mul nsw i32 %12, 2
  store i32 %13, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = sub nsw i32 %15, 2
  store i32 %16, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = icmp eq i32 %19, 0
  %21 = select i1 %20, i32 6, i32 7
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 100, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 100
  store i32 %25, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  %29 = icmp slt i32 %28, 0
  %30 = select i1 %29, i32 10, i32 11
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %3, align 4
  %33 = sub nsw i32 0, %32
  store i32 %33, ptr %4, align 4
  store i32 12, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %3, align 4
  store i32 %35, ptr %4, align 4
  store i32 12, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 10
  store i32 %39, ptr %4, align 4
  store i32 14, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %4, align 4
  ret i32 %41

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
    i32 5, label %18
    i32 6, label %22
    i32 7, label %23
    i32 8, label %26
    i32 9, label %27
    i32 10, label %31
    i32 11, label %34
    i32 12, label %36
    i32 13, label %37
    i32 14, label %40
  ]

break:                                            ; preds = %37, %36, %34, %31, %27, %26, %23, %22, %18, %17, %14, %11, %7, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %5
  store i32 13, ptr %b, align 4
  br label %break

case2:                                            ; preds = %5
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %5
  store i32 5, ptr %b, align 4
  br label %break

case4:                                            ; preds = %5
  store i32 9, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_104_switch_nested_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %case [
    i32 0, label %case2
    i32 1, label %case3
  ]

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 2, i32 6
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 3, i32 4
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = load i32, ptr %5, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = sub nsw i32 0, %27
  store i32 %28, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = load i32, ptr %5, align 4
  %33 = icmp eq i32 %31, %32
  %34 = select i1 %33, i32 9, i32 13
  store i32 %34, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %4, align 4
  %37 = icmp sgt i32 %36, 10
  %38 = select i1 %37, i32 10, i32 11
  store i32 %38, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  store i32 100, ptr %6, align 4
  store i32 12, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  store i32 200, ptr %6, align 4
  store i32 12, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %4, align 4
  %44 = load i32, ptr %5, align 4
  %45 = add nsw i32 %43, %44
  store i32 %45, ptr %6, align 4
  store i32 14, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %5, align 4
  %49 = icmp ne i32 %48, 0
  %50 = select i1 %49, i32 16, i32 17
  store i32 %50, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %4, align 4
  %53 = load i32, ptr %5, align 4
  %54 = sdiv i32 %52, %53
  store i32 %54, ptr %6, align 4
  store i32 18, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %4, align 4
  store i32 %56, ptr %6, align 4
  store i32 18, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %6, align 4
  ret i32 %59

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %13
    i32 3, label %17
    i32 4, label %21
    i32 5, label %25
    i32 6, label %26
    i32 7, label %29
    i32 8, label %30
    i32 9, label %35
    i32 10, label %39
    i32 11, label %40
    i32 12, label %41
    i32 13, label %42
    i32 14, label %46
    i32 15, label %47
    i32 16, label %51
    i32 17, label %55
    i32 18, label %57
    i32 19, label %58
  ]

break:                                            ; preds = %57, %55, %51, %47, %46, %42, %41, %40, %39, %35, %30, %29, %26, %25, %21, %17, %13, %9, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %7
  store i32 15, ptr %b, align 4
  br label %break

case2:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %7
  store i32 8, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %case [
    i32 0, label %case6
    i32 1, label %case7
    i32 2, label %case8
  ]

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %10, %11
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  store i32 %15, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  store i32 %17, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %6, align 4
  store i32 14, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %5, align 4
  %22 = icmp slt i32 %20, %21
  %23 = select i1 %22, i32 6, i32 7
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = mul nsw i32 %25, 2
  store i32 %26, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %5, align 4
  %29 = mul nsw i32 %28, 2
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  store i32 14, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %4, align 4
  %33 = load i32, ptr %5, align 4
  %34 = icmp eq i32 %32, %33
  %35 = zext i1 %34 to i64
  %36 = select i1 %34, i32 100, i32 -100
  store i32 %36, ptr %6, align 4
  store i32 14, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %4, align 4
  %39 = icmp sgt i32 %38, 0
  %40 = select i1 %39, i32 11, i32 12
  store i32 %40, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %4, align 4
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %42, %43
  store i32 %44, ptr %.reg2mem3, align 4
  store i32 13, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %4, align 4
  %47 = load i32, ptr %5, align 4
  %48 = sub nsw i32 %46, %47
  store i32 %48, ptr %.reg2mem3, align 4
  store i32 13, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %6, align 4
  store i32 14, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %6, align 4
  ret i32 %51

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b5 = load i32, ptr %b, align 4
  switch i32 %b5, label %default [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %14
    i32 3, label %16
    i32 4, label %18
    i32 5, label %19
    i32 6, label %24
    i32 7, label %27
    i32 8, label %30
    i32 9, label %31
    i32 10, label %37
    i32 11, label %41
    i32 12, label %45
    i32 13, label %49
    i32 14, label %50
  ]

break:                                            ; preds = %49, %45, %41, %37, %31, %30, %27, %24, %19, %18, %16, %14, %9, %case8, %case7, %case6, %case
  br label %switch

case:                                             ; preds = %7
  store i32 10, ptr %b, align 4
  br label %break

case6:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break

case7:                                            ; preds = %7
  store i32 5, ptr %b, align 4
  br label %break

case8:                                            ; preds = %7
  store i32 9, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %case [
    i32 0, label %case18
    i32 1, label %case19
    i32 2, label %case20
  ]

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %6, align 4
  %14 = icmp sgt i32 %12, %13
  %15 = select i1 %14, i32 2, i32 6
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %7, align 4
  %19 = icmp sgt i32 %17, %18
  %20 = select i1 %19, i32 3, i32 4
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  store i32 %22, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %7, align 4
  store i32 %24, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %7, align 4
  %29 = icmp sgt i32 %27, %28
  %30 = select i1 %29, i32 7, i32 8
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %6, align 4
  store i32 %32, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %7, align 4
  store i32 %34, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %8, align 4
  store i32 32, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %5, align 4
  %39 = icmp sgt i32 %38, 0
  %40 = select i1 %39, i32 12, i32 16
  store i32 %40, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %6, align 4
  %43 = icmp sgt i32 %42, 0
  %44 = select i1 %43, i32 13, i32 14
  store i32 %44, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %5, align 4
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %46, %47
  store i32 %48, ptr %.reg2mem5, align 4
  store i32 15, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %5, align 4
  %51 = load i32, ptr %6, align 4
  %52 = sub nsw i32 %50, %51
  store i32 %52, ptr %.reg2mem5, align 4
  store i32 15, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %.reg2mem9, align 4
  store i32 20, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  %55 = load i32, ptr %7, align 4
  %56 = icmp sgt i32 %55, 0
  %57 = select i1 %56, i32 17, i32 18
  store i32 %57, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %7, align 4
  %60 = mul nsw i32 %59, 2
  store i32 %60, ptr %.reg2mem7, align 4
  store i32 19, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
  %62 = load i32, ptr %7, align 4
  %63 = sub nsw i32 %62, 2
  store i32 %63, ptr %.reg2mem7, align 4
  store i32 19, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  store i32 %.reload8, ptr %.reg2mem9, align 4
  store i32 20, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  store i32 %.reload10, ptr %8, align 4
  store i32 32, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %5, align 4
  %68 = load i32, ptr %6, align 4
  %69 = icmp eq i32 %67, %68
  %70 = select i1 %69, i32 22, i32 23
  store i32 %70, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %72 = load i32, ptr %6, align 4
  %73 = load i32, ptr %7, align 4
  %74 = icmp eq i32 %72, %73
  %75 = zext i1 %74 to i64
  %76 = select i1 %74, i32 1, i32 2
  store i32 %76, ptr %.reg2mem11, align 4
  store i32 24, ptr %b, align 4
  br label %break

77:                                               ; preds = %switch
  %78 = load i32, ptr %5, align 4
  %79 = load i32, ptr %7, align 4
  %80 = icmp eq i32 %78, %79
  %81 = zext i1 %80 to i64
  %82 = select i1 %80, i32 3, i32 4
  store i32 %82, ptr %.reg2mem11, align 4
  store i32 24, ptr %b, align 4
  br label %break

83:                                               ; preds = %switch
  %.reload12 = load i32, ptr %.reg2mem11, align 4
  store i32 %.reload12, ptr %8, align 4
  store i32 32, ptr %b, align 4
  br label %break

84:                                               ; preds = %switch
  %85 = load i32, ptr %5, align 4
  %86 = icmp sgt i32 %85, 0
  %87 = select i1 %86, i32 26, i32 27
  store i32 %87, ptr %b, align 4
  br label %break

88:                                               ; preds = %switch
  %89 = load i32, ptr %5, align 4
  store i32 %89, ptr %.reg2mem15, align 4
  store i32 31, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load i32, ptr %6, align 4
  %92 = icmp sgt i32 %91, 0
  %93 = select i1 %92, i32 28, i32 29
  store i32 %93, ptr %b, align 4
  br label %break

94:                                               ; preds = %switch
  %95 = load i32, ptr %6, align 4
  store i32 %95, ptr %.reg2mem13, align 4
  store i32 30, ptr %b, align 4
  br label %break

96:                                               ; preds = %switch
  %97 = load i32, ptr %7, align 4
  store i32 %97, ptr %.reg2mem13, align 4
  store i32 30, ptr %b, align 4
  br label %break

98:                                               ; preds = %switch
  %.reload14 = load i32, ptr %.reg2mem13, align 4
  store i32 %.reload14, ptr %.reg2mem15, align 4
  store i32 31, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  %.reload16 = load i32, ptr %.reg2mem15, align 4
  store i32 %.reload16, ptr %8, align 4
  store i32 32, ptr %b, align 4
  br label %break

100:                                              ; preds = %switch
  %101 = load i32, ptr %8, align 4
  ret i32 %101

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b17 = load i32, ptr %b, align 4
  switch i32 %b17, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %16
    i32 3, label %21
    i32 4, label %23
    i32 5, label %25
    i32 6, label %26
    i32 7, label %31
    i32 8, label %33
    i32 9, label %35
    i32 10, label %36
    i32 11, label %37
    i32 12, label %41
    i32 13, label %45
    i32 14, label %49
    i32 15, label %53
    i32 16, label %54
    i32 17, label %58
    i32 18, label %61
    i32 19, label %64
    i32 20, label %65
    i32 21, label %66
    i32 22, label %71
    i32 23, label %77
    i32 24, label %83
    i32 25, label %84
    i32 26, label %88
    i32 27, label %90
    i32 28, label %94
    i32 29, label %96
    i32 30, label %98
    i32 31, label %99
    i32 32, label %100
  ]

break:                                            ; preds = %99, %98, %96, %94, %90, %88, %84, %83, %77, %71, %66, %65, %64, %61, %58, %54, %53, %49, %45, %41, %37, %36, %35, %33, %31, %26, %25, %23, %21, %16, %11, %case20, %case19, %case18, %case
  br label %switch

case:                                             ; preds = %9
  store i32 25, ptr %b, align 4
  br label %break

case18:                                           ; preds = %9
  store i32 1, ptr %b, align 4
  br label %break

case19:                                           ; preds = %9
  store i32 11, ptr %b, align 4
  br label %break

case20:                                           ; preds = %9
  store i32 21, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

11:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %12 = load i32, ptr %3, align 4
  switch i32 %12, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

13:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %15, %16
  %18 = select i1 %17, i32 3, i32 5
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %6, align 4
  store i32 4, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %8, align 4
  %32 = load i32, ptr %4, align 4
  %33 = icmp slt i32 %31, %32
  %34 = select i1 %33, i32 8, i32 10
  store i32 %34, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %5, align 4
  %37 = load i32, ptr %8, align 4
  %38 = mul nsw i32 %36, %37
  %39 = load i32, ptr %6, align 4
  %40 = add nsw i32 %39, %38
  store i32 %40, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %9, align 4
  %48 = load i32, ptr %4, align 4
  %49 = icmp slt i32 %47, %48
  %50 = select i1 %49, i32 13, i32 17
  store i32 %50, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %9, align 4
  %53 = srem i32 %52, 2
  %54 = icmp eq i32 %53, 0
  %55 = select i1 %54, i32 14, i32 15
  store i32 %55, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %9, align 4
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %6, align 4
  store i32 15, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
  %62 = load i32, ptr %9, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 19, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %10, align 4
  %68 = load i32, ptr %4, align 4
  %69 = icmp slt i32 %67, %68
  %70 = select i1 %69, i32 20, i32 22
  store i32 %70, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %72 = load i32, ptr %10, align 4
  %73 = load i32, ptr %6, align 4
  %74 = sub nsw i32 %73, %72
  store i32 %74, ptr %6, align 4
  store i32 21, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  %76 = load i32, ptr %10, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %10, align 4
  store i32 19, ptr %b, align 4
  br label %break

78:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

79:                                               ; preds = %switch
  %80 = load i32, ptr %6, align 4
  ret i32 %80

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %11
    i32 1, label %13
    i32 2, label %14
    i32 3, label %19
    i32 4, label %25
    i32 5, label %28
    i32 6, label %29
    i32 7, label %30
    i32 8, label %35
    i32 9, label %41
    i32 10, label %44
    i32 11, label %45
    i32 12, label %46
    i32 13, label %51
    i32 14, label %56
    i32 15, label %60
    i32 16, label %61
    i32 17, label %64
    i32 18, label %65
    i32 19, label %66
    i32 20, label %71
    i32 21, label %75
    i32 22, label %78
    i32 23, label %79
  ]

break:                                            ; preds = %78, %75, %71, %66, %65, %64, %61, %60, %56, %51, %46, %45, %44, %41, %35, %30, %29, %28, %25, %19, %14, %13, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %11
  store i32 18, ptr %b, align 4
  br label %break

case2:                                            ; preds = %11
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %11
  store i32 6, ptr %b, align 4
  br label %break

case4:                                            ; preds = %11
  store i32 11, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

10:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %11 = load i32, ptr %3, align 4
  switch i32 %11, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

12:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  %17 = select i1 %16, i32 3, i32 4
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %6, align 4
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 6, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %8, align 4
  %30 = load i32, ptr %4, align 4
  %31 = icmp slt i32 %29, %30
  %32 = select i1 %31, i32 7, i32 8
  store i32 %32, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  %35 = load i32, ptr %8, align 4
  %36 = sub nsw i32 %34, %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %6, align 4
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %8, align 4
  store i32 6, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %4, align 4
  store i32 %43, ptr %9, align 4
  store i32 10, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %9, align 4
  %46 = icmp sgt i32 %45, 0
  %47 = select i1 %46, i32 11, i32 12
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %9, align 4
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %6, align 4
  %52 = load i32, ptr %9, align 4
  %53 = add nsw i32 %52, -1
  store i32 %53, ptr %9, align 4
  store i32 10, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %4, align 4
  %57 = load i32, ptr %5, align 4
  %58 = add nsw i32 %56, %57
  store i32 %58, ptr %6, align 4
  store i32 14, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %6, align 4
  ret i32 %60

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %10
    i32 1, label %12
    i32 2, label %13
    i32 3, label %18
    i32 4, label %26
    i32 5, label %27
    i32 6, label %28
    i32 7, label %33
    i32 8, label %41
    i32 9, label %42
    i32 10, label %44
    i32 11, label %48
    i32 12, label %54
    i32 13, label %55
    i32 14, label %59
  ]

break:                                            ; preds = %55, %54, %48, %44, %42, %41, %33, %28, %27, %26, %18, %13, %12, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %10
  store i32 13, ptr %b, align 4
  br label %break

case2:                                            ; preds = %10
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %10
  store i32 5, ptr %b, align 4
  br label %break

case4:                                            ; preds = %10
  store i32 9, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

13:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %14 = load i32, ptr %3, align 4
  switch i32 %14, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

15:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp slt i32 %17, %18
  %20 = select i1 %19, i32 3, i32 9
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp slt i32 %23, %24
  %26 = select i1 %25, i32 5, i32 7
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %7, align 4
  %29 = load i32, ptr %8, align 4
  %30 = mul nsw i32 %28, %29
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %8, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 11, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %9, align 4
  %44 = load i32, ptr %4, align 4
  %45 = icmp slt i32 %43, %44
  %46 = select i1 %45, i32 12, i32 21
  store i32 %46, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 13, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %10, align 4
  %50 = load i32, ptr %5, align 4
  %51 = icmp slt i32 %49, %50
  %52 = select i1 %51, i32 14, i32 19
  store i32 %52, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %9, align 4
  %55 = load i32, ptr %10, align 4
  %56 = add nsw i32 %54, %55
  %57 = srem i32 %56, 2
  %58 = icmp eq i32 %57, 0
  %59 = select i1 %58, i32 15, i32 16
  store i32 %59, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load i32, ptr %9, align 4
  %62 = load i32, ptr %10, align 4
  %63 = add nsw i32 %61, %62
  %64 = load i32, ptr %6, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %6, align 4
  store i32 17, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %6, align 4
  %68 = sub nsw i32 %67, 1
  store i32 %68, ptr %6, align 4
  store i32 17, ptr %b, align 4
  br label %break

69:                                               ; preds = %switch
  store i32 18, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %10, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %10, align 4
  store i32 13, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  store i32 20, ptr %b, align 4
  br label %break

74:                                               ; preds = %switch
  %75 = load i32, ptr %9, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %9, align 4
  store i32 11, ptr %b, align 4
  br label %break

77:                                               ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

78:                                               ; preds = %switch
  store i32 0, ptr %11, align 4
  store i32 23, ptr %b, align 4
  br label %break

79:                                               ; preds = %switch
  %80 = load i32, ptr %11, align 4
  %81 = load i32, ptr %4, align 4
  %82 = icmp slt i32 %80, %81
  %83 = select i1 %82, i32 24, i32 33
  store i32 %83, ptr %b, align 4
  br label %break

84:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 25, ptr %b, align 4
  br label %break

85:                                               ; preds = %switch
  %86 = load i32, ptr %12, align 4
  %87 = load i32, ptr %5, align 4
  %88 = icmp slt i32 %86, %87
  %89 = select i1 %88, i32 26, i32 31
  store i32 %89, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load i32, ptr %11, align 4
  %92 = load i32, ptr %12, align 4
  %93 = icmp sgt i32 %91, %92
  %94 = select i1 %93, i32 27, i32 28
  store i32 %94, ptr %b, align 4
  br label %break

95:                                               ; preds = %switch
  %96 = load i32, ptr %11, align 4
  store i32 %96, ptr %.reg2mem, align 4
  store i32 29, ptr %b, align 4
  br label %break

97:                                               ; preds = %switch
  %98 = load i32, ptr %12, align 4
  store i32 %98, ptr %.reg2mem, align 4
  store i32 29, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %100 = load i32, ptr %6, align 4
  %101 = add nsw i32 %100, %.reload
  store i32 %101, ptr %6, align 4
  store i32 30, ptr %b, align 4
  br label %break

102:                                              ; preds = %switch
  %103 = load i32, ptr %12, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, ptr %12, align 4
  store i32 25, ptr %b, align 4
  br label %break

105:                                              ; preds = %switch
  store i32 32, ptr %b, align 4
  br label %break

106:                                              ; preds = %switch
  %107 = load i32, ptr %11, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, ptr %11, align 4
  store i32 23, ptr %b, align 4
  br label %break

109:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

110:                                              ; preds = %switch
  %111 = load i32, ptr %4, align 4
  %112 = load i32, ptr %5, align 4
  %113 = mul nsw i32 %111, %112
  store i32 %113, ptr %6, align 4
  store i32 35, ptr %b, align 4
  br label %break

114:                                              ; preds = %switch
  %115 = load i32, ptr %6, align 4
  ret i32 %115

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %13
    i32 1, label %15
    i32 2, label %16
    i32 3, label %21
    i32 4, label %22
    i32 5, label %27
    i32 6, label %33
    i32 7, label %36
    i32 8, label %37
    i32 9, label %40
    i32 10, label %41
    i32 11, label %42
    i32 12, label %47
    i32 13, label %48
    i32 14, label %53
    i32 15, label %60
    i32 16, label %66
    i32 17, label %69
    i32 18, label %70
    i32 19, label %73
    i32 20, label %74
    i32 21, label %77
    i32 22, label %78
    i32 23, label %79
    i32 24, label %84
    i32 25, label %85
    i32 26, label %90
    i32 27, label %95
    i32 28, label %97
    i32 29, label %99
    i32 30, label %102
    i32 31, label %105
    i32 32, label %106
    i32 33, label %109
    i32 34, label %110
    i32 35, label %114
  ]

break:                                            ; preds = %110, %109, %106, %105, %102, %99, %97, %95, %90, %85, %84, %79, %78, %77, %74, %73, %70, %69, %66, %60, %53, %48, %47, %42, %41, %40, %37, %36, %33, %27, %22, %21, %16, %15, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %13
  store i32 34, ptr %b, align 4
  br label %break

case2:                                            ; preds = %13
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %13
  store i32 10, ptr %b, align 4
  br label %break

case4:                                            ; preds = %13
  store i32 22, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %case [
    i32 0, label %case2
    i32 1, label %case3
  ]

11:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %7, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %6, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %6, align 4
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %4, align 4
  %23 = icmp slt i32 %21, %22
  %24 = select i1 %23, i32 2, i32 4
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 6, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %8, align 4
  %29 = srem i32 %28, 2
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i32 7, i32 8
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %8, align 4
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %8, align 4
  %38 = load i32, ptr %6, align 4
  %39 = sub nsw i32 %38, %37
  store i32 %39, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %8, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %8, align 4
  %45 = load i32, ptr %4, align 4
  %46 = icmp slt i32 %44, %45
  %47 = select i1 %46, i32 6, i32 11
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %5, align 4
  store i32 %50, ptr %6, align 4
  store i32 13, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %6, align 4
  ret i32 %52

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %12
    i32 3, label %20
    i32 4, label %25
    i32 5, label %26
    i32 6, label %27
    i32 7, label %32
    i32 8, label %36
    i32 9, label %40
    i32 10, label %43
    i32 11, label %48
    i32 12, label %49
    i32 13, label %51
  ]

break:                                            ; preds = %49, %48, %43, %40, %36, %32, %27, %26, %25, %20, %12, %11, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %9
  store i32 12, ptr %b, align 4
  br label %break

case2:                                            ; preds = %9
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %9
  store i32 5, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_111_switch_array(i32 noundef %0, i32 noundef %1) #0 {
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
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
    i32 3, label %case5
  ]

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  store i32 %11, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr @g_arr, align 16
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %3, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %31 = sub nsw i32 %29, %30
  store i32 %31, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr @g_arr, align 16
  %34 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %4, align 4
  store i32 6, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %4, align 4
  %38 = icmp sgt i32 %37, 0
  %39 = select i1 %38, i32 7, i32 8
  store i32 %39, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %4, align 4
  %42 = mul nsw i32 %41, 2
  store i32 %42, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %4, align 4
  %45 = sub nsw i32 %44, 2
  store i32 %45, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %4, align 4
  ret i32 %48

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %7
    i32 2, label %12
    i32 3, label %18
    i32 4, label %25
    i32 5, label %32
    i32 6, label %36
    i32 7, label %40
    i32 8, label %43
    i32 9, label %46
    i32 10, label %47
  ]

break:                                            ; preds = %46, %43, %40, %36, %32, %25, %18, %12, %7, %case5, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %5
  store i32 5, ptr %b, align 4
  br label %break

case2:                                            ; preds = %5
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break

case4:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %break

case5:                                            ; preds = %5
  store i32 4, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_112_switch_matrix_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %11
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [3 x i32], ptr %12, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  store i32 %16, ptr %6, align 4
  store i32 2, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %6, align 4
  %19 = icmp sgt i32 %18, 5
  %20 = select i1 %19, i32 3, i32 4
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = sub nsw i32 %25, 2
  store i32 %26, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 18, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x i32], ptr @g_mat, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2), i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = add nsw i32 %32, %36
  store i32 %37, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %6, align 4
  %40 = icmp sgt i32 %39, 10
  %41 = select i1 %40, i32 8, i32 9
  store i32 %41, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %6, align 4
  %44 = add nsw i32 %43, 10
  store i32 %44, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 18, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %4, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %48
  %50 = getelementptr inbounds [3 x i32], ptr %49, i64 0, i64 0
  %51 = load i32, ptr %50, align 4
  %52 = load i32, ptr %4, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %53
  %55 = getelementptr inbounds [3 x i32], ptr %54, i64 0, i64 2
  %56 = load i32, ptr %55, align 4
  %57 = sub nsw i32 %51, %56
  store i32 %57, ptr %6, align 4
  store i32 11, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %6, align 4
  %60 = icmp slt i32 %59, 0
  %61 = select i1 %60, i32 12, i32 13
  store i32 %61, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load i32, ptr %6, align 4
  %64 = sub nsw i32 0, %63
  store i32 %64, ptr %6, align 4
  store i32 13, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  store i32 18, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr @g_mat, align 16
  store i32 %67, ptr %6, align 4
  store i32 15, ptr %b, align 4
  br label %break

68:                                               ; preds = %switch
  %69 = load i32, ptr %4, align 4
  %70 = load i32, ptr %5, align 4
  %71 = icmp eq i32 %69, %70
  %72 = select i1 %71, i32 16, i32 17
  store i32 %72, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %74 = load i32, ptr %6, align 4
  %75 = add nsw i32 %74, 100
  store i32 %75, ptr %6, align 4
  store i32 17, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  store i32 18, ptr %b, align 4
  br label %break

77:                                               ; preds = %switch
  %78 = load i32, ptr %6, align 4
  ret i32 %78

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %17
    i32 3, label %21
    i32 4, label %24
    i32 5, label %27
    i32 6, label %28
    i32 7, label %38
    i32 8, label %42
    i32 9, label %45
    i32 10, label %46
    i32 11, label %58
    i32 12, label %62
    i32 13, label %65
    i32 14, label %66
    i32 15, label %68
    i32 16, label %73
    i32 17, label %76
    i32 18, label %77
  ]

break:                                            ; preds = %76, %73, %68, %66, %65, %62, %58, %46, %45, %42, %38, %28, %27, %24, %21, %17, %9, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %7
  store i32 14, ptr %b, align 4
  br label %break

case2:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %7
  store i32 6, ptr %b, align 4
  br label %break

case4:                                            ; preds = %7
  store i32 10, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_113_switch_pointer(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
    i32 3, label %case5
  ]

9:                                                ; preds = %switch
  %10 = load i32, ptr %5, align 4
  %11 = load ptr, ptr %4, align 8
  store i32 %10, ptr %11, align 4
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %12, align 4
  store i32 %13, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = mul nsw i32 %15, 2
  %17 = load ptr, ptr %4, align 8
  store i32 %16, ptr %17, align 4
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %18, align 4
  store i32 %19, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 %22, 10
  store i32 %23, ptr %21, align 4
  %24 = load ptr, ptr %4, align 8
  %25 = load i32, ptr %24, align 4
  store i32 %25, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load ptr, ptr %4, align 8
  %28 = load i32, ptr %27, align 4
  %29 = sub nsw i32 %28, 10
  store i32 %29, ptr %27, align 4
  store i32 5, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load ptr, ptr %4, align 8
  %32 = load i32, ptr %31, align 4
  %33 = icmp sgt i32 %32, 0
  %34 = select i1 %33, i32 6, i32 7
  store i32 %34, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load ptr, ptr %4, align 8
  %37 = load i32, ptr %36, align 4
  store i32 %37, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load ptr, ptr %4, align 8
  %40 = load i32, ptr %39, align 4
  %41 = sub nsw i32 0, %40
  store i32 %41, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load ptr, ptr %4, align 8
  %45 = load i32, ptr %44, align 4
  store i32 %45, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %6, align 4
  ret i32 %47

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %14
    i32 3, label %20
    i32 4, label %26
    i32 5, label %30
    i32 6, label %35
    i32 7, label %38
    i32 8, label %42
    i32 9, label %43
    i32 10, label %46
  ]

break:                                            ; preds = %43, %42, %38, %35, %30, %26, %20, %14, %9, %case5, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %7
  store i32 9, ptr %b, align 4
  br label %break

case2:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break

case4:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %break

case5:                                            ; preds = %7
  store i32 4, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_114_switch_pointer_array(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 {
entry:
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

9:                                                ; preds = %switch
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
  store i32 9, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
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
  store i32 9, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
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
  store i32 4, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load ptr, ptr %4, align 8
  %51 = load i32, ptr %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr %50, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = icmp sgt i32 %54, 0
  %56 = select i1 %55, i32 5, i32 6
  store i32 %56, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load ptr, ptr %4, align 8
  %59 = load i32, ptr %5, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %58, i64 %60
  %62 = load i32, ptr %61, align 4
  store i32 %62, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  %64 = load ptr, ptr %4, align 8
  %65 = load i32, ptr %5, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, ptr %64, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = sub nsw i32 0, %68
  store i32 %69, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %72 = load ptr, ptr %4, align 8
  %73 = load i32, ptr %5, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, ptr %72, i64 %74
  %76 = load i32, ptr %75, align 4
  %77 = load i32, ptr %5, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = add nsw i32 %76, %80
  store i32 %81, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  %83 = load i32, ptr %6, align 4
  ret i32 %83

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %23
    i32 3, label %38
    i32 4, label %49
    i32 5, label %57
    i32 6, label %63
    i32 7, label %70
    i32 8, label %71
    i32 9, label %82
  ]

break:                                            ; preds = %71, %70, %63, %57, %49, %38, %23, %9, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %7
  store i32 8, ptr %b, align 4
  br label %break

case2:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break

case4:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %10 = load i32, ptr %2, align 4
  switch i32 %10, label %case [
    i32 0, label %case8
    i32 1, label %case9
    i32 2, label %case10
  ]

11:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 2, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  store i1 false, ptr %.reg2mem, align 1
  %16 = select i1 %15, i32 3, i32 4
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %18, 8
  store i1 %19, ptr %.reg2mem, align 1
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %21 = select i1 %.reload, i32 5, i32 7
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %4, align 4
  store i32 6, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %5, align 4
  store i32 2, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 33, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %6, align 4
  %36 = load i32, ptr %3, align 4
  %37 = icmp slt i32 %35, %36
  store i1 false, ptr %.reg2mem1, align 1
  %38 = select i1 %37, i32 10, i32 11
  store i32 %38, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  %41 = icmp slt i32 %40, 8
  store i1 %41, ptr %.reg2mem1, align 1
  store i32 11, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %43 = select i1 %.reload2, i32 12, i32 17
  store i32 %43, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %6, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = icmp sgt i32 %48, 0
  %50 = select i1 %49, i32 13, i32 14
  store i32 %50, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %6, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = load i32, ptr %4, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %4, align 4
  store i32 15, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %6, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %4, align 4
  %64 = sub nsw i32 %63, %62
  store i32 %64, ptr %4, align 4
  store i32 15, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %6, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

69:                                               ; preds = %switch
  store i32 33, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 19, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %72 = load i32, ptr %7, align 4
  %73 = load i32, ptr %3, align 4
  %74 = icmp slt i32 %72, %73
  store i1 false, ptr %.reg2mem3, align 1
  %75 = select i1 %74, i32 20, i32 21
  store i32 %75, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load i32, ptr %7, align 4
  %78 = icmp slt i32 %77, 8
  store i1 %78, ptr %.reg2mem3, align 1
  store i32 21, ptr %b, align 4
  br label %break

79:                                               ; preds = %switch
  %.reload4 = load i1, ptr %.reg2mem3, align 1
  %80 = select i1 %.reload4, i32 22, i32 27
  store i32 %80, ptr %b, align 4
  br label %break

81:                                               ; preds = %switch
  %82 = load i32, ptr %7, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = icmp sgt i32 %85, 0
  %87 = select i1 %86, i32 23, i32 24
  store i32 %87, ptr %b, align 4
  br label %break

88:                                               ; preds = %switch
  %89 = load i32, ptr %7, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %90
  %92 = load i32, ptr %91, align 4
  %93 = mul nsw i32 %92, 2
  store i32 %93, ptr %.reg2mem5, align 4
  store i32 25, ptr %b, align 4
  br label %break

94:                                               ; preds = %switch
  %95 = load i32, ptr %7, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %96
  %98 = load i32, ptr %97, align 4
  %99 = sub nsw i32 %98, 2
  store i32 %99, ptr %.reg2mem5, align 4
  store i32 25, ptr %b, align 4
  br label %break

100:                                              ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %101 = load i32, ptr %4, align 4
  %102 = add nsw i32 %101, %.reload6
  store i32 %102, ptr %4, align 4
  store i32 26, ptr %b, align 4
  br label %break

103:                                              ; preds = %switch
  %104 = load i32, ptr %7, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %7, align 4
  store i32 19, ptr %b, align 4
  br label %break

106:                                              ; preds = %switch
  store i32 33, ptr %b, align 4
  br label %break

107:                                              ; preds = %switch
  %108 = load i32, ptr @g_arr, align 16
  store i32 %108, ptr %4, align 4
  store i32 1, ptr %8, align 4
  store i32 29, ptr %b, align 4
  br label %break

109:                                              ; preds = %switch
  %110 = load i32, ptr %8, align 4
  %111 = icmp slt i32 %110, 8
  %112 = select i1 %111, i32 30, i32 32
  store i32 %112, ptr %b, align 4
  br label %break

113:                                              ; preds = %switch
  %114 = load i32, ptr %8, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = load i32, ptr %4, align 4
  %119 = add nsw i32 %118, %117
  store i32 %119, ptr %4, align 4
  store i32 31, ptr %b, align 4
  br label %break

120:                                              ; preds = %switch
  %121 = load i32, ptr %8, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %8, align 4
  store i32 29, ptr %b, align 4
  br label %break

123:                                              ; preds = %switch
  store i32 33, ptr %b, align 4
  br label %break

124:                                              ; preds = %switch
  %125 = load i32, ptr %4, align 4
  ret i32 %125

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %12
    i32 3, label %17
    i32 4, label %20
    i32 5, label %22
    i32 6, label %29
    i32 7, label %32
    i32 8, label %33
    i32 9, label %34
    i32 10, label %39
    i32 11, label %42
    i32 12, label %44
    i32 13, label %51
    i32 14, label %58
    i32 15, label %65
    i32 16, label %66
    i32 17, label %69
    i32 18, label %70
    i32 19, label %71
    i32 20, label %76
    i32 21, label %79
    i32 22, label %81
    i32 23, label %88
    i32 24, label %94
    i32 25, label %100
    i32 26, label %103
    i32 27, label %106
    i32 28, label %107
    i32 29, label %109
    i32 30, label %113
    i32 31, label %120
    i32 32, label %123
    i32 33, label %124
  ]

break:                                            ; preds = %123, %120, %113, %109, %107, %106, %103, %100, %94, %88, %81, %79, %76, %71, %70, %69, %66, %65, %58, %51, %44, %42, %39, %34, %33, %32, %29, %22, %20, %17, %12, %11, %case10, %case9, %case8, %case
  br label %switch

case:                                             ; preds = %9
  store i32 28, ptr %b, align 4
  br label %break

case8:                                            ; preds = %9
  store i32 1, ptr %b, align 4
  br label %break

case9:                                            ; preds = %9
  store i32 8, ptr %b, align 4
  br label %break

case10:                                           ; preds = %9
  store i32 18, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

13:                                               ; preds = %switch
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

15:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 2, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  %20 = select i1 %19, i32 3, i32 5
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %9, align 4
  %24 = add nsw i32 %22, %23
  %25 = load ptr, ptr %5, align 8
  %26 = load i32, ptr %9, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  store i32 %24, ptr %28, align 4
  store i32 4, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %9, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %9, align 4
  store i32 2, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 6, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %10, align 4
  %35 = load i32, ptr %6, align 4
  %36 = icmp slt i32 %34, %35
  %37 = select i1 %36, i32 7, i32 9
  store i32 %37, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load ptr, ptr %5, align 8
  %40 = load i32, ptr %10, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %39, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, ptr %8, align 4
  store i32 8, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %10, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %10, align 4
  store i32 6, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 31, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  store i32 0, ptr %11, align 4
  store i32 11, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %11, align 4
  %53 = load i32, ptr %6, align 4
  %54 = icmp slt i32 %52, %53
  %55 = select i1 %54, i32 12, i32 18
  store i32 %55, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %7, align 4
  %58 = load i32, ptr %11, align 4
  %59 = sub nsw i32 %57, %58
  %60 = load ptr, ptr %5, align 8
  %61 = load i32, ptr %11, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, ptr %60, i64 %62
  store i32 %59, ptr %63, align 4
  store i32 13, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load ptr, ptr %5, align 8
  %66 = load i32, ptr %11, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, ptr %65, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = icmp sgt i32 %69, 0
  %71 = select i1 %70, i32 14, i32 15
  store i32 %71, ptr %b, align 4
  br label %break

72:                                               ; preds = %switch
  %73 = load ptr, ptr %5, align 8
  %74 = load i32, ptr %11, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, ptr %73, i64 %75
  %77 = load i32, ptr %76, align 4
  %78 = load i32, ptr %8, align 4
  %79 = add nsw i32 %78, %77
  store i32 %79, ptr %8, align 4
  store i32 16, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
  %81 = load ptr, ptr %5, align 8
  %82 = load i32, ptr %11, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, ptr %81, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = load i32, ptr %8, align 4
  %87 = sub nsw i32 %86, %85
  store i32 %87, ptr %8, align 4
  store i32 16, ptr %b, align 4
  br label %break

88:                                               ; preds = %switch
  store i32 17, ptr %b, align 4
  br label %break

89:                                               ; preds = %switch
  %90 = load i32, ptr %11, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %11, align 4
  store i32 11, ptr %b, align 4
  br label %break

92:                                               ; preds = %switch
  store i32 31, ptr %b, align 4
  br label %break

93:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 20, ptr %b, align 4
  br label %break

94:                                               ; preds = %switch
  %95 = load i32, ptr %12, align 4
  %96 = load i32, ptr %6, align 4
  %97 = icmp slt i32 %95, %96
  %98 = select i1 %97, i32 21, i32 26
  store i32 %98, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  %100 = load i32, ptr %12, align 4
  %101 = srem i32 %100, 2
  %102 = icmp eq i32 %101, 0
  %103 = select i1 %102, i32 22, i32 23
  store i32 %103, ptr %b, align 4
  br label %break

104:                                              ; preds = %switch
  %105 = load i32, ptr %7, align 4
  %106 = load i32, ptr %12, align 4
  %107 = add nsw i32 %105, %106
  store i32 %107, ptr %.reg2mem, align 4
  store i32 24, ptr %b, align 4
  br label %break

108:                                              ; preds = %switch
  %109 = load i32, ptr %7, align 4
  %110 = load i32, ptr %12, align 4
  %111 = sub nsw i32 %109, %110
  store i32 %111, ptr %.reg2mem, align 4
  store i32 24, ptr %b, align 4
  br label %break

112:                                              ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %113 = load ptr, ptr %5, align 8
  %114 = load i32, ptr %12, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, ptr %113, i64 %115
  store i32 %.reload, ptr %116, align 4
  store i32 25, ptr %b, align 4
  br label %break

117:                                              ; preds = %switch
  %118 = load i32, ptr %12, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, ptr %12, align 4
  store i32 20, ptr %b, align 4
  br label %break

120:                                              ; preds = %switch
  %121 = load ptr, ptr %5, align 8
  %122 = load i32, ptr %6, align 4
  %123 = sub nsw i32 %122, 1
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, ptr %121, i64 %124
  %126 = load i32, ptr %125, align 4
  store i32 %126, ptr %8, align 4
  store i32 31, ptr %b, align 4
  br label %break

127:                                              ; preds = %switch
  %128 = load ptr, ptr %5, align 8
  %129 = getelementptr inbounds i32, ptr %128, i64 0
  %130 = load i32, ptr %129, align 4
  store i32 %130, ptr %8, align 4
  store i32 28, ptr %b, align 4
  br label %break

131:                                              ; preds = %switch
  %132 = load i32, ptr %8, align 4
  %133 = icmp slt i32 %132, 0
  %134 = select i1 %133, i32 29, i32 30
  store i32 %134, ptr %b, align 4
  br label %break

135:                                              ; preds = %switch
  %136 = load i32, ptr %8, align 4
  %137 = sub nsw i32 0, %136
  store i32 %137, ptr %8, align 4
  store i32 30, ptr %b, align 4
  br label %break

138:                                              ; preds = %switch
  store i32 31, ptr %b, align 4
  br label %break

139:                                              ; preds = %switch
  %140 = load i32, ptr %8, align 4
  ret i32 %140

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %13
    i32 1, label %15
    i32 2, label %16
    i32 3, label %21
    i32 4, label %29
    i32 5, label %32
    i32 6, label %33
    i32 7, label %38
    i32 8, label %46
    i32 9, label %49
    i32 10, label %50
    i32 11, label %51
    i32 12, label %56
    i32 13, label %64
    i32 14, label %72
    i32 15, label %80
    i32 16, label %88
    i32 17, label %89
    i32 18, label %92
    i32 19, label %93
    i32 20, label %94
    i32 21, label %99
    i32 22, label %104
    i32 23, label %108
    i32 24, label %112
    i32 25, label %117
    i32 26, label %120
    i32 27, label %127
    i32 28, label %131
    i32 29, label %135
    i32 30, label %138
    i32 31, label %139
  ]

break:                                            ; preds = %138, %135, %131, %127, %120, %117, %112, %108, %104, %99, %94, %93, %92, %89, %88, %80, %72, %64, %56, %51, %50, %49, %46, %38, %33, %32, %29, %21, %16, %15, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %13
  store i32 27, ptr %b, align 4
  br label %break

case2:                                            ; preds = %13
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %13
  store i32 10, ptr %b, align 4
  br label %break

case4:                                            ; preds = %13
  store i32 19, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

13:                                               ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %case [
    i32 0, label %case8
    i32 1, label %case9
    i32 2, label %case10
  ]

15:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 2, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  %20 = select i1 %19, i32 3, i32 8
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr %7, align 4
  %24 = icmp sgt i32 %22, %23
  %25 = select i1 %24, i32 4, i32 5
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %9, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %.reg2mem, align 4
  store i32 6, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %7, align 4
  %32 = load i32, ptr %9, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %.reg2mem, align 4
  store i32 6, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %35, %.reload
  store i32 %36, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %9, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %9, align 4
  store i32 2, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  store i32 32, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 10, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %10, align 4
  %44 = load i32, ptr %5, align 4
  %45 = icmp slt i32 %43, %44
  %46 = select i1 %45, i32 11, i32 16
  store i32 %46, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %10, align 4
  %49 = srem i32 %48, 2
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i32 12, i32 13
  store i32 %51, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %6, align 4
  store i32 %53, ptr %.reg2mem1, align 4
  store i32 14, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  %55 = load i32, ptr %7, align 4
  store i32 %55, ptr %.reg2mem1, align 4
  store i32 14, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %11, align 4
  %57 = load i32, ptr %11, align 4
  %58 = load i32, ptr %8, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %8, align 4
  store i32 15, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load i32, ptr %10, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %10, align 4
  store i32 10, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  store i32 32, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 18, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %66 = load i32, ptr %12, align 4
  %67 = load i32, ptr %5, align 4
  %68 = icmp slt i32 %66, %67
  %69 = select i1 %68, i32 19, i32 27
  store i32 %69, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %12, align 4
  %72 = icmp sgt i32 %71, 2
  %73 = select i1 %72, i32 20, i32 24
  store i32 %73, ptr %b, align 4
  br label %break

74:                                               ; preds = %switch
  %75 = load i32, ptr %6, align 4
  %76 = icmp sgt i32 %75, 0
  %77 = select i1 %76, i32 21, i32 22
  store i32 %77, ptr %b, align 4
  br label %break

78:                                               ; preds = %switch
  %79 = load i32, ptr %6, align 4
  %80 = load i32, ptr %12, align 4
  %81 = mul nsw i32 %79, %80
  store i32 %81, ptr %.reg2mem3, align 4
  store i32 23, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  %83 = load i32, ptr %7, align 4
  %84 = load i32, ptr %12, align 4
  %85 = mul nsw i32 %83, %84
  store i32 %85, ptr %.reg2mem3, align 4
  store i32 23, ptr %b, align 4
  br label %break

86:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %87 = load i32, ptr %8, align 4
  %88 = add nsw i32 %87, %.reload4
  store i32 %88, ptr %8, align 4
  store i32 25, ptr %b, align 4
  br label %break

89:                                               ; preds = %switch
  %90 = load i32, ptr %12, align 4
  %91 = load i32, ptr %8, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %8, align 4
  store i32 25, ptr %b, align 4
  br label %break

93:                                               ; preds = %switch
  store i32 26, ptr %b, align 4
  br label %break

94:                                               ; preds = %switch
  %95 = load i32, ptr %12, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, ptr %12, align 4
  store i32 18, ptr %b, align 4
  br label %break

97:                                               ; preds = %switch
  store i32 32, ptr %b, align 4
  br label %break

98:                                               ; preds = %switch
  %99 = load i32, ptr %6, align 4
  %100 = load i32, ptr %7, align 4
  %101 = icmp sgt i32 %99, %100
  %102 = select i1 %101, i32 29, i32 30
  store i32 %102, ptr %b, align 4
  br label %break

103:                                              ; preds = %switch
  %104 = load i32, ptr %6, align 4
  store i32 %104, ptr %.reg2mem5, align 4
  store i32 31, ptr %b, align 4
  br label %break

105:                                              ; preds = %switch
  %106 = load i32, ptr %7, align 4
  store i32 %106, ptr %.reg2mem5, align 4
  store i32 31, ptr %b, align 4
  br label %break

107:                                              ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %8, align 4
  store i32 32, ptr %b, align 4
  br label %break

108:                                              ; preds = %switch
  %109 = load i32, ptr %8, align 4
  ret i32 %109

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %13
    i32 1, label %15
    i32 2, label %16
    i32 3, label %21
    i32 4, label %26
    i32 5, label %30
    i32 6, label %34
    i32 7, label %37
    i32 8, label %40
    i32 9, label %41
    i32 10, label %42
    i32 11, label %47
    i32 12, label %52
    i32 13, label %54
    i32 14, label %56
    i32 15, label %60
    i32 16, label %63
    i32 17, label %64
    i32 18, label %65
    i32 19, label %70
    i32 20, label %74
    i32 21, label %78
    i32 22, label %82
    i32 23, label %86
    i32 24, label %89
    i32 25, label %93
    i32 26, label %94
    i32 27, label %97
    i32 28, label %98
    i32 29, label %103
    i32 30, label %105
    i32 31, label %107
    i32 32, label %108
  ]

break:                                            ; preds = %107, %105, %103, %98, %97, %94, %93, %89, %86, %82, %78, %74, %70, %65, %64, %63, %60, %56, %54, %52, %47, %42, %41, %40, %37, %34, %30, %26, %21, %16, %15, %case10, %case9, %case8, %case
  br label %switch

case:                                             ; preds = %13
  store i32 28, ptr %b, align 4
  br label %break

case8:                                            ; preds = %13
  store i32 1, ptr %b, align 4
  br label %break

case9:                                            ; preds = %13
  store i32 9, ptr %b, align 4
  br label %break

case10:                                           ; preds = %13
  store i32 17, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_118_nested_switch_if(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %case [
    i32 0, label %case2
    i32 1, label %case3
  ]

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %case4 [
    i32 0, label %case5
    i32 1, label %case6
  ]

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = add nsw i32 %15, 20
  store i32 %16, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 30
  store i32 %19, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %6, align 4
  %22 = icmp sgt i32 %21, 20
  %23 = select i1 %22, i32 6, i32 7
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = mul nsw i32 %25, 2
  store i32 %26, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 5
  store i32 %29, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  store i32 17, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %4, align 4
  switch i32 %32, label %case7 [
    i32 0, label %case8
    i32 1, label %case9
  ]

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  %35 = sub nsw i32 %34, 10
  store i32 %35, ptr %6, align 4
  store i32 13, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %5, align 4
  %38 = sub nsw i32 %37, 20
  store i32 %38, ptr %6, align 4
  store i32 13, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %5, align 4
  %41 = sub nsw i32 %40, 30
  store i32 %41, ptr %6, align 4
  store i32 13, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %6, align 4
  %44 = icmp slt i32 %43, 0
  %45 = select i1 %44, i32 14, i32 15
  store i32 %45, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %6, align 4
  %48 = sub nsw i32 0, %47
  store i32 %48, ptr %6, align 4
  store i32 15, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 17, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %5, align 4
  store i32 %51, ptr %6, align 4
  store i32 17, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %6, align 4
  ret i32 %53

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
    i32 5, label %20
    i32 6, label %24
    i32 7, label %27
    i32 8, label %30
    i32 9, label %31
    i32 10, label %33
    i32 11, label %36
    i32 12, label %39
    i32 13, label %42
    i32 14, label %46
    i32 15, label %49
    i32 16, label %50
    i32 17, label %52
  ]

break:                                            ; preds = %50, %49, %46, %42, %39, %36, %33, %case9, %case8, %case7, %30, %27, %24, %20, %17, %14, %11, %case6, %case5, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %7
  store i32 16, ptr %b, align 4
  br label %break

case2:                                            ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %7
  store i32 9, ptr %b, align 4
  br label %break

case4:                                            ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break

case5:                                            ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break

case6:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break

case7:                                            ; preds = %31
  store i32 12, ptr %b, align 4
  br label %break

case8:                                            ; preds = %31
  store i32 10, ptr %b, align 4
  br label %break

case9:                                            ; preds = %31
  store i32 11, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %case [
    i32 0, label %case2
    i32 1, label %case3
  ]

11:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %13, %14
  %16 = select i1 %15, i32 3, i32 9
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  switch i32 %18, label %case4 [
    i32 0, label %case5
    i32 1, label %case6
  ]

19:                                               ; preds = %switch
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %7, align 4
  %25 = mul nsw i32 %24, 2
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %7, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 11, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %8, align 4
  %40 = load i32, ptr %5, align 4
  %41 = icmp slt i32 %39, %40
  %42 = select i1 %41, i32 12, i32 17
  store i32 %42, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %4, align 4
  switch i32 %44, label %case7 [
    i32 0, label %case8
    i32 1, label %case9
  ]

45:                                               ; preds = %switch
  %46 = load i32, ptr %8, align 4
  %47 = add nsw i32 %46, 10
  %48 = load i32, ptr %6, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %6, align 4
  store i32 16, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %8, align 4
  %52 = mul nsw i32 %51, 3
  %53 = load i32, ptr %6, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %6, align 4
  store i32 16, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %6, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %6, align 4
  store i32 16, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %8, align 4
  store i32 11, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load i32, ptr %5, align 4
  store i32 %63, ptr %6, align 4
  store i32 19, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load i32, ptr %6, align 4
  ret i32 %65

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %12
    i32 3, label %17
    i32 4, label %19
    i32 5, label %23
    i32 6, label %28
    i32 7, label %32
    i32 8, label %33
    i32 9, label %36
    i32 10, label %37
    i32 11, label %38
    i32 12, label %43
    i32 13, label %45
    i32 14, label %50
    i32 15, label %55
    i32 16, label %58
    i32 17, label %61
    i32 18, label %62
    i32 19, label %64
  ]

break:                                            ; preds = %62, %61, %58, %55, %50, %45, %case9, %case8, %case7, %38, %37, %36, %33, %32, %28, %23, %19, %case6, %case5, %case4, %12, %11, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %9
  store i32 18, ptr %b, align 4
  br label %break

case2:                                            ; preds = %9
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %9
  store i32 10, ptr %b, align 4
  br label %break

case4:                                            ; preds = %17
  store i32 6, ptr %b, align 4
  br label %break

case5:                                            ; preds = %17
  store i32 4, ptr %b, align 4
  br label %break

case6:                                            ; preds = %17
  store i32 5, ptr %b, align 4
  br label %break

case7:                                            ; preds = %43
  store i32 15, ptr %b, align 4
  br label %break

case8:                                            ; preds = %43
  store i32 13, ptr %b, align 4
  br label %break

case9:                                            ; preds = %43
  store i32 14, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

13:                                               ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %case [
    i32 0, label %case10
    i32 1, label %case11
  ]

15:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 2, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  %20 = select i1 %19, i32 3, i32 18
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %10, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp slt i32 %23, %24
  %26 = select i1 %25, i32 5, i32 16
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %9, align 4
  %29 = load i32, ptr %10, align 4
  %30 = icmp sgt i32 %28, %29
  %31 = select i1 %30, i32 6, i32 10
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %6, align 4
  %34 = load i32, ptr %7, align 4
  %35 = icmp sgt i32 %33, %34
  %36 = select i1 %35, i32 7, i32 8
  store i32 %36, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %6, align 4
  %39 = load i32, ptr %9, align 4
  %40 = add nsw i32 %38, %39
  store i32 %40, ptr %.reg2mem, align 4
  store i32 9, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %10, align 4
  %44 = add nsw i32 %42, %43
  store i32 %44, ptr %.reg2mem, align 4
  store i32 9, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %46 = load i32, ptr %8, align 4
  %47 = add nsw i32 %46, %.reload
  store i32 %47, ptr %8, align 4
  store i32 14, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %6, align 4
  %50 = load i32, ptr %7, align 4
  %51 = icmp slt i32 %49, %50
  %52 = select i1 %51, i32 11, i32 12
  store i32 %52, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %9, align 4
  store i32 %54, ptr %.reg2mem1, align 4
  store i32 13, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %10, align 4
  store i32 %56, ptr %.reg2mem1, align 4
  store i32 13, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %58 = load i32, ptr %8, align 4
  %59 = sub nsw i32 %58, %.reload2
  store i32 %59, ptr %8, align 4
  store i32 14, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  store i32 15, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
  %62 = load i32, ptr %10, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %10, align 4
  store i32 4, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  store i32 17, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %66 = load i32, ptr %9, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %9, align 4
  store i32 2, ptr %b, align 4
  br label %break

68:                                               ; preds = %switch
  store i32 41, ptr %b, align 4
  br label %break

69:                                               ; preds = %switch
  store i32 0, ptr %11, align 4
  store i32 20, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %11, align 4
  %72 = load i32, ptr %5, align 4
  %73 = icmp slt i32 %71, %72
  %74 = select i1 %73, i32 21, i32 36
  store i32 %74, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  %76 = load i32, ptr %11, align 4
  %77 = srem i32 %76, 2
  %78 = icmp eq i32 %77, 0
  %79 = select i1 %78, i32 22, i32 30
  store i32 %79, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 23, ptr %b, align 4
  br label %break

81:                                               ; preds = %switch
  %82 = load i32, ptr %12, align 4
  %83 = icmp slt i32 %82, 2
  %84 = select i1 %83, i32 24, i32 29
  store i32 %84, ptr %b, align 4
  br label %break

85:                                               ; preds = %switch
  %86 = load i32, ptr %6, align 4
  %87 = icmp sgt i32 %86, 0
  %88 = select i1 %87, i32 25, i32 26
  store i32 %88, ptr %b, align 4
  br label %break

89:                                               ; preds = %switch
  %90 = load i32, ptr %6, align 4
  %91 = load i32, ptr %12, align 4
  %92 = add nsw i32 %90, %91
  store i32 %92, ptr %.reg2mem3, align 4
  store i32 27, ptr %b, align 4
  br label %break

93:                                               ; preds = %switch
  %94 = load i32, ptr %7, align 4
  %95 = load i32, ptr %12, align 4
  %96 = sub nsw i32 %94, %95
  store i32 %96, ptr %.reg2mem3, align 4
  store i32 27, ptr %b, align 4
  br label %break

97:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %98 = load i32, ptr %8, align 4
  %99 = add nsw i32 %98, %.reload4
  store i32 %99, ptr %8, align 4
  store i32 28, ptr %b, align 4
  br label %break

100:                                              ; preds = %switch
  %101 = load i32, ptr %12, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %12, align 4
  store i32 23, ptr %b, align 4
  br label %break

103:                                              ; preds = %switch
  store i32 34, ptr %b, align 4
  br label %break

104:                                              ; preds = %switch
  %105 = load i32, ptr %6, align 4
  %106 = load i32, ptr %7, align 4
  %107 = icmp sgt i32 %105, %106
  %108 = select i1 %107, i32 31, i32 32
  store i32 %108, ptr %b, align 4
  br label %break

109:                                              ; preds = %switch
  %110 = load i32, ptr %6, align 4
  store i32 %110, ptr %.reg2mem5, align 4
  store i32 33, ptr %b, align 4
  br label %break

111:                                              ; preds = %switch
  %112 = load i32, ptr %7, align 4
  store i32 %112, ptr %.reg2mem5, align 4
  store i32 33, ptr %b, align 4
  br label %break

113:                                              ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %114 = load i32, ptr %8, align 4
  %115 = add nsw i32 %114, %.reload6
  store i32 %115, ptr %8, align 4
  store i32 34, ptr %b, align 4
  br label %break

116:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

117:                                              ; preds = %switch
  %118 = load i32, ptr %11, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, ptr %11, align 4
  store i32 20, ptr %b, align 4
  br label %break

120:                                              ; preds = %switch
  store i32 41, ptr %b, align 4
  br label %break

121:                                              ; preds = %switch
  %122 = load i32, ptr %6, align 4
  %123 = load i32, ptr %7, align 4
  %124 = icmp sgt i32 %122, %123
  %125 = select i1 %124, i32 38, i32 39
  store i32 %125, ptr %b, align 4
  br label %break

126:                                              ; preds = %switch
  %127 = load i32, ptr %6, align 4
  %128 = load i32, ptr %7, align 4
  %129 = sub nsw i32 %127, %128
  store i32 %129, ptr %.reg2mem7, align 4
  store i32 40, ptr %b, align 4
  br label %break

130:                                              ; preds = %switch
  %131 = load i32, ptr %7, align 4
  %132 = load i32, ptr %6, align 4
  %133 = sub nsw i32 %131, %132
  store i32 %133, ptr %.reg2mem7, align 4
  store i32 40, ptr %b, align 4
  br label %break

134:                                              ; preds = %switch
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  store i32 %.reload8, ptr %8, align 4
  store i32 41, ptr %b, align 4
  br label %break

135:                                              ; preds = %switch
  %136 = load i32, ptr %8, align 4
  ret i32 %136

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b9 = load i32, ptr %b, align 4
  switch i32 %b9, label %default [
    i32 0, label %13
    i32 1, label %15
    i32 2, label %16
    i32 3, label %21
    i32 4, label %22
    i32 5, label %27
    i32 6, label %32
    i32 7, label %37
    i32 8, label %41
    i32 9, label %45
    i32 10, label %48
    i32 11, label %53
    i32 12, label %55
    i32 13, label %57
    i32 14, label %60
    i32 15, label %61
    i32 16, label %64
    i32 17, label %65
    i32 18, label %68
    i32 19, label %69
    i32 20, label %70
    i32 21, label %75
    i32 22, label %80
    i32 23, label %81
    i32 24, label %85
    i32 25, label %89
    i32 26, label %93
    i32 27, label %97
    i32 28, label %100
    i32 29, label %103
    i32 30, label %104
    i32 31, label %109
    i32 32, label %111
    i32 33, label %113
    i32 34, label %116
    i32 35, label %117
    i32 36, label %120
    i32 37, label %121
    i32 38, label %126
    i32 39, label %130
    i32 40, label %134
    i32 41, label %135
  ]

break:                                            ; preds = %134, %130, %126, %121, %120, %117, %116, %113, %111, %109, %104, %103, %100, %97, %93, %89, %85, %81, %80, %75, %70, %69, %68, %65, %64, %61, %60, %57, %55, %53, %48, %45, %41, %37, %32, %27, %22, %21, %16, %15, %case11, %case10, %case
  br label %switch

case:                                             ; preds = %13
  store i32 37, ptr %b, align 4
  br label %break

case10:                                           ; preds = %13
  store i32 1, ptr %b, align 4
  br label %break

case11:                                           ; preds = %13
  store i32 19, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

13:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 2, i32 3
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  store i32 %19, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %6, align 4
  %22 = load i32, ptr %6, align 4
  %23 = zext i32 %22 to i64
  %24 = call ptr @llvm.stacksave()
  store ptr %24, ptr %7, align 8
  %25 = alloca i32, i64 %23, align 16
  store ptr %25, ptr %.reg2mem1, align 8
  store i64 %23, ptr %8, align 8
  store i32 0, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %9, align 4
  %28 = load i32, ptr %6, align 4
  %29 = icmp slt i32 %27, %28
  %30 = select i1 %29, i32 6, i32 8
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %9, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32, ptr %9, align 4
  %36 = sext i32 %35 to i64
  %.reload9 = load ptr, ptr %.reg2mem1, align 8
  %37 = getelementptr inbounds i32, ptr %.reload9, i64 %36
  store i32 %34, ptr %37, align 4
  store i32 7, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %9, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  %42 = load i32, ptr %3, align 4
  switch i32 %42, label %case [
    i32 0, label %case11
    i32 1, label %case12
    i32 2, label %case13
  ]

43:                                               ; preds = %switch
  store i32 0, ptr %11, align 4
  store i32 10, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %11, align 4
  %46 = load i32, ptr %6, align 4
  %47 = icmp slt i32 %45, %46
  %48 = select i1 %47, i32 11, i32 13
  store i32 %48, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %11, align 4
  %51 = sext i32 %50 to i64
  %.reload8 = load ptr, ptr %.reg2mem1, align 8
  %52 = getelementptr inbounds i32, ptr %.reload8, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = load i32, ptr %10, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %10, align 4
  store i32 12, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %11, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %11, align 4
  store i32 10, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  store i32 27, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 15, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
  %62 = load i32, ptr %12, align 4
  %63 = load i32, ptr %6, align 4
  %64 = icmp slt i32 %62, %63
  %65 = select i1 %64, i32 16, i32 21
  store i32 %65, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %12, align 4
  %68 = sext i32 %67 to i64
  %.reload7 = load ptr, ptr %.reg2mem1, align 8
  %69 = getelementptr inbounds i32, ptr %.reload7, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = icmp sgt i32 %70, 0
  %72 = select i1 %71, i32 17, i32 18
  store i32 %72, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %74 = load i32, ptr %12, align 4
  %75 = sext i32 %74 to i64
  %.reload6 = load ptr, ptr %.reg2mem1, align 8
  %76 = getelementptr inbounds i32, ptr %.reload6, i64 %75
  %77 = load i32, ptr %76, align 4
  %78 = load i32, ptr %10, align 4
  %79 = add nsw i32 %78, %77
  store i32 %79, ptr %10, align 4
  store i32 19, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
  %81 = load i32, ptr %12, align 4
  %82 = sext i32 %81 to i64
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %83 = getelementptr inbounds i32, ptr %.reload5, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = load i32, ptr %10, align 4
  %86 = sub nsw i32 %85, %84
  store i32 %86, ptr %10, align 4
  store i32 19, ptr %b, align 4
  br label %break

87:                                               ; preds = %switch
  store i32 20, ptr %b, align 4
  br label %break

88:                                               ; preds = %switch
  %89 = load i32, ptr %12, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %12, align 4
  store i32 15, ptr %b, align 4
  br label %break

91:                                               ; preds = %switch
  store i32 27, ptr %b, align 4
  br label %break

92:                                               ; preds = %switch
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %93 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %94 = load i32, ptr %93, align 16
  store i32 %94, ptr %10, align 4
  store i32 23, ptr %b, align 4
  br label %break

95:                                               ; preds = %switch
  %96 = load i32, ptr %6, align 4
  %97 = icmp sgt i32 %96, 1
  %98 = select i1 %97, i32 24, i32 25
  store i32 %98, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  %100 = load i32, ptr %6, align 4
  %101 = sub nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %103 = getelementptr inbounds i32, ptr %.reload3, i64 %102
  %104 = load i32, ptr %103, align 4
  %105 = load i32, ptr %10, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, ptr %10, align 4
  store i32 25, ptr %b, align 4
  br label %break

107:                                              ; preds = %switch
  store i32 27, ptr %b, align 4
  br label %break

108:                                              ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %109 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %110 = load i32, ptr %109, align 16
  store i32 %110, ptr %10, align 4
  store i32 27, ptr %b, align 4
  br label %break

111:                                              ; preds = %switch
  %112 = load i32, ptr %10, align 4
  %113 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %113)
  ret i32 %112

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b10 = load i32, ptr %b, align 4
  switch i32 %b10, label %default [
    i32 0, label %13
    i32 1, label %14
    i32 2, label %18
    i32 3, label %20
    i32 4, label %21
    i32 5, label %26
    i32 6, label %31
    i32 7, label %38
    i32 8, label %41
    i32 9, label %43
    i32 10, label %44
    i32 11, label %49
    i32 12, label %56
    i32 13, label %59
    i32 14, label %60
    i32 15, label %61
    i32 16, label %66
    i32 17, label %73
    i32 18, label %80
    i32 19, label %87
    i32 20, label %88
    i32 21, label %91
    i32 22, label %92
    i32 23, label %95
    i32 24, label %99
    i32 25, label %107
    i32 26, label %108
    i32 27, label %111
  ]

break:                                            ; preds = %108, %107, %99, %95, %92, %91, %88, %87, %80, %73, %66, %61, %60, %59, %56, %49, %44, %43, %case13, %case12, %case11, %case, %38, %31, %26, %21, %20, %18, %14, %13
  br label %switch

case:                                             ; preds = %41
  store i32 26, ptr %b, align 4
  br label %break

case11:                                           ; preds = %41
  store i32 9, ptr %b, align 4
  br label %break

case12:                                           ; preds = %41
  store i32 14, ptr %b, align 4
  br label %break

case13:                                           ; preds = %41
  store i32 22, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

13:                                               ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 2, i32 3
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  store i32 %19, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %6, align 4
  %22 = load i32, ptr %6, align 4
  %23 = zext i32 %22 to i64
  %24 = call ptr @llvm.stacksave()
  store ptr %24, ptr %7, align 8
  %25 = alloca i32, i64 %23, align 16
  store i64 %23, ptr %8, align 8
  store ptr %25, ptr %9, align 8
  store i32 0, ptr %10, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %10, align 4
  %28 = load i32, ptr %6, align 4
  %29 = icmp slt i32 %27, %28
  %30 = select i1 %29, i32 6, i32 11
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %10, align 4
  %33 = srem i32 %32, 2
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, i32 7, i32 8
  store i32 %35, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %5, align 4
  %38 = load i32, ptr %10, align 4
  %39 = add nsw i32 %37, %38
  store i32 %39, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %5, align 4
  %42 = load i32, ptr %10, align 4
  %43 = sub nsw i32 %41, %42
  store i32 %43, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %45 = load ptr, ptr %9, align 8
  %46 = load i32, ptr %10, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %45, i64 %47
  store i32 %.reload2, ptr %48, align 4
  store i32 10, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %10, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %10, align 4
  store i32 5, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  store i32 0, ptr %11, align 4
  %53 = load i32, ptr %3, align 4
  switch i32 %53, label %case [
    i32 0, label %case6
    i32 1, label %case7
    i32 2, label %case8
  ]

54:                                               ; preds = %switch
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr inbounds i32, ptr %55, i64 0
  %57 = load i32, ptr %56, align 4
  store i32 %57, ptr %11, align 4
  store i32 23, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load ptr, ptr %9, align 8
  %60 = load i32, ptr %6, align 4
  %61 = sub nsw i32 %60, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, ptr %59, i64 %62
  %64 = load i32, ptr %63, align 4
  store i32 %64, ptr %11, align 4
  store i32 23, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %66 = load ptr, ptr %9, align 8
  %67 = getelementptr inbounds i32, ptr %66, i64 0
  %68 = load i32, ptr %67, align 4
  %69 = icmp sgt i32 %68, 0
  %70 = select i1 %69, i32 15, i32 16
  store i32 %70, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %72 = load ptr, ptr %9, align 8
  %73 = getelementptr inbounds i32, ptr %72, i64 0
  %74 = load i32, ptr %73, align 4
  %75 = mul nsw i32 %74, 2
  store i32 %75, ptr %.reg2mem3, align 4
  store i32 17, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load ptr, ptr %9, align 8
  %78 = getelementptr inbounds i32, ptr %77, i64 0
  %79 = load i32, ptr %78, align 4
  %80 = sub nsw i32 %79, 2
  store i32 %80, ptr %.reg2mem3, align 4
  store i32 17, ptr %b, align 4
  br label %break

81:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %11, align 4
  store i32 23, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 19, ptr %b, align 4
  br label %break

83:                                               ; preds = %switch
  %84 = load i32, ptr %12, align 4
  %85 = load i32, ptr %6, align 4
  %86 = icmp slt i32 %84, %85
  %87 = select i1 %86, i32 20, i32 22
  store i32 %87, ptr %b, align 4
  br label %break

88:                                               ; preds = %switch
  %89 = load ptr, ptr %9, align 8
  %90 = load i32, ptr %12, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, ptr %89, i64 %91
  %93 = load i32, ptr %92, align 4
  %94 = load i32, ptr %11, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, ptr %11, align 4
  store i32 21, ptr %b, align 4
  br label %break

96:                                               ; preds = %switch
  %97 = load i32, ptr %12, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %12, align 4
  store i32 19, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

100:                                              ; preds = %switch
  %101 = load i32, ptr %11, align 4
  %102 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %102)
  ret i32 %101

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b5 = load i32, ptr %b, align 4
  switch i32 %b5, label %default [
    i32 0, label %13
    i32 1, label %14
    i32 2, label %18
    i32 3, label %20
    i32 4, label %21
    i32 5, label %26
    i32 6, label %31
    i32 7, label %36
    i32 8, label %40
    i32 9, label %44
    i32 10, label %49
    i32 11, label %52
    i32 12, label %54
    i32 13, label %58
    i32 14, label %65
    i32 15, label %71
    i32 16, label %76
    i32 17, label %81
    i32 18, label %82
    i32 19, label %83
    i32 20, label %88
    i32 21, label %96
    i32 22, label %99
    i32 23, label %100
  ]

break:                                            ; preds = %99, %96, %88, %83, %82, %81, %76, %71, %65, %58, %54, %case8, %case7, %case6, %case, %49, %44, %40, %36, %31, %26, %21, %20, %18, %14, %13
  br label %switch

case:                                             ; preds = %52
  store i32 18, ptr %b, align 4
  br label %break

case6:                                            ; preds = %52
  store i32 12, ptr %b, align 4
  br label %break

case7:                                            ; preds = %52
  store i32 13, ptr %b, align 4
  br label %break

case8:                                            ; preds = %52
  store i32 14, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_123_switch_goto(i32 noundef %0, i32 noundef %1) #0 {
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
  %6 = load i32, ptr %2, align 4
  switch i32 %6, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 %14, 10
  store i32 %15, ptr %4, align 4
  store i32 6, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  store i32 %17, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 5
  store i32 %20, ptr %4, align 4
  store i32 6, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = icmp slt i32 %22, 0
  %24 = select i1 %23, i32 7, i32 8
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 0, %26
  store i32 %27, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %4, align 4
  ret i32 %30

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
    i32 4, label %16
    i32 5, label %18
    i32 6, label %21
    i32 7, label %25
    i32 8, label %28
    i32 9, label %29
  ]

break:                                            ; preds = %28, %25, %21, %18, %16, %13, %10, %7, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %5
  store i32 4, ptr %b, align 4
  br label %break

case2:                                            ; preds = %5
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break

case4:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

11:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %7, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %13, %14
  %16 = select i1 %15, i32 3, i32 7
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %7, align 4
  %20 = add nsw i32 %18, %19
  %21 = icmp sgt i32 %20, 20
  %22 = select i1 %21, i32 4, i32 5
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %7, align 4
  store i32 2, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  store i32 22, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 9, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %8, align 4
  %37 = load i32, ptr %4, align 4
  %38 = icmp slt i32 %36, %37
  %39 = select i1 %38, i32 10, i32 14
  store i32 %39, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %5, align 4
  %42 = load i32, ptr %8, align 4
  %43 = sub nsw i32 %41, %42
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, ptr %6, align 4
  store i32 11, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %6, align 4
  %48 = icmp sgt i32 %47, 30
  %49 = select i1 %48, i32 12, i32 13
  store i32 %49, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %8, align 4
  store i32 9, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 22, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %5, align 4
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %6, align 4
  %60 = load i32, ptr %5, align 4
  %61 = add nsw i32 %60, -1
  store i32 %61, ptr %5, align 4
  store i32 17, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load i32, ptr %5, align 4
  %64 = icmp sgt i32 %63, 0
  store i1 false, ptr %.reg2mem, align 1
  %65 = select i1 %64, i32 18, i32 19
  store i32 %65, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %4, align 4
  %68 = add nsw i32 %67, -1
  store i32 %68, ptr %4, align 4
  %69 = icmp sgt i32 %67, 0
  store i1 %69, ptr %.reg2mem, align 1
  store i32 19, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %71 = select i1 %.reload, i32 16, i32 20
  store i32 %71, ptr %b, align 4
  br label %break

72:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %74 = load i32, ptr %5, align 4
  store i32 %74, ptr %6, align 4
  store i32 23, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  store i32 23, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load i32, ptr %6, align 4
  ret i32 %77

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %12
    i32 3, label %17
    i32 4, label %23
    i32 5, label %24
    i32 6, label %30
    i32 7, label %33
    i32 8, label %34
    i32 9, label %35
    i32 10, label %40
    i32 11, label %46
    i32 12, label %50
    i32 13, label %51
    i32 14, label %54
    i32 15, label %55
    i32 16, label %56
    i32 17, label %62
    i32 18, label %66
    i32 19, label %70
    i32 20, label %72
    i32 21, label %73
    i32 22, label %75
    i32 23, label %76
  ]

break:                                            ; preds = %75, %73, %72, %70, %66, %62, %56, %55, %54, %51, %50, %46, %40, %35, %34, %33, %30, %24, %23, %17, %12, %11, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %9
  store i32 21, ptr %b, align 4
  br label %break

case2:                                            ; preds = %9
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %9
  store i32 8, ptr %b, align 4
  br label %break

case4:                                            ; preds = %9
  store i32 15, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_125_switch_goto_pointer_array(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
  ]

11:                                               ; preds = %switch
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
  store i32 6, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
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
  store i32 6, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %7, align 4
  %35 = load ptr, ptr %5, align 8
  %36 = load i32, ptr %6, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  store i32 %34, ptr %38, align 4
  store i32 5, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr @g_arr, align 16
  store i32 %40, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load ptr, ptr %5, align 8
  %43 = load i32, ptr %6, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = add nsw i32 %46, 10
  store i32 %47, ptr %45, align 4
  store i32 6, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load ptr, ptr %5, align 8
  %50 = load i32, ptr %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %49, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = icmp sgt i32 %53, 0
  %55 = select i1 %54, i32 7, i32 8
  store i32 %55, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load ptr, ptr %5, align 8
  %58 = load i32, ptr %6, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %8, align 4
  store i32 9, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load ptr, ptr %5, align 8
  %64 = load i32, ptr %6, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %63, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = sub nsw i32 0, %67
  store i32 %68, ptr %8, align 4
  store i32 9, ptr %b, align 4
  br label %break

69:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %8, align 4
  ret i32 %71

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %22
    i32 3, label %33
    i32 4, label %39
    i32 5, label %41
    i32 6, label %48
    i32 7, label %56
    i32 8, label %62
    i32 9, label %69
    i32 10, label %70
  ]

break:                                            ; preds = %69, %62, %56, %48, %41, %39, %33, %22, %11, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break

case2:                                            ; preds = %9
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break

case4:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %case [
    i32 0, label %case2
    i32 1, label %case3
    i32 2, label %case4
    i32 3, label %case5
  ]

11:                                               ; preds = %switch
  %12 = load i32, ptr %6, align 4
  %13 = add nsw i32 %12, 10
  store i32 %13, ptr %6, align 4
  store i32 2, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %16, %17
  %19 = select i1 %18, i32 4, i32 9
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %7, align 4
  %22 = srem i32 %21, 2
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 5, i32 6
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %5, align 4
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %7, align 4
  %34 = sub nsw i32 %32, %33
  %35 = load i32, ptr %6, align 4
  %36 = sub nsw i32 %35, %34
  store i32 %36, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 20, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %6, align 4
  %44 = add nsw i32 %43, 20
  store i32 %44, ptr %6, align 4
  store i32 11, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 12, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %8, align 4
  %48 = load i32, ptr %4, align 4
  %49 = icmp slt i32 %47, %48
  %50 = select i1 %49, i32 13, i32 18
  store i32 %50, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %8, align 4
  %53 = icmp sgt i32 %52, 2
  %54 = select i1 %53, i32 14, i32 15
  store i32 %54, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %8, align 4
  %57 = mul nsw i32 %56, 2
  store i32 %57, ptr %.reg2mem, align 4
  store i32 16, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %8, align 4
  store i32 %59, ptr %.reg2mem, align 4
  store i32 16, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %61 = load i32, ptr %6, align 4
  %62 = add nsw i32 %61, %.reload
  store i32 %62, ptr %6, align 4
  store i32 17, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  %64 = load i32, ptr %8, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %8, align 4
  store i32 12, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  store i32 20, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  %68 = load i32, ptr %5, align 4
  store i32 %68, ptr %6, align 4
  store i32 20, ptr %b, align 4
  br label %break

69:                                               ; preds = %switch
  %70 = load i32, ptr %6, align 4
  ret i32 %70

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %14
    i32 3, label %15
    i32 4, label %20
    i32 5, label %25
    i32 6, label %31
    i32 7, label %37
    i32 8, label %38
    i32 9, label %41
    i32 10, label %42
    i32 11, label %45
    i32 12, label %46
    i32 13, label %51
    i32 14, label %55
    i32 15, label %58
    i32 16, label %60
    i32 17, label %63
    i32 18, label %66
    i32 19, label %67
    i32 20, label %69
  ]

break:                                            ; preds = %67, %66, %63, %60, %58, %55, %51, %46, %45, %42, %41, %38, %37, %31, %25, %20, %15, %14, %11, %case5, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %9
  store i32 19, ptr %b, align 4
  br label %break

case2:                                            ; preds = %9
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break

case4:                                            ; preds = %9
  store i32 10, ptr %b, align 4
  br label %break

case5:                                            ; preds = %9
  store i32 11, ptr %b, align 4
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_127_nested_switch_array_pointer(i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
entry:
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %10 = load i32, ptr %4, align 4
  switch i32 %10, label %case [
    i32 0, label %case2
    i32 1, label %case3
  ]

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  switch i32 %12, label %case4 [
    i32 0, label %case5
    i32 1, label %case6
  ]

13:                                               ; preds = %switch
  %14 = load i32, ptr %7, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  store i32 %17, ptr %21, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
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
  store i32 5, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
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
  store i32 5, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load ptr, ptr %6, align 8
  %44 = load i32, ptr %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  store i32 %47, ptr %8, align 4
  store i32 12, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %5, align 4
  switch i32 %49, label %case7 [
    i32 0, label %case8
    i32 1, label %case9
  ]

50:                                               ; preds = %switch
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
  store i32 10, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
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
  store i32 10, ptr %b, align 4
  br label %break

72:                                               ; preds = %switch
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
  store i32 10, ptr %b, align 4
  br label %break

83:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

84:                                               ; preds = %switch
  %85 = load ptr, ptr %6, align 8
  %86 = load i32, ptr %7, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, ptr %85, i64 %87
  %89 = load i32, ptr %88, align 4
  store i32 %89, ptr %8, align 4
  store i32 12, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load i32, ptr %8, align 4
  %92 = icmp sgt i32 %91, 0
  %93 = select i1 %92, i32 13, i32 14
  store i32 %93, ptr %b, align 4
  br label %break

94:                                               ; preds = %switch
  %95 = load i32, ptr @g_arr, align 16
  %96 = load i32, ptr %8, align 4
  %97 = add nsw i32 %96, %95
  store i32 %97, ptr %8, align 4
  store i32 15, ptr %b, align 4
  br label %break

98:                                               ; preds = %switch
  %99 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %100 = load i32, ptr %8, align 4
  %101 = sub nsw i32 %100, %99
  store i32 %101, ptr %8, align 4
  store i32 15, ptr %b, align 4
  br label %break

102:                                              ; preds = %switch
  %103 = load i32, ptr %8, align 4
  ret i32 %103

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %13
    i32 3, label %22
    i32 4, label %32
    i32 5, label %42
    i32 6, label %48
    i32 7, label %50
    i32 8, label %61
    i32 9, label %72
    i32 10, label %83
    i32 11, label %84
    i32 12, label %90
    i32 13, label %94
    i32 14, label %98
    i32 15, label %102
  ]

break:                                            ; preds = %98, %94, %90, %84, %83, %72, %61, %50, %case9, %case8, %case7, %42, %32, %22, %13, %case6, %case5, %case4, %case3, %case2, %case
  br label %switch

case:                                             ; preds = %9
  store i32 11, ptr %b, align 4
  br label %break

case2:                                            ; preds = %9
  store i32 1, ptr %b, align 4
  br label %break

case3:                                            ; preds = %9
  store i32 6, ptr %b, align 4
  br label %break

case4:                                            ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break

case5:                                            ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break

case6:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break

case7:                                            ; preds = %48
  store i32 9, ptr %b, align 4
  br label %break

case8:                                            ; preds = %48
  store i32 7, ptr %b, align 4
  br label %break

case9:                                            ; preds = %48
  store i32 8, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

13:                                               ; preds = %switch
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  switch i32 %14, label %case [
    i32 0, label %case10
    i32 1, label %case11
    i32 2, label %case12
  ]

15:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 2, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  store i1 false, ptr %.reg2mem, align 1
  %20 = select i1 %19, i32 3, i32 4
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %9, align 4
  %23 = icmp slt i32 %22, 8
  store i1 %23, ptr %.reg2mem, align 1
  store i32 4, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %25 = select i1 %.reload, i32 5, i32 14
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %9, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = icmp sgt i32 %30, 0
  %32 = select i1 %31, i32 6, i32 7
  store i32 %32, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %9, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %37, %38
  store i32 %39, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %9, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = load i32, ptr %7, align 4
  %46 = sub nsw i32 %44, %45
  store i32 %46, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %48 = load ptr, ptr %5, align 8
  %49 = load i32, ptr %9, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, ptr %48, i64 %50
  store i32 %.reload2, ptr %51, align 4
  store i32 9, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load ptr, ptr %5, align 8
  %54 = load i32, ptr %9, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr %53, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = icmp sgt i32 %57, 0
  %59 = select i1 %58, i32 10, i32 11
  store i32 %59, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load ptr, ptr %5, align 8
  %62 = load i32, ptr %9, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr %61, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = load i32, ptr %8, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %8, align 4
  store i32 12, ptr %b, align 4
  br label %break

68:                                               ; preds = %switch
  %69 = load ptr, ptr %5, align 8
  %70 = load i32, ptr %9, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr %69, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = load i32, ptr %8, align 4
  %75 = sub nsw i32 %74, %73
  store i32 %75, ptr %8, align 4
  store i32 12, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

77:                                               ; preds = %switch
  %78 = load i32, ptr %9, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %9, align 4
  store i32 2, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
  store i32 43, ptr %b, align 4
  br label %break

81:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 16, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  %83 = load i32, ptr %10, align 4
  %84 = load i32, ptr %6, align 4
  %85 = icmp slt i32 %83, %84
  store i1 false, ptr %.reg2mem3, align 1
  %86 = select i1 %85, i32 17, i32 18
  store i32 %86, ptr %b, align 4
  br label %break

87:                                               ; preds = %switch
  %88 = load i32, ptr %10, align 4
  %89 = icmp slt i32 %88, 8
  store i1 %89, ptr %.reg2mem3, align 1
  store i32 18, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %.reload4 = load i1, ptr %.reg2mem3, align 1
  %91 = select i1 %.reload4, i32 19, i32 28
  store i32 %91, ptr %b, align 4
  br label %break

92:                                               ; preds = %switch
  %93 = load i32, ptr %7, align 4
  %94 = load i32, ptr %10, align 4
  %95 = add nsw i32 %93, %94
  %96 = load ptr, ptr %5, align 8
  %97 = load i32, ptr %10, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, ptr %96, i64 %98
  store i32 %95, ptr %99, align 4
  store i32 0, ptr %11, align 4
  store i32 20, ptr %b, align 4
  br label %break

100:                                              ; preds = %switch
  %101 = load i32, ptr %11, align 4
  %102 = icmp slt i32 %101, 2
  %103 = select i1 %102, i32 21, i32 26
  store i32 %103, ptr %b, align 4
  br label %break

104:                                              ; preds = %switch
  %105 = load i32, ptr %10, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %106
  %108 = load i32, ptr %107, align 4
  %109 = load i32, ptr %11, align 4
  %110 = icmp sgt i32 %108, %109
  %111 = select i1 %110, i32 22, i32 23
  store i32 %111, ptr %b, align 4
  br label %break

112:                                              ; preds = %switch
  %113 = load ptr, ptr %5, align 8
  %114 = load i32, ptr %10, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, ptr %113, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = load i32, ptr %8, align 4
  %119 = add nsw i32 %118, %117
  store i32 %119, ptr %8, align 4
  store i32 24, ptr %b, align 4
  br label %break

120:                                              ; preds = %switch
  %121 = load ptr, ptr %5, align 8
  %122 = load i32, ptr %10, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, ptr %121, i64 %123
  %125 = load i32, ptr %124, align 4
  %126 = load i32, ptr %8, align 4
  %127 = sub nsw i32 %126, %125
  store i32 %127, ptr %8, align 4
  store i32 24, ptr %b, align 4
  br label %break

128:                                              ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %break

129:                                              ; preds = %switch
  %130 = load i32, ptr %11, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %11, align 4
  store i32 20, ptr %b, align 4
  br label %break

132:                                              ; preds = %switch
  store i32 27, ptr %b, align 4
  br label %break

133:                                              ; preds = %switch
  %134 = load i32, ptr %10, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, ptr %10, align 4
  store i32 16, ptr %b, align 4
  br label %break

136:                                              ; preds = %switch
  store i32 43, ptr %b, align 4
  br label %break

137:                                              ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 30, ptr %b, align 4
  br label %break

138:                                              ; preds = %switch
  %139 = load i32, ptr %12, align 4
  %140 = load i32, ptr %6, align 4
  %141 = icmp slt i32 %139, %140
  store i1 false, ptr %.reg2mem5, align 1
  %142 = select i1 %141, i32 31, i32 32
  store i32 %142, ptr %b, align 4
  br label %break

143:                                              ; preds = %switch
  %144 = load i32, ptr %12, align 4
  %145 = icmp slt i32 %144, 8
  store i1 %145, ptr %.reg2mem5, align 1
  store i32 32, ptr %b, align 4
  br label %break

146:                                              ; preds = %switch
  %.reload6 = load i1, ptr %.reg2mem5, align 1
  %147 = select i1 %.reload6, i32 33, i32 38
  store i32 %147, ptr %b, align 4
  br label %break

148:                                              ; preds = %switch
  %149 = load ptr, ptr %5, align 8
  %150 = load i32, ptr %12, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, ptr %149, i64 %151
  %153 = load i32, ptr %152, align 4
  %154 = icmp sgt i32 %153, 0
  %155 = select i1 %154, i32 34, i32 35
  store i32 %155, ptr %b, align 4
  br label %break

156:                                              ; preds = %switch
  %157 = load ptr, ptr %5, align 8
  %158 = load i32, ptr %12, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, ptr %157, i64 %159
  %161 = load i32, ptr %160, align 4
  %162 = mul nsw i32 %161, 2
  store i32 %162, ptr %.reg2mem7, align 4
  store i32 36, ptr %b, align 4
  br label %break

163:                                              ; preds = %switch
  %164 = load ptr, ptr %5, align 8
  %165 = load i32, ptr %12, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, ptr %164, i64 %166
  %168 = load i32, ptr %167, align 4
  %169 = sub nsw i32 %168, 2
  store i32 %169, ptr %.reg2mem7, align 4
  store i32 36, ptr %b, align 4
  br label %break

170:                                              ; preds = %switch
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %171 = load i32, ptr %8, align 4
  %172 = add nsw i32 %171, %.reload8
  store i32 %172, ptr %8, align 4
  store i32 37, ptr %b, align 4
  br label %break

173:                                              ; preds = %switch
  %174 = load i32, ptr %12, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, ptr %12, align 4
  store i32 30, ptr %b, align 4
  br label %break

176:                                              ; preds = %switch
  store i32 43, ptr %b, align 4
  br label %break

177:                                              ; preds = %switch
  %178 = load ptr, ptr %5, align 8
  %179 = getelementptr inbounds i32, ptr %178, i64 0
  %180 = load i32, ptr %179, align 4
  store i32 %180, ptr %8, align 4
  store i32 40, ptr %b, align 4
  br label %break

181:                                              ; preds = %switch
  %182 = load i32, ptr %8, align 4
  %183 = load i32, ptr @g_arr, align 16
  %184 = icmp sgt i32 %182, %183
  %185 = select i1 %184, i32 41, i32 42
  store i32 %185, ptr %b, align 4
  br label %break

186:                                              ; preds = %switch
  %187 = load i32, ptr @g_arr, align 16
  %188 = load i32, ptr %8, align 4
  %189 = add nsw i32 %188, %187
  store i32 %189, ptr %8, align 4
  store i32 42, ptr %b, align 4
  br label %break

190:                                              ; preds = %switch
  store i32 43, ptr %b, align 4
  br label %break

191:                                              ; preds = %switch
  %192 = load i32, ptr %8, align 4
  ret i32 %192

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b9 = load i32, ptr %b, align 4
  switch i32 %b9, label %default [
    i32 0, label %13
    i32 1, label %15
    i32 2, label %16
    i32 3, label %21
    i32 4, label %24
    i32 5, label %26
    i32 6, label %33
    i32 7, label %40
    i32 8, label %47
    i32 9, label %52
    i32 10, label %60
    i32 11, label %68
    i32 12, label %76
    i32 13, label %77
    i32 14, label %80
    i32 15, label %81
    i32 16, label %82
    i32 17, label %87
    i32 18, label %90
    i32 19, label %92
    i32 20, label %100
    i32 21, label %104
    i32 22, label %112
    i32 23, label %120
    i32 24, label %128
    i32 25, label %129
    i32 26, label %132
    i32 27, label %133
    i32 28, label %136
    i32 29, label %137
    i32 30, label %138
    i32 31, label %143
    i32 32, label %146
    i32 33, label %148
    i32 34, label %156
    i32 35, label %163
    i32 36, label %170
    i32 37, label %173
    i32 38, label %176
    i32 39, label %177
    i32 40, label %181
    i32 41, label %186
    i32 42, label %190
    i32 43, label %191
  ]

break:                                            ; preds = %190, %186, %181, %177, %176, %173, %170, %163, %156, %148, %146, %143, %138, %137, %136, %133, %132, %129, %128, %120, %112, %104, %100, %92, %90, %87, %82, %81, %80, %77, %76, %68, %60, %52, %47, %40, %33, %26, %24, %21, %16, %15, %case12, %case11, %case10, %case
  br label %switch

case:                                             ; preds = %13
  store i32 39, ptr %b, align 4
  br label %break

case10:                                           ; preds = %13
  store i32 1, ptr %b, align 4
  br label %break

case11:                                           ; preds = %13
  store i32 15, ptr %b, align 4
  br label %break

case12:                                           ; preds = %13
  store i32 29, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

17:                                               ; preds = %switch
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %6, align 4
  %20 = icmp sgt i32 %19, 0
  %21 = select i1 %20, i32 2, i32 3
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  store i32 %23, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %8, align 4
  %26 = load i32, ptr %8, align 4
  %27 = zext i32 %26 to i64
  %28 = call ptr @llvm.stacksave()
  store ptr %28, ptr %9, align 8
  %29 = alloca i32, i64 %27, align 16
  store ptr %29, ptr %.reg2mem1, align 8
  store i64 %27, ptr %10, align 8
  store i32 0, ptr %11, align 4
  store i32 5, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %11, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp slt i32 %31, %32
  %34 = select i1 %33, i32 6, i32 8
  store i32 %34, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %7, align 4
  %37 = load i32, ptr %11, align 4
  %38 = srem i32 %37, 8
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = add nsw i32 %36, %41
  %43 = load i32, ptr %11, align 4
  %44 = sext i32 %43 to i64
  %.reload9 = load ptr, ptr %.reg2mem1, align 8
  %45 = getelementptr inbounds i32, ptr %.reload9, i64 %44
  store i32 %42, ptr %45, align 4
  store i32 7, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %11, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %11, align 4
  store i32 5, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  %50 = load i32, ptr %4, align 4
  switch i32 %50, label %case [
    i32 0, label %case11
    i32 1, label %case12
    i32 2, label %case13
  ]

51:                                               ; preds = %switch
  store i32 0, ptr %13, align 4
  store i32 10, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %13, align 4
  %54 = load i32, ptr %8, align 4
  %55 = icmp slt i32 %53, %54
  %56 = select i1 %55, i32 11, i32 16
  store i32 %56, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load i32, ptr %13, align 4
  %59 = sext i32 %58 to i64
  %.reload8 = load ptr, ptr %.reg2mem1, align 8
  %60 = getelementptr inbounds i32, ptr %.reload8, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = icmp sgt i32 %61, 0
  %63 = select i1 %62, i32 12, i32 13
  store i32 %63, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load i32, ptr %13, align 4
  %66 = sext i32 %65 to i64
  %.reload7 = load ptr, ptr %.reg2mem1, align 8
  %67 = getelementptr inbounds i32, ptr %.reload7, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = load i32, ptr %12, align 4
  %70 = add nsw i32 %69, %68
  store i32 %70, ptr %12, align 4
  store i32 14, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %72 = load i32, ptr %13, align 4
  %73 = sext i32 %72 to i64
  %.reload6 = load ptr, ptr %.reg2mem1, align 8
  %74 = getelementptr inbounds i32, ptr %.reload6, i64 %73
  %75 = load i32, ptr %74, align 4
  %76 = load i32, ptr %12, align 4
  %77 = sub nsw i32 %76, %75
  store i32 %77, ptr %12, align 4
  store i32 14, ptr %b, align 4
  br label %break

78:                                               ; preds = %switch
  store i32 15, ptr %b, align 4
  br label %break

79:                                               ; preds = %switch
  %80 = load i32, ptr %13, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %13, align 4
  store i32 10, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  store i32 39, ptr %b, align 4
  br label %break

83:                                               ; preds = %switch
  store i32 0, ptr %14, align 4
  store i32 18, ptr %b, align 4
  br label %break

84:                                               ; preds = %switch
  %85 = load i32, ptr %14, align 4
  %86 = load i32, ptr %8, align 4
  %87 = icmp slt i32 %85, %86
  %88 = select i1 %87, i32 19, i32 28
  store i32 %88, ptr %b, align 4
  br label %break

89:                                               ; preds = %switch
  store i32 0, ptr %15, align 4
  store i32 20, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load i32, ptr %15, align 4
  %92 = load i32, ptr %14, align 4
  %93 = icmp sle i32 %91, %92
  %94 = select i1 %93, i32 21, i32 26
  store i32 %94, ptr %b, align 4
  br label %break

95:                                               ; preds = %switch
  %96 = load ptr, ptr %5, align 8
  %97 = load i32, ptr %15, align 4
  %98 = srem i32 %97, 8
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, ptr %96, i64 %99
  %101 = load i32, ptr %100, align 4
  %102 = load i32, ptr %14, align 4
  %103 = sext i32 %102 to i64
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %104 = getelementptr inbounds i32, ptr %.reload5, i64 %103
  %105 = load i32, ptr %104, align 4
  %106 = icmp sgt i32 %101, %105
  %107 = select i1 %106, i32 22, i32 23
  store i32 %107, ptr %b, align 4
  br label %break

108:                                              ; preds = %switch
  %109 = load ptr, ptr %5, align 8
  %110 = load i32, ptr %15, align 4
  %111 = srem i32 %110, 8
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, ptr %109, i64 %112
  %114 = load i32, ptr %113, align 4
  %115 = load i32, ptr %12, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %12, align 4
  store i32 24, ptr %b, align 4
  br label %break

117:                                              ; preds = %switch
  %118 = load i32, ptr %14, align 4
  %119 = sext i32 %118 to i64
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %120 = getelementptr inbounds i32, ptr %.reload4, i64 %119
  %121 = load i32, ptr %120, align 4
  %122 = load i32, ptr %12, align 4
  %123 = add nsw i32 %122, %121
  store i32 %123, ptr %12, align 4
  store i32 24, ptr %b, align 4
  br label %break

124:                                              ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %break

125:                                              ; preds = %switch
  %126 = load i32, ptr %15, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, ptr %15, align 4
  store i32 20, ptr %b, align 4
  br label %break

128:                                              ; preds = %switch
  store i32 27, ptr %b, align 4
  br label %break

129:                                              ; preds = %switch
  %130 = load i32, ptr %14, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %14, align 4
  store i32 18, ptr %b, align 4
  br label %break

132:                                              ; preds = %switch
  store i32 39, ptr %b, align 4
  br label %break

133:                                              ; preds = %switch
  store i32 0, ptr %16, align 4
  store i32 30, ptr %b, align 4
  br label %break

134:                                              ; preds = %switch
  %135 = load i32, ptr %16, align 4
  %136 = load i32, ptr %8, align 4
  %137 = icmp slt i32 %135, %136
  %138 = select i1 %137, i32 31, i32 37
  store i32 %138, ptr %b, align 4
  br label %break

139:                                              ; preds = %switch
  %140 = load i32, ptr %16, align 4
  %141 = sext i32 %140 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %142 = getelementptr inbounds i32, ptr %.reload3, i64 %141
  %143 = load i32, ptr %142, align 4
  %144 = load ptr, ptr %5, align 8
  %145 = load i32, ptr %16, align 4
  %146 = srem i32 %145, 8
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i32, ptr %144, i64 %147
  store i32 %143, ptr %148, align 4
  store i32 32, ptr %b, align 4
  br label %break

149:                                              ; preds = %switch
  %150 = load ptr, ptr %5, align 8
  %151 = load i32, ptr %16, align 4
  %152 = srem i32 %151, 8
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, ptr %150, i64 %153
  %155 = load i32, ptr %154, align 4
  %156 = load i32, ptr %16, align 4
  %157 = srem i32 %156, 8
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %158
  %160 = load i32, ptr %159, align 4
  %161 = icmp sgt i32 %155, %160
  %162 = select i1 %161, i32 33, i32 34
  store i32 %162, ptr %b, align 4
  br label %break

163:                                              ; preds = %switch
  %164 = load ptr, ptr %5, align 8
  %165 = load i32, ptr %16, align 4
  %166 = srem i32 %165, 8
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i32, ptr %164, i64 %167
  %169 = load i32, ptr %168, align 4
  %170 = load i32, ptr %12, align 4
  %171 = add nsw i32 %170, %169
  store i32 %171, ptr %12, align 4
  store i32 35, ptr %b, align 4
  br label %break

172:                                              ; preds = %switch
  %173 = load i32, ptr %16, align 4
  %174 = srem i32 %173, 8
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %175
  %177 = load i32, ptr %176, align 4
  %178 = load i32, ptr %12, align 4
  %179 = sub nsw i32 %178, %177
  store i32 %179, ptr %12, align 4
  store i32 35, ptr %b, align 4
  br label %break

180:                                              ; preds = %switch
  store i32 36, ptr %b, align 4
  br label %break

181:                                              ; preds = %switch
  %182 = load i32, ptr %16, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, ptr %16, align 4
  store i32 30, ptr %b, align 4
  br label %break

184:                                              ; preds = %switch
  store i32 39, ptr %b, align 4
  br label %break

185:                                              ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %186 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %187 = load i32, ptr %186, align 16
  store i32 %187, ptr %12, align 4
  store i32 39, ptr %b, align 4
  br label %break

188:                                              ; preds = %switch
  %189 = load i32, ptr %12, align 4
  %190 = load ptr, ptr %9, align 8
  call void @llvm.stackrestore(ptr %190)
  ret i32 %189

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b10 = load i32, ptr %b, align 4
  switch i32 %b10, label %default [
    i32 0, label %17
    i32 1, label %18
    i32 2, label %22
    i32 3, label %24
    i32 4, label %25
    i32 5, label %30
    i32 6, label %35
    i32 7, label %46
    i32 8, label %49
    i32 9, label %51
    i32 10, label %52
    i32 11, label %57
    i32 12, label %64
    i32 13, label %71
    i32 14, label %78
    i32 15, label %79
    i32 16, label %82
    i32 17, label %83
    i32 18, label %84
    i32 19, label %89
    i32 20, label %90
    i32 21, label %95
    i32 22, label %108
    i32 23, label %117
    i32 24, label %124
    i32 25, label %125
    i32 26, label %128
    i32 27, label %129
    i32 28, label %132
    i32 29, label %133
    i32 30, label %134
    i32 31, label %139
    i32 32, label %149
    i32 33, label %163
    i32 34, label %172
    i32 35, label %180
    i32 36, label %181
    i32 37, label %184
    i32 38, label %185
    i32 39, label %188
  ]

break:                                            ; preds = %185, %184, %181, %180, %172, %163, %149, %139, %134, %133, %132, %129, %128, %125, %124, %117, %108, %95, %90, %89, %84, %83, %82, %79, %78, %71, %64, %57, %52, %51, %case13, %case12, %case11, %case, %46, %35, %30, %25, %24, %22, %18, %17
  br label %switch

case:                                             ; preds = %49
  store i32 38, ptr %b, align 4
  br label %break

case11:                                           ; preds = %49
  store i32 9, ptr %b, align 4
  br label %break

case12:                                           ; preds = %49
  store i32 17, ptr %b, align 4
  br label %break

case13:                                           ; preds = %49
  store i32 29, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

29:                                               ; preds = %switch
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  store i32 %6, ptr %13, align 4
  store i32 1, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %10, align 4
  %32 = icmp sgt i32 %31, 0
  %33 = select i1 %32, i32 2, i32 3
  store i32 %33, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %10, align 4
  store i32 %35, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %14, align 4
  %38 = load i32, ptr %14, align 4
  %39 = zext i32 %38 to i64
  %40 = call ptr @llvm.stacksave()
  store ptr %40, ptr %15, align 8
  %41 = alloca i32, i64 %39, align 16
  store ptr %41, ptr %.reg2mem19, align 8
  store i64 %39, ptr %16, align 8
  %42 = load i32, ptr %11, align 4
  %43 = load i32, ptr @g_x, align 4
  %44 = add nsw i32 %42, %43
  store i32 %44, ptr %17, align 4
  store i32 0, ptr %18, align 4
  store i32 5, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %18, align 4
  %47 = load i32, ptr %14, align 4
  %48 = icmp slt i32 %46, %47
  %49 = select i1 %48, i32 6, i32 11
  store i32 %49, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %18, align 4
  %52 = srem i32 %51, 2
  %53 = icmp eq i32 %52, 0
  %54 = select i1 %53, i32 7, i32 8
  store i32 %54, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %11, align 4
  %57 = load i32, ptr %18, align 4
  %58 = add nsw i32 %56, %57
  store i32 %58, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %12, align 4
  %61 = load i32, ptr %18, align 4
  %62 = sub nsw i32 %60, %61
  store i32 %62, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %64 = load i32, ptr %18, align 4
  %65 = sext i32 %64 to i64
  %.reload40 = load ptr, ptr %.reg2mem19, align 8
  %66 = getelementptr inbounds i32, ptr %.reload40, i64 %65
  store i32 %.reload2, ptr %66, align 4
  store i32 10, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  %68 = load i32, ptr %18, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %18, align 4
  store i32 5, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %7, align 4
  switch i32 %71, label %case [
    i32 0, label %case42
    i32 1, label %case43
    i32 2, label %case44
    i32 3, label %case45
  ]

72:                                               ; preds = %switch
  store i32 0, ptr %19, align 4
  store i32 13, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %74 = load i32, ptr %19, align 4
  %75 = load i32, ptr %14, align 4
  %76 = icmp slt i32 %74, %75
  %77 = select i1 %76, i32 14, i32 29
  store i32 %77, ptr %b, align 4
  br label %break

78:                                               ; preds = %switch
  %79 = load i32, ptr %19, align 4
  %80 = sext i32 %79 to i64
  %.reload39 = load ptr, ptr %.reg2mem19, align 8
  %81 = getelementptr inbounds i32, ptr %.reload39, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = load i32, ptr %12, align 4
  %84 = icmp sgt i32 %82, %83
  %85 = select i1 %84, i32 15, i32 20
  store i32 %85, ptr %b, align 4
  br label %break

86:                                               ; preds = %switch
  %87 = load ptr, ptr %9, align 8
  %88 = icmp ne ptr %87, null
  %89 = select i1 %88, i32 16, i32 18
  store i32 %89, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load ptr, ptr %9, align 8
  %92 = load i32, ptr %19, align 4
  %93 = srem i32 %92, 8
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, ptr %91, i64 %94
  %96 = load i32, ptr %95, align 4
  %97 = icmp sgt i32 %96, 0
  %98 = select i1 %97, i32 17, i32 18
  store i32 %98, ptr %b, align 4
  br label %break

99:                                               ; preds = %switch
  %100 = load ptr, ptr %9, align 8
  %101 = load i32, ptr %19, align 4
  %102 = srem i32 %101, 8
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, ptr %100, i64 %103
  %105 = load i32, ptr %104, align 4
  %106 = load i32, ptr %17, align 4
  %107 = add nsw i32 %106, %105
  store i32 %107, ptr %17, align 4
  store i32 19, ptr %b, align 4
  br label %break

108:                                              ; preds = %switch
  %109 = load i32, ptr %19, align 4
  %110 = sext i32 %109 to i64
  %.reload38 = load ptr, ptr %.reg2mem19, align 8
  %111 = getelementptr inbounds i32, ptr %.reload38, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = load i32, ptr %17, align 4
  %114 = add nsw i32 %113, %112
  store i32 %114, ptr %17, align 4
  store i32 19, ptr %b, align 4
  br label %break

115:                                              ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %break

116:                                              ; preds = %switch
  %117 = load i32, ptr %19, align 4
  %118 = sext i32 %117 to i64
  %.reload37 = load ptr, ptr %.reg2mem19, align 8
  %119 = getelementptr inbounds i32, ptr %.reload37, i64 %118
  %120 = load i32, ptr %119, align 4
  %121 = load i32, ptr %17, align 4
  %122 = sub nsw i32 %121, %120
  store i32 %122, ptr %17, align 4
  store i32 21, ptr %b, align 4
  br label %break

123:                                              ; preds = %switch
  %124 = load i32, ptr %19, align 4
  %125 = srem i32 %124, 2
  %126 = icmp eq i32 %125, 0
  %127 = select i1 %126, i32 22, i32 23
  store i32 %127, ptr %b, align 4
  br label %break

128:                                              ; preds = %switch
  %129 = load i32, ptr %19, align 4
  %130 = srem i32 %129, 8
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %131
  %133 = load i32, ptr %132, align 4
  %134 = load i32, ptr %17, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, ptr %17, align 4
  store i32 24, ptr %b, align 4
  br label %break

136:                                              ; preds = %switch
  %137 = load i32, ptr %19, align 4
  %138 = srem i32 %137, 8
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %139
  %141 = load i32, ptr %140, align 4
  %142 = load i32, ptr %17, align 4
  %143 = sub nsw i32 %142, %141
  store i32 %143, ptr %17, align 4
  store i32 24, ptr %b, align 4
  br label %break

144:                                              ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %break

145:                                              ; preds = %switch
  %146 = load i32, ptr %17, align 4
  %147 = icmp sgt i32 %146, 100
  %148 = select i1 %147, i32 26, i32 27
  store i32 %148, ptr %b, align 4
  br label %break

149:                                              ; preds = %switch
  store i32 143, ptr %b, align 4
  br label %break

150:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %break

151:                                              ; preds = %switch
  %152 = load i32, ptr %19, align 4
  %153 = add nsw i32 %152, 1
  store i32 %153, ptr %19, align 4
  store i32 13, ptr %b, align 4
  br label %break

154:                                              ; preds = %switch
  store i32 129, ptr %b, align 4
  br label %break

155:                                              ; preds = %switch
  %156 = load i32, ptr %8, align 4
  switch i32 %156, label %case46 [
    i32 0, label %case47
    i32 1, label %case48
    i32 2, label %case49
  ]

157:                                              ; preds = %switch
  store i32 0, ptr %20, align 4
  store i32 32, ptr %b, align 4
  br label %break

158:                                              ; preds = %switch
  %159 = load i32, ptr %20, align 4
  %160 = load i32, ptr %14, align 4
  %161 = icmp slt i32 %159, %160
  %162 = select i1 %161, i32 33, i32 38
  store i32 %162, ptr %b, align 4
  br label %break

163:                                              ; preds = %switch
  %164 = load i32, ptr %20, align 4
  %165 = sext i32 %164 to i64
  %.reload36 = load ptr, ptr %.reg2mem19, align 8
  %166 = getelementptr inbounds i32, ptr %.reload36, i64 %165
  %167 = load i32, ptr %166, align 4
  %168 = icmp sgt i32 %167, 0
  %169 = select i1 %168, i32 34, i32 35
  store i32 %169, ptr %b, align 4
  br label %break

170:                                              ; preds = %switch
  %171 = load i32, ptr %20, align 4
  %172 = sext i32 %171 to i64
  %.reload35 = load ptr, ptr %.reg2mem19, align 8
  %173 = getelementptr inbounds i32, ptr %.reload35, i64 %172
  %174 = load i32, ptr %173, align 4
  %175 = load i32, ptr %17, align 4
  %176 = add nsw i32 %175, %174
  store i32 %176, ptr %17, align 4
  store i32 36, ptr %b, align 4
  br label %break

177:                                              ; preds = %switch
  %178 = load i32, ptr %20, align 4
  %179 = sext i32 %178 to i64
  %.reload34 = load ptr, ptr %.reg2mem19, align 8
  %180 = getelementptr inbounds i32, ptr %.reload34, i64 %179
  %181 = load i32, ptr %180, align 4
  %182 = load i32, ptr %17, align 4
  %183 = sub nsw i32 %182, %181
  store i32 %183, ptr %17, align 4
  store i32 36, ptr %b, align 4
  br label %break

184:                                              ; preds = %switch
  store i32 37, ptr %b, align 4
  br label %break

185:                                              ; preds = %switch
  %186 = load i32, ptr %20, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, ptr %20, align 4
  store i32 32, ptr %b, align 4
  br label %break

188:                                              ; preds = %switch
  store i32 67, ptr %b, align 4
  br label %break

189:                                              ; preds = %switch
  store i32 0, ptr %21, align 4
  store i32 40, ptr %b, align 4
  br label %break

190:                                              ; preds = %switch
  %191 = load i32, ptr %21, align 4
  %192 = load i32, ptr %14, align 4
  %193 = icmp slt i32 %191, %192
  %194 = select i1 %193, i32 41, i32 46
  store i32 %194, ptr %b, align 4
  br label %break

195:                                              ; preds = %switch
  %196 = load i32, ptr %21, align 4
  %197 = sext i32 %196 to i64
  %.reload33 = load ptr, ptr %.reg2mem19, align 8
  %198 = getelementptr inbounds i32, ptr %.reload33, i64 %197
  %199 = load i32, ptr %198, align 4
  %200 = icmp sgt i32 %199, 0
  %201 = select i1 %200, i32 42, i32 43
  store i32 %201, ptr %b, align 4
  br label %break

202:                                              ; preds = %switch
  %203 = load i32, ptr %21, align 4
  %204 = sext i32 %203 to i64
  %.reload32 = load ptr, ptr %.reg2mem19, align 8
  %205 = getelementptr inbounds i32, ptr %.reload32, i64 %204
  %206 = load i32, ptr %205, align 4
  store i32 %206, ptr %.reg2mem3, align 4
  store i32 44, ptr %b, align 4
  br label %break

207:                                              ; preds = %switch
  %208 = load i32, ptr %21, align 4
  %209 = sext i32 %208 to i64
  %.reload31 = load ptr, ptr %.reg2mem19, align 8
  %210 = getelementptr inbounds i32, ptr %.reload31, i64 %209
  %211 = load i32, ptr %210, align 4
  %212 = sub nsw i32 0, %211
  store i32 %212, ptr %.reg2mem3, align 4
  store i32 44, ptr %b, align 4
  br label %break

213:                                              ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %214 = load ptr, ptr %9, align 8
  %215 = load i32, ptr %21, align 4
  %216 = srem i32 %215, 8
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i32, ptr %214, i64 %217
  store i32 %.reload4, ptr %218, align 4
  %219 = load ptr, ptr %9, align 8
  %220 = load i32, ptr %21, align 4
  %221 = srem i32 %220, 8
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds i32, ptr %219, i64 %222
  %224 = load i32, ptr %223, align 4
  %225 = load i32, ptr %17, align 4
  %226 = add nsw i32 %225, %224
  store i32 %226, ptr %17, align 4
  store i32 45, ptr %b, align 4
  br label %break

227:                                              ; preds = %switch
  %228 = load i32, ptr %21, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, ptr %21, align 4
  store i32 40, ptr %b, align 4
  br label %break

230:                                              ; preds = %switch
  store i32 67, ptr %b, align 4
  br label %break

231:                                              ; preds = %switch
  store i32 0, ptr %22, align 4
  store i32 48, ptr %b, align 4
  br label %break

232:                                              ; preds = %switch
  %233 = load i32, ptr %22, align 4
  %234 = load i32, ptr %14, align 4
  %235 = icmp slt i32 %233, %234
  %236 = select i1 %235, i32 49, i32 56
  store i32 %236, ptr %b, align 4
  br label %break

237:                                              ; preds = %switch
  %238 = load ptr, ptr %9, align 8
  %239 = icmp ne ptr %238, null
  %240 = select i1 %239, i32 50, i32 54
  store i32 %240, ptr %b, align 4
  br label %break

241:                                              ; preds = %switch
  %242 = load ptr, ptr %9, align 8
  %243 = load i32, ptr %22, align 4
  %244 = srem i32 %243, 8
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i32, ptr %242, i64 %245
  %247 = load i32, ptr %246, align 4
  %248 = load i32, ptr %22, align 4
  %249 = srem i32 %248, 8
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %250
  %252 = load i32, ptr %251, align 4
  %253 = icmp sgt i32 %247, %252
  %254 = select i1 %253, i32 51, i32 52
  store i32 %254, ptr %b, align 4
  br label %break

255:                                              ; preds = %switch
  %256 = load ptr, ptr %9, align 8
  %257 = load i32, ptr %22, align 4
  %258 = srem i32 %257, 8
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i32, ptr %256, i64 %259
  %261 = load i32, ptr %260, align 4
  %262 = load i32, ptr %17, align 4
  %263 = add nsw i32 %262, %261
  store i32 %263, ptr %17, align 4
  store i32 53, ptr %b, align 4
  br label %break

264:                                              ; preds = %switch
  %265 = load i32, ptr %22, align 4
  %266 = srem i32 %265, 8
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %267
  %269 = load i32, ptr %268, align 4
  %270 = load i32, ptr %17, align 4
  %271 = add nsw i32 %270, %269
  store i32 %271, ptr %17, align 4
  store i32 53, ptr %b, align 4
  br label %break

272:                                              ; preds = %switch
  store i32 55, ptr %b, align 4
  br label %break

273:                                              ; preds = %switch
  %274 = load i32, ptr %22, align 4
  %275 = sext i32 %274 to i64
  %.reload30 = load ptr, ptr %.reg2mem19, align 8
  %276 = getelementptr inbounds i32, ptr %.reload30, i64 %275
  %277 = load i32, ptr %276, align 4
  %278 = load i32, ptr %17, align 4
  %279 = add nsw i32 %278, %277
  store i32 %279, ptr %17, align 4
  store i32 55, ptr %b, align 4
  br label %break

280:                                              ; preds = %switch
  %281 = load i32, ptr %22, align 4
  %282 = add nsw i32 %281, 1
  store i32 %282, ptr %22, align 4
  store i32 48, ptr %b, align 4
  br label %break

283:                                              ; preds = %switch
  store i32 67, ptr %b, align 4
  br label %break

284:                                              ; preds = %switch
  %285 = load i32, ptr %11, align 4
  %286 = load i32, ptr %12, align 4
  %287 = icmp sgt i32 %285, %286
  %288 = select i1 %287, i32 58, i32 62
  store i32 %288, ptr %b, align 4
  br label %break

289:                                              ; preds = %switch
  %290 = load i32, ptr %11, align 4
  %291 = load i32, ptr %13, align 4
  %292 = icmp sgt i32 %290, %291
  %293 = select i1 %292, i32 59, i32 60
  store i32 %293, ptr %b, align 4
  br label %break

294:                                              ; preds = %switch
  %295 = load i32, ptr %11, align 4
  store i32 %295, ptr %.reg2mem5, align 4
  store i32 61, ptr %b, align 4
  br label %break

296:                                              ; preds = %switch
  %297 = load i32, ptr %13, align 4
  store i32 %297, ptr %.reg2mem5, align 4
  store i32 61, ptr %b, align 4
  br label %break

298:                                              ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %.reg2mem9, align 4
  store i32 66, ptr %b, align 4
  br label %break

299:                                              ; preds = %switch
  %300 = load i32, ptr %12, align 4
  %301 = load i32, ptr %13, align 4
  %302 = icmp sgt i32 %300, %301
  %303 = select i1 %302, i32 63, i32 64
  store i32 %303, ptr %b, align 4
  br label %break

304:                                              ; preds = %switch
  %305 = load i32, ptr %12, align 4
  store i32 %305, ptr %.reg2mem7, align 4
  store i32 65, ptr %b, align 4
  br label %break

306:                                              ; preds = %switch
  %307 = load i32, ptr %13, align 4
  store i32 %307, ptr %.reg2mem7, align 4
  store i32 65, ptr %b, align 4
  br label %break

308:                                              ; preds = %switch
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  store i32 %.reload8, ptr %.reg2mem9, align 4
  store i32 66, ptr %b, align 4
  br label %break

309:                                              ; preds = %switch
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  %310 = load i32, ptr %17, align 4
  %311 = add nsw i32 %310, %.reload10
  store i32 %311, ptr %17, align 4
  store i32 143, ptr %b, align 4
  br label %break

312:                                              ; preds = %switch
  %313 = load i32, ptr %17, align 4
  %314 = load i32, ptr @g_z, align 4
  %315 = icmp sgt i32 %313, %314
  %316 = select i1 %315, i32 68, i32 69
  store i32 %316, ptr %b, align 4
  br label %break

317:                                              ; preds = %switch
  store i32 143, ptr %b, align 4
  br label %break

318:                                              ; preds = %switch
  store i32 129, ptr %b, align 4
  br label %break

319:                                              ; preds = %switch
  store i32 0, ptr %23, align 4
  store i32 71, ptr %b, align 4
  br label %break

320:                                              ; preds = %switch
  %321 = load i32, ptr %23, align 4
  %322 = load i32, ptr %14, align 4
  %323 = icmp slt i32 %321, %322
  %324 = select i1 %323, i32 72, i32 90
  store i32 %324, ptr %b, align 4
  br label %break

325:                                              ; preds = %switch
  %326 = load i32, ptr %11, align 4
  %327 = load i32, ptr %23, align 4
  %328 = add nsw i32 %326, %327
  %329 = srem i32 %328, 3
  switch i32 %329, label %case50 [
    i32 0, label %case51
    i32 1, label %case52
  ]

330:                                              ; preds = %switch
  %331 = load i32, ptr %23, align 4
  %332 = srem i32 %331, 8
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %333
  %335 = load i32, ptr %334, align 4
  %336 = load i32, ptr %17, align 4
  %337 = add nsw i32 %336, %335
  store i32 %337, ptr %17, align 4
  store i32 86, ptr %b, align 4
  br label %break

338:                                              ; preds = %switch
  %339 = load ptr, ptr %9, align 8
  %340 = icmp ne ptr %339, null
  %341 = select i1 %340, i32 75, i32 80
  store i32 %341, ptr %b, align 4
  br label %break

342:                                              ; preds = %switch
  %343 = load i32, ptr %23, align 4
  %344 = sext i32 %343 to i64
  %.reload29 = load ptr, ptr %.reg2mem19, align 8
  %345 = getelementptr inbounds i32, ptr %.reload29, i64 %344
  %346 = load i32, ptr %345, align 4
  %347 = load ptr, ptr %9, align 8
  %348 = load i32, ptr %23, align 4
  %349 = srem i32 %348, 8
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds i32, ptr %347, i64 %350
  store i32 %346, ptr %351, align 4
  store i32 76, ptr %b, align 4
  br label %break

352:                                              ; preds = %switch
  %353 = load ptr, ptr %9, align 8
  %354 = load i32, ptr %23, align 4
  %355 = srem i32 %354, 8
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i32, ptr %353, i64 %356
  %358 = load i32, ptr %357, align 4
  %359 = icmp sgt i32 %358, 0
  %360 = select i1 %359, i32 77, i32 78
  store i32 %360, ptr %b, align 4
  br label %break

361:                                              ; preds = %switch
  %362 = load ptr, ptr %9, align 8
  %363 = load i32, ptr %23, align 4
  %364 = srem i32 %363, 8
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds i32, ptr %362, i64 %365
  %367 = load i32, ptr %366, align 4
  %368 = load i32, ptr %17, align 4
  %369 = add nsw i32 %368, %367
  store i32 %369, ptr %17, align 4
  store i32 79, ptr %b, align 4
  br label %break

370:                                              ; preds = %switch
  %371 = load ptr, ptr %9, align 8
  %372 = load i32, ptr %23, align 4
  %373 = srem i32 %372, 8
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i32, ptr %371, i64 %374
  %376 = load i32, ptr %375, align 4
  %377 = load i32, ptr %17, align 4
  %378 = sub nsw i32 %377, %376
  store i32 %378, ptr %17, align 4
  store i32 79, ptr %b, align 4
  br label %break

379:                                              ; preds = %switch
  store i32 81, ptr %b, align 4
  br label %break

380:                                              ; preds = %switch
  %381 = load i32, ptr %23, align 4
  %382 = sext i32 %381 to i64
  %.reload28 = load ptr, ptr %.reg2mem19, align 8
  %383 = getelementptr inbounds i32, ptr %.reload28, i64 %382
  %384 = load i32, ptr %383, align 4
  %385 = load i32, ptr %17, align 4
  %386 = add nsw i32 %385, %384
  store i32 %386, ptr %17, align 4
  store i32 81, ptr %b, align 4
  br label %break

387:                                              ; preds = %switch
  store i32 86, ptr %b, align 4
  br label %break

388:                                              ; preds = %switch
  %389 = load i32, ptr %23, align 4
  %390 = sext i32 %389 to i64
  %.reload27 = load ptr, ptr %.reg2mem19, align 8
  %391 = getelementptr inbounds i32, ptr %.reload27, i64 %390
  %392 = load i32, ptr %391, align 4
  %393 = icmp sgt i32 %392, 0
  %394 = select i1 %393, i32 83, i32 84
  store i32 %394, ptr %b, align 4
  br label %break

395:                                              ; preds = %switch
  %396 = load i32, ptr %23, align 4
  %397 = sext i32 %396 to i64
  %.reload26 = load ptr, ptr %.reg2mem19, align 8
  %398 = getelementptr inbounds i32, ptr %.reload26, i64 %397
  %399 = load i32, ptr %398, align 4
  %400 = mul nsw i32 %399, 2
  store i32 %400, ptr %.reg2mem11, align 4
  store i32 85, ptr %b, align 4
  br label %break

401:                                              ; preds = %switch
  %402 = load i32, ptr %23, align 4
  %403 = sext i32 %402 to i64
  %.reload25 = load ptr, ptr %.reg2mem19, align 8
  %404 = getelementptr inbounds i32, ptr %.reload25, i64 %403
  %405 = load i32, ptr %404, align 4
  %406 = sub nsw i32 %405, 2
  store i32 %406, ptr %.reg2mem11, align 4
  store i32 85, ptr %b, align 4
  br label %break

407:                                              ; preds = %switch
  %.reload12 = load i32, ptr %.reg2mem11, align 4
  %408 = load i32, ptr %17, align 4
  %409 = add nsw i32 %408, %.reload12
  store i32 %409, ptr %17, align 4
  store i32 86, ptr %b, align 4
  br label %break

410:                                              ; preds = %switch
  %411 = load i32, ptr %17, align 4
  %412 = icmp slt i32 %411, -100
  %413 = select i1 %412, i32 87, i32 88
  store i32 %413, ptr %b, align 4
  br label %break

414:                                              ; preds = %switch
  store i32 142, ptr %b, align 4
  br label %break

415:                                              ; preds = %switch
  store i32 89, ptr %b, align 4
  br label %break

416:                                              ; preds = %switch
  %417 = load i32, ptr %23, align 4
  %418 = add nsw i32 %417, 1
  store i32 %418, ptr %23, align 4
  store i32 71, ptr %b, align 4
  br label %break

419:                                              ; preds = %switch
  store i32 129, ptr %b, align 4
  br label %break

420:                                              ; preds = %switch
  %421 = load i32, ptr %11, align 4
  %422 = load i32, ptr %12, align 4
  %423 = icmp sgt i32 %421, %422
  %424 = select i1 %423, i32 92, i32 104
  store i32 %424, ptr %b, align 4
  br label %break

425:                                              ; preds = %switch
  store i32 0, ptr %24, align 4
  store i32 93, ptr %b, align 4
  br label %break

426:                                              ; preds = %switch
  %427 = load i32, ptr %24, align 4
  %428 = load i32, ptr %14, align 4
  %429 = icmp slt i32 %427, %428
  %430 = select i1 %429, i32 94, i32 103
  store i32 %430, ptr %b, align 4
  br label %break

431:                                              ; preds = %switch
  %432 = load i32, ptr %13, align 4
  %433 = load i32, ptr %24, align 4
  %434 = icmp sgt i32 %432, %433
  %435 = select i1 %434, i32 95, i32 100
  store i32 %435, ptr %b, align 4
  br label %break

436:                                              ; preds = %switch
  %437 = load i32, ptr %24, align 4
  %438 = sext i32 %437 to i64
  %.reload24 = load ptr, ptr %.reg2mem19, align 8
  %439 = getelementptr inbounds i32, ptr %.reload24, i64 %438
  %440 = load i32, ptr %439, align 4
  %441 = load i32, ptr %17, align 4
  %442 = add nsw i32 %441, %440
  store i32 %442, ptr %17, align 4
  store i32 96, ptr %b, align 4
  br label %break

443:                                              ; preds = %switch
  %444 = load ptr, ptr %9, align 8
  %445 = icmp ne ptr %444, null
  %446 = select i1 %445, i32 97, i32 99
  store i32 %446, ptr %b, align 4
  br label %break

447:                                              ; preds = %switch
  %448 = load ptr, ptr %9, align 8
  %449 = load i32, ptr %448, align 4
  %450 = icmp sgt i32 %449, 0
  %451 = select i1 %450, i32 98, i32 99
  store i32 %451, ptr %b, align 4
  br label %break

452:                                              ; preds = %switch
  %453 = load ptr, ptr %9, align 8
  %454 = load i32, ptr %453, align 4
  %455 = load i32, ptr %17, align 4
  %456 = add nsw i32 %455, %454
  store i32 %456, ptr %17, align 4
  store i32 99, ptr %b, align 4
  br label %break

457:                                              ; preds = %switch
  store i32 101, ptr %b, align 4
  br label %break

458:                                              ; preds = %switch
  %459 = load i32, ptr %24, align 4
  %460 = sext i32 %459 to i64
  %.reload23 = load ptr, ptr %.reg2mem19, align 8
  %461 = getelementptr inbounds i32, ptr %.reload23, i64 %460
  %462 = load i32, ptr %461, align 4
  %463 = load i32, ptr %17, align 4
  %464 = sub nsw i32 %463, %462
  store i32 %464, ptr %17, align 4
  store i32 101, ptr %b, align 4
  br label %break

465:                                              ; preds = %switch
  store i32 102, ptr %b, align 4
  br label %break

466:                                              ; preds = %switch
  %467 = load i32, ptr %24, align 4
  %468 = add nsw i32 %467, 1
  store i32 %468, ptr %24, align 4
  store i32 93, ptr %b, align 4
  br label %break

469:                                              ; preds = %switch
  store i32 111, ptr %b, align 4
  br label %break

470:                                              ; preds = %switch
  store i32 0, ptr %25, align 4
  store i32 105, ptr %b, align 4
  br label %break

471:                                              ; preds = %switch
  %472 = load i32, ptr %11, align 4
  %473 = icmp sgt i32 %472, 0
  %474 = select i1 %473, i32 106, i32 107
  store i32 %474, ptr %b, align 4
  br label %break

475:                                              ; preds = %switch
  %476 = load i32, ptr %11, align 4
  %477 = load i32, ptr %25, align 4
  %478 = add nsw i32 %476, %477
  store i32 %478, ptr %.reg2mem13, align 4
  store i32 108, ptr %b, align 4
  br label %break

479:                                              ; preds = %switch
  %480 = load i32, ptr %12, align 4
  %481 = load i32, ptr %25, align 4
  %482 = sub nsw i32 %480, %481
  store i32 %482, ptr %.reg2mem13, align 4
  store i32 108, ptr %b, align 4
  br label %break

483:                                              ; preds = %switch
  %.reload14 = load i32, ptr %.reg2mem13, align 4
  %484 = load i32, ptr %17, align 4
  %485 = add nsw i32 %484, %.reload14
  store i32 %485, ptr %17, align 4
  %486 = load i32, ptr %25, align 4
  %487 = add nsw i32 %486, 1
  store i32 %487, ptr %25, align 4
  store i32 109, ptr %b, align 4
  br label %break

488:                                              ; preds = %switch
  %489 = load i32, ptr %25, align 4
  %490 = load i32, ptr %14, align 4
  %491 = icmp slt i32 %489, %490
  %492 = select i1 %491, i32 105, i32 110
  store i32 %492, ptr %b, align 4
  br label %break

493:                                              ; preds = %switch
  store i32 111, ptr %b, align 4
  br label %break

494:                                              ; preds = %switch
  store i32 143, ptr %b, align 4
  br label %break

495:                                              ; preds = %switch
  %496 = load ptr, ptr %9, align 8
  %497 = icmp ne ptr %496, null
  %498 = select i1 %497, i32 113, i32 121
  store i32 %498, ptr %b, align 4
  br label %break

499:                                              ; preds = %switch
  %500 = load i32, ptr %11, align 4
  %501 = load i32, ptr %12, align 4
  %502 = icmp sgt i32 %500, %501
  %503 = select i1 %502, i32 114, i32 115
  store i32 %503, ptr %b, align 4
  br label %break

504:                                              ; preds = %switch
  %505 = load i32, ptr %11, align 4
  store i32 %505, ptr %.reg2mem15, align 4
  store i32 116, ptr %b, align 4
  br label %break

506:                                              ; preds = %switch
  %507 = load i32, ptr %12, align 4
  store i32 %507, ptr %.reg2mem15, align 4
  store i32 116, ptr %b, align 4
  br label %break

508:                                              ; preds = %switch
  %.reload16 = load i32, ptr %.reg2mem15, align 4
  %509 = load ptr, ptr %9, align 8
  store i32 %.reload16, ptr %509, align 4
  store i32 117, ptr %b, align 4
  br label %break

510:                                              ; preds = %switch
  %511 = load ptr, ptr %9, align 8
  %512 = load i32, ptr %511, align 4
  %513 = load i32, ptr @g_z, align 4
  %514 = icmp sgt i32 %512, %513
  %515 = select i1 %514, i32 118, i32 119
  store i32 %515, ptr %b, align 4
  br label %break

516:                                              ; preds = %switch
  %517 = load ptr, ptr %9, align 8
  %518 = load i32, ptr %517, align 4
  %519 = load i32, ptr %17, align 4
  %520 = add nsw i32 %519, %518
  store i32 %520, ptr %17, align 4
  store i32 120, ptr %b, align 4
  br label %break

521:                                              ; preds = %switch
  %522 = load ptr, ptr %9, align 8
  %523 = load i32, ptr %522, align 4
  %524 = load i32, ptr %17, align 4
  %525 = sub nsw i32 %524, %523
  store i32 %525, ptr %17, align 4
  store i32 120, ptr %b, align 4
  br label %break

526:                                              ; preds = %switch
  store i32 121, ptr %b, align 4
  br label %break

527:                                              ; preds = %switch
  store i32 0, ptr %26, align 4
  store i32 122, ptr %b, align 4
  br label %break

528:                                              ; preds = %switch
  %529 = load i32, ptr %26, align 4
  %530 = icmp slt i32 %529, 8
  %531 = select i1 %530, i32 123, i32 128
  store i32 %531, ptr %b, align 4
  br label %break

532:                                              ; preds = %switch
  %533 = load i32, ptr %26, align 4
  %534 = sext i32 %533 to i64
  %535 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %534
  %536 = load i32, ptr %535, align 4
  %537 = icmp sgt i32 %536, 0
  %538 = select i1 %537, i32 124, i32 125
  store i32 %538, ptr %b, align 4
  br label %break

539:                                              ; preds = %switch
  %540 = load i32, ptr %26, align 4
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %541
  %543 = load i32, ptr %542, align 4
  %544 = load i32, ptr %17, align 4
  %545 = add nsw i32 %544, %543
  store i32 %545, ptr %17, align 4
  store i32 126, ptr %b, align 4
  br label %break

546:                                              ; preds = %switch
  %547 = load i32, ptr %26, align 4
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %548
  %550 = load i32, ptr %549, align 4
  %551 = load i32, ptr %17, align 4
  %552 = sub nsw i32 %551, %550
  store i32 %552, ptr %17, align 4
  store i32 126, ptr %b, align 4
  br label %break

553:                                              ; preds = %switch
  store i32 127, ptr %b, align 4
  br label %break

554:                                              ; preds = %switch
  %555 = load i32, ptr %26, align 4
  %556 = add nsw i32 %555, 1
  store i32 %556, ptr %26, align 4
  store i32 122, ptr %b, align 4
  br label %break

557:                                              ; preds = %switch
  store i32 129, ptr %b, align 4
  br label %break

558:                                              ; preds = %switch
  %559 = load i32, ptr %17, align 4
  %560 = srem i32 %559, 2
  %561 = icmp eq i32 %560, 0
  %562 = select i1 %561, i32 130, i32 137
  store i32 %562, ptr %b, align 4
  br label %break

563:                                              ; preds = %switch
  store i32 0, ptr %27, align 4
  store i32 131, ptr %b, align 4
  br label %break

564:                                              ; preds = %switch
  %565 = load i32, ptr %27, align 4
  %566 = load i32, ptr %14, align 4
  %567 = icmp slt i32 %565, %566
  %568 = select i1 %567, i32 132, i32 136
  store i32 %568, ptr %b, align 4
  br label %break

569:                                              ; preds = %switch
  %570 = load i32, ptr %27, align 4
  %571 = sext i32 %570 to i64
  %.reload22 = load ptr, ptr %.reg2mem19, align 8
  %572 = getelementptr inbounds i32, ptr %.reload22, i64 %571
  %573 = load i32, ptr %572, align 4
  %574 = icmp sgt i32 %573, 0
  %575 = select i1 %574, i32 133, i32 134
  store i32 %575, ptr %b, align 4
  br label %break

576:                                              ; preds = %switch
  %577 = load i32, ptr %27, align 4
  %578 = sext i32 %577 to i64
  %.reload21 = load ptr, ptr %.reg2mem19, align 8
  %579 = getelementptr inbounds i32, ptr %.reload21, i64 %578
  %580 = load i32, ptr %579, align 4
  %581 = load i32, ptr %17, align 4
  %582 = add nsw i32 %581, %580
  store i32 %582, ptr %17, align 4
  store i32 134, ptr %b, align 4
  br label %break

583:                                              ; preds = %switch
  store i32 135, ptr %b, align 4
  br label %break

584:                                              ; preds = %switch
  %585 = load i32, ptr %27, align 4
  %586 = add nsw i32 %585, 1
  store i32 %586, ptr %27, align 4
  store i32 131, ptr %b, align 4
  br label %break

587:                                              ; preds = %switch
  store i32 141, ptr %b, align 4
  br label %break

588:                                              ; preds = %switch
  store i32 0, ptr %28, align 4
  store i32 138, ptr %b, align 4
  br label %break

589:                                              ; preds = %switch
  %590 = load i32, ptr %28, align 4
  %591 = load i32, ptr %14, align 4
  %592 = icmp slt i32 %590, %591
  %593 = select i1 %592, i32 139, i32 140
  store i32 %593, ptr %b, align 4
  br label %break

594:                                              ; preds = %switch
  %595 = load i32, ptr %28, align 4
  %596 = sext i32 %595 to i64
  %.reload20 = load ptr, ptr %.reg2mem19, align 8
  %597 = getelementptr inbounds i32, ptr %.reload20, i64 %596
  %598 = load i32, ptr %597, align 4
  %599 = load i32, ptr %17, align 4
  %600 = sub nsw i32 %599, %598
  store i32 %600, ptr %17, align 4
  %601 = load i32, ptr %28, align 4
  %602 = add nsw i32 %601, 1
  store i32 %602, ptr %28, align 4
  store i32 138, ptr %b, align 4
  br label %break

603:                                              ; preds = %switch
  store i32 141, ptr %b, align 4
  br label %break

604:                                              ; preds = %switch
  store i32 149, ptr %b, align 4
  br label %break

605:                                              ; preds = %switch
  %606 = load i32, ptr %17, align 4
  %607 = sub nsw i32 0, %606
  store i32 %607, ptr %17, align 4
  store i32 143, ptr %b, align 4
  br label %break

608:                                              ; preds = %switch
  %609 = load ptr, ptr %9, align 8
  %610 = icmp ne ptr %609, null
  %611 = select i1 %610, i32 144, i32 148
  store i32 %611, ptr %b, align 4
  br label %break

612:                                              ; preds = %switch
  %613 = load ptr, ptr %9, align 8
  %614 = load i32, ptr %613, align 4
  %615 = icmp sgt i32 %614, 0
  %616 = select i1 %615, i32 145, i32 146
  store i32 %616, ptr %b, align 4
  br label %break

617:                                              ; preds = %switch
  %618 = load ptr, ptr %9, align 8
  %619 = load i32, ptr %618, align 4
  %620 = load i32, ptr %17, align 4
  %621 = add nsw i32 %620, %619
  store i32 %621, ptr %17, align 4
  store i32 147, ptr %b, align 4
  br label %break

622:                                              ; preds = %switch
  %623 = load ptr, ptr %9, align 8
  %624 = load i32, ptr %623, align 4
  %625 = load i32, ptr %17, align 4
  %626 = sub nsw i32 %625, %624
  store i32 %626, ptr %17, align 4
  store i32 147, ptr %b, align 4
  br label %break

627:                                              ; preds = %switch
  store i32 148, ptr %b, align 4
  br label %break

628:                                              ; preds = %switch
  store i32 149, ptr %b, align 4
  br label %break

629:                                              ; preds = %switch
  %630 = load i32, ptr %17, align 4
  %631 = icmp sgt i32 %630, 0
  %632 = select i1 %631, i32 150, i32 151
  store i32 %632, ptr %b, align 4
  br label %break

633:                                              ; preds = %switch
  %634 = load i32, ptr %17, align 4
  store i32 %634, ptr %.reg2mem17, align 4
  store i32 152, ptr %b, align 4
  br label %break

635:                                              ; preds = %switch
  %636 = load i32, ptr %17, align 4
  %637 = sub nsw i32 0, %636
  store i32 %637, ptr %.reg2mem17, align 4
  store i32 152, ptr %b, align 4
  br label %break

638:                                              ; preds = %switch
  %.reload18 = load i32, ptr %.reg2mem17, align 4
  %639 = load ptr, ptr %15, align 8
  call void @llvm.stackrestore(ptr %639)
  ret i32 %.reload18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b41 = load i32, ptr %b, align 4
  switch i32 %b41, label %default [
    i32 0, label %29
    i32 1, label %30
    i32 2, label %34
    i32 3, label %36
    i32 4, label %37
    i32 5, label %45
    i32 6, label %50
    i32 7, label %55
    i32 8, label %59
    i32 9, label %63
    i32 10, label %67
    i32 11, label %70
    i32 12, label %72
    i32 13, label %73
    i32 14, label %78
    i32 15, label %86
    i32 16, label %90
    i32 17, label %99
    i32 18, label %108
    i32 19, label %115
    i32 20, label %116
    i32 21, label %123
    i32 22, label %128
    i32 23, label %136
    i32 24, label %144
    i32 25, label %145
    i32 26, label %149
    i32 27, label %150
    i32 28, label %151
    i32 29, label %154
    i32 30, label %155
    i32 31, label %157
    i32 32, label %158
    i32 33, label %163
    i32 34, label %170
    i32 35, label %177
    i32 36, label %184
    i32 37, label %185
    i32 38, label %188
    i32 39, label %189
    i32 40, label %190
    i32 41, label %195
    i32 42, label %202
    i32 43, label %207
    i32 44, label %213
    i32 45, label %227
    i32 46, label %230
    i32 47, label %231
    i32 48, label %232
    i32 49, label %237
    i32 50, label %241
    i32 51, label %255
    i32 52, label %264
    i32 53, label %272
    i32 54, label %273
    i32 55, label %280
    i32 56, label %283
    i32 57, label %284
    i32 58, label %289
    i32 59, label %294
    i32 60, label %296
    i32 61, label %298
    i32 62, label %299
    i32 63, label %304
    i32 64, label %306
    i32 65, label %308
    i32 66, label %309
    i32 67, label %312
    i32 68, label %317
    i32 69, label %318
    i32 70, label %319
    i32 71, label %320
    i32 72, label %325
    i32 73, label %330
    i32 74, label %338
    i32 75, label %342
    i32 76, label %352
    i32 77, label %361
    i32 78, label %370
    i32 79, label %379
    i32 80, label %380
    i32 81, label %387
    i32 82, label %388
    i32 83, label %395
    i32 84, label %401
    i32 85, label %407
    i32 86, label %410
    i32 87, label %414
    i32 88, label %415
    i32 89, label %416
    i32 90, label %419
    i32 91, label %420
    i32 92, label %425
    i32 93, label %426
    i32 94, label %431
    i32 95, label %436
    i32 96, label %443
    i32 97, label %447
    i32 98, label %452
    i32 99, label %457
    i32 100, label %458
    i32 101, label %465
    i32 102, label %466
    i32 103, label %469
    i32 104, label %470
    i32 105, label %471
    i32 106, label %475
    i32 107, label %479
    i32 108, label %483
    i32 109, label %488
    i32 110, label %493
    i32 111, label %494
    i32 112, label %495
    i32 113, label %499
    i32 114, label %504
    i32 115, label %506
    i32 116, label %508
    i32 117, label %510
    i32 118, label %516
    i32 119, label %521
    i32 120, label %526
    i32 121, label %527
    i32 122, label %528
    i32 123, label %532
    i32 124, label %539
    i32 125, label %546
    i32 126, label %553
    i32 127, label %554
    i32 128, label %557
    i32 129, label %558
    i32 130, label %563
    i32 131, label %564
    i32 132, label %569
    i32 133, label %576
    i32 134, label %583
    i32 135, label %584
    i32 136, label %587
    i32 137, label %588
    i32 138, label %589
    i32 139, label %594
    i32 140, label %603
    i32 141, label %604
    i32 142, label %605
    i32 143, label %608
    i32 144, label %612
    i32 145, label %617
    i32 146, label %622
    i32 147, label %627
    i32 148, label %628
    i32 149, label %629
    i32 150, label %633
    i32 151, label %635
    i32 152, label %638
  ]

break:                                            ; preds = %635, %633, %629, %628, %627, %622, %617, %612, %608, %605, %604, %603, %594, %589, %588, %587, %584, %583, %576, %569, %564, %563, %558, %557, %554, %553, %546, %539, %532, %528, %527, %526, %521, %516, %510, %508, %506, %504, %499, %495, %494, %493, %488, %483, %479, %475, %471, %470, %469, %466, %465, %458, %457, %452, %447, %443, %436, %431, %426, %425, %420, %419, %416, %415, %414, %410, %407, %401, %395, %388, %387, %380, %379, %370, %361, %352, %342, %338, %330, %case52, %case51, %case50, %320, %319, %318, %317, %312, %309, %308, %306, %304, %299, %298, %296, %294, %289, %284, %283, %280, %273, %272, %264, %255, %241, %237, %232, %231, %230, %227, %213, %207, %202, %195, %190, %189, %188, %185, %184, %177, %170, %163, %158, %157, %case49, %case48, %case47, %case46, %154, %151, %150, %149, %145, %144, %136, %128, %123, %116, %115, %108, %99, %90, %86, %78, %73, %72, %case45, %case44, %case43, %case42, %case, %67, %63, %59, %55, %50, %45, %37, %36, %34, %30, %29
  br label %switch

case:                                             ; preds = %70
  store i32 112, ptr %b, align 4
  br label %break

case42:                                           ; preds = %70
  store i32 12, ptr %b, align 4
  br label %break

case43:                                           ; preds = %70
  store i32 30, ptr %b, align 4
  br label %break

case44:                                           ; preds = %70
  store i32 70, ptr %b, align 4
  br label %break

case45:                                           ; preds = %70
  store i32 91, ptr %b, align 4
  br label %break

case46:                                           ; preds = %155
  store i32 57, ptr %b, align 4
  br label %break

case47:                                           ; preds = %155
  store i32 31, ptr %b, align 4
  br label %break

case48:                                           ; preds = %155
  store i32 39, ptr %b, align 4
  br label %break

case49:                                           ; preds = %155
  store i32 47, ptr %b, align 4
  br label %break

case50:                                           ; preds = %325
  store i32 82, ptr %b, align 4
  br label %break

case51:                                           ; preds = %325
  store i32 73, ptr %b, align 4
  br label %break

case52:                                           ; preds = %325
  store i32 74, ptr %b, align 4
  br label %break
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

10:                                               ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 1
  %14 = select i1 %13, i32 2, i32 3
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i64 1
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 @atoi(ptr noundef %18) #9
  store i32 %19, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 4, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %22 = load i32, ptr %5, align 4
  %23 = call i32 @_0_if_only(i32 noundef %22)
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %6, align 4
  %26 = load i32, ptr %5, align 4
  %27 = call i32 @_1_if_else(i32 noundef %26)
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %6, align 4
  %30 = load i32, ptr %5, align 4
  %31 = call i32 @_2_if_with_surrounding_code(i32 noundef %30)
  %32 = load i32, ptr %6, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %6, align 4
  %34 = load i32, ptr %5, align 4
  %35 = call i32 @_3_if_compound(i32 noundef %34)
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, ptr %6, align 4
  %38 = load i32, ptr %5, align 4
  %39 = call i32 @_4_if_else_compound(i32 noundef %38)
  %40 = load i32, ptr %6, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %6, align 4
  %42 = load i32, ptr %5, align 4
  %43 = call i32 @_5_if_equal(i32 noundef %42, i32 noundef 4)
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, ptr %6, align 4
  %46 = load i32, ptr %5, align 4
  %47 = call i32 @_6_if_not_equal(i32 noundef %46, i32 noundef 4)
  %48 = load i32, ptr %6, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %6, align 4
  %50 = load i32, ptr %5, align 4
  %51 = call i32 @_7_relational(i32 noundef %50, i32 noundef 4)
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, ptr %6, align 4
  %54 = load i32, ptr %5, align 4
  %55 = icmp sgt i32 %54, 0
  %56 = load i32, ptr %5, align 4
  %57 = call i32 @_8_boolean_argument(i1 noundef zeroext %55, i32 noundef %56)
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %6, align 4
  %60 = load i32, ptr %5, align 4
  %61 = call i32 @_9_if_elseif_else(i32 noundef %60)
  %62 = load i32, ptr %6, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %6, align 4
  %64 = load i32, ptr %5, align 4
  %65 = call i32 @_10_multiple_elseif(i32 noundef %64)
  %66 = load i32, ptr %6, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %6, align 4
  %68 = load i32, ptr %5, align 4
  %69 = call i32 @_11_elseif_expressions(i32 noundef %68, i32 noundef 4)
  %70 = load i32, ptr %6, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, ptr %6, align 4
  %72 = load i32, ptr %5, align 4
  %73 = call i32 @_12_and(i32 noundef %72, i32 noundef 3)
  %74 = load i32, ptr %6, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %6, align 4
  %76 = load i32, ptr %5, align 4
  %77 = call i32 @_13_or(i32 noundef %76, i32 noundef -3)
  %78 = load i32, ptr %6, align 4
  %79 = add nsw i32 %78, %77
  store i32 %79, ptr %6, align 4
  %80 = load i32, ptr %5, align 4
  %81 = call i32 @_14_and_or(i32 noundef %80, i32 noundef 2, i32 noundef -1)
  %82 = load i32, ptr %6, align 4
  %83 = add nsw i32 %82, %81
  store i32 %83, ptr %6, align 4
  %84 = load i32, ptr %5, align 4
  %85 = call i32 @_15_or_and(i32 noundef %84, i32 noundef 0, i32 noundef 20)
  %86 = load i32, ptr %6, align 4
  %87 = add nsw i32 %86, %85
  store i32 %87, ptr %6, align 4
  %88 = load i32, ptr %5, align 4
  %89 = call i32 @_16_complex_boolean(i32 noundef %88, i32 noundef 3, i32 noundef 5, i32 noundef 1)
  %90 = load i32, ptr %6, align 4
  %91 = add nsw i32 %90, %89
  store i32 %91, ptr %6, align 4
  %92 = load i32, ptr %5, align 4
  %93 = call i32 @_17_nested_arithmetic_condition(i32 noundef %92, i32 noundef 1, i32 noundef 20)
  %94 = load i32, ptr %6, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, ptr %6, align 4
  %96 = load i32, ptr %5, align 4
  %97 = call i32 @_18_deep_parentheses(i32 noundef %96, i32 noundef 2, i32 noundef 3)
  %98 = load i32, ptr %6, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, ptr %6, align 4
  %100 = load i32, ptr %5, align 4
  %101 = call i32 @_19_arithmetic_boolean(i32 noundef %100, i32 noundef 2, i32 noundef 5)
  %102 = load i32, ptr %6, align 4
  %103 = add nsw i32 %102, %101
  store i32 %103, ptr %6, align 4
  %104 = load i32, ptr %5, align 4
  %105 = call i32 @_20_nested_boolean_parentheses(i32 noundef %104, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %106 = load i32, ptr %6, align 4
  %107 = add nsw i32 %106, %105
  store i32 %107, ptr %6, align 4
  %108 = load i32, ptr %5, align 4
  %109 = call i32 @_21_nested_if(i32 noundef %108, i32 noundef 3)
  %110 = load i32, ptr %6, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, ptr %6, align 4
  %112 = load i32, ptr %5, align 4
  %113 = call i32 @_22_nested_in_else(i32 noundef %112, i32 noundef 3)
  %114 = load i32, ptr %6, align 4
  %115 = add nsw i32 %114, %113
  store i32 %115, ptr %6, align 4
  %116 = load i32, ptr %5, align 4
  %117 = call i32 @_23_nested_if_else(i32 noundef %116, i32 noundef 3, i32 noundef 5)
  %118 = load i32, ptr %6, align 4
  %119 = add nsw i32 %118, %117
  store i32 %119, ptr %6, align 4
  %120 = load i32, ptr %5, align 4
  %121 = call i32 @_24_three_level_nesting(i32 noundef %120, i32 noundef 3, i32 noundef 5)
  %122 = load i32, ptr %6, align 4
  %123 = add nsw i32 %122, %121
  store i32 %123, ptr %6, align 4
  %124 = load i32, ptr %5, align 4
  %125 = call i32 @_25_deep_nested_values(i32 noundef %124, i32 noundef 3, i32 noundef 10)
  %126 = load i32, ptr %6, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, ptr %6, align 4
  %128 = load i32, ptr %5, align 4
  %129 = call i32 @_26_nested_and(i32 noundef %128, i32 noundef 3, i32 noundef 5)
  %130 = load i32, ptr %6, align 4
  %131 = add nsw i32 %130, %129
  store i32 %131, ptr %6, align 4
  %132 = load i32, ptr %5, align 4
  %133 = call i32 @_27_nested_or(i32 noundef %132, i32 noundef 0, i32 noundef 20)
  %134 = load i32, ptr %6, align 4
  %135 = add nsw i32 %134, %133
  store i32 %135, ptr %6, align 4
  %136 = load i32, ptr %5, align 4
  %137 = call i32 @_28_nested_complex_boolean(i32 noundef %136, i32 noundef 3, i32 noundef 5, i32 noundef 7)
  %138 = load i32, ptr %6, align 4
  %139 = add nsw i32 %138, %137
  store i32 %139, ptr %6, align 4
  %140 = load i32, ptr %5, align 4
  %141 = call i32 @_29_independent_ifs(i32 noundef %140)
  %142 = load i32, ptr %6, align 4
  %143 = add nsw i32 %142, %141
  store i32 %143, ptr %6, align 4
  %144 = load i32, ptr %5, align 4
  %145 = call i32 @_30_independent_if_else(i32 noundef %144, i32 noundef 3)
  %146 = load i32, ptr %6, align 4
  %147 = add nsw i32 %146, %145
  store i32 %147, ptr %6, align 4
  %148 = call i32 @_31_array_condition(i32 noundef 1)
  %149 = load i32, ptr %6, align 4
  %150 = add nsw i32 %149, %148
  store i32 %150, ptr %6, align 4
  %151 = call i32 @_32_array_branches(i32 noundef 2)
  %152 = load i32, ptr %6, align 4
  %153 = add nsw i32 %152, %151
  store i32 %153, ptr %6, align 4
  %154 = call i32 @_33_array_complex_condition(i32 noundef 1, i32 noundef 2)
  %155 = load i32, ptr %6, align 4
  %156 = add nsw i32 %155, %154
  store i32 %156, ptr %6, align 4
  %157 = call i32 @_34_matrix_condition(i32 noundef 1, i32 noundef 1)
  %158 = load i32, ptr %6, align 4
  %159 = add nsw i32 %158, %157
  store i32 %159, ptr %6, align 4
  %160 = call i32 @_35_nested_array(i32 noundef 1, i32 noundef 2)
  %161 = load i32, ptr %6, align 4
  %162 = add nsw i32 %161, %160
  store i32 %162, ptr %6, align 4
  %163 = load i32, ptr %5, align 4
  store i32 %163, ptr %7, align 4
  %164 = call i32 @_36_pointer_condition(ptr noundef %7)
  %165 = load i32, ptr %6, align 4
  %166 = add nsw i32 %165, %164
  store i32 %166, ptr %6, align 4
  %167 = call i32 @_37_pointer_branches(ptr noundef %7)
  %168 = load i32, ptr %6, align 4
  %169 = add nsw i32 %168, %167
  store i32 %169, ptr %6, align 4
  %170 = call i32 @_38_pointer_array(ptr noundef @g_arr, i32 noundef 1)
  %171 = load i32, ptr %6, align 4
  %172 = add nsw i32 %171, %170
  store i32 %172, ptr %6, align 4
  %173 = call i32 @_39_nested_pointer(ptr noundef %7, i32 noundef 3)
  %174 = load i32, ptr %6, align 4
  %175 = add nsw i32 %174, %173
  store i32 %175, ptr %6, align 4
  %176 = load i32, ptr %5, align 4
  store i32 %176, ptr %7, align 4
  %177 = load i32, ptr %5, align 4
  %178 = call i32 @_40_pointer_write(ptr noundef %7, i32 noundef %177)
  %179 = load i32, ptr %6, align 4
  %180 = add nsw i32 %179, %178
  store i32 %180, ptr %6, align 4
  %181 = load i32, ptr %5, align 4
  store i32 %181, ptr %7, align 4
  %182 = load i32, ptr %5, align 4
  %183 = call i32 @_41_pointer_write_nested(ptr noundef %7, i32 noundef %182, i32 noundef 3)
  %184 = load i32, ptr %6, align 4
  %185 = add nsw i32 %184, %183
  store i32 %185, ptr %6, align 4
  %186 = load i32, ptr %5, align 4
  store i32 %186, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  store i32 5, ptr %b, align 4
  br label %break

187:                                              ; preds = %switch
  %188 = load i32, ptr %5, align 4
  %189 = icmp sgt i32 %188, 0
  %190 = select i1 %189, i32 6, i32 8
  store i32 %190, ptr %b, align 4
  br label %break

191:                                              ; preds = %switch
  %192 = load i32, ptr %5, align 4
  %193 = icmp slt i32 %192, 8
  %194 = select i1 %193, i32 7, i32 8
  store i32 %194, ptr %b, align 4
  br label %break

195:                                              ; preds = %switch
  %196 = load i32, ptr %5, align 4
  store i32 %196, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

197:                                              ; preds = %switch
  store i32 4, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

198:                                              ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr @g_n, align 4
  %199 = call i32 @_42_global_only()
  %200 = load i32, ptr %6, align 4
  %201 = add nsw i32 %200, %199
  store i32 %201, ptr %6, align 4
  %202 = call i32 @_43_global_and()
  %203 = load i32, ptr %6, align 4
  %204 = add nsw i32 %203, %202
  store i32 %204, ptr %6, align 4
  %205 = call i32 @_44_global_or()
  %206 = load i32, ptr %6, align 4
  %207 = add nsw i32 %206, %205
  store i32 %207, ptr %6, align 4
  %208 = call i32 @_45_global_nested()
  %209 = load i32, ptr %6, align 4
  %210 = add nsw i32 %209, %208
  store i32 %210, ptr %6, align 4
  %211 = call i32 @_46_global_array_only()
  %212 = load i32, ptr %6, align 4
  %213 = add nsw i32 %212, %211
  store i32 %213, ptr %6, align 4
  %214 = call i32 @_47_global_matrix_only()
  %215 = load i32, ptr %6, align 4
  %216 = add nsw i32 %215, %214
  store i32 %216, ptr %6, align 4
  %217 = load i32, ptr %5, align 4
  %218 = call i32 @_48_multiple_returns(i32 noundef %217)
  %219 = load i32, ptr %6, align 4
  %220 = add nsw i32 %219, %218
  store i32 %220, ptr %6, align 4
  %221 = load i32, ptr %5, align 4
  %222 = call i32 @_49_nested_multiple_returns(i32 noundef %221, i32 noundef 3)
  %223 = load i32, ptr %6, align 4
  %224 = add nsw i32 %223, %222
  store i32 %224, ptr %6, align 4
  %225 = load i32, ptr %5, align 4
  %226 = call i32 @_50_complex_multiple_returns(i32 noundef %225, i32 noundef 3, i32 noundef 5)
  %227 = load i32, ptr %6, align 4
  %228 = add nsw i32 %227, %226
  store i32 %228, ptr %6, align 4
  %229 = load i32, ptr %5, align 4
  %230 = call i32 @_51_prefix_code(i32 noundef %229, i32 noundef 2, i32 noundef 3)
  %231 = load i32, ptr %6, align 4
  %232 = add nsw i32 %231, %230
  store i32 %232, ptr %6, align 4
  %233 = load i32, ptr %5, align 4
  %234 = call i32 @_52_suffix_code(i32 noundef %233, i32 noundef 3)
  %235 = load i32, ptr %6, align 4
  %236 = add nsw i32 %235, %234
  store i32 %236, ptr %6, align 4
  %237 = load i32, ptr %5, align 4
  %238 = call i32 @_53_prefix_nested_suffix(i32 noundef %237, i32 noundef 3, i32 noundef 5)
  %239 = load i32, ptr %6, align 4
  %240 = add nsw i32 %239, %238
  store i32 %240, ptr %6, align 4
  %241 = load i32, ptr %5, align 4
  %242 = call i32 @_54_diamond(i32 noundef %241, i32 noundef 3)
  %243 = load i32, ptr %6, align 4
  %244 = add nsw i32 %243, %242
  store i32 %244, ptr %6, align 4
  %245 = load i32, ptr %5, align 4
  %246 = call i32 @_55_multiple_merge_values(i32 noundef %245, i32 noundef 3)
  %247 = load i32, ptr %6, align 4
  %248 = add nsw i32 %247, %246
  store i32 %248, ptr %6, align 4
  %249 = load i32, ptr %5, align 4
  %250 = call i32 @_56_nested_diamonds(i32 noundef %249, i32 noundef 3, i32 noundef 5)
  %251 = load i32, ptr %6, align 4
  %252 = add nsw i32 %251, %250
  store i32 %252, ptr %6, align 4
  %253 = load i32, ptr %5, align 4
  %254 = call i32 @_57_ternary_before_if(i32 noundef %253, i32 noundef 3)
  %255 = load i32, ptr %6, align 4
  %256 = add nsw i32 %255, %254
  store i32 %256, ptr %6, align 4
  %257 = load i32, ptr %5, align 4
  %258 = call i32 @_58_ternary_inside_if(i32 noundef %257, i32 noundef 3)
  %259 = load i32, ptr %6, align 4
  %260 = add nsw i32 %259, %258
  store i32 %260, ptr %6, align 4
  %261 = load i32, ptr %5, align 4
  %262 = call i32 @_59_nested_ternary_if(i32 noundef %261, i32 noundef 3, i32 noundef 5)
  %263 = load i32, ptr %6, align 4
  %264 = add nsw i32 %263, %262
  store i32 %264, ptr %6, align 4
  %265 = load i32, ptr %5, align 4
  %266 = call i32 @_60_dynamic_alloca(i32 noundef 4, i32 noundef %265)
  %267 = load i32, ptr %6, align 4
  %268 = add nsw i32 %267, %266
  store i32 %268, ptr %6, align 4
  %269 = load i32, ptr %5, align 4
  %270 = call i32 @_61_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %269)
  %271 = load i32, ptr %6, align 4
  %272 = add nsw i32 %271, %270
  store i32 %272, ptr %6, align 4
  %273 = load i32, ptr %5, align 4
  %274 = call i32 @_62_dynamic_alloca_complex(i32 noundef 6, i32 noundef %273, i32 noundef 3)
  %275 = load i32, ptr %6, align 4
  %276 = add nsw i32 %275, %274
  store i32 %276, ptr %6, align 4
  %277 = load i32, ptr %5, align 4
  %278 = call i32 @_63_malloc_if(i32 noundef 4, i32 noundef %277)
  %279 = load i32, ptr %6, align 4
  %280 = add nsw i32 %279, %278
  store i32 %280, ptr %6, align 4
  %281 = load i32, ptr %5, align 4
  %282 = call i32 @_64_malloc_nested_if(i32 noundef 4, i32 noundef %281, i32 noundef 3)
  %283 = load i32, ptr %6, align 4
  %284 = add nsw i32 %283, %282
  store i32 %284, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %285 = load i32, ptr %5, align 4
  call void @_65_void_if(i32 noundef %285)
  %286 = load i32, ptr %5, align 4
  call void @_66_void_if_else(i32 noundef %286)
  %287 = load i32, ptr %5, align 4
  call void @_67_void_nested(i32 noundef %287, i32 noundef 3)
  %288 = load i32, ptr %5, align 4
  call void @_68_void_complex(i32 noundef %288, i32 noundef 3, i32 noundef 0)
  call void @_69_void_global_only()
  %289 = load i32, ptr %5, align 4
  store i32 %289, ptr %7, align 4
  %290 = load i32, ptr %5, align 4
  call void @_70_void_pointer(ptr noundef %7, i32 noundef %290)
  %291 = load i32, ptr %5, align 4
  call void @_71_void_array(i32 noundef 1, i32 noundef %291)
  %292 = load i32, ptr @g_void_result, align 4
  %293 = load i32, ptr %6, align 4
  %294 = add nsw i32 %293, %292
  store i32 %294, ptr %6, align 4
  %295 = load i32, ptr %5, align 4
  store i32 %295, ptr %7, align 4
  %296 = load i32, ptr %5, align 4
  %297 = call i32 @_72_complex_control_flow(ptr noundef %7, i32 noundef 1, i32 noundef %296, i32 noundef 3)
  %298 = load i32, ptr %6, align 4
  %299 = add nsw i32 %298, %297
  store i32 %299, ptr %6, align 4
  %300 = load i32, ptr %5, align 4
  %301 = call i32 @_73_complex_merge(i32 noundef %300, i32 noundef 3, i32 noundef 5)
  %302 = load i32, ptr %6, align 4
  %303 = add nsw i32 %302, %301
  store i32 %303, ptr %6, align 4
  %304 = load i32, ptr %5, align 4
  %305 = call i32 @_74_if_stress(ptr noundef %7, i32 noundef 1, i32 noundef %304, i32 noundef 3, i32 noundef 5)
  %306 = load i32, ptr %6, align 4
  %307 = add nsw i32 %306, %305
  store i32 %307, ptr %6, align 4
  %308 = load i32, ptr %5, align 4
  %309 = call i32 @_75_for_simple(i32 noundef 4, i32 noundef %308)
  %310 = load i32, ptr %6, align 4
  %311 = add nsw i32 %310, %309
  store i32 %311, ptr %6, align 4
  %312 = load i32, ptr %5, align 4
  %313 = call i32 @_76_while_simple(i32 noundef 4, i32 noundef %312)
  %314 = load i32, ptr %6, align 4
  %315 = add nsw i32 %314, %313
  store i32 %315, ptr %6, align 4
  %316 = load i32, ptr %5, align 4
  %317 = call i32 @_77_do_while(i32 noundef 4, i32 noundef %316)
  %318 = load i32, ptr %6, align 4
  %319 = add nsw i32 %318, %317
  store i32 %319, ptr %6, align 4
  %320 = call i32 @_78_nested_loops(i32 noundef 3, i32 noundef 4)
  %321 = load i32, ptr %6, align 4
  %322 = add nsw i32 %321, %320
  store i32 %322, ptr %6, align 4
  %323 = call i32 @_79_nested_loop_if(i32 noundef 3, i32 noundef 4)
  %324 = load i32, ptr %6, align 4
  %325 = add nsw i32 %324, %323
  store i32 %325, ptr %6, align 4
  %326 = call i32 @_80_break(i32 noundef 6)
  %327 = load i32, ptr %6, align 4
  %328 = add nsw i32 %327, %326
  store i32 %328, ptr %6, align 4
  %329 = call i32 @_81_continue(i32 noundef 6)
  %330 = load i32, ptr %6, align 4
  %331 = add nsw i32 %330, %329
  store i32 %331, ptr %6, align 4
  %332 = load i32, ptr %5, align 4
  %333 = call i32 @_82_loop_complex_condition(i32 noundef 6, i32 noundef %332)
  %334 = load i32, ptr %6, align 4
  %335 = add nsw i32 %334, %333
  store i32 %335, ptr %6, align 4
  %336 = call i32 @_83_loop_global_array()
  %337 = load i32, ptr %6, align 4
  %338 = add nsw i32 %337, %336
  store i32 %338, ptr %6, align 4
  %339 = load i32, ptr %5, align 4
  %340 = call i32 @_84_loop_pointer(i32 noundef 5, i32 noundef %339)
  %341 = load i32, ptr %6, align 4
  %342 = add nsw i32 %341, %340
  store i32 %342, ptr %6, align 4
  %343 = load i32, ptr %5, align 4
  %344 = call i32 @_85_loop_surrounding_code(i32 noundef 4, i32 noundef %343)
  %345 = load i32, ptr %6, align 4
  %346 = add nsw i32 %345, %344
  store i32 %346, ptr %6, align 4
  %347 = call i32 @_86_triple_nested(i32 noundef 2, i32 noundef 3, i32 noundef 2)
  %348 = load i32, ptr %6, align 4
  %349 = add nsw i32 %348, %347
  store i32 %349, ptr %6, align 4
  %350 = load i32, ptr %5, align 4
  %351 = call i32 @_87_if_OR3(i32 noundef %350, i32 noundef 3, i32 noundef -5)
  %352 = load i32, ptr %6, align 4
  %353 = add nsw i32 %352, %351
  store i32 %353, ptr %6, align 4
  %354 = load i32, ptr %5, align 4
  %355 = call i32 @_88_if_OR3_vla(i32 noundef %354, i32 noundef 3, i32 noundef -5)
  %356 = load i32, ptr %6, align 4
  %357 = add nsw i32 %356, %355
  store i32 %357, ptr %6, align 4
  %358 = load i32, ptr %5, align 4
  %359 = call i32 @_89_loop_vla(i32 noundef 4, i32 noundef %358)
  %360 = load i32, ptr %6, align 4
  %361 = add nsw i32 %360, %359
  store i32 %361, ptr %6, align 4
  %362 = load i32, ptr %5, align 4
  %363 = call i32 @_90_vla_nested_loop(i32 noundef 4, i32 noundef %362)
  %364 = load i32, ptr %6, align 4
  %365 = add nsw i32 %364, %363
  store i32 %365, ptr %6, align 4
  %366 = load i32, ptr %5, align 4
  %367 = call i32 @_91_alloca_inside_loop(i32 noundef 4, i32 noundef %366)
  %368 = load i32, ptr %6, align 4
  %369 = add nsw i32 %368, %367
  store i32 %369, ptr %6, align 4
  %370 = load i32, ptr %5, align 4
  %371 = call i32 @_92_vla_size_from_loop(i32 noundef 5, i32 noundef %370)
  %372 = load i32, ptr %6, align 4
  %373 = add nsw i32 %372, %371
  store i32 %373, ptr %6, align 4
  %374 = call i32 @_93_global_loop()
  %375 = load i32, ptr %6, align 4
  %376 = add nsw i32 %375, %374
  store i32 %376, ptr %6, align 4
  store i32 0, ptr @g_void_result, align 4
  %377 = load i32, ptr %5, align 4
  call void @_94_void_loop(i32 noundef 4, i32 noundef %377)
  %378 = load i32, ptr %5, align 4
  store i32 %378, ptr %7, align 4
  %379 = load i32, ptr %5, align 4
  call void @_95_void_loop_pointer(ptr noundef %7, i32 noundef 4, i32 noundef %379)
  %380 = load i32, ptr @g_void_result, align 4
  %381 = load i32, ptr %6, align 4
  %382 = add nsw i32 %381, %380
  store i32 %382, ptr %6, align 4
  %383 = load i32, ptr %5, align 4
  %384 = call i32 @_96_goto_break(i32 noundef 6, i32 noundef %383)
  %385 = load i32, ptr %6, align 4
  %386 = add nsw i32 %385, %384
  store i32 %386, ptr %6, align 4
  %387 = load i32, ptr %5, align 4
  %388 = call i32 @_97_goto_nested_loop(i32 noundef 5, i32 noundef %387)
  %389 = load i32, ptr %6, align 4
  %390 = add nsw i32 %389, %388
  store i32 %390, ptr %6, align 4
  %391 = load i32, ptr %5, align 4
  %392 = call i32 @_98_goto_vla(i32 noundef 4, i32 noundef %391)
  %393 = load i32, ptr %6, align 4
  %394 = add nsw i32 %393, %392
  store i32 %394, ptr %6, align 4
  %395 = load i32, ptr %5, align 4
  %396 = call i32 @_99_malloc_loop(i32 noundef 4, i32 noundef %395)
  %397 = load i32, ptr %6, align 4
  %398 = add nsw i32 %397, %396
  store i32 %398, ptr %6, align 4
  %399 = load i32, ptr %5, align 4
  store i32 %399, ptr %7, align 4
  %400 = load i32, ptr %5, align 4
  %401 = call i32 @_100_stress(ptr noundef %7, i32 noundef 4, i32 noundef %400, i32 noundef 3)
  %402 = load i32, ptr %6, align 4
  %403 = add nsw i32 %402, %401
  store i32 %403, ptr %6, align 4
  %404 = load i32, ptr %5, align 4
  store i32 %404, ptr %7, align 4
  %405 = load i32, ptr %5, align 4
  %406 = call i32 @_101_stress_goto(ptr noundef %7, i32 noundef 4, i32 noundef %405, i32 noundef 3, i32 noundef 5)
  %407 = load i32, ptr %6, align 4
  %408 = add nsw i32 %407, %406
  store i32 %408, ptr %6, align 4
  %409 = load i32, ptr %5, align 4
  %410 = call i32 @_102_oneblock(i32 noundef %409)
  %411 = load i32, ptr %6, align 4
  %412 = add nsw i32 %411, %410
  store i32 %412, ptr %6, align 4
  %413 = load i32, ptr %5, align 4
  %414 = srem i32 %413, 4
  %415 = load i32, ptr %5, align 4
  %416 = call i32 @_103_switch_if(i32 noundef %414, i32 noundef %415)
  %417 = load i32, ptr %6, align 4
  %418 = add nsw i32 %417, %416
  store i32 %418, ptr %6, align 4
  %419 = load i32, ptr %5, align 4
  %420 = srem i32 %419, 4
  %421 = load i32, ptr %5, align 4
  %422 = call i32 @_104_switch_nested_if(i32 noundef %420, i32 noundef %421, i32 noundef 3)
  %423 = load i32, ptr %6, align 4
  %424 = add nsw i32 %423, %422
  store i32 %424, ptr %6, align 4
  %425 = load i32, ptr %5, align 4
  %426 = srem i32 %425, 4
  %427 = load i32, ptr %5, align 4
  %428 = call i32 @_105_switch_ternary(i32 noundef %426, i32 noundef %427, i32 noundef 3)
  %429 = load i32, ptr %6, align 4
  %430 = add nsw i32 %429, %428
  store i32 %430, ptr %6, align 4
  %431 = load i32, ptr %5, align 4
  %432 = srem i32 %431, 4
  %433 = load i32, ptr %5, align 4
  %434 = call i32 @_106_switch_nested_ternary(i32 noundef %432, i32 noundef %433, i32 noundef 3, i32 noundef 5)
  %435 = load i32, ptr %6, align 4
  %436 = add nsw i32 %435, %434
  store i32 %436, ptr %6, align 4
  %437 = load i32, ptr %5, align 4
  %438 = srem i32 %437, 4
  %439 = load i32, ptr %5, align 4
  %440 = call i32 @_107_switch_for(i32 noundef %438, i32 noundef 4, i32 noundef %439)
  %441 = load i32, ptr %6, align 4
  %442 = add nsw i32 %441, %440
  store i32 %442, ptr %6, align 4
  %443 = load i32, ptr %5, align 4
  %444 = srem i32 %443, 4
  %445 = load i32, ptr %5, align 4
  %446 = call i32 @_108_switch_while(i32 noundef %444, i32 noundef 4, i32 noundef %445)
  %447 = load i32, ptr %6, align 4
  %448 = add nsw i32 %447, %446
  store i32 %448, ptr %6, align 4
  %449 = load i32, ptr %5, align 4
  %450 = srem i32 %449, 4
  %451 = call i32 @_109_switch_nested_for(i32 noundef %450, i32 noundef 3, i32 noundef 4)
  %452 = load i32, ptr %6, align 4
  %453 = add nsw i32 %452, %451
  store i32 %453, ptr %6, align 4
  %454 = load i32, ptr %5, align 4
  %455 = srem i32 %454, 3
  %456 = load i32, ptr %5, align 4
  %457 = call i32 @_110_switch_do_while(i32 noundef %455, i32 noundef 4, i32 noundef %456)
  %458 = load i32, ptr %6, align 4
  %459 = add nsw i32 %458, %457
  store i32 %459, ptr %6, align 4
  %460 = load i32, ptr %5, align 4
  %461 = srem i32 %460, 5
  %462 = call i32 @_111_switch_array(i32 noundef %461, i32 noundef 1)
  %463 = load i32, ptr %6, align 4
  %464 = add nsw i32 %463, %462
  store i32 %464, ptr %6, align 4
  %465 = load i32, ptr %5, align 4
  %466 = srem i32 %465, 4
  %467 = call i32 @_112_switch_matrix_if(i32 noundef %466, i32 noundef 1, i32 noundef 1)
  %468 = load i32, ptr %6, align 4
  %469 = add nsw i32 %468, %467
  store i32 %469, ptr %6, align 4
  %470 = load i32, ptr %5, align 4
  store i32 %470, ptr %7, align 4
  %471 = load i32, ptr %5, align 4
  %472 = srem i32 %471, 5
  %473 = load i32, ptr %5, align 4
  %474 = call i32 @_113_switch_pointer(i32 noundef %472, ptr noundef %7, i32 noundef %473)
  %475 = load i32, ptr %6, align 4
  %476 = add nsw i32 %475, %474
  store i32 %476, ptr %6, align 4
  %477 = load i32, ptr %5, align 4
  store i32 %477, ptr %7, align 4
  %478 = load i32, ptr %5, align 4
  %479 = srem i32 %478, 4
  %480 = call i32 @_114_switch_pointer_array(i32 noundef %479, ptr noundef %7, i32 noundef 1)
  %481 = load i32, ptr %6, align 4
  %482 = add nsw i32 %481, %480
  store i32 %482, ptr %6, align 4
  %483 = load i32, ptr %5, align 4
  %484 = srem i32 %483, 4
  %485 = call i32 @_115_switch_array_loop(i32 noundef %484, i32 noundef 8)
  %486 = load i32, ptr %6, align 4
  %487 = add nsw i32 %486, %485
  store i32 %487, ptr %6, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %8, i8 0, i64 32, i1 false)
  %488 = load i32, ptr %5, align 4
  %489 = srem i32 %488, 4
  %490 = getelementptr inbounds [8 x i32], ptr %8, i64 0, i64 0
  %491 = load i32, ptr %5, align 4
  %492 = call i32 @_116_switch_pointer_loop(i32 noundef %489, ptr noundef %490, i32 noundef 4, i32 noundef %491)
  %493 = load i32, ptr %6, align 4
  %494 = add nsw i32 %493, %492
  store i32 %494, ptr %6, align 4
  %495 = load i32, ptr %5, align 4
  %496 = srem i32 %495, 4
  %497 = load i32, ptr %5, align 4
  %498 = call i32 @_117_switch_ternary_loop(i32 noundef %496, i32 noundef 4, i32 noundef %497, i32 noundef 3)
  %499 = load i32, ptr %6, align 4
  %500 = add nsw i32 %499, %498
  store i32 %500, ptr %6, align 4
  %501 = load i32, ptr %5, align 4
  %502 = srem i32 %501, 3
  %503 = load i32, ptr %5, align 4
  %504 = add nsw i32 %503, 1
  %505 = srem i32 %504, 3
  %506 = load i32, ptr %5, align 4
  %507 = call i32 @_118_nested_switch_if(i32 noundef %502, i32 noundef %505, i32 noundef %506)
  %508 = load i32, ptr %6, align 4
  %509 = add nsw i32 %508, %507
  store i32 %509, ptr %6, align 4
  %510 = load i32, ptr %5, align 4
  %511 = srem i32 %510, 3
  %512 = load i32, ptr %5, align 4
  %513 = add nsw i32 %512, 1
  %514 = srem i32 %513, 3
  %515 = call i32 @_119_nested_switch_loop(i32 noundef %511, i32 noundef %514, i32 noundef 4)
  %516 = load i32, ptr %6, align 4
  %517 = add nsw i32 %516, %515
  store i32 %517, ptr %6, align 4
  %518 = load i32, ptr %5, align 4
  %519 = srem i32 %518, 3
  %520 = load i32, ptr %5, align 4
  %521 = call i32 @_120_switch_nested_for_if_ternary(i32 noundef %519, i32 noundef 3, i32 noundef %520, i32 noundef 3)
  %522 = load i32, ptr %6, align 4
  %523 = add nsw i32 %522, %521
  store i32 %523, ptr %6, align 4
  %524 = load i32, ptr %5, align 4
  %525 = srem i32 %524, 4
  %526 = load i32, ptr %5, align 4
  %527 = call i32 @_121_switch_vla_loop(i32 noundef %525, i32 noundef 4, i32 noundef %526)
  %528 = load i32, ptr %6, align 4
  %529 = add nsw i32 %528, %527
  store i32 %529, ptr %6, align 4
  %530 = load i32, ptr %5, align 4
  %531 = srem i32 %530, 4
  %532 = load i32, ptr %5, align 4
  %533 = call i32 @_122_switch_vla_pointer_ternary(i32 noundef %531, i32 noundef 4, i32 noundef %532)
  %534 = load i32, ptr %6, align 4
  %535 = add nsw i32 %534, %533
  store i32 %535, ptr %6, align 4
  %536 = load i32, ptr %5, align 4
  %537 = srem i32 %536, 4
  %538 = load i32, ptr %5, align 4
  %539 = call i32 @_123_switch_goto(i32 noundef %537, i32 noundef %538)
  %540 = load i32, ptr %6, align 4
  %541 = add nsw i32 %540, %539
  store i32 %541, ptr %6, align 4
  %542 = load i32, ptr %5, align 4
  %543 = srem i32 %542, 4
  %544 = load i32, ptr %5, align 4
  %545 = call i32 @_124_switch_goto_loop(i32 noundef %543, i32 noundef 5, i32 noundef %544)
  %546 = load i32, ptr %6, align 4
  %547 = add nsw i32 %546, %545
  store i32 %547, ptr %6, align 4
  %548 = load i32, ptr %5, align 4
  store i32 %548, ptr %7, align 4
  %549 = load i32, ptr %5, align 4
  %550 = srem i32 %549, 4
  %551 = load i32, ptr %5, align 4
  %552 = call i32 @_125_switch_goto_pointer_array(i32 noundef %550, ptr noundef %7, i32 noundef 1, i32 noundef %551)
  %553 = load i32, ptr %6, align 4
  %554 = add nsw i32 %553, %552
  store i32 %554, ptr %6, align 4
  %555 = load i32, ptr %5, align 4
  %556 = srem i32 %555, 5
  %557 = load i32, ptr %5, align 4
  %558 = call i32 @_126_switch_fallthrough_loop_if(i32 noundef %556, i32 noundef 4, i32 noundef %557)
  %559 = load i32, ptr %6, align 4
  %560 = add nsw i32 %559, %558
  store i32 %560, ptr %6, align 4
  %561 = load i32, ptr %5, align 4
  store i32 %561, ptr %7, align 4
  %562 = load i32, ptr %5, align 4
  %563 = srem i32 %562, 3
  %564 = load i32, ptr %5, align 4
  %565 = add nsw i32 %564, 1
  %566 = srem i32 %565, 3
  %567 = call i32 @_127_nested_switch_array_pointer(i32 noundef %563, i32 noundef %566, ptr noundef %7, i32 noundef 1)
  %568 = load i32, ptr %6, align 4
  %569 = add nsw i32 %568, %567
  store i32 %569, ptr %6, align 4
  %570 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %571 = load i32, ptr %5, align 4
  store i32 %571, ptr %570, align 4
  %572 = getelementptr inbounds i32, ptr %570, i64 1
  %573 = load i32, ptr %5, align 4
  %574 = add nsw i32 %573, 1
  store i32 %574, ptr %572, align 4
  %575 = getelementptr inbounds i32, ptr %572, i64 1
  %576 = load i32, ptr %5, align 4
  %577 = add nsw i32 %576, 2
  store i32 %577, ptr %575, align 4
  %578 = getelementptr inbounds i32, ptr %575, i64 1
  %579 = load i32, ptr %5, align 4
  %580 = add nsw i32 %579, 3
  store i32 %580, ptr %578, align 4
  %581 = getelementptr inbounds i32, ptr %578, i64 1
  %582 = load i32, ptr %5, align 4
  %583 = add nsw i32 %582, 4
  store i32 %583, ptr %581, align 4
  %584 = getelementptr inbounds i32, ptr %581, i64 1
  %585 = load i32, ptr %5, align 4
  %586 = add nsw i32 %585, 5
  store i32 %586, ptr %584, align 4
  %587 = getelementptr inbounds i32, ptr %584, i64 1
  %588 = load i32, ptr %5, align 4
  %589 = add nsw i32 %588, 6
  store i32 %589, ptr %587, align 4
  %590 = getelementptr inbounds i32, ptr %587, i64 1
  %591 = load i32, ptr %5, align 4
  %592 = add nsw i32 %591, 7
  store i32 %592, ptr %590, align 4
  %593 = load i32, ptr %5, align 4
  %594 = srem i32 %593, 4
  %595 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %596 = load i32, ptr %5, align 4
  %597 = call i32 @_128_switch_array_pointer_loops(i32 noundef %594, ptr noundef %595, i32 noundef 4, i32 noundef %596)
  %598 = load i32, ptr %6, align 4
  %599 = add nsw i32 %598, %597
  store i32 %599, ptr %6, align 4
  %600 = load i32, ptr %5, align 4
  %601 = srem i32 %600, 4
  %602 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %603 = load i32, ptr %5, align 4
  %604 = call i32 @_129_switch_vla_nested(i32 noundef %601, ptr noundef %602, i32 noundef 4, i32 noundef %603)
  %605 = load i32, ptr %6, align 4
  %606 = add nsw i32 %605, %604
  store i32 %606, ptr %6, align 4
  %607 = load i32, ptr %5, align 4
  store i32 %607, ptr %7, align 4
  %608 = load i32, ptr %5, align 4
  %609 = srem i32 %608, 5
  %610 = load i32, ptr %5, align 4
  %611 = add nsw i32 %610, 1
  %612 = srem i32 %611, 3
  %613 = load i32, ptr %5, align 4
  %614 = call i32 @_130_switch_stress(i32 noundef %609, i32 noundef %612, ptr noundef %7, i32 noundef 4, i32 noundef %613, i32 noundef 3, i32 noundef 5)
  %615 = load i32, ptr %6, align 4
  %616 = add nsw i32 %615, %614
  store i32 %616, ptr %6, align 4
  %617 = load i32, ptr %6, align 4
  %618 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %617)
  ret i32 0

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %15
    i32 3, label %20
    i32 4, label %21
    i32 5, label %187
    i32 6, label %191
    i32 7, label %195
    i32 8, label %197
    i32 9, label %198
  ]

break:                                            ; preds = %197, %195, %191, %187, %21, %20, %15, %11, %10
  br label %switch
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
