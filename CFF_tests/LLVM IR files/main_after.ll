; ModuleID = 'main.bc'
source_filename = "/home/xenia/Projects/mini-obfuscator-llvm-pass/CFF_tests/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalvar = dso_local global i32 10, align 4
@.str = private unnamed_addr constant [16 x i8] c"condition true\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"condition false\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"start: x = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"end: y = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"start: x = %d, z = %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"start: x = %d, a = %d, b = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"if 1: x is negative\0A\00", align 1
@.str.7 = private unnamed_addr constant [17 x i8] c"if 2: x is even\0A\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"if 3: x is divisible by 3\0A\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"before if 1\0A\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"inside if 1\0A\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"after if 1\0A\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"before if 2\0A\00", align 1
@.str.13 = private unnamed_addr constant [13 x i8] c"inside if 2\0A\00", align 1
@.str.14 = private unnamed_addr constant [18 x i8] c"inside if 2 else\0A\00", align 1
@.str.15 = private unnamed_addr constant [12 x i8] c"after if 2\0A\00", align 1
@.str.16 = private unnamed_addr constant [37 x i8] c"outer condition true ((x %% 3) > a)\0A\00", align 1
@.str.17 = private unnamed_addr constant [30 x i8] c"inner condition true (y > b)\0A\00", align 1
@.str.18 = private unnamed_addr constant [32 x i8] c"inner condition false (y <= b)\0A\00", align 1
@.str.19 = private unnamed_addr constant [39 x i8] c"outer condition false ((x %% 3) <= a)\0A\00", align 1
@.str.20 = private unnamed_addr constant [14 x i8] c"end: y = %d\0A\0A\00", align 1
@.str.21 = private unnamed_addr constant [30 x i8] c"outer condition true (x > a)\0A\00", align 1
@.str.22 = private unnamed_addr constant [42 x i8] c"inner condition true (y > b + globalvar)\0A\00", align 1
@.str.23 = private unnamed_addr constant [35 x i8] c"nested check true ((y %% 5) == 0)\0A\00", align 1
@.str.24 = private unnamed_addr constant [36 x i8] c"nested check false ((y %% 5) != 0)\0A\00", align 1
@.str.25 = private unnamed_addr constant [44 x i8] c"inner condition false (y <= b + globalvar)\0A\00", align 1
@.str.26 = private unnamed_addr constant [32 x i8] c"outer condition false (x <= a)\0A\00", align 1
@.str.27 = private unnamed_addr constant [19 x i8] c"if branch: x > 10\0A\00", align 1
@.str.28 = private unnamed_addr constant [23 x i8] c"else if branch: x > 5\0A\00", align 1
@.str.29 = private unnamed_addr constant [21 x i8] c"else branch: x <= 5\0A\00", align 1
@.str.30 = private unnamed_addr constant [26 x i8] c"after conditions: y = %d\0A\00", align 1
@.str.31 = private unnamed_addr constant [19 x i8] c"end: result = %d\0A\0A\00", align 1
@.str.32 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.33 = private unnamed_addr constant [27 x i8] c"\0A=== _0_nocodeifalone ===\0A\00", align 1
@.str.34 = private unnamed_addr constant [42 x i8] c"_0_nocodeifalone (globalvar > 0 [TRUE]):\0A\00", align 1
@.str.35 = private unnamed_addr constant [43 x i8] c"_0_nocodeifalone (globalvar > 0 [FALSE]):\0A\00", align 1
@.str.36 = private unnamed_addr constant [26 x i8] c"\0A=== _0_nocodeifelse ===\0A\00", align 1
@.str.37 = private unnamed_addr constant [41 x i8] c"_0_nocodeifelse (globalvar > 0 [TRUE]):\0A\00", align 1
@.str.38 = private unnamed_addr constant [42 x i8] c"_0_nocodeifelse (globalvar > 0 [FALSE]):\0A\00", align 1
@.str.39 = private unnamed_addr constant [20 x i8] c"\0A=== _0_global ===\0A\00", align 1
@.str.40 = private unnamed_addr constant [35 x i8] c"_0_global (globalvar > 0 [TRUE]):\0A\00", align 1
@.str.41 = private unnamed_addr constant [36 x i8] c"_0_global (globalvar > 0 [FALSE]):\0A\00", align 1
@.str.42 = private unnamed_addr constant [21 x i8] c"\0A=== _1_ifalone ===\0A\00", align 1
@.str.43 = private unnamed_addr constant [28 x i8] c"_1_ifalone (x > 0 [TRUE]):\0A\00", align 1
@.str.44 = private unnamed_addr constant [29 x i8] c"_1_ifalone (x > 0 [FALSE]):\0A\00", align 1
@.str.45 = private unnamed_addr constant [41 x i8] c"_1_ifalone_arg_condition (cond [TRUE]):\0A\00", align 1
@.str.46 = private unnamed_addr constant [42 x i8] c"_1_ifalone_arg_condition (cond [FALSE]):\0A\00", align 1
@.str.47 = private unnamed_addr constant [20 x i8] c"\0A=== _2_ifelse ===\0A\00", align 1
@.str.48 = private unnamed_addr constant [34 x i8] c"_2_ifelse (x > (a == b) [TRUE]):\0A\00", align 1
@.str.49 = private unnamed_addr constant [34 x i8] c"_2_ifelse (x > (a == b) [FALSE]:\0A\00", align 1
@.str.50 = private unnamed_addr constant [20 x i8] c"\0A=== _3_ifflat ===\0A\00", align 1
@.str.51 = private unnamed_addr constant [70 x i8] c"_3_ifflat (x < 0 [FALSE], x %% 2 == 0 [FALSE], x %% 3 == 0 [FALSE]):\0A\00", align 1
@.str.52 = private unnamed_addr constant [69 x i8] c"_3_ifflat (x < 0 [FALSE], x %% 2 == 0 [FALSE], x %% 3 == 0 [TRUE]):\0A\00", align 1
@.str.53 = private unnamed_addr constant [69 x i8] c"_3_ifflat (x < 0 [FALSE], x %% 2 == 0 [TRUE], x %% 3 == 0 [FALSE]):\0A\00", align 1
@.str.54 = private unnamed_addr constant [68 x i8] c"_3_ifflat (x < 0 [FALSE], x %% 2 == 0 [TRUE], x %% 3 == 0 [TRUE]):\0A\00", align 1
@.str.55 = private unnamed_addr constant [69 x i8] c"_3_ifflat (x < 0 [TRUE], x %% 2 == 0 [FALSE], x %% 3 == 0 [FALSE]):\0A\00", align 1
@.str.56 = private unnamed_addr constant [68 x i8] c"_3_ifflat (x < 0 [TRUE], x %% 2 == 0 [FALSE], x %% 3 == 0 [TRUE]):\0A\00", align 1
@.str.57 = private unnamed_addr constant [68 x i8] c"_3_ifflat (x < 0 [TRUE], x %% 2 == 0 [TRUE], x %% 3 == 0 [FALSE]):\0A\00", align 1
@.str.58 = private unnamed_addr constant [67 x i8] c"_3_ifflat (x < 0 [TRUE], x %% 2 == 0 [TRUE], x %% 3 == 0 [TRUE]):\0A\00", align 1
@.str.59 = private unnamed_addr constant [25 x i8] c"\0A=== _4_prefixheavy ===\0A\00", align 1
@.str.60 = private unnamed_addr constant [41 x i8] c"_4_prefixheavy (clamped == cap [TRUE]):\0A\00", align 1
@.str.61 = private unnamed_addr constant [61 x i8] c"_4_prefixheavy (clamped == cap [FALSE], using dynamic 'a'):\0A\00", align 1
@.str.62 = private unnamed_addr constant [24 x i8] c"\0A=== _5_multistage ===\0A\00", align 1
@.str.63 = private unnamed_addr constant [42 x i8] c"_4_prefixheavy (clamped == cap [FALSE]):\0A\00", align 1
@.str.64 = private unnamed_addr constant [42 x i8] c"_5_multistage (weighted > limit [TRUE]):\0A\00", align 1
@.str.65 = private unnamed_addr constant [43 x i8] c"_5_multistage (weighted > limit [FALSE]):\0A\00", align 1
@.str.66 = private unnamed_addr constant [22 x i8] c"\0A=== _6_ifnested ===\0A\00", align 1
@.str.67 = private unnamed_addr constant [45 x i8] c"_6_ifnested (Path 1: (x %% 3) > a [FALSE]):\0A\00", align 1
@.str.68 = private unnamed_addr constant [58 x i8] c"_6_ifnested (Path 2: (x %% 3) > a [TRUE], y > b [TRUE]):\0A\00", align 1
@.str.69 = private unnamed_addr constant [60 x i8] c"_6_ifnested (Path 3: (x %% 3) > a [TRUE], y <= b [FALSE]):\0A\00", align 1
@.str.70 = private unnamed_addr constant [27 x i8] c"\0A=== _7_multiifnested ===\0A\00", align 1
@.str.71 = private unnamed_addr constant [43 x i8] c"_7_multiifnested (Path 1: x > a [FALSE]):\0A\00", align 1
@.str.72 = private unnamed_addr constant [70 x i8] c"_7_multiifnested (Path 2: x > a [TRUE], y > (b + globalvar) [TRUE]):\0A\00", align 1
@.str.73 = private unnamed_addr constant [84 x i8] c"_7_multiifnested (Path 3: x > a [TRUE], y <= (b + globalvar), y %% 5 == 0 [TRUE]):\0A\00", align 1
@.str.74 = private unnamed_addr constant [85 x i8] c"_7_multiifnested (Path 4: x > a [TRUE], y <= (b + globalvar), y %% 5 == 0 [FALSE]):\0A\00", align 1
@.str.75 = private unnamed_addr constant [26 x i8] c"\0A=== _8_ifelseifelse ===\0A\00", align 1
@.str.76 = private unnamed_addr constant [34 x i8] c"_8_ifelseifelse (x > 10 [TRUE]):\0A\00", align 1
@.str.77 = private unnamed_addr constant [49 x i8] c"_8_ifelseifelse (x > 10 [FALSE], x > 5 [TRUE]):\0A\00", align 1
@.str.78 = private unnamed_addr constant [50 x i8] c"_8_ifelseifelse (x > 10 [FALSE], x > 5 [FALSE]):\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_0_nocodeifalone() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %while

