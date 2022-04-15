Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD66C320E
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 11:35:25 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g18so10341357wrb.10
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=hyM5VmTreUctOEFR4hlC/IIeuhadASPebWSZ2wKzIe0=;
        b=jHpq06oXA3lbaCe6p6e4WitxKa+EhIEx2a78dnCvWdOu+yFTWz8hRd757APqozDq0d
         WhTJEzyaHUWjlkYKfwU2lNjIINDEt+U+/Hv6mX3KXXmbqcWmweXci8d2lCZDcOVp5v6+
         P0qVeivTIKfvrHmjRus0sI+V2tvRp1eucQi6qRGTzpKSwYBdTir8hqyNPKg4dNtakMDn
         upFmEKkvvEG0hEywfOSZTarcVU+gCy77TcCn7e8c3ANuZUEjSbj3dqDcOu/HxE7ibTXl
         TpnDgOBIriS9j9wt/xX/g6PhwayYOH1na0MnhQU1c1K9VVODmD53u6NZ3JqCflV2Z6Bn
         EuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=hyM5VmTreUctOEFR4hlC/IIeuhadASPebWSZ2wKzIe0=;
        b=6Q3FLdfK5o42YjPRJjTvVbp+oOu05ONgADmMuWCaxjV5k4a37C4yJILgIyxoavQ+nA
         5vNfbMRVELeqTdY6LWanMzTidNZ3nyGbRwsGs4x4nra8AKnY5+wdj6i2FlwvwGKPZCiV
         hpVQ7KWMROGtYIDk/QvNz2yLU48qcbwScBi7dpYz5vRfQspnJkPnf7Ilxuc2sURpmIeh
         Aci2PGsAe350xy4dCSYd03l38OanQauWN7RSTMln9neoH4suY80Gms3jyz3QL8faGAZd
         cNVNNsCyhlXpiu54xVIeeSZw6lxi/c7RYfKzozYwC/MfJs5MABOix3kyKtTwIwtxXHWP
         VD7g==
X-Gm-Message-State: AOAM531GYt3rZqQ/581q9yrnTki6zR0Vl07mE7qQ4oa+A43a+VGbSo+4
	scpxKvcX70SPvvAdwWQx8NN78Q==
X-Google-Smtp-Source: ABdhPJzQG791OuHXcb2nCjDcVn9BqyohprwOyaFbzhgDuXaucbS/ZKYzahRaO5GJzJ3DB/VuKjeXEA==
X-Received: by 2002:adf:ee92:0:b0:207:ac81:58ca with SMTP id b18-20020adfee92000000b00207ac8158camr5392112wro.576.1650022523794;
        Fri, 15 Apr 2022 04:35:23 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d6785000000b0020a792848eesm2316918wru.82.2022.04.15.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 04:35:22 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 15 Apr 2022 11:35:22 +0000 (UTC)
To: Eli Friedman <efriedma@quicinc.com>
Cc: llvm@lists.linux.dev
Message-ID: <906914372.14298.1650022522881@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: Allow flexible array
 initialization in C++.
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_14297_1475532597.1650022522252"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-next-defconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_14297_1475532597.1650022522252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: Allow flexible array initialization in C++.:
commit 5955a0f9375a8c0b134eeb4a8de5155dcce7c94f
Author: Eli Friedman <efriedma@quicinc.com>

    Allow flexible array initialization in C++.

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
6464
# First few build errors in logs:
# 00:03:47 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:03:47 make[2]: *** [scripts/Makefile.build:286: kernel/cgroup/cgroup.o] Error 134
# 00:03:50 make[1]: *** [scripts/Makefile.build:593: kernel/cgroup] Error 2
# 00:04:52 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:04:53 make[1]: *** [scripts/Makefile.build:286: mm/init-mm.o] Error 134
# 00:05:20 make: *** [Makefile:1994: mm] Error 2
# 00:05:36 make: *** [Makefile:1994: kernel] Error 2
# 00:05:40 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:05:41 make[3]: *** [scripts/Makefile.build:286: drivers/clk/bcm/clk-bcm281xx.o] Error 134
# 00:05:58 make[2]: *** [scripts/Makefile.build:593: drivers/clk/bcm] Error 2

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
7276
# linux build successful:
all
# linux boot successful:
boot

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-next-defconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/7/artifact/artifacts/build-5955a0f9375a8c0b134eeb4a8de5155dcce7c94f/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/7/artifact/artifacts/build-234678fbf9cf05c232221bb8253ed658507f3b49/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/7/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/7/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-5955a0f9375a8c0b134eeb4a8de5155dcce7c94f
cd investigate-llvm-5955a0f9375a8c0b134eeb4a8de5155dcce7c94f

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/7/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/7/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/7/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 5955a0f9375a8c0b134eeb4a8de5155dcce7c94f
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 234678fbf9cf05c232221bb8253ed658507f3b49
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 5955a0f9375a8c0b134eeb4a8de5155dcce7c94f
Author: Eli Friedman <efriedma@quicinc.com>
Date:   Thu Apr 14 11:56:40 2022 -0700

    Allow flexible array initialization in C++.
    
    Flexible array initialization is a C/C++ extension implemented in many
    compilers to allow initializing the flexible array tail of a struct type
    that contains a flexible array. In clang, this is currently restricted
    to C. But this construct is used in the Microsoft SDK headers, so I'd
    like to extend it to C++.
    
    For now, this doesn't handle dynamic initialization; probably not hard
    to implement, but it's extra code, and I don't think it's necessary for
    the expected uses.  And we explicitly fail out of constant evaluation.
    
    I've added some additional code to assert that initializers have the
    correct size, with or without flexible array init. This might catch
    issues unrelated to flexible array init.
    
    Differential Revision: https://reviews.llvm.org/D123649
