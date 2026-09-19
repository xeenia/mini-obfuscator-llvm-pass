; ModuleID = 'main.bc'
source_filename = "main.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_void_result = dso_local global i32 0, align 4
@g_x = dso_local global i32 10, align 4
@g_y = dso_local global i32 -3, align 4
@_ZZ16_3_computed_gotoiE6labels = internal global [4 x ptr] [ptr blockaddress(@_Z16_3_computed_gotoi, %19), ptr blockaddress(@_Z16_3_computed_gotoi, %20), ptr blockaddress(@_Z16_3_computed_gotoi, %21), ptr blockaddress(@_Z16_3_computed_gotoi, %22)], align 16
@_ZZ25_4_computed_goto_dispatchiiE3ops = internal global [4 x ptr] [ptr blockaddress(@_Z25_4_computed_goto_dispatchii, %21), ptr blockaddress(@_Z25_4_computed_goto_dispatchii, %25), ptr blockaddress(@_Z25_4_computed_goto_dispatchii, %29), ptr blockaddress(@_Z25_4_computed_goto_dispatchii, %33)], align 16
@_ZTIi = external constant ptr
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef i32 @_Z16_3_computed_gotoi(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp sge i32 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 4
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = load i32, ptr %2, align 4
  br label %13

12:                                               ; preds = %7, %1
  br label %13

13:                                               ; preds = %12, %10
  %14 = phi i32 [ %11, %10 ], [ 3, %12 ]
  store i32 %14, ptr %4, align 4
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [4 x ptr], ptr @_ZZ16_3_computed_gotoiE6labels, i64 0, i64 %16
  %18 = load ptr, ptr %17, align 8
  br label %25

19:                                               ; preds = %25
  store i32 10, ptr %3, align 4
  br label %23

20:                                               ; preds = %25
  store i32 20, ptr %3, align 4
  br label %23

21:                                               ; preds = %25
  store i32 30, ptr %3, align 4
  br label %23

22:                                               ; preds = %25
  store i32 40, ptr %3, align 4
  br label %23

23:                                               ; preds = %22, %21, %20, %19
  %24 = load i32, ptr %3, align 4
  ret i32 %24

25:                                               ; preds = %13
  %26 = phi ptr [ %18, %13 ]
  indirectbr ptr %26, [label %19, label %20, label %21, label %22]
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef i32 @_Z25_4_computed_goto_dispatchii(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %14

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  br label %15

14:                                               ; preds = %9, %2
  br label %15

15:                                               ; preds = %14, %12
  %16 = phi i32 [ %13, %12 ], [ 3, %14 ]
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [4 x ptr], ptr @_ZZ25_4_computed_goto_dispatchiiE3ops, i64 0, i64 %18
  %20 = load ptr, ptr %19, align 8
  br label %35

21:                                               ; preds = %35
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %22, %23
  store i32 %24, ptr %5, align 4
  br label %33

25:                                               ; preds = %35
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, ptr %5, align 4
  br label %33

29:                                               ; preds = %35
  %30 = load i32, ptr %3, align 4
  %31 = load i32, ptr %4, align 4
  %32 = mul nsw i32 %30, %31
  store i32 %32, ptr %5, align 4
  br label %33

33:                                               ; preds = %35, %29, %25, %21
  %34 = load i32, ptr %5, align 4
  ret i32 %34

35:                                               ; preds = %15
  %36 = phi ptr [ %20, %15 ]
  indirectbr ptr %36, [label %21, label %25, label %29, label %33]
}

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i32 @_Z12_5_try_catchi(i32 noundef %0) #1 personality ptr @__gxx_personality_v0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %26

9:                                                ; preds = %1
  %10 = call ptr @__cxa_allocate_exception(i64 4) #6
  store i32 -1, ptr %10, align 16
  invoke void @__cxa_throw(ptr %10, ptr @_ZTIi, ptr null) #7
          to label %34 unwind label %11

11:                                               ; preds = %9
  %12 = landingpad { ptr, i32 }
          catch ptr @_ZTIi
  %13 = extractvalue { ptr, i32 } %12, 0
  store ptr %13, ptr %4, align 8
  %14 = extractvalue { ptr, i32 } %12, 1
  store i32 %14, ptr %5, align 4
  br label %15

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  %17 = call i32 @llvm.eh.typeid.for(ptr @_ZTIi) #6
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %29

19:                                               ; preds = %15
  %20 = load ptr, ptr %4, align 8
  %21 = call ptr @__cxa_begin_catch(ptr %20) #6
  %22 = load i32, ptr %21, align 4
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %6, align 4
  store i32 %23, ptr %3, align 4
  call void @__cxa_end_catch() #6
  br label %24

24:                                               ; preds = %26, %19
  %25 = load i32, ptr %3, align 4
  ret i32 %25

26:                                               ; preds = %1
  %27 = load i32, ptr %2, align 4
  %28 = add nsw i32 %27, 10
  store i32 %28, ptr %3, align 4
  br label %24

29:                                               ; preds = %15
  %30 = load ptr, ptr %4, align 8
  %31 = load i32, ptr %5, align 4
  %32 = insertvalue { ptr, i32 } poison, ptr %30, 0
  %33 = insertvalue { ptr, i32 } %32, i32 %31, 1
  resume { ptr, i32 } %33

34:                                               ; preds = %9
  unreachable
}

