Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648CE2C80
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 06:16:52 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v6so2205890wra.8
        for <llvm@lists.linux.dev>; Tue, 11 Jan 2022 22:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=Ma6tiYf/3r8SUQykqSKWfVptFpuCt6CAPHcxlqn2ekE=;
        b=Q3h7NZv5vfqtSrRkQ47GXYOTEdJW94aXwOTBcmVroOTtTSKiGNL5ZS1eafC4pKv6do
         vgyrvBJFoRoGRp2ig4HMIjKIsPBlg5+Cicw8wtlkyuNT3yFdTS99rO4XmAOV7VmcwcKp
         DNIalxrY6HfJ4+wbNUzaiQcmffnH/Q949yga87LYe1tu8zKhLUmUYWDCgx0njD5Z0yYJ
         ddZw99uSjM6oeAr/bNCjvrgg2V1gmrXpRu+5G0bEhyOI7IIYEFJ1IbzR+cL0/SR23eun
         5jBOlmWnlLL2HhH2H6TrTWnDNvcH0dQ2PhsCh6AzwLOQ8SBt/DizTXYNzk6QGGGwxTxy
         NvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=Ma6tiYf/3r8SUQykqSKWfVptFpuCt6CAPHcxlqn2ekE=;
        b=IsN+GDvi+tQPNYnfCYVysY7BKcafeNNjg06ekG28x6zei9JebEtyGQ72Xo3fQtiifT
         J34NbsscAaGUq2fkhjs+tc2D89YQdeThlIE0080MabCJlYtQb4DWq5X15MfWP7wlzE6q
         mSPD16jIIPaxj18I8qAbbuIjmO/oSpDK3kAoKpfdCrLei9q2P3p8f6g0RJEo9uIwLU6N
         jrgoZrO5cy4ExqBgwNvl6geq+VSOSQPZBHEU/gS+VRMmiyYGn21WEgXfppueXYaOtjat
         5+NJVAA1OeyfYjaJ+HryW8KdGlsaZCafc7XKZmke9cDHycS49OqiFwNuSrKbFIJFogNi
         nuZg==
X-Gm-Message-State: AOAM531zzHyW1IdMN3HYxHEPvtUnrrupckoB0YF7fpz3R+Jz0Oe/n7Eu
	K/IBkPKb2EBOiJYYLVm0hoTmrQ==
X-Google-Smtp-Source: ABdhPJwm0wb1ibLYsEIfvNbumftBqz1X3pEtXIKWw7Di5lk72Yeem7tFXdgDp7aOkRgSp24kC9843g==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr6471279wrq.515.1641968210277;
        Tue, 11 Jan 2022 22:16:50 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id l10sm3454805wmq.7.2022.01.11.22.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 22:16:49 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 12 Jan 2022 06:16:48 +0000 (UTC)
To: Roman Lebedev <lebedev.ri@gmail.com>
Cc: llvm@lists.linux.dev
Message-ID: <1113802202.11035.1641968209817@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [SCEV] Sequential/in-order
 `UMin` expression
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_11034_1401630460.1641968209100"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-lts-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_11034_1401630460.1641968209100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [SCEV] Sequential/in-order `UMin` expression:
commit 82fb4f4b223d78e86647f3576e41e3086ab42cd5
Author: Roman Lebedev <lebedev.ri@gmail.com>

    [SCEV] Sequential/in-order `UMin` expression

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
19898
# First few build errors in logs:
# 00:04:46 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:04:46 make[1]: *** [scripts/Makefile.build:277: crypto/wp512.o] Error 1
# 00:05:01 clang-14: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:05:01 make[3]: *** [scripts/Makefile.build:277: sound/core/oss/route.o] Error 134
# 00:05:03 make[2]: *** [scripts/Makefile.build:540: sound/core/oss] Error 2
# 00:05:04 arch/arm/lib/xor-neon.c:30:2: error: This code requires at least version 4.6 of GCC [-Werror,-W#warnings]
# 00:05:04 make[1]: *** [scripts/Makefile.build:277: arch/arm/lib/xor-neon.o] Error 1
# 00:05:04 make: *** [Makefile:1868: arch/arm/lib] Error 2
# 00:06:37 make[1]: *** [scripts/Makefile.build:540: sound/core] Error 2
# 00:07:21 make: *** [Makefile:1868: crypto] Error 2

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
19899

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-lts-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/9/artifact/artifacts/build-82fb4f4b223d78e86647f3576e41e3086ab42cd5/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/9/artifact/artifacts/build-07a0b0ee94880cc193f3c63ebe3c4662c3123606/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/9/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/9/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-82fb4f4b223d78e86647f3576e41e3086ab42cd5
cd investigate-llvm-82fb4f4b223d78e86647f3576e41e3086ab42cd5

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/9/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/9/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/9/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 82fb4f4b223d78e86647f3576e41e3086ab42cd5
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 07a0b0ee94880cc193f3c63ebe3c4662c3123606
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 82fb4f4b223d78e86647f3576e41e3086ab42cd5
Author: Roman Lebedev <lebedev.ri@gmail.com>
Date:   Mon Jan 10 20:49:41 2022 +0300

    [SCEV] Sequential/in-order `UMin` expression
    
    As discussed in https://github.com/llvm/llvm-project/issues/53020 / https://reviews.llvm.org/D116692,
    SCEV is forbidden from reasoning about 'backedge taken count'
    if the branch condition is a poison-safe logical operation,
    which is conservatively correct, but is severely limiting.
    
    Instead, we should have a way to express those
    poison blocking properties in SCEV expressions.
    
    The proposed semantics is:
    ```
    Sequential/in-order min/max SCEV expressions are non-commutative variants
    of commutative min/max SCEV expressions. If none of their operands
    are poison, then they are functionally equivalent, otherwise,
    if the operand that represents the saturation point* of given expression,
    comes before the first poison operand, then the whole expression is not poison,
    but is said saturation point.
    ```
    * saturation point - the maximal/minimal possible integer value for the given type
    
    The lowering is straight-forward:
    ```
    compare each operand to the saturation point,
    perform sequential in-order logical-or (poison-safe!) ordered reduction
    over those checks, and if reduction returned true then return
    saturation point else return the naive min/max reduction over the operands
    ```
    https://alive2.llvm.org/ce/z/Q7jxvH (2 ops)
    https://alive2.llvm.org/ce/z/QCRrhk (3 ops)
    Note that we don't need to check the last operand: https://alive2.llvm.org/ce/z/abvHQS
    Note that this is not commutative: https://alive2.llvm.org/ce/z/FK9e97
    
    That allows us to handle the patterns in question.
    
    Reviewed By: nikic, reames
    
    Differential Revision: https://reviews.llvm.org/D116766
---
 llvm/include/llvm/Analysis/ScalarEvolution.h       |  14 ++-
 .../llvm/Analysis/ScalarEvolutionDivision.h        |   1 +
 .../llvm/Analysis/ScalarEvolutionExpressions.h     |  64 +++++++++++
 llvm/include/llvm/IR/IRBuilder.h                   |   9 ++
 .../Transforms/Utils/ScalarEvolutionExpander.h     |  10 ++
 llvm/lib/Analysis/ScalarEvolution.cpp              | 127 +++++++++++++++++----
 .../Transforms/Utils/ScalarEvolutionExpander.cpp   |  64 ++++++++++-
 .../ScalarEvolution/exit-count-select-safe.ll      |  44 +++----
 .../Transforms/IndVarSimplify/exit-count-select.ll |  62 +++++-----
 polly/include/polly/Support/SCEVAffinator.h        |   1 +
 polly/lib/Support/SCEVAffinator.cpp                |   5 +
 polly/lib/Support/SCEVValidator.cpp                |  18 +++
 polly/lib/Support/ScopHelper.cpp                   |   6 +
 13 files changed, 339 insertions(+), 86 deletions(-)

