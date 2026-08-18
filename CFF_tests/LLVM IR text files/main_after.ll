; ModuleID = 'main.bc'
source_filename = "/home/xenia/Projects/mini-obfuscator-llvm-pass/CFF_tests/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"before if 1\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"inside if 1\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"after if 1\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"inside if 1 else\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"inside if 2\0A\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"before if 3\0A\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"inside if 3\0A\00", align 1
@.str.7 = private unnamed_addr constant [18 x i8] c"inside if 3 else\0A\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"after if 3\0A\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"before if 2\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"inside if 2 else\0A\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"after if 2\0A\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"inside if 1.2\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"inside if 1.2 else\0A\00", align 1
@.str.14 = private unnamed_addr constant [17 x i8] c"inside if 1.2.3\0A\00", align 1
@.str.15 = private unnamed_addr constant [19 x i8] c"inside if 1.2.3.4\0A\00", align 1
@.str.16 = private unnamed_addr constant [24 x i8] c"inside if 1.2.3.4 else\0A\00", align 1
@.str.17 = private unnamed_addr constant [22 x i8] c"inside if 1.2.3 else\0A\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.19 = private unnamed_addr constant [21 x i8] c"\0A=== _1_ifalone ===\0A\00", align 1
@.str.20 = private unnamed_addr constant [28 x i8] c"_1_ifalone (x > 0 [TRUE]):\0A\00", align 1
@.str.21 = private unnamed_addr constant [29 x i8] c"_1_ifalone (x > 0 [FALSE]):\0A\00", align 1
@.str.22 = private unnamed_addr constant [20 x i8] c"\0A=== _2_ifelse ===\0A\00", align 1
@.str.23 = private unnamed_addr constant [27 x i8] c"_2_ifelse (x > 0 [TRUE]):\0A\00", align 1
@.str.24 = private unnamed_addr constant [28 x i8] c"_2_ifelse (x > 0 [FALSE]):\0A\00", align 1
@.str.25 = private unnamed_addr constant [20 x i8] c"\0A=== _3_ifflat ===\0A\00", align 1
@.str.26 = private unnamed_addr constant [52 x i8] c"_3_ifflat (is_even [TRUE], x == threshold [TRUE]):\0A\00", align 1
@.str.27 = private unnamed_addr constant [53 x i8] c"_3_ifflat (is_even [TRUE], x == threshold [FALSE]):\0A\00", align 1
@.str.28 = private unnamed_addr constant [60 x i8] c"_3_ifflat (is_positive_odd [TRUE], x == threshold [TRUE]):\0A\00", align 1
@.str.29 = private unnamed_addr constant [61 x i8] c"_3_ifflat (is_positive_odd [TRUE], x == threshold [FALSE]):\0A\00", align 1
@.str.30 = private unnamed_addr constant [68 x i8] c"_3_ifflat (neither even nor odd positive, x == threshold [FALSE]):\0A\00", align 1
@.str.31 = private unnamed_addr constant [25 x i8] c"\0A=== _4_prefixheavy ===\0A\00", align 1
@.str.32 = private unnamed_addr constant [41 x i8] c"_4_prefixheavy (clamped == cap [TRUE]):\0A\00", align 1
@.str.33 = private unnamed_addr constant [42 x i8] c"_4_prefixheavy (clamped == cap [FALSE]):\0A\00", align 1
@.str.34 = private unnamed_addr constant [24 x i8] c"\0A=== _5_multistage ===\0A\00", align 1
@.str.35 = private unnamed_addr constant [42 x i8] c"_5_multistage (weighted > limit [TRUE]):\0A\00", align 1
@.str.36 = private unnamed_addr constant [43 x i8] c"_5_multistage (weighted > limit [FALSE]):\0A\00", align 1
@.str.37 = private unnamed_addr constant [22 x i8] c"\0A=== _6_ifnested ===\0A\00", align 1
@.str.38 = private unnamed_addr constant [44 x i8] c"_6_ifnested (Path 1: Outer x > 0 [FALSE]):\0A\00", align 1
@.str.39 = private unnamed_addr constant [58 x i8] c"_6_ifnested (Path 2: x > 0 [TRUE], x mod 2 == 0 [TRUE]):\0A\00", align 1
@.str.40 = private unnamed_addr constant [67 x i8] c"_6_ifnested (Path 3: x > 0 [TRUE], x mod 2 != 0, x == 3 [FALSE]):\0A\00", align 1
@.str.41 = private unnamed_addr constant [83 x i8] c"_6_ifnested (Path 4: x > 0 [TRUE], x mod 2 != 0, x == 3 [TRUE], x == 20 [FALSE]):\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifalone(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %b, align 4
  br label %while

8:                                                ; preds = %switch
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %6, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %true, label %false

16:                                               ; preds = %switch
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %5, align 4
  %20 = mul nsw i32 %18, %19
  store i32 %20, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %13
    i32 2, label %16
    i32 3, label %21
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %16, %break_con, %8, %default
  br label %while