declare ptr @__cxa_allocate_exception(i64)

declare void @__cxa_throw(ptr, ptr, ptr)

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind memory(none)
declare i32 @llvm.eh.typeid.for(ptr) #2

declare ptr @__cxa_begin_catch(ptr)

declare void @__cxa_end_catch()

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i32 @_Z19_6_nested_try_catchii(i32 noundef %0, i32 noundef %1) #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %12, label %34

12:                                               ; preds = %2
  %13 = call ptr @__cxa_allocate_exception(i64 4) #6
  %14 = load i32, ptr %3, align 4
  store i32 %14, ptr %13, align 16
  invoke void @__cxa_throw(ptr %13, ptr @_ZTIi, ptr null) #7
          to label %60 unwind label %15

15:                                               ; preds = %12
  %16 = landingpad { ptr, i32 }
          catch ptr @_ZTIi
  %17 = extractvalue { ptr, i32 } %16, 0
  store ptr %17, ptr %6, align 8
  %18 = extractvalue { ptr, i32 } %16, 1
  store i32 %18, ptr %7, align 4
  br label %19

19:                                               ; preds = %15
  %20 = load i32, ptr %7, align 4
  %21 = call i32 @llvm.eh.typeid.for(ptr @_ZTIi) #6
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %23, label %41

23:                                               ; preds = %19
  %24 = load ptr, ptr %6, align 8
  %25 = call ptr @__cxa_begin_catch(ptr %24) #6
  %26 = load i32, ptr %25, align 4
  store i32 %26, ptr %8, align 4
  %27 = load i32, ptr %8, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  %29 = load i32, ptr %4, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %53

31:                                               ; preds = %23
  %32 = call ptr @__cxa_allocate_exception(i64 4) #6
  %33 = load i32, ptr %4, align 4
  store i32 %33, ptr %32, align 16
  invoke void @__cxa_throw(ptr %32, ptr @_ZTIi, ptr null) #7
          to label %60 unwind label %37

34:                                               ; preds = %2
  %35 = load i32, ptr %3, align 4
  %36 = mul nsw i32 %35, 2
  store i32 %36, ptr %5, align 4
  br label %54

37:                                               ; preds = %31
  %38 = landingpad { ptr, i32 }
          cleanup
          catch ptr @_ZTIi
  %39 = extractvalue { ptr, i32 } %38, 0
  store ptr %39, ptr %6, align 8
  %40 = extractvalue { ptr, i32 } %38, 1
  store i32 %40, ptr %7, align 4
  call void @__cxa_end_catch() #6
  br label %41

