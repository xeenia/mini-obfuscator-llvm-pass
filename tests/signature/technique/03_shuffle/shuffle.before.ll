; ModuleID = 'shuffle.c'
source_filename = "shuffle.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %4 = call i32 @_00_two(i32 noundef 2, i32 noundef 7)
  %5 = load i32, ptr %2, align 4
  %6 = add nsw i32 %5, %4
  store i32 %6, ptr %2, align 4
  %7 = call i32 @_01_three(i32 noundef 1, i32 noundef 2, i32 noundef 3)
  %8 = load i32, ptr %2, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, ptr %2, align 4
  %10 = call i32 @_02_four(i32 noundef 1, i32 noundef 2, i32 noundef 3, i32 noundef 4)
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr %2, align 4
  %13 = call i32 @_03_mixed(i32 noundef 2, double noundef 3.500000e+00, i64 noundef 4)
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, ptr %2, align 4
  store ptr @_04_cb, ptr %3, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = call i32 %16(i32 noundef 3)
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %2, align 4
  %20 = call i32 @_04_cb(i32 noundef 3)
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %2, align 4
  %23 = call i32 @_05_fact(i32 noundef 19)
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %2, align 4
  %26 = load i32, ptr %2, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %26)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_00_two(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = mul nsw i32 %5, 100
  %7 = load i32, ptr %4, align 4
  %8 = mul nsw i32 %7, 10
  %9 = add nsw i32 %6, %8
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_01_three(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = mul nsw i32 %7, 100
  %9 = load i32, ptr %5, align 4
  %10 = mul nsw i32 %9, 10
  %11 = add nsw i32 %8, %10
  %12 = load i32, ptr %6, align 4
  %13 = add nsw i32 %11, %12
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_02_four(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %9 = load i32, ptr %5, align 4
  %10 = mul nsw i32 %9, 1000
  %11 = load i32, ptr %6, align 4
  %12 = mul nsw i32 %11, 100
  %13 = add nsw i32 %10, %12
  %14 = load i32, ptr %7, align 4
  %15 = mul nsw i32 %14, 10
  %16 = add nsw i32 %13, %15
  %17 = load i32, ptr %8, align 4
  %18 = add nsw i32 %16, %17
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_03_mixed(i32 noundef %0, double noundef %1, i64 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca i64, align 8
  store i32 %0, ptr %4, align 4
  store double %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load i32, ptr %4, align 4
  %8 = mul nsw i32 %7, 100
  %9 = load double, ptr %5, align 8
  %10 = fmul double %9, 1.000000e+01
  %11 = fptosi double %10 to i32
  %12 = add nsw i32 %8, %11
  %13 = load i64, ptr %6, align 8
  %14 = trunc i64 %13 to i32
  %15 = add nsw i32 %12, %14
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_04_cb(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = mul nsw i32 %3, 7
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_05_fact(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sle i32 %4, 1
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %13

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = sub nsw i32 %9, 1
  %11 = call i32 @_05_fact(i32 noundef %10)
  %12 = mul nsw i32 %8, %11
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %7, %6
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
