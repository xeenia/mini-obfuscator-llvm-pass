; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.numbers = private unnamed_addr constant [5 x i32] [i32 -4, i32 0, i32 3, i32 8, i32 11], align 16
@.str = private unnamed_addr constant [12 x i8] c"Number: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"Absolute value: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Zero\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Positive odd\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Positive even\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"Negative\0A\00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"Sum until 10: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [33 x i8] c"First number divisible by 7: %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"No number divisible by 7 found\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"Score: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @absolute_value(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = sub nsw i32 0, %7
  store i32 %8, ptr %2, align 4
  br label %11

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  store i32 %10, ptr %2, align 4
  br label %11

11:                                               ; preds = %9, %6
  %12 = load i32, ptr %2, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @classify_number(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %17

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %10
  store i32 2, ptr %2, align 4
  br label %17

15:                                               ; preds = %10
  store i32 1, ptr %2, align 4
  br label %17

16:                                               ; preds = %7
  store i32 -1, ptr %2, align 4
  br label %17

17:                                               ; preds = %16, %15, %14, %6
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sum_until(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %15, %1
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp sle i32 %7, %8
  br i1 %9, label %10, label %21

10:                                               ; preds = %6
  %11 = load i32, ptr %5, align 4
  %12 = icmp eq i32 %11, 5
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = load i32, ptr %4, align 4
  store i32 %14, ptr %2, align 4
  br label %23

15:                                               ; preds = %10
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %4, align 4
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %6, !llvm.loop !6

21:                                               ; preds = %6
  %22 = load i32, ptr %4, align 4
  store i32 %22, ptr %2, align 4
  br label %23

23:                                               ; preds = %21, %13
  %24 = load i32, ptr %2, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @find_first_divisible(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %9 = load i32, ptr %5, align 4
  store i32 %9, ptr %8, align 4
  br label %10

10:                                               ; preds = %22, %3
  %11 = load i32, ptr %8, align 4
  %12 = load i32, ptr %6, align 4
  %13 = icmp sle i32 %11, %12
  br i1 %13, label %14, label %25

14:                                               ; preds = %10
  %15 = load i32, ptr %8, align 4
  %16 = load i32, ptr %7, align 4
  %17 = srem i32 %15, %16
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %14
  %20 = load i32, ptr %8, align 4
  store i32 %20, ptr %4, align 4
  br label %26

21:                                               ; preds = %14
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %8, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %8, align 4
  br label %10, !llvm.loop !8

25:                                               ; preds = %10
  store i32 -1, ptr %4, align 4
  br label %26

26:                                               ; preds = %25, %19
  %27 = load i32, ptr %4, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @calculate_score(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store i32 -1, ptr %2, align 4
  br label %36

9:                                                ; preds = %1
  store i32 1, ptr %5, align 4
  br label %10

10:                                               ; preds = %31, %9
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp sle i32 %11, %12
  br i1 %13, label %14, label %34

14:                                               ; preds = %10
  %15 = load i32, ptr %5, align 4
  %16 = srem i32 %15, 2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %4, align 4
  br label %25

22:                                               ; preds = %14
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %25

25:                                               ; preds = %22, %18
  %26 = load i32, ptr %4, align 4
  %27 = icmp sgt i32 %26, 20
  br i1 %27, label %28, label %30

28:                                               ; preds = %25
  %29 = load i32, ptr %4, align 4
  store i32 %29, ptr %2, align 4
  br label %36

30:                                               ; preds = %25
  br label %31

31:                                               ; preds = %30
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %5, align 4
  br label %10, !llvm.loop !9

34:                                               ; preds = %10
  %35 = load i32, ptr %4, align 4
  store i32 %35, ptr %2, align 4
  br label %36

36:                                               ; preds = %34, %28, %8
  %37 = load i32, ptr %2, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.numbers, i64 20, i1 false)
  store i32 5, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %44, %0
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %47

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %5, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %18)
  %20 = load i32, ptr %5, align 4
  %21 = call i32 @absolute_value(i32 noundef %20)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %21)
  %23 = load i32, ptr %5, align 4
  %24 = call i32 @classify_number(i32 noundef %23)
  store i32 %24, ptr %6, align 4
  %25 = load i32, ptr %6, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %13
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %43

29:                                               ; preds = %13
  %30 = load i32, ptr %6, align 4
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %34

32:                                               ; preds = %29
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %42

34:                                               ; preds = %29
  %35 = load i32, ptr %6, align 4
  %36 = icmp eq i32 %35, 2
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %41

39:                                               ; preds = %34
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %41

41:                                               ; preds = %39, %37
  br label %42

42:                                               ; preds = %41, %32
  br label %43

43:                                               ; preds = %42, %27
  br label %44

44:                                               ; preds = %43
  %45 = load i32, ptr %4, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %4, align 4
  br label %9, !llvm.loop !10

47:                                               ; preds = %9
  %48 = call i32 @sum_until(i32 noundef 10)
  store i32 %48, ptr %7, align 4
  %49 = load i32, ptr %7, align 4
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %49)
  %51 = call i32 @find_first_divisible(i32 noundef 3, i32 noundef 20, i32 noundef 7)
  store i32 %51, ptr %8, align 4
  %52 = load i32, ptr %8, align 4
  %53 = icmp ne i32 %52, -1
  br i1 %53, label %54, label %57

54:                                               ; preds = %47
  %55 = load i32, ptr %8, align 4
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %55)
  br label %59

57:                                               ; preds = %47
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %59

59:                                               ; preds = %57, %54
  %60 = call i32 @calculate_score(i32 noundef 10)
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %60)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