41:                                               ; preds = %37, %19
  %42 = load i32, ptr %7, align 4
  %43 = call i32 @llvm.eh.typeid.for(ptr @_ZTIi) #6
  %44 = icmp eq i32 %42, %43
  br i1 %44, label %45, label %55

45:                                               ; preds = %41
  %46 = load ptr, ptr %6, align 8
  %47 = call ptr @__cxa_begin_catch(ptr %46) #6
  %48 = load i32, ptr %47, align 4
  store i32 %48, ptr %9, align 4
  %49 = load i32, ptr %9, align 4
  %50 = mul nsw i32 %49, 3
  store i32 %50, ptr %5, align 4
  call void @__cxa_end_catch() #6
  br label %51

51:                                               ; preds = %54, %45
  %52 = load i32, ptr %5, align 4
  ret i32 %52

53:                                               ; preds = %23
  call void @__cxa_end_catch() #6
  br label %54

54:                                               ; preds = %53, %34
  br label %51

55:                                               ; preds = %41
  %56 = load ptr, ptr %6, align 8
  %57 = load i32, ptr %7, align 4
  %58 = insertvalue { ptr, i32 } poison, ptr %56, 0
  %59 = insertvalue { ptr, i32 } %58, i32 %57, 1
  resume { ptr, i32 } %59

60:                                               ; preds = %31, %12
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef i32 @_Z11_7_asm_gotoi(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  store i32 %4, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  callbr void asm sideeffect "cmp $$0, $0\0A\09js ${1:l}\0A\09jmp ${2:l}\0A\09", "r,!i,!i,~{dirflag},~{fpsr},~{flags}"(i32 %5) #6
          to label %6 [label %9, label %12], !srcloc !8

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = mul nsw i32 %7, 2
  store i32 %8, ptr %3, align 4
  br label %15

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = sub nsw i32 0, %10
  store i32 %11, ptr %3, align 4
  br label %15

12:                                               ; preds = %1
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 100
  store i32 %14, ptr %3, align 4
  br label %15

15:                                               ; preds = %12, %9, %6
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef i32 @_Z18_8_asm_goto_outputiPi(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %7 = load i32, ptr %3, align 4
  store i32 %7, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %8 = load i32, ptr %3, align 4
  %9 = callbr { i32, i32 } asm "test $2, $2\0A\09jz ${3:l}\0A\09mov $$1, $0\0A\09jmp ${4:l}\0A\09", "=r,=r,r,!i,!i,~{dirflag},~{fpsr},~{flags}"(i32 %8) #2
          to label %10 [label %14, label %17], !srcloc !9

10:                                               ; preds = %2
  %11 = extractvalue { i32, i32 } %9, 0
  %12 = extractvalue { i32, i32 } %9, 1
  store i32 %11, ptr %6, align 4
  store i32 %12, ptr %5, align 4
  br label %13

13:                                               ; preds = %14, %10
  store i32 0, ptr %6, align 4
  br label %20

14:                                               ; preds = %2
  %15 = extractvalue { i32, i32 } %9, 0
  %16 = extractvalue { i32, i32 } %9, 1
  store i32 %15, ptr %6, align 4
  store i32 %16, ptr %5, align 4
  br label %13

17:                                               ; preds = %2
  %18 = extractvalue { i32, i32 } %9, 0
  %19 = extractvalue { i32, i32 } %9, 1
  store i32 %18, ptr %6, align 4
  store i32 %19, ptr %5, align 4
  br label %20

20:                                               ; preds = %17, %13
  %21 = load i32, ptr %6, align 4
  %22 = load ptr, ptr %4, align 8
  store i32 %21, ptr %22, align 4
  %23 = load i32, ptr %5, align 4
  %24 = load ptr, ptr %4, align 8
  %25 = load i32, ptr %24, align 4
  %26 = add nsw i32 %23, %25
  ret i32 %26
}

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr noundef %1) #3 {
entry:
  %.reg2mem1 = alloca i32, align 4
  %.reg2mem = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, ptr %b, align 4
  br label %switch

