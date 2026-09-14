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
  br i1 %6, label %true, label %false

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = mul nsw i32 %8, 2
  store i32 %9, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  store i32 %11, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  ret i32 %13

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %7
    i32 3, label %10
    i32 4, label %12
  ]

break:                                            ; preds = %10, %7, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %6, label %true, label %false

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = add nsw i32 %8, 10
  store i32 %9, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = sub nsw i32 %11, 10
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
    i32 2, label %7
    i32 3, label %10
    i32 4, label %13
  ]

break:                                            ; preds = %10, %7, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 5
  store i32 %14, ptr %2, align 4
  %15 = load i32, ptr %2, align 4
  ret i32 %15

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
  ]

break:                                            ; preds = %9, %break_con, %3
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 10
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %2, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %8
    i32 3, label %13
  ]

break:                                            ; preds = %8, %break_con, %3
  br label %switch

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %6, label %true, label %false

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = mul nsw i32 %8, 2
  store i32 %9, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  %14 = sub nsw i32 %13, 2
  store i32 %14, ptr %2, align 4
  %15 = load i32, ptr %2, align 4
  %16 = sub nsw i32 %15, 1
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
    i32 0, label %3
    i32 1, label %4
    i32 2, label %7
    i32 3, label %12
    i32 4, label %17
  ]

break:                                            ; preds = %12, %7, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  store i32 100, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 200, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  ret i32 %13

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %11
    i32 4, label %12
  ]

break:                                            ; preds = %11, %10, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %4, align 4
  %17 = sub nsw i32 %15, %16
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
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %18
  ]

break:                                            ; preds = %14, %10, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  store i32 1, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %12, %13
  br i1 %14, label %true2, label %false3

15:                                               ; preds = %switch
  store i32 2, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %true5, label %false6

20:                                               ; preds = %switch
  store i32 3, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 4, ptr %2, align 4
  store i32 8, ptr %b, align 4
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
    i32 3, label %11
    i32 4, label %15
    i32 5, label %16
    i32 6, label %20
    i32 7, label %21
    i32 8, label %22
  ]

break:                                            ; preds = %21, %20, %break_con7, %15, %break_con4, %10, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %16
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %16
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = mul nsw i32 %11, 3
  store i32 %12, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %14, 3
  store i32 %15, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  ret i32 %17

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
  ]

break:                                            ; preds = %13, %10, %break_con, %5
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %6, label %true, label %false

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = add nsw i32 %8, 100
  store i32 %9, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 5
  br i1 %12, label %true2, label %false3

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 50
  store i32 %15, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %1, align 4
  store i32 6, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %1, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %7
    i32 3, label %10
    i32 4, label %13
    i32 5, label %16
    i32 6, label %19
  ]

break:                                            ; preds = %16, %13, %break_con4, %7, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %10
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %6, label %true, label %false

7:                                                ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %true2, label %false3

11:                                               ; preds = %switch
  store i32 -2, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %true5, label %false6

15:                                               ; preds = %switch
  store i32 0, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = icmp slt i32 %17, 10
  br i1 %18, label %true8, label %false9

19:                                               ; preds = %switch
  store i32 2, ptr %1, align 4
  store i32 10, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 1, ptr %1, align 4
  store i32 10, ptr %b, align 4
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
    i32 2, label %7
    i32 3, label %8
    i32 4, label %11
    i32 5, label %12
    i32 6, label %15
    i32 7, label %16
    i32 8, label %19
    i32 9, label %20
    i32 10, label %21
  ]

break:                                            ; preds = %20, %19, %break_con10, %15, %break_con7, %11, %break_con4, %7, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %8
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %12
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %12
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %16
  store i32 8, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %16
  store i32 9, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp eq i32 %14, %15
  br i1 %16, label %true2, label %false3

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 10
  %24 = load i32, ptr %4, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %true5, label %false6

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  %28 = load i32, ptr %4, align 4
  %29 = sub nsw i32 %27, %28
  store i32 %29, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  %32 = load i32, ptr %3, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %2, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %13
    i32 4, label %17
    i32 5, label %21
    i32 6, label %26
    i32 7, label %30
    i32 8, label %34
  ]

break:                                            ; preds = %30, %26, %break_con7, %17, %break_con4, %10, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %13
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %13
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %21
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %21
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %true2, label %false3

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %2, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %16
    i32 5, label %20
  ]

break:                                            ; preds = %16, %12, %break_con4, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %true2, label %false3

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  %16 = add nsw i32 %15, 10
  store i32 %16, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = sub nsw i32 %20, 10
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
    i32 2, label %9
    i32 3, label %12
    i32 4, label %17
    i32 5, label %22
  ]

break:                                            ; preds = %17, %12, %break_con4, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %true5, label %false6

17:                                               ; preds = %switch
  store i32 100, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 200, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
    i32 5, label %18
    i32 6, label %19
  ]

break:                                            ; preds = %18, %17, %break_con7, %break_con4, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %14
  store i32 4, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %14
  store i32 5, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 10
  br i1 %16, label %true5, label %false6

17:                                               ; preds = %switch
  store i32 300, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 400, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
    i32 5, label %18
    i32 6, label %19
  ]

break:                                            ; preds = %18, %17, %break_con7, %break_con4, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %14
  store i32 4, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %14
  store i32 5, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %14, 10
  br i1 %15, label %true2, label %false3

16:                                               ; preds = %switch
  %17 = load i32, ptr %7, align 4
  %18 = icmp eq i32 %17, 5
  br i1 %18, label %true5, label %false6

19:                                               ; preds = %switch
  %20 = load i32, ptr %8, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %true8, label %false9

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %8, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %6, align 4
  %33 = sub nsw i32 %31, %32
  %34 = load i32, ptr %7, align 4
  %35 = sub nsw i32 %33, %34
  %36 = load i32, ptr %8, align 4
  %37 = sub nsw i32 %35, %36
  store i32 %37, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %4, align 4
  ret i32 %39

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %13
    i32 3, label %16
    i32 4, label %19
    i32 5, label %22
    i32 6, label %30
    i32 7, label %38
  ]

break:                                            ; preds = %30, %22, %break_con10, %break_con7, %break_con4, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %13
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %13
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %16
  store i32 4, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %16
  store i32 6, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %19
  store i32 5, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %19
  store i32 6, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %17, label %true, label %false

18:                                               ; preds = %switch
  store i32 111, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  store i32 222, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %18
    i32 3, label %19
    i32 4, label %20
  ]

break:                                            ; preds = %19, %18, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %21, label %true, label %false

22:                                               ; preds = %switch
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %5, align 4
  %31 = sub nsw i32 %29, %30
  %32 = load i32, ptr %6, align 4
  %33 = sub nsw i32 %31, %32
  store i32 %33, ptr %3, align 4
  store i32 4, ptr %b, align 4
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
    i32 2, label %22
    i32 3, label %28
    i32 4, label %34
  ]

break:                                            ; preds = %28, %22, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %13, label %true, label %false

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = sub nsw i32 %15, %16
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, 10
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %true2, label %false3

21:                                               ; preds = %switch
  store i32 123, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 456, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %14
    i32 3, label %21
    i32 4, label %22
    i32 5, label %23
  ]

break:                                            ; preds = %22, %21, %break_con4, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %14
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %14
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %13, label %true, label %false

14:                                               ; preds = %switch
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %8, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %true2, label %false3

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %7, align 4
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %true5, label %false6

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %8, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %true8, label %false9

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %7, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %true11, label %false12

30:                                               ; preds = %switch
  store i32 777, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  store i32 888, ptr %4, align 4
  store i32 8, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  ret i32 %33

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
    i32 7, label %31
    i32 8, label %32
  ]

break:                                            ; preds = %31, %30, %break_con13, %break_con10, %break_con7, %break_con4, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %14
  store i32 6, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %14
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %18
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %18
  store i32 4, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %22
  store i32 5, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %22
  store i32 7, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %26
  store i32 6, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %26
  store i32 7, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %true2, label %false3

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = load i32, ptr %3, align 4
  %22 = sub nsw i32 %20, %21
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
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
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
    i32 4, label %19
    i32 5, label %25
    i32 6, label %26
  ]

break:                                            ; preds = %25, %19, %13, %break_con4, %break_con, %5
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %true2, label %false3

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = sub nsw i32 %20, 2
  store i32 %21, ptr %2, align 4
  store i32 6, ptr %b, align 4
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
    i32 2, label %9
    i32 3, label %13
    i32 4, label %16
    i32 5, label %19
    i32 6, label %22
  ]

break:                                            ; preds = %19, %16, %break_con4, %9, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %13
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %13
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %true5, label %false6

25:                                               ; preds = %switch
  %26 = load i32, ptr %6, align 4
  %27 = mul nsw i32 %26, 2
  store i32 %27, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %6, align 4
  %30 = sub nsw i32 %29, 2
  store i32 %30, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %3, align 4
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %18
    i32 5, label %22
    i32 6, label %25
    i32 7, label %28
    i32 8, label %31
  ]

break:                                            ; preds = %28, %25, %break_con7, %18, %14, %break_con4, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 5, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %22
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %22
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %6, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %true2, label %false3

17:                                               ; preds = %switch
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, 10
  store i32 %19, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %true5, label %false6

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 100
  store i32 %25, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = sub nsw i32 %27, 100
  store i32 %28, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, 20
  store i32 %32, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 -1, ptr %6, align 4
  store i32 12, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %6, align 4
  ret i32 %36

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
    i32 5, label %20
    i32 6, label %23
    i32 7, label %26
    i32 8, label %29
    i32 9, label %30
    i32 10, label %33
    i32 11, label %34
    i32 12, label %35
  ]

break:                                            ; preds = %34, %33, %30, %29, %26, %23, %break_con7, %17, %break_con4, %11, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 11, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %14
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %14
  store i32 9, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %20
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %20
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %14, label %true, label %false

15:                                               ; preds = %switch
  %16 = load i32, ptr %7, align 4
  %17 = add nsw i32 %16, 10
  store i32 %17, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp sgt i32 %19, %20
  br i1 %21, label %true2, label %false3

22:                                               ; preds = %switch
  %23 = load i32, ptr %7, align 4
  %24 = mul nsw i32 %23, 2
  store i32 %24, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %7, align 4
  %27 = srem i32 %26, 3
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %true5, label %false6

29:                                               ; preds = %switch
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %30, 3
  store i32 %31, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %7, align 4
  %34 = sub nsw i32 %33, 3
  store i32 %34, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %7, align 4
  %37 = sub nsw i32 %36, 5
  store i32 %37, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %7, align 4
  %40 = load i32, ptr %6, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %true8, label %false9

42:                                               ; preds = %switch
  %43 = load i32, ptr %7, align 4
  %44 = mul nsw i32 %43, 2
  store i32 %44, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %7, align 4
  %47 = sdiv i32 %46, 2
  store i32 %47, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %7, align 4
  %50 = load i32, ptr %6, align 4
  %51 = sub nsw i32 %49, %50
  store i32 %51, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %3, align 4
  ret i32 %53

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %12
    i32 2, label %15
    i32 3, label %18
    i32 4, label %22
    i32 5, label %25
    i32 6, label %29
    i32 7, label %32
    i32 8, label %35
    i32 9, label %38
    i32 10, label %42
    i32 11, label %45
    i32 12, label %48
    i32 13, label %52
  ]

break:                                            ; preds = %48, %45, %42, %break_con10, %35, %32, %29, %break_con7, %22, %break_con4, %15, %break_con, %8
  br label %switch

true:                                             ; preds = %12
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %12
  store i32 12, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %18
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %18
  store i32 8, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %25
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %25
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %38
  store i32 10, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %38
  store i32 11, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %6, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %6, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %true5, label %false6

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %22, 10
  br i1 %23, label %true8, label %false9

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %30, %29
  store i32 %31, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  store i32 %34, ptr %6, align 4
  store i32 10, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %6, align 4
  ret i32 %36

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %18
    i32 5, label %21
    i32 6, label %24
    i32 7, label %28
    i32 8, label %32
    i32 9, label %33
    i32 10, label %35
  ]

break:                                            ; preds = %33, %32, %28, %24, %break_con10, %break_con7, %14, %break_con4, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 9, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 9, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %18
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %18
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %21
  store i32 6, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %21
  store i32 7, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 10
  br i1 %16, label %true5, label %false6

17:                                               ; preds = %switch
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, -10
  br i1 %19, label %true8, label %false9

20:                                               ; preds = %switch
  store i32 1000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 2000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 3000, ptr %3, align 4
  store i32 8, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
    i32 5, label %20
    i32 6, label %21
    i32 7, label %22
    i32 8, label %23
  ]

break:                                            ; preds = %22, %21, %20, %break_con10, %break_con7, %break_con4, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %14
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %14
  store i32 4, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %17
  store i32 5, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %17
  store i32 6, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  %14 = load i32, ptr %6, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %true2, label %false3

16:                                               ; preds = %switch
  %17 = load i32, ptr %7, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %true5, label %false6

19:                                               ; preds = %switch
  %20 = load i32, ptr %8, align 4
  %21 = icmp sgt i32 %20, 5
  br i1 %21, label %true8, label %false9

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %true11, label %false12

26:                                               ; preds = %switch
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %27, 10
  br i1 %28, label %true14, label %false15

29:                                               ; preds = %switch
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %7, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %5, align 4
  %39 = load i32, ptr %6, align 4
  %40 = mul nsw i32 %38, %39
  store i32 %40, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %8, align 4
  %44 = sub nsw i32 %42, %43
  store i32 %44, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %4, align 4
  ret i32 %46

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %13
    i32 3, label %16
    i32 4, label %19
    i32 5, label %22
    i32 6, label %26
    i32 7, label %29
    i32 8, label %37
    i32 9, label %41
    i32 10, label %45
  ]

break:                                            ; preds = %41, %37, %29, %break_con16, %break_con13, %break_con10, %break_con7, %break_con4, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %13
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %13
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %16
  store i32 4, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %16
  store i32 9, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %19
  store i32 6, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %19
  store i32 5, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %22
  store i32 6, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %22
  store i32 8, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break

true14:                                           ; preds = %26
  store i32 7, ptr %b, align 4
  br label %break_con16

false15:                                          ; preds = %26
  store i32 8, ptr %b, align 4
  br label %break_con16

break_con16:                                      ; preds = %true14, %false15
  br label %break
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
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 10
  store i32 %10, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %1, align 4
  %13 = icmp sgt i32 %12, 5
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 20
  store i32 %16, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %1, align 4
  %19 = icmp sgt i32 %18, 10
  br i1 %19, label %true5, label %false6

20:                                               ; preds = %switch
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, 30
  store i32 %22, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %5
    i32 2, label %8
    i32 3, label %11
    i32 4, label %14
    i32 5, label %17
    i32 6, label %20
    i32 7, label %23
  ]

break:                                            ; preds = %20, %break_con7, %14, %break_con4, %8, %break_con, %3
  br label %switch

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %17
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %17
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = add nsw i32 %10, 10
  store i32 %11, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %13, 10
  store i32 %14, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %true2, label %false3

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 20
  store i32 %20, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = sub nsw i32 %22, 20
  store i32 %23, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %15
    i32 5, label %18
    i32 6, label %21
    i32 7, label %24
  ]

break:                                            ; preds = %21, %18, %break_con4, %12, %9, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %15
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %15
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = sub nsw i32 %16, 2
  store i32 %17, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %1, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %9
    i32 2, label %12
    i32 3, label %15
    i32 4, label %18
  ]

break:                                            ; preds = %15, %12, %break_con, %4
  br label %switch

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %1, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %10
    i32 3, label %17
    i32 4, label %24
  ]

