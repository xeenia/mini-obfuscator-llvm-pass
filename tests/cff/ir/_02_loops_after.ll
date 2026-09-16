; ModuleID = '_02_loops.bc'
source_filename = "_02_loops.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_x = dso_local global i32 10, align 4
@g_y = dso_local global i32 -3, align 4
@g_z = dso_local global i32 7, align 4
@g_n = dso_local global i32 4, align 4
@g_limit = dso_local global i32 10, align 4
@g_step = dso_local global i32 0, align 4
@g_arr = dso_local global [8 x i32] [i32 0, i32 1, i32 -2, i32 3, i32 -4, i32 5, i32 6, i32 -7], align 16
@g_mat = dso_local global [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 7, i32 8, i32 9]], align 16
@g_void_result = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@__const.main.pointer_data = private unnamed_addr constant [8 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_0_for_simple(i32 noundef %0) #0 {
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
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %14
    i32 4, label %17
  ]

break:                                            ; preds = %14, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_1_while_simple(i32 noundef %0) #0 {
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
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  ret i32 %17

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %16
  ]

break:                                            ; preds = %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_2_dowhile_simple(i32 noundef %0) #0 {
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
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  %15 = select i1 %14, i32 1, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  ret i32 %17

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %11
    i32 3, label %16
  ]

break:                                            ; preds = %11, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_3_for_empty_body(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %5, %6
  %8 = select i1 %7, i32 2, i32 4
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  store i32 3, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %2, align 4
  store i32 1, ptr %b, align 4
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
    i32 1, label %4
    i32 2, label %9
    i32 3, label %10
    i32 4, label %13
  ]

break:                                            ; preds = %10, %9, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_4_while_true_break(i32 noundef %0) #0 {
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
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 1, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %11
    i32 3, label %16
    i32 4, label %17
    i32 5, label %18
  ]

break:                                            ; preds = %17, %16, %11, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_5_for_continue(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 7
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = srem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  %15 = zext i1 %14 to i8
  store i8 %15, ptr %4, align 1
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i8, ptr %4, align 1
  %18 = trunc i8 %17 to i1
  %19 = select i1 %18, i32 4, i32 5
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %2, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %3, align 4
  store i32 1, ptr %b, align 4
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
    i32 2, label %11
    i32 3, label %16
    i32 4, label %20
    i32 5, label %21
    i32 6, label %25
    i32 7, label %28
  ]

break:                                            ; preds = %25, %21, %20, %16, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_6_relational_loop(i32 noundef %0, i32 noundef %1) #0 {
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
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %9, %10
  %12 = select i1 %11, i32 2, i32 4
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
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
    i32 1, label %8
    i32 2, label %13
    i32 3, label %17
    i32 4, label %20
  ]

break:                                            ; preds = %17, %13, %8, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_7_not_equal_loop(i32 noundef %0) #0 {
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
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp ne i32 %6, %7
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %1, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = zext i1 %15 to i64
  %17 = select i1 %15, i32 1, i32 -1
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  ret i32 %21

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %20
  ]

break:                                            ; preds = %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_8_loop_and(i32 noundef %0, i32 noundef %1) #0 {
entry:
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
  store i1 false, ptr %.reg2mem, align 1
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  store i1 %15, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %17 = select i1 %.reload, i32 4, i32 5
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %5, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %16
    i32 4, label %18
    i32 5, label %24
  ]

break:                                            ; preds = %18, %16, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_9_loop_or(i32 noundef %0, i32 noundef %1) #0 {
entry:
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
  store i1 true, ptr %.reg2mem, align 1
  %11 = select i1 %10, i32 3, i32 2
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  store i1 %15, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %17 = select i1 %.reload, i32 4, i32 5
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %5, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  ret i32 %25

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %16
    i32 4, label %18
    i32 5, label %24
  ]

break:                                            ; preds = %18, %16, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_10_nested_loop_condition(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem = alloca i1, align 1
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
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i32 1, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %12, %13
  %15 = select i1 %14, i32 2, i32 4
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  store i1 true, ptr %.reg2mem1, align 1
  %20 = select i1 %19, i32 7, i32 3
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %6, align 4
  %24 = icmp eq i32 %22, %23
  store i1 true, ptr %.reg2mem1, align 1
  %25 = select i1 %24, i32 7, i32 4
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %8, align 4
  %28 = load i32, ptr %7, align 4
  %29 = icmp eq i32 %27, %28
  store i1 false, ptr %.reg2mem, align 1
  %30 = select i1 %29, i32 5, i32 6
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %8, align 4
  %33 = load i32, ptr %4, align 4
  %34 = icmp slt i32 %32, %33
  store i1 %34, ptr %.reg2mem, align 1
  store i32 6, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  store i32 7, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %37 = select i1 %.reload2, i32 8, i32 12
  store i32 %37, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %8, align 4
  %40 = load i32, ptr %9, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %9, align 4
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %8, align 4
  store i32 9, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %8, align 4
  %46 = icmp sgt i32 %45, 20
  %47 = select i1 %46, i32 10, i32 11
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 1, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %9, align 4
  ret i32 %51

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %10
    i32 1, label %11
    i32 2, label %16
    i32 3, label %21
    i32 4, label %26
    i32 5, label %31
    i32 6, label %35
    i32 7, label %36
    i32 8, label %38
    i32 9, label %44
    i32 10, label %48
    i32 11, label %49
    i32 12, label %50
  ]

break:                                            ; preds = %49, %48, %44, %38, %36, %35, %31, %26, %21, %16, %11, %10
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_11_arithmetic_loop(i32 noundef %0) #0 {
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
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 3
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 1
  %15 = mul nsw i32 %14, 2
  %16 = add nsw i32 %12, %15
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %19
    i32 4, label %22
  ]

break:                                            ; preds = %19, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_12_nested_arithmetic_loop(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
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
  %9 = select i1 %8, i32 2, i32 7
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 1
  %15 = mul nsw i32 0, %14
  %16 = add nsw i32 %12, %15
  %17 = icmp eq i32 %11, %16
  %18 = select i1 %17, i32 3, i32 4
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  %21 = mul nsw i32 %20, 2
  store i32 %21, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 3
  store i32 %24, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %26, %.reload
  store i32 %27, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %2, align 4
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %19
    i32 4, label %22
    i32 5, label %25
    i32 6, label %28
    i32 7, label %31
  ]

break:                                            ; preds = %28, %25, %22, %19, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_13_ternary_loop_body(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
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
  %9 = select i1 %8, i32 2, i32 7
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
  %16 = load i32, ptr %3, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = mul nsw i32 %19, 3
  store i32 %20, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, %.reload
  store i32 %23, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %2, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %15
    i32 4, label %18
    i32 5, label %21
    i32 6, label %24
    i32 7, label %27
  ]

break:                                            ; preds = %24, %21, %18, %15, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_14_multiple_accumulators(i32 noundef %0) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 11
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = srem i32 %13, 2
  %15 = icmp eq i32 %14, 0
  %16 = select i1 %15, i32 3, i32 4
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  store i32 %18, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, %.reload
  store i32 %22, ptr %2, align 4
  store i32 6, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %5, align 4
  %25 = srem i32 %24, 2
  %26 = icmp ne i32 %25, 0
  %27 = select i1 %26, i32 7, i32 8
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  store i32 0, ptr %.reg2mem1, align 4
  store i32 9, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, %.reload2
  store i32 %33, ptr %3, align 4
  %34 = load i32, ptr %5, align 4
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %2, align 4
  %42 = load i32, ptr %3, align 4
  %43 = add nsw i32 %41, %42
  %44 = load i32, ptr %4, align 4
  %45 = add nsw i32 %43, %44
  ret i32 %45

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %17
    i32 4, label %19
    i32 5, label %20
    i32 6, label %23
    i32 7, label %28
    i32 8, label %30
    i32 9, label %31
    i32 10, label %37
    i32 11, label %40
  ]

break:                                            ; preds = %37, %31, %30, %28, %23, %20, %19, %17, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_15_nested_for(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 8
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %1, align 4
  %15 = icmp slt i32 %13, %14
  %16 = select i1 %15, i32 4, i32 6
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %2, align 4
  ret i32 %31

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
    i32 5, label %23
    i32 6, label %26
    i32 7, label %27
    i32 8, label %30
  ]

break:                                            ; preds = %27, %26, %23, %17, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_16_for_while(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 7
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %13, %14
  %16 = select i1 %15, i32 4, i32 5
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = mul nsw i32 %18, %19
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %2, align 4
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %2, align 4
  ret i32 %30

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
    i32 5, label %25
    i32 6, label %26
    i32 7, label %29
  ]

break:                                            ; preds = %26, %25, %17, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_17_while_dowhile(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 6
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %4, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = icmp slt i32 %21, 2
  %23 = select i1 %22, i32 3, i32 5
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %12
    i32 4, label %20
    i32 5, label %24
    i32 6, label %27
  ]

break:                                            ; preds = %24, %20, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_18_triple_for(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 12
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %1, align 4
  %16 = icmp slt i32 %14, %15
  %17 = select i1 %16, i32 4, i32 10
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %20, 2
  %22 = select i1 %21, i32 6, i32 8
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr %2, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %4, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %3, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %2, align 4
  ret i32 %43

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %13
    i32 4, label %18
    i32 5, label %19
    i32 6, label %23
    i32 7, label %31
    i32 8, label %34
    i32 9, label %35
    i32 10, label %38
    i32 11, label %39
    i32 12, label %42
  ]

break:                                            ; preds = %39, %38, %35, %34, %31, %23, %19, %18, %13, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_19_mixed_nested_loops(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 10
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 3
  %16 = select i1 %15, i32 4, i32 8
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %2, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %29, 2
  %31 = select i1 %30, i32 5, i32 7
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %3, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %2, align 4
  ret i32 %40

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %13
    i32 4, label %17
    i32 5, label %18
    i32 6, label %28
    i32 7, label %32
    i32 8, label %35
    i32 9, label %36
    i32 10, label %39
  ]

break:                                            ; preds = %36, %35, %32, %28, %18, %17, %13, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_20_inner_break(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 11
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %1, align 4
  %15 = icmp slt i32 %13, %14
  %16 = select i1 %15, i32 4, i32 9
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  %25 = icmp sge i32 %24, 2
  %26 = select i1 %25, i32 6, i32 7
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %3, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %3, align 4
  store i32 1, ptr %b, align 4
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
    i32 2, label %11
    i32 3, label %12
    i32 4, label %17
    i32 5, label %23
    i32 6, label %27
    i32 7, label %28
    i32 8, label %29
    i32 9, label %32
    i32 10, label %33
    i32 11, label %36
  ]

break:                                            ; preds = %33, %32, %29, %28, %27, %23, %17, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_21_inner_continue(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 11
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %1, align 4
  %16 = icmp slt i32 %14, %15
  %17 = select i1 %16, i32 4, i32 9
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = srem i32 %19, 2
  %21 = icmp eq i32 %20, 0
  %22 = zext i1 %21 to i8
  store i8 %22, ptr %5, align 1
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i8, ptr %5, align 1
  %25 = trunc i8 %24 to i1
  %26 = select i1 %25, i32 6, i32 7
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %2, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %3, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %2, align 4
  ret i32 %42

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %13
    i32 4, label %18
    i32 5, label %23
    i32 6, label %27
    i32 7, label %28
    i32 8, label %34
    i32 9, label %37
    i32 10, label %38
    i32 11, label %41
  ]

break:                                            ; preds = %38, %37, %34, %28, %27, %23, %18, %13, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_22_break_with_ternary(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 12
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = icmp sgt i32 %13, 3
  %15 = zext i1 %14 to i64
  %16 = select i1 %14, i32 1, i32 0
  store i32 %16, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %1, align 4
  %20 = icmp slt i32 %18, %19
  %21 = select i1 %20, i32 4, i32 10
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %4, align 4
  %30 = icmp ne i32 %29, 0
  %31 = select i1 %30, i32 6, i32 8
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %5, align 4
  %34 = icmp sge i32 %33, 2
  %35 = select i1 %34, i32 7, i32 8
  store i32 %35, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %3, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %2, align 4
  ret i32 %46

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %17
    i32 4, label %22
    i32 5, label %28
    i32 6, label %32
    i32 7, label %36
    i32 8, label %37
    i32 9, label %38
    i32 10, label %41
    i32 11, label %42
    i32 12, label %45
  ]

break:                                            ; preds = %42, %41, %38, %37, %36, %32, %28, %22, %17, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_23_continue_and_break(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 13
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %1, align 4
  %15 = icmp slt i32 %13, %14
  %16 = select i1 %15, i32 4, i32 11
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %4, align 4
  %22 = srem i32 %21, 2
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 6, i32 7
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %27, %28
  %30 = load i32, ptr %2, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %2, align 4
  store i32 8, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %2, align 4
  %34 = icmp sgt i32 %33, 30
  %35 = select i1 %34, i32 9, i32 10
  store i32 %35, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 3, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %3, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %2, align 4
  ret i32 %43

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
    i32 5, label %20
    i32 6, label %25
    i32 7, label %26
    i32 8, label %32
    i32 9, label %36
    i32 10, label %37
    i32 11, label %38
    i32 12, label %39
    i32 13, label %42
  ]

break:                                            ; preds = %39, %38, %37, %36, %32, %26, %25, %20, %17, %12, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_24_early_return(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
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
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = icmp sgt i32 %16, 20
  %18 = select i1 %17, i32 4, i32 5
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  store i32 %20, ptr %1, align 4
  store i32 8, ptr %b, align 4
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
  %26 = load i32, ptr %3, align 4
  store i32 %26, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %1, align 4
  ret i32 %28

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
    i32 5, label %21
    i32 6, label %22
    i32 7, label %25
    i32 8, label %27
  ]

break:                                            ; preds = %25, %22, %21, %19, %15, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_25_nested_early_return(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 11
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %14, %15
  %17 = select i1 %16, i32 4, i32 9
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = icmp sgt i32 %25, 40
  %27 = select i1 %26, i32 6, i32 7
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  store i32 %29, ptr %1, align 4
  store i32 12, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %4, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %3, align 4
  store i32 %39, ptr %1, align 4
  store i32 12, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %1, align 4
  ret i32 %41

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %13
    i32 4, label %18
    i32 5, label %24
    i32 6, label %28
    i32 7, label %30
    i32 8, label %31
    i32 9, label %34
    i32 10, label %35
    i32 11, label %38
    i32 12, label %40
  ]