9:                                                ; preds = %switch
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %b, align 4
  br label %break

10:                                               ; preds = %switch
  %11 = load i32, ptr %3, align 4
  %12 = icmp sgt i32 %11, 1
  %13 = select i1 %12, i32 2, i32 3
  store i32 %13, ptr %b, align 4
  br label %break

14:                                               ; preds = %switch
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #8
  store i32 %18, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

19:                                               ; preds = %switch
  store i32 4, ptr %.reg2mem, align 4
  store i32 4, ptr %b, align 4
  br label %break

20:                                               ; preds = %switch
  %.reload = load i32, ptr %.reg2mem, align 4
  store i32 %.reload, ptr %5, align 4
  store i32 5, ptr %b, align 4
  br label %break

21:                                               ; preds = %switch
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %22, 2
  %24 = select i1 %23, i32 6, i32 7
  store i32 %24, ptr %b, align 4
  br label %break

25:                                               ; preds = %switch
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 2
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 @atoi(ptr noundef %28) #8
  store i32 %29, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

30:                                               ; preds = %switch
  store i32 1, ptr %.reg2mem1, align 4
  store i32 8, ptr %b, align 4
  br label %break

31:                                               ; preds = %switch
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  store i32 %.reload2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %32 = load i32, ptr %5, align 4
  %33 = call noundef i32 @_Z16_3_computed_gotoi(i32 noundef %32)
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %7, align 4
  %36 = load i32, ptr %5, align 4
  %37 = load i32, ptr %6, align 4
  %38 = call noundef i32 @_Z25_4_computed_goto_dispatchii(i32 noundef %36, i32 noundef %37)
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %39, %38
  store i32 %40, ptr %7, align 4
  %41 = load i32, ptr %5, align 4
  %42 = call noundef i32 @_Z12_5_try_catchi(i32 noundef %41)
  %43 = load i32, ptr %7, align 4
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr %7, align 4
  %45 = load i32, ptr %5, align 4
  %46 = load i32, ptr %6, align 4
  %47 = call noundef i32 @_Z19_6_nested_try_catchii(i32 noundef %45, i32 noundef %46)
  %48 = load i32, ptr %7, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %50 = load i32, ptr %5, align 4
  %51 = call noundef i32 @_Z11_7_asm_gotoi(i32 noundef %50)
  %52 = load i32, ptr %7, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, ptr %7, align 4
  %54 = load i32, ptr %5, align 4
  %55 = call noundef i32 @_Z18_8_asm_goto_outputiPi(i32 noundef %54, ptr noundef %8)
  %56 = load i32, ptr %7, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %7, align 4
  %58 = load i32, ptr @g_void_result, align 4
  %59 = load i32, ptr %7, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %7, align 4
  %61 = load i32, ptr %7, align 4
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %61)
  ret i32 0

default:                                          ; preds = %switch
  unreachable

switch:                                           ; preds = %entry, %break
  %b3 = load i32, ptr %b, align 4
  switch i32 %b3, label %default [
    i32 0, label %9
    i32 1, label %10
    i32 2, label %14
    i32 3, label %19
    i32 4, label %20
    i32 5, label %21
    i32 6, label %25
    i32 7, label %30
    i32 8, label %31
  ]

break:                                            ; preds = %30, %25, %21, %20, %19, %14, %10, %9
  br label %switch
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

declare i32 @printf(ptr noundef, ...) #5

attributes #0 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind memory(none) }
attributes #3 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }
attributes #8 = { nounwind willreturn memory(read) }

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
!8 = !{i64 2555, i64 2568, i64 2593, i64 2622}
!9 = !{i64 3042, i64 3056, i64 3082, i64 3107, i64 3138}
