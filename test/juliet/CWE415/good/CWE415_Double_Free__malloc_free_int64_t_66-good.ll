; ModuleID = './test/Juliet/CWE415/good/CWE415_Double_Free__malloc_free_int64_t_66-good.bc'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @CWE415_Double_Free__malloc_free_int64_t_66_good() #0 {
  call void @goodG2B()
  call void @goodB2G()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 {
  %1 = alloca i64*, align 8
  %2 = alloca [5 x i64*], align 16
  store i64* null, i64** %1, align 8
  %3 = call noalias i8* @malloc(i64 800) #4
  %4 = bitcast i8* %3 to i64*
  store i64* %4, i64** %1, align 8
  %5 = load i64*, i64** %1, align 8
  %6 = icmp eq i64* %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %0
  call void @exit(i32 -1) #5
  unreachable

8:                                                ; preds = %0
  %9 = load i64*, i64** %1, align 8
  %10 = getelementptr inbounds [5 x i64*], [5 x i64*]* %2, i64 0, i64 2
  store i64* %9, i64** %10, align 16
  %11 = getelementptr inbounds [5 x i64*], [5 x i64*]* %2, i64 0, i64 0
  call void @CWE415_Double_Free__malloc_free_int64_t_66b_goodG2BSink(i64** %11)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodB2G() #0 {
  %1 = alloca i64*, align 8
  %2 = alloca [5 x i64*], align 16
  store i64* null, i64** %1, align 8
  %3 = call noalias i8* @malloc(i64 800) #4
  %4 = bitcast i8* %3 to i64*
  store i64* %4, i64** %1, align 8
  %5 = load i64*, i64** %1, align 8
  %6 = icmp eq i64* %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %0
  call void @exit(i32 -1) #5
  unreachable

8:                                                ; preds = %0
  %9 = load i64*, i64** %1, align 8
  %10 = bitcast i64* %9 to i8*
  call void @free(i8* %10) #4
  %11 = load i64*, i64** %1, align 8
  %12 = getelementptr inbounds [5 x i64*], [5 x i64*]* %2, i64 0, i64 2
  store i64* %11, i64** %12, align 16
  %13 = getelementptr inbounds [5 x i64*], [5 x i64*]* %2, i64 0, i64 0
  call void @CWE415_Double_Free__malloc_free_int64_t_66b_goodB2GSink(i64** %13)
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
  call void @CWE415_Double_Free__malloc_free_int64_t_66_good()
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @CWE415_Double_Free__malloc_free_int64_t_66b_goodG2BSink(i64** %0) #0 {
  %2 = alloca i64**, align 8
  %3 = alloca i64*, align 8
  store i64** %0, i64*** %2, align 8
  %4 = load i64**, i64*** %2, align 8
  %5 = getelementptr inbounds i64*, i64** %4, i64 2
  %6 = load i64*, i64** %5, align 8
  store i64* %6, i64** %3, align 8
  %7 = load i64*, i64** %3, align 8
  %8 = bitcast i64* %7 to i8*
  call void @free(i8* %8) #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @CWE415_Double_Free__malloc_free_int64_t_66b_goodB2GSink(i64** %0) #0 {
  %2 = alloca i64**, align 8
  %3 = alloca i64*, align 8
  store i64** %0, i64*** %2, align 8
  %4 = load i64**, i64*** %2, align 8
  %5 = getelementptr inbounds i64*, i64** %4, i64 2
  %6 = load i64*, i64** %5, align 8
  store i64* %6, i64** %3, align 8
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"ThinLTO", i32 0}
!3 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!4 = !{i32 1, !"LTOPostLink", i32 1}
