; ModuleID = 'main.bc'
source_filename = "/home/xenia/Projects/mini-obfuscator-llvm-pass/CFF_tests/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [52 x i8] c"[_1_ifalone] start: x=%d, multiplier=%d, offset=%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [63 x i8] c"[_1_ifalone] branch: x=%d is positive, applying multiplier %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"[_1_ifalone] end: y=%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [55 x i8] c"[_2_ifelse] start: x=%d, pos_factor=%d, neg_offset=%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [53 x i8] c"[_2_ifelse] branch: x=%d is positive, scaling by %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [59 x i8] c"[_2_ifelse] branch: x=%d is non-positive, adjusting by %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"[_2_ifelse] end: y=%d\0A\00", align 1
@.str.7 = private unnamed_addr constant [61 x i8] c"[_3_ifflat] start: x=%d, mod=%d, threshold=%d, alt_value=%d\0A\00", align 1
@.str.8 = private unnamed_addr constant [60 x i8] c"[_3_ifflat] branch A: x=%d is positive and divisible by %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [64 x i8] c"[_3_ifflat] branch B: x=%d is positive and not divisible by %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [48 x i8] c"[_3_ifflat] branch C: x=%d equals threshold %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [54 x i8] c"[_3_ifflat] branch D: x=%d differs from threshold %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [28 x i8] c"[_3_ifflat] end: result=%d\0A\00", align 1
@.str.13 = private unnamed_addr constant [57 x i8] c"[_4_prefixheavy] start: x=%d, scale=%d, bias=%d, cap=%d\0A\00", align 1
@.str.14 = private unnamed_addr constant [46 x i8] c"[_4_prefixheavy] computed step1=%d (x*scale)\0A\00", align 1
@.str.15 = private unnamed_addr constant [49 x i8] c"[_4_prefixheavy] computed step2=%d (step1+bias)\0A\00", align 1
@.str.16 = private unnamed_addr constant [58 x i8] c"[_4_prefixheavy] computed clamped=%d (min of step2, cap)\0A\00", align 1
@.str.17 = private unnamed_addr constant [58 x i8] c"[_4_prefixheavy] branch: clamped value %d hit the cap %d\0A\00", align 1
@.str.18 = private unnamed_addr constant [34 x i8] c"[_4_prefixheavy] end: clamped=%d\0A\00", align 1
@.str.19 = private unnamed_addr constant [56 x i8] c"[_5_multistage] start: x=%d, y=%d, weight=%d, limit=%d\0A\00", align 1
@.str.20 = private unnamed_addr constant [33 x i8] c"[_5_multistage] computed sum=%d\0A\00", align 1
@.str.21 = private unnamed_addr constant [38 x i8] c"[_5_multistage] computed weighted=%d\0A\00", align 1
@.str.22 = private unnamed_addr constant [68 x i8] c"[_5_multistage] branch: weighted=%d exceeds limit=%d, scaling down\0A\00", align 1
@.str.23 = private unnamed_addr constant [63 x i8] c"[_5_multistage] branch: weighted=%d within limit=%d, boosting\0A\00", align 1
@.str.24 = private unnamed_addr constant [48 x i8] c"[_5_multistage] computed final=%d (weighted-x)\0A\00", align 1
@.str.25 = private unnamed_addr constant [31 x i8] c"[_5_multistage] end: final=%d\0A\00", align 1
@.str.26 = private unnamed_addr constant [45 x i8] c"[_6_ifnested] start: x=%d, y=%d, divisor=%d\0A\00", align 1
@.str.27 = private unnamed_addr constant [46 x i8] c"[_6_ifnested] outer branch: x=%d is positive\0A\00", align 1
@.str.28 = private unnamed_addr constant [58 x i8] c"[_6_ifnested] inner branch: z=%d divisible by divisor=%d\0A\00", align 1
@.str.29 = private unnamed_addr constant [62 x i8] c"[_6_ifnested] inner branch: z=%d not divisible by divisor=%d\0A\00", align 1
@.str.30 = private unnamed_addr constant [50 x i8] c"[_6_ifnested] outer branch: x=%d is non-positive\0A\00", align 1
@.str.31 = private unnamed_addr constant [25 x i8] c"[_6_ifnested] end: z=%d\0A\00", align 1
@.str.32 = private unnamed_addr constant [19 x i8] c"inner true (even)\0A\00", align 1
@.str.33 = private unnamed_addr constant [13 x i8] c"end: y = %d\0A\00", align 1
@.str.34 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.35 = private unnamed_addr constant [20 x i8] c"_1_ifalone before:\0A\00", align 1
@.str.36 = private unnamed_addr constant [19 x i8] c"_2_ifelse before:\0A\00", align 1
@.str.37 = private unnamed_addr constant [19 x i8] c"_3_ifflat before:\0A\00", align 1
@.str.38 = private unnamed_addr constant [24 x i8] c"_4_prefixheavy before:\0A\00", align 1
@.str.39 = private unnamed_addr constant [23 x i8] c"_5_multistage before:\0A\00", align 1
@.str.40 = private unnamed_addr constant [21 x i8] c"_6_ifnested before:\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifalone(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %while

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %true, label %false

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr %5, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %20, i32 noundef %21)
  %23 = load i32, ptr %7, align 4
  %24 = load i32, ptr %5, align 4
  %25 = mul nsw i32 %23, %24
  store i32 %25, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = load i32, ptr %7, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %27)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %16
    i32 2, label %19
    i32 3, label %26
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %19, %break_con, %8, %default
  br label %while

