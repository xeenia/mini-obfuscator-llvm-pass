; ModuleID = 'main.c'
source_filename = "main.c"
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
  %2 = load i32, ptr @globalvar, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %2)
  %4 = load i32, ptr @globalvar, align 4
  store i32 %4, ptr %1, align 4
  %5 = load i32, ptr @globalvar, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %9 = load i32, ptr %1, align 4
  %10 = mul nsw i32 %9, 2
  store i32 %10, ptr %1, align 4
  br label %11

11:                                               ; preds = %7, %0
  %12 = load i32, ptr %1, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %12)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifalone(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %4, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %6, i32 noundef %7)
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %4, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %5, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %2
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %16 = load i32, ptr %5, align 4
  %17 = mul nsw i32 %16, 2
  store i32 %17, ptr %5, align 4
  br label %18

18:                                               ; preds = %14, %2
  %19 = load i32, ptr %5, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %19)
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
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %6, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %9, i32 noundef %10)
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %6, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %7, align 4
  %15 = load i8, ptr %4, align 1
  %16 = trunc i8 %15 to i1
  br i1 %16, label %17, label %21

17:                                               ; preds = %3
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %19 = load i32, ptr %7, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, ptr %7, align 4
  br label %21

21:                                               ; preds = %17, %3
  %22 = load i32, ptr %7, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %22)
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
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %6, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %8, i32 noundef %9, i32 noundef %10)
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %7, align 4
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %5, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp eq i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = icmp sgt i32 %14, %18
  br i1 %19, label %20, label %24

20:                                               ; preds = %3
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %22 = load i32, ptr %7, align 4
  %23 = mul nsw i32 %22, 2
  store i32 %23, ptr %7, align 4
  br label %28

24:                                               ; preds = %3
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %26 = load i32, ptr %7, align 4
  %27 = mul nsw i32 %26, 0
  store i32 %27, ptr %7, align 4
  br label %28

28:                                               ; preds = %24, %20
  %29 = load i32, ptr %7, align 4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %29)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifflat(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %4)
  %6 = load i32, ptr %2, align 4
  store i32 %6, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %9, %1
  %14 = load i32, ptr %2, align 4
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %21

17:                                               ; preds = %13
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 100
  store i32 %20, ptr %3, align 4
  br label %21

21:                                               ; preds = %17, %13
  %22 = load i32, ptr %2, align 4
  %23 = srem i32 %22, 3
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %27 = load i32, ptr %3, align 4
  %28 = mul nsw i32 %27, 2
  store i32 %28, ptr %3, align 4
  br label %29

29:                                               ; preds = %25, %21
  %30 = load i32, ptr %3, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %30)
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
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = mul nsw i32 %13, %14
  store i32 %15, ptr %9, align 4
  %16 = load i32, ptr %9, align 4
  %17 = load i32, ptr %7, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %10, align 4
  %19 = load i32, ptr %10, align 4
  %20 = load i32, ptr %8, align 4
  %21 = icmp sgt i32 %19, %20
  br i1 %21, label %22, label %24

22:                                               ; preds = %4
  %23 = load i32, ptr %8, align 4
  br label %26

24:                                               ; preds = %4
  %25 = load i32, ptr %10, align 4
  br label %26

26:                                               ; preds = %24, %22
  %27 = phi i32 [ %23, %22 ], [ %25, %24 ]
  store i32 %27, ptr %11, align 4
  %28 = load i32, ptr %11, align 4
  %29 = load i32, ptr %8, align 4
  %30 = icmp eq i32 %28, %29
  br i1 %30, label %31, label %35

31:                                               ; preds = %26
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %33 = load i32, ptr %11, align 4
  %34 = sub nsw i32 %33, 1
  store i32 %34, ptr %11, align 4
  br label %35

35:                                               ; preds = %31, %26
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
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
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %9, align 4
  %16 = load i32, ptr %9, align 4
  %17 = load i32, ptr %7, align 4
  %18 = mul nsw i32 %16, %17
  store i32 %18, ptr %10, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %20 = load i32, ptr %10, align 4
  %21 = load i32, ptr %8, align 4
  %22 = icmp sgt i32 %20, %21
  br i1 %22, label %23, label %27

23:                                               ; preds = %4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %25 = load i32, ptr %10, align 4
  %26 = sdiv i32 %25, 2
  store i32 %26, ptr %10, align 4
  br label %31

