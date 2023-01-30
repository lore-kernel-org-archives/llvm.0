Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D02560
	for <llvm@lists.linux.dev>; Mon, 30 Jan 2023 13:48:32 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q10so11116494wrm.4
        for <llvm@lists.linux.dev>; Mon, 30 Jan 2023 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuaLuDY0z/yW4nwcBkTAjgnJzoPEQpYgtr0GQWd/sts=;
        b=kwdhzhXpSxsVWQFtaNfIOdcMs+SyJtZKQf68Fwp6nF/9inCzFI7IJjvMS4AIcS141l
         54nv6G6t5EUxNFxF8SwOoWP10uBRqPG1eOzV/xGoqNyHHPzsh8CfcfPJYbXHLwDWCk8j
         yBByt3qogQ8xRmfHplD6S0XNU3onU1f424ko5KLKNkweQXf7DMgW8WxioI9VX+DG8bPX
         izsMpy5fckckVk8XKJIgmD95c0iyAbmucPj1pHJl/nlMpg9eVFCY3BS8EU9EDMzk04oo
         SsbJMprZdVG9+mtYlfMSM+RZyS8cYDcN4iMhmHDX+JlnY9/Ik6Sq+v43ay1OHSq9HYJd
         rAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuaLuDY0z/yW4nwcBkTAjgnJzoPEQpYgtr0GQWd/sts=;
        b=XS846bpz+FmYMhImJYJvzF5a1XRSpiBG55fkfuDcfD3s6hZ8EQASAou2MCueZkOyQs
         4BtVP7IfDEkiNwHueosnOMt1omH3g+t/odCPxVdsrnJY/Xje6mauqjo6D80oGrRS7tME
         aI48dRcOQCVL9/Xtj0j+olUbzCl4sBnO7IzCAFsxMeVssdO/HoLfvqRp21Hiw1TrcK12
         PUQE5w/RuzZTLZeEhil+1r3MNX9NNgrGUYp26v1oV7jEAhQ97LJ7z8x0p4YMg/Fyp/sI
         UkqRu1botSl9CmwlreoCUl6StUSD/RbPThDLCZz9ZD2WUP0fIpDrhHeVAAZOmkHwNtHI
         8RGg==
X-Gm-Message-State: AO0yUKXeY+kvTMv526ZosftZo8We5e9ONkCY6gulq3r7fFMJgAZwCsV/
	8QEkIEeP8qrNME7BPR6Q1dM0QQ==
X-Google-Smtp-Source: AK7set9b+mzmH6jTeKXtxCRJX6qjXg1ahR2z0oW3qhG9n75NGojPfl+lM+RSUrNicf1xsyHnGLsYQA==
X-Received: by 2002:a5d:42c7:0:b0:2bf:e05f:53ac with SMTP id t7-20020a5d42c7000000b002bfe05f53acmr6756203wrr.45.1675086510252;
        Mon, 30 Jan 2023 05:48:30 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id r7-20020a5d52c7000000b002bdf5832843sm11874374wrv.66.2023.01.30.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 05:48:29 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 30 Jan 2023 13:48:28 +0000 (UTC)
To: Florian Hahn <flo@fhahn.com>
Cc: llvm@lists.linux.dev
Message-ID: <674739929.6875.1675086509710@jenkins.jenkins>
Subject: [TCWG CI] Failure after llvmorg-16-init-18491-gde122cb92008: [SCCP]
 Use range info to prove AddInst has NUW flag.
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6874_1020568495.1675086509127"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_6874_1020568495.1675086509127
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after llvmorg-16-init-18491-gde122cb92008: [SCCP] Use range info to prove AddInst has NUW flag.:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21631
# First few build errors in logs:
# 00:01:23 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:01:23 make[2]: *** [scripts/Makefile.build:252: mm/filemap.o] Error 1
# 00:01:29 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:01:30 make[2]: *** [scripts/Makefile.build:252: mm/oom_kill.o] Error 1
# 00:01:44 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:01:44 make[2]: *** [scripts/Makefile.build:252: mm/swap.o] Error 1
# 00:02:28 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:02:28 make[2]: *** [scripts/Makefile.build:252: mm/compaction.o] Error 1
# 00:02:56 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:02:56 make[2]: *** [scripts/Makefile.build:252: mm/mprotect.o] Error 1

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21716
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-646 .
Status of llvmorg-16-init-18491-gde122cb92008 commit for tcwg_kernel:
commit de122cb920080fd9e24b2777114271fbef932d5e
Author: Florian Hahn <flo@fhahn.com>
Date:   Tue Jan 24 20:53:06 2023 +0000

    [SCCP] Use range info to prove AddInst has NUW flag.
    
    This patch updates SCCP to use the value ranges of AddInst operands to
    try to prove the AddInst does not overflow in the unsigned sense and
    adds the NUW flag. The reasoning is done with
    makeGuaranteedNoWrapRegion (thanks @nikic for point it out!).
    
    Follow-ups will include adding NSW and extension to more
    OverflowingBinaryOperators.
    
    Reviewed By: nikic
    
    Differential Revision: https://reviews.llvm.org/D142387
* llvm-master-aarch64-mainline-allyesconfig
** Failure after llvmorg-16-init-18491-gde122cb92008: [SCCP] Use range info to prove AddInst has NUW flag.:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-allyesconfig/550/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-allyesconfig/550/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-allyesconfig/549/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-llvm-de122cb920080fd9e24b2777114271fbef932d5e
cd investigate-llvm-de122cb920080fd9e24b2777114271fbef932d5e

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-allyesconfig/550/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-allyesconfig/549/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit de122cb920080fd9e24b2777114271fbef932d5e
Author: Florian Hahn <flo@fhahn.com>
Date:   Tue Jan 24 20:53:06 2023 +0000

    [SCCP] Use range info to prove AddInst has NUW flag.
    
    This patch updates SCCP to use the value ranges of AddInst operands to
    try to prove the AddInst does not overflow in the unsigned sense and
    adds the NUW flag. The reasoning is done with
    makeGuaranteedNoWrapRegion (thanks @nikic for point it out!).
    
    Follow-ups will include adding NSW and extension to more
    OverflowingBinaryOperators.
    
    Reviewed By: nikic
    
    Differential Revision: https://reviews.llvm.org/D142387