---
 clang/include/clang/AST/Decl.h                   |  8 ++++++++
 clang/include/clang/Basic/DiagnosticASTKinds.td  |  2 ++
 clang/lib/AST/Decl.cpp                           | 15 +++++++++++++++
 clang/lib/AST/ExprConstant.cpp                   | 11 +++++++++++
 clang/lib/CodeGen/CGDecl.cpp                     | 10 ++++++++++
 clang/lib/CodeGen/CodeGenModule.cpp              | 10 ++++++++++
 clang/lib/Sema/SemaInit.cpp                      |  4 ----
 clang/test/CodeGenCXX/flexible-array-init.cpp    | 20 ++++++++++++++++++++
 clang/test/SemaCXX/constant-expression-cxx11.cpp |  8 +++++---
 9 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/clang/include/clang/AST/Decl.h b/clang/include/clang/AST/Decl.h
index 21a854592038..5816a91bd0c2 100644
--- a/clang/include/clang/AST/Decl.h
+++ b/clang/include/clang/AST/Decl.h
@@ -1591,6 +1591,14 @@ public:
   /// kind?
   QualType::DestructionKind needsDestruction(const ASTContext &Ctx) const;
 
+  /// If this variable declares a struct with a flexible array member, and
+  /// the flexible array member is initialized with one or more elements,
+  /// compute the number of bytes necessary to store those elements.
+  ///
+  /// (The standard doesn't allow initializing flexible array members; this is
+  /// a gcc/msvc extension.)
+  CharUnits getFlexibleArrayInitChars(const ASTContext &Ctx) const;
+
   // Implement isa/cast/dyncast/etc.
   static bool classof(const Decl *D) { return classofKind(D->getKind()); }
   static bool classofKind(Kind K) { return K >= firstVar && K <= lastVar; }
diff --git a/clang/include/clang/Basic/DiagnosticASTKinds.td b/clang/include/clang/Basic/DiagnosticASTKinds.td
index 930264a49549..5e694c6ad07b 100644
--- a/clang/include/clang/Basic/DiagnosticASTKinds.td
+++ b/clang/include/clang/Basic/DiagnosticASTKinds.td
@@ -364,6 +364,8 @@ def note_constexpr_memory_leak : Note<
   "%plural{0:|: (along with %0 other memory leak%s0)}0">;
 def note_constexpr_unsupported_layout : Note<
   "type %0 has unexpected layout">;
+def note_constexpr_unsupported_flexible_array : Note<
+  "flexible array initialization is not yet supported">;
 def err_experimental_clang_interp_failed : Error<
   "the experimental clang interpreter failed to evaluate an expression">;
 
diff --git a/clang/lib/AST/Decl.cpp b/clang/lib/AST/Decl.cpp
index c651fa22a035..915d8db10aca 100644
--- a/clang/lib/AST/Decl.cpp
+++ b/clang/lib/AST/Decl.cpp
@@ -2722,6 +2722,21 @@ VarDecl::needsDestruction(const ASTContext &Ctx) const {
   return getType().isDestructedType();
 }
 