break:                                            ; preds = %17, %10, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %15, label %true, label %false

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %true2, label %false3

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i32 %26, 10
  store i32 %27, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = mul nsw i32 %32, 10
  store i32 %33, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %2, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %16
    i32 3, label %22
    i32 4, label %28
    i32 5, label %34
  ]

break:                                            ; preds = %28, %22, %break_con4, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %16
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %16
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %16, label %true, label %false

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = sub nsw i32 %21, 2
  store i32 %22, ptr %2, align 4
  store i32 4, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %14
    i32 2, label %17
    i32 3, label %20
    i32 4, label %23
  ]

break:                                            ; preds = %20, %17, %break_con, %6
  br label %switch

true:                                             ; preds = %14
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %14
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %true2, label %false3

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = icmp sge i32 %20, 0
  br i1 %21, label %true5, label %false6

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = icmp slt i32 %23, 8
  br i1 %24, label %true8, label %false9

25:                                               ; preds = %switch
  %26 = load i32, ptr %2, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = icmp sgt i32 %29, %33
  br i1 %34, label %true11, label %false12

35:                                               ; preds = %switch
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
  store i32 9, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
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
  store i32 9, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

61:                                               ; preds = %switch
  %62 = load i32, ptr %4, align 4
  ret i32 %62

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %19
    i32 5, label %22
    i32 6, label %25
    i32 7, label %35
    i32 8, label %47
    i32 9, label %59
    i32 10, label %60
    i32 11, label %61
  ]

break:                                            ; preds = %60, %59, %47, %35, %break_con13, %break_con10, %break_con7, %12, %break_con4, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 11, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %9
  store i32 11, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %19
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %19
  store i32 10, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %22
  store i32 6, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %22
  store i32 10, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %25
  store i32 7, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %25
  store i32 8, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break
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
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %9, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 2
  store i32 %15, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %1, align 4
  ret i32 %17

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %12
    i32 4, label %16
  ]

break:                                            ; preds = %12, %8, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, 100
  store i32 %11, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %13, align 4
  %15 = sub nsw i32 %14, 100
  store i32 %15, ptr %1, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %1, align 4
  ret i32 %17

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %8
    i32 3, label %12
    i32 4, label %16
  ]

break:                                            ; preds = %12, %8, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %16, label %true, label %false

17:                                               ; preds = %switch
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
  store i32 4, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
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
  store i32 4, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %2, align 4
  ret i32 %40

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %17
    i32 3, label %28
    i32 4, label %39
  ]

break:                                            ; preds = %28, %17, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %14, align 4
  %16 = icmp sgt i32 %13, %15
  br i1 %16, label %true2, label %false3

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %23, %22
  store i32 %24, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load ptr, ptr %2, align 8
  %28 = load i32, ptr %27, align 4
  %29 = sub nsw i32 0, %28
  store i32 %29, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  ret i32 %31

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %8
    i32 2, label %12
    i32 3, label %17
    i32 4, label %21
    i32 5, label %25
    i32 6, label %26
    i32 7, label %30
  ]

break:                                            ; preds = %26, %25, %21, %17, %break_con4, %break_con, %5
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %12
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %12
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = mul nsw i32 %9, 2
  %11 = load ptr, ptr %2, align 8
  store i32 %10, ptr %11, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 2
  %15 = load ptr, ptr %2, align 8
  store i32 %14, ptr %15, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load ptr, ptr %2, align 8
  %18 = load i32, ptr %17, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %8
    i32 3, label %12
    i32 4, label %16
  ]

break:                                            ; preds = %12, %8, %break_con, %4
  br label %switch

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %true2, label %false3

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %5, align 4
  %16 = add nsw i32 %14, %15
  %17 = load ptr, ptr %3, align 8
  store i32 %16, ptr %17, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = sub nsw i32 %19, %20
  %22 = load ptr, ptr %3, align 8
  store i32 %21, ptr %22, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = sub nsw i32 0, %25
  %27 = load ptr, ptr %3, align 8
  store i32 %26, ptr %27, align 4
  store i32 7, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %29, align 4
  ret i32 %30

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
    i32 4, label %18
    i32 5, label %23
    i32 6, label %24
    i32 7, label %28
  ]

break:                                            ; preds = %24, %23, %18, %13, %break_con4, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %3, label %true, label %false

4:                                                ; preds = %switch
  %5 = load i32, ptr @g_x, align 4
  %6 = load i32, ptr @g_y, align 4
  %7 = add nsw i32 %5, %6
  store i32 %7, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_x, align 4
  %10 = load i32, ptr @g_y, align 4
  %11 = sub nsw i32 %9, %10
  store i32 %11, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %0, align 4
  ret i32 %13

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %4
    i32 2, label %8
    i32 3, label %12
  ]

break:                                            ; preds = %8, %4, %break_con
  br label %switch

true:                                             ; preds = %1
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %1
  store i32 2, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %3, label %true, label %false

4:                                                ; preds = %switch
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %true2, label %false3

7:                                                ; preds = %switch
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_y, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr @g_z, align 4
  store i32 %12, ptr %0, align 4
  store i32 4, ptr %b, align 4
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
    i32 1, label %4
    i32 2, label %7
    i32 3, label %11
    i32 4, label %13
  ]

break:                                            ; preds = %11, %7, %break_con4, %break_con
  br label %switch

true:                                             ; preds = %1
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %1
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %3, label %true, label %false

4:                                                ; preds = %switch
  %5 = load i32, ptr @g_z, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %true2, label %false3

7:                                                ; preds = %switch
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_z, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %0, align 4
  store i32 4, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr @g_y, align 4
  store i32 %12, ptr %0, align 4
  store i32 4, ptr %b, align 4
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
    i32 1, label %4
    i32 2, label %7
    i32 3, label %11
    i32 4, label %13
  ]

break:                                            ; preds = %11, %7, %break_con4, %break_con
  br label %switch

true:                                             ; preds = %1
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %1
  store i32 1, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %3, label %true, label %false

4:                                                ; preds = %switch
  %5 = load i32, ptr @g_y, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %true2, label %false3

7:                                                ; preds = %switch
  %8 = load i32, ptr @g_x, align 4
  %9 = load i32, ptr @g_y, align 4
  %10 = add nsw i32 %8, %9
  store i32 %10, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr @g_x, align 4
  %13 = load i32, ptr @g_y, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr @g_z, align 4
  store i32 %16, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %0, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %4
    i32 2, label %7
    i32 3, label %11
    i32 4, label %15
    i32 5, label %17
  ]

break:                                            ; preds = %15, %11, %7, %break_con4, %break_con
  br label %switch

true:                                             ; preds = %1
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %1
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %4, label %true, label %false

5:                                                ; preds = %switch
  %6 = load i32, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 %6, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr @g_arr, align 16
  store i32 %8, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %0, align 4
  ret i32 %10

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %7
    i32 3, label %9
  ]

break:                                            ; preds = %7, %5, %break_con
  br label %switch

true:                                             ; preds = %1
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %1
  store i32 2, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %4, label %true, label %false

5:                                                ; preds = %switch
  %6 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @g_mat, i64 0, i64 2, i64 2), align 8
  store i32 %6, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr @g_mat, align 16
  store i32 %8, ptr %0, align 4
  store i32 3, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %0, align 4
  ret i32 %10

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %5
    i32 2, label %7
    i32 3, label %9
  ]

break:                                            ; preds = %7, %5, %break_con
  br label %switch

true:                                             ; preds = %1
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %1
  store i32 2, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %6, label %true, label %false

7:                                                ; preds = %switch
  store i32 -1, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %true2, label %false3

11:                                               ; preds = %switch
  store i32 0, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %13, 10
  br i1 %14, label %true5, label %false6

15:                                               ; preds = %switch
  store i32 10, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  store i32 20, ptr %1, align 4
  store i32 8, ptr %b, align 4
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
    i32 2, label %7
    i32 3, label %8
    i32 4, label %11
    i32 5, label %12
    i32 6, label %15
    i32 7, label %16
    i32 8, label %17
  ]

break:                                            ; preds = %16, %15, %break_con7, %11, %break_con4, %7, %break_con, %3
  br label %switch

true:                                             ; preds = %4
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %4
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %8
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %12
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %12
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %true2, label %false3

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %true5, label %false6

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  store i32 %20, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %3, align 4
  %27 = sub nsw i32 0, %26
  store i32 %27, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %2, align 4
  ret i32 %29

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %16
    i32 5, label %19
    i32 6, label %21
    i32 7, label %25
    i32 8, label %28
  ]

break:                                            ; preds = %25, %21, %19, %break_con7, %12, %break_con4, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %16
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %16
  store i32 6, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %true5, label %false6

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %true8, label %false9

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %6, align 4
  %27 = sub nsw i32 %25, %26
  store i32 %27, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %6, align 4
  %33 = mul nsw i32 %32, 2
  %34 = icmp sgt i32 %31, %33
  br i1 %34, label %true11, label %false12

35:                                               ; preds = %switch
  %36 = load i32, ptr %4, align 4
  %37 = load i32, ptr %5, align 4
  %38 = mul nsw i32 %36, %37
  store i32 %38, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  store i32 %40, ptr %3, align 4
  store i32 10, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %3, align 4
  ret i32 %42

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %18
    i32 5, label %21
    i32 6, label %24
    i32 7, label %28
    i32 8, label %35
    i32 9, label %39
    i32 10, label %41
  ]

break:                                            ; preds = %39, %35, %break_con13, %24, %break_con10, %break_con7, %14, %break_con4, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %18
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %18
  store i32 5, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %21
  store i32 6, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %21
  store i32 7, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %28
  store i32 8, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %28
  store i32 9, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break
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
  br i1 %20, label %true, label %false

21:                                               ; preds = %switch
  %22 = load i32, ptr %8, align 4
  %23 = add nsw i32 %22, 100
  store i32 %23, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %8, align 4
  %26 = sub nsw i32 %25, 100
  store i32 %26, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %30, %31
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %18
    i32 2, label %21
    i32 3, label %24
    i32 4, label %27
  ]

break:                                            ; preds = %24, %21, %break_con, %9
  br label %switch

true:                                             ; preds = %18
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %18
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 10
  store i32 %18, ptr %4, align 4
  %19 = load i32, ptr %4, align 4
  %20 = mul nsw i32 %19, 3
  store i32 %20, ptr %4, align 4
  %21 = load i32, ptr %4, align 4
  ret i32 %21

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
  ]

break:                                            ; preds = %13, %10, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %13, label %true, label %false

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp sgt i32 %18, %19
  br i1 %20, label %true2, label %false3

21:                                               ; preds = %switch
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, 10
  store i32 %23, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = sub nsw i32 %25, 10
  store i32 %26, ptr %6, align 4
  store i32 6, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 5
  store i32 %29, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %6, align 4
  %32 = sub nsw i32 0, %31
  store i32 %32, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %34, %35
  ret i32 %36

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %11
    i32 2, label %14
    i32 3, label %17
    i32 4, label %21
    i32 5, label %24
    i32 6, label %27
    i32 7, label %30
    i32 8, label %33
  ]

break:                                            ; preds = %30, %27, %24, %21, %break_con4, %14, %break_con, %7
  br label %switch

true:                                             ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %11
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %17
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %17
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 20
  store i32 %15, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  ret i32 %17

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
  ]

break:                                            ; preds = %13, %10, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 2
  store i32 %14, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = sub nsw i32 %16, 1
  store i32 %17, ptr %4, align 4
  %18 = load i32, ptr %3, align 4
  %19 = sub nsw i32 %18, 2
  store i32 %19, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = mul nsw i32 %21, %22
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %10
    i32 3, label %15
    i32 4, label %20
  ]

break:                                            ; preds = %15, %10, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %true2, label %false3

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = sub nsw i32 %20, %21
  store i32 %22, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %true5, label %false6

27:                                               ; preds = %switch
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  %33 = load i32, ptr %3, align 4
  %34 = sub nsw i32 %32, %33
  store i32 %34, ptr %6, align 4
  store i32 9, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %6, align 4
  %38 = icmp sgt i32 %37, 10
  br i1 %38, label %true8, label %false9

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  %41 = mul nsw i32 %40, 2
  store i32 %41, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %6, align 4
  %44 = sub nsw i32 %43, 2
  store i32 %44, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %7, align 4
  ret i32 %46

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %12
    i32 3, label %15
    i32 4, label %19
    i32 5, label %23
    i32 6, label %24
    i32 7, label %27
    i32 8, label %31
    i32 9, label %35
    i32 10, label %36
    i32 11, label %39
    i32 12, label %42
    i32 13, label %45
  ]

break:                                            ; preds = %42, %39, %break_con10, %35, %31, %27, %break_con7, %23, %19, %15, %break_con4, %break_con, %8
  br label %switch

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %12
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %12
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %24
  store i32 7, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %24
  store i32 8, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %36
  store i32 11, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %36
  store i32 12, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  store i32 %12, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  store i32 %14, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 10
  br i1 %18, label %true2, label %false3

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = mul nsw i32 %20, 2
  store i32 %21, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, 2
  store i32 %24, ptr %2, align 4
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
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %13
    i32 4, label %15
    i32 5, label %16
    i32 6, label %19
    i32 7, label %22
    i32 8, label %25
  ]

break:                                            ; preds = %22, %19, %break_con4, %15, %13, %11, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %16
  store i32 6, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %16
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %true4, label %false5

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %true7, label %false8

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = mul nsw i32 %25, 2
  store i32 %26, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  %29 = sub nsw i32 %28, 2
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %2, align 4
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %16
    i32 5, label %20
    i32 6, label %21
    i32 7, label %24
    i32 8, label %27
    i32 9, label %30
    i32 10, label %31
  ]

break:                                            ; preds = %30, %27, %24, %break_con9, %20, %16, %12, %break_con6, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true4:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con6

false5:                                           ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break_con6

break_con6:                                       ; preds = %true4, %false5
  br label %break

true7:                                            ; preds = %21
  store i32 7, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %21
  store i32 8, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break
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
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %true6, label %false7

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  store i32 %18, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %6, align 4
  store i32 %20, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %true9, label %false10

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  store i32 %27, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %6, align 4
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %7, align 4
  store i32 11, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %7, align 4
  %34 = icmp sgt i32 %33, 10
  br i1 %34, label %true12, label %false13

35:                                               ; preds = %switch
  %36 = load i32, ptr %7, align 4
  %37 = mul nsw i32 %36, 2
  store i32 %37, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %7, align 4
  store i32 %39, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %3, align 4
  ret i32 %41

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b5 = load i32, ptr %b, align 4
  switch i32 %b5, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %17
    i32 4, label %19
    i32 5, label %21
    i32 6, label %22
    i32 7, label %26
    i32 8, label %28
    i32 9, label %30
    i32 10, label %31
    i32 11, label %32
    i32 12, label %35
    i32 13, label %38
    i32 14, label %40
  ]

break:                                            ; preds = %38, %35, %break_con14, %31, %30, %28, %26, %break_con11, %21, %19, %17, %break_con8, %break_con, %8
  br label %switch

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true6:                                            ; preds = %13
  store i32 3, ptr %b, align 4
  br label %break_con8

false7:                                           ; preds = %13
  store i32 4, ptr %b, align 4
  br label %break_con8

break_con8:                                       ; preds = %true6, %false7
  br label %break

true9:                                            ; preds = %22
  store i32 7, ptr %b, align 4
  br label %break_con11

false10:                                          ; preds = %22
  store i32 8, ptr %b, align 4
  br label %break_con11

break_con11:                                      ; preds = %true9, %false10
  br label %break

true12:                                           ; preds = %32
  store i32 12, ptr %b, align 4
  br label %break_con14

false13:                                          ; preds = %32
  store i32 13, ptr %b, align 4
  br label %break_con14