---
 llvm/lib/Transforms/Utils/SCCPSolver.cpp           | 49 ++++++++++++++++------
 llvm/test/Transforms/SCCP/add-nuw-nsw-flags.ll     | 10 ++---
 llvm/test/Transforms/SCCP/binaryops-constexprs.ll  |  2 +-
 .../SCCP/conditions-ranges-with-undef.ll           |  4 +-
 llvm/test/Transforms/SCCP/conditions-ranges.ll     |  6 +--
 llvm/test/Transforms/SCCP/ip-add-range-to-call.ll  |  2 +-
 llvm/test/Transforms/SCCP/ip-constant-ranges.ll    | 10 ++---
 llvm/test/Transforms/SCCP/ip-ranges-binaryops.ll   | 14 +++----
 llvm/test/Transforms/SCCP/ip-ranges-casts.ll       | 18 ++++----
 llvm/test/Transforms/SCCP/ip-ranges-phis.ll        | 24 +++++------
 llvm/test/Transforms/SCCP/ip-ranges-select.ll      |  4 +-
 llvm/test/Transforms/SCCP/return-argument.ll       |  4 +-
 llvm/test/Transforms/SCCP/return-constants.ll      |  2 +-
 llvm/test/Transforms/SCCP/widening.ll              | 18 ++++----
 14 files changed, 95 insertions(+), 72 deletions(-)

diff --git a/llvm/lib/Transforms/Utils/SCCPSolver.cpp b/llvm/lib/Transforms/Utils/SCCPSolver.cpp
index 8d03a0d8a2c4..7b6fc62ac405 100644
--- a/llvm/lib/Transforms/Utils/SCCPSolver.cpp
+++ b/llvm/lib/Transforms/Utils/SCCPSolver.cpp
@@ -41,6 +41,14 @@ static ValueLatticeElement::MergeOptions getMaxWidenStepsOpts() {
       MaxNumRangeExtensions);
 }
 
