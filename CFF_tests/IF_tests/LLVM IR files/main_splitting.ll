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
  %1 = load i32, ptr @globalvar, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %5

5:                                                ; preds = %3, %0
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_0_nocodeifelse() #0 {
  %1 = load i32, ptr @globalvar, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %7

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %7

7:                                                ; preds = %5, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_0_global() #0 {
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %0
  %3 = load i32, ptr @globalvar, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %3)
  %5 = load i32, ptr @globalvar, align 4
  store i32 %5, ptr %1, align 4
  br label %6

6:                                                ; preds = %2
  %7 = load i32, ptr @globalvar, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %6
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %11 = load i32, ptr %1, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, ptr %1, align 4
  br label %13

13:                                               ; preds = %9, %6
  %14 = load i32, ptr %1, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %14)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifalone(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %6

6:                                                ; preds = %2
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %7, i32 noundef %8)
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %5, align 4
  br label %13

13:                                               ; preds = %6
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %18, 2
  store i32 %19, ptr %5, align 4
  br label %20

20:                                               ; preds = %16, %13
  %21 = load i32, ptr %5, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %21)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifalone_arg_condition(i1 noundef zeroext %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = zext i1 %0 to i8
  store i8 %8, ptr %4, align 1
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %9

9:                                                ; preds = %3
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %7, align 4
  br label %16

16:                                               ; preds = %9
  %17 = load i8, ptr %4, align 1
  %18 = trunc i8 %17 to i1
  br i1 %18, label %19, label %23

19:                                               ; preds = %16
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %21 = load i32, ptr %7, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, ptr %7, align 4
  br label %23

23:                                               ; preds = %19, %16
  %24 = load i32, ptr %7, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %24)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_2_ifelse(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %3
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %7, align 4
  br label %15

15:                                               ; preds = %8
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp eq i32 %17, %18
  %20 = zext i1 %19 to i32
  %21 = icmp sgt i32 %16, %20
  br i1 %21, label %22, label %26

22:                                               ; preds = %15
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %24 = load i32, ptr %7, align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, ptr %7, align 4
  br label %30

26:                                               ; preds = %15
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %28 = load i32, ptr %7, align 4
  %29 = mul nsw i32 %28, 0
  store i32 %29, ptr %7, align 4
  br label %30

30:                                               ; preds = %26, %22
  %31 = load i32, ptr %7, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %31)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifflat(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %1
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %5)
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %3, align 4
  br label %8

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 10
  store i32 %14, ptr %3, align 4
  br label %15

15:                                               ; preds = %11, %8
  %16 = load i32, ptr %2, align 4
  %17 = srem i32 %16, 2
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

19:                                               ; preds = %15
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 100
  store i32 %22, ptr %3, align 4
  br label %23

23:                                               ; preds = %19, %15
  %24 = load i32, ptr %2, align 4
  %25 = srem i32 %24, 3
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %31

27:                                               ; preds = %23
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %29 = load i32, ptr %3, align 4
  %30 = mul nsw i32 %29, 2
  store i32 %30, ptr %3, align 4
  br label %31

31:                                               ; preds = %27, %23
  %32 = load i32, ptr %3, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %32)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_4_prefixheavy(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br label %12

12:                                               ; preds = %4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = mul nsw i32 %14, %15
  store i32 %16, ptr %9, align 4
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %10, align 4
  br label %20

20:                                               ; preds = %12
  %21 = load i32, ptr %10, align 4
  %22 = load i32, ptr %8, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %26

24:                                               ; preds = %20
  %25 = load i32, ptr %8, align 4
  store i32 %25, ptr %.reg2mem, align 4
  br label %28

26:                                               ; preds = %20
  %27 = load i32, ptr %10, align 4
  store i32 %27, ptr %.reg2mem, align 4
  br label %28

28:                                               ; preds = %24, %26
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %11, align 4
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %11, align 4
  %31 = load i32, ptr %8, align 4
  %32 = icmp eq i32 %30, %31
  br i1 %32, label %33, label %37

33:                                               ; preds = %29
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %35 = load i32, ptr %11, align 4
  %36 = sub nsw i32 %35, 1
  store i32 %36, ptr %11, align 4
  br label %37

37:                                               ; preds = %33, %29
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_5_multistage(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  br label %12

12:                                               ; preds = %4
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
  br label %21

21:                                               ; preds = %12
  %22 = load i32, ptr %10, align 4
  %23 = load i32, ptr %8, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %27 = load i32, ptr %10, align 4
  %28 = sdiv i32 %27, 2
  store i32 %28, ptr %10, align 4
  br label %33

29:                                               ; preds = %21
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %31 = load i32, ptr %10, align 4
  %32 = add nsw i32 %31, 10
  store i32 %32, ptr %10, align 4
  br label %33

33:                                               ; preds = %29, %25
  %34 = load i32, ptr %10, align 4
  %35 = load i32, ptr %5, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %11, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_6_ifnested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %3
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %7, align 4
  br label %15

15:                                               ; preds = %8
  %16 = load i32, ptr %4, align 4
  %17 = srem i32 %16, 3
  %18 = load i32, ptr %5, align 4
  %19 = icmp sgt i32 %17, %18
  br i1 %19, label %20, label %37

20:                                               ; preds = %15
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, 5
  store i32 %23, ptr %7, align 4
  br label %24

24:                                               ; preds = %20
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp sgt i32 %25, %26
  br i1 %27, label %28, label %32

28:                                               ; preds = %24
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %30 = load i32, ptr %7, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %7, align 4
  br label %36

32:                                               ; preds = %24
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %34 = load i32, ptr %7, align 4
  %35 = sub nsw i32 %34, 3
  store i32 %35, ptr %7, align 4
  br label %36

36:                                               ; preds = %32, %28
  br label %41

37:                                               ; preds = %15
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %39 = load i32, ptr %7, align 4
  %40 = mul nsw i32 %39, 0
  store i32 %40, ptr %7, align 4
  br label %41

41:                                               ; preds = %37, %36
  %42 = load i32, ptr %7, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %42)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_7_multiifnested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %3
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %9, i32 noundef %10, i32 noundef %11)
  %13 = load i32, ptr %4, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %7, align 4
  br label %15

