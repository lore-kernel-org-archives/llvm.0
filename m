Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2815386
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 22:27:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso6670930wmc.0
        for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 15:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc;
        bh=Z6YKJuazvnayZjG05FAMXW0Sk5RBa6TVtBjvY8bmPNk=;
        b=Mop8+KqUL/x90MZJCj9rWk5myRBz8DG7LQvwzDW4S/7G5T0ggjYAWmbKfzM5c9inoZ
         PwJ4+WNppvw7QWj4O6H/TpD/sfRjxOvaJLcdFPS1HQA11YEsFrv/5B4za8mgh9vCGhsi
         gM4/jQQFfFluCsAkAkeufm6jPT66G5QOduB2qsZTNSTa1gnevz2LTKGr2qe2AgtHsvT0
         52iKXZtCbWyWDd4C86GDvdjjeic5MKVaOxwWrx0kDcy5AJrhKm5OKayWemnl1rpnWwqB
         0rwDXmn12izrRYvIT6K7QMGNGqY422jMEtsT+0Ni4kiZAVswZOf+ptiha0wYKrIIuJI5
         e5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc;
        bh=Z6YKJuazvnayZjG05FAMXW0Sk5RBa6TVtBjvY8bmPNk=;
        b=1p54NP241g6HbkgI8VV2Z0K1xbas5JeeyFmFJpfj1vlYkekzZn6peDBDJkZileWsNI
         71D+YhwZqU4kupdLqK2Cecmh2aAP2/nTD9/Zu9p7ThbZ4n3NL2RDOL6h1UDtp8wzvZWk
         GP4Sntn7nzeIwuBCIWvLc6DDf2VaLfeBKPpps9xcxXhFm7/vQ52jrR/2qTfGQCEJftD8
         5eE2E+us9WME6m4bbk8IGMHs3l023eWXiAXBRgLsHlXYkdWvOP7sbegEHvqzsp05luIR
         /kSdjCs5aorsH+o4f/JqzHqUvHyw3NfK8mPHU9x/v5PXvVSv131VQCtX9bq4jnd+GyJh
         BzXw==
X-Gm-Message-State: ACgBeo3iOEqQCK6jQjO57pb1+kHV/50mRPnsGD0qy6R4mNId7Z9Bc1Ei
	zwh6M14E8qRug0ONTJl2RQqOQkcMRdelSg==
X-Google-Smtp-Source: AA6agR4GFJIag0hCzwhqXJlI+Jrp/pQWWFM9PlEuqsRuCIJKRqhHOEbT1MdObkl6qROPFuQ8LJZC+g==
X-Received: by 2002:a05:600c:4fc4:b0:3a5:c9ed:ca2 with SMTP id o4-20020a05600c4fc400b003a5c9ed0ca2mr11045087wmq.73.1660602445948;
        Mon, 15 Aug 2022 15:27:25 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id m24-20020a05600c3b1800b003a4eea0aa48sm11534570wms.0.2022.08.15.15.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 15:27:25 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 15 Aug 2022 22:27:24 +0000 (UTC)
To: Andre Vieira <andre.simoesdiasvieira@arm.com>
Cc: llvm@lists.linux.dev
Message-ID: <1465164958.6648.1660602445528@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [TypePromotion] Search from
 ZExt + PHI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6647_1300915009.1660602444671"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-lts-defconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_6647_1300915009.1660602444671
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [TypePromotion] Search from ZExt + PHI:
commit 164067918725d1ee8875e38213b6aee9be13383e
Author: Andre Vieira <andre.simoesdiasvieira@arm.com>

    [TypePromotion] Search from ZExt + PHI

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
6329
# First few build errors in logs:
# 00:12:33 ld.lld: error: undefined symbol: __aeabi_uldivmod
# 00:12:33 make: *** [Makefile:1208: vmlinux] Error 1

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
7082
# linux build successful:
all
# linux boot successful:
boot

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-lts-defconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-defconfig/7/artifact/artifacts/build-164067918725d1ee8875e38213b6aee9be13383e/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-defconfig/7/artifact/artifacts/build-05fc5037cd6c3aad7f2985deaf5a486775dafcec/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-defconfig/7/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-defconfig/7/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-164067918725d1ee8875e38213b6aee9be13383e
cd investigate-llvm-164067918725d1ee8875e38213b6aee9be13383e

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/build-baseline artifacts/build-parameters
curl -o artifacts/build-baseline/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-defconfig/7/artifact/artifacts/build-baseline/manifest.sh --fail
curl -o artifacts/build-parameters/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-defconfig/7/artifact/artifacts/build-parameters/manifest.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-defconfig/7/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts/build-baseline

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 164067918725d1ee8875e38213b6aee9be13383e
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 05fc5037cd6c3aad7f2985deaf5a486775dafcec
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 164067918725d1ee8875e38213b6aee9be13383e
Author: Andre Vieira <andre.simoesdiasvieira@arm.com>
Date:   Thu Aug 11 09:47:53 2022 +0100

    [TypePromotion] Search from ZExt + PHI
    
    Expand TypePromotion pass to try to promote PHI-nodes in loops that are the
    operand of a ZExt, using the ZExt's result type to determine the Promote Width.
    
    Differential Revision: https://reviews.llvm.org/D111237
