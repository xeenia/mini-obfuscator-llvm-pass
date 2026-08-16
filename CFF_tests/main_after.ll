; ModuleID = 'main.bc'
source_filename = "/home/xenia/Projects/mini-obfuscator-llvm-pass/CFF_tests/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"start: x = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"condition true\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"end: y = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"positive branch\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"non-positive branch\0A\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"inner true (even)\0A\00", align 1
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
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5)
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

8:                                                ; preds = %switch
  %9 = load i32, ptr %2, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %true, label %false

11:                                               ; preds = %switch
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %13 = load i32, ptr %3, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  %16 = load i32, ptr %3, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %16)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %8
    i32 2, label %11
    i32 3, label %15
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %11, %break_con, %4, %default
  br label %while

true:                                             ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %8
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_2_ifelse(i32 noundef %0) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %while

4:                                                ; preds = %switch
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5)
  %7 = load i32, ptr %2, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

9:                                                ; preds = %switch
  %10 = load i32, ptr %2, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %true, label %false

12:                                               ; preds = %switch
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %14, 2
  store i32 %15, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %18 = load i32, ptr %3, align 4
  %19 = sub nsw i32 %18, 1
  store i32 %19, ptr %3, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %21)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %9
    i32 2, label %12
    i32 3, label %16
    i32 4, label %20
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %16, %12, %break_con, %4, %default
  br label %while

true:                                             ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %9
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_ifnested(i32 noundef %0) #0 {
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  br label %while

3:                                                ; preds = %switch
  %4 = load i32, ptr %2, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %true, label %false

6:                                                ; preds = %switch
  %7 = load i32, ptr %2, align 4
  %8 = srem i32 %7, 2
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %true2, label %false3

10:                                               ; preds = %switch
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %13 = load i32, ptr %2, align 4
  %14 = icmp eq i32 %13, 3
  br i1 %14, label %true5, label %false6

15:                                               ; preds = %switch
  %16 = load i32, ptr %2, align 4
  %17 = icmp eq i32 %16, 20
  br i1 %17, label %true8, label %false9

18:                                               ; preds = %switch
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 6, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 7, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 8, ptr %b, align 4
  br label %break

23:                                               ; preds = %switch
  %24 = load i32, ptr %2, align 4
  %25 = icmp eq i32 %24, 10
  br i1 %25, label %true11, label %false12

26:                                               ; preds = %switch
  store i32 10, ptr %2, align 4
  store i32 10, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  store i32 20, ptr %2, align 4
  store i32 11, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
  store i32 12, ptr %b, align 4
  br label %break

29:                                               ; No predecessors!
  br label %30

30:                                               ; preds = %switch, %29
  %31 = load i32, ptr %2, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %31)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %3
    i32 1, label %6
    i32 2, label %10
    i32 3, label %12
    i32 4, label %15
    i32 5, label %18
    i32 6, label %20
    i32 7, label %21
    i32 8, label %23
    i32 9, label %26
    i32 10, label %27
    i32 11, label %28
    i32 12, label %30
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %28, %27, %26, %break_con13, %21, %20, %18, %break_con10, %break_con7, %10, %break_con4, %break_con, %default
  br label %while

true:                                             ; preds = %3
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %3
  store i32 12, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %12
  store i32 4, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %12
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %15
  store i32 5, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %15
  store i32 6, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break

true11:                                           ; preds = %23
  store i32 9, ptr %b, align 4
  br label %break_con13

false12:                                          ; preds = %23
  store i32 10, ptr %b, align 4
  br label %break_con13

break_con13:                                      ; preds = %true11, %false12
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
  call void @_2_ifelse(i32 noundef %21)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %23 = load i32, ptr %6, align 4
  call void @_3_ifnested(i32 noundef %23)
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