break_con14:                                      ; preds = %true12, %false13
  br label %break
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
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
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
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = icmp sgt i32 %21, 1
  br i1 %22, label %true7, label %false8

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %24, 10
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %26 = getelementptr inbounds i32, ptr %.reload4, i64 1
  store i32 %25, ptr %26, align 4
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %28 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %29 = load i32, ptr %28, align 16
  %30 = add nsw i32 %29, 10
  store i32 %30, ptr %28, align 16
  store i32 7, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %32 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %33 = load i32, ptr %32, align 16
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %true10, label %false11

35:                                               ; preds = %switch
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %36 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %37 = load i32, ptr %36, align 16
  store i32 %37, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 10, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %39 = getelementptr inbounds i32, ptr %.reload, i64 0
  %40 = load i32, ptr %39, align 16
  %41 = sub nsw i32 %40, 1
  store i32 %41, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 10, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %43)
  store i32 11, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %2, align 4
  ret i32 %45

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %12
    i32 3, label %13
    i32 4, label %20
    i32 5, label %23
    i32 6, label %27
    i32 7, label %31
    i32 8, label %35
    i32 9, label %38
    i32 10, label %42
    i32 11, label %44
  ]

break:                                            ; preds = %42, %38, %35, %break_con12, %27, %23, %break_con9, %13, %12, %break_con, %8
  br label %switch

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true7:                                            ; preds = %20
  store i32 5, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %20
  store i32 6, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break

true10:                                           ; preds = %31
  store i32 8, ptr %b, align 4
  br label %break_con12

false11:                                          ; preds = %31
  store i32 9, ptr %b, align 4
  br label %break_con12

break_con12:                                      ; preds = %true10, %false11
  br label %break
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
  br i1 %12, label %true, label %false

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
  store i64 %16, ptr %6, align 8
  store ptr %18, ptr %7, align 8
  %19 = load i32, ptr %4, align 4
  %20 = load ptr, ptr %7, align 8
  store i32 %19, ptr %20, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %22, 2
  br i1 %23, label %true2, label %false3

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds i32, ptr %27, i64 1
  store i32 %26, ptr %28, align 4
  store i32 6, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load ptr, ptr %7, align 8
  %31 = getelementptr inbounds i32, ptr %30, i64 1
  %32 = load i32, ptr %31, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %true5, label %false6

34:                                               ; preds = %switch
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 1
  %37 = load i32, ptr %36, align 4
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds i32, ptr %38, i64 0
  %40 = load i32, ptr %39, align 4
  %41 = add nsw i32 %37, %40
  store i32 %41, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load ptr, ptr %7, align 8
  %44 = getelementptr inbounds i32, ptr %43, i64 0
  %45 = load i32, ptr %44, align 4
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds i32, ptr %46, i64 1
  %48 = load i32, ptr %47, align 4
  %49 = sub nsw i32 %45, %48
  store i32 %49, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 0
  %53 = load i32, ptr %52, align 4
  store i32 %53, ptr %2, align 4
  store i32 1, ptr %8, align 4
  store i32 10, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  %55 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %55)
  store i32 11, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %2, align 4
  ret i32 %57

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %13
    i32 3, label %14
    i32 4, label %21
    i32 5, label %24
    i32 6, label %29
    i32 7, label %34
    i32 8, label %42
    i32 9, label %50
    i32 10, label %54
    i32 11, label %56
  ]

break:                                            ; preds = %54, %50, %42, %34, %break_con7, %24, %break_con4, %14, %13, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %21
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %21
  store i32 9, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %29
  store i32 7, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %29
  store i32 8, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %13, label %true, label %false

14:                                               ; preds = %switch
  store i32 -100, ptr %3, align 4
  store i32 13, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
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
  store i32 4, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = icmp sgt i32 %25, 3
  br i1 %26, label %true9, label %false10

27:                                               ; preds = %switch
  %.reload6 = load ptr, ptr %.reg2mem, align 8
  %28 = getelementptr inbounds i32, ptr %.reload6, i64 0
  %29 = load i32, ptr %28, align 16
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %true12, label %false13

31:                                               ; preds = %switch
  %.reload5 = load ptr, ptr %.reg2mem, align 8
  %32 = getelementptr inbounds i32, ptr %.reload5, i64 0
  %33 = load i32, ptr %32, align 16
  %34 = mul nsw i32 %33, 2
  %.reload4 = load ptr, ptr %.reg2mem, align 8
  %35 = getelementptr inbounds i32, ptr %.reload4, i64 1
  store i32 %34, ptr %35, align 4
  store i32 8, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %37 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %38 = load i32, ptr %37, align 16
  %39 = sub nsw i32 %38, 5
  store i32 %39, ptr %37, align 16
  store i32 8, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %41 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %42 = load i32, ptr %41, align 16
  %43 = icmp sgt i32 %42, 10
  br i1 %43, label %true15, label %false16

44:                                               ; preds = %switch
  %45 = load i32, ptr %6, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %true18, label %false19

47:                                               ; preds = %switch
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %48 = getelementptr inbounds i32, ptr %.reload1, i64 0
  %49 = load i32, ptr %48, align 16
  store i32 %49, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %51 = getelementptr inbounds i32, ptr %.reload, i64 0
  %52 = load i32, ptr %51, align 16
  %53 = load i32, ptr %5, align 4
  %54 = add nsw i32 %52, %53
  store i32 %54, ptr %3, align 4
  store i32 1, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %56)
  store i32 13, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load i32, ptr %3, align 4
  ret i32 %58

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b8 = load i32, ptr %b, align 4
  switch i32 %b8, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %14
    i32 3, label %15
    i32 4, label %24
    i32 5, label %27
    i32 6, label %31
    i32 7, label %36
    i32 8, label %40
    i32 9, label %44
    i32 10, label %47
    i32 11, label %50
    i32 12, label %55
    i32 13, label %57
  ]

break:                                            ; preds = %55, %50, %47, %break_con20, %break_con17, %36, %31, %break_con14, %break_con11, %15, %14, %break_con, %10
  br label %switch

true:                                             ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true9:                                            ; preds = %24
  store i32 5, ptr %b, align 4
  br label %break_con11

false10:                                          ; preds = %24
  store i32 7, ptr %b, align 4
  br label %break_con11

break_con11:                                      ; preds = %true9, %false10
  br label %break

true12:                                           ; preds = %27
  store i32 6, ptr %b, align 4
  br label %break_con14

false13:                                          ; preds = %27
  store i32 7, ptr %b, align 4
  br label %break_con14

break_con14:                                      ; preds = %true12, %false13
  br label %break

true15:                                           ; preds = %40
  store i32 10, ptr %b, align 4
  br label %break_con17

false16:                                          ; preds = %40
  store i32 9, ptr %b, align 4
  br label %break_con17

break_con17:                                      ; preds = %true15, %false16
  br label %break

true18:                                           ; preds = %44
  store i32 10, ptr %b, align 4
  br label %break_con20

false19:                                          ; preds = %44
  store i32 11, ptr %b, align 4
  br label %break_con20

break_con20:                                      ; preds = %true18, %false19
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = mul i64 %14, 4
  %16 = call noalias ptr @malloc(i64 noundef %15) #6
  store ptr %16, ptr %5, align 8
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load ptr, ptr %5, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %true2, label %false3

20:                                               ; preds = %switch
  store i32 -2, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds i32, ptr %23, i64 0
  store i32 %22, ptr %24, align 4
  store i32 7, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds i32, ptr %26, i64 0
  %28 = load i32, ptr %27, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %true5, label %false6

30:                                               ; preds = %switch
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds i32, ptr %31, i64 0
  %33 = load i32, ptr %32, align 4
  %34 = mul nsw i32 %33, 2
  store i32 %34, ptr %32, align 4
  store i32 10, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds i32, ptr %36, i64 0
  %38 = load i32, ptr %37, align 4
  %39 = sub nsw i32 %38, 2
  store i32 %39, ptr %37, align 4
  store i32 10, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds i32, ptr %41, i64 0
  %43 = load i32, ptr %42, align 4
  store i32 %43, ptr %6, align 4
  %44 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %44) #7
  %45 = load i32, ptr %6, align 4
  store i32 %45, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %2, align 4
  ret i32 %47

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %12
    i32 4, label %17
    i32 5, label %20
    i32 6, label %21
    i32 7, label %25
    i32 8, label %30
    i32 9, label %35
    i32 10, label %40
    i32 11, label %46
  ]

break:                                            ; preds = %40, %35, %30, %break_con7, %21, %20, %break_con4, %12, %11, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %17
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %17
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %25
  store i32 8, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %25
  store i32 9, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  store i32 -1, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 4
  %18 = call noalias ptr @malloc(i64 noundef %17) #6
  store ptr %18, ptr %7, align 8
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load ptr, ptr %7, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %true2, label %false3

22:                                               ; preds = %switch
  store i32 -2, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %5, align 4
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds i32, ptr %25, i64 0
  store i32 %24, ptr %26, align 4
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %5, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %true5, label %false6

30:                                               ; preds = %switch
  %31 = load i32, ptr %6, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %true8, label %false9

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 0
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %37, %34
  store i32 %38, ptr %36, align 4
  store i32 11, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %6, align 4
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds i32, ptr %41, i64 0
  %43 = load i32, ptr %42, align 4
  %44 = sub nsw i32 %43, %40
  store i32 %44, ptr %42, align 4
  store i32 11, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds i32, ptr %47, i64 0
  %49 = load i32, ptr %48, align 4
  %50 = sub nsw i32 0, %49
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 0
  store i32 %50, ptr %52, align 4
  store i32 13, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load ptr, ptr %7, align 8
  %55 = getelementptr inbounds i32, ptr %54, i64 0
  %56 = load i32, ptr %55, align 4
  store i32 %56, ptr %8, align 4
  %57 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %57) #7
  %58 = load i32, ptr %8, align 4
  store i32 %58, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %3, align 4
  ret i32 %60

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %13
    i32 3, label %14
    i32 4, label %19
    i32 5, label %22
    i32 6, label %23
    i32 7, label %27
    i32 8, label %30
    i32 9, label %33
    i32 10, label %39
    i32 11, label %45
    i32 12, label %46
    i32 13, label %53
    i32 14, label %59
  ]

break:                                            ; preds = %53, %46, %45, %39, %33, %break_con10, %break_con7, %23, %22, %break_con4, %14, %13, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %19
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %19
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %27
  store i32 8, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %27
  store i32 12, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %30
  store i32 9, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %30
  store i32 10, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %5, label %true, label %false

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = load i32, ptr @g_void_result, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_void_result, align 4
  store i32 3, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %6
    i32 3, label %10
  ]

break:                                            ; preds = %6, %break_con, %2
  br label %switch

true:                                             ; preds = %3
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %5, label %true, label %false

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = mul nsw i32 %7, 2
  %9 = load i32, ptr @g_void_result, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %1, align 4
  %13 = load i32, ptr @g_void_result, align 4
  %14 = sub nsw i32 %13, %12
  store i32 %14, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %6
    i32 3, label %11
    i32 4, label %15
  ]

break:                                            ; preds = %11, %6, %break_con, %2
  br label %switch

true:                                             ; preds = %3
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %3
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %true2, label %false3

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  %19 = load i32, ptr %3, align 4
  %20 = sub nsw i32 %18, %19
  %21 = load i32, ptr @g_void_result, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  %26 = load i32, ptr @g_void_result, align 4
  %27 = sub nsw i32 %26, %25
  store i32 %27, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %8
    i32 3, label %11
    i32 4, label %17
    i32 5, label %23
    i32 6, label %24
    i32 7, label %28
  ]

break:                                            ; preds = %24, %23, %17, %11, %break_con4, %break_con, %4
  br label %switch

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %true2, label %false3

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %true5, label %false6

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr @g_void_result, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr @g_void_result, align 4
  store i32 6, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr @g_void_result, align 4
  %31 = sub nsw i32 %30, %29
  store i32 %31, ptr @g_void_result, align 4
  store i32 6, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
    i32 4, label %16
    i32 5, label %24
    i32 6, label %32
  ]

break:                                            ; preds = %24, %16, %break_con7, %break_con4, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %13
  store i32 4, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %13
  store i32 5, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %2, label %true, label %false

3:                                                ; preds = %switch
  %4 = load i32, ptr @g_y, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %true2, label %false3

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_x, align 4
  %8 = load i32, ptr @g_void_result, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr @g_z, align 4
  %12 = load i32, ptr @g_void_result, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr @g_void_result, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %3
    i32 2, label %6
    i32 3, label %10
    i32 4, label %14
  ]

break:                                            ; preds = %10, %6, %break_con4, %break_con
  br label %switch

true:                                             ; preds = %0
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %0
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %3
  store i32 2, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %3
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = mul nsw i32 %9, 2
  %11 = load ptr, ptr %2, align 8
  store i32 %10, ptr %11, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 2
  %15 = load ptr, ptr %2, align 8
  store i32 %14, ptr %15, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load ptr, ptr %2, align 8
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr @g_void_result, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr @g_void_result, align 4
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %8
    i32 3, label %12
    i32 4, label %16
  ]

break:                                            ; preds = %12, %8, %break_con, %4
  br label %switch

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 8
  br i1 %10, label %true2, label %false3

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  store i32 %12, ptr %15, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = icmp sge i32 %17, 0
  br i1 %18, label %true5, label %false6

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = icmp slt i32 %20, 8
  br i1 %21, label %true8, label %false9

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr @g_void_result, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %8
    i32 3, label %11
    i32 4, label %16
    i32 5, label %19
    i32 6, label %22
    i32 7, label %29
  ]

break:                                            ; preds = %22, %break_con10, %break_con7, %11, %break_con4, %break_con, %4
  br label %switch

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %16
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %16
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %19
  store i32 6, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %19
  store i32 7, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %15, label %true, label %false

16:                                               ; preds = %switch
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %9, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %9, align 4
  store i32 3, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %6, align 4
  %22 = icmp sge i32 %21, 0
  br i1 %22, label %true2, label %false3

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %24, 8
  br i1 %25, label %true5, label %false6

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %true8, label %false9

32:                                               ; preds = %switch
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = load i32, ptr %9, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %9, align 4
  store i32 7, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load ptr, ptr %5, align 8
  %41 = load i32, ptr %40, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %true11, label %false12

43:                                               ; preds = %switch
  %44 = load i32, ptr @g_y, align 4
  %45 = icmp slt i32 %44, 0
  br i1 %45, label %true14, label %false15

46:                                               ; preds = %switch
  %47 = load i32, ptr %9, align 4
  %48 = load ptr, ptr %5, align 8
  %49 = load i32, ptr %48, align 4
  %50 = add nsw i32 %47, %49
  store i32 %50, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %9, align 4
  %53 = load ptr, ptr %5, align 8
  %54 = load i32, ptr %53, align 4
  %55 = sub nsw i32 %52, %54
  store i32 %55, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %6, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = load i32, ptr %9, align 4
  %62 = sub nsw i32 %61, %60
  store i32 %62, ptr %9, align 4
  store i32 12, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load i32, ptr %9, align 4
  %66 = add nsw i32 %65, 100
  store i32 %66, ptr %9, align 4
  store i32 14, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  store i32 24, ptr %b, align 4
  br label %break

68:                                               ; preds = %switch
  %69 = load i32, ptr %7, align 4
  %70 = load i32, ptr %8, align 4
  %71 = icmp eq i32 %69, %70
  br i1 %71, label %true17, label %false18

72:                                               ; preds = %switch
  %73 = load i32, ptr @g_z, align 4
  %74 = load i32, ptr %9, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %9, align 4
  store i32 17, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load ptr, ptr %5, align 8
  %78 = load i32, ptr %77, align 4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %true20, label %false21

80:                                               ; preds = %switch
  %81 = load i32, ptr %9, align 4
  store i32 %81, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  %83 = load i32, ptr %9, align 4
  %84 = load ptr, ptr %5, align 8
  %85 = load i32, ptr %84, align 4
  %86 = add nsw i32 %83, %85
  store i32 %86, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

