; ModuleID = 'main.c'
source_filename = "main.c"
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
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %8, i32 noundef %9, i32 noundef %10)
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %6, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %7, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %24

17:                                               ; preds = %3
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %5, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %18, i32 noundef %19)
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %5, align 4
  %23 = mul nsw i32 %21, %22
  store i32 %23, ptr %7, align 4
  br label %24

24:                                               ; preds = %17, %3
  %25 = load i32, ptr %7, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %25)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

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
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %8, i32 noundef %9, i32 noundef %10)
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %7, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %23

16:                                               ; preds = %3
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %17, i32 noundef %18)
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %5, align 4
  %22 = mul nsw i32 %20, %21
  store i32 %22, ptr %7, align 4
  br label %30

23:                                               ; preds = %3
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %6, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %24, i32 noundef %25)
  %27 = load i32, ptr %7, align 4
  %28 = load i32, ptr %6, align 4
  %29 = sub nsw i32 %27, %28
  store i32 %29, ptr %7, align 4
  br label %30

30:                                               ; preds = %23, %16
  %31 = load i32, ptr %7, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %31)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifflat(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
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
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %8, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %13, i32 noundef %14, i32 noundef %15, i32 noundef %16)
  %18 = load i32, ptr %5, align 4
  %19 = icmp sgt i32 %18, 0
  %20 = zext i1 %19 to i32
  store i32 %20, ptr %9, align 4
  %21 = load i32, ptr %9, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %28

23:                                               ; preds = %4
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %6, align 4
  %26 = srem i32 %24, %25
  %27 = icmp eq i32 %26, 0
  br label %28

28:                                               ; preds = %23, %4
  %29 = phi i1 [ false, %4 ], [ %27, %23 ]
  %30 = zext i1 %29 to i32
  store i32 %30, ptr %10, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %37

33:                                               ; preds = %28
  %34 = load i32, ptr %10, align 4
  %35 = icmp ne i32 %34, 0
  %36 = xor i1 %35, true
  br label %37

37:                                               ; preds = %33, %28
  %38 = phi i1 [ false, %28 ], [ %36, %33 ]
  %39 = zext i1 %38 to i32
  store i32 %39, ptr %11, align 4
  %40 = load i32, ptr %5, align 4
  store i32 %40, ptr %12, align 4
  %41 = load i32, ptr %10, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %47

43:                                               ; preds = %37
  %44 = load i32, ptr %5, align 4
  %45 = load i32, ptr %6, align 4
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %44, i32 noundef %45)
  br label %47

47:                                               ; preds = %43, %37
  %48 = load i32, ptr %11, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %54

50:                                               ; preds = %47
  %51 = load i32, ptr %5, align 4
  %52 = load i32, ptr %6, align 4
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %51, i32 noundef %52)
  br label %54

54:                                               ; preds = %50, %47
  %55 = load i32, ptr %5, align 4
  %56 = load i32, ptr %7, align 4
  %57 = icmp eq i32 %55, %56
  br i1 %57, label %58, label %63

58:                                               ; preds = %54
  %59 = load i32, ptr %5, align 4
  %60 = load i32, ptr %7, align 4
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %59, i32 noundef %60)
  %62 = load i32, ptr %7, align 4
  store i32 %62, ptr %12, align 4
  br label %68

63:                                               ; preds = %54
  %64 = load i32, ptr %5, align 4
  %65 = load i32, ptr %7, align 4
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %64, i32 noundef %65)
  %67 = load i32, ptr %8, align 4
  store i32 %67, ptr %12, align 4
  br label %68

68:                                               ; preds = %63, %58
  %69 = load i32, ptr %12, align 4
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %69)
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
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %8, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %12, i32 noundef %13, i32 noundef %14, i32 noundef %15)
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  %19 = mul nsw i32 %17, %18
  store i32 %19, ptr %9, align 4
  %20 = load i32, ptr %9, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %20)
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %7, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %10, align 4
  %25 = load i32, ptr %10, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, i32 noundef %25)
  %27 = load i32, ptr %10, align 4
  %28 = load i32, ptr %8, align 4
  %29 = icmp sgt i32 %27, %28
  br i1 %29, label %30, label %32

30:                                               ; preds = %4
  %31 = load i32, ptr %8, align 4
  br label %34

32:                                               ; preds = %4
  %33 = load i32, ptr %10, align 4
  br label %34

34:                                               ; preds = %32, %30
  %35 = phi i32 [ %31, %30 ], [ %33, %32 ]
  store i32 %35, ptr %11, align 4
  %36 = load i32, ptr %11, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, i32 noundef %36)
  %38 = load i32, ptr %11, align 4
  %39 = load i32, ptr %8, align 4
  %40 = icmp eq i32 %38, %39
  br i1 %40, label %41, label %47

