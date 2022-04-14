Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D9D320A
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 18:13:15 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m15-20020a7bca4f000000b0038fdc1394b1so2965956wml.2
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 11:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=bcTvCAicC08aLBqFdGtO2gLXX0z7Tqnz0+LqaD8rL1s=;
        b=HIowIhGNxqwkAsJeZO5cXRN7aQFkq8pCEMhHYeWsRAOcpRYfhOU1I1ox8zb8V7nWhC
         RweNExt8o3i2zk7fwEpQTD/NkZ9ZuEVide5XHoqNtV7zZOL6bZlf2LEmcpJX5hwIaRy/
         rgDwD6OLWakhj7fu7ua2U/2cMfukqb5YZyyFbRMMTuK9nASVmpcfNxGxom/XDQq2cCMO
         PzyUpA9KuVWmx7RSmGS1cURQou95Il9I+zXoWytSPaCszKTC2cA+Qzvlgd22YwKZkjRR
         R/d5uNMOwIbVLiLVS+97rgfMo1cjHUYsFMcaZcSJS8UDt+q86KdarQEllbAkl6rFD+lY
         vPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=bcTvCAicC08aLBqFdGtO2gLXX0z7Tqnz0+LqaD8rL1s=;
        b=Te0X73ET30tPbjgx03M7EjLEg06pwqyutmX5BFv2irt2bxUQjU6uqstTdOx+P0yfsT
         jMtFICUCqnECaiVEPmWmzIhH90F0B/YYd5l6NxpWFB1WCd7DrOJbiMNcUpb8g2KOx3zZ
         +0+Q9YDhHhrBveh8sYgKBGql83Zys5XihT4+7e5IOg75oBrnSzB/7BPXk1JKFin0Y9ar
         uenQpziWZJGXSZprJjNLtT/baU+2qzKxS76QilmEtJ9B+mIvy5nEL+ePhK/QvZquPCWy
         8ZDjbocG9UQ2Sv1gzsEu2qa59oi1FogIam4+kINyqOLESFjelSk/m3WAQ+MigCu2Rjml
         47Fg==
X-Gm-Message-State: AOAM533I8dkmHSR6E3s5hLKn6Bz/6TmOVawBh3zO7GRsjc3SF4fJCg1P
	4NLZlqROH8ZBPMm5FqwlJ5sR+g==
X-Google-Smtp-Source: ABdhPJxvJNJ342u5bneO8HRlMYGrtSrSsK1k/qhKtQFdiTDoIm9dMlklHLTRxG+ssLm9ioDhU/D+HA==
X-Received: by 2002:a05:600c:5126:b0:38e:d475:de0e with SMTP id o38-20020a05600c512600b0038ed475de0emr4646424wms.169.1649959993472;
        Thu, 14 Apr 2022 11:13:13 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id f1-20020a1c6a01000000b0038c9f6a3634sm5961344wmc.7.2022.04.14.11.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 11:13:12 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 14 Apr 2022 18:13:10 +0000 (UTC)
