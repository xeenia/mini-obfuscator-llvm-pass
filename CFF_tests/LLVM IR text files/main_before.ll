; ModuleID = 'main.c'
source_filename = "main.c"
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
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %6, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %7, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %3
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %5, align 4
  %18 = mul nsw i32 %16, %17
  store i32 %18, ptr %7, align 4
  br label %19

19:                                               ; preds = %14, %3
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
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
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %9 = load i32, ptr %4, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %18

13:                                               ; preds = %3
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %5, align 4
  %17 = mul nsw i32 %15, %16
  store i32 %17, ptr %7, align 4
  br label %23

18:                                               ; preds = %3
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = sub nsw i32 %20, %21
  store i32 %22, ptr %7, align 4
  br label %23

23:                                               ; preds = %18, %13
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
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
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %14 = load i32, ptr %5, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = zext i1 %15 to i32
  store i32 %16, ptr %9, align 4
  %17 = load i32, ptr %9, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %24

19:                                               ; preds = %4
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %6, align 4
  %22 = srem i32 %20, %21
  %23 = icmp eq i32 %22, 0
  br label %24

24:                                               ; preds = %19, %4
  %25 = phi i1 [ false, %4 ], [ %23, %19 ]
  %26 = zext i1 %25 to i32
  store i32 %26, ptr %10, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %33

29:                                               ; preds = %24
  %30 = load i32, ptr %10, align 4
  %31 = icmp ne i32 %30, 0
  %32 = xor i1 %31, true
  br label %33

33:                                               ; preds = %29, %24
  %34 = phi i1 [ false, %24 ], [ %32, %29 ]
  %35 = zext i1 %34 to i32
  store i32 %35, ptr %11, align 4
  %36 = load i32, ptr %5, align 4
  store i32 %36, ptr %12, align 4
  %37 = load i32, ptr %10, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %41

39:                                               ; preds = %33
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %41

41:                                               ; preds = %39, %33
  %42 = load i32, ptr %11, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %46

44:                                               ; preds = %41
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %46

46:                                               ; preds = %44, %41
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %48 = load i32, ptr %5, align 4
  %49 = load i32, ptr %7, align 4
  %50 = icmp eq i32 %48, %49
  br i1 %50, label %51, label %54

51:                                               ; preds = %46
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %53 = load i32, ptr %7, align 4
  store i32 %53, ptr %12, align 4
  br label %57

54:                                               ; preds = %46
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %56 = load i32, ptr %8, align 4
  store i32 %56, ptr %12, align 4
  br label %57

57:                                               ; preds = %54, %51
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
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
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str)
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
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %33 = load i32, ptr %11, align 4
  %34 = sub nsw i32 %33, 1
  store i32 %34, ptr %11, align 4
  br label %35

35:                                               ; preds = %31, %26
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
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
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %9, align 4
  %16 = load i32, ptr %9, align 4
  %17 = load i32, ptr %7, align 4
  %18 = mul nsw i32 %16, %17
  store i32 %18, ptr %10, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %20 = load i32, ptr %10, align 4
  %21 = load i32, ptr %8, align 4
  %22 = icmp sgt i32 %20, %21
  br i1 %22, label %23, label %27

23:                                               ; preds = %4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %25 = load i32, ptr %10, align 4
  %26 = sdiv i32 %25, 2
  store i32 %26, ptr %10, align 4
  br label %31

27:                                               ; preds = %4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %29 = load i32, ptr %10, align 4
  %30 = add nsw i32 %29, 10
  store i32 %30, ptr %10, align 4
  br label %31

31:                                               ; preds = %27, %23
  %32 = load i32, ptr %10, align 4
  %33 = load i32, ptr %5, align 4
  %34 = sub nsw i32 %32, %33
  store i32 %34, ptr %11, align 4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_6_ifnested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %34

10:                                               ; preds = %3
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %12 = load i32, ptr %4, align 4
  %13 = srem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %10
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %33

17:                                               ; preds = %10
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %19 = load i32, ptr %4, align 4
  %20 = icmp eq i32 %19, 3
  br i1 %20, label %21, label %30

21:                                               ; preds = %17
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %23 = load i32, ptr %4, align 4
  %24 = icmp eq i32 %23, 20
  br i1 %24, label %25, label %27

25:                                               ; preds = %21
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %29

27:                                               ; preds = %21
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %29

29:                                               ; preds = %27, %25
  br label %32

30:                                               ; preds = %17
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %32

32:                                               ; preds = %30, %29
  br label %33

33:                                               ; preds = %32, %15
  br label %36

34:                                               ; preds = %3
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %36

36:                                               ; preds = %34, %33
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
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
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, i32 noundef %7)
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
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  call void @_1_ifalone(i32 noundef 5, i32 noundef 2, i32 noundef 0)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  call void @_1_ifalone(i32 noundef -1, i32 noundef 2, i32 noundef 0)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  call void @_2_ifelse(i32 noundef 5, i32 noundef 2, i32 noundef 1)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  call void @_2_ifelse(i32 noundef -1, i32 noundef 2, i32 noundef 1)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  call void @_3_ifflat(i32 noundef 10, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  call void @_3_ifflat(i32 noundef 4, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  call void @_3_ifflat(i32 noundef 5, i32 noundef 2, i32 noundef 5, i32 noundef 20)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  call void @_3_ifflat(i32 noundef 3, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  call void @_3_ifflat(i32 noundef -2, i32 noundef 2, i32 noundef 10, i32 noundef 20)
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  call void @_4_prefixheavy(i32 noundef 20, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  call void @_4_prefixheavy(i32 noundef 10, i32 noundef 3, i32 noundef 5, i32 noundef 50)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.34)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  call void @_5_multistage(i32 noundef 10, i32 noundef 10, i32 noundef 2, i32 noundef 30)
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.36)
  call void @_5_multistage(i32 noundef 1, i32 noundef 4, i32 noundef 2, i32 noundef 30)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.37)
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.38)
  call void @_6_ifnested(i32 noundef -1, i32 noundef 7, i32 noundef 3)
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.39)
  call void @_6_ifnested(i32 noundef 4, i32 noundef 7, i32 noundef 3)
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.40)
  call void @_6_ifnested(i32 noundef 5, i32 noundef 7, i32 noundef 3)
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.41)
  call void @_6_ifnested(i32 noundef 3, i32 noundef 7, i32 noundef 3)
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