87:                                               ; preds = %switch
  %88 = load i32, ptr %8, align 4
  %89 = load i32, ptr %9, align 4
  %90 = sub nsw i32 %89, %88
  store i32 %90, ptr %9, align 4
  store i32 21, ptr %b, align 4
  br label %break

91:                                               ; preds = %switch
  %92 = load i32, ptr %7, align 4
  %93 = load i32, ptr %8, align 4
  %94 = add nsw i32 %92, %93
  %95 = load i32, ptr @g_x, align 4
  %96 = add nsw i32 %95, 1
  %97 = icmp sgt i32 %94, %96
  br i1 %97, label %true23, label %false24

98:                                               ; preds = %switch
  %99 = load i32, ptr %9, align 4
  %100 = mul nsw i32 %99, 2
  store i32 %100, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

101:                                              ; preds = %switch
  %102 = load i32, ptr %9, align 4
  %103 = sdiv i32 %102, 2
  store i32 %103, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

104:                                              ; preds = %switch
  %105 = load i32, ptr %9, align 4
  store i32 %105, ptr %4, align 4
  store i32 25, ptr %b, align 4
  br label %break

106:                                              ; preds = %switch
  %107 = load i32, ptr %4, align 4
  ret i32 %107

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %10
    i32 1, label %12
    i32 2, label %16
    i32 3, label %20
    i32 4, label %23
    i32 5, label %26
    i32 6, label %32
    i32 7, label %39
    i32 8, label %43
    i32 9, label %46
    i32 10, label %51
    i32 11, label %56
    i32 12, label %63
    i32 13, label %64
    i32 14, label %67
    i32 15, label %68
    i32 16, label %72
    i32 17, label %76
    i32 18, label %80
    i32 19, label %82
    i32 20, label %87
    i32 21, label %91
    i32 22, label %98
    i32 23, label %101
    i32 24, label %104
    i32 25, label %106
  ]

break:                                            ; preds = %104, %101, %98, %break_con25, %87, %82, %80, %break_con22, %72, %break_con19, %67, %64, %63, %56, %51, %46, %break_con16, %break_con13, %32, %break_con10, %break_con7, %break_con4, %16, %break_con, %10
  br label %switch

true:                                             ; preds = %12
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %12
  store i32 15, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %20
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %20
  store i32 13, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %23
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %23
  store i32 13, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %26
  store i32 6, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %26
  store i32 11, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %39
  store i32 9, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %39
  store i32 8, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break

true14:                                           ; preds = %43
  store i32 9, ptr %b, align 4
  br label %break_con16

false15:                                          ; preds = %43
  store i32 10, ptr %b, align 4
  br label %break_con16

break_con16:                                      ; preds = %true14, %false15
  br label %break

true17:                                           ; preds = %68
  store i32 16, ptr %b, align 4
  br label %break_con19

false18:                                          ; preds = %68
  store i32 20, ptr %b, align 4
  br label %break_con19

break_con19:                                      ; preds = %true17, %false18
  br label %break

true20:                                           ; preds = %76
  store i32 18, ptr %b, align 4
  br label %break_con22

false21:                                          ; preds = %76
  store i32 19, ptr %b, align 4
  br label %break_con22

break_con22:                                      ; preds = %true20, %false21
  br label %break

true23:                                           ; preds = %91
  store i32 22, ptr %b, align 4
  br label %break_con25

false24:                                          ; preds = %91
  store i32 23, ptr %b, align 4
  br label %break_con25

break_con25:                                      ; preds = %true23, %false24
  br label %break
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
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %true2, label %false3

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %7, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %6, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %true5, label %false6

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %24, %25
  store i32 %26, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %6, align 4
  %29 = load i32, ptr %7, align 4
  %30 = sub nsw i32 %28, %29
  store i32 %30, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %5, align 4
  %35 = sub nsw i32 %33, %34
  store i32 %35, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %6, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %true8, label %false9

39:                                               ; preds = %switch
  %40 = load i32, ptr %4, align 4
  %41 = load i32, ptr %5, align 4
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %true11, label %false12

43:                                               ; preds = %switch
  %44 = load i32, ptr %7, align 4
  %45 = mul nsw i32 %44, 2
  store i32 %45, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %7, align 4
  %48 = load i32, ptr %6, align 4
  %49 = sub nsw i32 %47, %48
  store i32 %49, ptr %8, align 4
  store i32 13, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %8, align 4
  %53 = icmp sgt i32 %52, 20
  br i1 %53, label %true14, label %false15

54:                                               ; preds = %switch
  %55 = load i32, ptr %8, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load i32, ptr %8, align 4
  %59 = icmp sgt i32 %58, 10
  br i1 %59, label %true17, label %false18

60:                                               ; preds = %switch
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 2
  store i32 %62, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  %64 = load i32, ptr %8, align 4
  %65 = add nsw i32 %64, 3
  store i32 %65, ptr %3, align 4
  store i32 19, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %3, align 4
  ret i32 %67

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %13
    i32 3, label %16
    i32 4, label %20
    i32 5, label %23
    i32 6, label %27
    i32 7, label %31
    i32 8, label %32
    i32 9, label %36
    i32 10, label %39
    i32 11, label %43
    i32 12, label %46
    i32 13, label %50
    i32 14, label %51
    i32 15, label %54
    i32 16, label %57
    i32 17, label %60
    i32 18, label %63
    i32 19, label %66
  ]

break:                                            ; preds = %63, %60, %break_con19, %54, %break_con16, %50, %46, %43, %break_con13, %break_con10, %32, %31, %27, %23, %break_con7, %16, %break_con4, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 8, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %13
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %13
  store i32 8, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %20
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %20
  store i32 6, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %36
  store i32 11, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %36
  store i32 10, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %39
  store i32 11, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %39
  store i32 12, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break

true14:                                           ; preds = %51
  store i32 15, ptr %b, align 4
  br label %break_con16

false15:                                          ; preds = %51
  store i32 16, ptr %b, align 4
  br label %break_con16

break_con16:                                      ; preds = %true14, %false15
  br label %break

true17:                                           ; preds = %57
  store i32 17, ptr %b, align 4
  br label %break_con19

false18:                                          ; preds = %57
  store i32 18, ptr %b, align 4
  br label %break_con19

break_con19:                                      ; preds = %true17, %false18
  br label %break
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
  br i1 %19, label %true, label %false

20:                                               ; preds = %switch
  %21 = load i32, ptr %10, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %true2, label %false3

23:                                               ; preds = %switch
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %10, align 4
  %26 = icmp sgt i32 %24, %25
  br i1 %26, label %true5, label %false6

27:                                               ; preds = %switch
  %28 = load i32, ptr %8, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %true8, label %false9

30:                                               ; preds = %switch
  %31 = load i32, ptr %11, align 4
  %32 = add nsw i32 %31, 10
  store i32 %32, ptr %11, align 4
  store i32 6, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %7, align 4
  %35 = icmp sge i32 %34, 0
  br i1 %35, label %true11, label %false12

36:                                               ; preds = %switch
  %37 = load i32, ptr %7, align 4
  %38 = icmp slt i32 %37, 8
  br i1 %38, label %true14, label %false15

39:                                               ; preds = %switch
  %40 = load i32, ptr %7, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = load i32, ptr %11, align 4
  %45 = icmp sgt i32 %43, %44
  br i1 %45, label %true17, label %false18

46:                                               ; preds = %switch
  %47 = load i32, ptr %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %11, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, ptr %11, align 4
  store i32 10, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load ptr, ptr %6, align 8
  %55 = load i32, ptr %54, align 4
  %56 = icmp sgt i32 %55, 0
  br i1 %56, label %true20, label %false21

57:                                               ; preds = %switch
  %58 = load ptr, ptr %6, align 8
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %11, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, ptr %11, align 4
  store i32 13, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load ptr, ptr %6, align 8
  %64 = load i32, ptr %63, align 4
  %65 = load i32, ptr %11, align 4
  %66 = sub nsw i32 %65, %64
  store i32 %66, ptr %11, align 4
  store i32 13, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

68:                                               ; preds = %switch
  %69 = load i32, ptr %7, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = load i32, ptr %11, align 4
  %74 = sub nsw i32 %73, %72
  store i32 %74, ptr %11, align 4
  store i32 15, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  %76 = load i32, ptr %7, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %true23, label %false24

81:                                               ; preds = %switch
  %82 = load ptr, ptr %6, align 8
  %83 = load i32, ptr %82, align 4
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %true26, label %false27

85:                                               ; preds = %switch
  %86 = load i32, ptr %11, align 4
  %87 = add nsw i32 %86, 50
  store i32 %87, ptr %11, align 4
  store i32 18, ptr %b, align 4
  br label %break

88:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

89:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load i32, ptr %11, align 4
  %92 = sub nsw i32 %91, 20
  store i32 %92, ptr %11, align 4
  store i32 21, ptr %b, align 4
  br label %break

93:                                               ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %break

94:                                               ; preds = %switch
  %95 = load i32, ptr %11, align 4
  %96 = sub nsw i32 %95, 10
  store i32 %96, ptr %11, align 4
  store i32 23, ptr %b, align 4
  br label %break

97:                                               ; preds = %switch
  %98 = load i32, ptr %11, align 4
  %99 = load i32, ptr @g_z, align 4
  %100 = icmp sgt i32 %98, %99
  br i1 %100, label %true29, label %false30

101:                                              ; preds = %switch
  %102 = load i32, ptr %8, align 4
  %103 = load i32, ptr %9, align 4
  %104 = load i32, ptr %10, align 4
  %105 = sdiv i32 %104, 10
  %106 = load i32, ptr %8, align 4
  %107 = sub nsw i32 %106, 1
  %108 = mul nsw i32 %105, %107
  %109 = add nsw i32 %103, %108
  %110 = icmp eq i32 %102, %109
  br i1 %110, label %true32, label %false33

111:                                              ; preds = %switch
  %112 = load i32, ptr %11, align 4
  %113 = add nsw i32 %112, 100
  store i32 %113, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %break

114:                                              ; preds = %switch
  %115 = load i32, ptr %11, align 4
  %116 = add nsw i32 %115, 200
  store i32 %116, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %break

117:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %break

118:                                              ; preds = %switch
  %119 = load i32, ptr %11, align 4
  %120 = icmp sgt i32 %119, 0
  br i1 %120, label %true35, label %false36

121:                                              ; preds = %switch
  %122 = load i32, ptr %11, align 4
  %123 = mul nsw i32 %122, 2
  store i32 %123, ptr %.reg2mem, align 4
  store i32 31, ptr %b, align 4
  br label %break

124:                                              ; preds = %switch
  %125 = load i32, ptr %11, align 4
  %126 = sub nsw i32 0, %125
  store i32 %126, ptr %.reg2mem, align 4
  store i32 31, ptr %b, align 4
  br label %break

127:                                              ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 32, ptr %b, align 4
  br label %break

128:                                              ; preds = %switch
  %129 = load i32, ptr %5, align 4
  ret i32 %129

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %12
    i32 1, label %16
    i32 2, label %20
    i32 3, label %23
    i32 4, label %27
    i32 5, label %30
    i32 6, label %33
    i32 7, label %36
    i32 8, label %39
    i32 9, label %46
    i32 10, label %53
    i32 11, label %57
    i32 12, label %62
    i32 13, label %67
    i32 14, label %68
    i32 15, label %75
    i32 16, label %81
    i32 17, label %85
    i32 18, label %88
    i32 19, label %89
    i32 20, label %90
    i32 21, label %93
    i32 22, label %94
    i32 23, label %97
    i32 24, label %101
    i32 25, label %111
    i32 26, label %114
    i32 27, label %117
    i32 28, label %118
    i32 29, label %121
    i32 30, label %124
    i32 31, label %127
    i32 32, label %128
  ]

break:                                            ; preds = %127, %124, %121, %break_con37, %117, %114, %111, %break_con34, %break_con31, %94, %93, %90, %89, %88, %85, %break_con28, %break_con25, %68, %67, %62, %57, %break_con22, %46, %break_con19, %break_con16, %break_con13, %30, %break_con10, %break_con7, %break_con4, %break_con, %12
  br label %switch

true:                                             ; preds = %16
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %16
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %20
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %20
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %23
  store i32 4, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %23
  store i32 22, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %27
  store i32 5, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %27
  store i32 22, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %33
  store i32 7, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %33
  store i32 20, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break

true14:                                           ; preds = %36
  store i32 8, ptr %b, align 4
  br label %break_con16

false15:                                          ; preds = %36
  store i32 20, ptr %b, align 4
  br label %break_con16

break_con16:                                      ; preds = %true14, %false15
  br label %break

true17:                                           ; preds = %39
  store i32 9, ptr %b, align 4
  br label %break_con19

false18:                                          ; preds = %39
  store i32 14, ptr %b, align 4
  br label %break_con19

break_con19:                                      ; preds = %true17, %false18
  br label %break

true20:                                           ; preds = %53
  store i32 11, ptr %b, align 4
  br label %break_con22

false21:                                          ; preds = %53
  store i32 12, ptr %b, align 4
  br label %break_con22

break_con22:                                      ; preds = %true20, %false21
  br label %break

true23:                                           ; preds = %75
  store i32 17, ptr %b, align 4
  br label %break_con25

false24:                                          ; preds = %75
  store i32 16, ptr %b, align 4
  br label %break_con25

break_con25:                                      ; preds = %true23, %false24
  br label %break

true26:                                           ; preds = %81
  store i32 17, ptr %b, align 4
  br label %break_con28

false27:                                          ; preds = %81
  store i32 18, ptr %b, align 4
  br label %break_con28

break_con28:                                      ; preds = %true26, %false27
  br label %break

true29:                                           ; preds = %97
  store i32 24, ptr %b, align 4
  br label %break_con31

false30:                                          ; preds = %97
  store i32 27, ptr %b, align 4
  br label %break_con31

break_con31:                                      ; preds = %true29, %false30
  br label %break

true32:                                           ; preds = %101
  store i32 25, ptr %b, align 4
  br label %break_con34

false33:                                          ; preds = %101
  store i32 26, ptr %b, align 4
  br label %break_con34

break_con34:                                      ; preds = %true32, %false33
  br label %break

true35:                                           ; preds = %118
  store i32 29, ptr %b, align 4
  br label %break_con37

false36:                                          ; preds = %118
  store i32 30, ptr %b, align 4
  br label %break_con37

break_con37:                                      ; preds = %true35, %false36
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
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
    i32 2, label %11
    i32 3, label %17
    i32 4, label %20
  ]

break:                                            ; preds = %17, %11, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %5, align 4
  %14 = sub nsw i32 %12, %13
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  ret i32 %20

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %19
  ]

break:                                            ; preds = %11, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %19, label %true, label %false

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
    i32 2, label %16
    i32 3, label %20
  ]

break:                                            ; preds = %break_con, %7, %6
  br label %switch

true:                                             ; preds = %16
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %16
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
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
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %true2, label %false3

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = mul nsw i32 %18, %19
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %4, align 4
  ret i32 %31

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %13
    i32 4, label %17
    i32 5, label %23
    i32 6, label %26
    i32 7, label %27
    i32 8, label %30
  ]

break:                                            ; preds = %27, %26, %23, %17, %break_con4, %12, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 8, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %13
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %13
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %true2, label %false3

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %18, %19
  %21 = srem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %true5, label %false6

23:                                               ; preds = %switch
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %4, align 4
  %31 = sub nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %4, align 4
  ret i32 %41

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %13
    i32 4, label %17
    i32 5, label %23
    i32 6, label %29
    i32 7, label %32
    i32 8, label %33
    i32 9, label %36
    i32 10, label %37
    i32 11, label %40
  ]