---
 llvm/lib/CodeGen/TypePromotion.cpp                 | 52 ++++++++++++++--------
 llvm/test/CodeGen/AArch64/O3-pipeline.ll           |  2 +-
 .../TypePromotion/AArch64/phi-zext-gep2.ll         | 44 ++++++++++++++++++
 llvm/test/Transforms/TypePromotion/ARM/casts.ll    | 14 +++---
 4 files changed, 87 insertions(+), 25 deletions(-)

diff --git a/llvm/lib/CodeGen/TypePromotion.cpp b/llvm/lib/CodeGen/TypePromotion.cpp
index 2d7dd4605344..a9f20bdaf5bd 100644
--- a/llvm/lib/CodeGen/TypePromotion.cpp
+++ b/llvm/lib/CodeGen/TypePromotion.cpp
@@ -17,6 +17,7 @@
 
 #include "llvm/ADT/SetVector.h"
 #include "llvm/ADT/StringRef.h"
+#include "llvm/Analysis/LoopInfo.h"
 #include "llvm/Analysis/TargetTransformInfo.h"
 #include "llvm/CodeGen/Passes.h"
 #include "llvm/CodeGen/TargetLowering.h"
@@ -175,9 +176,11 @@ public:
   TypePromotion() : FunctionPass(ID) {}
 
   void getAnalysisUsage(AnalysisUsage &AU) const override {
+    AU.addRequired<LoopInfoWrapperPass>();
     AU.addRequired<TargetTransformInfoWrapperPass>();
     AU.addRequired<TargetPassConfig>();
     AU.setPreservesCFG();
+    AU.addPreserved<LoopInfoWrapperPass>();
   }
 
   StringRef getPassName() const override { return PASS_NAME; }