break:                                            ; preds = %38, %35, %34, %31, %30, %28, %24, %18, %13, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_26_multiple_returns(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  %8 = select i1 %7, i32 2, i32 6
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 20
  %16 = select i1 %15, i32 4, i32 5
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  store i32 %18, ptr %1, align 4
  store i32 7, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  store i32 %23, ptr %1, align 4
  store i32 7, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %1, align 4
  ret i32 %25

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
    i32 5, label %19
    i32 6, label %22
    i32 7, label %24
  ]

break:                                            ; preds = %22, %19, %17, %13, %9, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_27_dowhile_return(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr %4, align 4
  store i32 2, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = icmp sge i32 %11, %12
  %14 = select i1 %13, i32 3, i32 4
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  store i32 %16, ptr %1, align 4
  store i32 7, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 1, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  store i32 %22, ptr %1, align 4
  store i32 7, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %1, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %15
    i32 4, label %17
    i32 5, label %20
    i32 6, label %21
    i32 7, label %23
  ]

break:                                            ; preds = %21, %20, %17, %15, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_28_for_while_for(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 11
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 3
  %16 = select i1 %15, i32 4, i32 9
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = icmp slt i32 %19, 2
  %21 = select i1 %20, i32 6, i32 8
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %2, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %2, align 4
  ret i32 %41

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %13
    i32 4, label %17
    i32 5, label %18
    i32 6, label %22
    i32 7, label %30
    i32 8, label %33
    i32 9, label %36
    i32 10, label %37
    i32 11, label %40
  ]

break:                                            ; preds = %37, %36, %33, %30, %22, %18, %17, %13, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_29_while_for_dowhile(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %2, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 10
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 3
  %16 = select i1 %15, i32 4, i32 9
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %3, align 4
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %29, 2
  %31 = select i1 %30, i32 5, i32 7
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %2, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %3, align 4
  ret i32 %40

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %13
    i32 4, label %17
    i32 5, label %18
    i32 6, label %28
    i32 7, label %32
    i32 8, label %33
    i32 9, label %36
    i32 10, label %39
  ]

break:                                            ; preds = %36, %33, %32, %28, %18, %17, %13, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_30_four_level_nesting(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %1, align 4
  %11 = icmp slt i32 %9, %10
  %12 = select i1 %11, i32 2, i32 16
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %15, 2
  %17 = select i1 %16, i32 4, i32 14
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %20, 2
  %22 = select i1 %21, i32 6, i32 12
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = icmp slt i32 %25, 2
  %27 = select i1 %26, i32 8, i32 10
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %33, %34
  %36 = load i32, ptr %2, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %6, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %6, align 4
  store i32 7, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %4, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 15, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %3, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %2, align 4
  ret i32 %54

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %13
    i32 3, label %14
    i32 4, label %18
    i32 5, label %19
    i32 6, label %23
    i32 7, label %24
    i32 8, label %28
    i32 9, label %38
    i32 10, label %41
    i32 11, label %42
    i32 12, label %45
    i32 13, label %46
    i32 14, label %49
    i32 15, label %50
    i32 16, label %53
  ]

break:                                            ; preds = %50, %49, %46, %45, %42, %41, %38, %28, %24, %23, %19, %18, %14, %13, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_31_multiple_loop_variables(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %6 = load i32, ptr %1, align 4
  store i32 %6, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 4
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  %16 = load i32, ptr %2, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, -1
  store i32 %22, ptr %4, align 4
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
    i32 0, label %5
    i32 1, label %7
    i32 2, label %12
    i32 3, label %18
    i32 4, label %23
  ]

break:                                            ; preds = %18, %12, %7, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_32_complex_update(i32 noundef %0) #0 {
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
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 2
  store i32 %16, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %14
    i32 4, label %17
  ]

break:                                            ; preds = %14, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_33_decreasing_loop(i32 noundef %0) #0 {
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
  %5 = load i32, ptr %1, align 4
  store i32 %5, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  ret i32 %18

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %6
    i32 2, label %10
    i32 3, label %14
    i32 4, label %17
  ]

break:                                            ; preds = %14, %10, %6, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_34_multiple_condition_values(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem = alloca i1, align 1
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
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %10, %11
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %15, %16
  store i1 true, ptr %.reg2mem1, align 1
  %18 = select i1 %17, i32 6, i32 3
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %6, align 4
  %21 = load i32, ptr %5, align 4
  %22 = icmp slt i32 %20, %21
  store i1 false, ptr %.reg2mem, align 1
  %23 = select i1 %22, i32 4, i32 5
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %6, align 4
  %26 = icmp slt i32 %25, 10
  store i1 %26, ptr %.reg2mem, align 1
  store i32 5, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  store i32 6, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %29 = select i1 %.reload2, i32 7, i32 8
  store i32 %29, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %7, align 4
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %7, align 4
  ret i32 %37

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %14
    i32 3, label %19
    i32 4, label %24
    i32 5, label %27
    i32 6, label %28
    i32 7, label %30
    i32 8, label %36
  ]

break:                                            ; preds = %30, %28, %27, %24, %19, %14, %9, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_35_computed_loop_limit(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
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
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %9, %10
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  store i32 %14, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  store i32 %16, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp slt i32 %19, %20
  %22 = select i1 %21, i32 6, i32 8
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %4, align 4
  %26 = mul nsw i32 %24, %25
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %5, align 4
  store i32 7, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %5, align 4
  ret i32 %33

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %13
    i32 3, label %15
    i32 4, label %17
    i32 5, label %18
    i32 6, label %23
    i32 7, label %29
    i32 8, label %32
  ]

break:                                            ; preds = %29, %23, %18, %17, %15, %13, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_36_array_for(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %1, align 4
  store i32 %11, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 8, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %3, align 4
  %17 = icmp slt i32 %15, %16
  %18 = select i1 %17, i32 6, i32 8
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %2, align 4
  store i32 7, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %2, align 4
  ret i32 %30

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %12
    i32 4, label %13
    i32 5, label %14
    i32 6, label %19
    i32 7, label %26
    i32 8, label %29
  ]

break:                                            ; preds = %26, %19, %14, %13, %12, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_37_array_while(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %1, align 4
  store i32 %11, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 8, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %15, %16
  %18 = select i1 %17, i32 6, i32 7
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %3, align 4
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %2, align 4
  store i32 5, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  ret i32 %29

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %12
    i32 4, label %13
    i32 5, label %14
    i32 6, label %19
    i32 7, label %28
  ]

break:                                            ; preds = %19, %14, %13, %12, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_38_matrix_nested(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %8, 3
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %1, align 4
  store i32 %12, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  store i32 3, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %3, align 4
  %18 = icmp slt i32 %16, %17
  %19 = select i1 %18, i32 6, i32 12
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 7, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %22, 3
  %24 = select i1 %23, i32 8, i32 10
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %27
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x i32], ptr %28, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = load i32, ptr %2, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %2, align 4
  store i32 9, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %5, align 4
  store i32 7, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %4, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %2, align 4
  ret i32 %43

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %13
    i32 4, label %14
    i32 5, label %15
    i32 6, label %20
    i32 7, label %21
    i32 8, label %25
    i32 9, label %35
    i32 10, label %38
    i32 11, label %39
    i32 12, label %42
  ]

break:                                            ; preds = %39, %38, %35, %25, %21, %20, %15, %14, %13, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_39_array_controlled_loop(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i1, align 1
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  store i1 false, ptr %.reg2mem, align 1
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = icmp slt i32 %12, 8
  store i1 %13, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %15 = select i1 %.reload, i32 4, i32 5
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = icmp sge i32 %20, 0
  %22 = zext i1 %21 to i64
  %23 = select i1 %21, i32 1, i32 2
  store i32 %23, ptr %4, align 4
  %24 = load i32, ptr %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %3, align 4
  %30 = load i32, ptr %4, align 4
  %31 = load i32, ptr %2, align 4
  %32 = add nsw i32 %31, %30
  store i32 %32, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %3, align 4
  ret i32 %34

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %14
    i32 4, label %16
    i32 5, label %33
  ]

break:                                            ; preds = %16, %14, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_40_array_write_loop(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %7, 8
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %1, align 4
  store i32 %11, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 8, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %2, align 4
  %17 = icmp slt i32 %15, %16
  %18 = select i1 %17, i32 6, i32 8
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = mul nsw i32 %20, 2
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %23
  store i32 %21, ptr %24, align 4
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %3, align 4
  ret i32 %35

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %12
    i32 4, label %13
    i32 5, label %14
    i32 6, label %19
    i32 7, label %31
    i32 8, label %34
  ]

break:                                            ; preds = %31, %19, %14, %13, %12, %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_41_pointer_loop(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 4
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %13, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %4, align 4
  ret i32 %24

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %20
    i32 4, label %23
  ]

break:                                            ; preds = %20, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_42_pointer_increment(ptr noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  %9 = select i1 %8, i32 2, i32 3
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %11, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr %4, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds i32, ptr %15, i32 1
  store ptr %16, ptr %2, align 8
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, ptr %3, align 4
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
    i32 0, label %5
    i32 1, label %6
    i32 2, label %10
    i32 3, label %19
  ]

break:                                            ; preds = %10, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_43_pointer_write_loop(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 4
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = mul nsw i32 %13, 3
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr %15, i64 %17
  store i32 %14, ptr %18, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %19, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  store i32 1, ptr %b, align 4
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
    i32 3, label %26
    i32 4, label %29
  ]

break:                                            ; preds = %26, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_44_pointer_array_loop(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

7:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 8
  %11 = select i1 %10, i32 2, i32 3
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  store i32 %13, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  store i32 8, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  %20 = select i1 %19, i32 6, i32 8
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load ptr, ptr %2, align 8
  %23 = load i32, ptr %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %22, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %26, %30
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %4, align 4
  store i32 7, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %4, align 4
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
    i32 3, label %14
    i32 4, label %15
    i32 5, label %16
    i32 6, label %21
    i32 7, label %34
    i32 8, label %37
  ]

break:                                            ; preds = %34, %21, %16, %15, %14, %12, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_45_pointer_nested_loop(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %10, %11
  %13 = select i1 %12, i32 2, i32 8
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %15, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = zext i1 %17 to i64
  %19 = select i1 %17, i32 3, i32 2
  store i32 %19, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %6, align 4
  %23 = icmp slt i32 %21, %22
  %24 = select i1 %23, i32 4, i32 6
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %5, align 4
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %26, %27
  %29 = load ptr, ptr %2, align 8
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %28, %30
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %4, align 4
  ret i32 %42

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %14
    i32 3, label %20
    i32 4, label %25
    i32 5, label %34
    i32 6, label %37
    i32 7, label %38
    i32 8, label %41
  ]

break:                                            ; preds = %38, %37, %34, %25, %20, %14, %9, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_46_global_for() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

0:                                                ; preds = %switch
  store i32 0, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = load i32, ptr @g_limit, align 4
  %4 = icmp slt i32 %2, %3
  %5 = select i1 %4, i32 2, i32 4
  store i32 %5, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_x, align 4
  %8 = load i32, ptr @g_y, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_y, align 4
  store i32 3, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr @g_x, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_y, align 4
  ret i32 %14

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %1
    i32 2, label %6
    i32 3, label %10
    i32 4, label %13
  ]

break:                                            ; preds = %10, %6, %1, %0
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_47_global_while() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

0:                                                ; preds = %switch
  store i32 1, ptr %b, align 4
  br label %break

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = load i32, ptr @g_limit, align 4
  %4 = icmp slt i32 %2, %3
  %5 = select i1 %4, i32 2, i32 3
  store i32 %5, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_step, align 4
  %8 = load i32, ptr @g_x, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr @g_x, align 4
  %12 = load i32, ptr @g_y, align 4
  %13 = add nsw i32 %11, %12
  ret i32 %13

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %1
    i32 2, label %6
    i32 3, label %10
  ]

break:                                            ; preds = %6, %1, %0
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_48_global_array_loop() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

0:                                                ; preds = %switch
  store i32 0, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp slt i32 %2, 8
  %4 = select i1 %3, i32 2, i32 4
  store i32 %4, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr @g_x, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = load i32, ptr @g_y, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, ptr @g_y, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr @g_x, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr @g_y, align 4
  ret i32 %16

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %1
    i32 2, label %5
    i32 3, label %12
    i32 4, label %15
  ]

break:                                            ; preds = %12, %5, %1, %0
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_49_global_matrix_loop() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

0:                                                ; preds = %switch
  store i32 0, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = icmp slt i32 %2, 3
  %4 = select i1 %3, i32 2, i32 8
  store i32 %4, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  store i32 0, ptr @g_y, align 4
  store i32 3, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_y, align 4
  %8 = icmp slt i32 %7, 3
  %9 = select i1 %8, i32 4, i32 6
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr @g_x, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %12
  %14 = load i32, ptr @g_y, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [3 x i32], ptr %13, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = load i32, ptr @g_z, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr @g_z, align 4
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr @g_y, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr @g_y, align 4
  store i32 3, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr @g_x, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr @g_z, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %1
    i32 2, label %5
    i32 3, label %6
    i32 4, label %10
    i32 5, label %20
    i32 6, label %23
    i32 7, label %24
    i32 8, label %27
  ]

break:                                            ; preds = %24, %23, %20, %10, %6, %5, %1, %0
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_50_global_state_loop() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

0:                                                ; preds = %switch
  store i32 0, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 1, ptr %b, align 4
  br label %break

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = load i32, ptr @g_limit, align 4
  %4 = icmp slt i32 %2, %3
  %5 = select i1 %4, i32 2, i32 3
  store i32 %5, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_x, align 4
  %8 = load i32, ptr @g_y, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_y, align 4
  %10 = load i32, ptr @g_x, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr @g_y, align 4
  ret i32 %13

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %1
    i32 2, label %6
    i32 3, label %12
  ]

