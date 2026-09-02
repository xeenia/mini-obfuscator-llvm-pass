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
  %b = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  br label %while

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %true2, label %false3

11:                                               ; preds = %switch
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 3, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 3, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %8
    i32 2, label %11
    i32 3, label %15
    i32 4, label %13
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %13, %11, %break_con4, %break_con, %default
  br label %while

true:                                             ; preds = %5
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 4, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %8
  store i32 2, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %8
  store i32 4, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_1_ifelseOR(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  br label %while

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %true2, label %false3

11:                                               ; preds = %switch
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 2, ptr %b, align 4
  br label %break

13:                                               ; preds = %switch
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 2, ptr %b, align 4
  br label %break

15:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %11
    i32 2, label %15
    i32 3, label %8
    i32 4, label %13
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %13, %break_con4, %11, %break_con, %default
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
define dso_local i32 @_2_ternaryMIX(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  %.reg2mem = alloca i32, align 4
  %.reg2mem1 = alloca i1, align 1
  br label %while

7:                                                ; preds = %switch
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %true, label %false

10:                                               ; preds = %switch
  %11 = load i32, ptr %4, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %true4, label %false5

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %.reg2mem, align 4
  store i32 3, ptr %b, align 4
  br label %break

17:                                               ; preds = %switch
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %18, %19
  store i32 %20, ptr %.reg2mem, align 4
  store i32 3, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 4, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %23 = load i32, ptr %3, align 4
  %24 = icmp slt i32 %23, 0
  store i1 true, ptr %.reg2mem1, align 1
  br i1 %24, label %true7, label %false8

25:                                               ; preds = %switch
  %26 = load i32, ptr %4, align 4
  %27 = icmp slt i32 %26, 0
  store i1 %27, ptr %.reg2mem1, align 1
  store i32 5, ptr %b, align 4
  br label %break

28:                                               ; preds = %switch
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

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %13
    i32 3, label %21
    i32 4, label %22
    i32 5, label %28
    i32 6, label %25
    i32 7, label %17
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %17, %25, %break_con9, %21, %13, %break_con6, %break_con, %default
  br label %while

true:                                             ; preds = %7
  store i32 1, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %7
  store i32 7, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true4:                                            ; preds = %10
  store i32 2, ptr %b, align 4
  br label %break_con6

false5:                                           ; preds = %10
  store i32 7, ptr %b, align 4
  br label %break_con6

break_con6:                                       ; preds = %true4, %false5
  br label %break

true7:                                            ; preds = %22
  store i32 5, ptr %b, align 4
  br label %break_con9

false8:                                           ; preds = %22
  store i32 6, ptr %b, align 4
  br label %break_con9

break_con9:                                       ; preds = %true7, %false8
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_3_whileAND(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  %.reg2mem = alloca i1, align 1
  br label %while

5:                                                ; preds = %switch
  store i32 1, ptr %b, align 4
  br label %break

6:                                                ; preds = %switch
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 0
  store i1 false, ptr %.reg2mem, align 1
  br i1 %8, label %true, label %false

9:                                                ; preds = %switch
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 0
  store i1 %11, ptr %.reg2mem, align 1
  store i32 3, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %true2, label %false3

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr %4, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %14, i32 noundef %15)
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, -1
  store i32 %20, ptr %4, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !8

21:                                               ; preds = %switch
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %13
    i32 5, label %21
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %13, %break_con4, %9, %break_con, %5, %default
  br label %while

true:                                             ; preds = %6
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %6
  store i32 3, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %12
  store i32 4, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %12
  store i32 5, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_4_forOR(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %b = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %b, align 4
  %.reg2mem = alloca i1, align 1
  br label %while

4:                                                ; preds = %switch
  store i32 0, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break

5:                                                ; preds = %switch
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 3
  store i1 true, ptr %.reg2mem, align 1
  br i1 %7, label %true, label %false

8:                                                ; preds = %switch
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %9, %10
  store i1 %11, ptr %.reg2mem, align 1
  store i32 2, ptr %b, align 4
  br label %break

12:                                               ; preds = %switch
  %.reload = load i1, ptr %.reg2mem, align 1
  br i1 %.reload, label %true2, label %false3

13:                                               ; preds = %switch
  %14 = load i32, ptr %3, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %14)
  store i32 4, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %3, align 4
  %18 = icmp sgt i32 %17, 20
  br i1 %18, label %true5, label %false6

19:                                               ; preds = %switch
  store i32 6, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  store i32 8, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %3, align 4
  store i32 1, ptr %b, align 4
  br label %break, !llvm.loop !10

24:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %4
    i32 1, label %5
    i32 2, label %12
    i32 3, label %13
    i32 4, label %16
    i32 5, label %19
    i32 6, label %24
    i32 7, label %20
    i32 8, label %21
    i32 9, label %8
  ]

while:                                            ; preds = %1, %break
  br label %switch

break:                                            ; preds = %8, %21, %20, %19, %break_con7, %13, %break_con4, %break_con, %4, %default
  br label %while

true:                                             ; preds = %5
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %5
  store i32 9, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %12
  store i32 3, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %12
  store i32 6, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %16
  store i32 5, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %16
  store i32 7, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_5_manyblocksAND(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %b = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %b, align 4
  %.reg2mem = alloca i32, align 4
  br label %while

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, ptr %5, align 4
  %14 = load i32, ptr %5, align 4
  %15 = sdiv i32 %14, 2
  store i32 %15, ptr %6, align 4
  store i32 1, ptr %b, align 4
  br label %break

16:                                               ; preds = %switch
  %17 = load i32, ptr %6, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %true, label %false

19:                                               ; preds = %switch
  %20 = load i32, ptr %6, align 4
  store i32 %20, ptr %.reg2mem, align 4
  store i32 3, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem, align 4
  store i32 3, ptr %b, align 4
  br label %break

22:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %7, align 4
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %7, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %23, i32 noundef %24, i32 noundef %25)
  store i32 0, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break

27:                                               ; preds = %switch
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %3, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %true2, label %false3

31:                                               ; preds = %switch
  %32 = load i32, ptr %8, align 4
  %33 = mul nsw i32 %32, 2
  store i32 %33, ptr %9, align 4
  store i32 6, ptr %b, align 4
  br label %break

34:                                               ; preds = %switch
  %35 = load i32, ptr %9, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %true5, label %false6

37:                                               ; preds = %switch
  %38 = load i32, ptr %9, align 4
  %39 = load i32, ptr %7, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %true8, label %false9

41:                                               ; preds = %switch
  %42 = load i32, ptr %8, align 4
  %43 = load i32, ptr %9, align 4
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %42, i32 noundef %43)
  store i32 9, ptr %b, align 4
  br label %break