41:                                               ; preds = %34
  %42 = load i32, ptr %11, align 4
  %43 = load i32, ptr %8, align 4
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i32 noundef %42, i32 noundef %43)
  %45 = load i32, ptr %11, align 4
  %46 = sub nsw i32 %45, 1
  store i32 %46, ptr %11, align 4
  br label %47

47:                                               ; preds = %41, %34
  %48 = load i32, ptr %11, align 4
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, i32 noundef %48)
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
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %8, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.19, i32 noundef %12, i32 noundef %13, i32 noundef %14, i32 noundef %15)
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %9, align 4
  %20 = load i32, ptr %9, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %20)
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %7, align 4
  %24 = mul nsw i32 %22, %23
  store i32 %24, ptr %10, align 4
  %25 = load i32, ptr %10, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, i32 noundef %25)
  %27 = load i32, ptr %10, align 4
  %28 = load i32, ptr %8, align 4
  %29 = icmp sgt i32 %27, %28
  br i1 %29, label %30, label %36

30:                                               ; preds = %4
  %31 = load i32, ptr %10, align 4
  %32 = load i32, ptr %8, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %31, i32 noundef %32)
  %34 = load i32, ptr %10, align 4
  %35 = sdiv i32 %34, 2
  store i32 %35, ptr %10, align 4
  br label %42

36:                                               ; preds = %4
  %37 = load i32, ptr %10, align 4
  %38 = load i32, ptr %8, align 4
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i32 noundef %37, i32 noundef %38)
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %40, 10
  store i32 %41, ptr %10, align 4
  br label %42

42:                                               ; preds = %36, %30
  %43 = load i32, ptr %10, align 4
  %44 = load i32, ptr %5, align 4
  %45 = sub nsw i32 %43, %44
  store i32 %45, ptr %11, align 4
  %46 = load i32, ptr %11, align 4
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, i32 noundef %46)
  %48 = load i32, ptr %11, align 4
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i32 noundef %48)
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
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.26, i32 noundef %8, i32 noundef %9, i32 noundef %10)
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %7, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %39

17:                                               ; preds = %3
  %18 = load i32, ptr %4, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.27, i32 noundef %18)
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = srem i32 %20, %21
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %31

24:                                               ; preds = %17
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %6, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.28, i32 noundef %25, i32 noundef %26)
  %28 = load i32, ptr %7, align 4
  %29 = load i32, ptr %6, align 4
  %30 = sdiv i32 %28, %29
  store i32 %30, ptr %7, align 4
  br label %38

31:                                               ; preds = %17
  %32 = load i32, ptr %7, align 4
  %33 = load i32, ptr %6, align 4
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.29, i32 noundef %32, i32 noundef %33)
  %35 = load i32, ptr %7, align 4
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, ptr %7, align 4
  br label %38

38:                                               ; preds = %31, %24
  br label %44

39:                                               ; preds = %3
  %40 = load i32, ptr %4, align 4
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, i32 noundef %40)
  %42 = load i32, ptr %7, align 4
  %43 = sub nsw i32 %42, 1
  store i32 %43, ptr %7, align 4
  br label %44

44:                                               ; preds = %39, %38
  %45 = load i32, ptr %7, align 4
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, i32 noundef %45)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_7_ifnested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %33

9:                                                ; preds = %3
  %10 = load i32, ptr %4, align 4
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  br label %32

15:                                               ; preds = %9
  %16 = load i32, ptr %4, align 4
  %17 = icmp eq i32 %16, 3
  br i1 %17, label %18, label %24

18:                                               ; preds = %15
  %19 = load i32, ptr %4, align 4
  %20 = icmp eq i32 %19, 20
  br i1 %20, label %21, label %23

21:                                               ; preds = %18
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  br label %23

23:                                               ; preds = %21, %18
  br label %26

24:                                               ; preds = %15
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  br label %26

26:                                               ; preds = %24, %23
  %27 = load i32, ptr %4, align 4
  %28 = icmp eq i32 %27, 10
  br i1 %28, label %29, label %30

29:                                               ; preds = %26
  store i32 10, ptr %4, align 4
  br label %31

30:                                               ; preds = %26
  store i32 20, ptr %4, align 4
  br label %31

31:                                               ; preds = %30, %29
  br label %32

32:                                               ; preds = %31, %13
  br label %33

33:                                               ; preds = %32, %3
  %34 = load i32, ptr %4, align 4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.33, i32 noundef %34)
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

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