0:                                                ; preds = %switch
  %1 = load i32, ptr @globalvar, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %true, label %false

3:                                                ; preds = %switch
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 2, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %3
    i32 2, label %5
  ]

while:                                            ; preds = %entry, %break
  br label %switch

break:                                            ; preds = %3, %break_con, %default
  br label %while

true:                                             ; preds = %0
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %0
  store i32 2, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_0_nocodeifelse() #0 {
entry:
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %while

0:                                                ; preds = %switch
  %1 = load i32, ptr @globalvar, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %true, label %false

3:                                                ; preds = %switch
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 2, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 2, ptr %b, align 4
  br label %break

7:                                                ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %0
    i32 1, label %3
    i32 2, label %7
    i32 3, label %5
  ]

while:                                            ; preds = %entry, %break
  br label %switch

break:                                            ; preds = %5, %3, %break_con, %default
  br label %while

true:                                             ; preds = %0
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %0
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_0_global() #0 {
  %b = alloca i32, align 4
  %1 = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %while

2:                                                ; preds = %switch
  %3 = load i32, ptr @globalvar, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %3)
  %5 = load i32, ptr @globalvar, align 4
  store i32 %5, ptr %1, align 4
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr @globalvar, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %11 = load i32, ptr %1, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %1, align 4
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %1, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %14)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
    i32 1, label %6
    i32 2, label %9
    i32 3, label %13
  ]