true:                                             ; preds = %13
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %13
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_2_ifelse(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %b, align 4
  br label %while

8:                                                ; preds = %switch
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %10 = load i32, ptr %4, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %true, label %false

15:                                               ; preds = %switch
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %17, %18
  store i32 %19, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %6, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %12
    i32 2, label %15
    i32 3, label %25
    i32 4, label %20
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %20, %15, %break_con, %8, %default
  br label %while

true:                                             ; preds = %12
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %12
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifflat(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %b, align 4
  %.reg2mem = alloca i1, align 1
  %.reg2mem1 = alloca i1, align 1
  br label %while

13:                                               ; preds = %switch
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = zext i1 %16 to i32
  store i32 %17, ptr %9, align 4
  store i32 1, ptr %b, align 4
  br label %break

18:                                               ; preds = %switch
  %19 = load i32, ptr %9, align 4
  %20 = icmp ne i32 %19, 0
  store i1 false, ptr %.reg2mem, align 1
  br i1 %20, label %true, label %false

21:                                               ; preds = %switch
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %6, align 4
  %24 = srem i32 %22, %23
  %25 = icmp eq i32 %24, 0
  store i1 %25, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %27 = zext i1 %.reload to i32
  store i32 %27, ptr %10, align 4
  store i32 4, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %9, align 4
  %30 = icmp ne i32 %29, 0
  store i1 false, ptr %.reg2mem1, align 1
  br i1 %30, label %true4, label %false5

31:                                               ; preds = %switch
  %32 = load i32, ptr %10, align 4
  %33 = icmp ne i32 %32, 0
  %34 = xor i1 %33, true
  store i1 %34, ptr %.reg2mem1, align 1
  store i32 6, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %36 = zext i1 %.reload2 to i32
  store i32 %36, ptr %11, align 4
  %37 = load i32, ptr %5, align 4
  store i32 %37, ptr %12, align 4
  store i32 7, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %10, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %true7, label %false8

41:                                               ; preds = %switch
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 9, ptr %b, align 4
  br label %break

43:                                               ; preds = %switch
  %44 = load i32, ptr %11, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %true10, label %false11

46:                                               ; preds = %switch
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 11, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 12, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %5, align 4
  %52 = load i32, ptr %7, align 4
  %53 = icmp eq i32 %51, %52
  br i1 %53, label %true13, label %false14

54:                                               ; preds = %switch
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %56 = load i32, ptr %7, align 4
  store i32 %56, ptr %12, align 4
  store i32 14, ptr %b, align 4
  br label %break

57:                                               ; preds = %switch
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %59 = load i32, ptr %8, align 4
  store i32 %59, ptr %12, align 4
  store i32 14, ptr %b, align 4
  br label %break

60:                                               ; preds = %switch
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %13
    i32 1, label %18
    i32 2, label %21
    i32 3, label %26
    i32 4, label %28
    i32 5, label %31
    i32 6, label %35
    i32 7, label %38
    i32 8, label %41
    i32 9, label %43
    i32 10, label %46
    i32 11, label %48
    i32 12, label %50
    i32 13, label %54
    i32 14, label %60
    i32 15, label %57
  ]

while:                                            ; preds = %4, %break
  br label %switch

break:                                            ; preds = %57, %54, %break_con15, %48, %46, %break_con12, %41, %break_con9, %35, %31, %break_con6, %26, %21, %break_con, %13, %default
  br label %while

true:                                             ; preds = %18
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %18
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true4:                                            ; preds = %28
  store i32 5, ptr %b, align 4
  br label %break_con6

false5:                                           ; preds = %28
  store i32 6, ptr %b, align 4
  br label %break_con6

break_con6:                                       ; preds = %true4, %false5
  br label %break

true7:                                            ; preds = %38
  store i32 8, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %38
  store i32 9, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break

true10:                                           ; preds = %43
  store i32 10, ptr %b, align 4
  br label %break_con12

false11:                                          ; preds = %43
  store i32 11, ptr %b, align 4
  br label %break_con12

break_con12:                                      ; preds = %true10, %false11
  br label %break

true13:                                           ; preds = %50
  store i32 13, ptr %b, align 4
  br label %break_con15

false14:                                          ; preds = %50
  store i32 15, ptr %b, align 4
  br label %break_con15

break_con15:                                      ; preds = %true13, %false14
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_4_prefixheavy(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %b, align 4
  %.reg2mem = alloca i32, align 4
  br label %while

12:                                               ; preds = %switch
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = mul nsw i32 %14, %15
  store i32 %16, ptr %9, align 4
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %10, align 4
  store i32 1, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %10, align 4
  %22 = load i32, ptr %8, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %true, label %false

24:                                               ; preds = %switch
  %25 = load i32, ptr %8, align 4
  store i32 %25, ptr %.reg2mem, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %10, align 4
  store i32 %27, ptr %.reg2mem, align 4
  store i32 3, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %11, align 4
  store i32 4, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = load i32, ptr %11, align 4
  %31 = load i32, ptr %8, align 4
  %32 = icmp eq i32 %30, %31
  br i1 %32, label %true2, label %false3

33:                                               ; preds = %switch
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %35 = load i32, ptr %11, align 4
  %36 = sub nsw i32 %35, 1
  store i32 %36, ptr %11, align 4
  store i32 6, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %12
    i32 1, label %20
    i32 2, label %24
    i32 3, label %28
    i32 4, label %29
    i32 5, label %33
    i32 6, label %37
    i32 7, label %26
  ]

while:                                            ; preds = %4, %break
  br label %switch

break:                                            ; preds = %26, %33, %break_con4, %28, %24, %break_con, %12, %default
  br label %while

true:                                             ; preds = %20
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %20
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %29
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %29
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_5_multistage(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %b, align 4
  br label %while

12:                                               ; preds = %switch
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %9, align 4
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %7, align 4
  %19 = mul nsw i32 %17, %18
  store i32 %19, ptr %10, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  store i32 1, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %10, align 4
  %23 = load i32, ptr %8, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %true, label %false

25:                                               ; preds = %switch
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %27 = load i32, ptr %10, align 4
  %28 = sdiv i32 %27, 2
  store i32 %28, ptr %10, align 4
  store i32 3, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %31 = load i32, ptr %10, align 4
  %32 = add nsw i32 %31, 10
  store i32 %32, ptr %10, align 4
  store i32 3, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %10, align 4
  %35 = load i32, ptr %5, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %11, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %12
    i32 1, label %21
    i32 2, label %25
    i32 3, label %33
    i32 4, label %29
  ]

while:                                            ; preds = %4, %break
  br label %switch

break:                                            ; preds = %29, %25, %break_con, %12, %default
  br label %while

true:                                             ; preds = %21
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %21
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_6_ifnested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %b, align 4
  br label %while

7:                                                ; preds = %switch
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load i32, ptr %4, align 4
  %16 = srem i32 %15, 2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %true2, label %false3

18:                                               ; preds = %switch
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  store i32 5, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  store i32 8, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %4, align 4
  %24 = icmp eq i32 %23, 3
  br i1 %24, label %true5, label %false6

25:                                               ; preds = %switch
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  store i32 10, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  %29 = icmp eq i32 %28, 20
  br i1 %29, label %true8, label %false9

30:                                               ; preds = %switch
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 12, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  store i32 12, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  store i32 13, ptr %b, align 4
  br label %break

35:                                               ; preds = %switch
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  store i32 13, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  store i32 5, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 6, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %12
    i32 3, label %14
    i32 4, label %18
    i32 5, label %38
    i32 6, label %41
    i32 7, label %20
    i32 8, label %22
    i32 9, label %25
    i32 10, label %27
    i32 11, label %30
    i32 12, label %34
    i32 13, label %37
    i32 14, label %32
    i32 15, label %35
    i32 16, label %39
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %39, %35, %32, %37, %34, %30, %break_con10, %25, %break_con7, %20, %38, %18, %break_con4, %12, %break_con, %7, %default
  br label %while

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 16, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %14
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %14
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %22
  store i32 9, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %22
  store i32 15, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %27
  store i32 11, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %27
  store i32 14, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
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
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, i32 noundef %8)
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
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  call void @_1_ifalone(i32 noundef 5, i32 noundef 2, i32 noundef 0)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  call void @_1_ifalone(i32 noundef -1, i32 noundef 2, i32 noundef 0)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  call void @_2_ifelse(i32 noundef 5, i32 noundef 2, i32 noundef 1)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  call void @_2_ifelse(i32 noundef -1, i32 noundef 2, i32 noundef 1)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  call void @_3_ifflat(i32 noundef 10, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  call void @_3_ifflat(i32 noundef 4, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  call void @_3_ifflat(i32 noundef 5, i32 noundef 2, i32 noundef 5, i32 noundef 20)
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  call void @_3_ifflat(i32 noundef 3, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  call void @_3_ifflat(i32 noundef -2, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  call void @_4_prefixheavy(i32 noundef 20, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  call void @_4_prefixheavy(i32 noundef 10, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.34)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  call void @_5_multistage(i32 noundef 10, i32 noundef 10, i32 noundef 2, i32 noundef 30)
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  call void @_5_multistage(i32 noundef 1, i32 noundef 4, i32 noundef 2, i32 noundef 30)
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  call void @_6_ifnested(i32 noundef -1, i32 noundef 7, i32 noundef 3)
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  call void @_6_ifnested(i32 noundef 4, i32 noundef 7, i32 noundef 3)
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.40)
  call void @_6_ifnested(i32 noundef 5, i32 noundef 7, i32 noundef 3)
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.41)
  call void @_6_ifnested(i32 noundef 3, i32 noundef 7, i32 noundef 3)
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