@@ -872,7 +875,8 @@ bool TypePromotion::TryToPromote(Value *V, unsigned PromotedWidth) {
 
   // DAG optimizations should be able to handle these cases better, especially
   // for function arguments.
-  if (ToPromote < 2 || (Blocks.size() == 1 && (NonFreeArgs > SafeWrap.size())))
+  if (!isa<PHINode>(V) && (ToPromote < 2 || (Blocks.size() == 1 &&
+                                             (NonFreeArgs > SafeWrap.size()))))
     return false;
 
   IRPromoter Promoter(*Ctx, PromotedWidth, CurrentVisited, Sources, Sinks,
@@ -901,6 +905,7 @@ bool TypePromotion::runOnFunction(Function &F) {
   const TargetLowering *TLI = SubtargetInfo->getTargetLowering();
   const TargetTransformInfo &TII =
       getAnalysis<TargetTransformInfoWrapperPass>().getTTI(F);
+  const LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
   RegisterBitWidth =
       TII.getRegisterBitWidth(TargetTransformInfo::RGK_Scalar).getFixedSize();
   Ctx = &F.getParent()->getContext();
@@ -929,28 +934,39 @@ bool TypePromotion::runOnFunction(Function &F) {
     return PromotedVT.getFixedSizeInBits();
   };
 
-  // Search up from icmps to try to promote their operands.
+  auto BBIsInLoop = [&](BasicBlock *BB) -> bool {
+    for (auto *L : LI)
+      if (L->contains(BB))
+        return true;
+    return false;
+  };
+
   for (BasicBlock &BB : F) {
     for (Instruction &I : BB) {
       if (AllVisited.count(&I))
         continue;
 
-      if (!isa<ICmpInst>(&I))
-        continue;
-
-      auto *ICmp = cast<ICmpInst>(&I);
-
-      // Skip signed
-      if (ICmp->isSigned())
-        continue;
-
-      LLVM_DEBUG(dbgs() << "IR Promotion: Searching from: " << *ICmp << "\n");
-
-      for (auto &Op : ICmp->operands()) {
-        if (auto *OpI = dyn_cast<Instruction>(Op)) {
-          if (auto PromotedWidth = GetPromoteWidth(OpI)) {
-            MadeChange |= TryToPromote(OpI, PromotedWidth);
-            break;
+      if (isa<ZExtInst>(&I) && isa<PHINode>(I.getOperand(0)) &&
+          BBIsInLoop(&BB)) {
+        LLVM_DEBUG(dbgs() << "IR Promotion: Searching from: " << I.getOperand(0)
+                          << "\n");
+        EVT ZExtVT = TLI->getValueType(DL, I.getType());
+        Instruction *Phi = static_cast<Instruction *>(I.getOperand(0));
+        MadeChange |= TryToPromote(Phi, ZExtVT.getFixedSizeInBits());
+      } else if (auto *ICmp = dyn_cast<ICmpInst>(&I)) {
+        // Search up from icmps to try to promote their operands.
+        // Skip signed or pointer compares
+        if (ICmp->isSigned())
+          continue;
+
+        LLVM_DEBUG(dbgs() << "IR Promotion: Searching from: " << *ICmp << "\n");
+
+        for (auto &Op : ICmp->operands()) {
+          if (auto *OpI = dyn_cast<Instruction>(Op)) {
+            if (auto PromotedWidth = GetPromoteWidth(OpI)) {
+              MadeChange |= TryToPromote(OpI, PromotedWidth);
+              break;
+            }
           }
         }
       }
diff --git a/llvm/test/CodeGen/AArch64/O3-pipeline.ll b/llvm/test/CodeGen/AArch64/O3-pipeline.ll
index 713c70fbf8bf..514627bbb320 100644
--- a/llvm/test/CodeGen/AArch64/O3-pipeline.ll
+++ b/llvm/test/CodeGen/AArch64/O3-pipeline.ll
@@ -90,8 +90,8 @@
 ; CHECK-NEXT:       Interleaved Load Combine Pass
 ; CHECK-NEXT:       Dominator Tree Construction
 ; CHECK-NEXT:       Interleaved Access Pass
-; CHECK-NEXT:       Type Promotion
 ; CHECK-NEXT:       Natural Loop Information
+; CHECK-NEXT:       Type Promotion
 ; CHECK-NEXT:       CodeGen Prepare
 ; CHECK-NEXT:       Dominator Tree Construction
 ; CHECK-NEXT:       Exception handling preparation
diff --git a/llvm/test/Transforms/TypePromotion/AArch64/phi-zext-gep2.ll b/llvm/test/Transforms/TypePromotion/AArch64/phi-zext-gep2.ll
new file mode 100644
index 000000000000..4326580684ed
--- /dev/null
+++ b/llvm/test/Transforms/TypePromotion/AArch64/phi-zext-gep2.ll
@@ -0,0 +1,44 @@
+; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
+; RUN: opt -mtriple=aarch64 -type-promotion -verify -S %s -o - | FileCheck %s
+target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
+
+; Function Attrs: mustprogress nofree nosync nounwind uwtable
+define dso_local void @foo(ptr noundef %ptr0, ptr nocapture noundef readonly %ptr1, ptr nocapture noundef %dest) local_unnamed_addr {
+; CHECK-LABEL: @foo(
+; CHECK-NEXT:  entry:
+; CHECK-NEXT:    [[TMP0:%.*]] = load i8, ptr [[PTR0:%.*]], align 1
+; CHECK-NEXT:    [[TMP1:%.*]] = zext i8 [[TMP0]] to i64
+; CHECK-NEXT:    br label [[DO_BODY:%.*]]
+; CHECK:       do.body:
+; CHECK-NEXT:    [[TO_PROMOTE:%.*]] = phi i64 [ [[TMP1]], [[ENTRY:%.*]] ], [ [[TMP4:%.*]], [[DO_BODY]] ]
+; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds i8, ptr [[PTR1:%.*]], i64 [[TO_PROMOTE]]
+; CHECK-NEXT:    [[TMP2:%.*]] = load i8, ptr [[ARRAYIDX1]], align 2
+; CHECK-NEXT:    [[TMP3:%.*]] = zext i8 [[TMP2]] to i64
+; CHECK-NEXT:    [[COND_IN_I:%.*]] = getelementptr inbounds i8, ptr [[PTR1]], i64 [[TMP3]]
+; CHECK-NEXT:    [[COND_I:%.*]] = load i8, ptr [[COND_IN_I]], align 1
+; CHECK-NEXT:    [[TMP4]] = zext i8 [[COND_I]] to i64
+; CHECK-NEXT:    store i8 [[TMP2]], ptr [[DEST:%.*]], align 1
+; CHECK-NEXT:    [[CMP:%.*]] = icmp ult i64 [[TMP4]], 0
+; CHECK-NEXT:    br i1 [[CMP]], label [[DO_BODY]], label [[DO_END:%.*]]
+; CHECK:       do.end:
+; CHECK-NEXT:    ret void
+;
+entry:
+  %0 = load i8, ptr %ptr0, align 1
+  br label %do.body
+
+do.body:                                          ; preds = %do.body, %entry
+  %to_promote = phi i8 [ %0, %entry ], [ %cond.i, %do.body ]
+  %ext0 = zext i8 %to_promote to i64
+  %arrayidx1 = getelementptr inbounds i8, ptr %ptr1, i64 %ext0
+  %1 = load i8, ptr %arrayidx1, align 2
+  %2 = zext i8 %1 to i64
+  %cond.in.i = getelementptr inbounds i8, ptr %ptr1, i64 %2
+  %cond.i = load i8, ptr %cond.in.i, align 1
+  store i8 %1, ptr %dest, align 1
+  %cmp = icmp ult i8 %cond.i, 0
+  br i1 %cmp, label %do.body, label %do.end
+
+do.end:                                           ; preds = %do.body
+  ret void
+}
diff --git a/llvm/test/Transforms/TypePromotion/ARM/casts.ll b/llvm/test/Transforms/TypePromotion/ARM/casts.ll
index e7b340afd746..3e6159ef032e 100644
--- a/llvm/test/Transforms/TypePromotion/ARM/casts.ll
+++ b/llvm/test/Transforms/TypePromotion/ARM/casts.ll
@@ -57,24 +57,26 @@ define i8 @icmp_i32_zext(i8* %ptr) {
 ; CHECK-NEXT:  entry:
 ; CHECK-NEXT:    [[GEP:%.*]] = getelementptr inbounds i8, i8* [[PTR:%.*]], i32 0
 ; CHECK-NEXT:    [[TMP0:%.*]] = load i8, i8* [[GEP]], align 1
-; CHECK-NEXT:    [[TMP1:%.*]] = sub nuw nsw i8 [[TMP0]], 1
+; CHECK-NEXT:    [[TMP1:%.*]] = zext i8 [[TMP0]] to i32
+; CHECK-NEXT:    [[TMP2:%.*]] = sub nuw nsw i32 [[TMP1]], 1
 ; CHECK-NEXT:    [[CONV44:%.*]] = zext i8 [[TMP0]] to i32
 ; CHECK-NEXT:    br label [[PREHEADER:%.*]]
 ; CHECK:       preheader:
 ; CHECK-NEXT:    br label [[BODY:%.*]]
 ; CHECK:       body:
-; CHECK-NEXT:    [[TMP2:%.*]] = phi i8 [ [[TMP1]], [[PREHEADER]] ], [ [[TMP3:%.*]], [[IF_END:%.*]] ]
+; CHECK-NEXT:    [[TMP3:%.*]] = phi i32 [ [[TMP2]], [[PREHEADER]] ], [ [[TMP5:%.*]], [[IF_END:%.*]] ]
 ; CHECK-NEXT:    [[SI_0274:%.*]] = phi i32 [ [[CONV44]], [[PREHEADER]] ], [ [[INC:%.*]], [[IF_END]] ]
-; CHECK-NEXT:    [[CONV51266:%.*]] = zext i8 [[TMP2]] to i32
-; CHECK-NEXT:    [[CMP52267:%.*]] = icmp eq i32 [[SI_0274]], [[CONV51266]]
+; CHECK-NEXT:    [[CMP52267:%.*]] = icmp eq i32 [[SI_0274]], [[TMP3]]
 ; CHECK-NEXT:    br i1 [[CMP52267]], label [[IF_END]], label [[EXIT:%.*]]
 ; CHECK:       if.end:
 ; CHECK-NEXT:    [[INC]] = add i32 [[SI_0274]], 1
 ; CHECK-NEXT:    [[GEP1:%.*]] = getelementptr inbounds i8, i8* [[PTR]], i32 [[INC]]
-; CHECK-NEXT:    [[TMP3]] = load i8, i8* [[GEP1]], align 1
+; CHECK-NEXT:    [[TMP4:%.*]] = load i8, i8* [[GEP1]], align 1
+; CHECK-NEXT:    [[TMP5]] = zext i8 [[TMP4]] to i32
 ; CHECK-NEXT:    br label [[BODY]]
 ; CHECK:       exit:
-; CHECK-NEXT:    ret i8 [[TMP2]]
+; CHECK-NEXT:    [[TMP6:%.*]] = trunc i32 [[TMP3]] to i8
+; CHECK-NEXT:    ret i8 [[TMP6]]
 ;
 entry:
   %gep = getelementptr inbounds i8, i8* %ptr, i32 0
</cut>
------=_Part_6647_1300915009.1660602444671--