break:                                            ; preds = %6, %1, %0
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_51_global_nested() #0 {
entry:
  %0 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

1:                                                ; preds = %switch
  store i32 0, ptr %0, align 4
  store i32 0, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

2:                                                ; preds = %switch
  %3 = load i32, ptr @g_x, align 4
  %4 = load i32, ptr @g_n, align 4
  %5 = icmp slt i32 %3, %4
  %6 = select i1 %5, i32 2, i32 8
  store i32 %6, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  store i32 0, ptr @g_y, align 4
  store i32 3, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr @g_y, align 4
  %10 = load i32, ptr @g_limit, align 4
  %11 = icmp slt i32 %9, %10
  %12 = select i1 %11, i32 4, i32 6
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr @g_x, align 4
  %15 = load i32, ptr @g_y, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, ptr @g_z, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %0, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %0, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr @g_y, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr @g_y, align 4
  store i32 3, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr @g_x, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %0, align 4
  ret i32 %29

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %1
    i32 1, label %2
    i32 2, label %7
    i32 3, label %8
    i32 4, label %13
    i32 5, label %21
    i32 6, label %24
    i32 7, label %25
    i32 8, label %28
  ]

break:                                            ; preds = %25, %24, %21, %13, %8, %7, %2, %1
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_52_loop_carried_value(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = mul nsw i32 %11, 2
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  ret i32 %19

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %15
    i32 4, label %18
  ]

break:                                            ; preds = %15, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_53_multiple_loop_carried(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
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
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 2, ptr %3, align 4
  store i32 3, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %1, align 4
  %12 = icmp slt i32 %10, %11
  %13 = select i1 %12, i32 2, i32 4
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  store i32 %15, ptr %6, align 4
  %16 = load i32, ptr %3, align 4
  store i32 %16, ptr %7, align 4
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %2, align 4
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %3, align 4
  %23 = load i32, ptr %2, align 4
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %2, align 4
  %31 = load i32, ptr %3, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %32, %33
  ret i32 %34

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %14
    i32 3, label %26
    i32 4, label %29
  ]

break:                                            ; preds = %26, %14, %9, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_54_nested_loop_carried(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 7
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  store i32 %12, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 4, i32 5
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %2, align 4
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, -1
  store i32 %22, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %2, align 4
  ret i32 %28

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %13
    i32 4, label %17
    i32 5, label %23
    i32 6, label %24
    i32 7, label %27
  ]

break:                                            ; preds = %24, %23, %17, %13, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_55_value_after_loop(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 2
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %2, align 4
  %20 = mul nsw i32 %19, 3
  store i32 %20, ptr %2, align 4
  %21 = load i32, ptr %1, align 4
  %22 = load i32, ptr %2, align 4
  %23 = sub nsw i32 %22, %21
  store i32 %23, ptr %2, align 4
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
    i32 4, label %18
  ]

break:                                            ; preds = %15, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_56_prefix_loop(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %6, align 4
  %15 = load i32, ptr %6, align 4
  %16 = mul nsw i32 %15, 2
  store i32 %16, ptr %7, align 4
  %17 = load i32, ptr %7, align 4
  %18 = sub nsw i32 %17, 3
  store i32 %18, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  store i32 1, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %10, align 4
  %21 = load i32, ptr %5, align 4
  %22 = icmp slt i32 %20, %21
  %23 = select i1 %22, i32 2, i32 4
  store i32 %23, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %10, align 4
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %9, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %9, align 4
  store i32 3, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %10, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %10, align 4
  store i32 1, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %9, align 4
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr %7, align 4
  %38 = add nsw i32 %36, %37
  ret i32 %38

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %11
    i32 1, label %19
    i32 2, label %24
    i32 3, label %30
    i32 4, label %33
  ]

break:                                            ; preds = %30, %24, %19, %11
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_57_suffix_loop(i32 noundef %0) #0 {
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
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, ptr %2, align 4
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, 10
  store i32 %21, ptr %2, align 4
  %22 = load i32, ptr %2, align 4
  %23 = mul nsw i32 %22, 3
  store i32 %23, ptr %2, align 4
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
    i32 4, label %17
  ]

break:                                            ; preds = %14, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_58_prefix_nested_suffix(i32 noundef %0, i32 noundef %1) #0 {
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
  %8 = load i32, ptr %2, align 4
  %9 = mul nsw i32 %8, 2
  store i32 %9, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %11, %12
  %14 = select i1 %13, i32 2, i32 8
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %17, 2
  %19 = select i1 %18, i32 4, i32 6
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %2, align 4
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %4, align 4
  %37 = load i32, ptr %4, align 4
  %38 = mul nsw i32 %37, 2
  store i32 %38, ptr %4, align 4
  %39 = load i32, ptr %4, align 4
  ret i32 %39

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %15
    i32 3, label %16
    i32 4, label %20
    i32 5, label %26
    i32 6, label %29
    i32 7, label %30
    i32 8, label %33
  ]

break:                                            ; preds = %30, %29, %26, %20, %16, %15, %10, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_59_ternary_loop_limit(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
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
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp sgt i32 %9, %10
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  store i32 %14, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  store i32 %16, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp slt i32 %19, %20
  %22 = select i1 %21, i32 6, i32 8
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, %24
  store i32 %26, ptr %5, align 4
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  ret i32 %31

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %13
    i32 3, label %15
    i32 4, label %17
    i32 5, label %18
    i32 6, label %23
    i32 7, label %27
    i32 8, label %30
  ]

break:                                            ; preds = %27, %23, %18, %17, %15, %13, %8, %7
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_60_ternary_loop_update(i32 noundef %0) #0 {
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
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = srem i32 %15, 2
  %17 = icmp eq i32 %16, 0
  %18 = zext i1 %17 to i64
  %19 = select i1 %17, i32 1, i32 2
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %2, align 4
  ret i32 %23

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %14
    i32 4, label %22
  ]

break:                                            ; preds = %14, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_61_nested_ternary_loops(i32 noundef %0) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 14
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = icmp sgt i32 %13, 3
  %15 = select i1 %14, i32 3, i32 4
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = icmp sgt i32 %17, 6
  %19 = zext i1 %18 to i64
  %20 = select i1 %18, i32 3, i32 2
  store i32 %20, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %4, align 4
  %26 = icmp slt i32 %24, %25
  %27 = select i1 %26, i32 7, i32 12
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %5, align 4
  %30 = srem i32 %29, 2
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, i32 8, i32 9
  store i32 %32, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %3, align 4
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %.reg2mem1, align 4
  store i32 10, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %3, align 4
  %39 = load i32, ptr %5, align 4
  %40 = sub nsw i32 %38, %39
  store i32 %40, ptr %.reg2mem1, align 4
  store i32 10, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %42 = load i32, ptr %2, align 4
  %43 = add nsw i32 %42, %.reload2
  store i32 %43, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %5, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %5, align 4
  store i32 6, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %3, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %2, align 4
  ret i32 %52

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %16
    i32 4, label %21
    i32 5, label %22
    i32 6, label %23
    i32 7, label %28
    i32 8, label %33
    i32 9, label %37
    i32 10, label %41
    i32 11, label %44
    i32 12, label %47
    i32 13, label %48
    i32 14, label %51
  ]

break:                                            ; preds = %48, %47, %44, %41, %37, %33, %28, %23, %22, %21, %16, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_62_dynamic_alloca(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  store i32 %15, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  %18 = load i32, ptr %4, align 4
  %19 = zext i32 %18 to i64
  %20 = call ptr @llvm.stacksave()
  store ptr %20, ptr %5, align 8
  %21 = alloca i32, i64 %19, align 16
  store ptr %21, ptr %.reg2mem1, align 8
  store i64 %19, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %8, align 4
  %24 = load i32, ptr %4, align 4
  %25 = icmp slt i32 %23, %24
  %26 = select i1 %25, i32 6, i32 8
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  %29 = load i32, ptr %8, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %8, align 4
  %32 = sext i32 %31 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %33 = getelementptr inbounds i32, ptr %.reload3, i64 %32
  store i32 %30, ptr %33, align 4
  %34 = load i32, ptr %8, align 4
  %35 = sext i32 %34 to i64
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %36 = getelementptr inbounds i32, ptr %.reload2, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %7, align 4
  store i32 7, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %8, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %7, align 4
  %45 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %45)
  ret i32 %44

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %16
    i32 4, label %17
    i32 5, label %22
    i32 6, label %27
    i32 7, label %40
    i32 8, label %43
  ]

break:                                            ; preds = %40, %27, %22, %17, %16, %14, %10, %9
  br label %switch
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_63_dynamic_alloca_pointer(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

11:                                               ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 2, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  store i32 %17, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  %20 = load i32, ptr %4, align 4
  %21 = zext i32 %20 to i64
  %22 = call ptr @llvm.stacksave()
  store ptr %22, ptr %5, align 8
  %23 = alloca i32, i64 %21, align 16
  store i64 %21, ptr %6, align 8
  store ptr %23, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %9, align 4
  %26 = load i32, ptr %4, align 4
  %27 = icmp slt i32 %25, %26
  %28 = select i1 %27, i32 6, i32 8
  store i32 %28, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %3, align 4
  %31 = load i32, ptr %9, align 4
  %32 = mul nsw i32 %31, 2
  %33 = add nsw i32 %30, %32
  %34 = load ptr, ptr %7, align 8
  %35 = load i32, ptr %9, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr %34, i64 %36
  store i32 %33, ptr %37, align 4
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
  store i32 9, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %10, align 4
  %44 = load i32, ptr %4, align 4
  %45 = icmp slt i32 %43, %44
  %46 = select i1 %45, i32 10, i32 12
  store i32 %46, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load ptr, ptr %7, align 8
  %49 = load i32, ptr %10, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, ptr %48, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = load i32, ptr %8, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %8, align 4
  store i32 11, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %10, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %10, align 4
  store i32 9, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load i32, ptr %8, align 4
  %60 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %60)
  ret i32 %59

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %11
    i32 1, label %12
    i32 2, label %16
    i32 3, label %18
    i32 4, label %19
    i32 5, label %24
    i32 6, label %29
    i32 7, label %38
    i32 8, label %41
    i32 9, label %42
    i32 10, label %47
    i32 11, label %55
    i32 12, label %58
  ]

break:                                            ; preds = %55, %47, %42, %41, %38, %29, %24, %19, %18, %16, %12, %11
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_64_dynamic_alloca_nested(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca ptr, align 8
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

11:                                               ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = icmp sgt i32 %13, 0
  %15 = select i1 %14, i32 2, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %2, align 4
  store i32 %17, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  %20 = load i32, ptr %4, align 4
  %21 = zext i32 %20 to i64
  %22 = call ptr @llvm.stacksave()
  store ptr %22, ptr %5, align 8
  %23 = alloca i32, i64 %21, align 16
  store ptr %23, ptr %.reg2mem1, align 8
  store i64 %21, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %4, align 4
  %27 = icmp slt i32 %25, %26
  %28 = select i1 %27, i32 6, i32 8
  store i32 %28, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %3, align 4
  %31 = load i32, ptr %8, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %8, align 4
  %34 = sext i32 %33 to i64
  %.reload3 = load ptr, ptr %.reg2mem1, align 8
  %35 = getelementptr inbounds i32, ptr %.reload3, i64 %34
  store i32 %32, ptr %35, align 4
  store i32 7, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %8, align 4
  store i32 5, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  store i32 0, ptr %9, align 4
  store i32 9, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  %41 = load i32, ptr %9, align 4
  %42 = load i32, ptr %4, align 4
  %43 = icmp slt i32 %41, %42
  %44 = select i1 %43, i32 10, i32 16
  store i32 %44, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 11, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr %10, align 4
  %48 = icmp slt i32 %47, 2
  %49 = select i1 %48, i32 12, i32 14
  store i32 %49, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %9, align 4
  %52 = sext i32 %51 to i64
  %.reload2 = load ptr, ptr %.reg2mem1, align 8
  %53 = getelementptr inbounds i32, ptr %.reload2, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = load i32, ptr %10, align 4
  %56 = add nsw i32 %54, %55
  %57 = load i32, ptr %7, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, ptr %7, align 4
  store i32 13, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %10, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %10, align 4
  store i32 11, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  store i32 15, ptr %b, align 4
  br label %break

63:                                               ; preds = %switch
  %64 = load i32, ptr %9, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %9, align 4
  store i32 9, ptr %b, align 4
  br label %break

66:                                               ; preds = %switch
  %67 = load i32, ptr %7, align 4
  %68 = load ptr, ptr %5, align 8
  call void @llvm.stackrestore(ptr %68)
  ret i32 %67

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b4 = load i32, ptr %b, align 4
  switch i32 %b4, label %default [
    i32 0, label %11
    i32 1, label %12
    i32 2, label %16
    i32 3, label %18
    i32 4, label %19
    i32 5, label %24
    i32 6, label %29
    i32 7, label %36
    i32 8, label %39
    i32 9, label %40
    i32 10, label %45
    i32 11, label %46
    i32 12, label %50
    i32 13, label %59
    i32 14, label %62
    i32 15, label %63
    i32 16, label %66
  ]

break:                                            ; preds = %63, %62, %59, %50, %46, %45, %40, %39, %36, %29, %24, %19, %18, %16, %12, %11
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_65_malloc_loop(i32 noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
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
  store i32 %0, ptr %2, align 4
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 0
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %2, align 4
  store i32 %15, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = mul i64 %19, 4
  %21 = call noalias ptr @malloc(i64 noundef %20) #8
  store ptr %21, ptr %5, align 8
  store i32 0, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load ptr, ptr %5, align 8
  %24 = icmp ne ptr %23, null
  %25 = select i1 %24, i32 6, i32 7
  store i32 %25, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %3, align 4
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds i32, ptr %28, i64 0
  store i32 %27, ptr %29, align 4
  store i32 8, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %7, align 4
  %34 = load i32, ptr %4, align 4
  %35 = icmp slt i32 %33, %34
  %36 = select i1 %35, i32 10, i32 15
  store i32 %36, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load ptr, ptr %5, align 8
  %39 = icmp ne ptr %38, null
  %40 = select i1 %39, i32 11, i32 12
  store i32 %40, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %3, align 4
  %43 = load i32, ptr %7, align 4
  %44 = add nsw i32 %42, %43
  %45 = load ptr, ptr %5, align 8
  %46 = load i32, ptr %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %45, i64 %47
  store i32 %44, ptr %48, align 4
  store i32 13, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  store i32 14, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %7, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %7, align 4
  store i32 9, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 16, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %8, align 4
  %57 = load i32, ptr %4, align 4
  %58 = icmp slt i32 %56, %57
  %59 = select i1 %58, i32 17, i32 22
  store i32 %59, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load ptr, ptr %5, align 8
  %62 = icmp ne ptr %61, null
  %63 = select i1 %62, i32 18, i32 19
  store i32 %63, ptr %b, align 4
  br label %break

64:                                               ; preds = %switch
  %65 = load ptr, ptr %5, align 8
  %66 = load i32, ptr %8, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, ptr %65, i64 %67
  %69 = load i32, ptr %68, align 4
  store i32 %69, ptr %.reg2mem1, align 4
  store i32 20, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  store i32 -1, ptr %.reg2mem1, align 4
  store i32 20, ptr %b, align 4
  br label %break

71:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %72 = load i32, ptr %6, align 4
  %73 = add nsw i32 %72, %.reload2
  store i32 %73, ptr %6, align 4
  store i32 21, ptr %b, align 4
  br label %break

74:                                               ; preds = %switch
  %75 = load i32, ptr %8, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %8, align 4
  store i32 16, ptr %b, align 4
  br label %break

77:                                               ; preds = %switch
  %78 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %78) #9
  %79 = load i32, ptr %6, align 4
  ret i32 %79

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %16
    i32 4, label %17
    i32 5, label %22
    i32 6, label %26
    i32 7, label %30
    i32 8, label %31
    i32 9, label %32
    i32 10, label %37
    i32 11, label %41
    i32 12, label %49
    i32 13, label %50
    i32 14, label %51
    i32 15, label %54
    i32 16, label %55
    i32 17, label %60
    i32 18, label %64
    i32 19, label %70
    i32 20, label %71
    i32 21, label %74
    i32 22, label %77
  ]

