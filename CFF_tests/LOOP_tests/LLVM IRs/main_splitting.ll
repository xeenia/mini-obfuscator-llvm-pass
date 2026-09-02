; ModuleID = 'main.bc'
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
  br label %6

6:                                                ; preds = %2
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %21, %6
  %8 = load i32, ptr %5, align 4
  %9 = icmp slt i32 %8, 5
  br i1 %9, label %10, label %24

10:                                               ; preds = %7
  %11 = load i32, ptr %5, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %10
  %15 = load i32, ptr %5, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15)
  br label %20

17:                                               ; preds = %10
  %18 = load i32, ptr %5, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %18)
  br label %20

20:                                               ; preds = %17, %14
  br label %21

21:                                               ; preds = %20
  %22 = load i32, ptr %5, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %5, align 4
  br label %7, !llvm.loop !8

24:                                               ; preds = %7
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
  br label %7

7:                                                ; preds = %2
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %18, %11
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %21

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %16)
  br label %18

18:                                               ; preds = %15
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %12, !llvm.loop !10

21:                                               ; preds = %12
  br label %32

22:                                               ; preds = %7
  store i32 0, ptr %6, align 4
  br label %23

23:                                               ; preds = %26, %22
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %24, 3
  br i1 %25, label %26, label %31

26:                                               ; preds = %23
  %27 = load i32, ptr %6, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %27)
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  br label %23, !llvm.loop !11

31:                                               ; preds = %23
  br label %32

32:                                               ; preds = %31, %21
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
  br label %7

7:                                                ; preds = %2
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %30, %7
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %33

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 1
  br i1 %13, label %14, label %26

14:                                               ; preds = %11
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %22, %14
  %16 = load i32, ptr %6, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %18, label %25

18:                                               ; preds = %15
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %6, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %19, i32 noundef %20)
  br label %22

22:                                               ; preds = %18
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %6, align 4
  br label %15, !llvm.loop !12

25:                                               ; preds = %15
  br label %29

26:                                               ; preds = %11
  %27 = load i32, ptr %5, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %27)
  br label %29

29:                                               ; preds = %26, %25
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  br label %8, !llvm.loop !13

33:                                               ; preds = %8
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
  br label %9

9:                                                ; preds = %2
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %5, align 4
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %13, %14
  store i32 %15, ptr %6, align 4
  br label %16

16:                                               ; preds = %9
  %17 = load i32, ptr %5, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = load i32, ptr %5, align 4
  store i32 %20, ptr %7, align 4
  br label %22

21:                                               ; preds = %16
  store i32 5, ptr %7, align 4
  br label %22

22:                                               ; preds = %21, %19
  %23 = load i32, ptr %7, align 4
  %24 = icmp sgt i32 %23, 10
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  store i32 10, ptr %7, align 4
  br label %26

26:                                               ; preds = %25, %22
  store i32 0, ptr %8, align 4
  br label %27

27:                                               ; preds = %45, %26
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %7, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %48

31:                                               ; preds = %27
  %32 = load i32, ptr %8, align 4
  %33 = srem i32 %32, 2
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %41

35:                                               ; preds = %31
  %36 = load i32, ptr %6, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %35
  %39 = load i32, ptr %8, align 4
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %39)
  br label %44

41:                                               ; preds = %35, %31
  %42 = load i32, ptr %8, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %42)
  br label %44

44:                                               ; preds = %41, %38
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %8, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %8, align 4
  br label %27, !llvm.loop !14

48:                                               ; preds = %27
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
  %.reg2mem = alloca i1, align 1
  %.reg2mem1 = alloca i32, align 4
  br label %7

7:                                                ; preds = %2
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %33, %7
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 4
  br i1 %10, label %11, label %36

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = srem i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  store i32 1, ptr %.reg2mem1, align 4
  br label %29

19:                                               ; preds = %15, %11
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %4, align 4
  %22 = icmp sgt i32 %20, %21
  store i1 true, ptr %.reg2mem, align 1
  br i1 %22, label %26, label %23

23:                                               ; preds = %19
  %24 = load i32, ptr %3, align 4
  %25 = icmp slt i32 %24, 0
  store i1 %25, ptr %.reg2mem, align 1
  br label %26

26:                                               ; preds = %23, %19
  %.reload = load i1, ptr %.reg2mem, align 1
  %27 = zext i1 %.reload to i64
  %28 = select i1 %.reload, i32 2, i32 3
  store i32 %28, ptr %.reg2mem1, align 4
  br label %29

29:                                               ; preds = %26, %18
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %6, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %30, i32 noundef %31)
  br label %33

33:                                               ; preds = %29
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  br label %8, !llvm.loop !15

36:                                               ; preds = %8
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
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %8)
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
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  call void @_1_loop_with_if_inside(i32 noundef 0, i32 noundef 0)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @_2_if_with_loop_in_both_branches(i32 noundef 5, i32 noundef 2)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  call void @_2_if_with_loop_in_both_branches(i32 noundef 2, i32 noundef 5)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  call void @_3_nested_loop_if_loop(i32 noundef 0, i32 noundef 0)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @_4_manyblocks_loop(i32 noundef 3, i32 noundef 2)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  call void @_5_ternary_loop(i32 noundef 3, i32 noundef 2)
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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