break:                                            ; preds = %37, %36, %33, %32, %29, %23, %break_con7, %break_con4, %12, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 11, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %13
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %13
  store i32 9, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %17
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %17
  store i32 6, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %10, 3
  br i1 %11, label %true2, label %false3

12:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 10
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %2, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %12
    i32 4, label %13
    i32 5, label %18
    i32 6, label %21
  ]

break:                                            ; preds = %18, %13, %12, %break_con4, %break_con, %4
  br label %switch

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %true2, label %false3

13:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %2, align 4
  ret i32 %22

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %13
    i32 4, label %14
    i32 5, label %18
    i32 6, label %21
  ]

break:                                            ; preds = %18, %14, %13, %break_con4, %break_con, %4
  br label %switch

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  store i1 true, ptr %.reg2mem, align 1
  br i1 %13, label %true6, label %false7

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %15, 3
  store i1 %16, ptr %.reg2mem, align 1
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  br i1 %.reload2, label %true9, label %false10

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %true12, label %false13

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  store i32 %23, ptr %.reg2mem3, align 4
  store i32 9, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = sub nsw i32 0, %25
  store i32 %26, ptr %.reg2mem3, align 4
  store i32 9, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
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
  store i32 1, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %5, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b5 = load i32, ptr %b, align 4
  switch i32 %b5, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
    i32 5, label %18
    i32 6, label %19
    i32 7, label %22
    i32 8, label %24
    i32 9, label %27
    i32 10, label %34
  ]

break:                                            ; preds = %27, %24, %22, %break_con14, %break_con11, %17, %14, %break_con8, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 5, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true6:                                            ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con8

false7:                                           ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con8

break_con8:                                       ; preds = %true6, %false7
  br label %break

true9:                                            ; preds = %18
  store i32 6, ptr %b, align 4
  br label %break_con11

false10:                                          ; preds = %18
  store i32 10, ptr %b, align 4
  br label %break_con11

break_con11:                                      ; preds = %true9, %false10
  br label %break

true12:                                           ; preds = %19
  store i32 7, ptr %b, align 4
  br label %break_con14

false13:                                          ; preds = %19
  store i32 8, ptr %b, align 4
  br label %break_con14

break_con14:                                      ; preds = %true12, %false13
  br label %break
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
  br i1 %5, label %true, label %false

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %true2, label %false3

12:                                               ; preds = %switch
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %0, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %0, align 4
  %25 = sub nsw i32 %24, %23
  store i32 %25, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %1, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %0, align 4
  ret i32 %31

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %3
    i32 2, label %6
    i32 3, label %12
    i32 4, label %19
    i32 5, label %26
    i32 6, label %27
    i32 7, label %30
  ]

break:                                            ; preds = %27, %26, %19, %12, %break_con4, %break_con, %2
  br label %switch

true:                                             ; preds = %3
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %3
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %6
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %14, label %true, label %false

15:                                               ; preds = %switch
  %16 = load i32, ptr %7, align 4
  %17 = icmp slt i32 %16, 8
  store i1 %17, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %true4, label %false5

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %20, %21
  %23 = load ptr, ptr %5, align 8
  store i32 %22, ptr %23, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds i32, ptr %24, i32 1
  store ptr %25, ptr %5, align 8
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %8, align 4
  %32 = load i32, ptr %2, align 4
  %33 = icmp slt i32 %31, %32
  store i1 false, ptr %.reg2mem1, align 1
  br i1 %33, label %true7, label %false8

34:                                               ; preds = %switch
  %35 = load i32, ptr %8, align 4
  %36 = icmp slt i32 %35, 8
  store i1 %36, ptr %.reg2mem1, align 1
  store i32 9, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  br i1 %.reload2, label %true10, label %false11

38:                                               ; preds = %switch
  %39 = load i32, ptr %8, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = mul nsw i32 %42, 2
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, %43
  store i32 %45, ptr %6, align 4
  store i32 11, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %8, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %8, align 4
  store i32 7, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %6, align 4
  ret i32 %50

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %9
    i32 1, label %11
    i32 2, label %15
    i32 3, label %18
    i32 4, label %19
    i32 5, label %26
    i32 6, label %29
    i32 7, label %30
    i32 8, label %34
    i32 9, label %37
    i32 10, label %38
    i32 11, label %46
    i32 12, label %49
  ]

break:                                            ; preds = %46, %38, %break_con12, %34, %break_con9, %29, %26, %19, %break_con6, %15, %break_con, %9
  br label %switch

true:                                             ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true4:                                            ; preds = %18
  store i32 4, ptr %b, align 4
  br label %break_con6

false5:                                           ; preds = %18
  store i32 6, ptr %b, align 4
  br label %break_con6

break_con6:                                       ; preds = %true4, %false5
  br label %break

true7:                                            ; preds = %30
  store i32 8, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %30
  store i32 9, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break

true10:                                           ; preds = %37
  store i32 10, ptr %b, align 4
  br label %break_con12

false11:                                          ; preds = %37
  store i32 12, ptr %b, align 4
  br label %break_con12

break_con12:                                      ; preds = %true10, %false11
  br label %break
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
  br i1 %14, label %true, label %false

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %7, align 4
  %21 = icmp sgt i32 %20, 10
  br i1 %21, label %true2, label %false3

22:                                               ; preds = %switch
  %23 = load i32, ptr %7, align 4
  %24 = mul nsw i32 %23, 2
  store i32 %24, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %5, align 4
  store i32 8, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %5, align 4
  %38 = icmp sgt i32 %37, 100
  br i1 %38, label %true5, label %false6

39:                                               ; preds = %switch
  %40 = load i32, ptr %5, align 4
  %41 = sub nsw i32 %40, 100
  store i32 %41, ptr %5, align 4
  store i32 10, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %5, align 4
  ret i32 %43

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %11
    i32 2, label %15
    i32 3, label %19
    i32 4, label %22
    i32 5, label %25
    i32 6, label %29
    i32 7, label %32
    i32 8, label %36
    i32 9, label %39
    i32 10, label %42
  ]

break:                                            ; preds = %39, %break_con7, %32, %29, %25, %22, %break_con4, %15, %break_con, %8
  br label %switch

true:                                             ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %11
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %19
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %19
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %36
  store i32 9, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %36
  store i32 10, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %14, label %true, label %false

15:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %4, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %true2, label %false3

20:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %5, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %true5, label %false6

25:                                               ; preds = %switch
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %8, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %true8, label %false9

29:                                               ; preds = %switch
  %30 = load i32, ptr %8, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp sgt i32 %30, %31
  br i1 %32, label %true11, label %false12

33:                                               ; preds = %switch
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 10
  store i32 %35, ptr %6, align 4
  store i32 13, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %7, align 4
  %38 = load i32, ptr %8, align 4
  %39 = icmp eq i32 %37, %38
  br i1 %39, label %true14, label %false15

40:                                               ; preds = %switch
  %41 = load i32, ptr %8, align 4
  %42 = load i32, ptr %9, align 4
  %43 = icmp eq i32 %41, %42
  br i1 %43, label %true17, label %false18

44:                                               ; preds = %switch
  %45 = load i32, ptr %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %6, align 4
  store i32 12, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %9, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %8, align 4
  store i32 3, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  store i32 18, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = load i32, ptr %7, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load i32, ptr %6, align 4
  ret i32 %61

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %15
    i32 3, label %16
    i32 4, label %20
    i32 5, label %21
    i32 6, label %25
    i32 7, label %29
    i32 8, label %33
    i32 9, label %36
    i32 10, label %40
    i32 11, label %44
    i32 12, label %47
    i32 13, label %48
    i32 14, label %49
    i32 15, label %52
    i32 16, label %53
    i32 17, label %56
    i32 18, label %57
    i32 19, label %60
  ]

break:                                            ; preds = %57, %56, %53, %52, %49, %48, %47, %44, %break_con19, %break_con16, %33, %break_con13, %break_con10, %break_con7, %20, %break_con4, %15, %break_con, %10
  br label %switch

true:                                             ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %11
  store i32 19, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %16
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %16
  store i32 17, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %21
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %21
  store i32 15, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %25
  store i32 7, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %25
  store i32 9, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %29
  store i32 8, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %29
  store i32 9, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break

true14:                                           ; preds = %36
  store i32 11, ptr %b, align 4
  br label %break_con16

false15:                                          ; preds = %36
  store i32 10, ptr %b, align 4
  br label %break_con16

break_con16:                                      ; preds = %true14, %false15
  br label %break

true17:                                           ; preds = %40
  store i32 11, ptr %b, align 4
  br label %break_con19

false18:                                          ; preds = %40
  store i32 12, ptr %b, align 4
  br label %break_con19

break_con19:                                      ; preds = %true17, %false18
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %true8, label %false9

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %true11, label %false12

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %true14, label %false15

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  store i32 %21, ptr %.reg2mem, align 4
  store i32 7, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem, align 4
  store i32 7, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reload.reg2mem, align 4
  store i32 8, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %true17, label %false18

27:                                               ; preds = %switch
  %28 = load i32, ptr %5, align 4
  store i32 %28, ptr %.reg2mem1, align 4
  store i32 11, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem1, align 4
  store i32 11, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload.reload = load i32, ptr %.reload.reg2mem, align 4
  %31 = add nsw i32 %.reload.reload, %.reload2
  store i32 %31, ptr %.reg2mem5, align 4
  store i32 12, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %6, align 4
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %true20, label %false21

35:                                               ; preds = %switch
  %36 = load i32, ptr %6, align 4
  store i32 %36, ptr %.reg2mem3, align 4
  store i32 15, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem3, align 4
  store i32 15, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %39 = add nsw i32 %.reload6, %.reload4
  store i32 %39, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  store i32 0, ptr %3, align 4
  store i32 17, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %3, align 4
  ret i32 %42

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %17
    i32 5, label %20
    i32 6, label %22
    i32 7, label %23
    i32 8, label %24
    i32 9, label %27
    i32 10, label %29
    i32 11, label %30
    i32 12, label %32
    i32 13, label %35
    i32 14, label %37
    i32 15, label %38
    i32 16, label %40
    i32 17, label %41
  ]

break:                                            ; preds = %40, %38, %37, %35, %break_con22, %30, %29, %27, %break_con19, %23, %22, %20, %break_con16, %break_con13, %break_con10, %break_con, %7
  br label %switch

true:                                             ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true8:                                            ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %14
  store i32 4, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %14
  store i32 16, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break

true14:                                           ; preds = %17
  store i32 5, ptr %b, align 4
  br label %break_con16

false15:                                          ; preds = %17
  store i32 6, ptr %b, align 4
  br label %break_con16

break_con16:                                      ; preds = %true14, %false15
  br label %break

true17:                                           ; preds = %24
  store i32 9, ptr %b, align 4
  br label %break_con19

false18:                                          ; preds = %24
  store i32 10, ptr %b, align 4
  br label %break_con19

break_con19:                                      ; preds = %true17, %false18
  br label %break

true20:                                           ; preds = %32
  store i32 13, ptr %b, align 4
  br label %break_con22

false21:                                          ; preds = %32
  store i32 14, ptr %b, align 4
  br label %break_con22

break_con22:                                      ; preds = %true20, %false21
  br label %break
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
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  store i32 %14, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %true23, label %false24

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  store i32 %19, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %true26, label %false27

23:                                               ; preds = %switch
  %24 = load i32, ptr %5, align 4
  store i32 %24, ptr %.reg2mem, align 4
  store i32 8, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 8, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
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
  store i32 11, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %3, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %true29, label %false30

37:                                               ; preds = %switch
  %38 = load i32, ptr %4, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %true32, label %false33

40:                                               ; preds = %switch
  %41 = load i32, ptr %5, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %true35, label %false36

43:                                               ; preds = %switch
  %44 = load i32, ptr %3, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %true38, label %false39

46:                                               ; preds = %switch
  %47 = load i32, ptr %3, align 4
  store i32 %47, ptr %.reg2mem5, align 4
  store i32 17, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem5, align 4
  store i32 17, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %.reload6.reg2mem, align 4
  store i32 18, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %4, align 4
  %52 = icmp sgt i32 %51, 0
  br i1 %52, label %true41, label %false42

53:                                               ; preds = %switch
  %54 = load i32, ptr %4, align 4
  store i32 %54, ptr %.reg2mem7, align 4
  store i32 21, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem7, align 4
  store i32 21, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %.reload6.reload = load i32, ptr %.reload6.reg2mem, align 4
  %57 = add nsw i32 %.reload6.reload, %.reload8
  store i32 %57, ptr %.reg2mem11, align 4
  store i32 22, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %5, align 4
  %60 = icmp sgt i32 %59, 0
  br i1 %60, label %true44, label %false45

61:                                               ; preds = %switch
  %62 = load i32, ptr %5, align 4
  store i32 %62, ptr %.reg2mem9, align 4
  store i32 25, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem9, align 4
  store i32 25, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  %.reload12 = load i32, ptr %.reg2mem11, align 4
  %65 = add nsw i32 %.reload12, %.reload10
  %.reload20 = load ptr, ptr %.reg2mem13, align 8
  %66 = getelementptr inbounds i32, ptr %.reload20, i64 0
  store i32 %65, ptr %66, align 16
  store i32 26, ptr %b, align 4
  br label %break

67:                                               ; preds = %switch
  %68 = load i32, ptr %6, align 4
  %69 = icmp sgt i32 %68, 1
  br i1 %69, label %true47, label %false48

70:                                               ; preds = %switch
  %.reload19 = load ptr, ptr %.reg2mem13, align 8
  %71 = getelementptr inbounds i32, ptr %.reload19, i64 0
  %72 = load i32, ptr %71, align 16
  %73 = mul nsw i32 %72, 2
  %.reload18 = load ptr, ptr %.reg2mem13, align 8
  %74 = getelementptr inbounds i32, ptr %.reload18, i64 1
  store i32 %73, ptr %74, align 4
  store i32 29, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  %.reload17 = load ptr, ptr %.reg2mem13, align 8
  %76 = getelementptr inbounds i32, ptr %.reload17, i64 0
  %77 = load i32, ptr %76, align 16
  %78 = sub nsw i32 %77, 1
  %.reload16 = load ptr, ptr %.reg2mem13, align 8
  %79 = getelementptr inbounds i32, ptr %.reload16, i64 1
  store i32 %78, ptr %79, align 4
  store i32 29, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
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

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b22 = load i32, ptr %b, align 4
  switch i32 %b22, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %13
    i32 3, label %15
    i32 4, label %18
    i32 5, label %20
    i32 6, label %23
    i32 7, label %25
    i32 8, label %26
    i32 9, label %27
    i32 10, label %28
    i32 11, label %34
    i32 12, label %37
    i32 13, label %40
    i32 14, label %43
    i32 15, label %46
    i32 16, label %48
    i32 17, label %49
    i32 18, label %50
    i32 19, label %53
    i32 20, label %55
    i32 21, label %56
    i32 22, label %58
    i32 23, label %61
    i32 24, label %63
    i32 25, label %64
    i32 26, label %67
    i32 27, label %70
    i32 28, label %75
    i32 29, label %80
  ]

break:                                            ; preds = %75, %70, %break_con49, %64, %63, %61, %break_con46, %56, %55, %53, %break_con43, %49, %48, %46, %break_con40, %break_con37, %break_con34, %break_con31, %28, %27, %26, %25, %23, %break_con28, %18, %break_con25, %13, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true23:                                           ; preds = %15
  store i32 4, ptr %b, align 4
  br label %break_con25

false24:                                          ; preds = %15
  store i32 5, ptr %b, align 4
  br label %break_con25

break_con25:                                      ; preds = %true23, %false24
  br label %break

true26:                                           ; preds = %20
  store i32 6, ptr %b, align 4
  br label %break_con28