true:                                             ; preds = %16
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %16
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_2_ifelse(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %while

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %true, label %false

18:                                               ; preds = %switch
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %19, i32 noundef %20)
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %5, align 4
  %24 = mul nsw i32 %22, %23
  store i32 %24, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = load i32, ptr %6, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %26, i32 noundef %27)
  %29 = load i32, ptr %7, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %29, %30
  store i32 %31, ptr %7, align 4
  store i32 4, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %7, align 4
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %33)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %15
    i32 2, label %18
    i32 3, label %25
    i32 4, label %32
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %25, %18, %break_con, %8, %default
  br label %while

true:                                             ; preds = %15
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %15
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifflat(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %.reg2mem = alloca i1, align 1
  %.reg2mem1 = alloca i1, align 1
  br label %while

13:                                               ; preds = %switch
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %8, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %14, i32 noundef %15, i32 noundef %16, i32 noundef %17)
  %19 = load i32, ptr %5, align 4
  %20 = icmp sgt i32 %19, 0
  %21 = zext i1 %20 to i32
  store i32 %21, ptr %9, align 4
  store i32 1, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %9, align 4
  %24 = icmp ne i32 %23, 0
  store i1 false, ptr %.reg2mem, align 1
  br i1 %24, label %true, label %false

25:                                               ; preds = %switch
  %26 = load i32, ptr %5, align 4
  %27 = load i32, ptr %6, align 4
  %28 = srem i32 %26, %27
  %29 = icmp eq i32 %28, 0
  store i1 %29, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  %31 = zext i1 %.reload to i32
  store i32 %31, ptr %10, align 4
  store i32 4, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = load i32, ptr %9, align 4
  %34 = icmp ne i32 %33, 0
  store i1 false, ptr %.reg2mem1, align 1
  br i1 %34, label %true4, label %false5

35:                                               ; preds = %switch
  %36 = load i32, ptr %10, align 4
  %37 = icmp ne i32 %36, 0
  %38 = xor i1 %37, true
  store i1 %38, ptr %.reg2mem1, align 1
  store i32 6, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %40 = zext i1 %.reload2 to i32
  store i32 %40, ptr %11, align 4
  %41 = load i32, ptr %5, align 4
  store i32 %41, ptr %12, align 4
  store i32 7, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %10, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %true7, label %false8

45:                                               ; preds = %switch
  %46 = load i32, ptr %5, align 4
  %47 = load i32, ptr %6, align 4
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %46, i32 noundef %47)
  store i32 9, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %11, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %true10, label %false11

52:                                               ; preds = %switch
  %53 = load i32, ptr %5, align 4
  %54 = load i32, ptr %6, align 4
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %53, i32 noundef %54)
  store i32 11, ptr %b, align 4
  br label %break

56:                                               ; preds = %switch
  %57 = load i32, ptr %5, align 4
  %58 = load i32, ptr %7, align 4
  %59 = icmp eq i32 %57, %58
  br i1 %59, label %true13, label %false14

60:                                               ; preds = %switch
  %61 = load i32, ptr %5, align 4
  %62 = load i32, ptr %7, align 4
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %61, i32 noundef %62)
  %64 = load i32, ptr %7, align 4
  store i32 %64, ptr %12, align 4
  store i32 13, ptr %b, align 4
  br label %break

65:                                               ; preds = %switch
  %66 = load i32, ptr %5, align 4
  %67 = load i32, ptr %7, align 4
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %66, i32 noundef %67)
  %69 = load i32, ptr %8, align 4
  store i32 %69, ptr %12, align 4
  store i32 14, ptr %b, align 4
  br label %break

70:                                               ; preds = %switch
  %71 = load i32, ptr %12, align 4
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %71)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %13
    i32 1, label %22
    i32 2, label %25
    i32 3, label %30
    i32 4, label %32
    i32 5, label %35
    i32 6, label %39
    i32 7, label %42
    i32 8, label %45
    i32 9, label %49
    i32 10, label %52
    i32 11, label %56
    i32 12, label %60
    i32 13, label %65
    i32 14, label %70
  ]

