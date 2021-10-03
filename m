Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD31629CA
	for <llvm@lists.linux.dev>; Sun,  3 Oct 2021 02:36:33 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w29so22853769wra.8
        for <llvm@lists.linux.dev>; Sat, 02 Oct 2021 19:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version;
        bh=S3rzNjf1W5RCWHXhm3Ws5w8hViE/zX6WF8f1kio3d0w=;
        b=WrT1TbJi5c2Lv2IGfG2/Q1Uu4/E8jDy3kvuo7Jjpq2aqKpajbuOJX9pdGuZaQHdeFW
         eif3jO+pNtQaqNxNFhYk1wZ98sni6ZbH3DzArKYjbQCbbSLDlZJso4mKvVrb7NTQWPaO
         qPJ5ectzfUJ5dyRZTW9f5T/fauVYehnadaoQk6PktolahqdykO9vUERq8OqELNyjpU7i
         JokZRiL9Mm4wegJ8/+ijOp1ECqukojL3tmdEq2QeMdiByPeRxYgwXvn7lXKODsr3uOXw
         rFlrPvqmlH+4JBy/gQxqwwaW9EhszpsuwTs5blr5ws2mN8j5rTfSOtYmS34BQ6krwN0f
         Iqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version;
        bh=S3rzNjf1W5RCWHXhm3Ws5w8hViE/zX6WF8f1kio3d0w=;
        b=PTPezQCLgGiqSVnuNFezZw6vAZyfpZfSx4JhjQueX4R6uhRNIm9d6VvmkGUUNKct/n
         BO2l3rMEL0RBhIBOrZ34uf88h7GA0skgU4YyNfrR4OQrSEoyYMVCPwEgRNEoCVIS35au
         2ajxMhC4pQuQ0L2hB1YW4qqQc9nHKsxcY5eN26D3dnLQcjGZuZxGgTOf6qR1DXFBINDB
         N8/cSb+KGTG81gvR9ilnZxlHm/Vy4OpRZZ3YYUjzTrT27sq9HwCqK/nk1kJYzPTHMIaJ
         l3QkR2Ev1ZhxbiqKpENzX1WEPv9l59VghibApbvhO9tj1ZW4jQYn0yrifdhDId+ojPRx
         fRnQ==
X-Gm-Message-State: AOAM533Os4sGcPaFzkfL5y00C2GSZLdAPfIT1vJdj4tJOmvkc2VFWk6b
	3DP+qunGI/YFgqBNIrGBxIBQGw==
X-Google-Smtp-Source: ABdhPJylkDrKKgQpT1SqwDekSrHqBymq1VzDNa+KpLlFZOgoFsmpSbvCTS3YWcb6eXs+Ygz63DqQ3g==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr1195379wrb.227.1633228591979;
        Sat, 02 Oct 2021 19:36:31 -0700 (PDT)
