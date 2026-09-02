; ModuleID = 'main.bc'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalvar = dso_local global i32 10, align 4
@.str = private unnamed_addr constant [35 x i8] c"_1_loop_with_if_inside: c=%d even\0A\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"_1_loop_with_if_inside: c=%d odd\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"_2_if_with_loop_in_both_branches: a>b, c=%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [46 x i8] c"_2_if_with_loop_in_both_branches: a<=b, c=%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [42 x i8] c"_3_nested_loop_if_loop: c=%d, inner d=%d\0A\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"_3_nested_loop_if_loop: c=%d, no inner loop\0A\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"_4_manyblocks_loop: c=%d even and diff>0\0A\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"_4_manyblocks_loop: c=%d other\0A\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"_5_ternary_loop: c=%d label=%d\0A\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"--- _1 normal ---\0A\00", align 1
@.str.11 = private unnamed_addr constant [29 x i8] c"--- _1 CFF (high-level) ---\0A\00", align 1
@.str.12 = private unnamed_addr constant [27 x i8] c"--- _2 call 1 (a > b) ---\0A\00", align 1
@.str.13 = private unnamed_addr constant [28 x i8] c"--- _2 call 2 (a <= b) ---\0A\00", align 1
@.str.14 = private unnamed_addr constant [31 x i8] c"--- _3 call 1 (only path) ---\0A\00", align 1
@.str.15 = private unnamed_addr constant [19 x i8] c"--- _4 call 1 ---\0A\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"--- _5 call 1 ---\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_loop_with_if_inside(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  br label %while

6:                                                ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  %8 = load i32, ptr %5, align 4
  %9 = icmp slt i32 %8, 5
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %5, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = load i32, ptr %5, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15)
  store i32 4, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %5, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %18)
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !8

24:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %10
    i32 3, label %14
    i32 4, label %20
    i32 5, label %21
    i32 6, label %17
    i32 7, label %24
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %17, %21, %20, %14, %break_con4, %break_con, %6, %default
  br label %while

true:                                             ; preds = %7
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %10
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_2_if_with_loop_in_both_branches(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  br label %while

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %8, %9
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 2, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %true2, label %false3

15:                                               ; preds = %switch
  %16 = load i32, ptr %5, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %16)
  store i32 4, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  store i32 2, ptr %b, align 4
  br label %break, !llvm.loop !10

21:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %24, 3
  br i1 %25, label %true5, label %false6

26:                                               ; preds = %switch
  %27 = load i32, ptr %6, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %27)
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  store i32 8, ptr %b, align 4
  br label %break, !llvm.loop !11

31:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %11
    i32 2, label %12
    i32 3, label %15
    i32 4, label %18
    i32 5, label %21
    i32 6, label %32
    i32 7, label %22
    i32 8, label %23
    i32 9, label %26
    i32 10, label %31
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %31, %26, %break_con7, %22, %21, %18, %15, %break_con4, %11, %break_con, %default
  br label %while

true:                                             ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %12
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %12
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %23
  store i32 9, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %23
  store i32 10, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_nested_loop_if_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  br label %while

7:                                                ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 1
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 4, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %6, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %true5, label %false6

18:                                               ; preds = %switch
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %6, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %19, i32 noundef %20)
  store i32 6, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %6, align 4
  store i32 4, ptr %b, align 4
  br label %break, !llvm.loop !12

25:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %5, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %27)
  store i32 8, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  store i32 9, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !13

33:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %14
    i32 4, label %15
    i32 5, label %18
    i32 6, label %22
    i32 7, label %25
    i32 8, label %29
    i32 9, label %30
    i32 10, label %26
    i32 11, label %33
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %26, %30, %29, %25, %22, %18, %break_con7, %14, %break_con4, %break_con, %7, %default
  br label %while

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 11, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %11
  store i32 10, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %15
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %15
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_4_manyblocks_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  br label %while

9:                                                ; preds = %switch
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %5, align 4
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %13, %14
  store i32 %15, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %true, label %false

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  store i32 %20, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 5, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %7, align 4
  %24 = icmp sgt i32 %23, 10
  br i1 %24, label %true2, label %false3