27:                                               ; preds = %4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %29 = load i32, ptr %10, align 4
  %30 = add nsw i32 %29, 10
  store i32 %30, ptr %10, align 4
  br label %31

31:                                               ; preds = %27, %23
  %32 = load i32, ptr %10, align 4
  %33 = load i32, ptr %5, align 4
  %34 = sub nsw i32 %32, %33
  store i32 %34, ptr %11, align 4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
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
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %6, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %8, i32 noundef %9, i32 noundef %10)
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %7, align 4
  %14 = load i32, ptr %4, align 4
  %15 = srem i32 %14, 3
  %16 = load i32, ptr %5, align 4
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %18, label %34

18:                                               ; preds = %3
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %20, 5
  store i32 %21, ptr %7, align 4
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %6, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %18
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %27 = load i32, ptr %7, align 4
  %28 = mul nsw i32 %27, 2
  store i32 %28, ptr %7, align 4
  br label %33

29:                                               ; preds = %18
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %31 = load i32, ptr %7, align 4
  %32 = sub nsw i32 %31, 3
  store i32 %32, ptr %7, align 4
  br label %33

33:                                               ; preds = %29, %25
  br label %38

34:                                               ; preds = %3
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %36 = load i32, ptr %7, align 4
  %37 = mul nsw i32 %36, 0
  store i32 %37, ptr %7, align 4
  br label %38

38:                                               ; preds = %34, %33
  %39 = load i32, ptr %7, align 4
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %39)
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
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %6, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %8, i32 noundef %9, i32 noundef %10)
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %7, align 4
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %17, label %43

17:                                               ; preds = %3
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %19 = load i32, ptr %7, align 4
  %20 = add nsw i32 %19, 5
  store i32 %20, ptr %7, align 4
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr @globalvar, align 4
  %24 = add nsw i32 %22, %23
  %25 = icmp sgt i32 %21, %24
  br i1 %25, label %26, label %30

26:                                               ; preds = %17
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %28 = load i32, ptr %7, align 4
  %29 = mul nsw i32 %28, 2
  store i32 %29, ptr %7, align 4
  br label %42

30:                                               ; preds = %17
  %31 = load i32, ptr %7, align 4
  %32 = srem i32 %31, 5
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %30
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %38

36:                                               ; preds = %30
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  br label %38

38:                                               ; preds = %36, %34
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %40 = load i32, ptr %7, align 4
  %41 = sub nsw i32 %40, 3
  store i32 %41, ptr %7, align 4
  br label %42

42:                                               ; preds = %38, %26
  br label %47

43:                                               ; preds = %3
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  %45 = load i32, ptr %7, align 4
  %46 = mul nsw i32 %45, 0
  store i32 %46, ptr %7, align 4
  br label %47

47:                                               ; preds = %43, %42
  %48 = load i32, ptr %7, align 4
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %48)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_8_ifelseifelse(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %5)
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 10
  br i1 %8, label %9, label %13

9:                                                ; preds = %1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 100
  store i32 %12, ptr %3, align 4
  br label %25

13:                                               ; preds = %1
  %14 = load i32, ptr %2, align 4
  %15 = icmp sgt i32 %14, 5
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, 50
  store i32 %19, ptr %3, align 4
  br label %24

20:                                               ; preds = %13
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, 10
  store i32 %23, ptr %3, align 4
  br label %24

24:                                               ; preds = %20, %16
  br label %25