Received: from 172.17.0.5 (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id c18sm10743182wmb.27.2021.10.02.19.36.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Oct 2021 19:36:31 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 3 Oct 2021 02:36:30 +0000 (UTC)
To: serge-sans-paille <sguelton@redhat.com>
Cc: llvm@lists.linux.dev
Message-ID: <1385302180.8361.1633228591604@localhost>
Subject: [TCWG CI] Regression caused by llvm: Simplify handling of builtin
 with inline redefinition
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8360_839342912.1633228590718"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-lts-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_8360_839342912.1633228590718
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: Simplify handling of builtin with inline redefinition:
commit 3d6f49a56995b845c40be5827ded5d1e3f692cec
Author: serge-sans-paille <sguelton@redhat.com>

    Simplify handling of builtin with inline redefinition

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21157
# First few build errors in logs:
# 00:38:05 ld.lld: error: undefined symbol: memset.inline
# 00:38:05 ld.lld: error: undefined symbol: memcpy.inline
# 00:38:05 ld.lld: error: undefined symbol: memmove.inline
# 00:38:05 ld.lld: error: undefined symbol: memchr.inline
# 00:38:05 make: *** [Makefile:1179: vmlinux] Error 1

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
28996
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-lts-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allmodconfig/5/artifact/artifacts/build-3d6f49a56995b845c40be5827ded5d1e3f692cec/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allmodconfig/5/artifact/artifacts/build-5aa4c74c9a2ee3c4e6e87adfa2ef218c5aeed1d6/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allmodconfig/5/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allmodconfig/5/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-3d6f49a56995b845c40be5827ded5d1e3f692cec
cd investigate-llvm-3d6f49a56995b845c40be5827ded5d1e3f692cec

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allmodconfig/5/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allmodconfig/5/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allmodconfig/5/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 3d6f49a56995b845c40be5827ded5d1e3f692cec
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 5aa4c74c9a2ee3c4e6e87adfa2ef218c5aeed1d6
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 3d6f49a56995b845c40be5827ded5d1e3f692cec
Author: serge-sans-paille <sguelton@redhat.com>
Date:   Thu Sep 16 18:13:15 2021 +0200

    Simplify handling of builtin with inline redefinition
    
    It is a common practice in glibc header to provide an inline redefinition of an
    existing function. It is especially the case for fortified function.
    
    Clang currently has an imperfect approach to the problem, using a combination of
    trivially recursive function detection and noinline attribute.
    
    Simplify the logic by suffixing these functions by `.inline` during codegen, so
    that they are not recognized as builtin by llvm.
    
    After that patch, clang passes all tests from https://github.com/serge-sans-paille/fortify-test-suite
    
    Differential Revision: https://reviews.llvm.org/D109967
---
 clang/lib/CodeGen/CodeGenFunction.cpp              |  5 +++
 clang/lib/CodeGen/CodeGenModule.cpp                |  5 +++
 clang/test/CodeGen/memcpy-inline-builtin.c         | 44 ++++++++++++++++++++++
 .../CodeGen/memcpy-no-nobuiltin-if-not-emitted.c   | 25 ------------
 clang/test/CodeGen/memcpy-nobuiltin.c              |  3 +-
 clang/test/CodeGen/pr9614.c                        |  4 +-
 6 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/clang/lib/CodeGen/CodeGenFunction.cpp b/clang/lib/CodeGen/CodeGenFunction.cpp
index 5f63461aea96..fbb06885ba35 100644
--- a/clang/lib/CodeGen/CodeGenFunction.cpp
+++ b/clang/lib/CodeGen/CodeGenFunction.cpp
@@ -1301,6 +1301,11 @@ void CodeGenFunction::GenerateCode(GlobalDecl GD, llvm::Function *Fn,
   FunctionArgList Args;
   QualType ResTy = BuildFunctionArgList(GD, Args);
 
+  // Give a different name to inline builtin to avoid conflict with actual
+  // builtins.
+  if (FD->isInlineBuiltinDeclaration() && Fn)
+    Fn->setName(Fn->getName() + ".inline");
+
   // Check if we should generate debug info for this function.
   if (FD->hasAttr<NoDebugAttr>()) {
     // Clear non-distinct debug info that was possibly attached to the function
diff --git a/clang/lib/CodeGen/CodeGenModule.cpp b/clang/lib/CodeGen/CodeGenModule.cpp
index 9715657b4c6e..83418014f0b5 100644
--- a/clang/lib/CodeGen/CodeGenModule.cpp
+++ b/clang/lib/CodeGen/CodeGenModule.cpp
@@ -3169,6 +3169,11 @@ bool CodeGenModule::shouldEmitFunction(GlobalDecl GD) {
     }
   }
 
+  // Inline builtins declaration must be emitted. They often are fortified
+  // functions.
+  if (F->isInlineBuiltinDeclaration())
+    return true;
+
   // PR9614. Avoid cases where the source code is lying to us. An available
   // externally function should have an equivalent function somewhere else,
   // but a function that calls itself through asm label/`__builtin_` trickery is
diff --git a/clang/test/CodeGen/memcpy-inline-builtin.c b/clang/test/CodeGen/memcpy-inline-builtin.c
new file mode 100644
index 000000000000..814ce220195f
--- /dev/null
+++ b/clang/test/CodeGen/memcpy-inline-builtin.c
@@ -0,0 +1,44 @@
+// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
+
+// RUN: %clang_cc1 -triple x86_64 -S -emit-llvm -o - %s | FileCheck %s
+//
+// Verifies that clang detects memcpy inline version and uses it instead of the builtin.
+
+typedef unsigned long size_t;
+
+// Clang requires these attributes for a function to be redefined.
+#define AVAILABLE_EXTERNALLY extern inline __attribute__((always_inline)) __attribute__((gnu_inline))
+
+// Clang recognizes an inline builtin and renames it to prevent conflict with builtins.
+AVAILABLE_EXTERNALLY void *memcpy(void *a, const void *b, size_t c) {
+  asm("# memcpy.inline marker");
+  return __builtin_memcpy(a, b, c);
+}
+
+// CHECK-LABEL: @foo(
+// CHECK-NEXT:  entry:
+// CHECK-NEXT:    [[A_ADDR_I:%.*]] = alloca i8*, align 8
+// CHECK-NEXT:    [[B_ADDR_I:%.*]] = alloca i8*, align 8
+// CHECK-NEXT:    [[C_ADDR_I:%.*]] = alloca i64, align 8
+// CHECK-NEXT:    [[A_ADDR:%.*]] = alloca i8*, align 8
+// CHECK-NEXT:    [[B_ADDR:%.*]] = alloca i8*, align 8
+// CHECK-NEXT:    [[C_ADDR:%.*]] = alloca i64, align 8
+// CHECK-NEXT:    store i8* [[A:%.*]], i8** [[A_ADDR]], align 8
+// CHECK-NEXT:    store i8* [[B:%.*]], i8** [[B_ADDR]], align 8
+// CHECK-NEXT:    store i64 [[C:%.*]], i64* [[C_ADDR]], align 8
+// CHECK-NEXT:    [[TMP0:%.*]] = load i8*, i8** [[A_ADDR]], align 8
+// CHECK-NEXT:    [[TMP1:%.*]] = load i8*, i8** [[B_ADDR]], align 8
+// CHECK-NEXT:    [[TMP2:%.*]] = load i64, i64* [[C_ADDR]], align 8
+// CHECK-NEXT:    store i8* [[TMP0]], i8** [[A_ADDR_I]], align 8
+// CHECK-NEXT:    store i8* [[TMP1]], i8** [[B_ADDR_I]], align 8
+// CHECK-NEXT:    store i64 [[TMP2]], i64* [[C_ADDR_I]], align 8
+// CHECK-NEXT:    call void asm sideeffect "# memcpy.inline marker", "~{dirflag},~{fpsr},~{flags}"() #[[ATTR2:[0-9]+]], !srcloc !2
+// CHECK-NEXT:    [[TMP3:%.*]] = load i8*, i8** [[A_ADDR_I]], align 8
+// CHECK-NEXT:    [[TMP4:%.*]] = load i8*, i8** [[B_ADDR_I]], align 8
+// CHECK-NEXT:    [[TMP5:%.*]] = load i64, i64* [[C_ADDR_I]], align 8
+// CHECK-NEXT:    call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 [[TMP3]], i8* align 1 [[TMP4]], i64 [[TMP5]], i1 false) #[[ATTR2]]
+// CHECK-NEXT:    ret void
+//
+void foo(void *a, const void *b, size_t c) {
+  memcpy(a, b, c);
+}
diff --git a/clang/test/CodeGen/memcpy-no-nobuiltin-if-not-emitted.c b/clang/test/CodeGen/memcpy-no-nobuiltin-if-not-emitted.c
deleted file mode 100644
index d3a219a972d3..000000000000
--- a/clang/test/CodeGen/memcpy-no-nobuiltin-if-not-emitted.c
+++ /dev/null
@@ -1,25 +0,0 @@
-// RUN: %clang_cc1 -triple x86_64-unknown-unknown -S -emit-llvm -o - %s | FileCheck %s
-//
-// Verifies that clang doesn't mark an inline builtin definition as `nobuiltin`
-// if the builtin isn't emittable.
-
-typedef unsigned long size_t;
-
-// always_inline is used so clang will emit this body. Otherwise, we need >=
-// -O1.
-#define AVAILABLE_EXTERNALLY extern inline __attribute__((always_inline)) \
-    __attribute__((gnu_inline))
-
-AVAILABLE_EXTERNALLY void *memcpy(void *a, const void *b, size_t c) {
-  return __builtin_memcpy(a, b, c);
-}
-
-// CHECK-LABEL: define{{.*}} void @foo
-void foo(void *a, const void *b, size_t c) {
-  // Clang will always _emit_ this as memcpy. LLVM turns it into @llvm.memcpy
-  // later on if optimizations are enabled.
-  // CHECK: call i8* @memcpy
-  memcpy(a, b, c);
-}
-
-// CHECK-NOT: nobuiltin
diff --git a/clang/test/CodeGen/memcpy-nobuiltin.c b/clang/test/CodeGen/memcpy-nobuiltin.c
index fb51d87413a1..cbd0ccaa2ebb 100644
--- a/clang/test/CodeGen/memcpy-nobuiltin.c
+++ b/clang/test/CodeGen/memcpy-nobuiltin.c
@@ -4,7 +4,8 @@
 //
 // CHECK-WITH-DECL-NOT: @llvm.memcpy
 // CHECK-NO-DECL: @llvm.memcpy
-// CHECK-SELF-REF-DECL: @llvm.memcpy
+// CHECK-SELF-REF-DECL-LABEL: define dso_local i8* @memcpy.inline
+// CHECK-SELF-REF-DECL:       @memcpy(
 //
 #include <memcpy-nobuiltin.inc>
 void test(void *dest, void const *from, size_t n) {
diff --git a/clang/test/CodeGen/pr9614.c b/clang/test/CodeGen/pr9614.c
index c153283a8377..3674ba844aa1 100644
--- a/clang/test/CodeGen/pr9614.c
+++ b/clang/test/CodeGen/pr9614.c
@@ -32,14 +32,14 @@ void f(void) {
 
 // CHECK-LABEL: define{{.*}} void @f()
 // CHECK: call void @foo()
-// CHECK: call i32 @abs(i32 0)
+// CHECK: call i32 @abs(i32 %0)
 // CHECK: call i8* @strrchr(
 // CHECK: call void @llvm.prefetch.p0i8(
 // CHECK: call i8* @memchr(
 // CHECK: ret void
 
 // CHECK: declare void @foo()
-// CHECK: declare i32 @abs(i32
 // CHECK: declare i8* @strrchr(i8*, i32)
 // CHECK: declare i8* @memchr(
+// CHECK: declare i32 @abs(i32
 // CHECK: declare void @llvm.prefetch.p0i8(
</cut>
------=_Part_8360_839342912.1633228590718--
