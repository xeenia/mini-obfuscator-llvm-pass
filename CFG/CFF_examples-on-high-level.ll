; ModuleID = '../tests/CFF_examples_high_level.c'
source_filename = "../tests/CFF_examples_high_level.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"CFF before (returns): %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"CFF after (returns): %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"CFF before (no returns): %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"CFF after (no returns): %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_before_with_returns(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %8

7:                                                ; preds = %1
  store i32 10, ptr %2, align 4
  br label %8

8:                                                ; preds = %7, %6
  %9 = load i32, ptr %2, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_before_without_returns(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  store i32 100, ptr %2, align 4
  br label %7

6:                                                ; preds = %1
  store i32 -100, ptr %2, align 4
  br label %7

7:                                                ; preds = %6, %5
  %8 = load i32, ptr %2, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_after_with_returns(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %1, %16
  %6 = load i32, ptr %4, align 4
  switch i32 %6, label %15 [
    i32 0, label %7
    i32 1, label %13
    i32 2, label %14
  ]

7:                                                ; preds = %5
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 1, ptr %4, align 4
  br label %12

11:                                               ; preds = %7
  store i32 2, ptr %4, align 4
  br label %12

12:                                               ; preds = %11, %10
  br label %16

13:                                               ; preds = %5
  store i32 1, ptr %2, align 4
  br label %17

14:                                               ; preds = %5
  store i32 10, ptr %2, align 4
  br label %17

15:                                               ; preds = %5
  br label %16

16:                                               ; preds = %15, %12
  br label %5

17:                                               ; preds = %14, %13
  %18 = load i32, ptr %2, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_after_without_returns(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %5 = call i64 @time(ptr noundef null) #4
  %6 = trunc i64 %5 to i32
  call void @srand(i32 noundef %6) #4
  br label %7

7:                                                ; preds = %1, %35
  %8 = load i32, ptr %3, align 4
  switch i32 %8, label %17 [
    i32 0, label %9
    i32 1, label %15
    i32 2, label %16
  ]

9:                                                ; preds = %7
  %10 = load i32, ptr %2, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  store i32 1, ptr %3, align 4
  br label %14

13:                                               ; preds = %9
  store i32 2, ptr %3, align 4
  br label %14

14:                                               ; preds = %13, %12
  br label %18

15:                                               ; preds = %7
  store i32 100, ptr %2, align 4
  br label %16

16:                                               ; preds = %7, %15
  store i32 -100, ptr %2, align 4
  br label %17

17:                                               ; preds = %7, %16
  br label %18

18:                                               ; preds = %17, %14
  %19 = load i32, ptr %3, align 4
  %20 = icmp slt i32 %19, 3
  br i1 %20, label %21, label %35

21:                                               ; preds = %18
  %22 = call i32 @rand() #4
  %23 = srem i32 %22, 2
  store i32 %23, ptr %4, align 4
  %24 = load i32, ptr %4, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %30

26:                                               ; preds = %21
  %27 = call i32 @rand() #4
  %28 = srem i32 %27, 8
  %29 = add nsw i32 3, %28
  store i32 %29, ptr %3, align 4
  br label %34

30:                                               ; preds = %21
  %31 = call i32 @rand() #4
  %32 = srem i32 %31, 8
  %33 = add nsw i32 -10, %32
  store i32 %33, ptr %3, align 4
  br label %34

34:                                               ; preds = %30, %26
  br label %35

35:                                               ; preds = %34, %18
  br label %7
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 1
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @atoi(ptr noundef %9) #5
  store i32 %10, ptr %6, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 @CFF_before_with_returns(i32 noundef %11)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %12)
  %14 = load i32, ptr %6, align 4
  %15 = call i32 @CFF_after_with_returns(i32 noundef %14)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %15)
  %17 = load i32, ptr %6, align 4
  %18 = call i32 @CFF_before_without_returns(i32 noundef %17)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %18)
  %20 = load i32, ptr %6, align 4
  %21 = call i32 @CFF_after_without_returns(i32 noundef %20)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %21)
  ret i32 0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
