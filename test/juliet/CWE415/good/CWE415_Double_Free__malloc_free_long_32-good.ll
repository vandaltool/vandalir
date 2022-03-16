; ModuleID = './test/Juliet/CWE415/good/CWE415_Double_Free__malloc_free_long_32-good.bc'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @CWE415_Double_Free__malloc_free_long_32_good() #0 {
  call void @goodG2B()
  call void @goodB2G()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i64**, align 8
  %3 = alloca i64**, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  store i64** %1, i64*** %2, align 8
  store i64** %1, i64*** %3, align 8
  store i64* null, i64** %1, align 8
  %6 = load i64**, i64*** %2, align 8
  %7 = load i64*, i64** %6, align 8
  store i64* %7, i64** %4, align 8
  %8 = call noalias i8* @malloc(i64 800) #4
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64** %4, align 8
  %10 = load i64*, i64** %4, align 8
  %11 = icmp eq i64* %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %0
  call void @exit(i32 -1) #5
  unreachable

13:                                               ; preds = %0
  %14 = load i64*, i64** %4, align 8
  %15 = load i64**, i64*** %2, align 8
  store i64* %14, i64** %15, align 8
  %16 = load i64**, i64*** %3, align 8
  %17 = load i64*, i64** %16, align 8
  store i64* %17, i64** %5, align 8
  %18 = load i64*, i64** %5, align 8
  %19 = bitcast i64* %18 to i8*
  call void @free(i8* %19) #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodB2G() #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i64**, align 8
  %3 = alloca i64**, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64*, align 8
  store i64** %1, i64*** %2, align 8
  store i64** %1, i64*** %3, align 8
  store i64* null, i64** %1, align 8
  %6 = load i64**, i64*** %2, align 8
  %7 = load i64*, i64** %6, align 8
  store i64* %7, i64** %4, align 8
  %8 = call noalias i8* @malloc(i64 800) #4
  %9 = bitcast i8* %8 to i64*
  store i64* %9, i64** %4, align 8
  %10 = load i64*, i64** %4, align 8
  %11 = icmp eq i64* %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %0
  call void @exit(i32 -1) #5
  unreachable

13:                                               ; preds = %0
  %14 = load i64*, i64** %4, align 8
  %15 = bitcast i64* %14 to i8*
  call void @free(i8* %15) #4
  %16 = load i64*, i64** %4, align 8
  %17 = load i64**, i64*** %2, align 8
  store i64* %16, i64** %17, align 8
  %18 = load i64**, i64*** %3, align 8
  %19 = load i64*, i64** %18, align 8
  store i64* %19, i64** %5, align 8
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0))
  call void @CWE415_Double_Free__malloc_free_long_32_good()
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

declare dso_local void @printLine(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"ThinLTO", i32 0}
!3 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!4 = !{i32 1, !"LTOPostLink", i32 1}