false27:                                          ; preds = %20
  store i32 7, ptr %b, align 4
  br label %break_con28

break_con28:                                      ; preds = %true26, %false27
  br label %break

true29:                                           ; preds = %34
  store i32 14, ptr %b, align 4
  br label %break_con31

false30:                                          ; preds = %34
  store i32 12, ptr %b, align 4
  br label %break_con31

break_con31:                                      ; preds = %true29, %false30
  br label %break

true32:                                           ; preds = %37
  store i32 14, ptr %b, align 4
  br label %break_con34

false33:                                          ; preds = %37
  store i32 13, ptr %b, align 4
  br label %break_con34

break_con34:                                      ; preds = %true32, %false33
  br label %break

true35:                                           ; preds = %40
  store i32 14, ptr %b, align 4
  br label %break_con37

false36:                                          ; preds = %40
  store i32 26, ptr %b, align 4
  br label %break_con37

break_con37:                                      ; preds = %true35, %false36
  br label %break

true38:                                           ; preds = %43
  store i32 15, ptr %b, align 4
  br label %break_con40

false39:                                          ; preds = %43
  store i32 16, ptr %b, align 4
  br label %break_con40

break_con40:                                      ; preds = %true38, %false39
  br label %break

true41:                                           ; preds = %50
  store i32 19, ptr %b, align 4
  br label %break_con43

false42:                                          ; preds = %50
  store i32 20, ptr %b, align 4
  br label %break_con43

break_con43:                                      ; preds = %true41, %false42
  br label %break

true44:                                           ; preds = %58
  store i32 23, ptr %b, align 4
  br label %break_con46

false45:                                          ; preds = %58
  store i32 24, ptr %b, align 4
  br label %break_con46

break_con46:                                      ; preds = %true44, %false45
  br label %break

true47:                                           ; preds = %67
  store i32 27, ptr %b, align 4
  br label %break_con49

false48:                                          ; preds = %67
  store i32 28, ptr %b, align 4
  br label %break_con49

break_con49:                                      ; preds = %true47, %false48
  br label %break
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
  br i1 %13, label %true, label %false

14:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 15, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = zext i32 %16 to i64
  %18 = call ptr @llvm.stacksave()
  store ptr %18, ptr %5, align 8
  %19 = alloca i32, i64 %17, align 16
  store ptr %19, ptr %.reg2mem, align 8
  store i64 %17, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %8, align 4
  %22 = load i32, ptr %3, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %true5, label %false6

24:                                               ; preds = %switch
  %25 = load i32, ptr %4, align 4
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %8, align 4
  %29 = sext i32 %28 to i64
  %.reload3 = load ptr, ptr %.reg2mem, align 8
  %30 = getelementptr inbounds i32, ptr %.reload3, i64 %29
  store i32 %27, ptr %30, align 4
  store i32 6, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 8, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %9, align 4
  %37 = load i32, ptr %3, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %true8, label %false9

39:                                               ; preds = %switch
  %40 = load i32, ptr %9, align 4
  %41 = sext i32 %40 to i64
  %.reload2 = load ptr, ptr %.reg2mem, align 8
  %42 = getelementptr inbounds i32, ptr %.reload2, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %true11, label %false12

45:                                               ; preds = %switch
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %48 = getelementptr inbounds i32, ptr %.reload1, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, ptr %7, align 4
  store i32 12, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %9, align 4
  %54 = sext i32 %53 to i64
  %.reload = load ptr, ptr %.reg2mem, align 8
  %55 = getelementptr inbounds i32, ptr %.reload, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = load i32, ptr %7, align 4
  %58 = sub nsw i32 %57, %56
  store i32 %58, ptr %7, align 4
  store i32 12, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load i32, ptr %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %9, align 4
  store i32 8, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  %64 = load i32, ptr %7, align 4
  store i32 %64, ptr %2, align 4
  %65 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %65)
  store i32 15, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %2, align 4
  ret i32 %67

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %14
    i32 3, label %15
    i32 4, label %20
    i32 5, label %24
    i32 6, label %31
    i32 7, label %34
    i32 8, label %35
    i32 9, label %39
    i32 10, label %45
    i32 11, label %52
    i32 12, label %59
    i32 13, label %60
    i32 14, label %63
    i32 15, label %66
  ]

break:                                            ; preds = %63, %60, %59, %52, %45, %break_con13, %break_con10, %34, %31, %24, %break_con7, %15, %14, %break_con, %10
  br label %switch

true:                                             ; preds = %11
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true5:                                            ; preds = %20
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %20
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %35
  store i32 9, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %35
  store i32 14, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %39
  store i32 10, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %39
  store i32 11, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break
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
  br i1 %15, label %true, label %false

16:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = zext i32 %18 to i64
  %20 = call ptr @llvm.stacksave()
  store ptr %20, ptr %5, align 8
  %21 = alloca i32, i64 %19, align 16
  store i64 %19, ptr %6, align 8
  store ptr %21, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = load i32, ptr %3, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %true2, label %false3

26:                                               ; preds = %switch
  %27 = load ptr, ptr %7, align 8
  %28 = load i32, ptr %8, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %27, i64 %29
  store i32 0, ptr %30, align 4
  store i32 0, ptr %9, align 4
  store i32 6, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %8, align 4
  %34 = icmp sle i32 %32, %33
  br i1 %34, label %true5, label %false6

35:                                               ; preds = %switch
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
  store i32 8, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %9, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %9, align 4
  store i32 6, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 0, ptr %11, align 4
  store i32 12, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  %55 = load i32, ptr %11, align 4
  %56 = load i32, ptr %3, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %true8, label %false9

58:                                               ; preds = %switch
  %59 = load ptr, ptr %7, align 8
  %60 = load i32, ptr %11, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %59, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = load i32, ptr %10, align 4
  %65 = add nsw i32 %64, %63
  store i32 %65, ptr %10, align 4
  store i32 14, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %11, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %11, align 4
  store i32 12, ptr %b, align 4
  br label %break

69:                                               ; preds = %switch
  %70 = load i32, ptr %10, align 4
  store i32 %70, ptr %2, align 4
  %71 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %71)
  store i32 16, ptr %b, align 4
  br label %break

72:                                               ; preds = %switch
  %73 = load i32, ptr %2, align 4
  ret i32 %73

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %12
    i32 1, label %13
    i32 2, label %16
    i32 3, label %17
    i32 4, label %22
    i32 5, label %26
    i32 6, label %31
    i32 7, label %35
    i32 8, label %46
    i32 9, label %49
    i32 10, label %50
    i32 11, label %53
    i32 12, label %54
    i32 13, label %58
    i32 14, label %66
    i32 15, label %69
    i32 16, label %72
  ]

break:                                            ; preds = %69, %66, %58, %break_con10, %53, %50, %49, %46, %35, %break_con7, %26, %break_con4, %17, %16, %break_con, %12
  br label %switch

true:                                             ; preds = %13
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %13
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %22
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %22
  store i32 11, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %31
  store i32 7, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %31
  store i32 9, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %54
  store i32 13, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %54
  store i32 15, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
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
  br i1 %13, label %true, label %false

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = icmp slt i32 %15, 4
  store i1 %16, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %true7, label %false8

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  %21 = zext i32 %20 to i64
  %22 = call ptr @llvm.stacksave()
  store ptr %22, ptr %6, align 8
  %23 = alloca i32, i64 %21, align 16
  store ptr %23, ptr %.reg2mem1, align 8
  store i64 %21, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %5, align 4
  %27 = icmp sle i32 %25, %26
  br i1 %27, label %true10, label %false11

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %8, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %8, align 4
  %33 = sext i32 %32 to i64
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %34 = getelementptr inbounds i32, ptr %.reload5, i64 %33
  store i32 %31, ptr %34, align 4
  store i32 7, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %8, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %5, align 4
  %40 = sext i32 %39 to i64
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %41 = getelementptr inbounds i32, ptr %.reload4, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %true13, label %false14

44:                                               ; preds = %switch
  %45 = load i32, ptr %5, align 4
  %46 = sext i32 %45 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %47 = getelementptr inbounds i32, ptr %.reload3, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = load i32, ptr %4, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %4, align 4
  store i32 11, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %5, align 4
  %53 = sext i32 %52 to i64
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %54 = getelementptr inbounds i32, ptr %.reload2, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = load i32, ptr %4, align 4
  %57 = sub nsw i32 %56, %55
  store i32 %57, ptr %4, align 4
  store i32 11, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load ptr, ptr %6, align 8
  call void @llvm.stackrestore(ptr %59)
  store i32 12, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load i32, ptr %5, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  %64 = load i32, ptr %4, align 4
  ret i32 %64

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b6 = load i32, ptr %b, align 4
  switch i32 %b6, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %17
    i32 4, label %18
    i32 5, label %24
    i32 6, label %28
    i32 7, label %35
    i32 8, label %38
    i32 9, label %44
    i32 10, label %51
    i32 11, label %58
    i32 12, label %60
    i32 13, label %63
  ]

break:                                            ; preds = %60, %58, %51, %44, %break_con15, %35, %28, %break_con12, %18, %break_con9, %14, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true7:                                            ; preds = %17
  store i32 4, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %17
  store i32 13, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break

true10:                                           ; preds = %24
  store i32 6, ptr %b, align 4
  br label %break_con12

false11:                                          ; preds = %24
  store i32 8, ptr %b, align 4
  br label %break_con12

break_con12:                                      ; preds = %true10, %false11
  br label %break

true13:                                           ; preds = %38
  store i32 9, ptr %b, align 4
  br label %break_con15

false14:                                          ; preds = %38
  store i32 10, ptr %b, align 4
  br label %break_con15

break_con15:                                      ; preds = %true13, %false14
  br label %break
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
  br i1 %15, label %true, label %false

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %true8, label %false9

20:                                               ; preds = %switch
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
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
  store i32 8, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %9, align 4
  %40 = load i32, ptr %5, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %true11, label %false12

42:                                               ; preds = %switch
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
  store i32 10, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %9, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %9, align 4
  store i32 8, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
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
  br i1 %64, label %true14, label %false15

65:                                               ; preds = %switch
  %66 = load i32, ptr %5, align 4
  %67 = sub nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %.reload1 = load ptr, ptr %.reg2mem, align 8
  %69 = getelementptr inbounds i32, ptr %.reload1, i64 %68
  %70 = load i32, ptr %69, align 4
  store i32 %70, ptr %2, align 4
  store i32 1, ptr %10, align 4
  store i32 14, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %.reload = load ptr, ptr %.reg2mem, align 8
  %72 = getelementptr inbounds i32, ptr %.reload, i64 0
  %73 = load i32, ptr %72, align 16
  store i32 %73, ptr %2, align 4
  store i32 1, ptr %10, align 4
  store i32 14, ptr %b, align 4
  br label %break

74:                                               ; preds = %switch
  %75 = load ptr, ptr %7, align 8
  call void @llvm.stackrestore(ptr %75)
  %76 = load i32, ptr %2, align 4
  ret i32 %76

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %11
    i32 1, label %12
    i32 2, label %16
    i32 3, label %20
    i32 4, label %24
    i32 5, label %27
    i32 6, label %28
    i32 7, label %31
    i32 8, label %38
    i32 9, label %42
    i32 10, label %53
    i32 11, label %56
    i32 12, label %65
    i32 13, label %71
    i32 14, label %74
  ]

break:                                            ; preds = %71, %65, %break_con16, %53, %42, %break_con13, %31, %28, %27, %24, %20, %break_con10, %break_con, %11
  br label %switch

true:                                             ; preds = %12
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %12
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true8:                                            ; preds = %16
  store i32 3, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %16
  store i32 4, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %38
  store i32 9, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %38
  store i32 11, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break

true14:                                           ; preds = %56
  store i32 12, ptr %b, align 4
  br label %break_con16

false15:                                          ; preds = %56
  store i32 13, ptr %b, align 4
  br label %break_con16

break_con16:                                      ; preds = %true14, %false15
  br label %break
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
  br i1 %5, label %true, label %false

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_x, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %true2, label %false3

9:                                                ; preds = %switch
  %10 = load i32, ptr @g_x, align 4
  %11 = load i32, ptr %0, align 4
  %12 = add nsw i32 %10, %11
  %13 = load i32, ptr @g_void_result, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr @g_z, align 4
  %17 = load i32, ptr @g_void_result, align 4
  %18 = sub nsw i32 %17, %16
  store i32 %18, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %0, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %0, align 4
  store i32 1, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr @g_void_result, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %2
    i32 2, label %6
    i32 3, label %9
    i32 4, label %15
    i32 5, label %19
    i32 6, label %20
    i32 7, label %23
  ]

break:                                            ; preds = %20, %19, %15, %9, %break_con4, %break_con, %1
  br label %switch

true:                                             ; preds = %2
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %2
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %6
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %true2, label %false3

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr @g_void_result, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr @g_void_result, align 4
  %20 = sub nsw i32 %19, %18
  store i32 %20, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %13
    i32 4, label %17
    i32 5, label %21
    i32 6, label %22
    i32 7, label %25
  ]

break:                                            ; preds = %22, %21, %17, %13, %break_con4, %break_con, %5
  br label %switch

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  %14 = load i32, ptr %6, align 4
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %true2, label %false3

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %18, %19
  %21 = load ptr, ptr %3, align 8
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, ptr %21, i64 %23
  store i32 %20, ptr %24, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %5, align 4
  %27 = load i32, ptr %6, align 4
  %28 = sub nsw i32 %26, %27
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 %28, ptr %32, align 4
  store i32 5, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 8, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %7, align 4
  %40 = load i32, ptr %4, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %true5, label %false6

42:                                               ; preds = %switch
  %43 = load ptr, ptr %3, align 8
  %44 = load i32, ptr %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr @g_void_result, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr @g_void_result, align 4
  store i32 10, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %7, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %7, align 4
  store i32 8, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %17
    i32 4, label %25
    i32 5, label %33
    i32 6, label %34
    i32 7, label %37
    i32 8, label %38
    i32 9, label %42
    i32 10, label %50
    i32 11, label %53
  ]

break:                                            ; preds = %50, %42, %break_con7, %37, %34, %33, %25, %17, %break_con4, %break_con, %8
  br label %switch

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %13
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %13
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %38
  store i32 9, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %38
  store i32 11, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  %15 = icmp sgt i32 %14, 20
  br i1 %15, label %true2, label %false3

16:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %16
    i32 4, label %17
    i32 5, label %23
    i32 6, label %26
    i32 7, label %27
  ]

break:                                            ; preds = %26, %23, %17, %16, %break_con4, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 6, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
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
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %4, align 4
  %18 = sub nsw i32 %17, %16
  store i32 %18, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = srem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %true5, label %false6

23:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  %30 = mul nsw i32 %29, 10
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %4, align 4
  store i32 9, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %4, align 4
  ret i32 %37

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %14
    i32 4, label %15
    i32 5, label %19
    i32 6, label %23
    i32 7, label %24
    i32 8, label %28
    i32 9, label %33
    i32 10, label %36
  ]

break:                                            ; preds = %33, %28, %24, %23, %break_con7, %15, %14, %break_con4, %break_con, %6
  br label %switch

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 10, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %19
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %19
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
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
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  store i32 %13, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %16 = zext i32 %.reload to i64
  %17 = call ptr @llvm.stacksave()
  store ptr %17, ptr %5, align 8
  %18 = alloca i32, i64 %16, align 16
  store ptr %18, ptr %.reg2mem1, align 8
  store i64 %16, ptr %6, align 8
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = icmp sle i32 %20, 0
  br i1 %21, label %true9, label %false10

22:                                               ; preds = %switch
  store i32 16, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %.reload7 = load ptr, ptr %.reg2mem1, align 8
  %25 = getelementptr inbounds i32, ptr %.reload7, i64 0
  store i32 %24, ptr %25, align 16
  store i32 8, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  %28 = icmp sgt i32 %27, 2
  br i1 %28, label %true12, label %false13

29:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %.reload6 = load ptr, ptr %.reg2mem1, align 8
  %31 = getelementptr inbounds i32, ptr %.reload6, i64 0
  %32 = load i32, ptr %31, align 16
  %33 = add nsw i32 %32, 10
  store i32 %33, ptr %31, align 16
  store i32 12, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %4, align 4
  %36 = mul nsw i32 %35, 2
  %.reload5 = load ptr, ptr %.reg2mem1, align 8
  %37 = getelementptr inbounds i32, ptr %.reload5, i64 1
  store i32 %36, ptr %37, align 4
  store i32 12, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %.reload4 = load ptr, ptr %.reg2mem1, align 8
  %39 = getelementptr inbounds i32, ptr %.reload4, i64 0
  %40 = load i32, ptr %39, align 16
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %true15, label %false16

42:                                               ; preds = %switch
  store i32 15, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %44 = getelementptr inbounds i32, ptr %.reload3, i64 0
  %45 = load i32, ptr %44, align 16
  %46 = sub nsw i32 %45, 1
  store i32 %46, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 17, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %48 = getelementptr inbounds i32, ptr %.reload2, i64 0
  %49 = load i32, ptr %48, align 16
  store i32 %49, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 17, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 1, ptr %7, align 4
  store i32 17, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %52)
  %53 = load i32, ptr %2, align 4
  ret i32 %53

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b8 = load i32, ptr %b, align 4
  switch i32 %b8, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %12
    i32 3, label %14
    i32 4, label %15
    i32 5, label %19
    i32 6, label %22
    i32 7, label %23
    i32 8, label %26
    i32 9, label %29
    i32 10, label %30
    i32 11, label %34
    i32 12, label %38
    i32 13, label %42
    i32 14, label %43
    i32 15, label %47
    i32 16, label %50
    i32 17, label %51
  ]

break:                                            ; preds = %50, %47, %43, %42, %break_con17, %34, %30, %29, %break_con14, %23, %22, %break_con11, %15, %14, %12, %break_con, %8
  br label %switch

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true9:                                            ; preds = %19
  store i32 6, ptr %b, align 4
  br label %break_con11

false10:                                          ; preds = %19
  store i32 7, ptr %b, align 4
  br label %break_con11

break_con11:                                      ; preds = %true9, %false10
  br label %break

true12:                                           ; preds = %26
  store i32 9, ptr %b, align 4
  br label %break_con14

false13:                                          ; preds = %26
  store i32 10, ptr %b, align 4
  br label %break_con14

break_con14:                                      ; preds = %true12, %false13
  br label %break

true15:                                           ; preds = %38
  store i32 13, ptr %b, align 4
  br label %break_con17

false16:                                          ; preds = %38
  store i32 14, ptr %b, align 4
  br label %break_con17

break_con17:                                      ; preds = %true15, %false16
  br label %break
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
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  store i32 -1, ptr %2, align 4
  store i32 18, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 4
  %18 = call noalias ptr @malloc(i64 noundef %17) #6
  store ptr %18, ptr %5, align 8
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load ptr, ptr %5, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %true2, label %false3

22:                                               ; preds = %switch
  store i32 -2, ptr %2, align 4
  store i32 18, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %3, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %true5, label %false6

28:                                               ; preds = %switch
  %29 = load i32, ptr %6, align 4
  %30 = srem i32 %29, 2
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %true8, label %false9

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %33, %34
  %36 = load ptr, ptr %5, align 8
  %37 = load i32, ptr %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr %36, i64 %38
  store i32 %35, ptr %39, align 4
  store i32 11, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %6, align 4
  %43 = sub nsw i32 %41, %42
  %44 = load ptr, ptr %5, align 8
  %45 = load i32, ptr %6, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %44, i64 %46
  store i32 %43, ptr %47, align 4
  store i32 11, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 14, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %8, align 4
  %55 = load i32, ptr %3, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %true11, label %false12

57:                                               ; preds = %switch
  %58 = load ptr, ptr %5, align 8
  %59 = load i32, ptr %8, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %58, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %7, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, ptr %7, align 4
  store i32 16, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %66 = load i32, ptr %8, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %8, align 4
  store i32 14, ptr %b, align 4
  br label %break

68:                                               ; preds = %switch
  %69 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %69) #7
  %70 = load i32, ptr %7, align 4
  store i32 %70, ptr %2, align 4
  store i32 18, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %72 = load i32, ptr %2, align 4
  ret i32 %72

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %13
    i32 3, label %14
    i32 4, label %19
    i32 5, label %22
    i32 6, label %23
    i32 7, label %24
    i32 8, label %28
    i32 9, label %32
    i32 10, label %40
    i32 11, label %48
    i32 12, label %49
    i32 13, label %52
    i32 14, label %53
    i32 15, label %57
    i32 16, label %65
    i32 17, label %68
    i32 18, label %71
  ]

break:                                            ; preds = %68, %65, %57, %break_con13, %52, %49, %48, %40, %32, %break_con10, %break_con7, %23, %22, %break_con4, %14, %13, %break_con, %9
  br label %switch

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %19
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %19
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %24
  store i32 8, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %24
  store i32 13, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %28
  store i32 9, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %28
  store i32 10, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %53
  store i32 15, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %53
  store i32 17, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break
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
  br i1 %18, label %true, label %false

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  store i32 %20, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %23 = zext i32 %.reload to i64
  %24 = call ptr @llvm.stacksave()
  store ptr %24, ptr %9, align 8
  %25 = alloca i32, i64 %23, align 16
  store ptr %25, ptr %.reg2mem9, align 8
  store i64 %23, ptr %10, align 8
  store i32 0, ptr %11, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %11, align 4
  store i32 %27, ptr %.reg2mem7, align 4
  store i32 6, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %true17, label %false18

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  store i32 %32, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %35 = icmp slt i32 %.reload8, %.reload2
  br i1 %35, label %true20, label %false21

36:                                               ; preds = %switch
  %37 = load i32, ptr %6, align 4
  %38 = load i32, ptr %11, align 4
  %39 = add nsw i32 %37, %38
  %40 = load i32, ptr %11, align 4
  %41 = sext i32 %40 to i64
  %.reload13 = load ptr, ptr %.reg2mem9, align 8
  %42 = getelementptr inbounds i32, ptr %.reload13, i64 %41
  store i32 %39, ptr %42, align 4
  store i32 11, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %11, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %11, align 4
  store i32 5, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 13, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %12, align 4
  store i32 %48, ptr %.reg2mem14, align 4
  store i32 14, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %5, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %true23, label %false24

52:                                               ; preds = %switch
  %53 = load i32, ptr %5, align 4
  store i32 %53, ptr %.reg2mem3, align 4
  store i32 17, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem3, align 4
  store i32 17, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload15 = load i32, ptr %.reg2mem14, align 4
  %56 = icmp slt i32 %.reload15, %.reload4
  br i1 %56, label %true26, label %false27

57:                                               ; preds = %switch
  %58 = load i32, ptr %12, align 4
  %59 = sext i32 %58 to i64
  %.reload12 = load ptr, ptr %.reg2mem9, align 8
  %60 = getelementptr inbounds i32, ptr %.reload12, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = load i32, ptr %7, align 4
  %63 = icmp sgt i32 %61, %62
  br i1 %63, label %true29, label %false30

64:                                               ; preds = %switch
  store i32 0, ptr %13, align 4
  store i32 20, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %66 = load i32, ptr %13, align 4
  %67 = icmp slt i32 %66, 8
  br i1 %67, label %true32, label %false33

68:                                               ; preds = %switch
  %69 = load i32, ptr %13, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = icmp sgt i32 %72, 0
  br i1 %73, label %true35, label %false36

74:                                               ; preds = %switch
  %75 = load i32, ptr %13, align 4
  %76 = srem i32 %75, 2
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %true38, label %false39

78:                                               ; preds = %switch
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
  store i32 28, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load ptr, ptr %4, align 8
  %92 = icmp ne ptr %91, null
  br i1 %92, label %true41, label %false42

93:                                               ; preds = %switch
  %94 = load ptr, ptr %4, align 8
  %95 = load i32, ptr %94, align 4
  %96 = icmp sgt i32 %95, 0
  br i1 %96, label %true44, label %false45

97:                                               ; preds = %switch
  %98 = load ptr, ptr %4, align 8
  %99 = load i32, ptr %98, align 4
  %100 = load i32, ptr %8, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, ptr %8, align 4
  store i32 27, ptr %b, align 4
  br label %break

102:                                              ; preds = %switch
  store i32 28, ptr %b, align 4
  br label %break

103:                                              ; preds = %switch
  store i32 29, ptr %b, align 4
  br label %break

104:                                              ; preds = %switch
  %105 = load i32, ptr %13, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %13, align 4
  store i32 20, ptr %b, align 4
  br label %break

107:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

108:                                              ; preds = %switch
  %109 = load i32, ptr %12, align 4
  %110 = sext i32 %109 to i64
  %.reload10 = load ptr, ptr %.reg2mem9, align 8
  %111 = getelementptr inbounds i32, ptr %.reload10, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = load i32, ptr %8, align 4
  %114 = sub nsw i32 %113, %112
  store i32 %114, ptr %8, align 4
  store i32 32, ptr %b, align 4
  br label %break

115:                                              ; preds = %switch
  %116 = load i32, ptr %6, align 4
  %117 = srem i32 %116, 3
  %118 = load i32, ptr %7, align 4
  %119 = load i32, ptr %6, align 4
  %120 = sub nsw i32 %119, 1
  %121 = mul nsw i32 5, %120
  %122 = add nsw i32 %118, %121
  %123 = srem i32 %122, 3
  %124 = icmp eq i32 %117, %123
  br i1 %124, label %true47, label %false48

125:                                              ; preds = %switch
  %126 = load i32, ptr %8, align 4
  %127 = add nsw i32 %126, 7
  store i32 %127, ptr %8, align 4
  store i32 34, ptr %b, align 4
  br label %break

128:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

129:                                              ; preds = %switch
  store i32 36, ptr %b, align 4
  br label %break

130:                                              ; preds = %switch
  %131 = load i32, ptr %12, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, ptr %12, align 4
  store i32 13, ptr %b, align 4
  br label %break

133:                                              ; preds = %switch
  %134 = load i32, ptr %8, align 4
  %135 = icmp sgt i32 %134, 0
  br i1 %135, label %true50, label %false51

136:                                              ; preds = %switch
  %137 = load i32, ptr %8, align 4
  store i32 %137, ptr %.reg2mem5, align 4
  store i32 40, ptr %b, align 4
  br label %break

138:                                              ; preds = %switch
  %139 = load i32, ptr %8, align 4
  %140 = sub nsw i32 0, %139
  store i32 %140, ptr %.reg2mem5, align 4
  store i32 40, ptr %b, align 4
  br label %break

141:                                              ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  %142 = load ptr, ptr %9, align 8
  call void @llvm.stackrestore(ptr %142)
  ret i32 %.reload6

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b16 = load i32, ptr %b, align 4
  switch i32 %b16, label %default [
    i32 0, label %14
    i32 1, label %16
    i32 2, label %19
    i32 3, label %21
    i32 4, label %22
    i32 5, label %26
    i32 6, label %28
    i32 7, label %31
    i32 8, label %33
    i32 9, label %34
    i32 10, label %36
    i32 11, label %43
    i32 12, label %46
    i32 13, label %47
    i32 14, label %49
    i32 15, label %52
    i32 16, label %54
    i32 17, label %55
    i32 18, label %57
    i32 19, label %64
    i32 20, label %65
    i32 21, label %68
    i32 22, label %74
    i32 23, label %78
    i32 24, label %90
    i32 25, label %93
    i32 26, label %97
    i32 27, label %102
    i32 28, label %103
    i32 29, label %104
    i32 30, label %107
    i32 31, label %108
    i32 32, label %115
    i32 33, label %125
    i32 34, label %128
    i32 35, label %129
    i32 36, label %130
    i32 37, label %133
    i32 38, label %136
    i32 39, label %138
    i32 40, label %141
  ]

break:                                            ; preds = %138, %136, %break_con52, %130, %129, %128, %125, %break_con49, %108, %107, %104, %103, %102, %97, %break_con46, %break_con43, %78, %break_con40, %break_con37, %break_con34, %64, %break_con31, %break_con28, %54, %52, %break_con25, %47, %46, %43, %36, %break_con22, %33, %31, %break_con19, %26, %22, %21, %19, %break_con, %14
  br label %switch

true:                                             ; preds = %16
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %16
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true17:                                           ; preds = %28
  store i32 7, ptr %b, align 4
  br label %break_con19

false18:                                          ; preds = %28
  store i32 8, ptr %b, align 4
  br label %break_con19

break_con19:                                      ; preds = %true17, %false18
  br label %break

true20:                                           ; preds = %34
  store i32 10, ptr %b, align 4
  br label %break_con22

false21:                                          ; preds = %34
  store i32 12, ptr %b, align 4
  br label %break_con22

break_con22:                                      ; preds = %true20, %false21
  br label %break

true23:                                           ; preds = %49
  store i32 15, ptr %b, align 4
  br label %break_con25

false24:                                          ; preds = %49
  store i32 16, ptr %b, align 4
  br label %break_con25

break_con25:                                      ; preds = %true23, %false24
  br label %break

true26:                                           ; preds = %55
  store i32 18, ptr %b, align 4
  br label %break_con28

false27:                                          ; preds = %55
  store i32 37, ptr %b, align 4
  br label %break_con28

break_con28:                                      ; preds = %true26, %false27
  br label %break

true29:                                           ; preds = %57
  store i32 19, ptr %b, align 4
  br label %break_con31

false30:                                          ; preds = %57
  store i32 31, ptr %b, align 4
  br label %break_con31

break_con31:                                      ; preds = %true29, %false30
  br label %break

true32:                                           ; preds = %65
  store i32 21, ptr %b, align 4
  br label %break_con34

false33:                                          ; preds = %65
  store i32 30, ptr %b, align 4
  br label %break_con34

break_con34:                                      ; preds = %true32, %false33
  br label %break

true35:                                           ; preds = %68
  store i32 22, ptr %b, align 4
  br label %break_con37

false36:                                          ; preds = %68
  store i32 24, ptr %b, align 4
  br label %break_con37

break_con37:                                      ; preds = %true35, %false36
  br label %break

true38:                                           ; preds = %74
  store i32 23, ptr %b, align 4
  br label %break_con40

false39:                                          ; preds = %74
  store i32 24, ptr %b, align 4
  br label %break_con40

break_con40:                                      ; preds = %true38, %false39
  br label %break

true41:                                           ; preds = %90
  store i32 25, ptr %b, align 4
  br label %break_con43

false42:                                          ; preds = %90
  store i32 27, ptr %b, align 4
  br label %break_con43

break_con43:                                      ; preds = %true41, %false42
  br label %break

true44:                                           ; preds = %93
  store i32 26, ptr %b, align 4
  br label %break_con46

false45:                                          ; preds = %93
  store i32 27, ptr %b, align 4
  br label %break_con46

break_con46:                                      ; preds = %true44, %false45
  br label %break

true47:                                           ; preds = %115
  store i32 33, ptr %b, align 4
  br label %break_con49

false48:                                          ; preds = %115
  store i32 34, ptr %b, align 4
  br label %break_con49

break_con49:                                      ; preds = %true47, %false48
  br label %break

true50:                                           ; preds = %133
  store i32 38, ptr %b, align 4
  br label %break_con52

false51:                                          ; preds = %133
  store i32 39, ptr %b, align 4
  br label %break_con52