15:                                               ; preds = %8
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %19, label %46

19:                                               ; preds = %15
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %21, 5
  store i32 %22, ptr %7, align 4
  br label %23

23:                                               ; preds = %19
  %24 = load i32, ptr %7, align 4
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr @globalvar, align 4
  %27 = add nsw i32 %25, %26
  %28 = icmp sgt i32 %24, %27
  br i1 %28, label %29, label %33

29:                                               ; preds = %23
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %31 = load i32, ptr %7, align 4
  %32 = mul nsw i32 %31, 2
  store i32 %32, ptr %7, align 4
  br label %45

33:                                               ; preds = %23
  %34 = load i32, ptr %7, align 4
  %35 = srem i32 %34, 5
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %33
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %41

39:                                               ; preds = %33
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  br label %41

41:                                               ; preds = %39, %37
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %43 = load i32, ptr %7, align 4
  %44 = sub nsw i32 %43, 3
  store i32 %44, ptr %7, align 4
  br label %45

45:                                               ; preds = %41, %29
  br label %50

46:                                               ; preds = %15
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  %48 = load i32, ptr %7, align 4
  %49 = mul nsw i32 %48, 0
  store i32 %49, ptr %7, align 4
  br label %50

50:                                               ; preds = %46, %45
  %51 = load i32, ptr %7, align 4
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %51)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_8_ifelseifelse(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %5

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %6)
  br label %8

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4
  %10 = icmp sgt i32 %9, 10
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %13, 100
  store i32 %14, ptr %3, align 4
  br label %27

15:                                               ; preds = %8
  %16 = load i32, ptr %2, align 4
  %17 = icmp sgt i32 %16, 5
  br i1 %17, label %18, label %22

18:                                               ; preds = %15
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, 50
  store i32 %21, ptr %3, align 4
  br label %26

22:                                               ; preds = %15
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 10
  store i32 %25, ptr %3, align 4
  br label %26

26:                                               ; preds = %22, %18
  br label %27

27:                                               ; preds = %26, %11
  %28 = load i32, ptr %3, align 4
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, i32 noundef %28)
  %30 = load i32, ptr %3, align 4
  %31 = mul nsw i32 %30, 2
  store i32 %31, ptr %4, align 4
  %32 = load i32, ptr %4, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, i32 noundef %32)
  ret void
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
  %.reg2mem = alloca i32, align 4
  br label %7

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.32, i32 noundef %8)
  br label %10

10:                                               ; preds = %7
  %11 = load i32, ptr %4, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  store i32 0, ptr %6, align 4
  br label %19

14:                                               ; preds = %10
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #3
  store i32 %18, ptr %6, align 4
  br label %19

19:                                               ; preds = %13, %14
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
  br label %48

48:                                               ; preds = %19
  %49 = load i32, ptr %6, align 4
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %51, label %54

51:                                               ; preds = %48
  %52 = load i32, ptr %6, align 4
  %53 = sub nsw i32 0, %52
  store i32 %53, ptr %.reg2mem, align 4
  br label %55

54:                                               ; preds = %48
  store i32 -2, ptr %.reg2mem, align 4
  br label %55

55:                                               ; preds = %54, %51
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