break:                                            ; preds = %74, %71, %70, %64, %60, %55, %54, %51, %50, %49, %41, %37, %32, %31, %30, %26, %22, %17, %16, %14, %10, %9
  br label %switch
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_66_malloc_nested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
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
  store i32 %2, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 2, i32 3
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  store i32 %18, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %6, align 4
  %21 = load i32, ptr %6, align 4
  %22 = sext i32 %21 to i64
  %23 = mul i64 %22, 4
  %24 = call noalias ptr @malloc(i64 noundef %23) #8
  store ptr %24, ptr %7, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %6, align 4
  %28 = icmp slt i32 %26, %27
  %29 = select i1 %28, i32 6, i32 11
  store i32 %29, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load ptr, ptr %7, align 8
  %32 = icmp ne ptr %31, null
  %33 = select i1 %32, i32 7, i32 8
  store i32 %33, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %4, align 4
  %36 = load i32, ptr %9, align 4
  %37 = add nsw i32 %35, %36
  %38 = load ptr, ptr %7, align 8
  %39 = load i32, ptr %9, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %38, i64 %40
  store i32 %37, ptr %41, align 4
  store i32 9, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %9, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  store i32 0, ptr %10, align 4
  store i32 12, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %10, align 4
  %50 = load i32, ptr %6, align 4
  %51 = icmp slt i32 %49, %50
  %52 = select i1 %51, i32 13, i32 22
  store i32 %52, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  store i32 0, ptr %11, align 4
  store i32 14, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  %55 = load i32, ptr %11, align 4
  %56 = icmp slt i32 %55, 2
  %57 = select i1 %56, i32 15, i32 20
  store i32 %57, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %59 = load ptr, ptr %7, align 8
  %60 = icmp ne ptr %59, null
  %61 = select i1 %60, i32 16, i32 17
  store i32 %61, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load ptr, ptr %7, align 8
  %64 = load i32, ptr %10, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %63, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %5, align 4
  %69 = add nsw i32 %67, %68
  %70 = load i32, ptr %11, align 4
  %71 = add nsw i32 %69, %70
  store i32 %71, ptr %.reg2mem1, align 4
  store i32 18, ptr %b, align 4
  br label %break

72:                                               ; preds = %switch
  store i32 -1, ptr %.reg2mem1, align 4
  store i32 18, ptr %b, align 4
  br label %break

73:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %74 = load i32, ptr %8, align 4
  %75 = add nsw i32 %74, %.reload2
  store i32 %75, ptr %8, align 4
  store i32 19, ptr %b, align 4
  br label %break

76:                                               ; preds = %switch
  %77 = load i32, ptr %11, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %11, align 4
  store i32 14, ptr %b, align 4
  br label %break

79:                                               ; preds = %switch
  store i32 21, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
  %81 = load i32, ptr %10, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %10, align 4
  store i32 12, ptr %b, align 4
  br label %break

83:                                               ; preds = %switch
  %84 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %84) #9
  %85 = load i32, ptr %8, align 4
  ret i32 %85

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %12
    i32 1, label %13
    i32 2, label %17
    i32 3, label %19
    i32 4, label %20
    i32 5, label %25
    i32 6, label %30
    i32 7, label %34
    i32 8, label %42
    i32 9, label %43
    i32 10, label %44
    i32 11, label %47
    i32 12, label %48
    i32 13, label %53
    i32 14, label %54
    i32 15, label %58
    i32 16, label %62
    i32 17, label %72
    i32 18, label %73
    i32 19, label %76
    i32 20, label %79
    i32 21, label %80
    i32 22, label %83
  ]

break:                                            ; preds = %80, %79, %76, %73, %72, %62, %58, %54, %53, %48, %47, %44, %43, %42, %34, %30, %25, %20, %19, %17, %13, %12
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_67_void_for(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %5, %6
  %8 = select i1 %7, i32 2, i32 4
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr @g_void_result, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr @g_void_result, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %13
    i32 4, label %16
  ]

break:                                            ; preds = %13, %9, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_68_void_while(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %5, %6
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = mul nsw i32 %10, 2
  %12 = load i32, ptr @g_void_result, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr @g_void_result, align 4
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %16
  ]

break:                                            ; preds = %9, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_69_void_dowhile(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = add nsw i32 %5, 1
  %7 = load i32, ptr @g_void_result, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, ptr @g_void_result, align 4
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4
  store i32 2, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %12, %13
  %15 = select i1 %14, i32 1, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %11
    i32 3, label %16
  ]

break:                                            ; preds = %11, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_70_void_nested(i32 noundef %0) #0 {
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
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %6, %7
  %9 = select i1 %8, i32 2, i32 8
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  store i32 0, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %12, 2
  %14 = select i1 %13, i32 4, i32 6
  store i32 %14, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr @g_void_result, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %2, align 4
  store i32 1, ptr %b, align 4
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
    i32 2, label %10
    i32 3, label %11
    i32 4, label %15
    i32 5, label %21
    i32 6, label %24
    i32 7, label %25
    i32 8, label %28
  ]

break:                                            ; preds = %25, %24, %21, %15, %11, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_71_void_continue(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

3:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %5, %6
  %8 = select i1 %7, i32 2, i32 6
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  %13 = select i1 %12, i32 3, i32 4
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = load i32, ptr @g_void_result, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr @g_void_result, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %2, align 4
  store i32 1, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %9
    i32 3, label %14
    i32 4, label %15
    i32 5, label %19
    i32 6, label %22
  ]

break:                                            ; preds = %19, %15, %14, %9, %4, %3
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_72_void_global_only() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

0:                                                ; preds = %switch
  store i32 1, ptr %b, align 4
  br label %break

1:                                                ; preds = %switch
  %2 = load i32, ptr @g_x, align 4
  %3 = load i32, ptr @g_limit, align 4
  %4 = icmp slt i32 %2, %3
  %5 = select i1 %4, i32 2, i32 3
  store i32 %5, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr @g_x, align 4
  %8 = load i32, ptr @g_void_result, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr @g_void_result, align 4
  %10 = load i32, ptr @g_step, align 4
  %11 = load i32, ptr @g_x, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr @g_x, align 4
  store i32 1, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %1
    i32 2, label %6
    i32 3, label %13
  ]

break:                                            ; preds = %6, %1, %0
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_73_void_pointer(ptr noundef %0, i32 noundef %1) #0 {
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
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 4
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %4, align 4
  %13 = load ptr, ptr %2, align 8
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %13, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = add nsw i32 %17, %12
  store i32 %18, ptr %16, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %19, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr @g_void_result, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr @g_void_result, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %26
    i32 4, label %29
  ]

break:                                            ; preds = %26, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_74_void_array(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

4:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %6, 8
  %8 = select i1 %7, i32 2, i32 3
  store i32 %8, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %1, align 4
  store i32 %10, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  store i32 8, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %14, %15
  %17 = select i1 %16, i32 6, i32 8
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %3, align 4
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %23, %19
  store i32 %24, ptr %22, align 4
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = load i32, ptr @g_void_result, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, ptr @g_void_result, align 4
  store i32 7, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %9
    i32 3, label %11
    i32 4, label %12
    i32 5, label %13
    i32 6, label %18
    i32 7, label %31
    i32 8, label %34
  ]

break:                                            ; preds = %31, %18, %13, %12, %11, %9, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_75_loop_return_paths(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
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
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = icmp eq i32 %16, 3
  %18 = select i1 %17, i32 4, i32 5
  store i32 %18, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %3, align 4
  store i32 %20, ptr %1, align 4
  store i32 8, ptr %b, align 4
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
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, 100
  store i32 %27, ptr %1, align 4
  store i32 8, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %1, align 4
  ret i32 %29

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
    i32 5, label %21
    i32 6, label %22
    i32 7, label %25
    i32 8, label %28
  ]

break:                                            ; preds = %25, %22, %21, %19, %15, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_76_nested_return_paths(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 13
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %14, %15
  %17 = select i1 %16, i32 4, i32 11
  store i32 %17, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = icmp eq i32 %25, 2
  %27 = select i1 %26, i32 6, i32 7
  store i32 %27, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %3, align 4
  store i32 %29, ptr %1, align 4
  store i32 14, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %3, align 4
  %32 = icmp sgt i32 %31, 30
  %33 = select i1 %32, i32 8, i32 9
  store i32 %33, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %3, align 4
  %36 = mul nsw i32 %35, 2
  store i32 %36, ptr %1, align 4
  store i32 14, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %4, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %3, align 4
  %47 = add nsw i32 %46, 100
  store i32 %47, ptr %1, align 4
  store i32 14, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %1, align 4
  ret i32 %49

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %13
    i32 4, label %18
    i32 5, label %24
    i32 6, label %28
    i32 7, label %30
    i32 8, label %34
    i32 9, label %37
    i32 10, label %38
    i32 11, label %41
    i32 12, label %42
    i32 13, label %45
    i32 14, label %48
  ]

break:                                            ; preds = %45, %42, %41, %38, %37, %34, %30, %28, %24, %18, %13, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_77_loop_final_returns(i32 noundef %0) #0 {
entry:
  %.reg2mem = alloca i32, align 4
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
  %9 = select i1 %8, i32 2, i32 4
  store i32 %9, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %2, align 4
  %19 = icmp sgt i32 %18, 20
  %20 = select i1 %19, i32 5, i32 6
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %2, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, ptr %.reg2mem, align 4
  store i32 7, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %2, align 4
  %26 = add nsw i32 %25, 10
  store i32 %26, ptr %.reg2mem, align 4
  store i32 7, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  ret i32 %.reload

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %10
    i32 3, label %14
    i32 4, label %17
    i32 5, label %21
    i32 6, label %24
    i32 7, label %27
  ]

break:                                            ; preds = %24, %21, %17, %14, %10, %5, %4
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_78_state_machine_loop(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

5:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %7, %8
  %10 = select i1 %9, i32 2, i32 4
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %4, align 4
  %14 = mul nsw i32 %12, %13
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %3, align 4
  %17 = load i32, ptr %2, align 4
  %18 = icmp eq i32 %17, 1
  %19 = zext i1 %18 to i64
  %20 = select i1 %18, i32 2, i32 1
  store i32 %20, ptr %2, align 4
  store i32 3, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %25, %26
  ret i32 %27

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %11
    i32 3, label %21
    i32 4, label %24
  ]

break:                                            ; preds = %21, %11, %6, %5
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_79_multiple_backedge_values(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 2, ptr %3, align 4
  store i32 3, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 4
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %2, align 4
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %3, align 4
  %19 = load i32, ptr %2, align 4
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %19, %20
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %21, %22
  store i32 %23, ptr %4, align 4
  store i32 3, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %2, align 4
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %30, %31
  ret i32 %32

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %24
    i32 4, label %27
  ]

break:                                            ; preds = %24, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_80_nested_state(i32 noundef %0) #0 {
entry:
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %8, %9
  %11 = select i1 %10, i32 2, i32 8
  store i32 %11, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %14, 3
  %16 = select i1 %15, i32 4, i32 6
  store i32 %16, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %20, %21
  %23 = load i32, ptr %2, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, ptr %2, align 4
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %5, align 4
  %29 = add nsw i32 %27, %28
  %30 = srem i32 %29, 5
  store i32 %30, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %4, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %2, align 4
  %40 = load i32, ptr %3, align 4
  %41 = add nsw i32 %39, %40
  ret i32 %41

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %12
    i32 3, label %13
    i32 4, label %17
    i32 5, label %31
    i32 6, label %34
    i32 7, label %35
    i32 8, label %38
  ]

break:                                            ; preds = %35, %34, %31, %17, %13, %12, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_81_array_pointer_nested(ptr noundef %0, i32 noundef %1) #0 {
entry:
  %.reg2mem = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

