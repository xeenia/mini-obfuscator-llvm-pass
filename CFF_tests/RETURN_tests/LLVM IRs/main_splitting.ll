; ModuleID = 'main.bc'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [38 x i8] c"_7_validate_and_print: invalid input\0A\00", align 1
@.str.1 = private unnamed_addr constant [39 x i8] c"_7_validate_and_print: valid input %d\0A\00", align 1
@__const.main.numbers = private unnamed_addr constant [5 x i32] [i32 -4, i32 0, i32 3, i32 8, i32 11], align 16
@.str.2 = private unnamed_addr constant [12 x i8] c"Number: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"Absolute value: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"Zero\0A\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"Positive odd\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Positive even\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"Negative\0A\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"Sum until 10: %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [33 x i8] c"First number divisible by 7: %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [32 x i8] c"No number divisible by 7 found\0A\00", align 1
@.str.11 = private unnamed_addr constant [11 x i8] c"Score: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [19 x i8] c"Pair found at: %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"First negative: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_0_absolute_value(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  br label %4

4:                                                ; preds = %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  %8 = load i32, ptr %3, align 4
  %9 = sub nsw i32 0, %8
  store i32 %9, ptr %2, align 4
  br label %12

10:                                               ; preds = %4
  %11 = load i32, ptr %3, align 4
  store i32 %11, ptr %2, align 4
  br label %12