break_con52:                                      ; preds = %true50, %false51
  br label %break
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
  br i1 %23, label %true, label %false

24:                                               ; preds = %switch
  %25 = load i32, ptr %7, align 4
  store i32 %25, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %28 = zext i32 %.reload to i64
  %29 = call ptr @llvm.stacksave()
  store ptr %29, ptr %12, align 8
  %30 = alloca i32, i64 %28, align 16
  store ptr %30, ptr %.reg2mem9, align 8
  store i64 %28, ptr %13, align 8
  store i32 5, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %8, align 4
  %33 = load i32, ptr %9, align 4
  %34 = icmp sgt i32 %32, %33
  br i1 %34, label %true19, label %false20

35:                                               ; preds = %switch
  %36 = load i32, ptr %10, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %true22, label %false23

38:                                               ; preds = %switch
  %39 = load i32, ptr %9, align 4
  %40 = load i32, ptr %10, align 4
  %41 = icmp sgt i32 %39, %40
  br i1 %41, label %true25, label %false26

42:                                               ; preds = %switch
  %43 = load i32, ptr %8, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %true28, label %false29

45:                                               ; preds = %switch
  store i32 19, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  store i32 0, ptr %14, align 4
  store i32 11, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %14, align 4
  store i32 %48, ptr %.reg2mem7, align 4
  store i32 12, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %7, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %true31, label %false32

52:                                               ; preds = %switch
  %53 = load i32, ptr %7, align 4
  store i32 %53, ptr %.reg2mem1, align 4
  store i32 15, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem1, align 4
  store i32 15, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload8 = load i32, ptr %.reg2mem7, align 4
  %56 = icmp slt i32 %.reload8, %.reload2
  br i1 %56, label %true34, label %false35

57:                                               ; preds = %switch
  %58 = load i32, ptr %8, align 4
  %59 = sub nsw i32 0, %58
  %60 = load i32, ptr %14, align 4
  %61 = add nsw i32 %59, %60
  %62 = load i32, ptr %14, align 4
  %63 = sext i32 %62 to i64
  %.reload15 = load ptr, ptr %.reg2mem9, align 8
  %64 = getelementptr inbounds i32, ptr %.reload15, i64 %63
  store i32 %61, ptr %64, align 4
  store i32 17, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %66 = load i32, ptr %14, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %14, align 4
  store i32 11, ptr %b, align 4
  br label %break

68:                                               ; preds = %switch
  %.reload14 = load ptr, ptr %.reg2mem9, align 8
  %69 = getelementptr inbounds i32, ptr %.reload14, i64 0
  %70 = load i32, ptr %69, align 16
  %71 = load i32, ptr %11, align 4
  %72 = sub nsw i32 %71, %70
  store i32 %72, ptr %11, align 4
  store i32 42, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  store i32 0, ptr %15, align 4
  store i32 20, ptr %b, align 4
  br label %break

74:                                               ; preds = %switch
  %75 = load i32, ptr %15, align 4
  store i32 %75, ptr %.reg2mem16, align 4
  store i32 21, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load i32, ptr %7, align 4
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %true37, label %false38

79:                                               ; preds = %switch
  %80 = load i32, ptr %7, align 4
  store i32 %80, ptr %.reg2mem3, align 4
  store i32 24, ptr %b, align 4
  br label %break

81:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem3, align 4
  store i32 24, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  %.reload17 = load i32, ptr %.reg2mem16, align 4
  %83 = icmp slt i32 %.reload17, %.reload4
  br i1 %83, label %true40, label %false41

84:                                               ; preds = %switch
  %85 = load i32, ptr %9, align 4
  %86 = load i32, ptr %15, align 4
  %87 = add nsw i32 %85, %86
  %88 = load i32, ptr %15, align 4
  %89 = sext i32 %88 to i64
  %.reload13 = load ptr, ptr %.reg2mem9, align 8
  %90 = getelementptr inbounds i32, ptr %.reload13, i64 %89
  store i32 %87, ptr %90, align 4
  store i32 26, ptr %b, align 4
  br label %break

91:                                               ; preds = %switch
  %92 = load i32, ptr %15, align 4
  %93 = sext i32 %92 to i64
  %.reload12 = load ptr, ptr %.reg2mem9, align 8
  %94 = getelementptr inbounds i32, ptr %.reload12, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = load i32, ptr @g_z, align 4
  %97 = icmp sgt i32 %95, %96
  br i1 %97, label %true43, label %false44

98:                                               ; preds = %switch
  %99 = load ptr, ptr %6, align 8
  %100 = load i32, ptr %99, align 4
  %101 = icmp sgt i32 %100, 0
  br i1 %101, label %true46, label %false47

102:                                              ; preds = %switch
  %103 = load i32, ptr %15, align 4
  %104 = sext i32 %103 to i64
  %.reload11 = load ptr, ptr %.reg2mem9, align 8
  %105 = getelementptr inbounds i32, ptr %.reload11, i64 %104
  %106 = load i32, ptr %105, align 4
  %107 = load i32, ptr %11, align 4
  %108 = add nsw i32 %107, %106
  store i32 %108, ptr %11, align 4
  store i32 30, ptr %b, align 4
  br label %break

109:                                              ; preds = %switch
  %110 = load i32, ptr %15, align 4
  %111 = sext i32 %110 to i64
  %.reload10 = load ptr, ptr %.reg2mem9, align 8
  %112 = getelementptr inbounds i32, ptr %.reload10, i64 %111
  %113 = load i32, ptr %112, align 4
  %114 = load i32, ptr %11, align 4
  %115 = sub nsw i32 %114, %113
  store i32 %115, ptr %11, align 4
  store i32 30, ptr %b, align 4
  br label %break

116:                                              ; preds = %switch
  store i32 34, ptr %b, align 4
  br label %break

117:                                              ; preds = %switch
  %118 = load i32, ptr %15, align 4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %true49, label %false50

120:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

121:                                              ; preds = %switch
  %122 = load i32, ptr %11, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, ptr %11, align 4
  store i32 34, ptr %b, align 4
  br label %break

124:                                              ; preds = %switch
  store i32 35, ptr %b, align 4
  br label %break

125:                                              ; preds = %switch
  %126 = load i32, ptr %11, align 4
  %127 = load ptr, ptr %6, align 8
  %128 = load i32, ptr %15, align 4
  %129 = srem i32 %128, 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, ptr %127, i64 %130
  store i32 %126, ptr %131, align 4
  store i32 36, ptr %b, align 4
  br label %break

132:                                              ; preds = %switch
  %133 = load i32, ptr %15, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %15, align 4
  store i32 20, ptr %b, align 4
  br label %break

135:                                              ; preds = %switch
  %136 = load i32, ptr %11, align 4
  %137 = load i32, ptr @g_z, align 4
  %138 = icmp sgt i32 %136, %137
  br i1 %138, label %true52, label %false53

139:                                              ; preds = %switch
  %140 = load i32, ptr %8, align 4
  %141 = load i32, ptr %9, align 4
  %142 = load i32, ptr %10, align 4
  %143 = sdiv i32 %142, 10
  %144 = load i32, ptr %8, align 4
  %145 = sub nsw i32 %144, 1
  %146 = mul nsw i32 %143, %145
  %147 = add nsw i32 %141, %146
  %148 = icmp eq i32 %140, %147
  br i1 %148, label %true55, label %false56

149:                                              ; preds = %switch
  %150 = load i32, ptr %11, align 4
  %151 = add nsw i32 %150, 100
  store i32 %151, ptr %5, align 4
  store i32 1, ptr %16, align 4
  store i32 46, ptr %b, align 4
  br label %break

152:                                              ; preds = %switch
  %153 = load i32, ptr %11, align 4
  %154 = add nsw i32 %153, 200
  store i32 %154, ptr %5, align 4
  store i32 1, ptr %16, align 4
  store i32 46, ptr %b, align 4
  br label %break

155:                                              ; preds = %switch
  store i32 42, ptr %b, align 4
  br label %break

156:                                              ; preds = %switch
  %157 = load i32, ptr %11, align 4
  %158 = icmp sgt i32 %157, 0
  br i1 %158, label %true58, label %false59

159:                                              ; preds = %switch
  %160 = load i32, ptr %11, align 4
  %161 = mul nsw i32 %160, 2
  store i32 %161, ptr %.reg2mem5, align 4
  store i32 45, ptr %b, align 4
  br label %break

162:                                              ; preds = %switch
  %163 = load i32, ptr %11, align 4
  %164 = sub nsw i32 0, %163
  store i32 %164, ptr %.reg2mem5, align 4
  store i32 45, ptr %b, align 4
  br label %break

165:                                              ; preds = %switch
  %.reload6 = load i32, ptr %.reg2mem5, align 4
  store i32 %.reload6, ptr %5, align 4
  store i32 1, ptr %16, align 4
  store i32 46, ptr %b, align 4
  br label %break

166:                                              ; preds = %switch
  %167 = load ptr, ptr %12, align 8
  call void @llvm.stackrestore(ptr %167)
  %168 = load i32, ptr %5, align 4
  ret i32 %168

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b18 = load i32, ptr %b, align 4
  switch i32 %b18, label %default [
    i32 0, label %17
    i32 1, label %21
    i32 2, label %24
    i32 3, label %26
    i32 4, label %27
    i32 5, label %31
    i32 6, label %35
    i32 7, label %38
    i32 8, label %42
    i32 9, label %45
    i32 10, label %46
    i32 11, label %47
    i32 12, label %49
    i32 13, label %52
    i32 14, label %54
    i32 15, label %55
    i32 16, label %57
    i32 17, label %65
    i32 18, label %68
    i32 19, label %73
    i32 20, label %74
    i32 21, label %76
    i32 22, label %79
    i32 23, label %81
    i32 24, label %82
    i32 25, label %84
    i32 26, label %91
    i32 27, label %98
    i32 28, label %102
    i32 29, label %109
    i32 30, label %116
    i32 31, label %117
    i32 32, label %120
    i32 33, label %121
    i32 34, label %124
    i32 35, label %125
    i32 36, label %132
    i32 37, label %135
    i32 38, label %139
    i32 39, label %149
    i32 40, label %152
    i32 41, label %155
    i32 42, label %156
    i32 43, label %159
    i32 44, label %162
    i32 45, label %165
    i32 46, label %166
  ]

break:                                            ; preds = %165, %162, %159, %break_con60, %155, %152, %149, %break_con57, %break_con54, %132, %125, %124, %121, %120, %break_con51, %116, %109, %102, %break_con48, %break_con45, %84, %break_con42, %81, %79, %break_con39, %74, %73, %68, %65, %57, %break_con36, %54, %52, %break_con33, %47, %46, %45, %break_con30, %break_con27, %break_con24, %break_con21, %27, %26, %24, %break_con, %17
  br label %switch

true:                                             ; preds = %21
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %21
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true19:                                           ; preds = %31
  store i32 6, ptr %b, align 4
  br label %break_con21

false20:                                          ; preds = %31
  store i32 7, ptr %b, align 4
  br label %break_con21

break_con21:                                      ; preds = %true19, %false20
  br label %break

true22:                                           ; preds = %35
  store i32 9, ptr %b, align 4
  br label %break_con24

false23:                                          ; preds = %35
  store i32 7, ptr %b, align 4
  br label %break_con24

break_con24:                                      ; preds = %true22, %false23
  br label %break

true25:                                           ; preds = %38
  store i32 8, ptr %b, align 4
  br label %break_con27

false26:                                          ; preds = %38
  store i32 10, ptr %b, align 4
  br label %break_con27

break_con27:                                      ; preds = %true25, %false26
  br label %break

true28:                                           ; preds = %42
  store i32 9, ptr %b, align 4
  br label %break_con30

false29:                                          ; preds = %42
  store i32 10, ptr %b, align 4
  br label %break_con30

break_con30:                                      ; preds = %true28, %false29
  br label %break

true31:                                           ; preds = %49
  store i32 13, ptr %b, align 4
  br label %break_con33

false32:                                          ; preds = %49
  store i32 14, ptr %b, align 4
  br label %break_con33

break_con33:                                      ; preds = %true31, %false32
  br label %break

true34:                                           ; preds = %55
  store i32 16, ptr %b, align 4
  br label %break_con36

false35:                                          ; preds = %55
  store i32 18, ptr %b, align 4
  br label %break_con36

break_con36:                                      ; preds = %true34, %false35
  br label %break

true37:                                           ; preds = %76
  store i32 22, ptr %b, align 4
  br label %break_con39

false38:                                          ; preds = %76
  store i32 23, ptr %b, align 4
  br label %break_con39

break_con39:                                      ; preds = %true37, %false38
  br label %break

true40:                                           ; preds = %82
  store i32 25, ptr %b, align 4
  br label %break_con42

false41:                                          ; preds = %82
  store i32 37, ptr %b, align 4
  br label %break_con42

break_con42:                                      ; preds = %true40, %false41
  br label %break

true43:                                           ; preds = %91
  store i32 27, ptr %b, align 4
  br label %break_con45

false44:                                          ; preds = %91
  store i32 31, ptr %b, align 4
  br label %break_con45

break_con45:                                      ; preds = %true43, %false44
  br label %break

true46:                                           ; preds = %98
  store i32 28, ptr %b, align 4
  br label %break_con48

false47:                                          ; preds = %98
  store i32 29, ptr %b, align 4
  br label %break_con48

break_con48:                                      ; preds = %true46, %false47
  br label %break

true49:                                           ; preds = %117
  store i32 32, ptr %b, align 4
  br label %break_con51

false50:                                          ; preds = %117
  store i32 33, ptr %b, align 4
  br label %break_con51

break_con51:                                      ; preds = %true49, %false50
  br label %break

true52:                                           ; preds = %135
  store i32 38, ptr %b, align 4
  br label %break_con54

false53:                                          ; preds = %135
  store i32 41, ptr %b, align 4
  br label %break_con54

break_con54:                                      ; preds = %true52, %false53
  br label %break

true55:                                           ; preds = %139
  store i32 39, ptr %b, align 4
  br label %break_con57

false56:                                          ; preds = %139
  store i32 40, ptr %b, align 4
  br label %break_con57

break_con57:                                      ; preds = %true55, %false56
  br label %break

true58:                                           ; preds = %156
  store i32 43, ptr %b, align 4
  br label %break_con60

false59:                                          ; preds = %156
  store i32 44, ptr %b, align 4
  br label %break_con60

break_con60:                                      ; preds = %true58, %false59
  br label %break
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
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 1
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 @atoi(ptr noundef %15) #8
  store i32 %16, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 4, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
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
  store i32 5, ptr %b, align 4
  br label %break

184:                                              ; preds = %switch
  %185 = load i32, ptr %5, align 4
  %186 = icmp sgt i32 %185, 0
  br i1 %186, label %true4, label %false5

187:                                              ; preds = %switch
  %188 = load i32, ptr %5, align 4
  %189 = icmp slt i32 %188, 8
  br i1 %189, label %true7, label %false8

190:                                              ; preds = %switch
  %191 = load i32, ptr %5, align 4
  store i32 %191, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

192:                                              ; preds = %switch
  store i32 4, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

193:                                              ; preds = %switch
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

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %12
    i32 3, label %17
    i32 4, label %18
    i32 5, label %184
    i32 6, label %187
    i32 7, label %190
    i32 8, label %192
    i32 9, label %193
  ]

break:                                            ; preds = %192, %190, %break_con9, %break_con6, %18, %17, %12, %break_con, %8
  br label %switch

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true4:                                            ; preds = %184
  store i32 6, ptr %b, align 4
  br label %break_con6

false5:                                           ; preds = %184
  store i32 8, ptr %b, align 4
  br label %break_con6

break_con6:                                       ; preds = %true4, %false5
  br label %break

true7:                                            ; preds = %187
  store i32 7, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %187
  store i32 8, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break
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