while:                                            ; preds = %4, %break
  br label %switch

break:                                            ; preds = %65, %60, %break_con15, %52, %break_con12, %45, %break_con9, %39, %35, %break_con6, %30, %25, %break_con, %13, %default
  br label %while

true:                                             ; preds = %22
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %22
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true4:                                            ; preds = %32
  store i32 5, ptr %b, align 4
  br label %break_con6

false5:                                           ; preds = %32
  store i32 6, ptr %b, align 4
  br label %break_con6

break_con6:                                       ; preds = %true4, %false5
  br label %break

true7:                                            ; preds = %42
  store i32 8, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %42
  store i32 9, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break

true10:                                           ; preds = %49
  store i32 10, ptr %b, align 4
  br label %break_con12

false11:                                          ; preds = %49
  store i32 11, ptr %b, align 4
  br label %break_con12

break_con12:                                      ; preds = %true10, %false11
  br label %break

true13:                                           ; preds = %56
  store i32 12, ptr %b, align 4
  br label %break_con15

false14:                                          ; preds = %56
  store i32 13, ptr %b, align 4
  br label %break_con15

break_con15:                                      ; preds = %true13, %false14
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_4_prefixheavy(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %.reg2mem = alloca i32, align 4
  br label %while

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %8, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %13, i32 noundef %14, i32 noundef %15, i32 noundef %16)
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = mul nsw i32 %18, %19
  store i32 %20, ptr %9, align 4
  %21 = load i32, ptr %9, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %21)
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, ptr %10, align 4
  %26 = load i32, ptr %10, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, i32 noundef %26)
  store i32 1, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %10, align 4
  %30 = load i32, ptr %8, align 4
  %31 = icmp sgt i32 %29, %30
  br i1 %31, label %true, label %false

32:                                               ; preds = %switch
  %33 = load i32, ptr %8, align 4
  store i32 %33, ptr %.reg2mem, align 4
  store i32 3, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %10, align 4
  store i32 %35, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %11, align 4
  %37 = load i32, ptr %11, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, i32 noundef %37)
  store i32 5, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = load i32, ptr %11, align 4
  %41 = load i32, ptr %8, align 4
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %true2, label %false3

43:                                               ; preds = %switch
  %44 = load i32, ptr %11, align 4
  %45 = load i32, ptr %8, align 4
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i32 noundef %44, i32 noundef %45)
  %47 = load i32, ptr %11, align 4
  %48 = sub nsw i32 %47, 1
  store i32 %48, ptr %11, align 4
  store i32 7, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  %50 = load i32, ptr %11, align 4
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, i32 noundef %50)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %12
    i32 1, label %28
    i32 2, label %32
    i32 3, label %34
    i32 4, label %36
    i32 5, label %39
    i32 6, label %43
    i32 7, label %49
  ]

while:                                            ; preds = %4, %break
  br label %switch

break:                                            ; preds = %43, %break_con4, %36, %34, %32, %break_con, %12, %default
  br label %while

true:                                             ; preds = %28
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %28
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %39
  store i32 6, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %39
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_5_multistage(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  br label %while

12:                                               ; preds = %switch
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %8, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.19, i32 noundef %13, i32 noundef %14, i32 noundef %15, i32 noundef %16)
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, ptr %9, align 4
  %21 = load i32, ptr %9, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %21)
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %7, align 4
  %25 = mul nsw i32 %23, %24
  store i32 %25, ptr %10, align 4
  %26 = load i32, ptr %10, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, i32 noundef %26)
  store i32 1, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  %29 = load i32, ptr %10, align 4
  %30 = load i32, ptr %8, align 4
  %31 = icmp sgt i32 %29, %30
  br i1 %31, label %true, label %false

32:                                               ; preds = %switch
  %33 = load i32, ptr %10, align 4
  %34 = load i32, ptr %8, align 4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %33, i32 noundef %34)
  %36 = load i32, ptr %10, align 4
  %37 = sdiv i32 %36, 2
  store i32 %37, ptr %10, align 4
  store i32 3, ptr %b, align 4
  br label %break

38:                                               ; preds = %switch
  %39 = load i32, ptr %10, align 4
  %40 = load i32, ptr %8, align 4
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i32 noundef %39, i32 noundef %40)
  %42 = load i32, ptr %10, align 4
  %43 = add nsw i32 %42, 10
  store i32 %43, ptr %10, align 4
  store i32 4, ptr %b, align 4
  br label %break