+CharUnits VarDecl::getFlexibleArrayInitChars(const ASTContext &Ctx) const {
+  assert(hasInit() && "Expect initializer to check for flexible array init");
+  auto *Ty = getType()->getAs<RecordType>();
+  if (!Ty || !Ty->getDecl()->hasFlexibleArrayMember())
+    return CharUnits::Zero();
+  auto *List = dyn_cast<InitListExpr>(getInit()->IgnoreParens());
+  if (!List)
+    return CharUnits::Zero();
+  auto FlexibleInit = List->getInit(List->getNumInits() - 1);
+  auto InitTy = Ctx.getAsConstantArrayType(FlexibleInit->getType());
+  if (!InitTy)
+    return CharUnits::Zero();
+  return Ctx.getTypeSizeInChars(InitTy);
+}
+
 MemberSpecializationInfo *VarDecl::getMemberSpecializationInfo() const {
   if (isStaticDataMember())
     // FIXME: Remove ?
diff --git a/clang/lib/AST/ExprConstant.cpp b/clang/lib/AST/ExprConstant.cpp
index 50d6340ed31f..6fe5d77a33fe 100644
--- a/clang/lib/AST/ExprConstant.cpp
+++ b/clang/lib/AST/ExprConstant.cpp
@@ -9980,6 +9980,17 @@ bool RecordExprEvaluator::VisitInitListExpr(const InitListExpr *E) {
     ImplicitValueInitExpr VIE(HaveInit ? Info.Ctx.IntTy : Field->getType());
     const Expr *Init = HaveInit ? E->getInit(ElementNo++) : &VIE;
 
+    if (Field->getType()->isIncompleteArrayType()) {
+      if (auto *CAT = Info.Ctx.getAsConstantArrayType(Init->getType())) {
+        if (!CAT->getSize().isZero()) {
+          // Bail out for now. This might sort of "work", but the rest of the
+          // code isn't really prepared to handle it.
+          Info.FFDiag(Init, diag::note_constexpr_unsupported_flexible_array);
+          return false;
+        }
+      }
+    }
+
     // Temporarily override This, in case there's a CXXDefaultInitExpr in here.
     ThisOverrideRAII ThisOverride(*Info.CurrentCall, &This,
                                   isa<CXXDefaultInitExpr>(Init));
diff --git a/clang/lib/CodeGen/CGDecl.cpp b/clang/lib/CodeGen/CGDecl.cpp
index 1f5bdec384db..a95042514d8c 100644
--- a/clang/lib/CodeGen/CGDecl.cpp
+++ b/clang/lib/CodeGen/CGDecl.cpp
@@ -342,6 +342,8 @@ CodeGenFunction::AddInitializerToStaticVarDecl(const VarDecl &D,
   if (!Init) {
     if (!getLangOpts().CPlusPlus)
       CGM.ErrorUnsupported(D.getInit(), "constant l-value expression");
+    else if (!D.getFlexibleArrayInitChars(getContext()).isZero())
+      CGM.ErrorUnsupported(D.getInit(), "flexible array initializer");
     else if (HaveInsertPoint()) {
       // Since we have a static initializer, this global variable can't
       // be constant.
@@ -352,6 +354,14 @@ CodeGenFunction::AddInitializerToStaticVarDecl(const VarDecl &D,
     return GV;
   }
 
+#ifndef NDEBUG
+  CharUnits VarSize = CGM.getContext().getTypeSizeInChars(D.getType()) +
+                      D.getFlexibleArrayInitChars(getContext());
+  CharUnits CstSize = CharUnits::fromQuantity(
+      CGM.getDataLayout().getTypeAllocSize(Init->getType()));
+  assert(VarSize == CstSize && "Emitted constant has unexpected size");
+#endif
+
   // The initializer may differ in type from the global. Rewrite
   // the global to match the initializer.  (We have to do this
   // because some types, like unions, can't be completely represented
diff --git a/clang/lib/CodeGen/CodeGenModule.cpp b/clang/lib/CodeGen/CodeGenModule.cpp
index 76094c73a927..dbbbf7fd554b 100644
--- a/clang/lib/CodeGen/CodeGenModule.cpp
+++ b/clang/lib/CodeGen/CodeGenModule.cpp
@@ -4615,6 +4615,8 @@ void CodeGenModule::EmitGlobalVarDefinition(const VarDecl *D,
         T = D->getType();
 
       if (getLangOpts().CPlusPlus) {
+        if (!InitDecl->getFlexibleArrayInitChars(getContext()).isZero())
+          ErrorUnsupported(D, "flexible array initializer");
         Init = EmitNullConstant(T);
         NeedsGlobalCtor = true;
       } else {
@@ -4628,6 +4630,14 @@ void CodeGenModule::EmitGlobalVarDefinition(const VarDecl *D,
       // also don't need to register a destructor.
       if (getLangOpts().CPlusPlus && !NeedsGlobalDtor)
         DelayedCXXInitPosition.erase(D);
+
+#ifndef NDEBUG
+      CharUnits VarSize = getContext().getTypeSizeInChars(ASTTy) +
+                          InitDecl->getFlexibleArrayInitChars(getContext());
+      CharUnits CstSize = CharUnits::fromQuantity(
+          getDataLayout().getTypeAllocSize(Init->getType()));
+      assert(VarSize == CstSize && "Emitted constant has unexpected size");
+#endif
     }
   }
 
diff --git a/clang/lib/Sema/SemaInit.cpp b/clang/lib/Sema/SemaInit.cpp
index 119a90deb9c2..c3bbefbaaed1 100644
--- a/clang/lib/Sema/SemaInit.cpp
+++ b/clang/lib/Sema/SemaInit.cpp
@@ -2004,10 +2004,6 @@ bool InitListChecker::CheckFlexibleArrayInit(const InitializedEntity &Entity,
       cast<InitListExpr>(InitExpr)->getNumInits() == 0) {
     // Empty flexible array init always allowed as an extension
     FlexArrayDiag = diag::ext_flexible_array_init;
-  } else if (SemaRef.getLangOpts().CPlusPlus) {
-    // Disallow flexible array init in C++; it is not required for gcc
-    // compatibility, and it needs work to IRGen correctly in general.
-    FlexArrayDiag = diag::err_flexible_array_init;
   } else if (!TopLevelObject) {
     // Disallow flexible array init on non-top-level object
     FlexArrayDiag = diag::err_flexible_array_init;
diff --git a/clang/test/CodeGenCXX/flexible-array-init.cpp b/clang/test/CodeGenCXX/flexible-array-init.cpp
new file mode 100644
index 000000000000..af8486d9d3b5
--- /dev/null
+++ b/clang/test/CodeGenCXX/flexible-array-init.cpp
@@ -0,0 +1,20 @@
+// RUN: %clang_cc1 -triple i386-unknown-unknown -emit-llvm -o - %s | FileCheck %s
+// RUN: %clang_cc1 -triple i386-unknown-unknown -emit-llvm-only -verify -DFAIL1 %s
+// RUN: %clang_cc1 -triple i386-unknown-unknown -emit-llvm-only -verify -DFAIL2 %s
+
+struct A { int x; int y[]; };
+A a = { 1, 7, 11 };
+// CHECK: @a ={{.*}} global { i32, [2 x i32] } { i32 1, [2 x i32] [i32 7, i32 11] }
+
+A b = { 1, { 13, 15 } };
+// CHECK: @b ={{.*}} global { i32, [2 x i32] } { i32 1, [2 x i32] [i32 13, i32 15] }
+
+int f();
+#ifdef FAIL1
+A c = { f(), { f(), f() } }; // expected-error {{cannot compile this flexible array initializer yet}}
+#endif
+#ifdef FAIL2
+void g() {
+  static A d = { f(), { f(), f() } }; // expected-error {{cannot compile this flexible array initializer yet}}
+}
+#endif
diff --git a/clang/test/SemaCXX/constant-expression-cxx11.cpp b/clang/test/SemaCXX/constant-expression-cxx11.cpp
index 680b2d5307be..733653af6369 100644
--- a/clang/test/SemaCXX/constant-expression-cxx11.cpp
+++ b/clang/test/SemaCXX/constant-expression-cxx11.cpp
@@ -2383,9 +2383,11 @@ namespace flexible_array {
   static_assert(b[2].x == 3, "");
   static_assert(b[2].arr[0], ""); // expected-error {{constant expression}} expected-note {{array member without known bound}}
 
-  // If we ever start to accept this, we'll need to ensure we can
-  // constant-evaluate it properly.
-  constexpr A c = {1, 2, 3}; // expected-error {{initialization of flexible array member}}
+  // Flexible array initialization is currently not supported by constant
+  // evaluation. Make sure we emit an error message, for now.
+  constexpr A c = {1, 2, 3}; // expected-error {{constexpr variable 'c' must be initialized by a constant expression}}
+  // expected-note@-1 {{flexible array initialization is not yet supported}}
+  // expected-warning@-2 {{flexible array initialization is a GNU extension}}
 }
 
 void local_constexpr_var() {
</cut>
------=_Part_14297_1475532597.1650022522252--
