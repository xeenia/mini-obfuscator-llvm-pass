; ModuleID = 'main.bc'
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
  br label %5

5:                                                ; preds = %2
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %13

8:                                                ; preds = %5
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %15

13:                                               ; preds = %8, %5
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %15

15:                                               ; preds = %13, %11
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifelseOR(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  br label %5

5:                                                ; preds = %2
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %11, label %8

8:                                                ; preds = %5
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %8, %5
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %15

13:                                               ; preds = %8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %15

15:                                               ; preds = %13, %11
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
  %.reg2mem = alloca i32, align 4
  %.reg2mem1 = alloca i1, align 1
  br label %7

7:                                                ; preds = %2
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %17

10:                                               ; preds = %7
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %.reg2mem, align 4
  br label %21

17:                                               ; preds = %10, %7
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %18, %19
  store i32 %20, ptr %.reg2mem, align 4
  br label %21

21:                                               ; preds = %13, %17
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %3, align 4
  %24 = icmp slt i32 %23, 0
  store i1 true, ptr %.reg2mem1, align 1
  br i1 %24, label %28, label %25

25:                                               ; preds = %22
  %26 = load i32, ptr %4, align 4
  %27 = icmp slt i32 %26, 0
  store i1 %27, ptr %.reg2mem1, align 1
  br label %28

28:                                               ; preds = %25, %22
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %29 = zext i1 %.reload2 to i64
  %30 = select i1 %.reload2, i32 -1, i32 1
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
  %.reg2mem = alloca i1, align 1
  br label %5

5:                                                ; preds = %2
  br label %6

6:                                                ; preds = %13, %5
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  store i1 false, ptr %.reg2mem, align 1
  br i1 %8, label %9, label %12

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  store i1 %11, ptr %.reg2mem, align 1
  br label %12

12:                                               ; preds = %9, %6
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %13, label %21

13:                                               ; preds = %12
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %14, i32 noundef %15)
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, -1
  store i32 %20, ptr %4, align 4
  br label %6, !llvm.loop !8

21:                                               ; preds = %12
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_4_forOR(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %.reg2mem = alloca i1, align 1
  br label %4

4:                                                ; preds = %1
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %21, %4
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 3
  store i1 true, ptr %.reg2mem, align 1
  br i1 %7, label %12, label %8

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %9, %10
  store i1 %11, ptr %.reg2mem, align 1
  br label %12

12:                                               ; preds = %8, %5
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %13, label %24

13:                                               ; preds = %12
  %14 = load i32, ptr %3, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %14)
  br label %16

16:                                               ; preds = %13
  %17 = load i32, ptr %3, align 4
  %18 = icmp sgt i32 %17, 20
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %24

20:                                               ; preds = %16
  br label %21

21:                                               ; preds = %20
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %3, align 4
  br label %5, !llvm.loop !10

24:                                               ; preds = %19, %12
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
  %.reg2mem = alloca i32, align 4
  br label %10

10:                                               ; preds = %2
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %5, align 4
  %14 = load i32, ptr %5, align 4
  %15 = sdiv i32 %14, 2
  store i32 %15, ptr %6, align 4
  br label %16

16:                                               ; preds = %10
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = load i32, ptr %6, align 4
  store i32 %20, ptr %.reg2mem, align 4
  br label %22

21:                                               ; preds = %16
  store i32 1, ptr %.reg2mem, align 4
  br label %22

22:                                               ; preds = %21, %19
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %7, align 4
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %7, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %23, i32 noundef %24, i32 noundef %25)
  store i32 0, ptr %8, align 4
  br label %27

27:                                               ; preds = %50, %22
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %3, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %53

31:                                               ; preds = %27
  %32 = load i32, ptr %8, align 4
  %33 = mul nsw i32 %32, 2
  store i32 %33, ptr %9, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %9, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %45

37:                                               ; preds = %34
  %38 = load i32, ptr %9, align 4
  %39 = load i32, ptr %7, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %45

41:                                               ; preds = %37
  %42 = load i32, ptr %8, align 4
  %43 = load i32, ptr %9, align 4
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %42, i32 noundef %43)
  br label %49

45:                                               ; preds = %37, %34
  %46 = load i32, ptr %8, align 4
  %47 = load i32, ptr %9, align 4
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %46, i32 noundef %47)
  br label %49

49:                                               ; preds = %45, %41
  br label %50

50:                                               ; preds = %49
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %8, align 4
  br label %27, !llvm.loop !11

53:                                               ; preds = %27
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %0
  store i32 0, ptr %1, align 4
  call void @_0_ifelseAND(i32 noundef 1, i32 noundef 2)
  call void @_0_ifelseAND(i32 noundef -1, i32 noundef 2)
  call void @_1_ifelseOR(i32 noundef -1, i32 noundef 2)
  call void @_1_ifelseOR(i32 noundef -1, i32 noundef -2)
  %3 = call i32 @_2_ternaryMIX(i32 noundef 3, i32 noundef 4)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %3)
  %5 = call i32 @_2_ternaryMIX(i32 noundef -3, i32 noundef 4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %5)
  call void @_3_whileAND(i32 noundef 3, i32 noundef 2)
  call void @_4_forOR(i32 noundef 1)
  call void @_5_manyblocksAND(i32 noundef 8, i32 noundef 2)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
