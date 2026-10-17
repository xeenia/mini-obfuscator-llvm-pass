; ModuleID = 'merged.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, ptr, ptr }

@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_07_init, ptr null }]
@ops = internal global [2 x ptr] [ptr @_05_square, ptr @_06_triple], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_07_init() #0 {
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %5 = call i32 @_00_local_zero()
  %6 = load i32, ptr %2, align 4
  %7 = add nsw i32 %6, %5
  store i32 %7, ptr %2, align 4
  %8 = call i32 @_01_local_one(i32 noundef 5)
  %9 = load i32, ptr %2, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, ptr %2, align 4
  %11 = call i32 @_02_local_two(i32 noundef 1, i32 noundef 2)
  %12 = load i32, ptr %2, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, ptr %2, align 4
  %14 = call i32 @_03_local_three(i32 noundef 1, i32 noundef 2, i32 noundef 3)
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, %14
  store i32 %16, ptr %2, align 4
  %17 = call i32 @_00_public_add(i32 noundef 6, i32 noundef 7)
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %2, align 4
  %20 = call i32 @_01_public_mul(i32 noundef 4, i32 noundef 5)
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, ptr %2, align 4
  %23 = call i32 @_02_mixed(i32 noundef 2, double noundef 3.500000e+00, i64 noundef 4)
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %2, align 4
  %26 = call i32 @_03_callback(i32 noundef 3)
  %27 = load i32, ptr %2, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %2, align 4
  %29 = call i32 @_05_fact(i32 noundef 5)
  %30 = load i32, ptr %2, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, ptr %2, align 4
  store ptr @_04_local_cb, ptr %3, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = call i32 %32(i32 noundef 5)
  %34 = load i32, ptr %2, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %2, align 4
  store ptr @_03_callback, ptr %4, align 8
  %36 = load ptr, ptr %4, align 8
  %37 = call i32 %36(i32 noundef 3)
  %38 = load i32, ptr %2, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %2, align 4
  %40 = load ptr, ptr @ops, align 16
  %41 = call i32 %40(i32 noundef 4)
  %42 = load i32, ptr %2, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %2, align 4
  %44 = load ptr, ptr getelementptr inbounds ([2 x ptr], ptr @ops, i64 0, i64 1), align 8
  %45 = call i32 %44(i32 noundef 4)
  %46 = load i32, ptr %2, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %2, align 4
  %48 = call i32 (i32, ...) @_04_variadic_sum(i32 noundef 3, i32 noundef 4, i32 noundef 5, i32 noundef 6)
  %49 = load i32, ptr %2, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, ptr %2, align 4
  %51 = call i32 @abs(i32 noundef -9) #4
  %52 = load i32, ptr %2, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, ptr %2, align 4
  %54 = call i32 @_07_force_internal(i32 noundef 0)
  %55 = load i32, ptr %2, align 4
  %56 = add nsw i32 %55, %54
  store i32 %56, ptr %2, align 4
  %57 = load i32, ptr %2, align 4
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %57)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_00_local_zero() #0 {
  ret i32 17
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_01_local_one(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = mul nsw i32 %3, 3
  %5 = add nsw i32 %4, 1
  ret i32 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_02_local_two(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = mul nsw i32 %5, 100
  %7 = load i32, ptr %4, align 4
  %8 = add nsw i32 %6, %7
  ret i32 %8
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_03_local_three(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
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
define internal i32 @_04_local_cb(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = add nsw i32 %3, 10
  ret i32 %4
}

; Function Attrs: nounwind willreturn memory(none)
declare i32 @abs(i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_05_square(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = mul nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_06_triple(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = mul nsw i32 %3, 3
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_00_public_add(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = add nsw i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_01_public_mul(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = mul nsw i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_02_mixed(i32 noundef %0, double noundef %1, i64 noundef %2) #0 {
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
define dso_local i32 @_03_callback(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = mul nsw i32 %3, 7
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_05_fact(i32 noundef %0) #0 {
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

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_04_variadic_sum(i32 noundef %0, ...) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  call void @llvm.va_start(ptr %6)
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %30, %1
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %33

11:                                               ; preds = %7
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  %13 = getelementptr inbounds %struct.__va_list_tag, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 16
  %15 = icmp ule i32 %14, 40
  br i1 %15, label %16, label %21

16:                                               ; preds = %11
  %17 = getelementptr inbounds %struct.__va_list_tag, ptr %12, i32 0, i32 3
  %18 = load ptr, ptr %17, align 16
  %19 = getelementptr i8, ptr %18, i32 %14
  %20 = add i32 %14, 8
  store i32 %20, ptr %13, align 16
  br label %25

21:                                               ; preds = %11
  %22 = getelementptr inbounds %struct.__va_list_tag, ptr %12, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr i8, ptr %23, i32 8
  store ptr %24, ptr %22, align 8
  br label %25

25:                                               ; preds = %21, %16
  %26 = phi ptr [ %19, %16 ], [ %23, %21 ]
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %4, align 4
  br label %30

30:                                               ; preds = %25
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  br label %7, !llvm.loop !8

33:                                               ; preds = %7
  %34 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  call void @llvm.va_end(ptr %34)
  %35 = load i32, ptr %4, align 4
  ret i32 %35
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_07_force_internal(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 @_06_internal_helper(i32 noundef %3)
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_06_internal_helper(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = add nsw i32 %3, 100
  ret i32 %4
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { nounwind willreturn memory(none) }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