25:                                               ; preds = %switch
  store i32 10, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 0, ptr %8, align 4
  store i32 6, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %7, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %true5, label %false6

31:                                               ; preds = %switch
  %32 = load i32, ptr %8, align 4
  %33 = srem i32 %32, 2
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %true8, label %false9

35:                                               ; preds = %switch
  %36 = load i32, ptr %6, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %true11, label %false12

38:                                               ; preds = %switch
  %39 = load i32, ptr %8, align 4
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %39)
  store i32 10, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %8, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %42)
  store i32 10, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  store i32 11, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %8, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %8, align 4
  store i32 6, ptr %b, align 4
  br label %break, !llvm.loop !14

48:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %16
    i32 2, label %19
    i32 3, label %22
    i32 4, label %25
    i32 5, label %26
    i32 6, label %27
    i32 7, label %31
    i32 8, label %35
    i32 9, label %38
    i32 10, label %44
    i32 11, label %45
    i32 12, label %41
    i32 13, label %48
    i32 14, label %21
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %21, %41, %45, %44, %38, %break_con13, %break_con10, %break_con7, %26, %25, %break_con4, %19, %break_con, %9, %default
  br label %while

true:                                             ; preds = %16
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %16
  store i32 14, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %22
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %22
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %27
  store i32 7, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %27
  store i32 13, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %31
  store i32 8, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %31
  store i32 12, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %35
  store i32 9, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %35
  store i32 12, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_5_ternary_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  %.reg2mem = alloca i1, align 1
  %.reg2mem1 = alloca i32, align 4
  br label %while

7:                                                ; preds = %switch
  store i32 0, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 4
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = load i32, ptr %5, align 4
  %13 = srem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %true4, label %false5

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %true7, label %false8

18:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem1, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %4, align 4
  %22 = icmp sgt i32 %20, %21
  store i1 true, ptr %.reg2mem, align 1
  br i1 %22, label %true10, label %false11

23:                                               ; preds = %switch
  %24 = load i32, ptr %3, align 4
  %25 = icmp slt i32 %24, 0
  store i1 %25, ptr %.reg2mem, align 1
  store i32 8, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %27 = zext i1 %.reload to i64
  %28 = select i1 %.reload, i32 2, i32 3
  store i32 %28, ptr %.reg2mem1, align 4
  store i32 5, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %6, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %30, i32 noundef %31)
  store i32 6, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !15

36:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %11
    i32 3, label %15
    i32 4, label %18
    i32 5, label %29
    i32 6, label %33
    i32 7, label %19
    i32 8, label %26
    i32 9, label %23
    i32 10, label %36
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %23, %26, %break_con12, %33, %29, %18, %break_con9, %break_con6, %break_con, %7, %default
  br label %while

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 10, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true4:                                            ; preds = %11
  store i32 3, ptr %b, align 4
  br label %break_con6

false5:                                           ; preds = %11
  store i32 7, ptr %b, align 4
  br label %break_con6

break_con6:                                       ; preds = %true4, %false5
  br label %break

true7:                                            ; preds = %15
  store i32 4, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %15
  store i32 7, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break

true10:                                           ; preds = %19
  store i32 8, ptr %b, align 4
  br label %break_con12

false11:                                          ; preds = %19
  store i32 9, ptr %b, align 4
  br label %break_con12

break_con12:                                      ; preds = %true10, %false11
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store i32 0, ptr %b, align 4
  store ptr %1, ptr %5, align 8
  br label %while

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %8)
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #3
  store i32 %18, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  call void @_1_loop_with_if_inside(i32 noundef 0, i32 noundef 0)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @_2_if_with_loop_in_both_branches(i32 noundef 5, i32 noundef 2)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  call void @_2_if_with_loop_in_both_branches(i32 noundef 2, i32 noundef 5)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  call void @_3_nested_loop_if_loop(i32 noundef 0, i32 noundef 0)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @_4_manyblocks_loop(i32 noundef 3, i32 noundef 2)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  call void @_5_ternary_loop(i32 noundef 3, i32 noundef 2)
  ret i32 0

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %13
    i32 3, label %19
    i32 4, label %14
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %14, %13, %break_con, %7, %default
  br label %while

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) }

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
