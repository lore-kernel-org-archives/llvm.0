Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F6D1852
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 15:06:30 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q23so11184249wra.1
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=55p3y3qTjo3Bhpg0qST7jRtbBZVtLws/Wq45g/cvMok=;
        b=q3jzhJPb8AJA4fJz664X95vD+y48nEet/6P/0fxjVMUqFZpRdynlQmKDbvQaVjfMbS
         vW0rQ9CZ/esMKKfkqDuAYW5VNaZr7OAihPl2MbWGFycv3hmKo7wqMRfav1nGh8WptBov
         FDbmR+HL9vXeyiOQvePYw98+TfMEOdzn8+mmZjodl5d/aPCh6mDmDabkyIzepEpoh8n0
         8HT0bovs/x9AZSOJMl83AC+Y+ehzR/Fvj/1/qQ5FKg+GH7cLNz5puDcBdk1OaKROYqoM
         bLTJxBl7JMCcDsyLEpAL9pBaVaHb1Zv5+x1NdquzLxhZy5qmSLS00esqD4LVJbCLi7Db
         0UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=55p3y3qTjo3Bhpg0qST7jRtbBZVtLws/Wq45g/cvMok=;
        b=GYh93P0omAcuwxEr2gw7xXyrb4+Bb27xmuc7r3lFV8OOBsYd6q8eWAFITssZndPxHW
         3F1QWhAwz+mRnQAmdJizeCGvy404r+5SfB/sVpU8UaX3Wy4A27ww1z0MWgqXcS71Np2q
         4wf+nPEGjrpwfoNOcmZ2zO3CZ+n8Nwrdp53VlVHswqf9iHostO8nq/PrCNcQSo9NdEf+
         fEzAsjoa9fvK0osfq/s87/guit0RCDVIsxjoL0gF/3S80mJUP3+HjrcIwswbxFwvi/w1
         EZj+/MlYN8CKaliXAXp5deTKBIkz/s5LtzoVRf85foj1SmsUCtrSYwuvRSjz4WcsWCHo
         SWSA==
X-Gm-Message-State: AOAM530msruNNwIFuCTxMB9ZztKvE41N8pIIoKlxlrRlwM+4/meBVrmB
	hiTOoDDAToBchUhwhn/6B/3rRg==
X-Google-Smtp-Source: ABdhPJyBMNWZGxNKQ1FjZp4cCOF1keVcqCmTQvKPX4c9410+vy1Bj2m198LVBej2J7HaKsbvMGUM3Q==
X-Received: by 2002:adf:d1c1:0:b0:20a:ef26:7976 with SMTP id b1-20020adfd1c1000000b0020aef267976mr11548334wrd.345.1651244788389;
        Fri, 29 Apr 2022 08:06:28 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c2506000000b0038e6fe8e8d8sm3539190wml.5.2022.04.29.08.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:06:27 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 29 Apr 2022 15:06:26 +0000 (UTC)