12:                                               ; preds = %10, %7
  %13 = load i32, ptr %2, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_1_classify_number(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  br label %4

4:                                                ; preds = %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  store i32 0, ptr %2, align 4
  br label %18

8:                                                ; preds = %4
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %17

11:                                               ; preds = %8
  %12 = load i32, ptr %3, align 4
  %13 = srem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  store i32 2, ptr %2, align 4
  br label %18

16:                                               ; preds = %11
  store i32 1, ptr %2, align 4
  br label %18

17:                                               ; preds = %8
  store i32 -1, ptr %2, align 4
  br label %18

18:                                               ; preds = %17, %16, %15, %7
  %19 = load i32, ptr %2, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_2_sum_until(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  br label %6

6:                                                ; preds = %1
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %16, %6
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp sle i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 5
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  store i32 %15, ptr %2, align 4
  br label %24

16:                                               ; preds = %11
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %4, align 4
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %7, !llvm.loop !8

22:                                               ; preds = %7
  %23 = load i32, ptr %4, align 4
  store i32 %23, ptr %2, align 4
  br label %24

24:                                               ; preds = %22, %14
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_3_find_first_divisible(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  br label %9

9:                                                ; preds = %3
  %10 = load i32, ptr %5, align 4
  store i32 %10, ptr %8, align 4
  br label %11

11:                                               ; preds = %23, %9
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %6, align 4
  %14 = icmp sle i32 %12, %13
  br i1 %14, label %15, label %26

15:                                               ; preds = %11
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %7, align 4
  %18 = srem i32 %16, %17
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %15
  %21 = load i32, ptr %8, align 4
  store i32 %21, ptr %4, align 4
  br label %27

22:                                               ; preds = %15
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr %8, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %8, align 4
  br label %11, !llvm.loop !10

26:                                               ; preds = %11
  store i32 -1, ptr %4, align 4
  br label %27

27:                                               ; preds = %26, %20
  %28 = load i32, ptr %4, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_4_calculate_score(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  br label %6

6:                                                ; preds = %1
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 -1, ptr %2, align 4
  br label %38

11:                                               ; preds = %7
  store i32 1, ptr %5, align 4
  br label %12

12:                                               ; preds = %33, %11
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %3, align 4
  %15 = icmp sle i32 %13, %14
  br i1 %15, label %16, label %36

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %16
  %21 = load i32, ptr %5, align 4
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %4, align 4
  br label %27

24:                                               ; preds = %16
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %4, align 4
  br label %27

27:                                               ; preds = %24, %20
  %28 = load i32, ptr %4, align 4
  %29 = icmp sgt i32 %28, 20
  br i1 %29, label %30, label %32

30:                                               ; preds = %27
  %31 = load i32, ptr %4, align 4
  store i32 %31, ptr %2, align 4
  br label %38

32:                                               ; preds = %27
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  br label %12, !llvm.loop !11

36:                                               ; preds = %12
  %37 = load i32, ptr %4, align 4
  store i32 %37, ptr %2, align 4
  br label %38

38:                                               ; preds = %36, %30, %10
  %39 = load i32, ptr %2, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_5_find_pair_in_grid(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  br label %10

10:                                               ; preds = %3
  store i32 0, ptr %8, align 4
  br label %11

11:                                               ; preds = %38, %10
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %41

15:                                               ; preds = %11
  store i32 0, ptr %9, align 4
  br label %16

16:                                               ; preds = %34, %15
  %17 = load i32, ptr %9, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %37

20:                                               ; preds = %16
  %21 = load i32, ptr %8, align 4
  %22 = load i32, ptr %6, align 4
  %23 = mul nsw i32 %21, %22
  %24 = load i32, ptr %9, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, ptr %7, align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %33

28:                                               ; preds = %20
  %29 = load i32, ptr %8, align 4
  %30 = mul nsw i32 %29, 100
  %31 = load i32, ptr %9, align 4
  %32 = add nsw i32 %30, %31
  store i32 %32, ptr %4, align 4
  br label %42

33:                                               ; preds = %20
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %9, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %9, align 4
  br label %16, !llvm.loop !12

37:                                               ; preds = %16
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %8, align 4
  br label %11, !llvm.loop !13

41:                                               ; preds = %11
  store i32 -1, ptr %4, align 4
  br label %42

42:                                               ; preds = %41, %28
  %43 = load i32, ptr %4, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_6_first_negative_do_while(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  br label %8

8:                                                ; preds = %2
  store i32 0, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  store i32 %9, ptr %7, align 4
  br label %10

10:                                               ; preds = %20, %8
  %11 = load i32, ptr %7, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = load i32, ptr %7, align 4
  store i32 %14, ptr %3, align 4
  br label %25

15:                                               ; preds = %10
  %16 = load i32, ptr %7, align 4
  %17 = sub nsw i32 %16, 3
  store i32 %17, ptr %7, align 4
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %6, align 4
  br label %20

20:                                               ; preds = %15
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %10, label %24, !llvm.loop !14

24:                                               ; preds = %20
  store i32 0, ptr %3, align 4
  br label %25

25:                                               ; preds = %24, %13
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_7_validate_and_print(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %3

3:                                                ; preds = %1
  %4 = load i32, ptr %2, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %11

8:                                                ; preds = %3
  %9 = load i32, ptr %2, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %9)
  br label %11

11:                                               ; preds = %8, %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

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
  br label %9

9:                                                ; preds = %0
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.numbers, i64 20, i1 false)
  store i32 5, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %10

10:                                               ; preds = %46, %9
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %49

14:                                               ; preds = %10
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  store i32 %18, ptr %5, align 4
  %19 = load i32, ptr %5, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %19)
  %21 = load i32, ptr %5, align 4
  %22 = call i32 @_0_absolute_value(i32 noundef %21)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %22)
  %24 = load i32, ptr %5, align 4
  %25 = call i32 @_1_classify_number(i32 noundef %24)
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %14
  %27 = load i32, ptr %6, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %26
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %45

31:                                               ; preds = %26
  %32 = load i32, ptr %6, align 4
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %36

34:                                               ; preds = %31
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %44

36:                                               ; preds = %31
  %37 = load i32, ptr %6, align 4
  %38 = icmp eq i32 %37, 2
  br i1 %38, label %39, label %41

39:                                               ; preds = %36
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %43

41:                                               ; preds = %36
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %43

43:                                               ; preds = %41, %39
  br label %44

44:                                               ; preds = %43, %34
  br label %45

45:                                               ; preds = %44, %29
  br label %46

46:                                               ; preds = %45
  %47 = load i32, ptr %4, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %4, align 4
  br label %10, !llvm.loop !15

49:                                               ; preds = %10
  %50 = call i32 @_2_sum_until(i32 noundef 10)
  store i32 %50, ptr %7, align 4
  %51 = load i32, ptr %7, align 4
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %51)
  %53 = call i32 @_3_find_first_divisible(i32 noundef 3, i32 noundef 20, i32 noundef 7)
  store i32 %53, ptr %8, align 4
  br label %54

54:                                               ; preds = %49
  %55 = load i32, ptr %8, align 4
  %56 = icmp ne i32 %55, -1
  br i1 %56, label %57, label %60

57:                                               ; preds = %54
  %58 = load i32, ptr %8, align 4
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %58)
  br label %62

60:                                               ; preds = %54
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %62

62:                                               ; preds = %60, %57
  %63 = call i32 @_4_calculate_score(i32 noundef 10)
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %63)
  %65 = call i32 @_5_find_pair_in_grid(i32 noundef 3, i32 noundef 3, i32 noundef 4)
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %65)
  %67 = call i32 @_5_find_pair_in_grid(i32 noundef 3, i32 noundef 3, i32 noundef 100)
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %67)
  %69 = call i32 @_6_first_negative_do_while(i32 noundef 5, i32 noundef 3)
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %69)
  %71 = call i32 @_6_first_negative_do_while(i32 noundef 100, i32 noundef 2)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %71)
  call void @_7_validate_and_print(i32 noundef -1)
  call void @_7_validate_and_print(i32 noundef 5)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
