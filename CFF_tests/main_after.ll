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
  %4 = alloca i32, align 4
  store i32 0, ptr %4, align 4
  br label %dispatcher

5:                                                ; preds = %swicth
  %6 = load i32, ptr %2, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %6)
  %8 = load i32, ptr %2, align 4
  store i32 %8, ptr %3, align 4
  br label %9

9:                                                ; preds = %5
  %10 = load i32, ptr %2, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %3, align 4
  store i32 1, ptr %4, align 4
  br label %16

16:                                               ; preds = %12, %9
  %17 = load i32, ptr %3, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %17)
  ret void

dispatcher:                                       ; preds = %1, %default
  br label %swicth

default:                                          ; preds = %swicth
  br label %dispatcher

swicth:                                           ; preds = %dispatcher
  %b = load i32, ptr %4, align 4
  switch i32 %b, label %default [
    i32 0, label %5
  ]
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifnested(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %4, align 4
  br label %dispatcher

5:                                                ; preds = %swicth
  %6 = load i32, ptr %2, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %6)
  %8 = load i32, ptr %2, align 4
  store i32 %8, ptr %3, align 4
  br label %9

9:                                                ; preds = %5
  %10 = load i32, ptr %2, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %37

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 10
  store i32 %15, ptr %3, align 4
  br label %16

16:                                               ; preds = %12
  %17 = load i32, ptr %2, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %16
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %22 = load i32, ptr %3, align 4
  %23 = mul nsw i32 %22, 3
  store i32 %23, ptr %3, align 4
  store i32 1, ptr %4, align 4
  br label %33

24:                                               ; preds = %16
  %25 = load i32, ptr %2, align 4
  %26 = srem i32 %25, 2
  store i32 %26, ptr %2, align 4
  br label %27

27:                                               ; preds = %24
  %28 = load i32, ptr %2, align 4
  %29 = icmp eq i32 %28, 3
  br i1 %29, label %30, label %32

30:                                               ; preds = %27
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 2, ptr %4, align 4
  br label %32

32:                                               ; preds = %30, %27
  store i32 3, ptr %4, align 4
  br label %33

33:                                               ; preds = %32, %20
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %3, align 4
  br label %37

37:                                               ; preds = %33, %9
  %38 = load i32, ptr %3, align 4
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %38)
  ret void

dispatcher:                                       ; preds = %1, %default
  br label %swicth

default:                                          ; preds = %swicth
  br label %dispatcher

swicth:                                           ; preds = %dispatcher
  %b = load i32, ptr %4, align 4
  switch i32 %b, label %default [
    i32 0, label %5
  ]
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