To: Nikita Popov <npopov@redhat.com>
Cc: llvm@lists.linux.dev
Message-ID: <962475179.3377.1651244787786@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset
 representation
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3376_698631698.1651244786958"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-stable-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_3376_698631698.1651244786958
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset representation:
commit b9dc5651477b4c3c132662e763308b27963248a9
Author: Nikita Popov <npopov@redhat.com>

    [GVN] Encode GEPs in offset representation

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
22258
# First few build errors in logs:
# 00:02:56 arch/arm/lib/xor-neon.c:30:2: error: This code requires at least version 4.6 of GCC [-Werror,-W#warnings]
# 00:02:56 make[1]: *** [scripts/Makefile.build:288: arch/arm/lib/xor-neon.o] Error 1
# 00:02:56 make: *** [Makefile:1831: arch/arm/lib] Error 2
# 00:03:54 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:03:54 make[1]: *** [scripts/Makefile.build:288: crypto/wp512.o] Error 1
# 00:06:35 make: *** [Makefile:1831: crypto] Error 2
# 00:11:56 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:11:56 make[4]: *** [scripts/Makefile.build:288: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:12:06 make[3]: *** [scripts/Makefile.build:550: drivers/gpu/drm/selftests] Error 2
# 00:30:12 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: error: stack frame size (1432) exceeds limit (1024) in 'bw_calcs' [-Werror,-Wframe-larger-than]

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
22260

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-stable-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/12/artifact/artifacts/build-b9dc5651477b4c3c132662e763308b27963248a9/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/12/artifact/artifacts/build-942ec5c36d922b29d0e7200082b533018d42421a/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/12/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/12/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-b9dc5651477b4c3c132662e763308b27963248a9
cd investigate-llvm-b9dc5651477b4c3c132662e763308b27963248a9

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/12/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/12/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/12/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach b9dc5651477b4c3c132662e763308b27963248a9
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 942ec5c36d922b29d0e7200082b533018d42421a
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit b9dc5651477b4c3c132662e763308b27963248a9
Author: Nikita Popov <npopov@redhat.com>
Date:   Wed Apr 27 14:40:07 2022 +0200

    [GVN] Encode GEPs in offset representation
    
    When using opaque pointers, convert GEPs into offset representation
    of the form P + V1 * Scale1 + V2 * Scale2 + ... + ConstantOffset.
    This allows us to recognize equivalent address calculations even if
    the GEPs don't use the same source element type.
    
    This fixes an opaque pointer codegen regression seen in rustc.
    
    Differential Revision: https://reviews.llvm.org/D124527
---
 llvm/include/llvm/Transforms/Scalar/GVN.h |  2 ++
 llvm/lib/Transforms/Scalar/GVN.cpp        | 45 +++++++++++++++++++++++++------
 llvm/test/Transforms/GVN/opaque-ptr.ll    | 19 +++++--------
 3 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/llvm/include/llvm/Transforms/Scalar/GVN.h b/llvm/include/llvm/Transforms/Scalar/GVN.h
index d6f4e7376065..16ab1a490162 100644
--- a/llvm/include/llvm/Transforms/Scalar/GVN.h
+++ b/llvm/include/llvm/Transforms/Scalar/GVN.h
@@ -40,6 +40,7 @@ class CallInst;
 class ExtractValueInst;
 class Function;
 class FunctionPass;
+class GetElementPtrInst;
 class ImplicitControlFlowTracking;
 class LoadInst;
 class LoopInfo;
@@ -177,6 +178,7 @@ public:
     Expression createCmpExpr(unsigned Opcode, CmpInst::Predicate Predicate,
                              Value *LHS, Value *RHS);
     Expression createExtractvalueExpr(ExtractValueInst *EI);
+    Expression createGEPExpr(GetElementPtrInst *GEP);
     uint32_t lookupOrAddCall(CallInst *C);
     uint32_t phiTranslateImpl(const BasicBlock *BB, const BasicBlock *PhiBlock,
                               uint32_t Num, GVNPass &Gvn);
