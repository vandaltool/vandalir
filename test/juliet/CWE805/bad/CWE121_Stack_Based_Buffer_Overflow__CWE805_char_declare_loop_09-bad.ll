; ModuleID = './test/Juliet/CWE805/bad/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09-bad.bc'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09_bad() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca [50 x i8], align 16
  %3 = alloca [100 x i8], align 16
  %4 = alloca i64, align 8
  %5 = alloca [100 x i8], align 16
  %6 = load i32, i32* @GLOBAL_CONST_TRUE, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %0
  %9 = getelementptr inbounds [50 x i8], [50 x i8]* %2, i64 0, i64 0
  store i8* %9, i8** %1, align 8
  %10 = load i8*, i8** %1, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 0
  store i8 0, i8* %11, align 1
  br label %12

12:                                               ; preds = %8, %0
  %13 = getelementptr inbounds [100 x i8], [100 x i8]* %5, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* align 16 %13, i8 67, i64 99, i1 false)
  %14 = getelementptr inbounds [100 x i8], [100 x i8]* %5, i64 0, i64 99
  store i8 0, i8* %14, align 1
  store i64 0, i64* %4, align 8
  br label %15

15:                                               ; preds = %25, %12
  %16 = load i64, i64* %4, align 8
  %17 = icmp ult i64 %16, 100
  br i1 %17, label %18, label %28

18:                                               ; preds = %15
  %19 = load i64, i64* %4, align 8
  %20 = getelementptr inbounds [100 x i8], [100 x i8]* %5, i64 0, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = load i8*, i8** %1, align 8
  %23 = load i64, i64* %4, align 8
  %24 = getelementptr inbounds i8, i8* %22, i64 %23
  store i8 %21, i8* %24, align 1
  br label %25

25:                                               ; preds = %18
  %26 = load i64, i64* %4, align 8
  %27 = add i64 %26, 1
  store i64 %27, i64* %4, align 8
  br label %15

28:                                               ; preds = %15
  %29 = load i8*, i8** %1, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 99
  store i8 0, i8* %30, align 1
  %31 = load i8*, i8** %1, align 8
  call void @printLine(i8* %31)
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %6 = call i64 @time(i64* null) #4
  %7 = trunc i64 %6 to i32
  call void @srand(i32 %7) #4
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0))
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09_bad()
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"clang version 10.0.0-4ubuntu1~18.04.2 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"ThinLTO", i32 0}
!3 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!4 = !{i32 1, !"LTOPostLink", i32 1}
