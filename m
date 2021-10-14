Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378A12C83
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 23:47:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o24-20020a05600c511800b0030d9da600aeso874529wms.4
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 16:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version;
        bh=8VWJLujUfQYTlkJAG+diZaeX3ff9g9WjyMMtDQqugJ4=;
        b=U3sTu2QT8E7Z0ICTygR1sFH4A0R0DF8G8NysM28pF/vC99bMYeMrFItJrn4NouV6eQ
         DbwnsQ2Si57iWVFwpmJfufPpSdePzKPHP6sisSyVUhAtXC9Jw9SWj0bNe/rmZYWxmDyu
         cOlS1d+pSLL47OHGYwGmthO1T6D/nz/sx0hGnX6+3ApRMI8LeUFhJSjfNcQdH2SXhREN
         M5cz6VKUxSGRPxSZ+h0ynSs8PY1h3NmEodfQAGXS5GkiFLbWYvgLRpivNaJronsiuwx4
         7twuqnNs52g2hCWlAS5MaB9w95cg5lnT0027if5Av3GRZqYQsocaR90zFjdhunnPoctj
         7cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version;
        bh=8VWJLujUfQYTlkJAG+diZaeX3ff9g9WjyMMtDQqugJ4=;
        b=PbzWbgGCXL68tFrsKcwT7uZNKbTUxRTkd32RsCNwxYv+9/zEk5ARrgamPNvWCLIqRz
         iCsM8zYJaS6dlXu+CCgQwuO2Ha6L1/+dOKbIjJxDQzP+ieRTbltj2R1sGN4a0Ehss9ao
         7Nsx66odHPapdizz8vFKwrFIN2d8V/H3nzf3Ykd84RzlUIYzwEa4Z8k+waWvU6PXLmSh
         lBk9G814fJoXQSKcrevtbIY6jMogo6m80IELiDGGASsKQYQYKUXgyNh7VLTIon5G6FmI
         3mM2ISN7NR03kO97naJARPzIRh+/61UvheCA0uSJNYwfICAsmME5EhjzproOSZ53mLYy
         9mTg==
X-Gm-Message-State: AOAM530ham3T6DjTpFARYV9ljrksznQ2SHvP30ew7EZ2xFuQuHqwAXuO
	uJGPuFkTO6pv+gHbunB4I8XAIg==
X-Google-Smtp-Source: ABdhPJwjQlICsn7v7xEu5ao99h75MaANCZMnSnvufYCeVYDYYtSTmxe7yXAw3XIba3x6ypP72tMt1g==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr9210009wmc.165.1634255268265;
        Thu, 14 Oct 2021 16:47:48 -0700 (PDT)
