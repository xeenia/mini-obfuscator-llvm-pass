; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalvar = dso_local global i32 10, align 4
@.str = private unnamed_addr constant [35 x i8] c"_1_loop_with_if_inside: c=%d even\0A\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"_1_loop_with_if_inside: c=%d odd\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"_2_if_with_loop_in_both_branches: a>b, c=%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [46 x i8] c"_2_if_with_loop_in_both_branches: a<=b, c=%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [42 x i8] c"_3_nested_loop_if_loop: c=%d, inner d=%d\0A\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"_3_nested_loop_if_loop: c=%d, no inner loop\0A\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"_4_manyblocks_loop: c=%d even and diff>0\0A\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"_4_manyblocks_loop: c=%d other\0A\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"_5_ternary_loop: c=%d label=%d\0A\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"--- _1 normal ---\0A\00", align 1
@.str.11 = private unnamed_addr constant [29 x i8] c"--- _1 CFF (high-level) ---\0A\00", align 1
@.str.12 = private unnamed_addr constant [27 x i8] c"--- _2 call 1 (a > b) ---\0A\00", align 1
@.str.13 = private unnamed_addr constant [28 x i8] c"--- _2 call 2 (a <= b) ---\0A\00", align 1
@.str.14 = private unnamed_addr constant [31 x i8] c"--- _3 call 1 (only path) ---\0A\00", align 1
@.str.15 = private unnamed_addr constant [19 x i8] c"--- _4 call 1 ---\0A\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"--- _5 call 1 ---\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_loop_with_if_inside(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %20, %2
  %7 = load i32, ptr %5, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %23

9:                                                ; preds = %6
  %10 = load i32, ptr %5, align 4
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %5, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %14)
  br label %19

16:                                               ; preds = %9
  %17 = load i32, ptr %5, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %17)
  br label %19

19:                                               ; preds = %16, %13
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %5, align 4
  br label %6, !llvm.loop !6

23:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_2_if_with_loop_in_both_branches(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %7, %8
  br i1 %9, label %10, label %21

10:                                               ; preds = %2
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %17, %10
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %12, 3
  br i1 %13, label %14, label %20

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %15)
  br label %17

17:                                               ; preds = %14
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  br label %11, !llvm.loop !8

20:                                               ; preds = %11
  br label %31

21:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  br label %22

22:                                               ; preds = %25, %21
  %23 = load i32, ptr %6, align 4
  %24 = icmp slt i32 %23, 3
  br i1 %24, label %25, label %30

25:                                               ; preds = %22
  %26 = load i32, ptr %6, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %26)
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %22, !llvm.loop !9

30:                                               ; preds = %22
  br label %31

31:                                               ; preds = %30, %20
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_nested_loop_if_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %29, %2
  %8 = load i32, ptr %5, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %32

10:                                               ; preds = %7
  %11 = load i32, ptr %5, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %13, label %25

13:                                               ; preds = %10
  store i32 0, ptr %6, align 4
  br label %14

14:                                               ; preds = %21, %13
  %15 = load i32, ptr %6, align 4
  %16 = icmp slt i32 %15, 2
  br i1 %16, label %17, label %24

17:                                               ; preds = %14
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %6, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %18, i32 noundef %19)
  br label %21

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %6, align 4
  br label %14, !llvm.loop !10

24:                                               ; preds = %14
  br label %28

25:                                               ; preds = %10
  %26 = load i32, ptr %5, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %26)
  br label %28

28:                                               ; preds = %25, %24
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %5, align 4
  br label %7, !llvm.loop !11

32:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_4_manyblocks_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %4, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %5, align 4
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 %12, %13
  store i32 %14, ptr %6, align 4
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %2
  %18 = load i32, ptr %5, align 4
  store i32 %18, ptr %7, align 4
  br label %20

19:                                               ; preds = %2
  store i32 5, ptr %7, align 4
  br label %20

20:                                               ; preds = %19, %17
  %21 = load i32, ptr %7, align 4
  %22 = icmp sgt i32 %21, 10
  br i1 %22, label %23, label %24

23:                                               ; preds = %20
  store i32 10, ptr %7, align 4
  br label %24

24:                                               ; preds = %23, %20
  store i32 0, ptr %8, align 4
  br label %25

25:                                               ; preds = %43, %24
  %26 = load i32, ptr %8, align 4
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %46

29:                                               ; preds = %25
  %30 = load i32, ptr %8, align 4
  %31 = srem i32 %30, 2
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %39

33:                                               ; preds = %29
  %34 = load i32, ptr %6, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %39

36:                                               ; preds = %33
  %37 = load i32, ptr %8, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %37)
  br label %42

39:                                               ; preds = %33, %29
  %40 = load i32, ptr %8, align 4
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %40)
  br label %42

42:                                               ; preds = %39, %36
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %8, align 4
  br label %25, !llvm.loop !12

46:                                               ; preds = %25
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_5_ternary_loop(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %34, %2
  %8 = load i32, ptr %5, align 4
  %9 = icmp slt i32 %8, 4
  br i1 %9, label %10, label %37

10:                                               ; preds = %7
  %11 = load i32, ptr %5, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %10
  %15 = load i32, ptr %3, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  br label %29

18:                                               ; preds = %14, %10
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp sgt i32 %19, %20
  br i1 %21, label %25, label %22

22:                                               ; preds = %18
  %23 = load i32, ptr %3, align 4
  %24 = icmp slt i32 %23, 0
  br label %25

25:                                               ; preds = %22, %18
  %26 = phi i1 [ true, %18 ], [ %24, %22 ]
  %27 = zext i1 %26 to i64
  %28 = select i1 %26, i32 2, i32 3
  br label %29

29:                                               ; preds = %25, %17
  %30 = phi i32 [ 1, %17 ], [ %28, %25 ]
  store i32 %30, ptr %6, align 4
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %6, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %31, i32 noundef %32)
  br label %34

34:                                               ; preds = %29
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %5, align 4
  br label %7, !llvm.loop !13

37:                                               ; preds = %7
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
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %7)
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
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  call void @_1_loop_with_if_inside(i32 noundef 0, i32 noundef 0)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @_2_if_with_loop_in_both_branches(i32 noundef 5, i32 noundef 2)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  call void @_2_if_with_loop_in_both_branches(i32 noundef 2, i32 noundef 5)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  call void @_3_nested_loop_if_loop(i32 noundef 0, i32 noundef 0)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @_4_manyblocks_loop(i32 noundef 3, i32 noundef 2)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  call void @_5_ternary_loop(i32 noundef 3, i32 noundef 2)
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