diff --git a/llvm/include/llvm/Analysis/ScalarEvolution.h b/llvm/include/llvm/Analysis/ScalarEvolution.h
index 1484d2cdce83..43a4fbb7f0d9 100644
--- a/llvm/include/llvm/Analysis/ScalarEvolution.h
+++ b/llvm/include/llvm/Analysis/ScalarEvolution.h
@@ -629,14 +629,18 @@ public:
   const SCEV *getAbsExpr(const SCEV *Op, bool IsNSW);
   const SCEV *getMinMaxExpr(SCEVTypes Kind,
                             SmallVectorImpl<const SCEV *> &Operands);
+  const SCEV *getSequentialMinMaxExpr(SCEVTypes Kind,
+                                      SmallVectorImpl<const SCEV *> &Operands);
   const SCEV *getSMaxExpr(const SCEV *LHS, const SCEV *RHS);
   const SCEV *getSMaxExpr(SmallVectorImpl<const SCEV *> &Operands);
   const SCEV *getUMaxExpr(const SCEV *LHS, const SCEV *RHS);
   const SCEV *getUMaxExpr(SmallVectorImpl<const SCEV *> &Operands);
   const SCEV *getSMinExpr(const SCEV *LHS, const SCEV *RHS);
   const SCEV *getSMinExpr(SmallVectorImpl<const SCEV *> &Operands);
-  const SCEV *getUMinExpr(const SCEV *LHS, const SCEV *RHS);
-  const SCEV *getUMinExpr(SmallVectorImpl<const SCEV *> &Operands);
+  const SCEV *getUMinExpr(const SCEV *LHS, const SCEV *RHS,
+                          bool Sequential = false);
+  const SCEV *getUMinExpr(SmallVectorImpl<const SCEV *> &Operands,
+                          bool Sequential = false);
   const SCEV *getUnknown(Value *V);
   const SCEV *getCouldNotCompute();
 
@@ -728,11 +732,13 @@ public:
 
   /// Promote the operands to the wider of the types using zero-extension, and
   /// then perform a umin operation with them.
-  const SCEV *getUMinFromMismatchedTypes(const SCEV *LHS, const SCEV *RHS);
+  const SCEV *getUMinFromMismatchedTypes(const SCEV *LHS, const SCEV *RHS,
+                                         bool Sequential = false);
 
   /// Promote the operands to the wider of the types using zero-extension, and
   /// then perform a umin operation with them. N-ary function.
-  const SCEV *getUMinFromMismatchedTypes(SmallVectorImpl<const SCEV *> &Ops);
+  const SCEV *getUMinFromMismatchedTypes(SmallVectorImpl<const SCEV *> &Ops,
+                                         bool Sequential = false);
 
   /// Transitively follow the chain of pointer-type operands until reaching a
   /// SCEV that does not have a single pointer operand. This returns a
diff --git a/llvm/include/llvm/Analysis/ScalarEvolutionDivision.h b/llvm/include/llvm/Analysis/ScalarEvolutionDivision.h
index 24f0c51487bd..7d5902d31795 100644
--- a/llvm/include/llvm/Analysis/ScalarEvolutionDivision.h
+++ b/llvm/include/llvm/Analysis/ScalarEvolutionDivision.h
@@ -42,6 +42,7 @@ public:
   void visitUMaxExpr(const SCEVUMaxExpr *Numerator) {}
   void visitSMinExpr(const SCEVSMinExpr *Numerator) {}
   void visitUMinExpr(const SCEVUMinExpr *Numerator) {}
+  void visitSequentialUMinExpr(const SCEVSequentialUMinExpr *Numerator) {}
   void visitUnknown(const SCEVUnknown *Numerator) {}
   void visitCouldNotCompute(const SCEVCouldNotCompute *Numerator) {}
 
diff --git a/llvm/include/llvm/Analysis/ScalarEvolutionExpressions.h b/llvm/include/llvm/Analysis/ScalarEvolutionExpressions.h
index dd96de3fef22..4416fdb7c08a 100644
--- a/llvm/include/llvm/Analysis/ScalarEvolutionExpressions.h
+++ b/llvm/include/llvm/Analysis/ScalarEvolutionExpressions.h
@@ -51,6 +51,7 @@ enum SCEVTypes : unsigned short {
   scUMinExpr,
   scSMinExpr,
   scPtrToInt,
+  scSequentialUMinExpr,
   scUnknown,
   scCouldNotCompute
 };
@@ -228,6 +229,7 @@ public:
     return S->getSCEVType() == scAddExpr || S->getSCEVType() == scMulExpr ||
            S->getSCEVType() == scSMaxExpr || S->getSCEVType() == scUMaxExpr ||
            S->getSCEVType() == scSMinExpr || S->getSCEVType() == scUMinExpr ||
+           S->getSCEVType() == scSequentialUMinExpr ||
            S->getSCEVType() == scAddRecExpr;
   }
 };
@@ -501,6 +503,54 @@ public:
   static bool classof(const SCEV *S) { return S->getSCEVType() == scUMinExpr; }
 };
 
+/// This node is the base class for sequential/in-order min/max selections.
+/// Note that their fundamental difference from SCEVMinMaxExpr's is that they
+/// are early-returning upon reaching saturation point.
+/// I.e. given `0 umin_seq poison`, the result will be `0`,
+/// while the result of `0 umin poison` is `poison`.
+class SCEVSequentialMinMaxExpr : public SCEVNAryExpr {
+  friend class ScalarEvolution;
+
+  static bool isSequentialMinMaxType(enum SCEVTypes T) {
+    return T == scSequentialUMinExpr;
+  }
+
+  /// Set flags for a non-recurrence without clearing previously set flags.
+  void setNoWrapFlags(NoWrapFlags Flags) { SubclassData |= Flags; }
+
+protected:
+  /// Note: Constructing subclasses via this constructor is allowed
+  SCEVSequentialMinMaxExpr(const FoldingSetNodeIDRef ID, enum SCEVTypes T,
+                           const SCEV *const *O, size_t N)
+      : SCEVNAryExpr(ID, T, O, N) {
+    assert(isSequentialMinMaxType(T));
+    // Min and max never overflow
+    setNoWrapFlags((NoWrapFlags)(FlagNUW | FlagNSW));
+  }
+
+public:
+  Type *getType() const { return getOperand(0)->getType(); }
+
+  static bool classof(const SCEV *S) {
+    return isSequentialMinMaxType(S->getSCEVType());
+  }
+};
+
+/// This class represents a sequential/in-order unsigned minimum selection.
+class SCEVSequentialUMinExpr : public SCEVSequentialMinMaxExpr {
+  friend class ScalarEvolution;
+
+  SCEVSequentialUMinExpr(const FoldingSetNodeIDRef ID, const SCEV *const *O,
+                         size_t N)
+      : SCEVSequentialMinMaxExpr(ID, scSequentialUMinExpr, O, N) {}
+
+public:
+  /// Methods for support type inquiry through isa, cast, and dyn_cast:
+  static bool classof(const SCEV *S) {
+    return S->getSCEVType() == scSequentialUMinExpr;
+  }
+};
+
 /// This means that we are dealing with an entirely unknown SCEV
 /// value, and only represent it as its LLVM Value.  This is the
 /// "bottom" value for the analysis.