25:                                               ; preds = %24, %9
  %26 = load i32, ptr %3, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, i32 noundef %26)
  %28 = load i32, ptr %3, align 4
  %29 = mul nsw i32 %28, 2
  store i32 %29, ptr %4, align 4
  %30 = load i32, ptr %4, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, i32 noundef %30)
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
  %7 = load i32, ptr %4, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.32, i32 noundef %7)
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
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.34)
  call void @_0_nocodeifalone()
  store i32 0, ptr @globalvar, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  call void @_0_nocodeifalone()
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  store i32 5, ptr @globalvar, align 4
  call void @_0_nocodeifelse()
  store i32 0, ptr @globalvar, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  call void @_0_nocodeifelse()
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.40)
  store i32 5, ptr @globalvar, align 4
  call void @_0_global()
  store i32 0, ptr @globalvar, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.41)
  call void @_0_global()
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.42)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.43)
  call void @_1_ifalone(i32 noundef 5, i32 noundef 0)
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.44)
  call void @_1_ifalone(i32 noundef -1, i32 noundef 5)
  %30 = load i32, ptr %6, align 4
  call void @_1_ifalone(i32 noundef %30, i32 noundef 5)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.45)
  call void @_1_ifalone_arg_condition(i1 noundef zeroext true, i32 noundef 1, i32 noundef 4)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.46)
  call void @_1_ifalone_arg_condition(i1 noundef zeroext false, i32 noundef 1, i32 noundef 4)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.47)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.48)
  call void @_2_ifelse(i32 noundef 5, i32 noundef 2, i32 noundef 1)
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.49)
  call void @_2_ifelse(i32 noundef -1, i32 noundef 2, i32 noundef 1)
  %36 = load i32, ptr %6, align 4
  call void @_2_ifelse(i32 noundef -1, i32 noundef %36, i32 noundef 1)
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.50)
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.51)
  call void @_3_ifflat(i32 noundef 1)
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.52)
  call void @_3_ifflat(i32 noundef 3)
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.53)
  call void @_3_ifflat(i32 noundef 2)
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.54)
  call void @_3_ifflat(i32 noundef 6)
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.55)
  call void @_3_ifflat(i32 noundef -1)
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.56)
  call void @_3_ifflat(i32 noundef -3)
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.57)
  call void @_3_ifflat(i32 noundef -2)
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.58)
  call void @_3_ifflat(i32 noundef -6)
  %46 = load i32, ptr %6, align 4
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %48, label %51

48:                                               ; preds = %17
  %49 = load i32, ptr %6, align 4
  %50 = sub nsw i32 0, %49
  br label %52

51:                                               ; preds = %17
  br label %52

52:                                               ; preds = %51, %48
  %53 = phi i32 [ %50, %48 ], [ -2, %51 ]
  call void @_3_ifflat(i32 noundef %53)
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.59)
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.60)
  call void @_4_prefixheavy(i32 noundef 20, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.61)
  %57 = load i32, ptr %6, align 4
  call void @_4_prefixheavy(i32 noundef %57, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.62)
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.60)
  call void @_4_prefixheavy(i32 noundef 10, i32 noundef 10, i32 noundef 2, i32 noundef 30)
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.63)
  call void @_4_prefixheavy(i32 noundef 2, i32 noundef 5, i32 noundef 1, i32 noundef 30)
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.62)
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.64)
  call void @_5_multistage(i32 noundef 10, i32 noundef 4, i32 noundef 2, i32 noundef 20)
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.65)
  call void @_5_multistage(i32 noundef 10, i32 noundef 4, i32 noundef 2, i32 noundef 30)
  %64 = load i32, ptr %6, align 4
  call void @_5_multistage(i32 noundef %64, i32 noundef 4, i32 noundef 2, i32 noundef 30)
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.66)
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.67)
  call void @_6_ifnested(i32 noundef 2, i32 noundef 5, i32 noundef 3)
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.68)
  call void @_6_ifnested(i32 noundef 5, i32 noundef 1, i32 noundef 3)
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.69)
  call void @_6_ifnested(i32 noundef 2, i32 noundef 1, i32 noundef 10)
  %69 = load i32, ptr %6, align 4
  call void @_6_ifnested(i32 noundef 5, i32 noundef %69, i32 noundef 20)
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.70)
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str.71)
  call void @_7_multiifnested(i32 noundef 1, i32 noundef 5, i32 noundef 3)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.72)
  call void @_7_multiifnested(i32 noundef 10, i32 noundef 2, i32 noundef 1)
  %73 = call i32 (ptr, ...) @printf(ptr noundef @.str.73)
  call void @_7_multiifnested(i32 noundef 4, i32 noundef 2, i32 noundef 10)
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.74)
  call void @_7_multiifnested(i32 noundef 5, i32 noundef 2, i32 noundef 10)
  %75 = load i32, ptr %6, align 4
  call void @_7_multiifnested(i32 noundef 5, i32 noundef %75, i32 noundef 10)
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.75)
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.76)
  call void @_8_ifelseifelse(i32 noundef 20)
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.77)
  call void @_8_ifelseifelse(i32 noundef 8)
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.78)
  call void @_8_ifelseifelse(i32 noundef 3)
  ret i32 0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
