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
@.str.6 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"--- _1 normal ---\0A\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"--- _1 CFF (high-level) ---\0A\00", align 1
@.str.9 = private unnamed_addr constant [27 x i8] c"--- _2 call 1 (a > b) ---\0A\00", align 1
@.str.10 = private unnamed_addr constant [28 x i8] c"--- _2 call 2 (a <= b) ---\0A\00", align 1
@.str.11 = private unnamed_addr constant [31 x i8] c"--- _3 call 1 (only path) ---\0A\00", align 1

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
define dso_local void @_1_CFF_loop_with_if_inside(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %2, %32
  %8 = load i32, ptr %5, align 4
  switch i32 %8, label %31 [
    i32 0, label %9
    i32 1, label %15
    i32 2, label %22
    i32 3, label %25
    i32 4, label %28
  ]

9:                                                ; preds = %7
  %10 = load i32, ptr %6, align 4
  %11 = icmp slt i32 %10, 5
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  store i32 1, ptr %5, align 4
  br label %14

13:                                               ; preds = %9
  store i32 5, ptr %5, align 4
  br label %14

14:                                               ; preds = %13, %12
  br label %32

15:                                               ; preds = %7
  %16 = load i32, ptr %6, align 4
  %17 = srem i32 %16, 2
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %15
  store i32 2, ptr %5, align 4
  br label %21

20:                                               ; preds = %15
  store i32 3, ptr %5, align 4
  br label %21

21:                                               ; preds = %20, %19
  br label %32

22:                                               ; preds = %7
  %23 = load i32, ptr %6, align 4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %23)
  store i32 4, ptr %5, align 4
  br label %32

25:                                               ; preds = %7
  %26 = load i32, ptr %6, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %26)
  store i32 4, ptr %5, align 4
  br label %32

28:                                               ; preds = %7
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %32

31:                                               ; preds = %7
  ret void

32:                                               ; preds = %28, %25, %22, %21, %14
  br label %7
}

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
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %7)
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
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  call void @_1_loop_with_if_inside(i32 noundef 0, i32 noundef 0)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  call void @_1_CFF_loop_with_if_inside(i32 noundef 0, i32 noundef 0)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  call void @_2_if_with_loop_in_both_branches(i32 noundef 5, i32 noundef 2)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  call void @_2_if_with_loop_in_both_branches(i32 noundef 2, i32 noundef 5)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  call void @_3_nested_loop_if_loop(i32 noundef 0, i32 noundef 0)
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