@@ -576,6 +626,9 @@ template <typename SC, typename RetVal = void> struct SCEVVisitor {
       return ((SC *)this)->visitSMinExpr((const SCEVSMinExpr *)S);
     case scUMinExpr:
       return ((SC *)this)->visitUMinExpr((const SCEVUMinExpr *)S);
+    case scSequentialUMinExpr:
+      return ((SC *)this)
+          ->visitSequentialUMinExpr((const SCEVSequentialUMinExpr *)S);
     case scUnknown:
       return ((SC *)this)->visitUnknown((const SCEVUnknown *)S);
     case scCouldNotCompute:
@@ -630,6 +683,7 @@ public:
       case scUMaxExpr:
       case scSMinExpr:
       case scUMinExpr:
+      case scSequentialUMinExpr:
       case scAddRecExpr:
         for (const auto *Op : cast<SCEVNAryExpr>(S)->operands())
           push(Op);
@@ -815,6 +869,16 @@ public:
     return !Changed ? Expr : SE.getUMinExpr(Operands);
   }
 
+  const SCEV *visitSequentialUMinExpr(const SCEVSequentialUMinExpr *Expr) {
+    SmallVector<const SCEV *, 2> Operands;
+    bool Changed = false;
+    for (auto *Op : Expr->operands()) {
+      Operands.push_back(((SC *)this)->visit(Op));
+      Changed |= Op != Operands.back();
+    }
+    return !Changed ? Expr : SE.getUMinExpr(Operands, /*Sequential=*/true);
+  }
+
   const SCEV *visitUnknown(const SCEVUnknown *Expr) { return Expr; }
 
   const SCEV *visitCouldNotCompute(const SCEVCouldNotCompute *Expr) {
diff --git a/llvm/include/llvm/IR/IRBuilder.h b/llvm/include/llvm/IR/IRBuilder.h
index bcf52278ccbb..bdc733519a92 100644
--- a/llvm/include/llvm/IR/IRBuilder.h
+++ b/llvm/include/llvm/IR/IRBuilder.h
@@ -1571,6 +1571,15 @@ public:
                         Cond2, Name);
   }
 