8:                                                ; preds = %switch
  store ptr %0, ptr %2, align 8
  store i32 %1, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %10, 8
  %12 = select i1 %11, i32 2, i32 3
  store i32 %12, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  store i32 %14, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  store i32 8, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  %21 = select i1 %20, i32 6, i32 12
  store i32 %21, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 0, ptr %7, align 4
  store i32 7, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %7, align 4
  %25 = icmp slt i32 %24, 2
  %26 = select i1 %25, i32 8, i32 10
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load ptr, ptr %2, align 8
  %29 = load i32, ptr %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %28, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = add nsw i32 %32, %36
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %37, %38
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %5, align 4
  %42 = load i32, ptr %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = icmp sgt i32 %45, 0
  %47 = zext i1 %46 to i64
  %48 = select i1 %46, i32 1, i32 -1
  %49 = load ptr, ptr %2, align 8
  %50 = load i32, ptr %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %49, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = add nsw i32 %53, %48
  store i32 %54, ptr %52, align 4
  store i32 9, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %7, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %7, align 4
  store i32 7, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %6, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %6, align 4
  store i32 5, ptr %b, align 4
  br label %break

62:                                               ; preds = %switch
  %63 = load i32, ptr %5, align 4
  ret i32 %63

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %13
    i32 3, label %15
    i32 4, label %16
    i32 5, label %17
    i32 6, label %22
    i32 7, label %23
    i32 8, label %27
    i32 9, label %55
    i32 10, label %58
    i32 11, label %59
    i32 12, label %62
  ]

break:                                            ; preds = %59, %58, %55, %27, %23, %22, %17, %16, %15, %13, %9, %8
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_82_matrix_state(i32 noundef %0) #0 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

6:                                                ; preds = %switch
  store i32 %0, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %8, 3
  %10 = select i1 %9, i32 2, i32 3
  store i32 %10, ptr %b, align 4
  br label %break

11:                                               ; preds = %switch
  %12 = load i32, ptr %1, align 4
  store i32 %12, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  store i32 3, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %2, align 4
  %18 = icmp slt i32 %16, %17
  %19 = select i1 %18, i32 6, i32 15
  store i32 %19, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 7, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %22, 3
  %24 = select i1 %23, i32 8, i32 10
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x [3 x i32]], ptr @g_mat, i64 0, i64 %27
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x i32], ptr %28, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = load i32, ptr %3, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, ptr %3, align 4
  store i32 9, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %5, align 4
  store i32 7, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %3, align 4
  %40 = icmp sgt i32 %39, 20
  %41 = select i1 %40, i32 11, i32 12
  store i32 %41, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %3, align 4
  %44 = sdiv i32 %43, 2
  store i32 %44, ptr %.reg2mem1, align 4
  store i32 13, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %3, align 4
  %47 = add nsw i32 %46, 3
  store i32 %47, ptr %.reg2mem1, align 4
  store i32 13, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %3, align 4
  store i32 14, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %4, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %4, align 4
  store i32 5, ptr %b, align 4
  br label %break

52:                                               ; preds = %switch
  %53 = load i32, ptr %3, align 4
  ret i32 %53

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %11
    i32 3, label %13
    i32 4, label %14
    i32 5, label %15
    i32 6, label %20
    i32 7, label %21
    i32 8, label %25
    i32 9, label %35
    i32 10, label %38
    i32 11, label %42
    i32 12, label %45
    i32 13, label %48
    i32 14, label %49
    i32 15, label %52
  ]