+static ConstantRange getConstantRange(const ValueLatticeElement &LV, Type *Ty,
+                                      bool UndefAllowed = true) {
+  assert(Ty->isIntOrIntVectorTy() && "Should be int or int vector");
+  if (LV.isConstantRange(UndefAllowed))
+    return LV.getConstantRange();
+  return ConstantRange::getFull(Ty->getScalarSizeInBits());
+}
+
 namespace llvm {
 
 bool SCCPSolver::isConstant(const ValueLatticeElement &LV) {
@@ -115,8 +123,10 @@ bool SCCPSolver::tryToReplaceWithConstant(Value *V) {
   return true;
 }
 
-/// Try to replace signed instructions with their unsigned equivalent.
-static bool replaceSignedInst(SCCPSolver &Solver,
+/// Try to replace refine \p Inst with information of its value ranges from \p
+/// Solver. For example, SExts are replaced by ZExt, if the value range of the
+/// result is non-negative.
+static bool refineInstruction(SCCPSolver &Solver,
                               SmallPtrSetImpl<Value *> &InsertedValues,
                               Instruction &Inst) {
   // Determine if a signed value is known to be >= 0.
@@ -164,6 +174,29 @@ static bool replaceSignedInst(SCCPSolver &Solver,
     NewInst = BinaryOperator::Create(NewOpcode, Op0, Op1, "", &Inst);
     break;
   }
+  case Instruction::Add: {
+    auto GetRange = [&Solver, &InsertedValues](Value *Op) {
+      unsigned Bitwidth = Op->getType()->getScalarSizeInBits();
+      if (InsertedValues.contains(Op) || isa<UndefValue>(Op))
+        return ConstantRange::getFull(Bitwidth);
+      if (auto *Const = dyn_cast<ConstantInt>(Op))
+        return ConstantRange(Const->getValue());
+
+      return getConstantRange(Solver.getLatticeValueFor(Op), Op->getType(),
+                              /*UndefAllowed=*/false);
+    };
+
+    auto RangeA = GetRange(Inst.getOperand(0));
+    auto RangeB = GetRange(Inst.getOperand(1));
+    auto NUWRange = ConstantRange::makeGuaranteedNoWrapRegion(
+        Instruction::Add, RangeB, OverflowingBinaryOperator::NoUnsignedWrap);
+    if (!Inst.hasNoUnsignedWrap() && NUWRange.contains(RangeA)) {
+      Inst.setHasNoUnsignedWrap();
+      return true;
+    }
+
+    return false;
+  }
   default:
     return false;
   }
@@ -192,7 +225,7 @@ bool SCCPSolver::simplifyInstsInBlock(BasicBlock &BB,
 
       MadeChanges = true;
       ++InstRemovedStat;
-    } else if (replaceSignedInst(*this, InsertedValues, Inst)) {
+    } else if (refineInstruction(*this, InsertedValues, Inst)) {
       MadeChanges = true;
       ++InstReplacedStat;
     }
@@ -682,7 +715,6 @@ public:
   bool isStructLatticeConstant(Function *F, StructType *STy);
 
   Constant *getConstant(const ValueLatticeElement &LV) const;
-  ConstantRange getConstantRange(const ValueLatticeElement &LV, Type *Ty) const;
 
   SmallPtrSetImpl<Function *> &getArgumentTrackedFunctions() {
     return TrackingIncomingArguments;
@@ -783,15 +815,6 @@ Constant *SCCPInstVisitor::getConstant(const ValueLatticeElement &LV) const {
   return nullptr;
 }
 
-ConstantRange
-SCCPInstVisitor::getConstantRange(const ValueLatticeElement &LV,
-                                  Type *Ty) const {
-  assert(Ty->isIntOrIntVectorTy() && "Should be int or int vector");
-  if (LV.isConstantRange())
-    return LV.getConstantRange();
-  return ConstantRange::getFull(Ty->getScalarSizeInBits());
-}
-
 void SCCPInstVisitor::markArgInFuncSpecialization(
     Function *F, const SmallVectorImpl<ArgInfo> &Args) {
   assert(!Args.empty() && "Specialization without arguments");
diff --git a/llvm/test/Transforms/SCCP/add-nuw-nsw-flags.ll b/llvm/test/Transforms/SCCP/add-nuw-nsw-flags.ll
index 6ab9c41c20f6..a6f5f176e5ad 100644
--- a/llvm/test/Transforms/SCCP/add-nuw-nsw-flags.ll
+++ b/llvm/test/Transforms/SCCP/add-nuw-nsw-flags.ll
@@ -5,8 +5,8 @@ define i8 @range_from_lshr(i8 %a) {
 ; CHECK-LABEL: @range_from_lshr(
 ; CHECK-NEXT:  entry:
 ; CHECK-NEXT:    [[A_SHR:%.*]] = lshr i8 [[A:%.*]], 1
-; CHECK-NEXT:    [[ADD_1:%.*]] = add i8 [[A_SHR]], 1
-; CHECK-NEXT:    [[ADD_2:%.*]] = add i8 [[A_SHR]], -128
+; CHECK-NEXT:    [[ADD_1:%.*]] = add nuw i8 [[A_SHR]], 1
+; CHECK-NEXT:    [[ADD_2:%.*]] = add nuw i8 [[A_SHR]], -128
 ; CHECK-NEXT:    [[ADD_3:%.*]] = add i8 [[A_SHR]], -127
 ; CHECK-NEXT:    [[ADD_4:%.*]] = add i8 [[A_SHR]], -1
 ; CHECK-NEXT:    [[RES_1:%.*]] = xor i8 [[ADD_1]], [[ADD_2]]
@@ -30,7 +30,7 @@ define i8 @a_and_15_add_1(i8 %a) {
 ; CHECK-LABEL: @a_and_15_add_1(
 ; CHECK-NEXT:  entry:
 ; CHECK-NEXT:    [[A_AND:%.*]] = and i8 [[A:%.*]], 15
-; CHECK-NEXT:    [[ADD_1:%.*]] = add i8 [[A_AND]], 1
+; CHECK-NEXT:    [[ADD_1:%.*]] = add nuw i8 [[A_AND]], 1
 ; CHECK-NEXT:    ret i8 [[ADD_1]]
 ;
 entry:
@@ -73,9 +73,9 @@ define i8 @sge_0_and_sle_90(i8 %a) {
 ; CHECK-NEXT:    [[AND:%.*]] = and i1 [[SGT]], [[SLT]]
 ; CHECK-NEXT:    br i1 [[AND]], label [[THEN:%.*]], label [[ELSE:%.*]]
 ; CHECK:       then:
-; CHECK-NEXT:    [[ADD_1:%.*]] = add i8 [[A]], 1
+; CHECK-NEXT:    [[ADD_1:%.*]] = add nuw i8 [[A]], 1
 ; CHECK-NEXT:    [[ADD_2:%.*]] = add i8 [[A]], -1
-; CHECK-NEXT:    [[ADD_3:%.*]] = add i8 [[A]], -91
+; CHECK-NEXT:    [[ADD_3:%.*]] = add nuw i8 [[A]], -91
 ; CHECK-NEXT:    [[ADD_4:%.*]] = add i8 [[A]], -90
 ; CHECK-NEXT:    [[RES_1:%.*]] = xor i8 [[ADD_1]], [[ADD_2]]
 ; CHECK-NEXT:    [[RES_2:%.*]] = xor i8 [[RES_1]], [[ADD_3]]
diff --git a/llvm/test/Transforms/SCCP/binaryops-constexprs.ll b/llvm/test/Transforms/SCCP/binaryops-constexprs.ll
index 43dacf23effd..ae69af82e68f 100644
--- a/llvm/test/Transforms/SCCP/binaryops-constexprs.ll
+++ b/llvm/test/Transforms/SCCP/binaryops-constexprs.ll
@@ -36,7 +36,7 @@ entry:
 define void @add_constexpr(i32 %a) {
 ; CHECK-LABEL: @add_constexpr(
 ; CHECK-NEXT:  entry:
-; CHECK-NEXT:    [[ADD_1:%.*]] = add i32 0, [[A:%.*]]
+; CHECK-NEXT:    [[ADD_1:%.*]] = add nuw i32 0, [[A:%.*]]
 ; CHECK-NEXT:    call void @use.i32(i32 [[ADD_1]])
 ; CHECK-NEXT:    [[ADD_2:%.*]] = add i32 20, [[A]]
 ; CHECK-NEXT:    call void @use.i32(i32 [[ADD_2]])
diff --git a/llvm/test/Transforms/SCCP/conditions-ranges-with-undef.ll b/llvm/test/Transforms/SCCP/conditions-ranges-with-undef.ll
index ea45bc190657..78ad64b0a25b 100644
--- a/llvm/test/Transforms/SCCP/conditions-ranges-with-undef.ll
+++ b/llvm/test/Transforms/SCCP/conditions-ranges-with-undef.ll
@@ -8,7 +8,7 @@ declare void @use(i1)
 define void @val_undef_eq() {
 ; CHECK-LABEL: @val_undef_eq(
 ; CHECK-NEXT:  entry:
-; CHECK-NEXT:    [[A:%.*]] = add i32 undef, 0
+; CHECK-NEXT:    [[A:%.*]] = add nuw i32 undef, 0
 ; CHECK-NEXT:    [[BC_1:%.*]] = icmp eq i32 [[A]], 10
 ; CHECK-NEXT:    br i1 [[BC_1]], label [[TRUE:%.*]], label [[FALSE:%.*]]
 ; CHECK:       true:
@@ -41,7 +41,7 @@ declare void @use.i32(i32)
 define void @val_undef_range() {
 ; CHECK-LABEL: @val_undef_range(
 ; CHECK-NEXT:  entry:
-; CHECK-NEXT:    [[A:%.*]] = add i32 undef, 0
+; CHECK-NEXT:    [[A:%.*]] = add nuw i32 undef, 0
 ; CHECK-NEXT:    [[BC_1:%.*]] = icmp ult i32 [[A]], 127
 ; CHECK-NEXT:    br i1 [[BC_1]], label [[TRUE:%.*]], label [[FALSE:%.*]]
 ; CHECK:       true:
diff --git a/llvm/test/Transforms/SCCP/conditions-ranges.ll b/llvm/test/Transforms/SCCP/conditions-ranges.ll
index 3de2e9ca72a9..a271e4d0064a 100644
--- a/llvm/test/Transforms/SCCP/conditions-ranges.ll
+++ b/llvm/test/Transforms/SCCP/conditions-ranges.ll
@@ -7,7 +7,7 @@ define void @f1(i32 %a, i32 %b) {
 ; CHECK-LABEL: @f1(
 ; CHECK-NEXT:  entry:
 ; CHECK-NEXT:    [[A_255:%.*]] = and i32 [[A:%.*]], 255
-; CHECK-NEXT:    [[A_2:%.*]] = add i32 [[A_255]], 20
+; CHECK-NEXT:    [[A_2:%.*]] = add nuw i32 [[A_255]], 20
 ; CHECK-NEXT:    [[BC:%.*]] = icmp ugt i32 [[B:%.*]], [[A_2]]
 ; CHECK-NEXT:    br i1 [[BC]], label [[TRUE:%.*]], label [[FALSE:%.*]]
 ; CHECK:       true:
@@ -260,7 +260,7 @@ define void @f8_nested_conds(i32 %a, i32 %b) {
 ; CHECK-LABEL: @f8_nested_conds(
 ; CHECK-NEXT:  entry:
 ; CHECK-NEXT:    [[A_255:%.*]] = and i32 [[A:%.*]], 255
-; CHECK-NEXT:    [[A_2:%.*]] = add i32 [[A_255]], 20
+; CHECK-NEXT:    [[A_2:%.*]] = add nuw i32 [[A_255]], 20
 ; CHECK-NEXT:    [[BC_1:%.*]] = icmp ugt i32 [[B:%.*]], [[A_2]]
 ; CHECK-NEXT:    br i1 [[BC_1]], label [[TRUE:%.*]], label [[FALSE:%.*]]
 ; CHECK:       true:
@@ -718,7 +718,7 @@ define void @loop() {
 ; CHECK-NEXT:    [[INC27]] = add nsw i32 [[I_0]], 1
 ; CHECK-NEXT:    br label [[FOR_COND]]
 ; CHECK:       for.body14:
-; CHECK-NEXT:    [[INC]] = add nsw i32 [[J_0]], 1
+; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[J_0]], 1
 ; CHECK-NEXT:    br label [[FOR_COND11]]
 ;
 entry:
diff --git a/llvm/test/Transforms/SCCP/ip-add-range-to-call.ll b/llvm/test/Transforms/SCCP/ip-add-range-to-call.ll
index c114b7a95639..331f05088ab9 100644
--- a/llvm/test/Transforms/SCCP/ip-add-range-to-call.ll
+++ b/llvm/test/Transforms/SCCP/ip-add-range-to-call.ll
@@ -15,7 +15,7 @@ define i32 @caller1() {
 ; CHECK-LABEL: @caller1(
 ; CHECK-NEXT:    [[C1:%.*]] = call i32 @callee(i32 10), !range [[RNG0:![0-9]+]]
 ; CHECK-NEXT:    [[C2:%.*]] = call i32 @callee(i32 20), !range [[RNG0]]
-; CHECK-NEXT:    [[A:%.*]] = add i32 [[C1]], [[C2]]
+; CHECK-NEXT:    [[A:%.*]] = add nuw i32 [[C1]], [[C2]]
 ; CHECK-NEXT:    ret i32 [[A]]
 ;
   %c1 = call i32 @callee(i32 10)
diff --git a/llvm/test/Transforms/SCCP/ip-constant-ranges.ll b/llvm/test/Transforms/SCCP/ip-constant-ranges.ll
index 72f308bcd7ce..6e805f52e892 100644
--- a/llvm/test/Transforms/SCCP/ip-constant-ranges.ll
+++ b/llvm/test/Transforms/SCCP/ip-constant-ranges.ll
@@ -33,9 +33,9 @@ define internal i32 @f2(i32 %x) {
 ; CHECK-NEXT:    [[CMP4:%.*]] = icmp ugt i32 [[X]], 300
 ; CHECK-NEXT:    [[RES1:%.*]] = select i1 [[CMP]], i32 1, i32 2
 ; CHECK-NEXT:    [[RES4:%.*]] = select i1 [[CMP4]], i32 3, i32 4
-; CHECK-NEXT:    [[RES6:%.*]] = add i32 [[RES1]], 3
-; CHECK-NEXT:    [[RES7:%.*]] = add i32 5, [[RES4]]
-; CHECK-NEXT:    [[RES:%.*]] = add i32 [[RES6]], 5
+; CHECK-NEXT:    [[RES6:%.*]] = add nuw i32 [[RES1]], 3
+; CHECK-NEXT:    [[RES7:%.*]] = add nuw i32 5, [[RES4]]
+; CHECK-NEXT:    [[RES:%.*]] = add nuw i32 [[RES6]], 5
 ; CHECK-NEXT:    ret i32 [[RES]]
 ;
 entry:
@@ -63,8 +63,8 @@ define i32 @caller1() {
 ; CHECK-NEXT:    [[CALL2:%.*]] = tail call i32 @f1(i32 47, i32 999)
 ; CHECK-NEXT:    [[CALL3:%.*]] = tail call i32 @f2(i32 47)
 ; CHECK-NEXT:    [[CALL4:%.*]] = tail call i32 @f2(i32 301)
-; CHECK-NEXT:    [[RES_1:%.*]] = add nsw i32 12, [[CALL3]]
-; CHECK-NEXT:    [[RES_2:%.*]] = add nsw i32 [[RES_1]], [[CALL4]]
+; CHECK-NEXT:    [[RES_1:%.*]] = add nuw nsw i32 12, [[CALL3]]
+; CHECK-NEXT:    [[RES_2:%.*]] = add nuw nsw i32 [[RES_1]], [[CALL4]]
 ; CHECK-NEXT:    ret i32 [[RES_2]]
 ;
 entry:
diff --git a/llvm/test/Transforms/SCCP/ip-ranges-binaryops.ll b/llvm/test/Transforms/SCCP/ip-ranges-binaryops.ll
index ab57d7aef4b9..2d29597b48c7 100644
--- a/llvm/test/Transforms/SCCP/ip-ranges-binaryops.ll
+++ b/llvm/test/Transforms/SCCP/ip-ranges-binaryops.ll
@@ -5,13 +5,13 @@
 ; x + y = [110, 221)
 define internal i1 @f.add(i32 %x, i32 %y) {
 ; CHECK-LABEL: @f.add(
-; CHECK-NEXT:    [[A_1:%.*]] = add i32 [[X:%.*]], [[Y:%.*]]
+; CHECK-NEXT:    [[A_1:%.*]] = add nuw i32 [[X:%.*]], [[Y:%.*]]
 ; CHECK-NEXT:    [[C_2:%.*]] = icmp sgt i32 [[A_1]], 219
 ; CHECK-NEXT:    [[C_4:%.*]] = icmp slt i32 [[A_1]], 111
 ; CHECK-NEXT:    [[C_5:%.*]] = icmp eq i32 [[A_1]], 150
 ; CHECK-NEXT:    [[C_6:%.*]] = icmp slt i32 [[A_1]], 150
-; CHECK-NEXT:    [[RES_1:%.*]] = add i1 false, [[C_2]]
-; CHECK-NEXT:    [[RES_2:%.*]] = add i1 [[RES_1]], false
+; CHECK-NEXT:    [[RES_1:%.*]] = add nuw i1 false, [[C_2]]
+; CHECK-NEXT:    [[RES_2:%.*]] = add nuw i1 [[RES_1]], false
 ; CHECK-NEXT:    [[RES_3:%.*]] = add i1 [[RES_2]], [[C_4]]
 ; CHECK-NEXT:    [[RES_4:%.*]] = add i1 [[RES_3]], [[C_5]]
 ; CHECK-NEXT:    [[RES_5:%.*]] = add i1 [[RES_4]], [[C_6]]
@@ -55,8 +55,8 @@ define internal i1 @f.sub(i32 %x, i32 %y) {
 ; CHECK-NEXT:    [[C_4:%.*]] = icmp slt i32 [[A_1]], -189
 ; CHECK-NEXT:    [[C_5:%.*]] = icmp eq i32 [[A_1]], -150
 ; CHECK-NEXT:    [[C_6:%.*]] = icmp slt i32 [[A_1]], -150
-; CHECK-NEXT:    [[RES_1:%.*]] = add i1 false, [[C_2]]
-; CHECK-NEXT:    [[RES_2:%.*]] = add i1 [[RES_1]], false
+; CHECK-NEXT:    [[RES_1:%.*]] = add nuw i1 false, [[C_2]]
+; CHECK-NEXT:    [[RES_2:%.*]] = add nuw i1 [[RES_1]], false
 ; CHECK-NEXT:    [[RES_3:%.*]] = add i1 [[RES_2]], [[C_4]]
 ; CHECK-NEXT:    [[RES_4:%.*]] = add i1 [[RES_3]], [[C_5]]
 ; CHECK-NEXT:    [[RES_5:%.*]] = add i1 [[RES_4]], [[C_6]]
@@ -99,8 +99,8 @@ define internal i1 @f.mul(i32 %x, i32 %y) {
 ; CHECK-NEXT:    [[C_4:%.*]] = icmp slt i32 [[A_1]], 1001
 ; CHECK-NEXT:    [[C_5:%.*]] = icmp eq i32 [[A_1]], 1500
 ; CHECK-NEXT:    [[C_6:%.*]] = icmp slt i32 [[A_1]], 1500
-; CHECK-NEXT:    [[RES_1:%.*]] = add i1 false, [[C_2]]
-; CHECK-NEXT:    [[RES_2:%.*]] = add i1 [[RES_1]], false
+; CHECK-NEXT:    [[RES_1:%.*]] = add nuw i1 false, [[C_2]]
+; CHECK-NEXT:    [[RES_2:%.*]] = add nuw i1 [[RES_1]], false
 ; CHECK-NEXT:    [[RES_3:%.*]] = add i1 [[RES_2]], [[C_4]]
 ; CHECK-NEXT:    [[RES_4:%.*]] = add i1 [[RES_3]], [[C_5]]
 ; CHECK-NEXT:    [[RES_5:%.*]] = add i1 [[RES_4]], [[C_6]]
diff --git a/llvm/test/Transforms/SCCP/ip-ranges-casts.ll b/llvm/test/Transforms/SCCP/ip-ranges-casts.ll
index bcbddb3c6b95..305c6231208c 100644
--- a/llvm/test/Transforms/SCCP/ip-ranges-casts.ll
+++ b/llvm/test/Transforms/SCCP/ip-ranges-casts.ll
@@ -7,8 +7,8 @@ define internal i1 @f.trunc(i32 %x) {
 ; CHECK-NEXT:    [[T_1:%.*]] = trunc i32 [[X:%.*]] to i16
 ; CHECK-NEXT:    [[C_2:%.*]] = icmp sgt i16 [[T_1]], 299
 ; CHECK-NEXT:    [[C_4:%.*]] = icmp slt i16 [[T_1]], 101
-; CHECK-NEXT:    [[RES_1:%.*]] = add i1 false, [[C_2]]
-; CHECK-NEXT:    [[RES_2:%.*]] = add i1 [[RES_1]], false
+; CHECK-NEXT:    [[RES_1:%.*]] = add nuw i1 false, [[C_2]]
+; CHECK-NEXT:    [[RES_2:%.*]] = add nuw i1 [[RES_1]], false
 ; CHECK-NEXT:    [[RES_3:%.*]] = add i1 [[RES_2]], [[C_4]]
 ; CHECK-NEXT:    [[T_2:%.*]] = trunc i32 [[X]] to i8
 ; CHECK-NEXT:    [[C_5:%.*]] = icmp sgt i8 [[T_2]], 44
@@ -62,8 +62,8 @@ define internal i1 @f.zext(i32 %x, i32 %y) {
 ; CHECK-NEXT:    [[T_1:%.*]] = zext i32 [[X:%.*]] to i64
 ; CHECK-NEXT:    [[C_2:%.*]] = icmp sgt i64 [[T_1]], 299
 ; CHECK-NEXT:    [[C_4:%.*]] = icmp slt i64 [[T_1]], 101
-; CHECK-NEXT:    [[RES_1:%.*]] = add i1 false, [[C_2]]
-; CHECK-NEXT:    [[RES_2:%.*]] = add i1 [[RES_1]], false
+; CHECK-NEXT:    [[RES_1:%.*]] = add nuw i1 false, [[C_2]]
+; CHECK-NEXT:    [[RES_2:%.*]] = add nuw i1 [[RES_1]], false
 ; CHECK-NEXT:    [[RES_3:%.*]] = add i1 [[RES_2]], [[C_4]]
 ; CHECK-NEXT:    [[T_2:%.*]] = zext i32 [[Y:%.*]] to i64
 ; CHECK-NEXT:    [[C_5:%.*]] = icmp sgt i64 [[T_2]], 300
@@ -71,7 +71,7 @@ define internal i1 @f.zext(i32 %x, i32 %y) {
 ; CHECK-NEXT:    [[C_8:%.*]] = icmp slt i64 [[T_2]], 1
 ; CHECK-NEXT:    [[RES_4:%.*]] = add i1 [[RES_3]], [[C_5]]
 ; CHECK-NEXT:    [[RES_5:%.*]] = add i1 [[RES_4]], [[C_6]]
-; CHECK-NEXT:    [[RES_6:%.*]] = add i1 [[RES_5]], false
+; CHECK-NEXT:    [[RES_6:%.*]] = add nuw i1 [[RES_5]], false
 ; CHECK-NEXT:    [[RES_7:%.*]] = add i1 [[RES_6]], [[C_8]]
 ; CHECK-NEXT:    ret i1 [[RES_7]]
 ;
@@ -115,15 +115,15 @@ define internal i1 @f.sext(i32 %x, i32 %y) {
 ; CHECK-NEXT:    [[T_1:%.*]] = zext i32 [[X:%.*]] to i64
 ; CHECK-NEXT:    [[C_2:%.*]] = icmp sgt i64 [[T_1]], 299
 ; CHECK-NEXT:    [[C_4:%.*]] = icmp slt i64 [[T_1]], 101
-; CHECK-NEXT:    [[RES_1:%.*]] = add i1 false, [[C_2]]
-; CHECK-NEXT:    [[RES_2:%.*]] = add i1 [[RES_1]], false
+; CHECK-NEXT:    [[RES_1:%.*]] = add nuw i1 false, [[C_2]]
+; CHECK-NEXT:    [[RES_2:%.*]] = add nuw i1 [[RES_1]], false
 ; CHECK-NEXT:    [[RES_3:%.*]] = add i1 [[RES_2]], [[C_4]]
 ; CHECK-NEXT:    [[T_2:%.*]] = sext i32 [[Y:%.*]] to i64
 ; CHECK-NEXT:    [[C_6:%.*]] = icmp sgt i64 [[T_2]], 899
 ; CHECK-NEXT:    [[C_8:%.*]] = icmp slt i64 [[T_2]], -119
-; CHECK-NEXT:    [[RES_4:%.*]] = add i1 [[RES_3]], false
+; CHECK-NEXT:    [[RES_4:%.*]] = add nuw i1 [[RES_3]], false
 ; CHECK-NEXT:    [[RES_5:%.*]] = add i1 [[RES_4]], [[C_6]]
-; CHECK-NEXT:    [[RES_6:%.*]] = add i1 [[RES_5]], false
+; CHECK-NEXT:    [[RES_6:%.*]] = add nuw i1 [[RES_5]], false
 ; CHECK-NEXT:    [[RES_7:%.*]] = add i1 [[RES_6]], [[C_8]]
 ; CHECK-NEXT:    ret i1 [[RES_7]]
 ;
diff --git a/llvm/test/Transforms/SCCP/ip-ranges-phis.ll b/llvm/test/Transforms/SCCP/ip-ranges-phis.ll
index 42a4bd9cf227..7f1e14dc33ea 100644
--- a/llvm/test/Transforms/SCCP/ip-ranges-phis.ll
+++ b/llvm/test/Transforms/SCCP/ip-ranges-phis.ll
@@ -55,12 +55,12 @@ define internal i32 @f2(i32 %x, i32 %y, i32 %z, i1 %cmp.1, i1 %cmp.2) {
 ; CHECK-NEXT:    [[V_1:%.*]] = select i1 [[C_1]], i32 10, i32 100
 ; CHECK-NEXT:    [[V_2:%.*]] = select i1 [[C_2]], i32 20, i32 200
 ; CHECK-NEXT:    [[V_3:%.*]] = select i1 [[C_3]], i32 30, i32 300
-; CHECK-NEXT:    [[R_1:%.*]] = add i32 [[V_1]], [[V_2]]
-; CHECK-NEXT:    [[R_2:%.*]] = add i32 [[R_1]], [[V_3]]
-; CHECK-NEXT:    [[R_3:%.*]] = add i32 [[R_2]], 400
-; CHECK-NEXT:    [[R_4:%.*]] = add i32 [[R_3]], 50
-; CHECK-NEXT:    [[R_5:%.*]] = add i32 [[R_4]], 60
-; CHECK-NEXT:    [[R_6:%.*]] = add i32 [[R_4]], 700
+; CHECK-NEXT:    [[R_1:%.*]] = add nuw i32 [[V_1]], [[V_2]]
+; CHECK-NEXT:    [[R_2:%.*]] = add nuw i32 [[R_1]], [[V_3]]
+; CHECK-NEXT:    [[R_3:%.*]] = add nuw i32 [[R_2]], 400
+; CHECK-NEXT:    [[R_4:%.*]] = add nuw i32 [[R_3]], 50
+; CHECK-NEXT:    [[R_5:%.*]] = add nuw i32 [[R_4]], 60
+; CHECK-NEXT:    [[R_6:%.*]] = add nuw i32 [[R_4]], 700
 ; CHECK-NEXT:    ret i32 [[R_6]]
 ;
 
@@ -154,12 +154,12 @@ define internal i32 @f3(i32 %x, i32 %y, i1 %cmp.1) {
 ; CHECK-NEXT:    [[V_5:%.*]] = select i1 [[C_5]], i32 50, i32 500
 ; CHECK-NEXT:    [[V_6:%.*]] = select i1 [[C_6]], i32 60, i32 600
 ; CHECK-NEXT:    [[V_7:%.*]] = select i1 [[C_7]], i32 70, i32 700
-; CHECK-NEXT:    [[R_1:%.*]] = add i32 [[V_1]], [[V_2]]
-; CHECK-NEXT:    [[R_2:%.*]] = add i32 [[R_1]], [[V_3]]
-; CHECK-NEXT:    [[R_3:%.*]] = add i32 [[R_2]], [[V_4]]
-; CHECK-NEXT:    [[R_4:%.*]] = add i32 [[R_3]], [[V_5]]
-; CHECK-NEXT:    [[R_5:%.*]] = add i32 [[R_4]], [[V_6]]
-; CHECK-NEXT:    [[R_6:%.*]] = add i32 [[R_4]], [[V_7]]
+; CHECK-NEXT:    [[R_1:%.*]] = add nuw i32 [[V_1]], [[V_2]]
+; CHECK-NEXT:    [[R_2:%.*]] = add nuw i32 [[R_1]], [[V_3]]
+; CHECK-NEXT:    [[R_3:%.*]] = add nuw i32 [[R_2]], [[V_4]]
+; CHECK-NEXT:    [[R_4:%.*]] = add nuw i32 [[R_3]], [[V_5]]
+; CHECK-NEXT:    [[R_5:%.*]] = add nuw i32 [[R_4]], [[V_6]]
+; CHECK-NEXT:    [[R_6:%.*]] = add nuw i32 [[R_4]], [[V_7]]
 ; CHECK-NEXT:    ret i32 [[R_6]]
 ;
 
diff --git a/llvm/test/Transforms/SCCP/ip-ranges-select.ll b/llvm/test/Transforms/SCCP/ip-ranges-select.ll
index 2173580cafb2..421fc3c5a2f8 100644
--- a/llvm/test/Transforms/SCCP/ip-ranges-select.ll
+++ b/llvm/test/Transforms/SCCP/ip-ranges-select.ll
@@ -44,9 +44,9 @@ define internal i1 @f1(i32 %x, i32 %y, i1 %cmp) {
 ; CHECK-NEXT:    [[SEL_1:%.*]] = select i1 [[CMP]], i32 [[X]], i32 [[Y]]
 ; CHECK-NEXT:    [[C_2:%.*]] = icmp sgt i32 [[SEL_1]], 100
 ; CHECK-NEXT:    [[C_3:%.*]] = icmp eq i32 [[SEL_1]], 50
-; CHECK-NEXT:    [[RES_1:%.*]] = add i1 false, [[C_2]]
+; CHECK-NEXT:    [[RES_1:%.*]] = add nuw i1 false, [[C_2]]
 ; CHECK-NEXT:    [[RES_2:%.*]] = add i1 [[RES_1]], [[C_3]]
-; CHECK-NEXT:    [[RES_3:%.*]] = add i1 [[RES_2]], false
+; CHECK-NEXT:    [[RES_3:%.*]] = add nuw i1 [[RES_2]], false
 ; CHECK-NEXT:    ret i1 [[RES_3]]
 ;
   %sel.1 = select i1 %cmp, i32 %x, i32 %y
diff --git a/llvm/test/Transforms/SCCP/return-argument.ll b/llvm/test/Transforms/SCCP/return-argument.ll
index 3995966f994a..51a44fdd8b9f 100644
--- a/llvm/test/Transforms/SCCP/return-argument.ll
+++ b/llvm/test/Transforms/SCCP/return-argument.ll
@@ -33,7 +33,7 @@ F:              ; preds = %0
 ;; value
 define internal { i32, i32 } @foo(i32 %A, i32 %B) {
 ; CHECK-LABEL: @foo(
-; CHECK-NEXT:    [[X:%.*]] = add i32 [[A:%.*]], [[B:%.*]]
+; CHECK-NEXT:    [[X:%.*]] = add nuw i32 [[A:%.*]], [[B:%.*]]
 ; CHECK-NEXT:    [[Y:%.*]] = insertvalue { i32, i32 } undef, i32 [[A]], 0
 ; CHECK-NEXT:    [[Z:%.*]] = insertvalue { i32, i32 } [[Y]], i32 [[X]], 1
 ; CHECK-NEXT:    ret { i32, i32 } [[Z]]
@@ -54,7 +54,7 @@ define void @caller(i1 %C) personality ptr @__gxx_personality_v0 {
 ; CHECK-NEXT:    to label [[OK:%.*]] unwind label [[LPAD:%.*]]
 ; CHECK:       OK:
 ; CHECK-NEXT:    [[X2:%.*]] = extractvalue { i32, i32 } [[S2]], 0
-; CHECK-NEXT:    [[Z:%.*]] = add i32 [[X1]], [[X2]]
+; CHECK-NEXT:    [[Z:%.*]] = add nuw i32 [[X1]], [[X2]]
 ; CHECK-NEXT:    store i32 [[Z]], ptr [[W]], align 4
 ; CHECK-NEXT:    br label [[RET:%.*]]
 ; CHECK:       LPAD:
diff --git a/llvm/test/Transforms/SCCP/return-constants.ll b/llvm/test/Transforms/SCCP/return-constants.ll
index 9f48844c0225..4286382a5bc9 100644
--- a/llvm/test/Transforms/SCCP/return-constants.ll
+++ b/llvm/test/Transforms/SCCP/return-constants.ll
@@ -50,7 +50,7 @@ define %0 @caller(i1 %Q) {
 ; CHECK-NEXT:    [[B:%.*]] = extractvalue [[TMP0]] [[X]], 1
 ; CHECK-NEXT:    [[Y:%.*]] = call [[TMP0]] @bar(i1 [[Q]])
 ; CHECK-NEXT:    [[D:%.*]] = extractvalue [[TMP0]] [[Y]], 1
-; CHECK-NEXT:    [[N:%.*]] = add i32 [[B]], [[D]]
+; CHECK-NEXT:    [[N:%.*]] = add nuw i32 [[B]], [[D]]
 ; CHECK-NEXT:    ret [[TMP0]] [[X]]
 ;
   %X = call %0 @foo(i1 %Q)
diff --git a/llvm/test/Transforms/SCCP/widening.ll b/llvm/test/Transforms/SCCP/widening.ll
index 68158654185f..3f43b0a15c52 100644
--- a/llvm/test/Transforms/SCCP/widening.ll
+++ b/llvm/test/Transforms/SCCP/widening.ll
@@ -16,7 +16,7 @@ define void @test_2_incoming_constants(i32 %x) {
 ; SCCP-NEXT:    br label [[EXIT]]
 ; SCCP:       exit:
 ; SCCP-NEXT:    [[P:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ 1, [[BB1]] ]
-; SCCP-NEXT:    [[A:%.*]] = add i32 [[P]], 1
+; SCCP-NEXT:    [[A:%.*]] = add nuw i32 [[P]], 1
 ; SCCP-NEXT:    call void @use(i1 true)
 ; SCCP-NEXT:    call void @use(i1 false)
 ; SCCP-NEXT:    ret void
@@ -29,7 +29,7 @@ define void @test_2_incoming_constants(i32 %x) {
 ; IPSCCP-NEXT:    br label [[EXIT]]
 ; IPSCCP:       exit:
 ; IPSCCP-NEXT:    [[P:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ 1, [[BB1]] ]
-; IPSCCP-NEXT:    [[A:%.*]] = add i32 [[P]], 1
+; IPSCCP-NEXT:    [[A:%.*]] = add nuw i32 [[P]], 1
 ; IPSCCP-NEXT:    call void @use(i1 true)
 ; IPSCCP-NEXT:    call void @use(i1 false)
 ; IPSCCP-NEXT:    ret void
@@ -63,7 +63,7 @@ define void @test_3_incoming_constants(i32 %x) {
 ; SCCP-NEXT:    br label [[EXIT]]
 ; SCCP:       exit:
 ; SCCP-NEXT:    [[P:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ 1, [[BB1]] ], [ 2, [[BB2]] ]
-; SCCP-NEXT:    [[A:%.*]] = add i32 [[P]], 1
+; SCCP-NEXT:    [[A:%.*]] = add nuw i32 [[P]], 1
 ; SCCP-NEXT:    call void @use(i1 true)
 ; SCCP-NEXT:    call void @use(i1 false)
 ; SCCP-NEXT:    ret void
@@ -79,7 +79,7 @@ define void @test_3_incoming_constants(i32 %x) {
 ; IPSCCP-NEXT:    br label [[EXIT]]
 ; IPSCCP:       exit:
 ; IPSCCP-NEXT:    [[P:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ 1, [[BB1]] ], [ 2, [[BB2]] ]
-; IPSCCP-NEXT:    [[A:%.*]] = add i32 [[P]], 1
+; IPSCCP-NEXT:    [[A:%.*]] = add nuw i32 [[P]], 1
 ; IPSCCP-NEXT:    call void @use(i1 true)
 ; IPSCCP-NEXT:    call void @use(i1 false)
 ; IPSCCP-NEXT:    ret void
@@ -123,7 +123,7 @@ define void @test_5_incoming_constants(i32 %x) {
 ; SCCP-NEXT:    br label [[EXIT]]
 ; SCCP:       exit:
 ; SCCP-NEXT:    [[P:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ 1, [[BB1]] ], [ 2, [[BB2]] ], [ 3, [[BB3]] ], [ 4, [[BB4]] ]
-; SCCP-NEXT:    [[A:%.*]] = add i32 [[P]], 1
+; SCCP-NEXT:    [[A:%.*]] = add nuw i32 [[P]], 1
 ; SCCP-NEXT:    call void @use(i1 true)
 ; SCCP-NEXT:    call void @use(i1 false)
 ; SCCP-NEXT:    ret void
@@ -145,7 +145,7 @@ define void @test_5_incoming_constants(i32 %x) {
 ; IPSCCP-NEXT:    br label [[EXIT]]
 ; IPSCCP:       exit:
 ; IPSCCP-NEXT:    [[P:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ 1, [[BB1]] ], [ 2, [[BB2]] ], [ 3, [[BB3]] ], [ 4, [[BB4]] ]
-; IPSCCP-NEXT:    [[A:%.*]] = add i32 [[P]], 1
+; IPSCCP-NEXT:    [[A:%.*]] = add nuw i32 [[P]], 1
 ; IPSCCP-NEXT:    call void @use(i1 true)
 ; IPSCCP-NEXT:    call void @use(i1 false)
 ; IPSCCP-NEXT:    ret void
@@ -196,7 +196,7 @@ define void @rotated_loop_2(i32 %x) {
 ; SCCP-NEXT:    br label [[EXIT]]
 ; SCCP:       exit:
 ; SCCP-NEXT:    [[P:%.*]] = phi i32 [ 1, [[ENTRY:%.*]] ], [ 3, [[BB1]] ], [ 2, [[BB2]] ], [ 5, [[BB3]] ]
-; SCCP-NEXT:    [[A:%.*]] = add i32 [[P]], 1
+; SCCP-NEXT:    [[A:%.*]] = add nuw i32 [[P]], 1
 ; SCCP-NEXT:    call void @use(i1 true)
 ; SCCP-NEXT:    call void @use(i1 false)
 ; SCCP-NEXT:    br label [[EXIT_1:%.*]]
@@ -217,7 +217,7 @@ define void @rotated_loop_2(i32 %x) {
 ; IPSCCP-NEXT:    br label [[EXIT]]
 ; IPSCCP:       exit:
 ; IPSCCP-NEXT:    [[P:%.*]] = phi i32 [ 1, [[ENTRY:%.*]] ], [ 3, [[BB1]] ], [ 2, [[BB2]] ], [ 5, [[BB3]] ]
-; IPSCCP-NEXT:    [[A:%.*]] = add i32 [[P]], 1
+; IPSCCP-NEXT:    [[A:%.*]] = add nuw i32 [[P]], 1
 ; IPSCCP-NEXT:    call void @use(i1 true)
 ; IPSCCP-NEXT:    call void @use(i1 false)
 ; IPSCCP-NEXT:    br label [[EXIT_1:%.*]]
@@ -358,7 +358,7 @@ define void @loop_with_header_1(i32 %x) {
 ; IPSCCP-NEXT:    br i1 [[C_1]], label [[LOOP_BODY]], label [[EXIT:%.*]]
 ; IPSCCP:       loop.body:
 ; IPSCCP-NEXT:    call void @use(i1 true)
-; IPSCCP-NEXT:    [[IV_NEXT]] = add nsw i32 [[IV]], 1
+; IPSCCP-NEXT:    [[IV_NEXT]] = add nuw nsw i32 [[IV]], 1
 ; IPSCCP-NEXT:    br label [[LOOP_HEADER]]
 ; IPSCCP:       exit:
 ; IPSCCP-NEXT:    ret void
</cut>
------=_Part_6874_1020568495.1675086509127--