44:                                               ; preds = %switch
  %45 = load i32, ptr %10, align 4
  %46 = load i32, ptr %5, align 4
  %47 = sub nsw i32 %45, %46
  store i32 %47, ptr %11, align 4
  %48 = load i32, ptr %11, align 4
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, i32 noundef %48)
  %50 = load i32, ptr %11, align 4
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i32 noundef %50)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %12
    i32 1, label %28
    i32 2, label %32
    i32 3, label %38
    i32 4, label %44
  ]

while:                                            ; preds = %4, %break
  br label %switch

break:                                            ; preds = %38, %32, %break_con, %12, %default
  br label %while

true:                                             ; preds = %28
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %28
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_6_ifnested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %while

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.26, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %true, label %false

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.27, i32 noundef %20)
  store i32 3, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %7, align 4
  %24 = load i32, ptr %6, align 4
  %25 = srem i32 %23, %24
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %true2, label %false3

27:                                               ; preds = %switch
  %28 = load i32, ptr %7, align 4
  %29 = load i32, ptr %6, align 4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.28, i32 noundef %28, i32 noundef %29)
  %31 = load i32, ptr %7, align 4
  %32 = load i32, ptr %6, align 4
  %33 = sdiv i32 %31, %32
  store i32 %33, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %7, align 4
  %36 = load i32, ptr %6, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.29, i32 noundef %35, i32 noundef %36)
  %38 = load i32, ptr %7, align 4
  %39 = load i32, ptr %6, align 4
  %40 = add nsw i32 %38, %39
  store i32 %40, ptr %7, align 4
  store i32 6, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

42:                                               ; preds = %switch
  %43 = load i32, ptr %4, align 4
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, i32 noundef %43)
  %45 = load i32, ptr %7, align 4
  %46 = sub nsw i32 %45, 1
  store i32 %46, ptr %7, align 4
  store i32 8, ptr %b, align 4
  br label %break

47:                                               ; preds = %switch
  %48 = load i32, ptr %7, align 4
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, i32 noundef %48)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %16
    i32 2, label %19
    i32 3, label %22
    i32 4, label %27
    i32 5, label %34
    i32 6, label %41
    i32 7, label %42
    i32 8, label %47
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %42, %41, %34, %27, %break_con4, %19, %break_con, %8, %default
  br label %while

true:                                             ; preds = %16
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %16
  store i32 7, ptr %b, align 4
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
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_7_ifnested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %while

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %true2, label %false3

14:                                               ; preds = %switch
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = icmp eq i32 %17, 3
  br i1 %18, label %true5, label %false6

19:                                               ; preds = %switch
  %20 = load i32, ptr %4, align 4
  %21 = icmp eq i32 %20, 20
  br i1 %21, label %true8, label %false9

22:                                               ; preds = %switch
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  store i32 6, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  store i32 8, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %4, align 4
  %29 = icmp eq i32 %28, 10
  br i1 %29, label %true11, label %false12

30:                                               ; preds = %switch
  store i32 10, ptr %4, align 4
  store i32 10, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  store i32 20, ptr %4, align 4
  store i32 11, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

33:                                               ; No predecessors!
  br label %34

34:                                               ; preds = %switch, %33
  %35 = load i32, ptr %4, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.33, i32 noundef %35)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %14
    i32 3, label %16
    i32 4, label %19
    i32 5, label %22
    i32 6, label %24
    i32 7, label %25
    i32 8, label %27
    i32 9, label %30
    i32 10, label %31
    i32 11, label %32
    i32 12, label %34
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %32, %31, %30, %break_con13, %25, %24, %22, %break_con10, %break_con7, %14, %break_con4, %break_con, %default
  br label %while

true:                                             ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 12, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %10
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %16
  store i32 4, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %16
  store i32 7, ptr %b, align 4
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

true11:                                           ; preds = %27
  store i32 9, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %27
  store i32 10, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.34, i32 noundef %7)
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  br label %17

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 1
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 @atoi(ptr noundef %15) #3
  store i32 %16, ptr %6, align 4
  br label %17

17:                                               ; preds = %12, %11
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  %19 = load i32, ptr %6, align 4
  call void @_1_ifalone(i32 noundef %19, i32 noundef 2, i32 noundef 0)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %21 = load i32, ptr %6, align 4
  call void @_2_ifelse(i32 noundef %21, i32 noundef 2, i32 noundef 1)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  %23 = load i32, ptr %6, align 4
  call void @_3_ifflat(i32 noundef %23, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  %25 = load i32, ptr %6, align 4
  call void @_4_prefixheavy(i32 noundef %25, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  %27 = load i32, ptr %6, align 4
  call void @_5_multistage(i32 noundef %27, i32 noundef 4, i32 noundef 2, i32 noundef 30)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.40)
  %29 = load i32, ptr %6, align 4
  call void @_6_ifnested(i32 noundef %29, i32 noundef 7, i32 noundef 3)
  ret i32 0
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