break:                                            ; preds = %49, %48, %45, %42, %38, %35, %25, %21, %20, %15, %14, %13, %11, %7, %6
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_83_complex_loop_control(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
entry:
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i32, align 4
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
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

15:                                               ; preds = %switch
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %8, align 4
  %19 = icmp sgt i32 %17, %18
  %20 = select i1 %19, i32 2, i32 3
  store i32 %20, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %7, align 4
  store i32 %22, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %8, align 4
  store i32 %24, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %9, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %9, align 4
  %28 = icmp sgt i32 %27, 6
  %29 = select i1 %28, i32 6, i32 7
  store i32 %29, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  store i32 6, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %9, align 4
  store i32 %32, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %9, align 4
  store i32 9, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %9, align 4
  %36 = icmp slt i32 %35, 1
  %37 = select i1 %36, i32 10, i32 11
  store i32 %37, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem3, align 4
  store i32 12, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %9, align 4
  store i32 %40, ptr %.reg2mem3, align 4
  store i32 12, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %9, align 4
  %42 = load i32, ptr @g_x, align 4
  store i32 %42, ptr %10, align 4
  store i32 0, ptr %11, align 4
  store i32 13, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %11, align 4
  %45 = load i32, ptr %9, align 4
  %46 = icmp slt i32 %44, %45
  %47 = select i1 %46, i32 14, i32 26
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  store i32 0, ptr %12, align 4
  store i32 15, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %12, align 4
  %51 = load i32, ptr @g_limit, align 4
  %52 = icmp slt i32 %50, %51
  %53 = select i1 %52, i32 16, i32 24
  store i32 %53, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 0, ptr %13, align 4
  store i32 17, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %13, align 4
  %57 = icmp slt i32 %56, 2
  %58 = select i1 %57, i32 18, i32 23
  store i32 %58, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %11, align 4
  %61 = load i32, ptr %12, align 4
  %62 = add nsw i32 %60, %61
  %63 = load i32, ptr %13, align 4
  %64 = add nsw i32 %62, %63
  %65 = srem i32 %64, 8
  store i32 %65, ptr %14, align 4
  %66 = load i32, ptr %14, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = load i32, ptr %10, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, ptr %10, align 4
  %72 = load ptr, ptr %5, align 8
  %73 = load i32, ptr %72, align 4
  %74 = load i32, ptr %10, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %10, align 4
  %76 = load i32, ptr %14, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = srem i32 %79, 2
  %81 = icmp eq i32 %80, 0
  %82 = zext i1 %81 to i64
  %83 = select i1 %81, i32 1, i32 -1
  %84 = load ptr, ptr %5, align 8
  %85 = load i32, ptr %84, align 4
  %86 = add nsw i32 %85, %83
  store i32 %86, ptr %84, align 4
  store i32 19, ptr %b, align 4
  br label %break

87:                                               ; preds = %switch
  %88 = load i32, ptr %10, align 4
  %89 = icmp sgt i32 %88, 50
  %90 = select i1 %89, i32 20, i32 21
  store i32 %90, ptr %b, align 4
  br label %break

91:                                               ; preds = %switch
  %92 = load i32, ptr %10, align 4
  store i32 %92, ptr %4, align 4
  store i32 27, ptr %b, align 4
  br label %break

93:                                               ; preds = %switch
  store i32 22, ptr %b, align 4
  br label %break

94:                                               ; preds = %switch
  %95 = load i32, ptr %13, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, ptr %13, align 4
  store i32 17, ptr %b, align 4
  br label %break

97:                                               ; preds = %switch
  %98 = load i32, ptr %12, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, ptr %12, align 4
  store i32 15, ptr %b, align 4
  br label %break

100:                                              ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %break

101:                                              ; preds = %switch
  %102 = load i32, ptr %11, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, ptr %11, align 4
  store i32 13, ptr %b, align 4
  br label %break

104:                                              ; preds = %switch
  %105 = load i32, ptr %10, align 4
  store i32 %105, ptr %4, align 4
  store i32 27, ptr %b, align 4
  br label %break

106:                                              ; preds = %switch
  %107 = load i32, ptr %4, align 4
  ret i32 %107

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b5 = load i32, ptr %b, align 4
  switch i32 %b5, label %default [
    i32 0, label %15
    i32 1, label %16
    i32 2, label %21
    i32 3, label %23
    i32 4, label %25
    i32 5, label %26
    i32 6, label %30
    i32 7, label %31
    i32 8, label %33
    i32 9, label %34
    i32 10, label %38
    i32 11, label %39
    i32 12, label %41
    i32 13, label %43
    i32 14, label %48
    i32 15, label %49
    i32 16, label %54
    i32 17, label %55
    i32 18, label %59
    i32 19, label %87
    i32 20, label %91
    i32 21, label %93
    i32 22, label %94
    i32 23, label %97
    i32 24, label %100
    i32 25, label %101
    i32 26, label %104
    i32 27, label %106
  ]

break:                                            ; preds = %104, %101, %100, %97, %94, %93, %91, %87, %59, %55, %54, %49, %48, %43, %41, %39, %38, %34, %33, %31, %30, %26, %25, %23, %21, %16, %15
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_84_complex_loop_state(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
entry:
  %.reg2mem5 = alloca i1, align 1
  %.reg2mem3 = alloca i32, align 4
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

14:                                               ; preds = %switch
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 %4, ptr %9, align 4
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr @g_x, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, ptr %10, align 4
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  store i32 1, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %12, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %19, %20
  %22 = select i1 %21, i32 2, i32 3
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %12, align 4
  %25 = icmp slt i32 %24, 8
  store i1 true, ptr %.reg2mem1, align 1
  %26 = select i1 %25, i32 6, i32 3
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %11, align 4
  %29 = icmp slt i32 %28, 3
  store i1 false, ptr %.reg2mem, align 1
  %30 = select i1 %29, i32 4, i32 5
  store i32 %30, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %12, align 4
  %33 = icmp slt i32 %32, 10
  store i1 %33, ptr %.reg2mem, align 1
  store i32 5, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  store i1 %.reload, ptr %.reg2mem1, align 1
  store i32 6, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %36 = select i1 %.reload2, i32 7, i32 18
  store i32 %36, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = load i32, ptr %12, align 4
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %38, %39
  %41 = load i32, ptr %8, align 4
  %42 = icmp sgt i32 %40, %41
  %43 = select i1 %42, i32 8, i32 9
  store i32 %43, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %11, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %11, align 4
  %49 = sub nsw i32 %48, 1
  store i32 %49, ptr %.reg2mem3, align 4
  store i32 10, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  store i32 %.reload4, ptr %11, align 4
  store i32 0, ptr %13, align 4
  store i32 11, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %13, align 4
  %53 = icmp slt i32 %52, 3
  store i1 false, ptr %.reg2mem5, align 1
  %54 = select i1 %53, i32 12, i32 13
  store i32 %54, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %56 = load i32, ptr %11, align 4
  %57 = icmp slt i32 %56, 5
  store i1 %57, ptr %.reg2mem5, align 1
  store i32 13, ptr %b, align 4
  br label %break

58:                                               ; preds = %switch
  %.reload6 = load i1, ptr %.reg2mem5, align 1
  %59 = select i1 %.reload6, i32 14, i32 16
  store i32 %59, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = load i32, ptr %12, align 4
  %62 = srem i32 %61, 8
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = load i32, ptr %10, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %10, align 4
  %68 = load ptr, ptr %5, align 8
  %69 = load i32, ptr %68, align 4
  %70 = load i32, ptr %9, align 4
  %71 = add nsw i32 %69, %70
  %72 = load i32, ptr %10, align 4
  %73 = add nsw i32 %72, %71
  store i32 %73, ptr %10, align 4
  %74 = load i32, ptr %10, align 4
  %75 = srem i32 %74, 2
  %76 = icmp eq i32 %75, 0
  %77 = zext i1 %76 to i64
  %78 = select i1 %76, i32 1, i32 -1
  %79 = load ptr, ptr %5, align 8
  %80 = load i32, ptr %79, align 4
  %81 = add nsw i32 %80, %78
  store i32 %81, ptr %79, align 4
  store i32 15, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  %83 = load i32, ptr %13, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %13, align 4
  store i32 11, ptr %b, align 4
  br label %break

85:                                               ; preds = %switch
  store i32 17, ptr %b, align 4
  br label %break

86:                                               ; preds = %switch
  %87 = load i32, ptr %12, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %12, align 4
  store i32 1, ptr %b, align 4
  br label %break

89:                                               ; preds = %switch
  %90 = load i32, ptr %10, align 4
  %91 = load i32, ptr %11, align 4
  %92 = add nsw i32 %90, %91
  ret i32 %92

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b7 = load i32, ptr %b, align 4
  switch i32 %b7, label %default [
    i32 0, label %14
    i32 1, label %18
    i32 2, label %23
    i32 3, label %27
    i32 4, label %31
    i32 5, label %34
    i32 6, label %35
    i32 7, label %37
    i32 8, label %44
    i32 9, label %47
    i32 10, label %50
    i32 11, label %51
    i32 12, label %55
    i32 13, label %58
    i32 14, label %60
    i32 15, label %82
    i32 16, label %85
    i32 17, label %86
    i32 18, label %89
  ]

break:                                            ; preds = %86, %85, %82, %60, %58, %55, %51, %50, %47, %44, %37, %35, %34, %31, %27, %23, %18, %14
  br label %switch
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_85_loop_stress(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
entry:
  %.reg2mem9 = alloca i32, align 4
  %.reg2mem7 = alloca i1, align 1
  %.reg2mem5 = alloca i1, align 1
  %.reg2mem3 = alloca i1, align 1
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
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
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  store i32 1, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %8, align 4
  %20 = load i32, ptr %9, align 4
  %21 = icmp sgt i32 %19, %20
  %22 = select i1 %21, i32 2, i32 3
  store i32 %22, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %8, align 4
  store i32 %24, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %9, align 4
  store i32 %26, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %11, align 4
  store i32 5, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %11, align 4
  %30 = icmp sgt i32 %29, 8
  %31 = select i1 %30, i32 6, i32 7
  store i32 %31, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 8, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %11, align 4
  store i32 %34, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %11, align 4
  %36 = load i32, ptr %8, align 4
  %37 = load i32, ptr @g_x, align 4
  %38 = add nsw i32 %36, %37
  store i32 %38, ptr %12, align 4
  store i32 0, ptr %13, align 4
  store i32 0, ptr %14, align 4
  store i32 9, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %14, align 4
  %41 = load i32, ptr %11, align 4
  %42 = icmp slt i32 %40, %41
  %43 = select i1 %42, i32 10, i32 11
  store i32 %43, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %13, align 4
  %46 = icmp slt i32 %45, 10
  store i1 true, ptr %.reg2mem5, align 1
  %47 = select i1 %46, i32 14, i32 11
  store i32 %47, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %14, align 4
  %50 = load i32, ptr %7, align 4
  %51 = icmp slt i32 %49, %50
  store i1 false, ptr %.reg2mem3, align 1
  %52 = select i1 %51, i32 12, i32 13
  store i32 %52, ptr %b, align 4
  br label %break

53:                                               ; preds = %switch
  %54 = load i32, ptr %10, align 4
  %55 = icmp ne i32 %54, 0
  store i1 %55, ptr %.reg2mem3, align 1
  store i32 13, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %.reload4 = load i1, ptr %.reg2mem3, align 1
  store i1 %.reload4, ptr %.reg2mem5, align 1
  store i32 14, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %.reload6 = load i1, ptr %.reg2mem5, align 1
  %58 = select i1 %.reload6, i32 15, i32 32
  store i32 %58, ptr %b, align 4
  br label %break

59:                                               ; preds = %switch
  %60 = load i32, ptr %14, align 4
  %61 = load i32, ptr %13, align 4
  %62 = add nsw i32 %60, %61
  %63 = srem i32 %62, 8
  store i32 %63, ptr %15, align 4
  %64 = load i32, ptr %15, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %12, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, ptr %12, align 4
  store i32 16, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %13, align 4
  %72 = icmp slt i32 %71, 4
  store i1 false, ptr %.reg2mem7, align 1
  %73 = select i1 %72, i32 17, i32 18
  store i32 %73, ptr %b, align 4
  br label %break

74:                                               ; preds = %switch
  %75 = load i32, ptr %14, align 4
  %76 = load i32, ptr @g_limit, align 4
  %77 = icmp slt i32 %75, %76
  store i1 %77, ptr %.reg2mem7, align 1
  store i32 18, ptr %b, align 4
  br label %break

78:                                               ; preds = %switch
  %.reload8 = load i1, ptr %.reg2mem7, align 1
  %79 = select i1 %.reload8, i32 19, i32 27
  store i32 %79, ptr %b, align 4
  br label %break

80:                                               ; preds = %switch
  %81 = load i32, ptr %14, align 4
  %82 = load i32, ptr %13, align 4
  %83 = add nsw i32 %81, %82
  %84 = load i32, ptr %12, align 4
  %85 = add nsw i32 %84, %83
  store i32 %85, ptr %12, align 4
  store i32 0, ptr %16, align 4
  store i32 20, ptr %b, align 4
  br label %break

86:                                               ; preds = %switch
  %87 = load i32, ptr %16, align 4
  %88 = icmp slt i32 %87, 2
  %89 = select i1 %88, i32 21, i32 26
  store i32 %89, ptr %b, align 4
  br label %break

90:                                               ; preds = %switch
  %91 = load i32, ptr %15, align 4
  %92 = load i32, ptr %16, align 4
  %93 = add nsw i32 %91, %92
  %94 = srem i32 %93, 8
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [8 x i32], ptr @g_arr, i64 0, i64 %95
  %97 = load i32, ptr %96, align 4
  %98 = load i32, ptr %12, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, ptr %12, align 4
  %100 = load i32, ptr %12, align 4
  %101 = icmp sgt i32 %100, 0
  %102 = zext i1 %101 to i64
  %103 = select i1 %101, i32 1, i32 -1
  %104 = load ptr, ptr %6, align 8
  %105 = load i32, ptr %104, align 4
  %106 = add nsw i32 %105, %103
  store i32 %106, ptr %104, align 4
  store i32 22, ptr %b, align 4
  br label %break

107:                                              ; preds = %switch
  %108 = load ptr, ptr %6, align 8
  %109 = load i32, ptr %108, align 4
  %110 = icmp sgt i32 %109, 20
  %111 = select i1 %110, i32 23, i32 24
  store i32 %111, ptr %b, align 4
  br label %break

112:                                              ; preds = %switch
  store i32 26, ptr %b, align 4
  br label %break

113:                                              ; preds = %switch
  store i32 25, ptr %b, align 4
  br label %break

114:                                              ; preds = %switch
  %115 = load i32, ptr %16, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, ptr %16, align 4
  store i32 20, ptr %b, align 4
  br label %break

117:                                              ; preds = %switch
  %118 = load i32, ptr %13, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, ptr %13, align 4
  store i32 16, ptr %b, align 4
  br label %break

120:                                              ; preds = %switch
  %121 = load ptr, ptr %6, align 8
  %122 = load i32, ptr %121, align 4
  %123 = load i32, ptr %12, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, ptr %12, align 4
  store i32 28, ptr %b, align 4
  br label %break

125:                                              ; preds = %switch
  %126 = load i32, ptr %12, align 4
  %127 = icmp sgt i32 %126, 100
  %128 = select i1 %127, i32 29, i32 30
  store i32 %128, ptr %b, align 4
  br label %break

129:                                              ; preds = %switch
  %130 = load i32, ptr %12, align 4
  store i32 %130, ptr %5, align 4
  store i32 36, ptr %b, align 4
  br label %break

131:                                              ; preds = %switch
  store i32 31, ptr %b, align 4
  br label %break

132:                                              ; preds = %switch
  %133 = load i32, ptr %14, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %14, align 4
  store i32 9, ptr %b, align 4
  br label %break

135:                                              ; preds = %switch
  %136 = load i32, ptr %12, align 4
  %137 = icmp sgt i32 %136, 0
  %138 = select i1 %137, i32 33, i32 34
  store i32 %138, ptr %b, align 4
  br label %break

139:                                              ; preds = %switch
  %140 = load i32, ptr %12, align 4
  %141 = mul nsw i32 %140, 2
  store i32 %141, ptr %.reg2mem9, align 4
  store i32 35, ptr %b, align 4
  br label %break

142:                                              ; preds = %switch
  %143 = load i32, ptr %12, align 4
  %144 = sub nsw i32 0, %143
  store i32 %144, ptr %.reg2mem9, align 4
  store i32 35, ptr %b, align 4
  br label %break

145:                                              ; preds = %switch
  %.reload10 = load i32, ptr %.reg2mem9, align 4
  store i32 %.reload10, ptr %5, align 4
  store i32 36, ptr %b, align 4
  br label %break

146:                                              ; preds = %switch
  %147 = load i32, ptr %5, align 4
  ret i32 %147

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b11 = load i32, ptr %b, align 4
  switch i32 %b11, label %default [
    i32 0, label %17
    i32 1, label %18
    i32 2, label %23
    i32 3, label %25
    i32 4, label %27
    i32 5, label %28
    i32 6, label %32
    i32 7, label %33
    i32 8, label %35
    i32 9, label %39
    i32 10, label %44
    i32 11, label %48
    i32 12, label %53
    i32 13, label %56
    i32 14, label %57
    i32 15, label %59
    i32 16, label %70
    i32 17, label %74
    i32 18, label %78
    i32 19, label %80
    i32 20, label %86
    i32 21, label %90
    i32 22, label %107
    i32 23, label %112
    i32 24, label %113
    i32 25, label %114
    i32 26, label %117
    i32 27, label %120
    i32 28, label %125
    i32 29, label %129
    i32 30, label %131
    i32 31, label %132
    i32 32, label %135
    i32 33, label %139
    i32 34, label %142
    i32 35, label %145
    i32 36, label %146
  ]

break:                                            ; preds = %145, %142, %139, %135, %132, %131, %129, %125, %120, %117, %114, %113, %112, %107, %90, %86, %80, %78, %74, %70, %59, %57, %56, %53, %48, %44, %39, %35, %33, %32, %28, %27, %25, %23, %18, %17
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
  %9 = alloca [8 x i32], align 16
  %10 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

11:                                               ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %3, align 4
  %14 = icmp sgt i32 %13, 1
  %15 = select i1 %14, i32 2, i32 3
  store i32 %15, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 1
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @atoi(ptr noundef %19) #10
  store i32 %20, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 4, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = icmp sgt i32 %24, 2
  %26 = select i1 %25, i32 6, i32 7
  store i32 %26, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 2
  %30 = load ptr, ptr %29, align 8
  %31 = call i32 @atoi(ptr noundef %30) #10
  store i32 %31, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 -1, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %34 = load i32, ptr %5, align 4
  %35 = call i32 @abs(i32 noundef %34) #11
  store i32 %35, ptr %8, align 4
  store i32 9, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %37 = load i32, ptr %8, align 4
  %38 = icmp eq i32 %37, 0
  %39 = select i1 %38, i32 10, i32 11
  store i32 %39, ptr %b, align 4
  br label %break

40:                                               ; preds = %switch
  store i32 1, ptr %8, align 4
  store i32 11, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr @g_step, align 4
  %43 = icmp sle i32 %42, 0
  %44 = select i1 %43, i32 12, i32 13
  store i32 %44, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 1, ptr @g_step, align 4
  store i32 13, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = load i32, ptr @g_limit, align 4
  %48 = icmp sle i32 %47, 0
  %49 = select i1 %48, i32 14, i32 15
  store i32 %49, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  store i32 10, ptr @g_limit, align 4
  store i32 15, ptr %b, align 4
  br label %break

51:                                               ; preds = %switch
  %52 = load i32, ptr %8, align 4
  %53 = call i32 @_0_for_simple(i32 noundef %52)
  %54 = load i32, ptr %7, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %7, align 4
  %56 = load i32, ptr %8, align 4
  %57 = call i32 @_1_while_simple(i32 noundef %56)
  %58 = load i32, ptr %7, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, ptr %7, align 4
  %60 = load i32, ptr %8, align 4
  %61 = call i32 @_2_dowhile_simple(i32 noundef %60)
  %62 = load i32, ptr %7, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, ptr %7, align 4
  %64 = call i32 @_3_for_empty_body(i32 noundef 3)
  %65 = load i32, ptr %7, align 4
  %66 = add nsw i32 %65, %64
  store i32 %66, ptr %7, align 4
  %67 = load i32, ptr %8, align 4
  %68 = call i32 @_4_while_true_break(i32 noundef %67)
  %69 = load i32, ptr %7, align 4
  %70 = add nsw i32 %69, %68
  store i32 %70, ptr %7, align 4
  %71 = load i32, ptr %8, align 4
  %72 = call i32 @_5_for_continue(i32 noundef %71)
  %73 = load i32, ptr %7, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %7, align 4
  store i32 16, ptr %b, align 4
  br label %break

75:                                               ; preds = %switch
  %76 = load i32, ptr %6, align 4
  %77 = icmp eq i32 %76, 0
  %78 = select i1 %77, i32 17, i32 18
  store i32 %78, ptr %b, align 4
  br label %break

79:                                               ; preds = %switch
  %80 = load i32, ptr %7, align 4
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %80)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

82:                                               ; preds = %switch
  %83 = load i32, ptr %8, align 4
  %84 = load i32, ptr %8, align 4
  %85 = add nsw i32 %84, 6
  %86 = call i32 @_6_relational_loop(i32 noundef %83, i32 noundef %85)
  %87 = load i32, ptr %7, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, ptr %7, align 4
  %89 = load i32, ptr %8, align 4
  %90 = call i32 @_7_not_equal_loop(i32 noundef %89)
  %91 = load i32, ptr %7, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, ptr %7, align 4
  %93 = load i32, ptr %8, align 4
  %94 = call i32 @_8_loop_and(i32 noundef %93, i32 noundef 5)
  %95 = load i32, ptr %7, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, ptr %7, align 4
  %97 = load i32, ptr %8, align 4
  %98 = call i32 @_9_loop_or(i32 noundef %97, i32 noundef 5)
  %99 = load i32, ptr %7, align 4
  %100 = add nsw i32 %99, %98
  store i32 %100, ptr %7, align 4
  %101 = load i32, ptr %8, align 4
  %102 = call i32 @_10_nested_loop_condition(i32 noundef %101, i32 noundef 6, i32 noundef 3, i32 noundef 4)
  %103 = load i32, ptr %7, align 4
  %104 = add nsw i32 %103, %102
  store i32 %104, ptr %7, align 4
  store i32 19, ptr %b, align 4
  br label %break

105:                                              ; preds = %switch
  %106 = load i32, ptr %6, align 4
  %107 = icmp eq i32 %106, 1
  %108 = select i1 %107, i32 20, i32 21
  store i32 %108, ptr %b, align 4
  br label %break

109:                                              ; preds = %switch
  %110 = load i32, ptr %7, align 4
  %111 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %110)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

112:                                              ; preds = %switch
  %113 = load i32, ptr %8, align 4
  %114 = call i32 @_11_arithmetic_loop(i32 noundef %113)
  %115 = load i32, ptr %7, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %7, align 4
  %117 = load i32, ptr %8, align 4
  %118 = call i32 @_12_nested_arithmetic_loop(i32 noundef %117)
  %119 = load i32, ptr %7, align 4
  %120 = add nsw i32 %119, %118
  store i32 %120, ptr %7, align 4
  %121 = load i32, ptr %8, align 4
  %122 = call i32 @_13_ternary_loop_body(i32 noundef %121)
  %123 = load i32, ptr %7, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, ptr %7, align 4
  %125 = load i32, ptr %8, align 4
  %126 = call i32 @_14_multiple_accumulators(i32 noundef %125)
  %127 = load i32, ptr %7, align 4
  %128 = add nsw i32 %127, %126
  store i32 %128, ptr %7, align 4
  store i32 22, ptr %b, align 4
  br label %break

129:                                              ; preds = %switch
  %130 = load i32, ptr %6, align 4
  %131 = icmp eq i32 %130, 2
  %132 = select i1 %131, i32 23, i32 24
  store i32 %132, ptr %b, align 4
  br label %break

133:                                              ; preds = %switch
  %134 = load i32, ptr %7, align 4
  %135 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %134)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

136:                                              ; preds = %switch
  %137 = call i32 @_15_nested_for(i32 noundef 3)
  %138 = load i32, ptr %7, align 4
  %139 = add nsw i32 %138, %137
  store i32 %139, ptr %7, align 4
  %140 = call i32 @_16_for_while(i32 noundef 4)
  %141 = load i32, ptr %7, align 4
  %142 = add nsw i32 %141, %140
  store i32 %142, ptr %7, align 4
  %143 = call i32 @_17_while_dowhile(i32 noundef 3)
  %144 = load i32, ptr %7, align 4
  %145 = add nsw i32 %144, %143
  store i32 %145, ptr %7, align 4
  %146 = call i32 @_18_triple_for(i32 noundef 2)
  %147 = load i32, ptr %7, align 4
  %148 = add nsw i32 %147, %146
  store i32 %148, ptr %7, align 4
  %149 = call i32 @_19_mixed_nested_loops(i32 noundef 3)
  %150 = load i32, ptr %7, align 4
  %151 = add nsw i32 %150, %149
  store i32 %151, ptr %7, align 4
  store i32 25, ptr %b, align 4
  br label %break