To: Momchil Velikov <momchil.velikov@arm.com>
Cc: llvm@lists.linux.dev
Message-ID: <22774472.13865.1649959991991@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [AArch64] Async unwind -
 Adjust unwind info in AArch64LoadStoreOptimizer
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13864_1716496782.1649959990863"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-aarch64-mainline-allnoconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_13864_1716496782.1649959990863
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [AArch64] Async unwind - Adjust unwind info in AArch64LoadStoreOptimizer:
commit ecbf32dd88fc91b4fe709dc14bb3493dda6e8854
Author: Momchil Velikov <momchil.velikov@arm.com>

    [AArch64] Async unwind - Adjust unwind info in AArch64LoadStoreOptimizer

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
597
# First few build errors in logs:
# 00:01:21 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:01:22 make[1]: *** [scripts/Makefile.build:288: mm/mmap.o] Error 134
# 00:01:25 make: *** [Makefile:1834: mm] Error 2

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
601
# linux build successful:
all
# linux boot successful:
boot

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-aarch64-mainline-allnoconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allnoconfig/11/artifact/artifacts/build-ecbf32dd88fc91b4fe709dc14bb3493dda6e8854/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allnoconfig/11/artifact/artifacts/build-201c4b9cc4a649e4a54b418749ab5b8bd227e4f0/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allnoconfig/11/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allnoconfig/11/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-ecbf32dd88fc91b4fe709dc14bb3493dda6e8854
cd investigate-llvm-ecbf32dd88fc91b4fe709dc14bb3493dda6e8854

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allnoconfig/11/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allnoconfig/11/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allnoconfig/11/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach ecbf32dd88fc91b4fe709dc14bb3493dda6e8854
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 201c4b9cc4a649e4a54b418749ab5b8bd227e4f0
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit ecbf32dd88fc91b4fe709dc14bb3493dda6e8854
Author: Momchil Velikov <momchil.velikov@arm.com>
Date:   Wed Apr 13 16:21:33 2022 +0100

    [AArch64] Async unwind - Adjust unwind info in AArch64LoadStoreOptimizer
    
    The AArch64LoadStoreOptimnizer pass may merge a register
    increment/decrement with a following memory operation. In doing so, it
    may break CFI by moving a stack pointer adjustment past the CFI
    instruction that described *that* adjustment.
    
    This patch fixes this issue by moving said CFI instruction after the
    merged instruction, where the SP increment/decrement actually takes
    place.
    
    Reviewed By: efriedma
    
    Differential Revision: https://reviews.llvm.org/D114547
---
 .../Target/AArch64/AArch64LoadStoreOptimizer.cpp   | 38 +++++++++++++++++++++-
 llvm/test/CodeGen/AArch64/arm64-fp128.ll           |  2 +-
 llvm/test/CodeGen/AArch64/fcopysign.ll             |  8 ++---
 llvm/test/CodeGen/AArch64/swifttail-call.ll        |  1 +
 llvm/test/CodeGen/AArch64/tail-call.ll             |  1 +
 5 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/llvm/lib/Target/AArch64/AArch64LoadStoreOptimizer.cpp b/llvm/lib/Target/AArch64/AArch64LoadStoreOptimizer.cpp
index ccc6eff319e0..a7a117102602 100644
--- a/llvm/lib/Target/AArch64/AArch64LoadStoreOptimizer.cpp
+++ b/llvm/lib/Target/AArch64/AArch64LoadStoreOptimizer.cpp
@@ -9,6 +9,12 @@
 // This file contains a pass that performs load / store related peephole
 // optimizations. This pass should be run after register allocation.
 //
+// The pass runs after the PrologEpilogInserter where we emit the CFI
+// instructions. In order to preserve the correctness of the unwind informaiton,
+// the pass should not change the order of any two instructions, one of which
+// has the FrameSetup/FrameDestroy flag or, alternatively, apply an add-hoc fix
+// to unwind information.
+//
 //===----------------------------------------------------------------------===//
 
 #include "AArch64InstrInfo.h"
@@ -31,6 +37,7 @@
 #include "llvm/CodeGen/TargetRegisterInfo.h"
 #include "llvm/IR/DebugLoc.h"
 #include "llvm/MC/MCAsmInfo.h"
+#include "llvm/MC/MCDwarf.h"
 #include "llvm/MC/MCRegisterInfo.h"
 #include "llvm/Pass.h"
 #include "llvm/Support/CommandLine.h"
@@ -1762,6 +1769,26 @@ AArch64LoadStoreOpt::findMatchingInsn(MachineBasicBlock::iterator I,
   return E;
 }
 