while:                                            ; preds = %0, %break
  br label %switch

break:                                            ; preds = %9, %break_con, %2, %default
  br label %while

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
define dso_local void @_1_ifalone(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  br label %while

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %7, i32 noundef %8)
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %5, align 4
  store i32 1, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %true, label %false

16:                                               ; preds = %switch
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, ptr %5, align 4
  store i32 3, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %5, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %21)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %13
    i32 2, label %16
    i32 3, label %20
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %16, %break_con, %6, %default
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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifalone_arg_condition(i1 noundef zeroext %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %b = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = zext i1 %0 to i8
  store i8 %8, ptr %4, align 1
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %b, align 4
  br label %while

9:                                                ; preds = %switch
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i8, ptr %4, align 1
  %18 = trunc i8 %17 to i1
  br i1 %18, label %true, label %false

19:                                               ; preds = %switch
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %21 = load i32, ptr %7, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %7, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %24)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %9
    i32 1, label %16
    i32 2, label %19
    i32 3, label %23
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %19, %break_con, %9, %default
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
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp eq i32 %17, %18
  %20 = zext i1 %19 to i32
  %21 = icmp sgt i32 %16, %20
  br i1 %21, label %true, label %false

22:                                               ; preds = %switch
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %24 = load i32, ptr %7, align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %28 = load i32, ptr %7, align 4
  %29 = mul nsw i32 %28, 0
  store i32 %29, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  %31 = load i32, ptr %7, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %31)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %15
    i32 2, label %22
    i32 3, label %30
    i32 4, label %26
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %26, %22, %break_con, %8, %default
  br label %while