+  // NOTE: this is sequential, non-commutative, ordered reduction!
+  Value *CreateLogicalOr(ArrayRef<Value *> Ops) {
+    assert(!Ops.empty());
+    Value *Accum = Ops[0];
+    for (unsigned i = 1; i < Ops.size(); i++)
+      Accum = CreateLogicalOr(Accum, Ops[i]);
+    return Accum;
+  }
+
   CallInst *CreateConstrainedFPBinOp(
       Intrinsic::ID ID, Value *L, Value *R, Instruction *FMFSource = nullptr,
       const Twine &Name = "", MDNode *FPMathTag = nullptr,
diff --git a/llvm/include/llvm/Transforms/Utils/ScalarEvolutionExpander.h b/llvm/include/llvm/Transforms/Utils/ScalarEvolutionExpander.h
index 608e0975543a..4547d8a59113 100644
--- a/llvm/include/llvm/Transforms/Utils/ScalarEvolutionExpander.h
+++ b/llvm/include/llvm/Transforms/Utils/ScalarEvolutionExpander.h
@@ -450,6 +450,14 @@ private:
   /// Determine the most "relevant" loop for the given SCEV.
   const Loop *getRelevantLoop(const SCEV *);
 
+  Value *expandSMaxExpr(const SCEVNAryExpr *S);
+
+  Value *expandUMaxExpr(const SCEVNAryExpr *S);
+
+  Value *expandSMinExpr(const SCEVNAryExpr *S);
+
+  Value *expandUMinExpr(const SCEVNAryExpr *S);
+
   Value *visitConstant(const SCEVConstant *S) { return S->getValue(); }
 
   Value *visitPtrToIntExpr(const SCEVPtrToIntExpr *S);
@@ -476,6 +484,8 @@ private:
 
   Value *visitUMinExpr(const SCEVUMinExpr *S);
 
+  Value *visitSequentialUMinExpr(const SCEVSequentialUMinExpr *S);
+
   Value *visitUnknown(const SCEVUnknown *S) { return S->getValue(); }
 
   void rememberInstruction(Value *I);
diff --git a/llvm/lib/Analysis/ScalarEvolution.cpp b/llvm/lib/Analysis/ScalarEvolution.cpp
index 2b1f84017152..add291555c79 100644
--- a/llvm/lib/Analysis/ScalarEvolution.cpp
+++ b/llvm/lib/Analysis/ScalarEvolution.cpp
@@ -301,7 +301,8 @@ void SCEV::print(raw_ostream &OS) const {
   case scUMaxExpr:
   case scSMaxExpr:
   case scUMinExpr:
-  case scSMinExpr: {
+  case scSMinExpr:
+  case scSequentialUMinExpr: {
     const SCEVNAryExpr *NAry = cast<SCEVNAryExpr>(this);
     const char *OpStr = nullptr;
     switch (NAry->getSCEVType()) {
@@ -315,6 +316,9 @@ void SCEV::print(raw_ostream &OS) const {
     case scSMinExpr:
       OpStr = " smin ";
       break;
+    case scSequentialUMinExpr:
+      OpStr = " umin_seq ";
+      break;
     default:
       llvm_unreachable("There are no other nary expression types.");
     }
@@ -392,6 +396,8 @@ Type *SCEV::getType() const {
   case scUMinExpr:
   case scSMinExpr:
     return cast<SCEVMinMaxExpr>(this)->getType();
+  case scSequentialUMinExpr:
+    return cast<SCEVSequentialMinMaxExpr>(this)->getType();
   case scAddExpr:
     return cast<SCEVAddExpr>(this)->getType();
   case scUDivExpr:
@@ -774,7 +780,8 @@ CompareSCEVComplexity(EquivalenceClasses<const SCEV *> &EqCacheSCEV,
   case scSMaxExpr:
   case scUMaxExpr:
   case scSMinExpr:
-  case scUMinExpr: {
+  case scUMinExpr:
+  case scSequentialUMinExpr: {
     const SCEVNAryExpr *LC = cast<SCEVNAryExpr>(LHS);
     const SCEVNAryExpr *RC = cast<SCEVNAryExpr>(RHS);
 
@@ -3721,6 +3728,7 @@ const SCEV *ScalarEvolution::getAbsExpr(const SCEV *Op, bool IsNSW) {
 
 const SCEV *ScalarEvolution::getMinMaxExpr(SCEVTypes Kind,
                                            SmallVectorImpl<const SCEV *> &Ops) {
+  assert(SCEVMinMaxExpr::isMinMaxType(Kind) && "Not a SCEVMinMaxExpr!");
   assert(!Ops.empty() && "Cannot get empty (u|s)(min|max)!");
   if (Ops.size() == 1) return Ops[0];
 #ifndef NDEBUG
@@ -3857,6 +3865,75 @@ const SCEV *ScalarEvolution::getMinMaxExpr(SCEVTypes Kind,
   return S;
 }
 
+const SCEV *
+ScalarEvolution::getSequentialMinMaxExpr(SCEVTypes Kind,
+                                         SmallVectorImpl<const SCEV *> &Ops) {
+  assert(SCEVSequentialMinMaxExpr::isSequentialMinMaxType(Kind) &&
+         "Not a SCEVSequentialMinMaxExpr!");
+  assert(!Ops.empty() && "Cannot get empty (u|s)(min|max)!");
+  if (Ops.size() == 1)
+    return Ops[0];
+#ifndef NDEBUG
+  Type *ETy = getEffectiveSCEVType(Ops[0]->getType());
+  for (unsigned i = 1, e = Ops.size(); i != e; ++i) {
+    assert(getEffectiveSCEVType(Ops[i]->getType()) == ETy &&
+           "Operand types don't match!");
+    assert(Ops[0]->getType()->isPointerTy() ==
+               Ops[i]->getType()->isPointerTy() &&
+           "min/max should be consistently pointerish");
+  }
+#endif
+
+  // Note that SCEVSequentialMinMaxExpr is *NOT* commutative,
+  // so we can *NOT* do any kind of sorting of the expressions!
+
+  // Check if we have created the same expression before.
+  if (const SCEV *S = findExistingSCEVInCache(Kind, Ops))
+    return S;
+
+  // FIXME: there are *some* simplifications that we can do here.
+
+  // Check to see if one of the operands is of the same kind. If so, expand its
+  // operands onto our operand list, and recurse to simplify.
+  {
+    unsigned Idx = 0;
+    bool DeletedAny = false;
+    while (Idx < Ops.size()) {
+      if (Ops[Idx]->getSCEVType() != Kind) {
+        ++Idx;
+        continue;
+      }
+      const auto *SMME = cast<SCEVSequentialMinMaxExpr>(Ops[Idx]);
+      Ops.erase(Ops.begin() + Idx);
+      Ops.insert(Ops.begin() + Idx, SMME->op_begin(), SMME->op_end());
+      DeletedAny = true;
+    }
+
+    if (DeletedAny)
+      return getSequentialMinMaxExpr(Kind, Ops);
+  }
+
+  // Okay, it looks like we really DO need an expr.  Check to see if we
+  // already have one, otherwise create a new one.
+  FoldingSetNodeID ID;
+  ID.AddInteger(Kind);
+  for (unsigned i = 0, e = Ops.size(); i != e; ++i)
+    ID.AddPointer(Ops[i]);
+  void *IP = nullptr;
+  const SCEV *ExistingSCEV = UniqueSCEVs.FindNodeOrInsertPos(ID, IP);
+  if (ExistingSCEV)
+    return ExistingSCEV;
+
+  const SCEV **O = SCEVAllocator.Allocate<const SCEV *>(Ops.size());
+  std::uninitialized_copy(Ops.begin(), Ops.end(), O);
+  SCEV *S = new (SCEVAllocator)
+      SCEVSequentialMinMaxExpr(ID.Intern(SCEVAllocator), Kind, O, Ops.size());
+
+  UniqueSCEVs.InsertNode(S, IP);
+  registerUser(S, Ops);
+  return S;
+}
+
 const SCEV *ScalarEvolution::getSMaxExpr(const SCEV *LHS, const SCEV *RHS) {
   SmallVector<const SCEV *, 2> Ops = {LHS, RHS};
   return getSMaxExpr(Ops);
@@ -3885,14 +3962,16 @@ const SCEV *ScalarEvolution::getSMinExpr(SmallVectorImpl<const SCEV *> &Ops) {
   return getMinMaxExpr(scSMinExpr, Ops);
 }
 
-const SCEV *ScalarEvolution::getUMinExpr(const SCEV *LHS,
-                                         const SCEV *RHS) {
+const SCEV *ScalarEvolution::getUMinExpr(const SCEV *LHS, const SCEV *RHS,
+                                         bool Sequential) {
   SmallVector<const SCEV *, 2> Ops = { LHS, RHS };
-  return getUMinExpr(Ops);
+  return getUMinExpr(Ops, Sequential);
 }
 
-const SCEV *ScalarEvolution::getUMinExpr(SmallVectorImpl<const SCEV *> &Ops) {
-  return getMinMaxExpr(scUMinExpr, Ops);
+const SCEV *ScalarEvolution::getUMinExpr(SmallVectorImpl<const SCEV *> &Ops,
+                                         bool Sequential) {
+  return Sequential ? getSequentialMinMaxExpr(scSequentialUMinExpr, Ops)
+                    : getMinMaxExpr(scUMinExpr, Ops);
 }
 
 const SCEV *
@@ -4375,13 +4454,15 @@ const SCEV *ScalarEvolution::getUMaxFromMismatchedTypes(const SCEV *LHS,
 }
 
 const SCEV *ScalarEvolution::getUMinFromMismatchedTypes(const SCEV *LHS,
-                                                        const SCEV *RHS) {
+                                                        const SCEV *RHS,
+                                                        bool Sequential) {
   SmallVector<const SCEV *, 2> Ops = { LHS, RHS };
-  return getUMinFromMismatchedTypes(Ops);
+  return getUMinFromMismatchedTypes(Ops, Sequential);
 }
 
-const SCEV *ScalarEvolution::getUMinFromMismatchedTypes(
-    SmallVectorImpl<const SCEV *> &Ops) {
+const SCEV *
+ScalarEvolution::getUMinFromMismatchedTypes(SmallVectorImpl<const SCEV *> &Ops,
+                                            bool Sequential) {
   assert(!Ops.empty() && "At least one operand must be!");
   // Trivial case.
   if (Ops.size() == 1)
@@ -4402,7 +4483,7 @@ const SCEV *ScalarEvolution::getUMinFromMismatchedTypes(
     PromotedOps.push_back(getNoopOrZeroExtend(S, MaxType));
 
   // Generate umin.
-  return getUMinExpr(PromotedOps);
+  return getUMinExpr(PromotedOps, Sequential);
 }
 
 const SCEV *ScalarEvolution::getPointerBase(const SCEV *V) {
@@ -5513,6 +5594,7 @@ static bool IsAvailableOnEntry(const Loop *L, DominatorTree &DT, const SCEV *S,
       case scSMaxExpr:
       case scUMinExpr:
       case scSMinExpr:
+      case scSequentialUMinExpr:
         // These expressions are available if their operand(s) is/are.
         return true;
 
@@ -6060,7 +6142,7 @@ ScalarEvolution::getRangeRef(const SCEV *S,
                     ConservativeResult.intersectWith(X, RangeType));
   }
 
-  if (isa<SCEVMinMaxExpr>(S)) {
+  if (isa<SCEVMinMaxExpr>(S) || isa<SCEVSequentialMinMaxExpr>(S)) {
     Intrinsic::ID ID;
     switch (S->getSCEVType()) {
     case scUMaxExpr:
@@ -6070,13 +6152,14 @@ ScalarEvolution::getRangeRef(const SCEV *S,
       ID = Intrinsic::smax;
       break;
     case scUMinExpr:
+    case scSequentialUMinExpr:
       ID = Intrinsic::umin;
       break;
     case scSMinExpr:
       ID = Intrinsic::smin;
       break;
     default:
-      llvm_unreachable("Unknown SCEVMinMaxExpr.");
+      llvm_unreachable("Unknown SCEVMinMaxExpr/SCEVSequentialMinMaxExpr.");
     }
 
     const auto *NAry = cast<SCEVNAryExpr>(S);
@@ -8169,9 +8252,9 @@ ScalarEvolution::computeExitLimitFromCondFromBinOp(
       PoisonSafe = isa<SCEVConstant>(EL0.ExactNotTaken) ||
                    isa<SCEVConstant>(EL1.ExactNotTaken);
     if (EL0.ExactNotTaken != getCouldNotCompute() &&
-        EL1.ExactNotTaken != getCouldNotCompute() && PoisonSafe) {
-      BECount =
-          getUMinFromMismatchedTypes(EL0.ExactNotTaken, EL1.ExactNotTaken);
+        EL1.ExactNotTaken != getCouldNotCompute()) {
+      BECount = getUMinFromMismatchedTypes(EL0.ExactNotTaken, EL1.ExactNotTaken,
+                                           /*Sequential=*/!PoisonSafe);
 
       // If EL0.ExactNotTaken was zero and ExitCond was a short-circuit form,
       // it should have been simplified to zero (see the condition (3) above)
@@ -8972,7 +9055,8 @@ static Constant *BuildConstantFromSCEV(const SCEV *V) {
   case scUMaxExpr:
   case scSMinExpr:
   case scUMinExpr:
-    return nullptr; // TODO: smax, umax, smin, umax.
+  case scSequentialUMinExpr:
+    return nullptr; // TODO: smax, umax, smin, umax, umin_seq.
   }
   llvm_unreachable("Unknown SCEV kind!");
 }
@@ -11354,6 +11438,7 @@ static bool IsKnownPredicateViaMinOrMax(ScalarEvolution &SE,
   case ICmpInst::ICMP_ULE:
     return
         // min(A, ...) <= A
+        // FIXME: what about umin_seq?
         IsMinMaxConsistingOf<SCEVUMinExpr>(LHS, RHS) ||
         // A <= max(A, ...)
         IsMinMaxConsistingOf<SCEVUMaxExpr>(RHS, LHS);
@@ -12754,7 +12839,8 @@ ScalarEvolution::computeLoopDisposition(const SCEV *S, const Loop *L) {
   case scUMaxExpr:
   case scSMaxExpr:
   case scUMinExpr:
-  case scSMinExpr: {
+  case scSMinExpr:
+  case scSequentialUMinExpr: {
     bool HasVarying = false;
     for (auto *Op : cast<SCEVNAryExpr>(S)->operands()) {
       LoopDisposition D = getLoopDisposition(Op, L);
@@ -12844,7 +12930,8 @@ ScalarEvolution::computeBlockDisposition(const SCEV *S, const BasicBlock *BB) {
   case scUMaxExpr:
   case scSMaxExpr:
   case scUMinExpr:
-  case scSMinExpr: {
+  case scSMinExpr:
+  case scSequentialUMinExpr: {
     const SCEVNAryExpr *NAry = cast<SCEVNAryExpr>(S);
     bool Proper = true;
     for (const SCEV *NAryOp : NAry->operands()) {
diff --git a/llvm/lib/Transforms/Utils/ScalarEvolutionExpander.cpp b/llvm/lib/Transforms/Utils/ScalarEvolutionExpander.cpp
index 68edfe01a32a..b41b63432c3d 100644
--- a/llvm/lib/Transforms/Utils/ScalarEvolutionExpander.cpp
+++ b/llvm/lib/Transforms/Utils/ScalarEvolutionExpander.cpp
@@ -1671,7 +1671,7 @@ Value *SCEVExpander::visitSignExtendExpr(const SCEVSignExtendExpr *S) {
   return Builder.CreateSExt(V, Ty);
 }
 
-Value *SCEVExpander::visitSMaxExpr(const SCEVSMaxExpr *S) {
+Value *SCEVExpander::expandSMaxExpr(const SCEVNAryExpr *S) {
   Value *LHS = expand(S->getOperand(S->getNumOperands()-1));
   Type *Ty = LHS->getType();
   for (int i = S->getNumOperands()-2; i >= 0; --i) {
@@ -1700,7 +1700,7 @@ Value *SCEVExpander::visitSMaxExpr(const SCEVSMaxExpr *S) {
   return LHS;
 }
 
-Value *SCEVExpander::visitUMaxExpr(const SCEVUMaxExpr *S) {
+Value *SCEVExpander::expandUMaxExpr(const SCEVNAryExpr *S) {
   Value *LHS = expand(S->getOperand(S->getNumOperands()-1));
   Type *Ty = LHS->getType();
   for (int i = S->getNumOperands()-2; i >= 0; --i) {
@@ -1729,7 +1729,7 @@ Value *SCEVExpander::visitUMaxExpr(const SCEVUMaxExpr *S) {
   return LHS;
 }
 
-Value *SCEVExpander::visitSMinExpr(const SCEVSMinExpr *S) {
+Value *SCEVExpander::expandSMinExpr(const SCEVNAryExpr *S) {
   Value *LHS = expand(S->getOperand(S->getNumOperands() - 1));
   Type *Ty = LHS->getType();
   for (int i = S->getNumOperands() - 2; i >= 0; --i) {
@@ -1758,7 +1758,7 @@ Value *SCEVExpander::visitSMinExpr(const SCEVSMinExpr *S) {
   return LHS;
 }
 
-Value *SCEVExpander::visitUMinExpr(const SCEVUMinExpr *S) {
+Value *SCEVExpander::expandUMinExpr(const SCEVNAryExpr *S) {
   Value *LHS = expand(S->getOperand(S->getNumOperands() - 1));
   Type *Ty = LHS->getType();
   for (int i = S->getNumOperands() - 2; i >= 0; --i) {
@@ -1787,6 +1787,40 @@ Value *SCEVExpander::visitUMinExpr(const SCEVUMinExpr *S) {
   return LHS;
 }
 
+Value *SCEVExpander::visitSMaxExpr(const SCEVSMaxExpr *S) {
+  return expandSMaxExpr(S);
+}
+
+Value *SCEVExpander::visitUMaxExpr(const SCEVUMaxExpr *S) {
+  return expandUMaxExpr(S);
+}
+
+Value *SCEVExpander::visitSMinExpr(const SCEVSMinExpr *S) {
+  return expandSMinExpr(S);
+}
+
+Value *SCEVExpander::visitUMinExpr(const SCEVUMinExpr *S) {
+  return expandUMinExpr(S);
+}
+
+Value *SCEVExpander::visitSequentialUMinExpr(const SCEVSequentialUMinExpr *S) {
+  SmallVector<Value *> Ops;
+  for (const SCEV *Op : S->operands())
+    Ops.emplace_back(expand(Op));
+
+  Value *SaturationPoint =
+      MinMaxIntrinsic::getSaturationPoint(Intrinsic::umin, S->getType());
+
+  SmallVector<Value *> OpIsZero;
+  for (Value *Op : ArrayRef<Value *>(Ops).drop_back())
+    OpIsZero.emplace_back(Builder.CreateICmpEQ(Op, SaturationPoint));
+
+  Value *AnyOpIsZero = Builder.CreateLogicalOr(OpIsZero);
+
+  Value *NaiveUMin = expandUMinExpr(S);
+  return Builder.CreateSelect(AnyOpIsZero, SaturationPoint, NaiveUMin);
+}
+
 Value *SCEVExpander::expandCodeForImpl(const SCEV *SH, Type *Ty,
                                        Instruction *IP, bool Root) {
   setInsertPoint(IP);
@@ -2271,10 +2305,27 @@ template<typename T> static InstructionCost costAndCollectOperands(
   case scSMaxExpr:
   case scUMaxExpr:
   case scSMinExpr:
-  case scUMinExpr: {
+  case scUMinExpr:
+  case scSequentialUMinExpr: {
     // FIXME: should this ask the cost for Intrinsic's?
+    // The reduction tree.
     Cost += CmpSelCost(Instruction::ICmp, S->getNumOperands() - 1, 0, 1);
     Cost += CmpSelCost(Instruction::Select, S->getNumOperands() - 1, 0, 2);
+    switch (S->getSCEVType()) {
+    case scSequentialUMinExpr: {
+      // The safety net against poison.
+      // FIXME: this is broken.
+      Cost += CmpSelCost(Instruction::ICmp, S->getNumOperands() - 1, 0, 0);
+      Cost += ArithCost(Instruction::Or,
+                        S->getNumOperands() > 2 ? S->getNumOperands() - 2 : 0);
+      Cost += CmpSelCost(Instruction::Select, 1, 0, 1);
+      break;
+    }
+    default:
+      assert(!isa<SCEVSequentialMinMaxExpr>(S) &&
+             "Unhandled SCEV expression type?");
+      break;
+    }
     break;
   }
   case scAddRecExpr: {
@@ -2399,7 +2450,8 @@ bool SCEVExpander::isHighCostExpansionHelper(
   case scUMaxExpr:
   case scSMaxExpr:
   case scUMinExpr:
-  case scSMinExpr: {
+  case scSMinExpr:
+  case scSequentialUMinExpr: {
     assert(cast<SCEVNAryExpr>(S)->getNumOperands() > 1 &&
            "Nary expr should have more than 1 operand.");
     // The simple nary expr will require one less op (or pair of ops)
diff --git a/llvm/test/Analysis/ScalarEvolution/exit-count-select-safe.ll b/llvm/test/Analysis/ScalarEvolution/exit-count-select-safe.ll
index 90a9bbfec414..f111a576fcc4 100644
--- a/llvm/test/Analysis/ScalarEvolution/exit-count-select-safe.ll
+++ b/llvm/test/Analysis/ScalarEvolution/exit-count-select-safe.ll
@@ -1,21 +1,21 @@
 ; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
 ; RUN: opt -disable-output "-passes=print<scalar-evolution>" %s 2>&1 | FileCheck %s
 
-; exact-not-taken cannot be umin(n, m) because it is possible for (n, m) to be (0, poison)
-; https://alive2.llvm.org/ce/z/NsP9ue
 define i32 @logical_and_2ops(i32 %n, i32 %m) {
 ; CHECK-LABEL: 'logical_and_2ops'
 ; CHECK-NEXT:  Classifying expressions for: @logical_and_2ops
 ; CHECK-NEXT:    %i = phi i32 [ 0, %entry ], [ %i.next, %loop ]
-; CHECK-NEXT:    --> {0,+,1}<%loop> U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Computable }
+; CHECK-NEXT:    --> {0,+,1}<%loop> U: full-set S: full-set Exits: (%n umin_seq %m) LoopDispositions: { %loop: Computable }
 ; CHECK-NEXT:    %i.next = add i32 %i, 1
-; CHECK-NEXT:    --> {1,+,1}<%loop> U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Computable }
+; CHECK-NEXT:    --> {1,+,1}<%loop> U: full-set S: full-set Exits: (1 + (%n umin_seq %m)) LoopDispositions: { %loop: Computable }
 ; CHECK-NEXT:    %cond = select i1 %cond_p0, i1 %cond_p1, i1 false
 ; CHECK-NEXT:    --> %cond U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Variant }
 ; CHECK-NEXT:  Determining loop execution counts for: @logical_and_2ops
-; CHECK-NEXT:  Loop %loop: Unpredictable backedge-taken count.
+; CHECK-NEXT:  Loop %loop: backedge-taken count is (%n umin_seq %m)
 ; CHECK-NEXT:  Loop %loop: max backedge-taken count is -1
-; CHECK-NEXT:  Loop %loop: Unpredictable predicated backedge-taken count.
+; CHECK-NEXT:  Loop %loop: Predicated backedge-taken count is (%n umin_seq %m)
+; CHECK-NEXT:   Predicates:
+; CHECK:       Loop %loop: Trip multiple is 1
 ;
 entry:
   br label %loop
@@ -30,21 +30,21 @@ exit:
   ret i32 %i
 }
 
-; exact-not-taken cannot be umin(n, m) because it is possible for (n, m) to be (0, poison)
-; https://alive2.llvm.org/ce/z/ApRitq
 define i32 @logical_or_2ops(i32 %n, i32 %m) {
 ; CHECK-LABEL: 'logical_or_2ops'
 ; CHECK-NEXT:  Classifying expressions for: @logical_or_2ops
 ; CHECK-NEXT:    %i = phi i32 [ 0, %entry ], [ %i.next, %loop ]
-; CHECK-NEXT:    --> {0,+,1}<%loop> U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Computable }
+; CHECK-NEXT:    --> {0,+,1}<%loop> U: full-set S: full-set Exits: (%n umin_seq %m) LoopDispositions: { %loop: Computable }
 ; CHECK-NEXT:    %i.next = add i32 %i, 1
-; CHECK-NEXT:    --> {1,+,1}<%loop> U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Computable }
+; CHECK-NEXT:    --> {1,+,1}<%loop> U: full-set S: full-set Exits: (1 + (%n umin_seq %m)) LoopDispositions: { %loop: Computable }
 ; CHECK-NEXT:    %cond = select i1 %cond_p0, i1 true, i1 %cond_p1
 ; CHECK-NEXT:    --> %cond U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Variant }
 ; CHECK-NEXT:  Determining loop execution counts for: @logical_or_2ops
-; CHECK-NEXT:  Loop %loop: Unpredictable backedge-taken count.
+; CHECK-NEXT:  Loop %loop: backedge-taken count is (%n umin_seq %m)
 ; CHECK-NEXT:  Loop %loop: max backedge-taken count is -1
-; CHECK-NEXT:  Loop %loop: Unpredictable predicated backedge-taken count.
+; CHECK-NEXT:  Loop %loop: Predicated backedge-taken count is (%n umin_seq %m)
+; CHECK-NEXT:   Predicates:
+; CHECK:       Loop %loop: Trip multiple is 1
 ;
 entry:
   br label %loop
@@ -63,17 +63,19 @@ define i32 @logical_and_3ops(i32 %n, i32 %m, i32 %k) {
 ; CHECK-LABEL: 'logical_and_3ops'
 ; CHECK-NEXT:  Classifying expressions for: @logical_and_3ops
 ; CHECK-NEXT:    %i = phi i32 [ 0, %entry ], [ %i.next, %loop ]
-; CHECK-NEXT:    --> {0,+,1}<%loop> U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Computable }
+; CHECK-NEXT:    --> {0,+,1}<%loop> U: full-set S: full-set Exits: (%n umin_seq %m umin_seq %k) LoopDispositions: { %loop: Computable }
 ; CHECK-NEXT:    %i.next = add i32 %i, 1
-; CHECK-NEXT:    --> {1,+,1}<%loop> U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Computable }
+; CHECK-NEXT:    --> {1,+,1}<%loop> U: full-set S: full-set Exits: (1 + (%n umin_seq %m umin_seq %k)) LoopDispositions: { %loop: Computable }
 ; CHECK-NEXT:    %cond_p3 = select i1 %cond_p0, i1 %cond_p1, i1 false
 ; CHECK-NEXT:    --> %cond_p3 U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Variant }
 ; CHECK-NEXT:    %cond = select i1 %cond_p3, i1 %cond_p2, i1 false
 ; CHECK-NEXT:    --> %cond U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Variant }
 ; CHECK-NEXT:  Determining loop execution counts for: @logical_and_3ops
-; CHECK-NEXT:  Loop %loop: Unpredictable backedge-taken count.
+; CHECK-NEXT:  Loop %loop: backedge-taken count is (%n umin_seq %m umin_seq %k)
 ; CHECK-NEXT:  Loop %loop: max backedge-taken count is -1
-; CHECK-NEXT:  Loop %loop: Unpredictable predicated backedge-taken count.
+; CHECK-NEXT:  Loop %loop: Predicated backedge-taken count is (%n umin_seq %m umin_seq %k)
+; CHECK-NEXT:   Predicates:
+; CHECK:       Loop %loop: Trip multiple is 1
 ;
 entry:
   br label %loop
@@ -94,17 +96,19 @@ define i32 @logical_or_3ops(i32 %n, i32 %m, i32 %k) {
 ; CHECK-LABEL: 'logical_or_3ops'
 ; CHECK-NEXT:  Classifying expressions for: @logical_or_3ops
 ; CHECK-NEXT:    %i = phi i32 [ 0, %entry ], [ %i.next, %loop ]
-; CHECK-NEXT:    --> {0,+,1}<%loop> U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Computable }
+; CHECK-NEXT:    --> {0,+,1}<%loop> U: full-set S: full-set Exits: (%n umin_seq %m umin_seq %k) LoopDispositions: { %loop: Computable }
 ; CHECK-NEXT:    %i.next = add i32 %i, 1
-; CHECK-NEXT:    --> {1,+,1}<%loop> U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Computable }
+; CHECK-NEXT:    --> {1,+,1}<%loop> U: full-set S: full-set Exits: (1 + (%n umin_seq %m umin_seq %k)) LoopDispositions: { %loop: Computable }
 ; CHECK-NEXT:    %cond_p3 = select i1 %cond_p0, i1 true, i1 %cond_p1
 ; CHECK-NEXT:    --> %cond_p3 U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Variant }
 ; CHECK-NEXT:    %cond = select i1 %cond_p3, i1 true, i1 %cond_p2
 ; CHECK-NEXT:    --> %cond U: full-set S: full-set Exits: <<Unknown>> LoopDispositions: { %loop: Variant }
 ; CHECK-NEXT:  Determining loop execution counts for: @logical_or_3ops
-; CHECK-NEXT:  Loop %loop: Unpredictable backedge-taken count.
+; CHECK-NEXT:  Loop %loop: backedge-taken count is (%n umin_seq %m umin_seq %k)
 ; CHECK-NEXT:  Loop %loop: max backedge-taken count is -1
-; CHECK-NEXT:  Loop %loop: Unpredictable predicated backedge-taken count.
+; CHECK-NEXT:  Loop %loop: Predicated backedge-taken count is (%n umin_seq %m umin_seq %k)
+; CHECK-NEXT:   Predicates:
+; CHECK:       Loop %loop: Trip multiple is 1
 ;
 entry:
   br label %loop
diff --git a/llvm/test/Transforms/IndVarSimplify/exit-count-select.ll b/llvm/test/Transforms/IndVarSimplify/exit-count-select.ll
index 3bc6150024df..3ebafd1ef8b1 100644
--- a/llvm/test/Transforms/IndVarSimplify/exit-count-select.ll
+++ b/llvm/test/Transforms/IndVarSimplify/exit-count-select.ll
@@ -4,17 +4,14 @@
 define i32 @logical_and_2ops(i32 %n, i32 %m) {
 ; CHECK-LABEL: @logical_and_2ops(
 ; CHECK-NEXT:  entry:
+; CHECK-NEXT:    [[UMIN:%.*]] = call i32 @llvm.umin.i32(i32 [[M:%.*]], i32 [[N:%.*]])
 ; CHECK-NEXT:    br label [[LOOP:%.*]]
 ; CHECK:       loop:
-; CHECK-NEXT:    [[I:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ [[I_NEXT:%.*]], [[LOOP]] ]
-; CHECK-NEXT:    [[I_NEXT]] = add i32 [[I]], 1
-; CHECK-NEXT:    [[COND_P0:%.*]] = icmp ult i32 [[I]], [[N:%.*]]
-; CHECK-NEXT:    [[COND_P1:%.*]] = icmp ult i32 [[I]], [[M:%.*]]
-; CHECK-NEXT:    [[COND:%.*]] = select i1 [[COND_P0]], i1 [[COND_P1]], i1 false
-; CHECK-NEXT:    br i1 [[COND]], label [[LOOP]], label [[EXIT:%.*]]
+; CHECK-NEXT:    br i1 false, label [[LOOP]], label [[EXIT:%.*]]
 ; CHECK:       exit:
-; CHECK-NEXT:    [[I_LCSSA:%.*]] = phi i32 [ [[I]], [[LOOP]] ]
-; CHECK-NEXT:    ret i32 [[I_LCSSA]]
+; CHECK-NEXT:    [[TMP0:%.*]] = icmp eq i32 [[N]], 0
+; CHECK-NEXT:    [[TMP1:%.*]] = select i1 [[TMP0]], i32 0, i32 [[UMIN]]
+; CHECK-NEXT:    ret i32 [[TMP1]]
 ;
 entry:
   br label %loop
@@ -32,17 +29,14 @@ exit:
 define i32 @logical_or_2ops(i32 %n, i32 %m) {
 ; CHECK-LABEL: @logical_or_2ops(
 ; CHECK-NEXT:  entry:
+; CHECK-NEXT:    [[UMIN:%.*]] = call i32 @llvm.umin.i32(i32 [[M:%.*]], i32 [[N:%.*]])
 ; CHECK-NEXT:    br label [[LOOP:%.*]]
 ; CHECK:       loop:
-; CHECK-NEXT:    [[I:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ [[I_NEXT:%.*]], [[LOOP]] ]
-; CHECK-NEXT:    [[I_NEXT]] = add i32 [[I]], 1
-; CHECK-NEXT:    [[COND_P0:%.*]] = icmp uge i32 [[I]], [[N:%.*]]
-; CHECK-NEXT:    [[COND_P1:%.*]] = icmp uge i32 [[I]], [[M:%.*]]
-; CHECK-NEXT:    [[COND:%.*]] = select i1 [[COND_P0]], i1 true, i1 [[COND_P1]]
-; CHECK-NEXT:    br i1 [[COND]], label [[EXIT:%.*]], label [[LOOP]]
+; CHECK-NEXT:    br i1 true, label [[EXIT:%.*]], label [[LOOP]]
 ; CHECK:       exit:
-; CHECK-NEXT:    [[I_LCSSA:%.*]] = phi i32 [ [[I]], [[LOOP]] ]
-; CHECK-NEXT:    ret i32 [[I_LCSSA]]
+; CHECK-NEXT:    [[TMP0:%.*]] = icmp eq i32 [[N]], 0
+; CHECK-NEXT:    [[TMP1:%.*]] = select i1 [[TMP0]], i32 0, i32 [[UMIN]]
+; CHECK-NEXT:    ret i32 [[TMP1]]
 ;
 entry:
   br label %loop
@@ -60,19 +54,17 @@ exit:
 define i32 @logical_and_3ops(i32 %n, i32 %m, i32 %k) {
 ; CHECK-LABEL: @logical_and_3ops(
 ; CHECK-NEXT:  entry:
+; CHECK-NEXT:    [[TMP0:%.*]] = icmp eq i32 [[M:%.*]], 0
+; CHECK-NEXT:    [[UMIN:%.*]] = call i32 @llvm.umin.i32(i32 [[K:%.*]], i32 [[M]])
+; CHECK-NEXT:    [[UMIN1:%.*]] = call i32 @llvm.umin.i32(i32 [[UMIN]], i32 [[N:%.*]])
 ; CHECK-NEXT:    br label [[LOOP:%.*]]
 ; CHECK:       loop:
-; CHECK-NEXT:    [[I:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ [[I_NEXT:%.*]], [[LOOP]] ]
-; CHECK-NEXT:    [[I_NEXT]] = add i32 [[I]], 1
-; CHECK-NEXT:    [[COND_P0:%.*]] = icmp ult i32 [[I]], [[N:%.*]]
-; CHECK-NEXT:    [[COND_P1:%.*]] = icmp ult i32 [[I]], [[M:%.*]]
-; CHECK-NEXT:    [[COND_P2:%.*]] = icmp ult i32 [[I]], [[K:%.*]]
-; CHECK-NEXT:    [[COND_P3:%.*]] = select i1 [[COND_P0]], i1 [[COND_P1]], i1 false
-; CHECK-NEXT:    [[COND:%.*]] = select i1 [[COND_P3]], i1 [[COND_P2]], i1 false
-; CHECK-NEXT:    br i1 [[COND]], label [[LOOP]], label [[EXIT:%.*]]
+; CHECK-NEXT:    br i1 false, label [[LOOP]], label [[EXIT:%.*]]
 ; CHECK:       exit:
-; CHECK-NEXT:    [[I_LCSSA:%.*]] = phi i32 [ [[I]], [[LOOP]] ]
-; CHECK-NEXT:    ret i32 [[I_LCSSA]]
+; CHECK-NEXT:    [[TMP1:%.*]] = icmp eq i32 [[N]], 0
+; CHECK-NEXT:    [[TMP2:%.*]] = select i1 [[TMP1]], i1 true, i1 [[TMP0]]
+; CHECK-NEXT:    [[TMP3:%.*]] = select i1 [[TMP2]], i32 0, i32 [[UMIN1]]
+; CHECK-NEXT:    ret i32 [[TMP3]]
 ;
 entry:
   br label %loop
@@ -92,19 +84,17 @@ exit:
 define i32 @logical_or_3ops(i32 %n, i32 %m, i32 %k) {
 ; CHECK-LABEL: @logical_or_3ops(
 ; CHECK-NEXT:  entry:
+; CHECK-NEXT:    [[TMP0:%.*]] = icmp eq i32 [[M:%.*]], 0
+; CHECK-NEXT:    [[UMIN:%.*]] = call i32 @llvm.umin.i32(i32 [[K:%.*]], i32 [[M]])
+; CHECK-NEXT:    [[UMIN1:%.*]] = call i32 @llvm.umin.i32(i32 [[UMIN]], i32 [[N:%.*]])
 ; CHECK-NEXT:    br label [[LOOP:%.*]]
 ; CHECK:       loop:
-; CHECK-NEXT:    [[I:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ [[I_NEXT:%.*]], [[LOOP]] ]
-; CHECK-NEXT:    [[I_NEXT]] = add i32 [[I]], 1
-; CHECK-NEXT:    [[COND_P0:%.*]] = icmp uge i32 [[I]], [[N:%.*]]
-; CHECK-NEXT:    [[COND_P1:%.*]] = icmp uge i32 [[I]], [[M:%.*]]
-; CHECK-NEXT:    [[COND_P2:%.*]] = icmp uge i32 [[I]], [[K:%.*]]
-; CHECK-NEXT:    [[COND_P3:%.*]] = select i1 [[COND_P0]], i1 true, i1 [[COND_P1]]
-; CHECK-NEXT:    [[COND:%.*]] = select i1 [[COND_P3]], i1 true, i1 [[COND_P2]]
-; CHECK-NEXT:    br i1 [[COND]], label [[EXIT:%.*]], label [[LOOP]]
+; CHECK-NEXT:    br i1 true, label [[EXIT:%.*]], label [[LOOP]]
 ; CHECK:       exit:
-; CHECK-NEXT:    [[I_LCSSA:%.*]] = phi i32 [ [[I]], [[LOOP]] ]
-; CHECK-NEXT:    ret i32 [[I_LCSSA]]
+; CHECK-NEXT:    [[TMP1:%.*]] = icmp eq i32 [[N]], 0
+; CHECK-NEXT:    [[TMP2:%.*]] = select i1 [[TMP1]], i1 true, i1 [[TMP0]]
+; CHECK-NEXT:    [[TMP3:%.*]] = select i1 [[TMP2]], i32 0, i32 [[UMIN1]]
+; CHECK-NEXT:    ret i32 [[TMP3]]
 ;
 entry:
   br label %loop
diff --git a/polly/include/polly/Support/SCEVAffinator.h b/polly/include/polly/Support/SCEVAffinator.h
index f5d771188571..a555f6c3426b 100644
--- a/polly/include/polly/Support/SCEVAffinator.h
+++ b/polly/include/polly/Support/SCEVAffinator.h
@@ -111,6 +111,7 @@ private:
   PWACtx visitSMinExpr(const llvm::SCEVSMinExpr *E);
   PWACtx visitUMaxExpr(const llvm::SCEVUMaxExpr *E);
   PWACtx visitUMinExpr(const llvm::SCEVUMinExpr *E);
+  PWACtx visitSequentialUMinExpr(const llvm::SCEVSequentialUMinExpr *E);
   PWACtx visitUnknown(const llvm::SCEVUnknown *E);
   PWACtx visitSDivInstruction(llvm::Instruction *SDiv);
   PWACtx visitSRemInstruction(llvm::Instruction *SRem);
diff --git a/polly/lib/Support/SCEVAffinator.cpp b/polly/lib/Support/SCEVAffinator.cpp
index abb26357f779..b317702194e3 100644
--- a/polly/lib/Support/SCEVAffinator.cpp
+++ b/polly/lib/Support/SCEVAffinator.cpp
@@ -465,6 +465,11 @@ PWACtx SCEVAffinator::visitUMinExpr(const SCEVUMinExpr *Expr) {
   llvm_unreachable("SCEVUMinExpr not yet supported");
 }
 
+PWACtx
+SCEVAffinator::visitSequentialUMinExpr(const SCEVSequentialUMinExpr *Expr) {
+  llvm_unreachable("SCEVSequentialUMinExpr not yet supported");
+}
+
 PWACtx SCEVAffinator::visitUDivExpr(const SCEVUDivExpr *Expr) {
   // The handling of unsigned division is basically the same as for signed
   // division, except the interpretation of the operands. As the divisor
diff --git a/polly/lib/Support/SCEVValidator.cpp b/polly/lib/Support/SCEVValidator.cpp
index 8f175596d711..e2236fe1d2ac 100644
--- a/polly/lib/Support/SCEVValidator.cpp
+++ b/polly/lib/Support/SCEVValidator.cpp
@@ -332,6 +332,24 @@ public:
     return ValidatorResult(SCEVType::PARAM, Expr);
   }
 
+  class ValidatorResult
+  visitSequentialUMinExpr(const SCEVSequentialUMinExpr *Expr) {
+    // We do not support unsigned min operations. If 'Expr' is constant during
+    // Scop execution we treat this as a parameter, otherwise we bail out.
+    for (int i = 0, e = Expr->getNumOperands(); i < e; ++i) {
+      ValidatorResult Op = visit(Expr->getOperand(i));
+
+      if (!Op.isConstant()) {
+        LLVM_DEBUG(
+            dbgs()
+            << "INVALID: SCEVSequentialUMinExpr has a non-constant operand");
+        return ValidatorResult(SCEVType::INVALID);
+      }
+    }
+
+    return ValidatorResult(SCEVType::PARAM, Expr);
+  }
+
   ValidatorResult visitGenericInst(Instruction *I, const SCEV *S) {
     if (R->contains(I)) {
       LLVM_DEBUG(dbgs() << "INVALID: UnknownExpr references an instruction "
diff --git a/polly/lib/Support/ScopHelper.cpp b/polly/lib/Support/ScopHelper.cpp
index 922107833d4b..2f4f5e74318c 100644
--- a/polly/lib/Support/ScopHelper.cpp
+++ b/polly/lib/Support/ScopHelper.cpp
@@ -391,6 +391,12 @@ private:
       NewOps.push_back(visit(Op));
     return SE.getSMinExpr(NewOps);
   }
+  const SCEV *visitSequentialUMinExpr(const SCEVSequentialUMinExpr *E) {
+    SmallVector<const SCEV *, 4> NewOps;
+    for (const SCEV *Op : E->operands())
+      NewOps.push_back(visit(Op));
+    return SE.getUMinExpr(NewOps, /*Sequential=*/true);
+  }
   const SCEV *visitAddRecExpr(const SCEVAddRecExpr *E) {
     SmallVector<const SCEV *, 4> NewOps;
     for (const SCEV *Op : E->operands())
</cut>
------=_Part_11034_1401630460.1641968209100--