45:                                               ; preds = %switch
  %46 = load i32, ptr %8, align 4
  %47 = load i32, ptr %9, align 4
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %46, i32 noundef %47)
  store i32 9, ptr %b, align 4
  br label %break

49:                                               ; preds = %switch
  store i32 10, ptr %b, align 4
  br label %break

50:                                               ; preds = %switch
  %51 = load i32, ptr %8, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %8, align 4
  store i32 4, ptr %b, align 4
  br label %break, !llvm.loop !11

53:                                               ; preds = %switch
  ret void

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %10
    i32 1, label %16
    i32 2, label %19
    i32 3, label %22
    i32 4, label %27
    i32 5, label %31
    i32 6, label %34
    i32 7, label %37
    i32 8, label %41
    i32 9, label %49
    i32 10, label %50
    i32 11, label %45
    i32 12, label %53
    i32 13, label %21
  ]

while:                                            ; preds = %2, %break
  br label %switch

break:                                            ; preds = %21, %45, %50, %49, %41, %break_con10, %break_con7, %31, %break_con4, %22, %19, %break_con, %10, %default
  br label %while

true:                                             ; preds = %16
  store i32 2, ptr %b, align 4
  br label %break_con

false:                                            ; preds = %16
  store i32 13, ptr %b, align 4
  br label %break_con

break_con:                                        ; preds = %true, %false
  br label %break

true2:                                            ; preds = %27
  store i32 5, ptr %b, align 4
  br label %break_con4

false3:                                           ; preds = %27
  store i32 12, ptr %b, align 4
  br label %break_con4

break_con4:                                       ; preds = %true2, %false3
  br label %break

true5:                                            ; preds = %34
  store i32 7, ptr %b, align 4
  br label %break_con7

false6:                                           ; preds = %34
  store i32 11, ptr %b, align 4
  br label %break_con7

break_con7:                                       ; preds = %true5, %false6
  br label %break

true8:                                            ; preds = %37
  store i32 8, ptr %b, align 4
  br label %break_con10

false9:                                           ; preds = %37
  store i32 11, ptr %b, align 4
  br label %break_con10

break_con10:                                      ; preds = %true8, %false9
  br label %break
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %b = alloca i32, align 4
  %1 = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %while

2:                                                ; preds = %switch
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

default:                                          ; preds = %switch
  br label %break

switch:                                           ; preds = %while
  %b1 = load i32, ptr %b, align 4
  switch i32 %b1, label %default [
    i32 0, label %2
  ]

while:                                            ; preds = %0, %break
  br label %switch

break:                                            ; preds = %default
  br label %while
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
