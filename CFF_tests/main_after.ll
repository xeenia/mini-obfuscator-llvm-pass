; ModuleID = 'main.bc'
source_filename = "/home/xenia/Projects/mini-obfuscator-llvm-pass/CFF_tests/main.c"
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
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %while

4:                                                ; preds = %switch
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %true2, label %false3

15:                                               ; preds = %switch
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %17 = load i32, ptr %3, align 4
  %18 = mul nsw i32 %17, 5
  store i32 %18, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %8
    i32 3, label %12
    i32 4, label %15
    i32 5, label %19
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %15, %true2, %false3, %8, %true, %false, %4
  br label %while

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break

false:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %break

true2:                                            ; preds = %12
  store i32 4, ptr %b, align 4
  br label %break

false3:                                           ; preds = %12
  store i32 5, ptr %b, align 4
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifnested(i32 noundef %0) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %while

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %5)
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 10
  store i32 %14, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = srem i32 %16, 2
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %true2, label %false3

19:                                               ; preds = %switch
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %21 = load i32, ptr %3, align 4
  %22 = mul nsw i32 %21, 3
  store i32 %22, ptr %3, align 4
  store i32 5, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  %25 = icmp eq i32 %24, 3
  br i1 %25, label %true4, label %false5

26:                                               ; preds = %switch
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 7, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

29:                                               ; No predecessors!
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %31 = load i32, ptr %3, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %3, align 4
  br label %33

33:                                               ; preds = %switch, %29
  %34 = load i32, ptr %3, align 4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %34)
  ret void

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %8
    i32 2, label %11
    i32 3, label %15
    i32 4, label %19
    i32 5, label %23
    i32 6, label %26
    i32 7, label %28
    i32 8, label %33
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %28, %26, %true4, %false5, %19, %true2, %false3, %11, %true, %false, %4
  br label %while

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break

false:                                            ; preds = %8
  store i32 8, ptr %b, align 4
  br label %break

true2:                                            ; preds = %15
  store i32 4, ptr %b, align 4
  br label %break

false3:                                           ; preds = %15
  store i32 5, ptr %b, align 4
  br label %break

true4:                                            ; preds = %23
  store i32 6, ptr %b, align 4
  br label %break

false5:                                           ; preds = %23
  store i32 7, ptr %b, align 4
  br label %break
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
