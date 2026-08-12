; ModuleID = '../tests/CFF_examples_high_level.c'
source_filename = "../tests/CFF_examples_high_level.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [44 x i8] c"ifelse_both_return   before: %d  after: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"if_return_fallthrough before: %d  after: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"ifelse_no_return      before: %d  after: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [45 x i8] c"nested_no_return      before: %d  after: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [48 x i8] c"nested_inner_return_only before: %d  after: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"nested_full_return    before: %d  after: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [45 x i8] c"nested_mixed_return   before: %d  after: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_before_ifelse_both_return(i32 noundef %0) #0 {
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
  store i32 0, ptr %2, align 4
  br label %8

8:                                                ; preds = %7, %6
  %9 = load i32, ptr %2, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_before_if_return_fallthrough(i32 noundef %0) #0 {
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
  store i32 0, ptr %2, align 4
  br label %8

8:                                                ; preds = %7, %6
  %9 = load i32, ptr %2, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_before_ifelse_no_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %6, %5
  %8 = load i32, ptr %2, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_before_nested_no_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %16

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = srem i32 %6, 2
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %5
  %10 = load i32, ptr %2, align 4
  %11 = mul nsw i32 %10, 2
  store i32 %11, ptr %2, align 4
  br label %15

12:                                               ; preds = %5
  %13 = load i32, ptr %2, align 4
  %14 = mul nsw i32 %13, 3
  store i32 %14, ptr %2, align 4
  br label %15

15:                                               ; preds = %12, %9
  br label %16

