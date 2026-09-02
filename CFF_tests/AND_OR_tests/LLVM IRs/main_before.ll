; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"_0_ifelseAND: both positive\0A\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"_0_ifelseAND: not both positive\0A\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"_1_ifelseOR: at least one positive\0A\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"_1_ifelseOR: neither positive\0A\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"_2_ternaryMIX: sum_or_diff=%d flag=%d\0A\00", align 1
@.str.5 = private unnamed_addr constant [33 x i8] c"_3_whileAND: looping, a=%d b=%d\0A\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"_3_whileAND: loop exited\0A\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c"_4_forOR: i=%d\0A\00", align 1
@.str.8 = private unnamed_addr constant [48 x i8] c"_5_manyblocksAND: base=%d half=%d threshold=%d\0A\00", align 1
@.str.9 = private unnamed_addr constant [47 x i8] c"_5_manyblocksAND: i=%d doubled=%d < threshold\0A\00", align 1
@.str.10 = private unnamed_addr constant [51 x i8] c"_5_manyblocksAND: i=%d doubled=%d NOT < threshold\0A\00", align 1
@.str.11 = private unnamed_addr constant [26 x i8] c"_2_ternaryMIX: result=%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_0_ifelseAND(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %14

12:                                               ; preds = %7, %2
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %14

14:                                               ; preds = %12, %10
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifelseOR(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %7, %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %14

12:                                               ; preds = %7
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %14

14:                                               ; preds = %12, %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_2_ternaryMIX(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %13, %14
  br label %20

16:                                               ; preds = %9, %2
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %17, %18
  br label %20

20:                                               ; preds = %16, %12
  %21 = phi i32 [ %15, %12 ], [ %19, %16 ]
  store i32 %21, ptr %5, align 4
  %22 = load i32, ptr %3, align 4
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %27, label %24

24:                                               ; preds = %20
  %25 = load i32, ptr %4, align 4
  %26 = icmp slt i32 %25, 0
  br label %27

27:                                               ; preds = %24, %20
  %28 = phi i1 [ true, %20 ], [ %26, %24 ]
  %29 = zext i1 %28 to i64
  %30 = select i1 %28, i32 -1, i32 1
  store i32 %30, ptr %6, align 4
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %6, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %31, i32 noundef %32)
  %34 = load i32, ptr %5, align 4
  %35 = load i32, ptr %6, align 4
  %36 = mul nsw i32 %34, %35
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_whileAND(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %5

5:                                                ; preds = %13, %2
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %5
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br label %11

11:                                               ; preds = %8, %5
  %12 = phi i1 [ false, %5 ], [ %10, %8 ]
  br i1 %12, label %13, label %21

13:                                               ; preds = %11
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %14, i32 noundef %15)
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, -1
  store i32 %20, ptr %4, align 4
  br label %5, !llvm.loop !6

21:                                               ; preds = %11
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_4_forOR(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %20, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %11, label %7

7:                                                ; preds = %4
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br label %11

11:                                               ; preds = %7, %4
  %12 = phi i1 [ true, %4 ], [ %10, %7 ]
  br i1 %12, label %13, label %23

13:                                               ; preds = %11
  %14 = load i32, ptr %3, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %14)
  %16 = load i32, ptr %3, align 4
  %17 = icmp sgt i32 %16, 20
  br i1 %17, label %18, label %19

18:                                               ; preds = %13
  br label %23

19:                                               ; preds = %13
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  br label %4, !llvm.loop !8

23:                                               ; preds = %18, %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_5_manyblocksAND(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %5, align 4
  %13 = load i32, ptr %5, align 4
  %14 = sdiv i32 %13, 2
  store i32 %14, ptr %6, align 4
  %15 = load i32, ptr %6, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %2
  %18 = load i32, ptr %6, align 4
  br label %20

19:                                               ; preds = %2
  br label %20

20:                                               ; preds = %19, %17
  %21 = phi i32 [ %18, %17 ], [ 1, %19 ]
  store i32 %21, ptr %7, align 4
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %7, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %22, i32 noundef %23, i32 noundef %24)
  store i32 0, ptr %8, align 4
  br label %26

26:                                               ; preds = %48, %20
  %27 = load i32, ptr %8, align 4
  %28 = load i32, ptr %3, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %51

30:                                               ; preds = %26
  %31 = load i32, ptr %8, align 4
  %32 = mul nsw i32 %31, 2
  store i32 %32, ptr %9, align 4
  %33 = load i32, ptr %9, align 4
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %43

35:                                               ; preds = %30
  %36 = load i32, ptr %9, align 4
  %37 = load i32, ptr %7, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %43

39:                                               ; preds = %35
  %40 = load i32, ptr %8, align 4
  %41 = load i32, ptr %9, align 4
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %40, i32 noundef %41)
  br label %47

43:                                               ; preds = %35, %30
  %44 = load i32, ptr %8, align 4
  %45 = load i32, ptr %9, align 4
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %44, i32 noundef %45)
  br label %47

47:                                               ; preds = %43, %39
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %8, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %8, align 4
  br label %26, !llvm.loop !9

51:                                               ; preds = %26
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @_0_ifelseAND(i32 noundef 1, i32 noundef 2)
  call void @_0_ifelseAND(i32 noundef -1, i32 noundef 2)
  call void @_1_ifelseOR(i32 noundef -1, i32 noundef 2)
  call void @_1_ifelseOR(i32 noundef -1, i32 noundef -2)
  %2 = call i32 @_2_ternaryMIX(i32 noundef 3, i32 noundef 4)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %2)
  %4 = call i32 @_2_ternaryMIX(i32 noundef -3, i32 noundef 4)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %4)
  call void @_3_whileAND(i32 noundef 3, i32 noundef 2)
  call void @_4_forOR(i32 noundef 1)
  call void @_5_manyblocksAND(i32 noundef 8, i32 noundef 2)
  ret i32 0
}

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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