+static MachineBasicBlock::iterator
+maybeMoveCFI(MachineInstr &MI, MachineBasicBlock::iterator MaybeCFI) {
+  if (MaybeCFI->getOpcode() != TargetOpcode::CFI_INSTRUCTION ||
+      !(MI.getFlag(MachineInstr::FrameSetup) ||
+        MI.getFlag(MachineInstr::FrameDestroy)) ||
+      getLdStBaseOp(MI).getReg() != AArch64::SP)
+    return MI.getParent()->end();
+
+  const MachineFunction &MF = *MI.getParent()->getParent();
+  unsigned CFIIndex = MaybeCFI->getOperand(0).getCFIIndex();
+  const MCCFIInstruction &CFI = MF.getFrameInstructions()[CFIIndex];
+  switch (CFI.getOperation()) {
+  case MCCFIInstruction::OpDefCfa:
+  case MCCFIInstruction::OpDefCfaOffset:
+    return MaybeCFI;
+  default:
+    return MI.getParent()->end();
+  }
+}
+
 MachineBasicBlock::iterator
 AArch64LoadStoreOpt::mergeUpdateInsn(MachineBasicBlock::iterator I,
                                      MachineBasicBlock::iterator Update,
@@ -1771,6 +1798,12 @@ AArch64LoadStoreOpt::mergeUpdateInsn(MachineBasicBlock::iterator I,
          "Unexpected base register update instruction to merge!");
   MachineBasicBlock::iterator E = I->getParent()->end();
   MachineBasicBlock::iterator NextI = next_nodbg(I, E);
+
+  // If updating the SP and the following instruction is CFA offset related CFI
+  // instruction move it after the merged instruction.
+  MachineBasicBlock::iterator CFI =
+      IsPreIdx ? maybeMoveCFI(*Update, next_nodbg(Update, E)) : E;
+
   // Return the instruction following the merged instruction, which is
   // the instruction following our unmerged load. Unless that's the add/sub
   // instruction we're merging, in which case it's the one after that.
@@ -1808,7 +1841,10 @@ AArch64LoadStoreOpt::mergeUpdateInsn(MachineBasicBlock::iterator I,
               .setMemRefs(I->memoperands())
               .setMIFlags(I->mergeFlagsWith(*Update));
   }
-  (void)MIB;
+  if (CFI != E) {
+    MachineBasicBlock *MBB = I->getParent();
+    MBB->splice(std::next(MIB.getInstr()->getIterator()), MBB, CFI);
+  }
 
   if (IsPreIdx) {
     ++NumPreFolded;
diff --git a/llvm/test/CodeGen/AArch64/arm64-fp128.ll b/llvm/test/CodeGen/AArch64/arm64-fp128.ll
index 597bc58d4aab..5a25f128889c 100644
--- a/llvm/test/CodeGen/AArch64/arm64-fp128.ll
+++ b/llvm/test/CodeGen/AArch64/arm64-fp128.ll
@@ -420,8 +420,8 @@ define dso_local void @test_extend() {
 define fp128 @test_neg(fp128 %in) {
 ; CHECK-LABEL: test_neg:
 ; CHECK:       // %bb.0:
-; CHECK-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NEXT:    str q0, [sp, #-16]!
+; CHECK-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NEXT:    ldrb w8, [sp, #15]
 ; CHECK-NEXT:    eor w8, w8, #0x80
 ; CHECK-NEXT:    strb w8, [sp, #15]
diff --git a/llvm/test/CodeGen/AArch64/fcopysign.ll b/llvm/test/CodeGen/AArch64/fcopysign.ll
index ff93ff77a1a0..d633b641e0fe 100644
--- a/llvm/test/CodeGen/AArch64/fcopysign.ll
+++ b/llvm/test/CodeGen/AArch64/fcopysign.ll
@@ -16,11 +16,11 @@ declare half @llvm.copysign.f16(half %a, half %b)
 define fp128 @copysign0() {
 ; CHECK-LABEL: copysign0:
 ; CHECK:       // %bb.0: // %entry
-; CHECK-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NEXT:    adrp x8, .LCPI0_0
 ; CHECK-NEXT:    ldr q0, [x8, :lo12:.LCPI0_0]
 ; CHECK-NEXT:    adrp x8, val_double
 ; CHECK-NEXT:    str q0, [sp, #-16]!
+; CHECK-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NEXT:    ldr x8, [x8, :lo12:val_double]
 ; CHECK-NEXT:    ldrb w9, [sp, #15]
 ; CHECK-NEXT:    and x8, x8, #0x8000000000000000
@@ -32,11 +32,11 @@ define fp128 @copysign0() {
 ;
 ; CHECK-NONEON-LABEL: copysign0:
 ; CHECK-NONEON:       // %bb.0: // %entry
-; CHECK-NONEON-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NONEON-NEXT:    adrp x8, .LCPI0_0
 ; CHECK-NONEON-NEXT:    ldr q0, [x8, :lo12:.LCPI0_0]
 ; CHECK-NONEON-NEXT:    adrp x8, val_double
 ; CHECK-NONEON-NEXT:    str q0, [sp, #-16]!
+; CHECK-NONEON-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NONEON-NEXT:    ldr x8, [x8, :lo12:val_double]
 ; CHECK-NONEON-NEXT:    ldrb w9, [sp, #15]
 ; CHECK-NONEON-NEXT:    and x8, x8, #0x8000000000000000
@@ -55,11 +55,11 @@ entry:
 define fp128@copysign1() {
 ; CHECK-LABEL: copysign1:
 ; CHECK:       // %bb.0: // %entry
-; CHECK-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NEXT:    adrp x8, val_fp128
 ; CHECK-NEXT:    ldr q0, [x8, :lo12:val_fp128]
 ; CHECK-NEXT:    adrp x8, val_float
 ; CHECK-NEXT:    str q0, [sp, #-16]!
+; CHECK-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NEXT:    ldr w8, [x8, :lo12:val_float]
 ; CHECK-NEXT:    ldrb w9, [sp, #15]
 ; CHECK-NEXT:    and w8, w8, #0x80000000
@@ -71,11 +71,11 @@ define fp128@copysign1() {
 ;
 ; CHECK-NONEON-LABEL: copysign1:
 ; CHECK-NONEON:       // %bb.0: // %entry
-; CHECK-NONEON-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NONEON-NEXT:    adrp x8, val_fp128
 ; CHECK-NONEON-NEXT:    ldr q0, [x8, :lo12:val_fp128]
 ; CHECK-NONEON-NEXT:    adrp x8, val_float
 ; CHECK-NONEON-NEXT:    str q0, [sp, #-16]!
+; CHECK-NONEON-NEXT:    .cfi_def_cfa_offset 16
 ; CHECK-NONEON-NEXT:    ldr w8, [x8, :lo12:val_float]
 ; CHECK-NONEON-NEXT:    ldrb w9, [sp, #15]
 ; CHECK-NONEON-NEXT:    and w8, w8, #0x80000000
diff --git a/llvm/test/CodeGen/AArch64/swifttail-call.ll b/llvm/test/CodeGen/AArch64/swifttail-call.ll
index 5b612ab40008..3efd9f98f40d 100644
--- a/llvm/test/CodeGen/AArch64/swifttail-call.ll
+++ b/llvm/test/CodeGen/AArch64/swifttail-call.ll
@@ -36,6 +36,7 @@ define swifttailcc void @caller_to8_from0() #0 {
   ret void
 
 ; COMMON: str {{x[0-9]+}}, [sp, #-16]!
+; COMMON-NEXT:	.cfi_def_cfa_offset 16
 ; COMMON-NEXT: b callee_stack8
 }
 
diff --git a/llvm/test/CodeGen/AArch64/tail-call.ll b/llvm/test/CodeGen/AArch64/tail-call.ll
index 83943801344b..1a5599fcc508 100644
--- a/llvm/test/CodeGen/AArch64/tail-call.ll
+++ b/llvm/test/CodeGen/AArch64/tail-call.ll
@@ -36,6 +36,7 @@ define fastcc void @caller_to8_from0() #0 {
   ret void
 
 ; COMMON: str {{x[0-9]+}}, [sp, #-16]!
+; COMMON-NEXT: .cfi_def_cfa_offset 16
 ; COMMON-NEXT: b callee_stack8
 }
 
</cut>
------=_Part_13864_1716496782.1649959990863--