16:                                               ; preds = %15, %1
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_before_nested_inner_return_only(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %12

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = srem i32 %7, 2
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  store i32 1, ptr %2, align 4
  br label %13

11:                                               ; preds = %6
  store i32 0, ptr %2, align 4
  br label %13

12:                                               ; preds = %1
  store i32 -1, ptr %2, align 4
  br label %13

13:                                               ; preds = %12, %11, %10
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @CFF_before_nested_full_return(i32 noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %12

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = srem i32 %7, 2
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  store i1 true, ptr %2, align 1
  br label %13

11:                                               ; preds = %6
  store i1 false, ptr %2, align 1
  br label %13

12:                                               ; preds = %1
  store i1 false, ptr %2, align 1
  br label %13

13:                                               ; preds = %12, %11, %10
  %14 = load i1, ptr %2, align 1
  ret i1 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_before_nested_mixed_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %14

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  store i32 0, ptr %2, align 4
  br label %16

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 5
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %10
  br label %14

14:                                               ; preds = %13, %1
  %15 = load i32, ptr %3, align 4
  store i32 %15, ptr %2, align 4
  br label %16

16:                                               ; preds = %14, %9
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_after_ifelse_both_return(i32 noundef %0) #0 {
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
  store i32 0, ptr %2, align 4
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
define dso_local i32 @CFF_after_if_return_fallthrough(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %1, %20
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
  br label %22

14:                                               ; preds = %5
  store i32 -1, ptr %4, align 4
  br label %16

15:                                               ; preds = %5
  br label %16

16:                                               ; preds = %15, %14, %12
  %17 = load i32, ptr %4, align 4
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %21

20:                                               ; preds = %16
  br label %5

21:                                               ; preds = %19
  store i32 0, ptr %2, align 4
  br label %22

22:                                               ; preds = %21, %13
  %23 = load i32, ptr %2, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_after_ifelse_no_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %1, %19
  %5 = load i32, ptr %3, align 4
  switch i32 %5, label %14 [
    i32 0, label %6
    i32 1, label %12
    i32 2, label %13
  ]

6:                                                ; preds = %4
  %7 = load i32, ptr %2, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  store i32 1, ptr %3, align 4
  br label %11

10:                                               ; preds = %6
  store i32 2, ptr %3, align 4
  br label %11

11:                                               ; preds = %10, %9
  br label %15

12:                                               ; preds = %4
  store i32 1, ptr %2, align 4
  store i32 -1, ptr %3, align 4
  br label %15

13:                                               ; preds = %4
  store i32 0, ptr %2, align 4
  store i32 -1, ptr %3, align 4
  br label %14

14:                                               ; preds = %4, %13
  br label %15

15:                                               ; preds = %14, %12, %11
  %16 = load i32, ptr %3, align 4
  %17 = icmp eq i32 %16, -1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  br label %20

19:                                               ; preds = %15
  br label %4

20:                                               ; preds = %18
  %21 = load i32, ptr %2, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_after_nested_no_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %1, %31
  %5 = load i32, ptr %3, align 4
  switch i32 %5, label %26 [
    i32 0, label %6
    i32 1, label %12
    i32 2, label %19
    i32 3, label %20
    i32 4, label %23
  ]

6:                                                ; preds = %4
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  store i32 1, ptr %3, align 4
  br label %11

10:                                               ; preds = %6
  store i32 2, ptr %3, align 4
  br label %11

11:                                               ; preds = %10, %9
  br label %27

12:                                               ; preds = %4
  %13 = load i32, ptr %2, align 4
  %14 = srem i32 %13, 2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  store i32 3, ptr %3, align 4
  br label %18

17:                                               ; preds = %12
  store i32 4, ptr %3, align 4
  br label %18

18:                                               ; preds = %17, %16
  br label %27

19:                                               ; preds = %4
  store i32 -1, ptr %3, align 4
  br label %27

20:                                               ; preds = %4
  %21 = load i32, ptr %2, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, ptr %2, align 4
  store i32 -1, ptr %3, align 4
  br label %27

23:                                               ; preds = %4
  %24 = load i32, ptr %2, align 4
  %25 = mul nsw i32 %24, 3
  store i32 %25, ptr %2, align 4
  store i32 -1, ptr %3, align 4
  br label %27

26:                                               ; preds = %4
  br label %27

27:                                               ; preds = %26, %23, %20, %19, %18, %11
  %28 = load i32, ptr %3, align 4
  %29 = icmp eq i32 %28, -1
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  br label %32

31:                                               ; preds = %27
  br label %4

32:                                               ; preds = %30
  %33 = load i32, ptr %2, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_after_nested_inner_return_only(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %1, %28
  %6 = load i32, ptr %4, align 4
  switch i32 %6, label %23 [
    i32 0, label %7
    i32 1, label %13
    i32 2, label %20
    i32 3, label %21
    i32 4, label %22
  ]

7:                                                ; preds = %5
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 1, ptr %4, align 4
  br label %12

11:                                               ; preds = %7
  store i32 2, ptr %4, align 4
  br label %12

12:                                               ; preds = %11, %10
  br label %24

13:                                               ; preds = %5
  %14 = load i32, ptr %3, align 4
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 3, ptr %4, align 4
  br label %19

18:                                               ; preds = %13
  store i32 4, ptr %4, align 4
  br label %19

19:                                               ; preds = %18, %17
  br label %24

20:                                               ; preds = %5
  store i32 -1, ptr %4, align 4
  br label %24

21:                                               ; preds = %5
  store i32 1, ptr %2, align 4
  br label %30

22:                                               ; preds = %5
  store i32 0, ptr %2, align 4
  br label %30

23:                                               ; preds = %5
  br label %24

24:                                               ; preds = %23, %20, %19, %12
  %25 = load i32, ptr %4, align 4
  %26 = icmp eq i32 %25, -1
  br i1 %26, label %27, label %28

27:                                               ; preds = %24
  br label %29

28:                                               ; preds = %24
  br label %5

29:                                               ; preds = %27
  store i32 -1, ptr %2, align 4
  br label %30

30:                                               ; preds = %29, %22, %21
  %31 = load i32, ptr %2, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @CFF_after_nested_full_return(i32 noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %1, %24
  %6 = load i32, ptr %4, align 4
  switch i32 %6, label %23 [
    i32 0, label %7
    i32 1, label %13
    i32 2, label %20
    i32 3, label %21
    i32 4, label %22
  ]

7:                                                ; preds = %5
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 1, ptr %4, align 4
  br label %12

11:                                               ; preds = %7
  store i32 2, ptr %4, align 4
  br label %12

12:                                               ; preds = %11, %10
  br label %24

13:                                               ; preds = %5
  %14 = load i32, ptr %3, align 4
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 3, ptr %4, align 4
  br label %19

18:                                               ; preds = %13
  store i32 4, ptr %4, align 4
  br label %19

19:                                               ; preds = %18, %17
  br label %20

20:                                               ; preds = %5, %19
  store i1 false, ptr %2, align 1
  br label %25

21:                                               ; preds = %5
  store i1 true, ptr %2, align 1
  br label %25

22:                                               ; preds = %5
  store i1 false, ptr %2, align 1
  br label %25

23:                                               ; preds = %5
  br label %24

24:                                               ; preds = %23, %12
  br label %5

25:                                               ; preds = %22, %21, %20
  %26 = load i1, ptr %2, align 1
  ret i1 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @CFF_after_nested_mixed_return(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %1, %29
  %6 = load i32, ptr %4, align 4
  switch i32 %6, label %24 [
    i32 0, label %7
    i32 1, label %13
    i32 2, label %19
    i32 3, label %20
    i32 4, label %21
  ]

7:                                                ; preds = %5
  %8 = load i32, ptr %3, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 1, ptr %4, align 4
  br label %12

11:                                               ; preds = %7
  store i32 2, ptr %4, align 4
  br label %12

12:                                               ; preds = %11, %10
  br label %25

13:                                               ; preds = %5
  %14 = load i32, ptr %3, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 3, ptr %4, align 4
  br label %18

17:                                               ; preds = %13
  store i32 4, ptr %4, align 4
  br label %18

18:                                               ; preds = %17, %16
  br label %25

19:                                               ; preds = %5
  store i32 -1, ptr %4, align 4
  br label %25

20:                                               ; preds = %5
  store i32 0, ptr %2, align 4
  br label %32

21:                                               ; preds = %5
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 5
  store i32 %23, ptr %3, align 4
  store i32 -1, ptr %4, align 4
  br label %25

24:                                               ; preds = %5
  br label %25

25:                                               ; preds = %24, %21, %19, %18, %12
  %26 = load i32, ptr %4, align 4
  %27 = icmp eq i32 %26, -1
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  br label %30

29:                                               ; preds = %25
  br label %5

30:                                               ; preds = %28
  %31 = load i32, ptr %3, align 4
  store i32 %31, ptr %2, align 4
  br label %32

32:                                               ; preds = %30, %20
  %33 = load i32, ptr %2, align 4
  ret i32 %33
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
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 1
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @atoi(ptr noundef %9) #3
  store i32 %10, ptr %6, align 4
  %11 = load i32, ptr %6, align 4
  %12 = call i32 @CFF_before_ifelse_both_return(i32 noundef %11)
  %13 = load i32, ptr %6, align 4
  %14 = call i32 @CFF_after_ifelse_both_return(i32 noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %12, i32 noundef %14)
  %16 = load i32, ptr %6, align 4
  %17 = call i32 @CFF_before_if_return_fallthrough(i32 noundef %16)
  %18 = load i32, ptr %6, align 4
  %19 = call i32 @CFF_after_if_return_fallthrough(i32 noundef %18)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %17, i32 noundef %19)
  %21 = load i32, ptr %6, align 4
  %22 = call i32 @CFF_before_ifelse_no_return(i32 noundef %21)
  %23 = load i32, ptr %6, align 4
  %24 = call i32 @CFF_after_ifelse_no_return(i32 noundef %23)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %22, i32 noundef %24)
  %26 = load i32, ptr %6, align 4
  %27 = call i32 @CFF_before_nested_no_return(i32 noundef %26)
  %28 = load i32, ptr %6, align 4
  %29 = call i32 @CFF_after_nested_no_return(i32 noundef %28)
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %27, i32 noundef %29)
  %31 = load i32, ptr %6, align 4
  %32 = call i32 @CFF_before_nested_inner_return_only(i32 noundef %31)
  %33 = load i32, ptr %6, align 4
  %34 = call i32 @CFF_after_nested_inner_return_only(i32 noundef %33)
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %32, i32 noundef %34)
  %36 = load i32, ptr %6, align 4
  %37 = call zeroext i1 @CFF_before_nested_full_return(i32 noundef %36)
  %38 = zext i1 %37 to i32
  %39 = load i32, ptr %6, align 4
  %40 = call zeroext i1 @CFF_after_nested_full_return(i32 noundef %39)
  %41 = zext i1 %40 to i32
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %38, i32 noundef %41)
  %43 = load i32, ptr %6, align 4
  %44 = call i32 @CFF_before_nested_mixed_return(i32 noundef %43)
  %45 = load i32, ptr %6, align 4
  %46 = call i32 @CFF_after_nested_mixed_return(i32 noundef %45)
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %44, i32 noundef %46)
  ret i32 0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.1 (https://github.com/llvm/llvm-project.git e19b7dc36bc047b9eb72078d034596be766da350)"}
