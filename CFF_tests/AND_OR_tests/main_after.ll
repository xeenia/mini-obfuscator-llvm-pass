; ModuleID = 'main.bc'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalvar = dso_local global i32 10, align 4
@.str = private unnamed_addr constant [7 x i8] c"a: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"\0A=== _0_nocodeifalone ===\0A\00", align 1
@.str.2 = private unnamed_addr constant [42 x i8] c"_0_nocodeifalone (globalvar > 0 [TRUE]):\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_0_code_AND(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %b, align 4
  br label %while

6:                                                ; preds = %switch
  %7 = load i32, ptr %4, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 10
  br i1 %11, label %true2, label %false3

12:                                               ; preds = %switch
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %5, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  store i32 3, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %21 = load i32, ptr %3, align 4
  ret i32 %21

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %6
    i32 1, label %9
    i32 2, label %12
    i32 3, label %20
    i32 4, label %16
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %16, %12, %break_con4, %break_con, %default
  br label %while

true:                                             ; preds = %6
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %9
  store i32 2, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %9
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_0_code_OR(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  br label %while

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 10
  br i1 %10, label %true2, label %false3

11:                                               ; preds = %switch
  store i32 10, ptr %3, align 4
  store i32 2, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  store i32 0, ptr %4, align 4
  store i32 2, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %11
    i32 2, label %13
    i32 3, label %8
    i32 4, label %12
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %12, %break_con4, %11, %break_con, %default
  br label %while

true:                                             ; preds = %5
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %8
  store i32 1, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store i32 0, ptr %b, align 4
  store ptr %1, ptr %5, align 8
  br label %while

7:                                                ; preds = %switch
  %8 = load i32, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %8)
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %true, label %false

13:                                               ; preds = %switch
  store i32 0, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #3
  store i32 %18, ptr %6, align 4
  store i32 3, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, 5
  %25 = call i32 @_0_code_AND(i32 noundef %22, i32 noundef %24)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %25)
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 10
  call void @_0_code_OR(i32 noundef %27, i32 noundef %29)
  ret i32 0

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %13
    i32 3, label %19
    i32 4, label %14
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %14, %13, %break_con, %7, %default
  br label %while

true:                                             ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %10
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

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
