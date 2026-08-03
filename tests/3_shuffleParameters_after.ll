; ModuleID = 'merged.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, ptr, ptr }

@g_ops = dso_local global [2 x ptr] [ptr @square, ptr @triple], align 16
@.str = private unnamed_addr constant [41 x i8] c"multiply(6, 7)      -> %d   (expect 42)\0A\00", align 1
@.str.1 = private unnamed_addr constant [64 x i8] c"pack_color(...)     -> %d   (expect -1430532899 as signed int)\0A\00", align 1
@.str.2 = private unnamed_addr constant [43 x i8] c"build_record(...)   -> %ld  (expect 1207)\0A\00", align 1
@.str.3 = private unnamed_addr constant [41 x i8] c"negate(9)           -> %d   (expect -9)\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"constant_answer()   -> %d   (expect 42)\0A\00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"factorial(5)        -> %d   (expect 120)\0A\00", align 1
@.str.6 = private unnamed_addr constant [60 x i8] c"sum_all(3,1,2,3)    -> %d   (expect 6, vararg is excluded)\0A\00", align 1
@.str.7 = private unnamed_addr constant [31 x i8] c"sub(5,3)   -> %d   (expect 2)\0A\00", align 1
@.str.8 = private unnamed_addr constant [32 x i8] c"sub(3,5)   -> %d   (expect -2)\0A\00", align 1
@.str.9 = private unnamed_addr constant [41 x i8] c"square via fp(4)    -> %d   (expect 16)\0A\00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"triple via table(4) -> %d   (expect 12)\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @square(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = mul nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @triple(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = mul nsw i32 %3, 3
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sum_all(i32 noundef %0, ...) #0 {
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
declare void @llvm.va_start(ptr) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sub(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = sub nsw i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call i32 @multiply(i32 7, i32 6)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3)
  %5 = call i32 @pack_color(i32 221, i32 204, i32 170, i32 187)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %5)
  %7 = call i64 @build_record(i32 7, i8 65, i64 1000, double 1.500000e+00)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i64 noundef %7)
  %9 = call i32 @negate(i32 noundef 9)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %9)
  %11 = call i32 @constant_answer()
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %11)
  %13 = call i32 @factorial(i32 noundef 5)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %13)
  %15 = call i32 (i32, ...) @sum_all(i32 noundef 3, i32 noundef 1, i32 noundef 2, i32 noundef 3)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %15)
  %17 = call i32 @sub(i32 3, i32 5)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %17)
  %19 = call i32 @sub(i32 5, i32 3)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %19)
  store ptr @square, ptr %2, align 8
  %21 = load ptr, ptr %2, align 8
  %22 = call i32 %21(i32 noundef 4)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %22)
  %24 = load ptr, ptr getelementptr inbounds ([2 x ptr], ptr @g_ops, i64 0, i64 1), align 8
  %25 = call i32 %24(i32 noundef 4)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %25)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @multiply(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = mul nsw i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @pack_color(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %2, ptr %5, align 4
  store i32 %3, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %0, ptr %8, align 4
  %9 = load i32, ptr %5, align 4
  %10 = shl i32 %9, 24
  %11 = load i32, ptr %6, align 4
  %12 = shl i32 %11, 16
  %13 = or i32 %10, %12
  %14 = load i32, ptr %7, align 4
  %15 = shl i32 %14, 8
  %16 = or i32 %13, %15
  %17 = load i32, ptr %8, align 4
  %18 = or i32 %16, %17
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @build_record(i32 noundef %0, i8 noundef signext %1, i64 noundef %2, double noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i8, align 1
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store i32 %0, ptr %5, align 4
  store double %3, ptr %6, align 8
  store i8 %1, ptr %7, align 1
  store i64 %2, ptr %8, align 8
  %10 = load double, ptr %6, align 8
  %11 = fmul double %10, 1.000000e+02
  %12 = fptosi double %11 to i64
  store i64 %12, ptr %9, align 8
  %13 = load i8, ptr %7, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %14, 65
  br i1 %15, label %16, label %19

16:                                               ; preds = %4
  %17 = load i64, ptr %9, align 8
  %18 = add nsw i64 %17, 50
  store i64 %18, ptr %9, align 8
  br label %19

19:                                               ; preds = %16, %4
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = load i64, ptr %9, align 8
  %23 = add nsw i64 %21, %22
  %24 = load i64, ptr %8, align 8
  %25 = add nsw i64 %23, %24
  ret i64 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @negate(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = sub nsw i32 0, %3
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @constant_answer() #0 {
  ret i32 42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @factorial(i32 noundef %0) #0 {
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
  %11 = call i32 @factorial(i32 noundef %10)
  %12 = mul nsw i32 %8, %11
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %7, %6
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
