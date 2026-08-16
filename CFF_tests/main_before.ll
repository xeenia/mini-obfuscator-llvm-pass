; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"condition true\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"start: x = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"outer true\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"inner true (even)\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"after inner if\0A\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"end: y = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"_1_ifalone before:\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifalone(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %8 = load i32, ptr %3, align 4
  %9 = mul nsw i32 %8, 2
  store i32 %9, ptr %3, align 4
  br label %10

10:                                               ; preds = %6, %1
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %15 = load i32, ptr %3, align 4
  %16 = mul nsw i32 %15, 5
  store i32 %16, ptr %3, align 4
  br label %17

17:                                               ; preds = %13, %10
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifnested(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %4)
  %6 = load i32, ptr %2, align 4
  store i32 %6, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %30

9:                                                ; preds = %1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 10
  store i32 %12, ptr %3, align 4
  %13 = load i32, ptr %2, align 4
  %14 = srem i32 %13, 2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %20

16:                                               ; preds = %9
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %18 = load i32, ptr %3, align 4
  %19 = mul nsw i32 %18, 3
  store i32 %19, ptr %3, align 4
  br label %26

20:                                               ; preds = %9
  %21 = load i32, ptr %2, align 4
  %22 = icmp eq i32 %21, 3
  br i1 %22, label %23, label %25

23:                                               ; preds = %20
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %25

25:                                               ; preds = %23, %20
  br label %26

26:                                               ; preds = %25, %16
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %3, align 4
  br label %30

30:                                               ; preds = %26, %1
  %31 = load i32, ptr %3, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %31)
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

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