152:                                              ; preds = %switch
  %153 = load i32, ptr %6, align 4
  %154 = icmp eq i32 %153, 3
  %155 = select i1 %154, i32 26, i32 27
  store i32 %155, ptr %b, align 4
  br label %break

156:                                              ; preds = %switch
  %157 = load i32, ptr %7, align 4
  %158 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %157)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

159:                                              ; preds = %switch
  %160 = call i32 @_20_inner_break(i32 noundef 5)
  %161 = load i32, ptr %7, align 4
  %162 = add nsw i32 %161, %160
  store i32 %162, ptr %7, align 4
  %163 = call i32 @_21_inner_continue(i32 noundef 5)
  %164 = load i32, ptr %7, align 4
  %165 = add nsw i32 %164, %163
  store i32 %165, ptr %7, align 4
  %166 = call i32 @_22_break_with_ternary(i32 noundef 5)
  %167 = load i32, ptr %7, align 4
  %168 = add nsw i32 %167, %166
  store i32 %168, ptr %7, align 4
  %169 = call i32 @_23_continue_and_break(i32 noundef 6)
  %170 = load i32, ptr %7, align 4
  %171 = add nsw i32 %170, %169
  store i32 %171, ptr %7, align 4
  store i32 28, ptr %b, align 4
  br label %break

172:                                              ; preds = %switch
  %173 = load i32, ptr %6, align 4
  %174 = icmp eq i32 %173, 4
  %175 = select i1 %174, i32 29, i32 30
  store i32 %175, ptr %b, align 4
  br label %break

176:                                              ; preds = %switch
  %177 = load i32, ptr %7, align 4
  %178 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %177)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

179:                                              ; preds = %switch
  %180 = load i32, ptr %8, align 4
  %181 = call i32 @_24_early_return(i32 noundef %180)
  %182 = load i32, ptr %7, align 4
  %183 = add nsw i32 %182, %181
  store i32 %183, ptr %7, align 4
  %184 = load i32, ptr %8, align 4
  %185 = call i32 @_25_nested_early_return(i32 noundef %184)
  %186 = load i32, ptr %7, align 4
  %187 = add nsw i32 %186, %185
  store i32 %187, ptr %7, align 4
  %188 = load i32, ptr %8, align 4
  %189 = call i32 @_26_multiple_returns(i32 noundef %188)
  %190 = load i32, ptr %7, align 4
  %191 = add nsw i32 %190, %189
  store i32 %191, ptr %7, align 4
  %192 = load i32, ptr %8, align 4
  %193 = call i32 @_27_dowhile_return(i32 noundef %192)
  %194 = load i32, ptr %7, align 4
  %195 = add nsw i32 %194, %193
  store i32 %195, ptr %7, align 4
  store i32 31, ptr %b, align 4
  br label %break

196:                                              ; preds = %switch
  %197 = load i32, ptr %6, align 4
  %198 = icmp eq i32 %197, 5
  %199 = select i1 %198, i32 32, i32 33
  store i32 %199, ptr %b, align 4
  br label %break

200:                                              ; preds = %switch
  %201 = load i32, ptr %7, align 4
  %202 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %201)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

203:                                              ; preds = %switch
  %204 = call i32 @_28_for_while_for(i32 noundef 3)
  %205 = load i32, ptr %7, align 4
  %206 = add nsw i32 %205, %204
  store i32 %206, ptr %7, align 4
  %207 = call i32 @_29_while_for_dowhile(i32 noundef 3)
  %208 = load i32, ptr %7, align 4
  %209 = add nsw i32 %208, %207
  store i32 %209, ptr %7, align 4
  %210 = call i32 @_30_four_level_nesting(i32 noundef 2)
  %211 = load i32, ptr %7, align 4
  %212 = add nsw i32 %211, %210
  store i32 %212, ptr %7, align 4
  store i32 34, ptr %b, align 4
  br label %break

213:                                              ; preds = %switch
  %214 = load i32, ptr %6, align 4
  %215 = icmp eq i32 %214, 6
  %216 = select i1 %215, i32 35, i32 36
  store i32 %216, ptr %b, align 4
  br label %break

217:                                              ; preds = %switch
  %218 = load i32, ptr %7, align 4
  %219 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %218)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

220:                                              ; preds = %switch
  %221 = call i32 @_31_multiple_loop_variables(i32 noundef 6)
  %222 = load i32, ptr %7, align 4
  %223 = add nsw i32 %222, %221
  store i32 %223, ptr %7, align 4
  %224 = load i32, ptr %8, align 4
  %225 = call i32 @_32_complex_update(i32 noundef %224)
  %226 = load i32, ptr %7, align 4
  %227 = add nsw i32 %226, %225
  store i32 %227, ptr %7, align 4
  %228 = call i32 @_33_decreasing_loop(i32 noundef 6)
  %229 = load i32, ptr %7, align 4
  %230 = add nsw i32 %229, %228
  store i32 %230, ptr %7, align 4
  %231 = load i32, ptr %8, align 4
  %232 = call i32 @_34_multiple_condition_values(i32 noundef %231, i32 noundef 6, i32 noundef 4)
  %233 = load i32, ptr %7, align 4
  %234 = add nsw i32 %233, %232
  store i32 %234, ptr %7, align 4
  %235 = load i32, ptr %8, align 4
  %236 = call i32 @_35_computed_loop_limit(i32 noundef %235, i32 noundef 3)
  %237 = load i32, ptr %7, align 4
  %238 = add nsw i32 %237, %236
  store i32 %238, ptr %7, align 4
  store i32 37, ptr %b, align 4
  br label %break

239:                                              ; preds = %switch
  %240 = load i32, ptr %6, align 4
  %241 = icmp eq i32 %240, 7
  %242 = select i1 %241, i32 38, i32 39
  store i32 %242, ptr %b, align 4
  br label %break

243:                                              ; preds = %switch
  %244 = load i32, ptr %7, align 4
  %245 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %244)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

246:                                              ; preds = %switch
  %247 = call i32 @_36_array_for(i32 noundef 6)
  %248 = load i32, ptr %7, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, ptr %7, align 4
  %250 = call i32 @_37_array_while(i32 noundef 6)
  %251 = load i32, ptr %7, align 4
  %252 = add nsw i32 %251, %250
  store i32 %252, ptr %7, align 4
  %253 = call i32 @_38_matrix_nested(i32 noundef 3)
  %254 = load i32, ptr %7, align 4
  %255 = add nsw i32 %254, %253
  store i32 %255, ptr %7, align 4
  %256 = call i32 @_39_array_controlled_loop(i32 noundef 6)
  %257 = load i32, ptr %7, align 4
  %258 = add nsw i32 %257, %256
  store i32 %258, ptr %7, align 4
  store i32 40, ptr %b, align 4
  br label %break

259:                                              ; preds = %switch
  %260 = load i32, ptr %6, align 4
  %261 = icmp eq i32 %260, 8
  %262 = select i1 %261, i32 41, i32 42
  store i32 %262, ptr %b, align 4
  br label %break

263:                                              ; preds = %switch
  %264 = load i32, ptr %7, align 4
  %265 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %264)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

266:                                              ; preds = %switch
  store i32 0, ptr @g_arr, align 16
  store i32 1, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 1), align 4
  store i32 -2, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 2), align 8
  store i32 3, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 3), align 4
  store i32 -4, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 4), align 16
  store i32 5, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 5), align 4
  store i32 6, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 6), align 8
  store i32 -7, ptr getelementptr inbounds ([8 x i32], ptr @g_arr, i64 0, i64 7), align 4
  %267 = call i32 @_40_array_write_loop(i32 noundef 6)
  %268 = load i32, ptr %7, align 4
  %269 = add nsw i32 %268, %267
  store i32 %269, ptr %7, align 4
  store i32 43, ptr %b, align 4
  br label %break

270:                                              ; preds = %switch
  %271 = load i32, ptr %6, align 4
  %272 = icmp eq i32 %271, 9
  %273 = select i1 %272, i32 44, i32 45
  store i32 %273, ptr %b, align 4
  br label %break

274:                                              ; preds = %switch
  %275 = load i32, ptr %7, align 4
  %276 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %275)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

277:                                              ; preds = %switch
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %9, ptr align 16 @__const.main.pointer_data, i64 32, i1 false)
  %278 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %279 = call i32 @_41_pointer_loop(ptr noundef %278, i32 noundef 6)
  %280 = load i32, ptr %7, align 4
  %281 = add nsw i32 %280, %279
  store i32 %281, ptr %7, align 4
  %282 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %283 = call i32 @_42_pointer_increment(ptr noundef %282, i32 noundef 6)
  %284 = load i32, ptr %7, align 4
  %285 = add nsw i32 %284, %283
  store i32 %285, ptr %7, align 4
  %286 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %287 = call i32 @_43_pointer_write_loop(ptr noundef %286, i32 noundef 6)
  %288 = load i32, ptr %7, align 4
  %289 = add nsw i32 %288, %287
  store i32 %289, ptr %7, align 4
  %290 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %291 = call i32 @_44_pointer_array_loop(ptr noundef %290, i32 noundef 6)
  %292 = load i32, ptr %7, align 4
  %293 = add nsw i32 %292, %291
  store i32 %293, ptr %7, align 4
  %294 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %295 = call i32 @_45_pointer_nested_loop(ptr noundef %294, i32 noundef 4)
  %296 = load i32, ptr %7, align 4
  %297 = add nsw i32 %296, %295
  store i32 %297, ptr %7, align 4
  store i32 46, ptr %b, align 4
  br label %break

298:                                              ; preds = %switch
  %299 = load i32, ptr %6, align 4
  %300 = icmp eq i32 %299, 10
  %301 = select i1 %300, i32 47, i32 48
  store i32 %301, ptr %b, align 4
  br label %break

302:                                              ; preds = %switch
  %303 = load i32, ptr %7, align 4
  %304 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %303)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

305:                                              ; preds = %switch
  store i32 0, ptr @g_x, align 4
  store i32 -3, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %306 = call i32 @_46_global_for()
  %307 = load i32, ptr %7, align 4
  %308 = add nsw i32 %307, %306
  store i32 %308, ptr %7, align 4
  %309 = call i32 @_47_global_while()
  %310 = load i32, ptr %7, align 4
  %311 = add nsw i32 %310, %309
  store i32 %311, ptr %7, align 4
  %312 = call i32 @_48_global_array_loop()
  %313 = load i32, ptr %7, align 4
  %314 = add nsw i32 %313, %312
  store i32 %314, ptr %7, align 4
  %315 = call i32 @_49_global_matrix_loop()
  %316 = load i32, ptr %7, align 4
  %317 = add nsw i32 %316, %315
  store i32 %317, ptr %7, align 4
  %318 = load i32, ptr %8, align 4
  store i32 %318, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %319 = call i32 @_50_global_state_loop()
  %320 = load i32, ptr %7, align 4
  %321 = add nsw i32 %320, %319
  store i32 %321, ptr %7, align 4
  store i32 0, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  %322 = call i32 @_51_global_nested()
  %323 = load i32, ptr %7, align 4
  %324 = add nsw i32 %323, %322
  store i32 %324, ptr %7, align 4
  store i32 49, ptr %b, align 4
  br label %break

325:                                              ; preds = %switch
  %326 = load i32, ptr %6, align 4
  %327 = icmp eq i32 %326, 11
  %328 = select i1 %327, i32 50, i32 51
  store i32 %328, ptr %b, align 4
  br label %break

329:                                              ; preds = %switch
  %330 = load i32, ptr %7, align 4
  %331 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %330)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

332:                                              ; preds = %switch
  %333 = load i32, ptr %8, align 4
  %334 = call i32 @_52_loop_carried_value(i32 noundef %333)
  %335 = load i32, ptr %7, align 4
  %336 = add nsw i32 %335, %334
  store i32 %336, ptr %7, align 4
  %337 = load i32, ptr %8, align 4
  %338 = call i32 @_53_multiple_loop_carried(i32 noundef %337)
  %339 = load i32, ptr %7, align 4
  %340 = add nsw i32 %339, %338
  store i32 %340, ptr %7, align 4
  %341 = load i32, ptr %8, align 4
  %342 = call i32 @_54_nested_loop_carried(i32 noundef %341)
  %343 = load i32, ptr %7, align 4
  %344 = add nsw i32 %343, %342
  store i32 %344, ptr %7, align 4
  %345 = load i32, ptr %8, align 4
  %346 = call i32 @_55_value_after_loop(i32 noundef %345)
  %347 = load i32, ptr %7, align 4
  %348 = add nsw i32 %347, %346
  store i32 %348, ptr %7, align 4
  store i32 52, ptr %b, align 4
  br label %break

349:                                              ; preds = %switch
  %350 = load i32, ptr %6, align 4
  %351 = icmp eq i32 %350, 12
  %352 = select i1 %351, i32 53, i32 54
  store i32 %352, ptr %b, align 4
  br label %break

353:                                              ; preds = %switch
  %354 = load i32, ptr %7, align 4
  %355 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %354)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

356:                                              ; preds = %switch
  %357 = load i32, ptr %8, align 4
  %358 = call i32 @_56_prefix_loop(i32 noundef %357, i32 noundef 2, i32 noundef 4)
  %359 = load i32, ptr %7, align 4
  %360 = add nsw i32 %359, %358
  store i32 %360, ptr %7, align 4
  %361 = load i32, ptr %8, align 4
  %362 = call i32 @_57_suffix_loop(i32 noundef %361)
  %363 = load i32, ptr %7, align 4
  %364 = add nsw i32 %363, %362
  store i32 %364, ptr %7, align 4
  %365 = load i32, ptr %8, align 4
  %366 = call i32 @_58_prefix_nested_suffix(i32 noundef %365, i32 noundef 4)
  %367 = load i32, ptr %7, align 4
  %368 = add nsw i32 %367, %366
  store i32 %368, ptr %7, align 4
  store i32 55, ptr %b, align 4
  br label %break