true:                                             ; preds = %15
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %15
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifflat(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %b, align 4
  br label %while

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %5)
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 10
  store i32 %14, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = srem i32 %16, 2
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %true2, label %false3

19:                                               ; preds = %switch
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 100
  store i32 %22, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  %25 = srem i32 %24, 3
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %true5, label %false6

27:                                               ; preds = %switch
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %29 = load i32, ptr %3, align 4
  %30 = mul nsw i32 %29, 2
  store i32 %30, ptr %3, align 4
  store i32 7, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %32 = load i32, ptr %3, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %32)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %8
    i32 2, label %11
    i32 3, label %15
    i32 4, label %19
    i32 5, label %23
    i32 6, label %27
    i32 7, label %31
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %27, %break_con7, %19, %break_con4, %11, %break_con, %4, %default
  br label %while

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %15
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %15
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %23
  store i32 6, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %23
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
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
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
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
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %35 = load i32, ptr %11, align 4
  %36 = sub nsw i32 %35, 1
  store i32 %36, ptr %11, align 4
  store i32 6, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
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
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %9, align 4
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %7, align 4
  %19 = mul nsw i32 %17, %18
  store i32 %19, ptr %10, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  store i32 1, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %10, align 4
  %23 = load i32, ptr %8, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %true, label %false

25:                                               ; preds = %switch
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %27 = load i32, ptr %10, align 4
  %28 = sdiv i32 %27, 2
  store i32 %28, ptr %10, align 4
  store i32 3, ptr %b, align 4
  br label %break

29:                                               ; preds = %switch
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
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
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
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
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %b, align 4
  br label %while

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = srem i32 %16, 3
  %18 = load i32, ptr %5, align 4
  %19 = icmp sgt i32 %17, %18
  br i1 %19, label %true, label %false

20:                                               ; preds = %switch
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, 5
  store i32 %23, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

24:                                               ; preds = %switch
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp sgt i32 %25, %26
  br i1 %27, label %true2, label %false3

28:                                               ; preds = %switch
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %30 = load i32, ptr %7, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

32:                                               ; preds = %switch
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %34 = load i32, ptr %7, align 4
  %35 = sub nsw i32 %34, 3
  store i32 %35, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

36:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

37:                                               ; preds = %switch
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %39 = load i32, ptr %7, align 4
  %40 = mul nsw i32 %39, 0
  store i32 %40, ptr %7, align 4
  store i32 6, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = load i32, ptr %7, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %42)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %15
    i32 2, label %20
    i32 3, label %24
    i32 4, label %28
    i32 5, label %36
    i32 6, label %41
    i32 7, label %32
    i32 8, label %37
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %37, %32, %36, %28, %break_con4, %20, %break_con, %8, %default
  br label %while

true:                                             ; preds = %15
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %15
  store i32 8, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %24
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %24
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_7_multiifnested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %7, align 4
  store i32 1, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %true, label %false

