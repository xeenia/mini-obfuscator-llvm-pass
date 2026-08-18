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
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  br label %8

8:                                                ; preds = %3
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %6, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %7, align 4
  br label %13

13:                                               ; preds = %8
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %5, align 4
  %20 = mul nsw i32 %18, %19
  store i32 %20, ptr %7, align 4
  br label %21

21:                                               ; preds = %16, %13
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
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
  br label %8

8:                                                ; preds = %3
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %10 = load i32, ptr %4, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %7, align 4
  br label %12

12:                                               ; preds = %8
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %20

15:                                               ; preds = %12
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %5, align 4
  %19 = mul nsw i32 %17, %18
  store i32 %19, ptr %7, align 4
  br label %25

20:                                               ; preds = %12
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %6, align 4
  %24 = sub nsw i32 %22, %23
  store i32 %24, ptr %7, align 4
  br label %25

25:                                               ; preds = %20, %15
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
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
  %.reg2mem = alloca i1, align 1
  %.reg2mem1 = alloca i1, align 1
  br label %13

13:                                               ; preds = %4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 0
  %17 = zext i1 %16 to i32
  store i32 %17, ptr %9, align 4
  br label %18

18:                                               ; preds = %13
  %19 = load i32, ptr %9, align 4
  %20 = icmp ne i32 %19, 0
  store i1 false, ptr %.reg2mem, align 1
  br i1 %20, label %21, label %26

21:                                               ; preds = %18
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %6, align 4
  %24 = srem i32 %22, %23
  %25 = icmp eq i32 %24, 0
  store i1 %25, ptr %.reg2mem, align 1
  br label %26

26:                                               ; preds = %18, %21
  %.reload = load i1, ptr %.reg2mem, align 1
  %27 = zext i1 %.reload to i32
  store i32 %27, ptr %10, align 4
  br label %28

28:                                               ; preds = %26
  %29 = load i32, ptr %9, align 4
  %30 = icmp ne i32 %29, 0
  store i1 false, ptr %.reg2mem1, align 1
  br i1 %30, label %31, label %35

31:                                               ; preds = %28
  %32 = load i32, ptr %10, align 4
  %33 = icmp ne i32 %32, 0
  %34 = xor i1 %33, true
  store i1 %34, ptr %.reg2mem1, align 1
  br label %35

35:                                               ; preds = %28, %31
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %36 = zext i1 %.reload2 to i32
  store i32 %36, ptr %11, align 4
  %37 = load i32, ptr %5, align 4
  store i32 %37, ptr %12, align 4
  br label %38

38:                                               ; preds = %35
  %39 = load i32, ptr %10, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %38
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %43

43:                                               ; preds = %41, %38
  %44 = load i32, ptr %11, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %48

46:                                               ; preds = %43
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %48

48:                                               ; preds = %43, %46
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %50

50:                                               ; preds = %48
  %51 = load i32, ptr %5, align 4
  %52 = load i32, ptr %7, align 4
  %53 = icmp eq i32 %51, %52
  br i1 %53, label %54, label %57

54:                                               ; preds = %50
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %56 = load i32, ptr %7, align 4
  store i32 %56, ptr %12, align 4
  br label %60

57:                                               ; preds = %50
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %59 = load i32, ptr %8, align 4
  store i32 %59, ptr %12, align 4
  br label %60

60:                                               ; preds = %57, %54
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
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
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
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
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %35 = load i32, ptr %11, align 4
  %36 = sub nsw i32 %35, 1
  store i32 %36, ptr %11, align 4
  br label %37

37:                                               ; preds = %33, %29
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
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
  br label %21

21:                                               ; preds = %12
  %22 = load i32, ptr %10, align 4
  %23 = load i32, ptr %8, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %27 = load i32, ptr %10, align 4
  %28 = sdiv i32 %27, 2
  store i32 %28, ptr %10, align 4
  br label %33

29:                                               ; preds = %21
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %31 = load i32, ptr %10, align 4
  %32 = add nsw i32 %31, 10
  store i32 %32, ptr %10, align 4
  br label %33

33:                                               ; preds = %29, %25
  %34 = load i32, ptr %10, align 4
  %35 = load i32, ptr %5, align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr %11, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
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
  br label %7

7:                                                ; preds = %3
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %9

9:                                                ; preds = %7
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %39

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %14

14:                                               ; preds = %12
  %15 = load i32, ptr %4, align 4
  %16 = srem i32 %15, 2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %14
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %38

20:                                               ; preds = %14
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %22

22:                                               ; preds = %20
  %23 = load i32, ptr %4, align 4
  %24 = icmp eq i32 %23, 3
  br i1 %24, label %25, label %35

25:                                               ; preds = %22
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %27

27:                                               ; preds = %25
  %28 = load i32, ptr %4, align 4
  %29 = icmp eq i32 %28, 20
  br i1 %29, label %30, label %32

30:                                               ; preds = %27
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %34

32:                                               ; preds = %27
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %34

34:                                               ; preds = %32, %30
  br label %37

35:                                               ; preds = %22
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %37

37:                                               ; preds = %35, %34
  br label %38

38:                                               ; preds = %37, %18
  br label %41

39:                                               ; preds = %9
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %41

41:                                               ; preds = %39, %38
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
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
  br label %7

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, i32 noundef %8)
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

19:                                               ; preds = %14, %13
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