Received: from 172.17.0.5 (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id w1sm9139892wmc.19.2021.10.14.16.47.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 16:47:47 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 14 Oct 2021 23:47:46 +0000 (UTC)
To: serge-sans-paille <sguelton@redhat.com>
Cc: llvm@lists.linux.dev
Message-ID: <1817774243.12566.1634255267713@localhost>
Subject: [TCWG CI] Regression caused by llvm: Update inline builtin handling
 to honor gnu inline attribute
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12565_35310421.1634255267000"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-mainline-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_12565_35310421.1634255267000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: Update inline builtin handling to honor gnu inline attribute:
commit 0f0e31cf511def3e92244e615b2646c1fd0df0cd
Author: serge-sans-paille <sguelton@redhat.com>

    Update inline builtin handling to honor gnu inline attribute

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
21871
# First few build errors in logs:
# 00:02:51 arch/arm/lib/xor-neon.c:30:2: error: This code requires at least version 4.6 of GCC [-Werror,-W#warnings]
# 00:02:51 make[1]: *** [scripts/Makefile.build:277: arch/arm/lib/xor-neon.o] Error 1
# 00:02:51 make: *** [Makefile:1868: arch/arm/lib] Error 2
# 00:03:31 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in function 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:03:31 make[1]: *** [scripts/Makefile.build:277: crypto/wp512.o] Error 1
# 00:05:33 make: *** [Makefile:1868: crypto] Error 2
# 00:11:16 drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
# 00:11:16 drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
# 00:11:16 make[4]: *** [scripts/Makefile.build:277: drivers/soc/tegra/fuse/speedo-tegra20.o] Error 1
# 00:11:20 make[3]: *** [scripts/Makefile.build:540: drivers/soc/tegra/fuse] Error 2

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
21873

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-mainline-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline-allmodconfig/18/artifact/artifacts/build-0f0e31cf511def3e92244e615b2646c1fd0df0cd/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline-allmodconfig/18/artifact/artifacts/build-a4bccf7afdd0c5d849cd640ad8be371c2a62da73/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline-allmodconfig/18/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline-allmodconfig/18/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-0f0e31cf511def3e92244e615b2646c1fd0df0cd
cd investigate-llvm-0f0e31cf511def3e92244e615b2646c1fd0df0cd

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline-allmodconfig/18/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline-allmodconfig/18/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline-allmodconfig/18/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 0f0e31cf511def3e92244e615b2646c1fd0df0cd
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach a4bccf7afdd0c5d849cd640ad8be371c2a62da73
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 0f0e31cf511def3e92244e615b2646c1fd0df0cd
Author: serge-sans-paille <sguelton@redhat.com>
Date:   Sat Oct 2 23:17:30 2021 +0200

    Update inline builtin handling to honor gnu inline attribute
    
    Per the GCC info page:
    
        If the function is declared 'extern', then this definition of the
        function is used only for inlining.  In no case is the function
        compiled as a standalone function, not even if you take its address
        explicitly.  Such an address becomes an external reference, as if
        you had only declared the function, and had not defined it.
    
    Respect that behavior for inline builtins: keep the original definition, and
    generate a copy of the declaration suffixed by '.inline' that's only referenced
    in direct call.
    
    This fixes holes in c3717b6858d32d64514a187ede1a77be8ba4e542.
    
    Differential Revision: https://reviews.llvm.org/D111009
---
 clang/lib/AST/Decl.cpp                             |  3 +-
 clang/lib/CodeGen/CGExpr.cpp                       | 27 +++++++++++++---
 clang/lib/CodeGen/CodeGenFunction.cpp              | 21 ++++++++++---
 clang/test/CodeGen/memcmp-inline-builtin-to-asm.c  | 36 ++++++++++++++++++++++
 .../test/CodeGen/memcpy-inline-builtin-no-extern.c | 29 +++++++++++++++++
 clang/test/CodeGen/memcpy-inline-builtin.c         | 34 +++++++++++++++++---
 clang/test/CodeGen/memcpy-nobuiltin.c              |  4 +--
 clang/test/CodeGen/memcpy-nobuiltin.inc            |  4 +--
 clang/test/CodeGen/pr9614.c                        |  4 +--
 9 files changed, 142 insertions(+), 20 deletions(-)

diff --git a/clang/lib/AST/Decl.cpp b/clang/lib/AST/Decl.cpp
index 60ca8633224b..6788f2132fbc 100644
--- a/clang/lib/AST/Decl.cpp
+++ b/clang/lib/AST/Decl.cpp
@@ -3177,7 +3177,8 @@ bool FunctionDecl::isInlineBuiltinDeclaration() const {
 
   const FunctionDecl *Definition;
   return hasBody(Definition) && Definition->isInlineSpecified() &&
-         Definition->hasAttr<AlwaysInlineAttr>();
+         Definition->hasAttr<AlwaysInlineAttr>() &&
+         Definition->hasAttr<GNUInlineAttr>();
 }
 
 bool FunctionDecl::isDestroyingOperatorDelete() const {
diff --git a/clang/lib/CodeGen/CGExpr.cpp b/clang/lib/CodeGen/CGExpr.cpp
index a62a4d60830d..6dd511acf105 100644
--- a/clang/lib/CodeGen/CGExpr.cpp
+++ b/clang/lib/CodeGen/CGExpr.cpp
@@ -4891,12 +4891,28 @@ static CGCallee EmitDirectCallee(CodeGenFunction &CGF, GlobalDecl GD) {
   const FunctionDecl *FD = cast<FunctionDecl>(GD.getDecl());
 
   if (auto builtinID = FD->getBuiltinID()) {
-    // Replaceable builtin provide their own implementation of a builtin. Unless
-    // we are in the builtin implementation itself, don't call the actual
-    // builtin. If we are in the builtin implementation, avoid trivial infinite
+    std::string FDInlineName = (FD->getName() + ".inline").str();
+    // When directing calling an inline builtin, call it through it's mangled
+    // name to make it clear it's not the actual builtin.
+    if (FD->isInlineBuiltinDeclaration() &&
+        CGF.CurFn->getName() != FDInlineName) {
+      llvm::Constant *CalleePtr = EmitFunctionDeclPointer(CGF.CGM, GD);
+      llvm::Function *Fn = llvm::cast<llvm::Function>(CalleePtr);
+      llvm::Module *M = Fn->getParent();
+      llvm::Function *Clone = M->getFunction(FDInlineName);
+      if (!Clone) {
+        Clone = llvm::Function::Create(Fn->getFunctionType(),
+                                       llvm::GlobalValue::InternalLinkage,
+                                       Fn->getAddressSpace(), FDInlineName, M);
+        Clone->addFnAttr(llvm::Attribute::AlwaysInline);
+      }
+      return CGCallee::forDirect(Clone, GD);
+    }
+
+    // Replaceable builtins provide their own implementation of a builtin. If we
+    // are in an inline builtin implementation, avoid trivial infinite
     // recursion.
-    if (!FD->isInlineBuiltinDeclaration() ||
-        CGF.CurFn->getName() == FD->getName())
+    else
       return CGCallee::forBuiltin(builtinID, FD);
   }
 
@@ -4905,6 +4921,7 @@ static CGCallee EmitDirectCallee(CodeGenFunction &CGF, GlobalDecl GD) {
       FD->hasAttr<CUDAGlobalAttr>())
     CalleePtr = CGF.CGM.getCUDARuntime().getKernelStub(
         cast<llvm::GlobalValue>(CalleePtr->stripPointerCasts()));
+
   return CGCallee::forDirect(CalleePtr, GD);
 }
 
diff --git a/clang/lib/CodeGen/CodeGenFunction.cpp b/clang/lib/CodeGen/CodeGenFunction.cpp
index da9a5303daad..13bc366b6c2f 100644
--- a/clang/lib/CodeGen/CodeGenFunction.cpp
+++ b/clang/lib/CodeGen/CodeGenFunction.cpp
@@ -45,6 +45,7 @@
 #include "llvm/Support/CRC.h"
 #include "llvm/Transforms/Scalar/LowerExpectIntrinsic.h"
 #include "llvm/Transforms/Utils/PromoteMemToReg.h"
+
 using namespace clang;
 using namespace CodeGen;
 
@@ -1294,10 +1295,22 @@ void CodeGenFunction::GenerateCode(GlobalDecl GD, llvm::Function *Fn,
   FunctionArgList Args;
   QualType ResTy = BuildFunctionArgList(GD, Args);
 
-  // Give a different name to inline builtin to avoid conflict with actual
-  // builtins.
-  if (FD->isInlineBuiltinDeclaration() && Fn)
-    Fn->setName(Fn->getName() + ".inline");
+  // When generating code for a builtin with an inline declaration, use a
+  // mangled name to hold the actual body, while keeping an external definition
+  // in case the function pointer is referenced somewhere.
+  if (FD->isInlineBuiltinDeclaration() && Fn) {
+    std::string FDInlineName = (Fn->getName() + ".inline").str();
+    llvm::Module *M = Fn->getParent();
+    llvm::Function *Clone = M->getFunction(FDInlineName);
+    if (!Clone) {
+      Clone = llvm::Function::Create(Fn->getFunctionType(),
+                                     llvm::GlobalValue::InternalLinkage,
+                                     Fn->getAddressSpace(), FDInlineName, M);
+      Clone->addFnAttr(llvm::Attribute::AlwaysInline);
+    }
+    Fn->setLinkage(llvm::GlobalValue::ExternalLinkage);
+    Fn = Clone;
+  }
 
   // Check if we should generate debug info for this function.
   if (FD->hasAttr<NoDebugAttr>()) {
diff --git a/clang/test/CodeGen/memcmp-inline-builtin-to-asm.c b/clang/test/CodeGen/memcmp-inline-builtin-to-asm.c
new file mode 100644
index 000000000000..7b90f03d45f2
--- /dev/null
+++ b/clang/test/CodeGen/memcmp-inline-builtin-to-asm.c
@@ -0,0 +1,36 @@
+// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
+
+// RUN: %clang_cc1 -triple x86_64 -S -emit-llvm -o - %s | opt -S -verify | FileCheck %s
+//
+// Verifies that clang detects memcmp inline version and uses it instead of the builtin.
+
+typedef unsigned long size_t;
+
+// Clang requires these attributes for a function to be redefined.
+#define AVAILABLE_EXTERNALLY extern inline __attribute__((always_inline)) __attribute__((gnu_inline))
+
+const void *con_unify_unimap_p1;
+
+AVAILABLE_EXTERNALLY
+int memcmp(const void *p, const void *q, unsigned long size) {
+  return __builtin_memcmp(p, q, size);
+}
+
+// CHECK-LABEL: @con_unify_unimap_q1(
+// CHECK-NEXT:  entry:
+// CHECK-NEXT:    [[P_ADDR_I:%.*]] = alloca i8*, align 8
+// CHECK-NEXT:    [[Q_ADDR_I:%.*]] = alloca i8*, align 8
+// CHECK-NEXT:    [[SIZE_ADDR_I:%.*]] = alloca i64, align 8
+// CHECK-NEXT:    [[TMP0:%.*]] = load i8*, i8** @con_unify_unimap_p1, align 8
+// CHECK-NEXT:    store i8* [[TMP0]], i8** [[P_ADDR_I]], align 8
+// CHECK-NEXT:    store i8* bitcast (i32 ()* @con_unify_unimap_q1 to i8*), i8** [[Q_ADDR_I]], align 8
+// CHECK-NEXT:    store i64 4, i64* [[SIZE_ADDR_I]], align 8
+// CHECK-NEXT:    [[TMP1:%.*]] = load i8*, i8** [[P_ADDR_I]], align 8
+// CHECK-NEXT:    [[TMP2:%.*]] = load i8*, i8** [[Q_ADDR_I]], align 8
+// CHECK-NEXT:    [[TMP3:%.*]] = load i64, i64* [[SIZE_ADDR_I]], align 8
+// CHECK-NEXT:    [[CALL_I:%.*]] = call i32 @memcmp(i8* [[TMP1]], i8* [[TMP2]], i64 [[TMP3]]) #[[ATTR3:[0-9]+]]
+// CHECK-NEXT:    ret i32 [[CALL_I]]
+//
+int con_unify_unimap_q1(void) {
+  return memcmp(con_unify_unimap_p1, con_unify_unimap_q1, sizeof(int));
+}
diff --git a/clang/test/CodeGen/memcpy-inline-builtin-no-extern.c b/clang/test/CodeGen/memcpy-inline-builtin-no-extern.c
new file mode 100644
index 000000000000..bb46e48f847b
--- /dev/null
+++ b/clang/test/CodeGen/memcpy-inline-builtin-no-extern.c
@@ -0,0 +1,29 @@
+// RUN: %clang_cc1 -triple x86_64 -S -emit-llvm -disable-llvm-passes -o - %s | FileCheck %s
+//
+// Verifies that clang-generated *.inline are flagged as internal.
+
+typedef unsigned long size_t;
+
+#define AVAILABLE_EXTERNALLY extern inline __attribute__((always_inline)) __attribute__((gnu_inline))
+// Clang recognizes an inline builtin and renames it to memcmp.inline to prevent conflict with builtins.
+AVAILABLE_EXTERNALLY int memcmp(const void *a, const void *b, size_t c) {
+  return __builtin_memcmp(a, b, c);
+}
+
+// CHECK: internal{{.*}}memcmp.inline
+int bar(const void *a, const void *b, size_t c) {
+  return memcmp(a, b, c);
+}
+
+// Note that extern has been omitted here.
+#define TRIPLE_INLINE inline __attribute__((always_inline)) __attribute__((gnu_inline))
+
+// Clang recognizes an inline builtin and renames it to memcpy.inline to prevent conflict with builtins.
+TRIPLE_INLINE void *memcpy(void *a, const void *b, size_t c) {
+  return __builtin_memcpy(a, b, c);
+}
+
+// CHECK: internal{{.*}}memcpy.inline
+void *foo(void *a, const void *b, size_t c) {
+  return memcpy(a, b, c);
+}
diff --git a/clang/test/CodeGen/memcpy-inline-builtin.c b/clang/test/CodeGen/memcpy-inline-builtin.c
index 814ce220195f..e63e77c8ba45 100644
--- a/clang/test/CodeGen/memcpy-inline-builtin.c
+++ b/clang/test/CodeGen/memcpy-inline-builtin.c
@@ -32,13 +32,39 @@ AVAILABLE_EXTERNALLY void *memcpy(void *a, const void *b, size_t c) {
 // CHECK-NEXT:    store i8* [[TMP0]], i8** [[A_ADDR_I]], align 8
 // CHECK-NEXT:    store i8* [[TMP1]], i8** [[B_ADDR_I]], align 8
 // CHECK-NEXT:    store i64 [[TMP2]], i64* [[C_ADDR_I]], align 8
-// CHECK-NEXT:    call void asm sideeffect "# memcpy.inline marker", "~{dirflag},~{fpsr},~{flags}"() #[[ATTR2:[0-9]+]], !srcloc !2
+// CHECK-NEXT:    call void asm sideeffect "# memcpy.inline marker", "~{dirflag},~{fpsr},~{flags}"() #[[ATTR4:[0-9]+]], !srcloc !2
 // CHECK-NEXT:    [[TMP3:%.*]] = load i8*, i8** [[A_ADDR_I]], align 8
 // CHECK-NEXT:    [[TMP4:%.*]] = load i8*, i8** [[B_ADDR_I]], align 8
 // CHECK-NEXT:    [[TMP5:%.*]] = load i64, i64* [[C_ADDR_I]], align 8
-// CHECK-NEXT:    call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 [[TMP3]], i8* align 1 [[TMP4]], i64 [[TMP5]], i1 false) #[[ATTR2]]
+// CHECK-NEXT:    call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 [[TMP3]], i8* align 1 [[TMP4]], i64 [[TMP5]], i1 false) #[[ATTR4]]
+// CHECK-NEXT:    ret i8* [[TMP3]]
+//
+void *foo(void *a, const void *b, size_t c) {
+  return memcpy(a, b, c);
+}
+
+// CHECK-LABEL: @bar(
+// CHECK-NEXT:  entry:
+// CHECK-NEXT:    [[A_ADDR:%.*]] = alloca i8*, align 8
+// CHECK-NEXT:    [[B_ADDR:%.*]] = alloca i8*, align 8
+// CHECK-NEXT:    [[C_ADDR:%.*]] = alloca i64, align 8
+// CHECK-NEXT:    [[CPY:%.*]] = alloca i8* (i8*, i8*, i64)*, align 8
+// CHECK-NEXT:    store i8* [[A:%.*]], i8** [[A_ADDR]], align 8
+// CHECK-NEXT:    store i8* [[B:%.*]], i8** [[B_ADDR]], align 8
+// CHECK-NEXT:    store i64 [[C:%.*]], i64* [[C_ADDR]], align 8
+// CHECK-NEXT:    [[TMP0:%.*]] = load i64, i64* [[C_ADDR]], align 8
+// CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i64 [[TMP0]], 10
+// CHECK-NEXT:    [[TMP1:%.*]] = zext i1 [[CMP]] to i64
+// CHECK-NEXT:    [[COND:%.*]] = select i1 [[CMP]], i8* (i8*, i8*, i64)* @memcpy, i8* (i8*, i8*, i64)* @foo
+// CHECK-NEXT:    store i8* (i8*, i8*, i64)* [[COND]], i8* (i8*, i8*, i64)** [[CPY]], align 8
+// CHECK-NEXT:    [[TMP2:%.*]] = load i8* (i8*, i8*, i64)*, i8* (i8*, i8*, i64)** [[CPY]], align 8
+// CHECK-NEXT:    [[TMP3:%.*]] = load i8*, i8** [[A_ADDR]], align 8
+// CHECK-NEXT:    [[TMP4:%.*]] = load i8*, i8** [[B_ADDR]], align 8
+// CHECK-NEXT:    [[TMP5:%.*]] = load i64, i64* [[C_ADDR]], align 8
+// CHECK-NEXT:    [[CALL:%.*]] = call i8* [[TMP2]](i8* [[TMP3]], i8* [[TMP4]], i64 [[TMP5]])
 // CHECK-NEXT:    ret void
 //
-void foo(void *a, const void *b, size_t c) {
-  memcpy(a, b, c);
+void bar(void *a, const void *b, size_t c) {
+  void *(*cpy)(void *, const void *, size_t) = c > 10 ? memcpy : foo;
+  cpy(a, b, c);
 }
diff --git a/clang/test/CodeGen/memcpy-nobuiltin.c b/clang/test/CodeGen/memcpy-nobuiltin.c
index d752df8ba0eb..fe93382393ab 100644
--- a/clang/test/CodeGen/memcpy-nobuiltin.c
+++ b/clang/test/CodeGen/memcpy-nobuiltin.c
@@ -1,11 +1,11 @@
 // RUN: %clang_cc1 -verify -S -emit-llvm -o- %s -isystem %S -DWITH_DECL | FileCheck --check-prefix=CHECK-WITH-DECL %s
 // RUN: %clang_cc1 -verify -S -emit-llvm -o- %s -isystem %S -UWITH_DECL | FileCheck --check-prefix=CHECK-NO-DECL %s
-// RUN: %clang_cc1 -verify -S -emit-llvm -o- %s -isystem %S -DWITH_SELF_REFERENCE_DECL | FileCheck --check-prefix=CHECK-SELF-REF-DECL %s
+// RUN: %clang_cc1 -verify -S -emit-llvm -o- %s -isystem %S -disable-llvm-passes -DWITH_SELF_REFERENCE_DECL | FileCheck --check-prefix=CHECK-SELF-REF-DECL %s
 //
 // CHECK-WITH-DECL-NOT: @llvm.memcpy
 // CHECK-NO-DECL: @llvm.memcpy
 // CHECK-SELF-REF-DECL-LABEL: define {{.*}}i8* @memcpy.inline
-// CHECK-SELF-REF-DECL:       @memcpy(
+// CHECK-SELF-REF-DECL:       @llvm.memcpy.{{.*}}(
 //
 #include <memcpy-nobuiltin.inc>
 void test(void *dest, void const *from, size_t n) {
diff --git a/clang/test/CodeGen/memcpy-nobuiltin.inc b/clang/test/CodeGen/memcpy-nobuiltin.inc
index d1d034c12899..06ecb108d93c 100644
--- a/clang/test/CodeGen/memcpy-nobuiltin.inc
+++ b/clang/test/CodeGen/memcpy-nobuiltin.inc
@@ -2,7 +2,7 @@
 extern void *memcpy(void *dest, void const *from, size_t n);
 
 #ifdef WITH_DECL
-inline __attribute__((always_inline)) void *memcpy(void *dest, void const *from, size_t n) {
+inline __attribute__((always_inline)) __attribute__((gnu_inline)) void *memcpy(void *dest, void const *from, size_t n) {
   char const *ifrom = from;
   char *idest = dest;
   while (n--)
@@ -11,7 +11,7 @@ inline __attribute__((always_inline)) void *memcpy(void *dest, void const *from,
 }
 #endif
 #ifdef WITH_SELF_REFERENCE_DECL
-inline __attribute__((always_inline)) void *memcpy(void *dest, void const *from, size_t n) {
+inline __attribute__((always_inline)) __attribute__((gnu_inline)) void *memcpy(void *dest, void const *from, size_t n) {
   if (n != 0)
     memcpy(dest, from, n);
   return dest;
diff --git a/clang/test/CodeGen/pr9614.c b/clang/test/CodeGen/pr9614.c
index 3674ba844aa1..c153283a8377 100644
--- a/clang/test/CodeGen/pr9614.c
+++ b/clang/test/CodeGen/pr9614.c
@@ -32,14 +32,14 @@ void f(void) {
 
 // CHECK-LABEL: define{{.*}} void @f()
 // CHECK: call void @foo()
-// CHECK: call i32 @abs(i32 %0)
+// CHECK: call i32 @abs(i32 0)
 // CHECK: call i8* @strrchr(
 // CHECK: call void @llvm.prefetch.p0i8(
 // CHECK: call i8* @memchr(
 // CHECK: ret void
 
 // CHECK: declare void @foo()
+// CHECK: declare i32 @abs(i32
 // CHECK: declare i8* @strrchr(i8*, i32)
 // CHECK: declare i8* @memchr(
-// CHECK: declare i32 @abs(i32
 // CHECK: declare void @llvm.prefetch.p0i8(
</cut>
------=_Part_12565_35310421.1634255267000--