19:                                               ; preds = %switch
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %21, 5
  store i32 %22, ptr %7, align 4
  store i32 3, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr @globalvar, align 4
  %27 = add nsw i32 %25, %26
  %28 = icmp sgt i32 %24, %27
  br i1 %28, label %true2, label %false3

29:                                               ; preds = %switch
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %31 = load i32, ptr %7, align 4
  %32 = mul nsw i32 %31, 2
  store i32 %32, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

33:                                               ; preds = %switch
  %34 = load i32, ptr %7, align 4
  %35 = srem i32 %34, 5
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %true5, label %false6

37:                                               ; preds = %switch
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  store i32 9, ptr %b, align 4
  br label %break

39:                                               ; preds = %switch
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  store i32 9, ptr %b, align 4
  br label %break

41:                                               ; preds = %switch
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %43 = load i32, ptr %7, align 4
  %44 = sub nsw i32 %43, 3
  store i32 %44, ptr %7, align 4
  store i32 5, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

46:                                               ; preds = %switch
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  %48 = load i32, ptr %7, align 4
  %49 = mul nsw i32 %48, 0
  store i32 %49, ptr %7, align 4
  store i32 6, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %7, align 4
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %51)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %8
    i32 1, label %15
    i32 2, label %19
    i32 3, label %23
    i32 4, label %29
    i32 5, label %45
    i32 6, label %50
    i32 7, label %33
    i32 8, label %37
    i32 9, label %41
    i32 10, label %39
    i32 11, label %46
  ]

while:                                            ; preds = %3, %break
  br label %switch

break:                                            ; preds = %46, %39, %41, %37, %break_con7, %45, %29, %break_con4, %19, %break_con, %8, %default
  br label %while

true:                                             ; preds = %15
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %15
  store i32 11, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %23
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %23
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %33
  store i32 8, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %33
  store i32 10, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_8_ifelseifelse(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %b, align 4
  br label %while

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %6)
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = icmp sgt i32 %9, 10
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 100
  store i32 %14, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = icmp sgt i32 %16, 5
  br i1 %17, label %true2, label %false3

18:                                               ; preds = %switch
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, 50
  store i32 %21, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 10
  store i32 %25, ptr %3, align 4
  store i32 6, ptr %b, align 4
  br label %break

26:                                               ; preds = %switch
  store i32 3, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %3, align 4
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, i32 noundef %28)
  %30 = load i32, ptr %3, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %4, align 4
  %32 = load i32, ptr %4, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, i32 noundef %32)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %8
    i32 2, label %11
    i32 3, label %27
    i32 4, label %15
    i32 5, label %18
    i32 6, label %26
    i32 7, label %22
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %22, %26, %18, %break_con4, %11, %break_con, %5, %default
  br label %while

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %15
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %15
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
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
  %.reg2mem = alloca i32, align 4
  br label %while

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.32, i32 noundef %8)
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
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.34)
  call void @_0_nocodeifalone()
  store i32 0, ptr @globalvar, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  call void @_0_nocodeifalone()
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  store i32 5, ptr @globalvar, align 4
  call void @_0_nocodeifelse()
  store i32 0, ptr @globalvar, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  call void @_0_nocodeifelse()
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.40)
  store i32 5, ptr @globalvar, align 4
  call void @_0_global()
  store i32 0, ptr @globalvar, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.41)
  call void @_0_global()
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.42)
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.43)
  call void @_1_ifalone(i32 noundef 5, i32 noundef 0)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  call void @_1_ifalone(i32 noundef -1, i32 noundef 5)
  %32 = load i32, ptr %6, align 4
  call void @_1_ifalone(i32 noundef %32, i32 noundef 5)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.45)
  call void @_1_ifalone_arg_condition(i1 noundef zeroext true, i32 noundef 1, i32 noundef 4)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.46)
  call void @_1_ifalone_arg_condition(i1 noundef zeroext false, i32 noundef 1, i32 noundef 4)
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.47)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.48)
  call void @_2_ifelse(i32 noundef 5, i32 noundef 2, i32 noundef 1)
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.49)
  call void @_2_ifelse(i32 noundef -1, i32 noundef 2, i32 noundef 1)
  %38 = load i32, ptr %6, align 4
  call void @_2_ifelse(i32 noundef -1, i32 noundef %38, i32 noundef 1)
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.50)
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.51)
  call void @_3_ifflat(i32 noundef 1)
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.52)
  call void @_3_ifflat(i32 noundef 3)
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.53)
  call void @_3_ifflat(i32 noundef 2)
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.54)
  call void @_3_ifflat(i32 noundef 6)
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.55)
  call void @_3_ifflat(i32 noundef -1)
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.56)
  call void @_3_ifflat(i32 noundef -3)
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.57)
  call void @_3_ifflat(i32 noundef -2)
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.58)
  call void @_3_ifflat(i32 noundef -6)
  store i32 4, ptr %b, align 4
  br label %break