369:                                              ; preds = %switch
  %370 = load i32, ptr %6, align 4
  %371 = icmp eq i32 %370, 13
  %372 = select i1 %371, i32 56, i32 57
  store i32 %372, ptr %b, align 4
  br label %break

373:                                              ; preds = %switch
  %374 = load i32, ptr %7, align 4
  %375 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %374)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

376:                                              ; preds = %switch
  %377 = load i32, ptr %8, align 4
  %378 = call i32 @_59_ternary_loop_limit(i32 noundef %377, i32 noundef 5)
  %379 = load i32, ptr %7, align 4
  %380 = add nsw i32 %379, %378
  store i32 %380, ptr %7, align 4
  %381 = call i32 @_60_ternary_loop_update(i32 noundef 6)
  %382 = load i32, ptr %7, align 4
  %383 = add nsw i32 %382, %381
  store i32 %383, ptr %7, align 4
  %384 = call i32 @_61_nested_ternary_loops(i32 noundef 6)
  %385 = load i32, ptr %7, align 4
  %386 = add nsw i32 %385, %384
  store i32 %386, ptr %7, align 4
  store i32 58, ptr %b, align 4
  br label %break

387:                                              ; preds = %switch
  %388 = load i32, ptr %6, align 4
  %389 = icmp eq i32 %388, 14
  %390 = select i1 %389, i32 59, i32 60
  store i32 %390, ptr %b, align 4
  br label %break

391:                                              ; preds = %switch
  %392 = load i32, ptr %7, align 4
  %393 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %392)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

394:                                              ; preds = %switch
  %395 = load i32, ptr %8, align 4
  %396 = call i32 @_62_dynamic_alloca(i32 noundef 4, i32 noundef %395)
  %397 = load i32, ptr %7, align 4
  %398 = add nsw i32 %397, %396
  store i32 %398, ptr %7, align 4
  %399 = load i32, ptr %8, align 4
  %400 = call i32 @_63_dynamic_alloca_pointer(i32 noundef 5, i32 noundef %399)
  %401 = load i32, ptr %7, align 4
  %402 = add nsw i32 %401, %400
  store i32 %402, ptr %7, align 4
  %403 = load i32, ptr %8, align 4
  %404 = call i32 @_64_dynamic_alloca_nested(i32 noundef 4, i32 noundef %403)
  %405 = load i32, ptr %7, align 4
  %406 = add nsw i32 %405, %404
  store i32 %406, ptr %7, align 4
  store i32 61, ptr %b, align 4
  br label %break

407:                                              ; preds = %switch
  %408 = load i32, ptr %6, align 4
  %409 = icmp eq i32 %408, 15
  %410 = select i1 %409, i32 62, i32 63
  store i32 %410, ptr %b, align 4
  br label %break

411:                                              ; preds = %switch
  %412 = load i32, ptr %7, align 4
  %413 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %412)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

414:                                              ; preds = %switch
  %415 = load i32, ptr %8, align 4
  %416 = call i32 @_65_malloc_loop(i32 noundef 4, i32 noundef %415)
  %417 = load i32, ptr %7, align 4
  %418 = add nsw i32 %417, %416
  store i32 %418, ptr %7, align 4
  %419 = load i32, ptr %8, align 4
  %420 = call i32 @_66_malloc_nested(i32 noundef 4, i32 noundef %419, i32 noundef 3)
  %421 = load i32, ptr %7, align 4
  %422 = add nsw i32 %421, %420
  store i32 %422, ptr %7, align 4
  store i32 64, ptr %b, align 4
  br label %break

423:                                              ; preds = %switch
  %424 = load i32, ptr %6, align 4
  %425 = icmp eq i32 %424, 16
  %426 = select i1 %425, i32 65, i32 66
  store i32 %426, ptr %b, align 4
  br label %break

427:                                              ; preds = %switch
  %428 = load i32, ptr %7, align 4
  %429 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %428)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

430:                                              ; preds = %switch
  store i32 0, ptr @g_void_result, align 4
  %431 = load i32, ptr %8, align 4
  call void @_67_void_for(i32 noundef %431)
  %432 = load i32, ptr %8, align 4
  call void @_68_void_while(i32 noundef %432)
  %433 = load i32, ptr %8, align 4
  call void @_69_void_dowhile(i32 noundef %433)
  %434 = load i32, ptr %8, align 4
  call void @_70_void_nested(i32 noundef %434)
  %435 = load i32, ptr %8, align 4
  call void @_71_void_continue(i32 noundef %435)
  store i32 0, ptr @g_x, align 4
  store i32 0, ptr @g_y, align 4
  store i32 7, ptr @g_z, align 4
  call void @_72_void_global_only()
  %436 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  call void @_73_void_pointer(ptr noundef %436, i32 noundef 6)
  call void @_74_void_array(i32 noundef 6)
  %437 = load i32, ptr @g_void_result, align 4
  %438 = load i32, ptr %7, align 4
  %439 = add nsw i32 %438, %437
  store i32 %439, ptr %7, align 4
  store i32 67, ptr %b, align 4
  br label %break

440:                                              ; preds = %switch
  %441 = load i32, ptr %6, align 4
  %442 = icmp eq i32 %441, 17
  %443 = select i1 %442, i32 68, i32 69
  store i32 %443, ptr %b, align 4
  br label %break

444:                                              ; preds = %switch
  %445 = load i32, ptr %7, align 4
  %446 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %445)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

447:                                              ; preds = %switch
  %448 = load i32, ptr %8, align 4
  %449 = call i32 @_75_loop_return_paths(i32 noundef %448)
  %450 = load i32, ptr %7, align 4
  %451 = add nsw i32 %450, %449
  store i32 %451, ptr %7, align 4
  %452 = load i32, ptr %8, align 4
  %453 = call i32 @_76_nested_return_paths(i32 noundef %452)
  %454 = load i32, ptr %7, align 4
  %455 = add nsw i32 %454, %453
  store i32 %455, ptr %7, align 4
  %456 = load i32, ptr %8, align 4
  %457 = call i32 @_77_loop_final_returns(i32 noundef %456)
  %458 = load i32, ptr %7, align 4
  %459 = add nsw i32 %458, %457
  store i32 %459, ptr %7, align 4
  store i32 70, ptr %b, align 4
  br label %break

460:                                              ; preds = %switch
  %461 = load i32, ptr %6, align 4
  %462 = icmp eq i32 %461, 18
  %463 = select i1 %462, i32 71, i32 72
  store i32 %463, ptr %b, align 4
  br label %break

464:                                              ; preds = %switch
  %465 = load i32, ptr %7, align 4
  %466 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %465)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

467:                                              ; preds = %switch
  %468 = load i32, ptr %8, align 4
  %469 = call i32 @_78_state_machine_loop(i32 noundef %468)
  %470 = load i32, ptr %7, align 4
  %471 = add nsw i32 %470, %469
  store i32 %471, ptr %7, align 4
  %472 = load i32, ptr %8, align 4
  %473 = call i32 @_79_multiple_backedge_values(i32 noundef %472)
  %474 = load i32, ptr %7, align 4
  %475 = add nsw i32 %474, %473
  store i32 %475, ptr %7, align 4
  %476 = load i32, ptr %8, align 4
  %477 = call i32 @_80_nested_state(i32 noundef %476)
  %478 = load i32, ptr %7, align 4
  %479 = add nsw i32 %478, %477
  store i32 %479, ptr %7, align 4
  store i32 73, ptr %b, align 4
  br label %break

480:                                              ; preds = %switch
  %481 = load i32, ptr %6, align 4
  %482 = icmp eq i32 %481, 19
  %483 = select i1 %482, i32 74, i32 75
  store i32 %483, ptr %b, align 4
  br label %break

484:                                              ; preds = %switch
  %485 = load i32, ptr %7, align 4
  %486 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %485)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

487:                                              ; preds = %switch
  %488 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  store i32 1, ptr %488, align 16
  %489 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 1
  store i32 2, ptr %489, align 4
  %490 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 2
  store i32 3, ptr %490, align 8
  %491 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 3
  store i32 4, ptr %491, align 4
  %492 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 4
  store i32 5, ptr %492, align 16
  %493 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 5
  store i32 6, ptr %493, align 4
  %494 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 6
  store i32 7, ptr %494, align 8
  %495 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 7
  store i32 8, ptr %495, align 4
  %496 = getelementptr inbounds [8 x i32], ptr %9, i64 0, i64 0
  %497 = call i32 @_81_array_pointer_nested(ptr noundef %496, i32 noundef 5)
  %498 = load i32, ptr %7, align 4
  %499 = add nsw i32 %498, %497
  store i32 %499, ptr %7, align 4
  %500 = call i32 @_82_matrix_state(i32 noundef 3)
  %501 = load i32, ptr %7, align 4
  %502 = add nsw i32 %501, %500
  store i32 %502, ptr %7, align 4
  store i32 76, ptr %b, align 4
  br label %break

503:                                              ; preds = %switch
  %504 = load i32, ptr %6, align 4
  %505 = icmp eq i32 %504, 20
  %506 = select i1 %505, i32 77, i32 78
  store i32 %506, ptr %b, align 4
  br label %break

507:                                              ; preds = %switch
  %508 = load i32, ptr %7, align 4
  %509 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %508)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

510:                                              ; preds = %switch
  %511 = load i32, ptr %8, align 4
  store i32 %511, ptr %10, align 4
  %512 = load i32, ptr %8, align 4
  %513 = call i32 @_83_complex_loop_control(ptr noundef %10, i32 noundef 5, i32 noundef %512, i32 noundef 3)
  %514 = load i32, ptr %7, align 4
  %515 = add nsw i32 %514, %513
  store i32 %515, ptr %7, align 4
  %516 = load i32, ptr %8, align 4
  %517 = call i32 @_84_complex_loop_state(ptr noundef %10, i32 noundef 6, i32 noundef %516, i32 noundef 3, i32 noundef 5)
  %518 = load i32, ptr %7, align 4
  %519 = add nsw i32 %518, %517
  store i32 %519, ptr %7, align 4
  %520 = load i32, ptr %8, align 4
  %521 = call i32 @_85_loop_stress(ptr noundef %10, i32 noundef 6, i32 noundef %520, i32 noundef 3, i32 noundef 5)
  %522 = load i32, ptr %7, align 4
  %523 = add nsw i32 %522, %521
  store i32 %523, ptr %7, align 4
  store i32 79, ptr %b, align 4
  br label %break

524:                                              ; preds = %switch
  %525 = load i32, ptr %6, align 4
  %526 = icmp eq i32 %525, 21
  %527 = select i1 %526, i32 80, i32 81
  store i32 %527, ptr %b, align 4
  br label %break

528:                                              ; preds = %switch
  %529 = load i32, ptr %7, align 4
  %530 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %529)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

531:                                              ; preds = %switch
  %532 = load i32, ptr %7, align 4
  %533 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %532)
  store i32 0, ptr %2, align 4
  store i32 82, ptr %b, align 4
  br label %break

534:                                              ; preds = %switch
  %535 = load i32, ptr %2, align 4
  ret i32 %535

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %11
    i32 1, label %12
    i32 2, label %16
    i32 3, label %21
    i32 4, label %22
    i32 5, label %23
    i32 6, label %27
    i32 7, label %32
    i32 8, label %33
    i32 9, label %36
    i32 10, label %40
    i32 11, label %41
    i32 12, label %45
    i32 13, label %46
    i32 14, label %50
    i32 15, label %51
    i32 16, label %75
    i32 17, label %79
    i32 18, label %82
    i32 19, label %105
    i32 20, label %109
    i32 21, label %112
    i32 22, label %129
    i32 23, label %133
    i32 24, label %136
    i32 25, label %152
    i32 26, label %156
    i32 27, label %159
    i32 28, label %172
    i32 29, label %176
    i32 30, label %179
    i32 31, label %196
    i32 32, label %200
    i32 33, label %203
    i32 34, label %213
    i32 35, label %217
    i32 36, label %220
    i32 37, label %239
    i32 38, label %243
    i32 39, label %246
    i32 40, label %259
    i32 41, label %263
    i32 42, label %266
    i32 43, label %270
    i32 44, label %274
    i32 45, label %277
    i32 46, label %298
    i32 47, label %302
    i32 48, label %305
    i32 49, label %325
    i32 50, label %329
    i32 51, label %332
    i32 52, label %349
    i32 53, label %353
    i32 54, label %356
    i32 55, label %369
    i32 56, label %373
    i32 57, label %376
    i32 58, label %387
    i32 59, label %391
    i32 60, label %394
    i32 61, label %407
    i32 62, label %411
    i32 63, label %414
    i32 64, label %423
    i32 65, label %427
    i32 66, label %430
    i32 67, label %440
    i32 68, label %444
    i32 69, label %447
    i32 70, label %460
    i32 71, label %464
    i32 72, label %467
    i32 73, label %480
    i32 74, label %484
    i32 75, label %487
    i32 76, label %503
    i32 77, label %507
    i32 78, label %510
    i32 79, label %524
    i32 80, label %528
    i32 81, label %531
    i32 82, label %534
  ]

break:                                            ; preds = %531, %528, %524, %510, %507, %503, %487, %484, %480, %467, %464, %460, %447, %444, %440, %430, %427, %423, %414, %411, %407, %394, %391, %387, %376, %373, %369, %356, %353, %349, %332, %329, %325, %305, %302, %298, %277, %274, %270, %266, %263, %259, %246, %243, %239, %220, %217, %213, %203, %200, %196, %179, %176, %172, %159, %156, %152, %136, %133, %129, %112, %109, %105, %82, %79, %75, %51, %50, %46, %45, %41, %40, %36, %33, %32, %27, %23, %22, %21, %16, %12, %11
  br label %switch
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

; Function Attrs: nounwind willreturn memory(none)
declare i32 @abs(i32 noundef) #5

declare i32 @printf(ptr noundef, ...) #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #7

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { nounwind }
attributes #10 = { nounwind willreturn memory(read) }
attributes #11 = { nounwind willreturn memory(none) }

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