diff --git a/llvm/lib/Transforms/Scalar/GVN.cpp b/llvm/lib/Transforms/Scalar/GVN.cpp
index e0d78c944edb..34c1483a37e0 100644
--- a/llvm/lib/Transforms/Scalar/GVN.cpp
+++ b/llvm/lib/Transforms/Scalar/GVN.cpp
@@ -307,13 +307,7 @@ struct llvm::gvn::AvailableValueInBlock {
 
 GVNPass::Expression GVNPass::ValueTable::createExpr(Instruction *I) {
   Expression e;
-  // For GEPs, disambiguate based on the source element type, which is not
-  // implied by the result type with opaque pointers. (Conversely, the source
-  // element type together with the operand types does imply the result type.)
-  if (const auto *GEP = dyn_cast<GetElementPtrInst>(I))
-    e.type = GEP->getSourceElementType();
-  else
-    e.type = I->getType();
+  e.type = I->getType();
   e.opcode = I->getOpcode();
   if (const GCRelocateInst *GCR = dyn_cast<GCRelocateInst>(I)) {
     // gc.relocate is 'special' call: its second and third operands are
@@ -404,6 +398,39 @@ GVNPass::ValueTable::createExtractvalueExpr(ExtractValueInst *EI) {
   return e;
 }
 
+GVNPass::Expression GVNPass::ValueTable::createGEPExpr(GetElementPtrInst *GEP) {
+  Expression E;
+  Type *PtrTy = GEP->getType()->getScalarType();
+  const DataLayout &DL = GEP->getModule()->getDataLayout();
+  unsigned BitWidth = DL.getIndexTypeSizeInBits(PtrTy);
+  MapVector<Value *, APInt> VariableOffsets;
+  APInt ConstantOffset(BitWidth, 0);
+  if (PtrTy->isOpaquePointerTy() &&
+      GEP->collectOffset(DL, BitWidth, VariableOffsets, ConstantOffset)) {
+    // For opaque pointers, convert into offset representation, to recognize
+    // equivalent address calculations that use different type encoding.
+    LLVMContext &Context = GEP->getContext();
+    E.opcode = GEP->getOpcode();
+    E.type = nullptr;
+    E.varargs.push_back(lookupOrAdd(GEP->getPointerOperand()));
+    for (const auto &Pair : VariableOffsets) {
+      E.varargs.push_back(lookupOrAdd(Pair.first));
+      E.varargs.push_back(lookupOrAdd(ConstantInt::get(Context, Pair.second)));
+    }
+    if (!ConstantOffset.isZero())
+      E.varargs.push_back(
+          lookupOrAdd(ConstantInt::get(Context, ConstantOffset)));
+  } else {
+    // If converting to offset representation fails (for typed pointers and
+    // scalable vectors), fall back to type-based implementation:
+    E.opcode = GEP->getOpcode();
+    E.type = GEP->getSourceElementType();
+    for (Use &Op : GEP->operands())
+      E.varargs.push_back(lookupOrAdd(Op));
+  }
+  return E;
+}
+
 //===----------------------------------------------------------------------===//
 //                     ValueTable External Functions
 //===----------------------------------------------------------------------===//
@@ -587,9 +614,11 @@ uint32_t GVNPass::ValueTable::lookupOrAdd(Value *V) {
     case Instruction::InsertElement:
     case Instruction::ShuffleVector:
     case Instruction::InsertValue:
-    case Instruction::GetElementPtr:
       exp = createExpr(I);
       break;
+    case Instruction::GetElementPtr:
+      exp = createGEPExpr(cast<GetElementPtrInst>(I));
+      break;
     case Instruction::ExtractValue:
       exp = createExtractvalueExpr(cast<ExtractValueInst>(I));
       break;
diff --git a/llvm/test/Transforms/GVN/opaque-ptr.ll b/llvm/test/Transforms/GVN/opaque-ptr.ll
index fa203da28bb7..07e336a9e0b6 100644
--- a/llvm/test/Transforms/GVN/opaque-ptr.ll
+++ b/llvm/test/Transforms/GVN/opaque-ptr.ll
@@ -25,32 +25,26 @@ define void @gep_cse(ptr %p) {
 define void @gep_cse_offset_canonicalization(ptr %p, i64 %idx, i64 %idx2) {
 ; CHECK-LABEL: @gep_cse_offset_canonicalization(
 ; CHECK-NEXT:    [[GEP1:%.*]] = getelementptr i64, ptr [[P:%.*]], i64 1
-; CHECK-NEXT:    [[GEP1_SAME1:%.*]] = getelementptr i32, ptr [[P]], i64 2
-; CHECK-NEXT:    [[GEP1_SAME2:%.*]] = getelementptr i8, ptr [[P]], i64 8
 ; CHECK-NEXT:    [[GEP1_DIFFERENT:%.*]] = getelementptr i8, ptr [[P]], i64 12
 ; CHECK-NEXT:    call void @use(ptr [[GEP1]])
-; CHECK-NEXT:    call void @use(ptr [[GEP1_SAME1]])
-; CHECK-NEXT:    call void @use(ptr [[GEP1_SAME2]])
+; CHECK-NEXT:    call void @use(ptr [[GEP1]])
+; CHECK-NEXT:    call void @use(ptr [[GEP1]])
 ; CHECK-NEXT:    call void @use(ptr [[GEP1_DIFFERENT]])
 ; CHECK-NEXT:    [[GEP2:%.*]] = getelementptr i64, ptr [[P]], i64 [[IDX:%.*]]
-; CHECK-NEXT:    [[GEP2_SAME:%.*]] = getelementptr { i32, i32 }, ptr [[P]], i64 [[IDX]]
 ; CHECK-NEXT:    [[GEP2_DIFFERENT:%.*]] = getelementptr { i32, i32, i32 }, ptr [[P]], i64 [[IDX]]
 ; CHECK-NEXT:    call void @use(ptr [[GEP2]])
-; CHECK-NEXT:    call void @use(ptr [[GEP2_SAME]])
+; CHECK-NEXT:    call void @use(ptr [[GEP2]])
 ; CHECK-NEXT:    call void @use(ptr [[GEP2_DIFFERENT]])
 ; CHECK-NEXT:    [[GEP3:%.*]] = getelementptr { [0 x i32], [0 x i32] }, ptr [[P]], i64 0, i32 0, i64 [[IDX]]
-; CHECK-NEXT:    [[GEP3_SAME1:%.*]] = getelementptr { [0 x i32], [0 x i32] }, ptr [[P]], i64 0, i32 1, i64 [[IDX]]
-; CHECK-NEXT:    [[GEP3_SAME2:%.*]] = getelementptr { [0 x i32], [0 x i32] }, ptr [[P]], i64 1, i32 0, i64 [[IDX]]
 ; CHECK-NEXT:    [[GEP3_DIFFERENT:%.*]] = getelementptr { [0 x i32], [0 x i32] }, ptr [[P]], i64 0, i32 0, i64 [[IDX2:%.*]]
 ; CHECK-NEXT:    call void @use(ptr [[GEP3]])
-; CHECK-NEXT:    call void @use(ptr [[GEP3_SAME1]])
-; CHECK-NEXT:    call void @use(ptr [[GEP3_SAME2]])
+; CHECK-NEXT:    call void @use(ptr [[GEP3]])
+; CHECK-NEXT:    call void @use(ptr [[GEP3]])
 ; CHECK-NEXT:    call void @use(ptr [[GEP3_DIFFERENT]])
 ; CHECK-NEXT:    [[GEP4:%.*]] = getelementptr [4 x i32], ptr [[P]], i64 [[IDX]], i64 [[IDX2]]
-; CHECK-NEXT:    [[GEP4_SAME:%.*]] = getelementptr [4 x float], ptr [[P]], i64 [[IDX]], i64 [[IDX2]]
 ; CHECK-NEXT:    [[GEP4_DIFFERENT:%.*]] = getelementptr [4 x float], ptr [[P]], i64 [[IDX2]], i64 [[IDX]]
 ; CHECK-NEXT:    call void @use(ptr [[GEP4]])
-; CHECK-NEXT:    call void @use(ptr [[GEP4_SAME]])
+; CHECK-NEXT:    call void @use(ptr [[GEP4]])
 ; CHECK-NEXT:    call void @use(ptr [[GEP4_DIFFERENT]])
 ; CHECK-NEXT:    [[GEP5:%.*]] = getelementptr <vscale x 2 x i32>, ptr [[P]], i64 1
 ; CHECK-NEXT:    [[GEP5_SAME:%.*]] = getelementptr <vscale x 2 x float>, ptr [[P]], i64 1
@@ -88,6 +82,7 @@ define void @gep_cse_offset_canonicalization(ptr %p, i64 %idx, i64 %idx2) {
   call void @use(ptr %gep4)
   call void @use(ptr %gep4.same)
   call void @use(ptr %gep4.different)
+  ; TODO: %gep5 and %gep5.same are equivalent as well.
   %gep5 = getelementptr <vscale x 2 x i32>, ptr %p, i64 1
   %gep5.same = getelementptr <vscale x 2 x float>, ptr %p, i64 1
   %gep5.different = getelementptr <vscale x 2 x i64>, ptr %p, i64 1
</cut>
------=_Part_3376_698631698.1651244786958--