48:                                               ; preds = %switch
  %49 = load i32, ptr %6, align 4
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %true2, label %false3

51:                                               ; preds = %switch
  %52 = load i32, ptr %6, align 4
  %53 = sub nsw i32 0, %52
  store i32 %53, ptr %.reg2mem, align 4
  store i32 6, ptr %b, align 4
  br label %break

54:                                               ; preds = %switch
  store i32 -2, ptr %.reg2mem, align 4
  store i32 6, ptr %b, align 4
  br label %break

55:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  call void @_3_ifflat(i32 noundef %.reload)
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.59)
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.60)
  call void @_4_prefixheavy(i32 noundef 20, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.61)
  %59 = load i32, ptr %6, align 4
  call void @_4_prefixheavy(i32 noundef %59, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.62)
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.60)
  call void @_4_prefixheavy(i32 noundef 10, i32 noundef 10, i32 noundef 2, i32 noundef 30)
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.63)
  call void @_4_prefixheavy(i32 noundef 2, i32 noundef 5, i32 noundef 1, i32 noundef 30)
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.62)
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.64)
  call void @_5_multistage(i32 noundef 10, i32 noundef 4, i32 noundef 2, i32 noundef 20)
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.65)
  call void @_5_multistage(i32 noundef 10, i32 noundef 4, i32 noundef 2, i32 noundef 30)
  %66 = load i32, ptr %6, align 4
  call void @_5_multistage(i32 noundef %66, i32 noundef 4, i32 noundef 2, i32 noundef 30)
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.66)
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.67)
  call void @_6_ifnested(i32 noundef 2, i32 noundef 5, i32 noundef 3)
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.68)
  call void @_6_ifnested(i32 noundef 5, i32 noundef 1, i32 noundef 3)
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.69)
  call void @_6_ifnested(i32 noundef 2, i32 noundef 1, i32 noundef 10)
  %71 = load i32, ptr %6, align 4
  call void @_6_ifnested(i32 noundef 5, i32 noundef %71, i32 noundef 20)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %73 = call i32 (ptr, ...) @printf(ptr noundef @.str.71)
  call void @_7_multiifnested(i32 noundef 1, i32 noundef 5, i32 noundef 3)
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.72)
  call void @_7_multiifnested(i32 noundef 10, i32 noundef 2, i32 noundef 1)
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.73)
  call void @_7_multiifnested(i32 noundef 4, i32 noundef 2, i32 noundef 10)
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.74)
  call void @_7_multiifnested(i32 noundef 5, i32 noundef 2, i32 noundef 10)
  %77 = load i32, ptr %6, align 4
  call void @_7_multiifnested(i32 noundef 5, i32 noundef %77, i32 noundef 10)
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.75)
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.76)
  call void @_8_ifelseifelse(i32 noundef 20)
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.77)
  call void @_8_ifelseifelse(i32 noundef 8)
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.78)
  call void @_8_ifelseifelse(i32 noundef 3)
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
    i32 4, label %48
    i32 5, label %51
    i32 6, label %55
    i32 7, label %54
    i32 8, label %14
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %14, %54, %51, %break_con4, %19, %13, %break_con, %7, %default
  br label %while

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 8, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %48
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %48
  store i32 7, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
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
