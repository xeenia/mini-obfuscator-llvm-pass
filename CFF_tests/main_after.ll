; ModuleID = 'main.bc'
source_filename = "/home/xenia/Projects/mini-obfuscator-llvm-pass/CFF_tests/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"start: x = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"condition true\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"end: y = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"outer true\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"inner true (even)\0A\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"after inner if\0A\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"_1_ifalone before:\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifalone(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %1
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5)
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %3, align 4
  br label %8

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %13 = load i32, ptr %3, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %3, align 4
  br label %15

15:                                               ; preds = %11, %8
  %16 = load i32, ptr %3, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %16)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifnested(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %4

4:                                                ; preds = %1
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5)
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %3, align 4
  br label %8

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %36

11:                                               ; preds = %8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 10
  store i32 %14, ptr %3, align 4
  br label %15

15:                                               ; preds = %11
  %16 = load i32, ptr %2, align 4
  %17 = srem i32 %16, 2
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

19:                                               ; preds = %15
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %21 = load i32, ptr %3, align 4
  %22 = mul nsw i32 %21, 3
  store i32 %22, ptr %3, align 4
  br label %32

23:                                               ; preds = %15
  %24 = load i32, ptr %2, align 4
  %25 = srem i32 %24, 2
  store i32 %25, ptr %2, align 4
  br label %26

26:                                               ; preds = %23
  %27 = load i32, ptr %2, align 4
  %28 = icmp eq i32 %27, 3
  br i1 %28, label %29, label %31

29:                                               ; preds = %26
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %31

31:                                               ; preds = %29, %26
  br label %32

32:                                               ; preds = %31, %19
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %34 = load i32, ptr %3, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %3, align 4
  br label %36

36:                                               ; preds = %32, %8
  %37 = load i32, ptr %3, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %37)
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
  %19 = load i32, ptr %6, align 4
  call void @_1_ifalone(i32 noundef %19)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %21 = load i32, ptr %6, align 4
  call void @_3_ifnested(i32 noundef %21)
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
