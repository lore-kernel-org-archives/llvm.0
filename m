Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627542CA7
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 22:32:57 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d8so4186416wrp.6
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 15:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=k4vxrgNJXP97icLBte01etbkVSNAa2WI9y15SHyVcCE=;
        b=Brq9ETEy6yW0PfYtgZNcvB7HeJa9dUSj1EqeGhpAtDWDt+9ApZllJMU5o7zV9YbXmf
         I7zDw1az7aAaEkc97XHLAzrHjsk5zWFKG4XhJMcCk7FDoMIoLTcKyJYJ+S+18Q/9m9u4
         Jk/VWofOlRYMkXGxFi17Omn1Kj90DaiP6vItWdXRrnxx0dwBAhjkLYWFZytUQ4gtytB0
         k3iwpRVpPtN8hCvP8HBWhruubA74BfAL8QbGqlEc78qvLl31ikswF4l4H5O8O8URs7OJ
         Yf+2wkKf9ZL3A/H9P05eVi12l0qKgT7UayIjEVu5Rz7e6ncjnhF43FFh76oBK7EpvM0J
         HRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=k4vxrgNJXP97icLBte01etbkVSNAa2WI9y15SHyVcCE=;
        b=Q2ouWBE9+axYyNQkQypMsy7LOCGWoo1xOgHjlplX6a7FMF+X44gl5TSNnI/E332c1X
         As/pQUvZiFeGTogf1MNWTVFCGAT9Lg601/fFkyiloIdNmAxmlTwE7S9aCA3qW0HXJ1jw
         JP+1HuKkBgFKgxWvgPjAUojqCO6Isah7Ouw2FIowZfsnix9lEKefb+ZiMbVzQXxBddL/
         PG3b92pkhN2bOphL2sQrDhXECyFq0zgaNwhx62F81QN3SAvafWF5ydWhQ1oy7wDuVlqE
         zkXHc+Pi0fTR92kebWSHatqHdbMjEYbfsuORct+Y0THD6zwX0xmVhTEvm/FP1VnsZh0G
         L52w==
X-Gm-Message-State: AJIora8KXHO6F5M8UX/uqyVYbNvKkhKonuz8ATUfZoe0AwuASWrr6mNd
	GuDQsp54p9JWXq8NzYskH5ZMXKZ7aw72Lg==
X-Google-Smtp-Source: AGRyM1tOxACmAUKzvtvNzTjqXujSFrniQx+4iNuBpv9gZJpCf4zJMbg2DcvFFZp+AKZyhhW1Sd9PcQ==
X-Received: by 2002:adf:f548:0:b0:21e:4348:3991 with SMTP id j8-20020adff548000000b0021e43483991mr407934wrp.130.1658442775173;
        Thu, 21 Jul 2022 15:32:55 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600016cd00b0021e4e9f6450sm2969685wrf.84.2022.07.21.15.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 15:32:54 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 21 Jul 2022 22:32:53 +0000 (UTC)
To: Nikita Popov <npopov@redhat.com>
Cc: llvm@lists.linux.dev
Message-ID: <1533469619.2122.1658442774096@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [IR] Don't use blockaddresses
 as callbr arguments
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2121_1541632140.1658442773323"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-norov-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_2121_1541632140.1658442773323
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [IR] Don't use blockaddresses as callbr arguments:
commit 2a721374aef326d4668f750d341c86d1aa1a0309
Author: Nikita Popov <npopov@redhat.com>

    [IR] Don't use blockaddresses as callbr arguments

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
22762
# First few build errors in logs:
# 00:05:01 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:05:01 make[1]: *** [scripts/Makefile.build:249: crypto/wp512.o] Error 1
# 00:06:56 make: *** [Makefile:1843: crypto] Error 2
# 00:11:00 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:11:00 make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:11:10 sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
# 00:11:10 make[4]: *** [scripts/Makefile.build:249: sound/soc/intel/avs/path.o] Error 1
# 00:11:11 make[3]: *** [scripts/Makefile.build:466: drivers/gpu/drm/selftests] Error 2
# 00:11:22 make[3]: *** [scripts/Makefile.build:466: sound/soc/intel/avs] Error 2
# 00:11:25 make[2]: *** [scripts/Makefile.build:466: sound/soc/intel] Error 2

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
22764

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-norov-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-norov-allmodconfig/2/artifact/artifacts/build-2a721374aef326d4668f750d341c86d1aa1a0309/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-norov-allmodconfig/2/artifact/artifacts/build-cae5462a2caa4a14516d3935d2ca3a1f1d0522c9/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-norov-allmodconfig/2/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-norov-allmodconfig/2/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-2a721374aef326d4668f750d341c86d1aa1a0309
cd investigate-llvm-2a721374aef326d4668f750d341c86d1aa1a0309

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-norov-allmodconfig/2/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-norov-allmodconfig/2/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-norov-allmodconfig/2/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 2a721374aef326d4668f750d341c86d1aa1a0309
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach cae5462a2caa4a14516d3935d2ca3a1f1d0522c9
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 2a721374aef326d4668f750d341c86d1aa1a0309
Author: Nikita Popov <npopov@redhat.com>
Date:   Thu Jul 7 12:27:43 2022 +0200

    [IR] Don't use blockaddresses as callbr arguments
    
    Following some recent discussions, this changes the representation
    of callbrs in IR. The current blockaddress arguments are replaced
    with `!` label constraints that refer directly to callbr indirect
    destinations:
    
        ; Before:
        %res = callbr i8* asm "", "=r,r,i"(i8* %x, i8* blockaddress(@test8, %foo))
        to label %asm.fallthrough [label %foo]
        ; After:
        %res = callbr i8* asm "", "=r,r,!i"(i8* %x)
        to label %asm.fallthrough [label %foo]
    
    The benefit of this is that we can easily update the successors of
    a callbr, without having to worry about also updating blockaddress
    references. This should allow us to remove some limitations:
    
    * Allow unrolling/peeling/rotation of callbr, or any other
      clone-based optimizations
      (https://github.com/llvm/llvm-project/issues/41834)
    * Allow duplicate successors
      (https://github.com/llvm/llvm-project/issues/45248)
    
    This is just the IR representation change though, I will follow up
    with patches to remove limtations in various transformation passes
    that are no longer needed.
    
    Differential Revision: https://reviews.llvm.org/D129288
---
 clang/lib/CodeGen/CGStmt.cpp                       |  7 +--
 clang/test/CodeGen/asm-goto.c                      | 12 ++--
 clang/test/CodeGen/asm.c                           |  3 +-
 clang/test/Modules/asm-goto.c                      |  2 +-
 llvm/docs/LangRef.rst                              | 19 ++++--
 llvm/docs/ReleaseNotes.rst                         | 12 ++++
 llvm/include/llvm/IR/InlineAsm.h                   |  5 +-
 llvm/include/llvm/IR/Instructions.h                |  7 +--
 llvm/lib/Bitcode/Reader/BitcodeReader.cpp          | 55 +++++++++++++++++
 llvm/lib/CodeGen/GlobalISel/InlineAsmLowering.cpp  |  5 +-
 .../CodeGen/SelectionDAG/SelectionDAGBuilder.cpp   | 13 +++-
 llvm/lib/CodeGen/SelectionDAG/TargetLowering.cpp   |  9 +++
 llvm/lib/IR/InlineAsm.cpp                          | 20 +++++--
 llvm/lib/IR/Instructions.cpp                       | 13 ++--
 llvm/lib/IR/Verifier.cpp                           | 34 +++++------
 llvm/test/Analysis/BasicAA/pr52735.ll              |  4 +-
 llvm/test/Assembler/call-arg-is-callee.ll          |  4 +-
 llvm/test/Assembler/inline-asm-constraint-error.ll | 26 +++++++-
 llvm/test/Bitcode/callbr.ll                        | 16 +++--
 llvm/test/CodeGen/AArch64/callbr-asm-label.ll      |  6 +-
 llvm/test/CodeGen/AArch64/callbr-asm-obj-file.ll   |  6 +-
 .../CodeGen/AArch64/speculation-hardening-sls.ll   |  2 +-
 llvm/test/CodeGen/ARM/speculation-hardening-sls.ll |  2 +-
 .../CodeGen/PowerPC/ppc64-inlineasm-clobber.ll     |  4 +-
 llvm/test/CodeGen/SystemZ/asm-20.ll                |  2 +-
 llvm/test/CodeGen/X86/callbr-asm-bb-exports.ll     |  4 +-
 llvm/test/CodeGen/X86/callbr-asm-blockplacement.ll |  2 +-
 llvm/test/CodeGen/X86/callbr-asm-branch-folding.ll |  2 +-
 llvm/test/CodeGen/X86/callbr-asm-destinations.ll   | 47 +++++++++++++--
 llvm/test/CodeGen/X86/callbr-asm-errors.ll         | 18 ------
 .../CodeGen/X86/callbr-asm-instr-scheduling.ll     |  2 +-
 llvm/test/CodeGen/X86/callbr-asm-kill.mir          |  2 +-
 llvm/test/CodeGen/X86/callbr-asm-label-addr.ll     |  2 +-
 llvm/test/CodeGen/X86/callbr-asm-obj-file.ll       |  2 +-
 .../CodeGen/X86/callbr-asm-outputs-pred-succ.ll    |  4 +-
 llvm/test/CodeGen/X86/callbr-asm-outputs.ll        | 16 ++---
 llvm/test/CodeGen/X86/callbr-asm-phi-placement.ll  |  2 +-
 llvm/test/CodeGen/X86/callbr-asm-sink.ll           |  2 +-
 llvm/test/CodeGen/X86/callbr-asm.ll                | 14 ++---
 llvm/test/CodeGen/X86/callbr-codegenprepare.ll     |  2 +-
 llvm/test/CodeGen/X86/inline-asm-pic.ll            |  2 +-
 llvm/test/CodeGen/X86/shrinkwrap-callbr.ll         |  2 +-
 llvm/test/CodeGen/X86/speculation-hardening-sls.ll |  2 +-
 llvm/test/CodeGen/X86/tail-dup-asm-goto.ll         |  2 +-
 .../MemorySanitizer/msan_asm_conservative.ll       |  2 +-
 .../CallSiteSplitting/callsite-split-callbr.ll     | 10 ++--
 .../CodeExtractor/PartialInlinePGOMultiRegion.ll   |  2 +-
 llvm/test/Transforms/Coroutines/coro-debug.ll      |  2 +-
 .../test/Transforms/GVN/callbr-loadpre-critedge.ll |  8 +--
 .../Transforms/GVN/callbr-scalarpre-critedge.ll    |  8 +--
 .../Transforms/GVN/critical-edge-split-failure.ll  |  4 +-
 llvm/test/Transforms/IROutliner/illegal-callbr.ll  | 10 ++--
 llvm/test/Transforms/Inline/blockaddress.ll        |  4 +-
 llvm/test/Transforms/Inline/callbr.ll              |  4 +-
 .../Transforms/JumpThreading/callbr-edge-split.ll  |  6 +-
 .../Transforms/JumpThreading/pr46857-callbr.ll     |  6 +-
 llvm/test/Transforms/LICM/callbr-crash.ll          |  6 +-
 .../Transforms/LoopDeletion/two-predecessors.ll    |  6 +-
 llvm/test/Transforms/LoopRotate/callbr.ll          |  4 +-
 .../callbr-critical-edge-splitting.ll              | 14 ++---
 .../callbr-critical-edge-splitting2.ll             |  6 +-
 .../LoopStrengthReduce/remove_scev_indvars.ll      |  2 +-
 llvm/test/Transforms/LoopUnroll/callbr.ll          |  2 +-
 llvm/test/Transforms/PGOProfile/callbr.ll          |  2 +-
 .../SimpleLoopUnswitch/not-safe-to-clone.ll        |  2 +-
 .../Transforms/SimplifyCFG/callbr-destinations.ll  |  4 +-
 llvm/test/Transforms/SimplifyCFG/jump-threading.ll |  4 +-
 llvm/test/Verifier/callbr.ll                       | 69 ++++++++++------------
 llvm/test/Verifier/dominates.ll                    |  4 +-
 llvm/test/tools/llvm-diff/callbr.ll                | 14 +----
 llvm/test/tools/llvm-diff/phinode.ll               |  2 +-
 ...tion-arguments-of-funcs-used-in-blockaddress.ll | 28 +++------
 llvm/unittests/IR/InstructionsTest.cpp             | 16 +----
 polly/test/ScopDetect/callbr.ll                    |  2 +-
 74 files changed, 382 insertions(+), 288 deletions(-)

diff --git a/clang/lib/CodeGen/CGStmt.cpp b/clang/lib/CodeGen/CGStmt.cpp
index df7e5608f8f0..05ab16668743 100644
--- a/clang/lib/CodeGen/CGStmt.cpp
+++ b/clang/lib/CodeGen/CGStmt.cpp
@@ -2603,14 +2603,9 @@ void CodeGenFunction::EmitAsmStmt(const AsmStmt &S) {
       for (const auto *E : GS->labels()) {
         JumpDest Dest = getJumpDestForLabel(E->getLabel());
         Transfer.push_back(Dest.getBlock());
-        llvm::BlockAddress *BA =
-            llvm::BlockAddress::get(CurFn, Dest.getBlock());
-        Args.push_back(BA);
-        ArgTypes.push_back(BA->getType());
-        ArgElemTypes.push_back(nullptr);
         if (!Constraints.empty())
           Constraints += ',';
-        Constraints += 'i';
+        Constraints += "!i";
       }
       Fallthrough = createBasicBlock("asm.fallthrough");
     }
diff --git a/clang/test/CodeGen/asm-goto.c b/clang/test/CodeGen/asm-goto.c
index 5949cda82434..663aec3ebfad 100644
--- a/clang/test/CodeGen/asm-goto.c
+++ b/clang/test/CodeGen/asm-goto.c
@@ -55,14 +55,14 @@ label_true:
 
 int test4(int out1, int out2) {
   // CHECK-LABEL: define{{.*}} i32 @test4(
-  // CHECK: callbr { i32, i32 } asm sideeffect "jne ${5:l}", "={si},={di},r,0,1,i,i
+  // CHECK: callbr { i32, i32 } asm sideeffect "jne ${5:l}", "={si},={di},r,0,1,!i,!i
   // CHECK: to label %asm.fallthrough [label %label_true, label %loop]
   // CHECK-LABEL: asm.fallthrough:
   if (out1 < out2)
     asm volatile goto("jne %l5" : "+S"(out1), "+D"(out2) : "r"(out1) :: label_true, loop);
   else
     asm volatile goto("jne %l7" : "+S"(out1), "+D"(out2) : "r"(out1), "r"(out2) :: label_true, loop);
-  // CHECK: callbr { i32, i32 } asm sideeffect "jne ${7:l}", "={si},={di},r,r,0,1,i,i
+  // CHECK: callbr { i32, i32 } asm sideeffect "jne ${7:l}", "={si},={di},r,r,0,1,!i,!i
   // CHECK: to label %asm.fallthrough2 [label %label_true, label %loop]
   // CHECK-LABEL: asm.fallthrough2:
   return out1 + out2;
@@ -74,7 +74,7 @@ label_true:
 
 int test5(int addr, int size, int limit) {
   // CHECK-LABEL: define{{.*}} i32 @test5(
-  // CHECK: callbr i32 asm "add $1,$0 ; jc ${4:l} ; cmp $2,$0 ; ja ${4:l} ; ", "=r,imr,imr,0,i
+  // CHECK: callbr i32 asm "add $1,$0 ; jc ${4:l} ; cmp $2,$0 ; ja ${4:l} ; ", "=r,imr,imr,0,!i
   // CHECK: to label %asm.fallthrough [label %t_err]
   // CHECK-LABEL: asm.fallthrough:
   asm goto(
@@ -92,7 +92,7 @@ t_err:
 
 int test6(int out1) {
   // CHECK-LABEL: define{{.*}} i32 @test6(
-  // CHECK: callbr i32 asm sideeffect "testl $0, $0; testl $1, $1; jne ${3:l}", "={si},r,0,i,i,{{.*}} i8* blockaddress(@test6, %label_true), i8* blockaddress(@test6, %landing)
+  // CHECK: callbr i32 asm sideeffect "testl $0, $0; testl $1, $1; jne ${3:l}", "={si},r,0,!i,!i,{{.*}}
   // CHECK: to label %asm.fallthrough [label %label_true, label %landing]
   // CHECK-LABEL: asm.fallthrough:
   // CHECK-LABEL: landing:
@@ -110,7 +110,7 @@ label_true:
 // string, not $1.
 void *test7(void) {
   // CHECK-LABEL: define{{.*}} i8* @test7(
-  // CHECK: %1 = callbr i8* asm "# $0\0A\09# ${2:l}", "=r,0,i,~{dirflag},~{fpsr},~{flags}"(i8* %0, i8* blockaddress(@test7, %foo))
+  // CHECK: %1 = callbr i8* asm "# $0\0A\09# ${2:l}", "=r,0,!i,~{dirflag},~{fpsr},~{flags}"(i8* %0)
   // CHECK-NEXT: to label %asm.fallthrough [label %foo]
   void *p = &&foo;
   asm goto ("# %0\n\t# %l2":"+r"(p):::foo);
@@ -122,7 +122,7 @@ foo:
 // numbered outputs.
 void *test8(void) {
   // CHECK-LABEL: define{{.*}} i8* @test8(
-  // CHECK: %1 = callbr i8* asm "# $0\0A\09# ${2:l}", "=r,0,i,~{dirflag},~{fpsr},~{flags}"(i8* %0, i8* blockaddress(@test8, %foo))
+  // CHECK: %1 = callbr i8* asm "# $0\0A\09# ${2:l}", "=r,0,!i,~{dirflag},~{fpsr},~{flags}"(i8* %0)
   // CHECK-NEXT: to label %asm.fallthrough [label %foo]
   void *p = &&foo;
   asm goto ("# %0\n\t# %l[foo]":"+r"(p):::foo);
diff --git a/clang/test/CodeGen/asm.c b/clang/test/CodeGen/asm.c
index ec7e6d1556cb..1901640afa97 100644
--- a/clang/test/CodeGen/asm.c
+++ b/clang/test/CodeGen/asm.c
@@ -267,7 +267,8 @@ void t31(int len) {
 int t32(int cond)
 {
   asm goto("testl %0, %0; jne %l1;" :: "r"(cond)::label_true, loop);
-  // CHECK: callbr void asm sideeffect "testl $0, $0; jne ${1:l};", "r,i,i,~{dirflag},~{fpsr},~{flags}"(i32 %0, i8* blockaddress(@t32, %label_true), i8* blockaddress(@t32, %loop)) #1
+  // CHECK: callbr void asm sideeffect "testl $0, $0; jne ${1:l};", "r,!i,!i,~{dirflag},~{fpsr},~{flags}"(i32 %0) #1
+  // CHECK-NEXT: to label %asm.fallthrough [label %label_true, label %loop]
   return 0;
 loop:
   return 0;
diff --git a/clang/test/Modules/asm-goto.c b/clang/test/Modules/asm-goto.c
index 340795ee5745..278a710ae91c 100644
--- a/clang/test/Modules/asm-goto.c
+++ b/clang/test/Modules/asm-goto.c
@@ -4,7 +4,7 @@
 #include "a.h"
 
 // CHECK-LABEL: define {{.*}} @foo(
-// CHECK: callbr {{.*}} "=r,i{{.*}} blockaddress(@foo, %indirect))
+// CHECK: callbr {{.*}} "=r,!i{{.*}}()
 // CHECK-NEXT: to label %asm.fallthrough [label %indirect]
 
 int bar(void) {
diff --git a/llvm/docs/LangRef.rst b/llvm/docs/LangRef.rst
index 24b3b5183da8..d4dbff6f10f8 100644
--- a/llvm/docs/LangRef.rst
+++ b/llvm/docs/LangRef.rst
@@ -4695,6 +4695,17 @@ output.
 Note that clobbering named registers that are also present in output
 constraints is not legal.
 
+Label constraints
+"""""""""""""""""
+
+A label constraint is indicated by a "``!``" prefix and typically used in the
+form ``"!i"``. Instead of consuming call arguments, label constraints consume
+indirect destination labels of ``callbr`` instructions.
+
+Label constraints can only be used in conjunction with ``callbr`` and the
+number of label constraints must match the number of indirect destination
+labels in the ``callbr`` instruction.
+
 
 Constraint Codes
 """"""""""""""""
@@ -8416,8 +8427,8 @@ This instruction requires several arguments:
 #. '``fallthrough label``': the label reached when the inline assembly's
    execution exits the bottom.
 #. '``indirect labels``': the labels reached when a callee transfers control
-   to a location other than the '``fallthrough label``'. The blockaddress
-   constant for these should also be in the list of '``function args``'.
+   to a location other than the '``fallthrough label``'. Label constraints
+   refer to these destinations.
 #. The optional :ref:`function attributes <fnattrs>` list.
 #. The optional :ref:`operand bundles <opbundles>` list.
 
@@ -8442,11 +8453,11 @@ Example:
 .. code-block:: llvm
 
       ; "asm goto" without output constraints.
-      callbr void asm "", "r,X"(i32 %x, i8 *blockaddress(@foo, %indirect))
+      callbr void asm "", "r,!i"(i32 %x)
                   to label %fallthrough [label %indirect]
 
       ; "asm goto" with output constraints.
-      <result> = callbr i32 asm "", "=r,r,X"(i32 %x, i8 *blockaddress(@foo, %indirect))
+      <result> = callbr i32 asm "", "=r,r,!i"(i32 %x)
                   to label %fallthrough [label %indirect]
 
 .. _i_resume:
diff --git a/llvm/docs/ReleaseNotes.rst b/llvm/docs/ReleaseNotes.rst
index f29a7aaba587..5f7dca3c8e64 100644
--- a/llvm/docs/ReleaseNotes.rst
+++ b/llvm/docs/ReleaseNotes.rst
@@ -84,6 +84,18 @@ Changes to the LLVM IR
 * Added the support for ``fmax`` and ``fmin`` in ``atomicrmw`` instruction. The
   comparison is expected to match the behavior of ``llvm.maxnum.*`` and
   ``llvm.minnum.*`` respectively.
+* ``callbr`` instructions no longer use ``blockaddress`` arguments for labels.
+  Instead, label constraints starting with ``!`` refer directly to entries in
+  the ``callbr`` indirect destination list.
+
+.. code-block:: llvm
+
+    ; Old representation
+    %res = callbr i32 asm "", "=r,r,i"(i32 %x, i8 *blockaddress(@foo, %indirect))
+          to label %fallthrough [label %indirect]
+    ; New representation
+    %res = callbr i32 asm "", "=r,r,!i"(i32 %x)
+          to label %fallthrough [label %indirect]
 
 Changes to building LLVM
 ------------------------
diff --git a/llvm/include/llvm/IR/InlineAsm.h b/llvm/include/llvm/IR/InlineAsm.h
index 032a70efdceb..0a8d27aad58a 100644
--- a/llvm/include/llvm/IR/InlineAsm.h
+++ b/llvm/include/llvm/IR/InlineAsm.h
@@ -92,7 +92,8 @@ public:
   enum ConstraintPrefix {
     isInput,            // 'x'
     isOutput,           // '=x'
-    isClobber           // '~x'
+    isClobber,          // '~x'
+    isLabel,            // '!x'
   };
 
   using ConstraintCodeVector = std::vector<std::string>;
@@ -117,7 +118,7 @@ public:
   using ConstraintInfoVector = std::vector<ConstraintInfo>;
 
   struct ConstraintInfo {
-    /// Type - The basic type of the constraint: input/output/clobber
+    /// Type - The basic type of the constraint: input/output/clobber/label
     ///
     ConstraintPrefix Type = isInput;
 
diff --git a/llvm/include/llvm/IR/Instructions.h b/llvm/include/llvm/IR/Instructions.h
index a14bc39cea65..083fed5de4a3 100644
--- a/llvm/include/llvm/IR/Instructions.h
+++ b/llvm/include/llvm/IR/Instructions.h
@@ -44,6 +44,7 @@ namespace llvm {
 class APFloat;
 class APInt;
 class BasicBlock;
+class BlockAddress;
 class ConstantInt;
 class DataLayout;
 class StringRef;
@@ -4004,9 +4005,6 @@ class CallBrInst : public CallBase {
             ArrayRef<BasicBlock *> IndirectDests, ArrayRef<Value *> Args,
             ArrayRef<OperandBundleDef> Bundles, const Twine &NameStr);
 
-  /// Should the Indirect Destinations change, scan + update the Arg list.
-  void updateArgBlockAddresses(unsigned i, BasicBlock *B);
-
   /// Compute the number of operands to allocate.
   static int ComputeNumOperands(int NumArgs, int NumIndirectDests,
                                 int NumBundleInputs = 0) {
@@ -4154,7 +4152,6 @@ public:
     *(&Op<-1>() - getNumIndirectDests() - 1) = reinterpret_cast<Value *>(B);
   }
   void setIndirectDest(unsigned i, BasicBlock *B) {
-    updateArgBlockAddresses(i, B);
     *(&Op<-1>() - getNumIndirectDests() + i) = reinterpret_cast<Value *>(B);
   }
 
@@ -4172,6 +4169,8 @@ public:
 
   unsigned getNumSuccessors() const { return getNumIndirectDests() + 1; }
 
+  BlockAddress *getBlockAddressForIndirectDest(unsigned DestNo) const;
+
   // Methods for support type inquiry through isa, cast, and dyn_cast:
   static bool classof(const Instruction *I) {
     return (I->getOpcode() == Instruction::CallBr);
diff --git a/llvm/lib/Bitcode/Reader/BitcodeReader.cpp b/llvm/lib/Bitcode/Reader/BitcodeReader.cpp
index 8d5a2555f9af..1d6c21bd66d1 100644
--- a/llvm/lib/Bitcode/Reader/BitcodeReader.cpp
+++ b/llvm/lib/Bitcode/Reader/BitcodeReader.cpp
@@ -5510,6 +5510,61 @@ Error BitcodeReader::parseFunctionBody(Function *F) {
       if (!OperandBundles.empty())
         UpgradeOperandBundles(OperandBundles);
 
+      if (auto *IA = dyn_cast<InlineAsm>(Callee)) {
+        InlineAsm::ConstraintInfoVector ConstraintInfo = IA->ParseConstraints();
+        auto IsLabelConstraint = [](const InlineAsm::ConstraintInfo &CI) {
+          return CI.Type == InlineAsm::isLabel;
+        };
+        if (none_of(ConstraintInfo, IsLabelConstraint)) {
+          // Upgrade explicit blockaddress arguments to label constraints.
+          // Verify that the last arguments are blockaddress arguments that
+          // match the indirect destinations. Clang always generates callbr
+          // in this form. We could support reordering with more effort.
+          unsigned FirstBlockArg = Args.size() - IndirectDests.size();
+          for (unsigned ArgNo = FirstBlockArg; ArgNo < Args.size(); ++ArgNo) {
+            unsigned LabelNo = ArgNo - FirstBlockArg;
+            auto *BA = dyn_cast<BlockAddress>(Args[ArgNo]);
+            if (!BA || BA->getFunction() != F ||
+                LabelNo > IndirectDests.size() ||
+                BA->getBasicBlock() != IndirectDests[LabelNo])
+              return error("callbr argument does not match indirect dest");
+          }
+
+          // Remove blockaddress arguments.
+          Args.erase(Args.begin() + FirstBlockArg, Args.end());
+          ArgTyIDs.erase(ArgTyIDs.begin() + FirstBlockArg, ArgTyIDs.end());
+
+          // Recreate the function type with less arguments.
+          SmallVector<Type *> ArgTys;
+          for (Value *Arg : Args)
+            ArgTys.push_back(Arg->getType());
+          FTy =
+              FunctionType::get(FTy->getReturnType(), ArgTys, FTy->isVarArg());
+
+          // Update constraint string to use label constraints.
+          std::string Constraints = IA->getConstraintString();
+          unsigned ArgNo = 0;
+          size_t Pos = 0;
+          for (const auto &CI : ConstraintInfo) {
+            if (CI.hasArg()) {
+              if (ArgNo >= FirstBlockArg)
+                Constraints.insert(Pos, "!");
+              ++ArgNo;
+            }
+
+            // Go to next constraint in string.
+            Pos = Constraints.find(',', Pos);
+            if (Pos == std::string::npos)
+              break;
+            ++Pos;
+          }
+
+          Callee = InlineAsm::get(FTy, IA->getAsmString(), Constraints,
+                                  IA->hasSideEffects(), IA->isAlignStack(),
+                                  IA->getDialect(), IA->canThrow());
+        }
+      }
+
       I = CallBrInst::Create(FTy, Callee, DefaultDest, IndirectDests, Args,
                              OperandBundles);
       ResTypeID = getContainedTypeID(FTyID);
diff --git a/llvm/lib/CodeGen/GlobalISel/InlineAsmLowering.cpp b/llvm/lib/CodeGen/GlobalISel/InlineAsmLowering.cpp
index 95ae8383b6fa..e0357c50e555 100644
--- a/llvm/lib/CodeGen/GlobalISel/InlineAsmLowering.cpp
+++ b/llvm/lib/CodeGen/GlobalISel/InlineAsmLowering.cpp
@@ -332,6 +332,8 @@ bool InlineAsmLowering::lowerInlineAsm(
       }
       ++ResNo;
     } else {
+      assert(OpInfo.Type != InlineAsm::isLabel &&
+             "GlobalISel currently doesn't support callbr");
       OpInfo.ConstraintVT = MVT::Other;
     }
 
@@ -427,7 +429,8 @@ bool InlineAsmLowering::lowerInlineAsm(
       }
 
       break;
-    case InlineAsm::isInput: {
+    case InlineAsm::isInput:
+    case InlineAsm::isLabel: {
       if (OpInfo.isMatchingInputConstraint()) {
         unsigned DefIdx = OpInfo.getMatchedOperand();
         // Find operand with register def that corresponds to DefIdx.
diff --git a/llvm/lib/CodeGen/SelectionDAG/SelectionDAGBuilder.cpp b/llvm/lib/CodeGen/SelectionDAG/SelectionDAGBuilder.cpp
index fe3c38ec590d..d879fec7b11b 100644
--- a/llvm/lib/CodeGen/SelectionDAG/SelectionDAGBuilder.cpp
+++ b/llvm/lib/CodeGen/SelectionDAG/SelectionDAGBuilder.cpp
@@ -2990,14 +2990,20 @@ void SelectionDAGBuilder::visitCallBr(const CallBrInst &I) {
   CopyToExportRegsIfNeeded(&I);
 
   // Retrieve successors.
+  SmallPtrSet<BasicBlock *, 8> Dests;
+  Dests.insert(I.getDefaultDest());
   MachineBasicBlock *Return = FuncInfo.MBBMap[I.getDefaultDest()];
 
   // Update successor info.
   addSuccessorWithProb(CallBrMBB, Return, BranchProbability::getOne());
   for (unsigned i = 0, e = I.getNumIndirectDests(); i < e; ++i) {
-    MachineBasicBlock *Target = FuncInfo.MBBMap[I.getIndirectDest(i)];
-    addSuccessorWithProb(CallBrMBB, Target, BranchProbability::getZero());
+    BasicBlock *Dest = I.getIndirectDest(i);
+    MachineBasicBlock *Target = FuncInfo.MBBMap[Dest];
     Target->setIsInlineAsmBrIndirectTarget();
+    Target->setHasAddressTaken();
+    // Don't add duplicate machine successors.
+    if (Dests.insert(Dest).second)
+      addSuccessorWithProb(CallBrMBB, Target, BranchProbability::getZero());
   }
   CallBrMBB->normalizeSuccProbs();
 
@@ -8855,7 +8861,8 @@ void SelectionDAGBuilder::visitInlineAsm(const CallBase &Call,
       }
       break;
 
-    case InlineAsm::isInput: {
+    case InlineAsm::isInput:
+    case InlineAsm::isLabel: {
       SDValue InOperandVal = OpInfo.CallOperand;
 
       if (OpInfo.isMatchingInputConstraint()) {
diff --git a/llvm/lib/CodeGen/SelectionDAG/TargetLowering.cpp b/llvm/lib/CodeGen/SelectionDAG/TargetLowering.cpp
index f61b5256d46b..a31a5fa67996 100644
--- a/llvm/lib/CodeGen/SelectionDAG/TargetLowering.cpp
+++ b/llvm/lib/CodeGen/SelectionDAG/TargetLowering.cpp
@@ -5224,6 +5224,7 @@ TargetLowering::ParseConstraints(const DataLayout &DL,
   // ConstraintOperands list.
   unsigned ArgNo = 0; // ArgNo - The argument of the CallInst.
   unsigned ResNo = 0; // ResNo - The result number of the next output.
+  unsigned LabelNo = 0; // LabelNo - CallBr indirect dest number.
 
   for (InlineAsm::ConstraintInfo &CI : IA->ParseConstraints()) {
     ConstraintOperands.emplace_back(std::move(CI));
@@ -5260,6 +5261,14 @@ TargetLowering::ParseConstraints(const DataLayout &DL,
     case InlineAsm::isInput:
       OpInfo.CallOperandVal = Call.getArgOperand(ArgNo);
       break;
+    case InlineAsm::isLabel:
+      OpInfo.CallOperandVal =
+          cast<CallBrInst>(&Call)->getBlockAddressForIndirectDest(LabelNo);
+      OpInfo.ConstraintVT =
+          getAsmOperandValueType(DL, OpInfo.CallOperandVal->getType())
+              .getSimpleVT();
+      ++LabelNo;
+      continue;
     case InlineAsm::isClobber:
       // Nothing to do.
       break;
diff --git a/llvm/lib/IR/InlineAsm.cpp b/llvm/lib/IR/InlineAsm.cpp
index c75b1aa7c1d6..088fcfdec742 100644
--- a/llvm/lib/IR/InlineAsm.cpp
+++ b/llvm/lib/IR/InlineAsm.cpp
@@ -93,6 +93,9 @@ bool InlineAsm::ConstraintInfo::Parse(StringRef Str,
   } else if (*I == '=') {
     ++I;
     Type = isOutput;
+  } else if (*I == '!') {
+    ++I;
+    Type = isLabel;
   }
 
   if (*I == '*') {
@@ -265,14 +268,14 @@ Error InlineAsm::verify(FunctionType *Ty, StringRef ConstStr) {
     return makeStringError("failed to parse constraints");
 
   unsigned NumOutputs = 0, NumInputs = 0, NumClobbers = 0;
-  unsigned NumIndirect = 0;
+  unsigned NumIndirect = 0, NumLabels = 0;
 
   for (const ConstraintInfo &Constraint : Constraints) {
     switch (Constraint.Type) {
     case InlineAsm::isOutput:
-      if ((NumInputs-NumIndirect) != 0 || NumClobbers != 0)
-        return makeStringError("output constraint occurs after input "
-                               "or clobber constraint");
+      if ((NumInputs-NumIndirect) != 0 || NumClobbers != 0 || NumLabels != 0)
+        return makeStringError("output constraint occurs after input, "
+                               "clobber or label constraint");
 
       if (!Constraint.isIndirect) {
         ++NumOutputs;
@@ -289,6 +292,13 @@ Error InlineAsm::verify(FunctionType *Ty, StringRef ConstStr) {
     case InlineAsm::isClobber:
       ++NumClobbers;
       break;
+    case InlineAsm::isLabel:
+      if (NumClobbers)
+        return makeStringError("label constraint occurs after clobber "
+                               "constraint");
+
+      ++NumLabels;
+      break;
     }
   }
 
@@ -312,5 +322,7 @@ Error InlineAsm::verify(FunctionType *Ty, StringRef ConstStr) {
   if (Ty->getNumParams() != NumInputs)
     return makeStringError("number of input constraints does not match number "
                            "of parameters");
+
+  // We don't have access to labels here, NumLabels will be checked separately.
   return Error::success();
 }
diff --git a/llvm/lib/IR/Instructions.cpp b/llvm/lib/IR/Instructions.cpp
index b333f40f3ce9..26171f537244 100644
--- a/llvm/lib/IR/Instructions.cpp
+++ b/llvm/lib/IR/Instructions.cpp
@@ -960,15 +960,10 @@ void CallBrInst::init(FunctionType *FTy, Value *Fn, BasicBlock *Fallthrough,
   setName(NameStr);
 }
 
-void CallBrInst::updateArgBlockAddresses(unsigned i, BasicBlock *B) {
-  assert(getNumIndirectDests() > i && "IndirectDest # out of range for callbr");
-  if (BasicBlock *OldBB = getIndirectDest(i)) {
-    BlockAddress *Old = BlockAddress::get(OldBB);
-    BlockAddress *New = BlockAddress::get(B);
-    for (unsigned ArgNo = 0, e = arg_size(); ArgNo != e; ++ArgNo)
-      if (dyn_cast<BlockAddress>(getArgOperand(ArgNo)) == Old)
-        setArgOperand(ArgNo, New);
-  }
+BlockAddress *
+CallBrInst::getBlockAddressForIndirectDest(unsigned DestNo) const {
+  return BlockAddress::get(const_cast<Function *>(getFunction()),
+                           getIndirectDest(DestNo));
 }
 
 CallBrInst::CallBrInst(const CallBrInst &CBI)
diff --git a/llvm/lib/IR/Verifier.cpp b/llvm/lib/IR/Verifier.cpp
index 75d02f4c8c82..c540b01392fc 100644
--- a/llvm/lib/IR/Verifier.cpp
+++ b/llvm/lib/IR/Verifier.cpp
@@ -2200,7 +2200,13 @@ bool Verifier::verifyAttributeCount(AttributeList Attrs, unsigned Params) {
 void Verifier::verifyInlineAsmCall(const CallBase &Call) {
   const InlineAsm *IA = cast<InlineAsm>(Call.getCalledOperand());
   unsigned ArgNo = 0;
+  unsigned LabelNo = 0;
   for (const InlineAsm::ConstraintInfo &CI : IA->ParseConstraints()) {
+    if (CI.Type == InlineAsm::isLabel) {
+      ++LabelNo;
+      continue;
+    }
+
     // Only deal with constraints that correspond to call arguments.
     if (!CI.hasArg())
       continue;
@@ -2222,6 +2228,15 @@ void Verifier::verifyInlineAsmCall(const CallBase &Call) {
 
     ArgNo++;
   }
+
+  if (auto *CallBr = dyn_cast<CallBrInst>(&Call)) {
+    Check(LabelNo == CallBr->getNumIndirectDests(),
+          "Number of label constraints does not match number of callbr dests",
+          &Call);
+  } else {
+    Check(LabelNo == 0, "Label constraints can only be used with callbr",
+          &Call);
+  }
 }
 
 /// Verify that statepoint intrinsic is well formed.
@@ -2839,25 +2854,6 @@ void Verifier::visitCallBrInst(CallBrInst &CBI) {
   Check(CBI.isInlineAsm(), "Callbr is currently only used for asm-goto!", &CBI);
   const InlineAsm *IA = cast<InlineAsm>(CBI.getCalledOperand());
   Check(!IA->canThrow(), "Unwinding from Callbr is not allowed");
-  for (unsigned i = 0, e = CBI.getNumSuccessors(); i != e; ++i)
-    Check(CBI.getSuccessor(i)->getType()->isLabelTy(),
-          "Callbr successors must all have pointer type!", &CBI);
-  for (unsigned i = 0, e = CBI.getNumOperands(); i != e; ++i) {
-    Check(i >= CBI.arg_size() || !isa<BasicBlock>(CBI.getOperand(i)),
-          "Using an unescaped label as a callbr argument!", &CBI);
-    if (isa<BasicBlock>(CBI.getOperand(i)))
-      for (unsigned j = i + 1; j != e; ++j)
-        Check(CBI.getOperand(i) != CBI.getOperand(j),
-              "Duplicate callbr destination!", &CBI);
-  }
-  {
-    SmallPtrSet<BasicBlock *, 4> ArgBBs;
-    for (Value *V : CBI.args())
-      if (auto *BA = dyn_cast<BlockAddress>(V))
-        ArgBBs.insert(BA->getBasicBlock());
-    for (BasicBlock *BB : CBI.getIndirectDests())
-      Check(ArgBBs.count(BB), "Indirect label missing from arglist.", &CBI);
-  }
 
   verifyInlineAsmCall(CBI);
   visitTerminator(CBI);
diff --git a/llvm/test/Analysis/BasicAA/pr52735.ll b/llvm/test/Analysis/BasicAA/pr52735.ll
index ed62a3e4ecd6..70ad87434e8f 100644
--- a/llvm/test/Analysis/BasicAA/pr52735.ll
+++ b/llvm/test/Analysis/BasicAA/pr52735.ll
@@ -11,14 +11,14 @@
 
 target triple = "x86_64-unknown-linux-gnu"
 
-; CHECK: Both ModRef:  Ptr: i32* %v	<->  callbr void asm "movl $$1, $0", "=*m,X,~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %v, i8* blockaddress(@foo, %out))
+; CHECK: Both ModRef:  Ptr: i32* %v	<->  callbr void asm "movl $$1, $0", "=*m,!i,~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %v)
 
 
 define dso_local i32 @foo() {
 entry:
   %v = alloca i32, align 4
   %0 = bitcast i32* %v to i8*
-  callbr void asm "movl $$1, $0", "=*m,X,~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) nonnull %v, i8* blockaddress(@foo, %out))
+  callbr void asm "movl $$1, $0", "=*m,!i,~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) nonnull %v)
           to label %asm.fallthrough [label %out]
 
 asm.fallthrough:
diff --git a/llvm/test/Assembler/call-arg-is-callee.ll b/llvm/test/Assembler/call-arg-is-callee.ll
index f2dd6ed1eeb0..e7cafaaf553f 100644
--- a/llvm/test/Assembler/call-arg-is-callee.ll
+++ b/llvm/test/Assembler/call-arg-is-callee.ll
@@ -26,9 +26,7 @@ exception:
 ; verifier prevents duplicating callbr destinations.
 define void @callbr() {
 entry:
-  callbr i32 asm "", "=r,r,i,i"(i32 0,
-                                i8 *blockaddress(@callbr, %two),
-                                i8 *blockaddress(@callbr, %three))
+  callbr i32 asm "", "=r,r,!i,!i"(i32 0)
               to label %one [label %two, label %three]
 one:
   ret void
diff --git a/llvm/test/Assembler/inline-asm-constraint-error.ll b/llvm/test/Assembler/inline-asm-constraint-error.ll
index 5ecf67ab34ad..f9d030c0434e 100644
--- a/llvm/test/Assembler/inline-asm-constraint-error.ll
+++ b/llvm/test/Assembler/inline-asm-constraint-error.ll
@@ -6,6 +6,8 @@
 ; RUN: not llvm-as < %t/cannot-be-struct.ll 2>&1 | FileCheck %s --check-prefix=CHECK-CANNOT-BE-STRUCT
 ; RUN: not llvm-as < %t/incorrect-struct-elements.ll 2>&1 | FileCheck %s --check-prefix=CHECK-INCORRECT-STRUCT-ELEMENTS
 ; RUN: not llvm-as < %t/incorrect-arg-num.ll 2>&1 | FileCheck %s --check-prefix=CHECK-INCORRECT-ARG-NUM
+; RUN: not llvm-as < %t/label-after-clobber.ll 2>&1 | FileCheck %s --check-prefix=CHECK-LABEL-AFTER-CLOBBER
+; RUN: not llvm-as < %t/output-after-label.ll 2>&1 | FileCheck %s --check-prefix=CHECK-OUTPUT-AFTER-LABEL
 
 ;--- parse-fail.ll
 ; CHECK-PARSE-FAIL: failed to parse constraints
@@ -16,7 +18,7 @@ define void @foo() {
 }
 
 ;--- input-before-output.ll
-; CHECK-INPUT-BEFORE-OUTPUT: output constraint occurs after input or clobber constraint
+; CHECK-INPUT-BEFORE-OUTPUT: output constraint occurs after input, clobber or label constraint
 define void @foo() {
   call void asm sideeffect "mov x0, #42", "r,=r"()
   ret void
@@ -56,3 +58,25 @@ define void @foo() {
   call void asm sideeffect "mov x0, #42", "r"()
   ret void
 }
+
+;--- label-after-clobber.ll
+; CHECK-LABEL-AFTER-CLOBBER: label constraint occurs after clobber constraint
+define void @foo() {
+  callbr void asm sideeffect "", "~{flags},!i"()
+  to label %1 [label %2]
+1:
+  ret void
+2:
+  ret void
+}
+
+;--- output-after-label.ll
+; CHECK-OUTPUT-AFTER-LABEL: output constraint occurs after input, clobber or label constraint
+define void @foo() {
+  %res = callbr i32 asm sideeffect "", "!i,=r,~{flags}"()
+  to label %1 [label %2]
+1:
+  ret void
+2:
+  ret void
+}
diff --git a/llvm/test/Bitcode/callbr.ll b/llvm/test/Bitcode/callbr.ll
index d7f413e26867..de9c8650d7df 100644
--- a/llvm/test/Bitcode/callbr.ll
+++ b/llvm/test/Bitcode/callbr.ll
@@ -6,10 +6,9 @@
 
 define i32 @test_asm_goto(i32 %x){
 entry:
-; CHECK-TYPED:      callbr void asm "", "r,i"(i32 %x, i8* blockaddress(@test_asm_goto, %fail))
-; CHECK-OPAQUE:     callbr void asm "", "r,i"(i32 %x, ptr blockaddress(@test_asm_goto, %fail))
+; CHECK: callbr void asm "", "r,!i"(i32 %x)
 ; CHECK-NEXT: to label %normal [label %fail]
-  callbr void asm "", "r,i"(i32 %x, i8* blockaddress(@test_asm_goto, %fail)) to label %normal [label %fail]
+  callbr void asm "", "r,!i"(i32 %x) to label %normal [label %fail]
 normal:
   ret i32 1
 fail:
@@ -18,10 +17,9 @@ fail:
 
 define i32 @test_asm_goto2(i32 %x){
 entry:
-; CHECK-TYPED:      callbr void asm "", "r,i,i"(i32 %x, i8* blockaddress(@test_asm_goto2, %fail), i8* blockaddress(@test_asm_goto2, %fail2))
-; CHECK-OPAQUE:     callbr void asm "", "r,i,i"(i32 %x, ptr blockaddress(@test_asm_goto2, %fail), ptr blockaddress(@test_asm_goto2, %fail2))
+; CHECK: callbr void asm "", "r,!i,!i"(i32 %x)
 ; CHECK-NEXT: to label %normal [label %fail, label %fail2]
-  callbr void asm "", "r,i,i"(i32 %x, i8* blockaddress(@test_asm_goto2, %fail), i8* blockaddress(@test_asm_goto2, %fail2)) to label %normal [label %fail, label %fail2]
+  callbr void asm "", "r,!i,!i"(i32 %x) to label %normal [label %fail, label %fail2]
 normal:
   ret i32 1
 fail:
@@ -32,10 +30,10 @@ fail2:
 
 define i32 @test_asm_goto3(i32 %x){
 entry:
-; CHECK-TYPED:      callbr void asm "", "r,i,i"(i32 %x, i8* blockaddress(@test_asm_goto3, %unrelated), i8* blockaddress(@test_asm_goto3, %fail))
-; CHECK-OPAQUE:     callbr void asm "", "r,i,i"(i32 %x, ptr blockaddress(@test_asm_goto3, %unrelated), ptr blockaddress(@test_asm_goto3, %fail))
+; CHECK-TYPED:      callbr void asm "", "r,i,!i"(i32 %x, i8* blockaddress(@test_asm_goto3, %unrelated))
+; CHECK-OPAQUE:     callbr void asm "", "r,i,!i"(i32 %x, ptr blockaddress(@test_asm_goto3, %unrelated))
 ; CHECK-NEXT: to label %normal [label %fail]
-  callbr void asm "", "r,i,i"(i32 %x, i8* blockaddress(@test_asm_goto3, %unrelated), i8* blockaddress(@test_asm_goto3, %fail)) to label %normal [label %fail]
+  callbr void asm "", "r,i,!i"(i32 %x, i8* blockaddress(@test_asm_goto3, %unrelated)) to label %normal [label %fail]
 normal:
   ret i32 1
 fail:
diff --git a/llvm/test/CodeGen/AArch64/callbr-asm-label.ll b/llvm/test/CodeGen/AArch64/callbr-asm-label.ll
index 60f3846cae1e..3e16d746214d 100644
--- a/llvm/test/CodeGen/AArch64/callbr-asm-label.ll
+++ b/llvm/test/CodeGen/AArch64/callbr-asm-label.ll
@@ -10,7 +10,7 @@ define i32 @test1() {
 ; CHECK: .Ltmp0:
 ; CHECK: .LBB0_2: // %indirect
 entry:
-  callbr void asm sideeffect "1:\0A\09.word b, ${0:l}\0A\09", "i"(i8* blockaddress(@test1, %indirect))
+  callbr void asm sideeffect "1:\0A\09.word b, ${0:l}\0A\09", "!i"()
           to label %cleanup [label %indirect]
 
 indirect:
@@ -34,7 +34,7 @@ if.then:
 ; CHECK-NEXT:  .word .Ltmp2
 ; CHECK:       .Ltmp2:
 ; CHECK-NEXT:  .LBB1_3: // %if.end6
-  callbr void asm sideeffect "1:\0A\09.word b, ${0:l}\0A\09", "i"(i8* blockaddress(@test2, %if.end6))
+  callbr void asm sideeffect "1:\0A\09.word b, ${0:l}\0A\09", "!i"()
           to label %if.then4 [label %if.end6]
 
 if.then4:
@@ -50,7 +50,7 @@ if.end6:
 if.then9:
 ; CHECK: .Ltmp4:
 ; CHECK-NEXT:  .LBB1_5: // %l_yes
-  callbr void asm sideeffect "", "i"(i8* blockaddress(@test2, %l_yes))
+  callbr void asm sideeffect "", "!i"()
           to label %if.end10 [label %l_yes]
 
 if.end10:
diff --git a/llvm/test/CodeGen/AArch64/callbr-asm-obj-file.ll b/llvm/test/CodeGen/AArch64/callbr-asm-obj-file.ll
index f6660000390a..5105c34513a9 100644
--- a/llvm/test/CodeGen/AArch64/callbr-asm-obj-file.ll
+++ b/llvm/test/CodeGen/AArch64/callbr-asm-obj-file.ll
@@ -20,7 +20,7 @@ define hidden i32 @test1() {
   br i1 %2, label %3, label %5
 
 3:                                                ; preds = %0
-  callbr void asm sideeffect "1: nop\0A\09.quad a\0A\09b ${1:l}\0A\09.quad ${0:c}", "i,i"(i32* null, i8* blockaddress(@test1, %7))
+  callbr void asm sideeffect "1: nop\0A\09.quad a\0A\09b ${1:l}\0A\09.quad ${0:c}", "i,!i"(i32* null)
           to label %4 [label %7]
 
 4:                                                ; preds = %3
@@ -55,7 +55,7 @@ define hidden i32 @test2() local_unnamed_addr {
   br i1 %5, label %6, label %7
 
 6:                                                ; preds = %3
-  callbr void asm sideeffect "1: nop\0A\09.quad b\0A\09b ${1:l}\0A\09.quad ${0:c}", "i,i"(i32* null, i8* blockaddress(@test2, %7))
+  callbr void asm sideeffect "1: nop\0A\09.quad b\0A\09b ${1:l}\0A\09.quad ${0:c}", "i,!i"(i32* null)
           to label %10 [label %7]
 
 7:                                                ; preds = %3
@@ -83,7 +83,7 @@ define internal i1 @test3() {
   br i1 %2, label %3, label %5
 
 3:                                                ; preds = %0
-  callbr void asm sideeffect "1: nop\0A\09.quad c\0A\09b ${1:l}\0A\09.quad ${0:c}", "i,i"(i32* null, i8* blockaddress(@test3, %8))
+  callbr void asm sideeffect "1: nop\0A\09.quad c\0A\09b ${1:l}\0A\09.quad ${0:c}", "i,!i"(i32* null)
           to label %4 [label %8]
 
 4:                                                ; preds = %3
diff --git a/llvm/test/CodeGen/AArch64/speculation-hardening-sls.ll b/llvm/test/CodeGen/AArch64/speculation-hardening-sls.ll
index c88f9b21a8f1..d1c7c78c3eb5 100644
--- a/llvm/test/CodeGen/AArch64/speculation-hardening-sls.ll
+++ b/llvm/test/CodeGen/AArch64/speculation-hardening-sls.ll
@@ -89,7 +89,7 @@ entry:
 define i32 @asmgoto() {
 entry:
 ; CHECK-LABEL: asmgoto:
-  callbr void asm sideeffect "B $0", "i"(i8* blockaddress(@asmgoto, %d))
+  callbr void asm sideeffect "B $0", "!i"()
             to label %asm.fallthrough [label %d]
      ; The asm goto above produces a direct branch:
 ; CHECK:           //APP
diff --git a/llvm/test/CodeGen/ARM/speculation-hardening-sls.ll b/llvm/test/CodeGen/ARM/speculation-hardening-sls.ll
index 835583085c31..dfae40effe96 100644
--- a/llvm/test/CodeGen/ARM/speculation-hardening-sls.ll
+++ b/llvm/test/CodeGen/ARM/speculation-hardening-sls.ll
@@ -89,7 +89,7 @@ return:                                           ; preds = %entry, %l2
 define i32 @asmgoto() {
 entry:
 ; CHECK-LABEL: asmgoto:
-  callbr void asm sideeffect "B $0", "i"(i8* blockaddress(@asmgoto, %d))
+  callbr void asm sideeffect "B $0", "!i"()
             to label %asm.fallthrough [label %d]
      ; The asm goto above produces a direct branch:
 ; CHECK:           @APP
diff --git a/llvm/test/CodeGen/PowerPC/ppc64-inlineasm-clobber.ll b/llvm/test/CodeGen/PowerPC/ppc64-inlineasm-clobber.ll
index e2fb1f87773e..fe0fae0dd51d 100644
--- a/llvm/test/CodeGen/PowerPC/ppc64-inlineasm-clobber.ll
+++ b/llvm/test/CodeGen/PowerPC/ppc64-inlineasm-clobber.ll
@@ -111,7 +111,7 @@ define dso_local signext i32 @ClobberLR_BR(i32 signext %in) #0 {
 ; PPC64BE-NEXT:    li r3, 0
 ; PPC64BE-NEXT:    b .LBB3_1
 entry:
-  callbr void asm sideeffect "nop", "i,~{lr}"(i8* blockaddress(@ClobberLR_BR, %return_early))
+  callbr void asm sideeffect "nop", "!i,~{lr}"()
           to label %return [label %return_early]
 
 return_early:
@@ -151,7 +151,7 @@ define dso_local signext i32 @ClobberR5_BR(i32 signext %in) #0 {
 ; PPC64BE-NEXT:    extsw r3, r3
 ; PPC64BE-NEXT:    blr
 entry:
-  callbr void asm sideeffect "nop", "i,~{r5}"(i8* blockaddress(@ClobberR5_BR, %return_early))
+  callbr void asm sideeffect "nop", "!i,~{r5}"()
           to label %return [label %return_early]
 
 return_early:
diff --git a/llvm/test/CodeGen/SystemZ/asm-20.ll b/llvm/test/CodeGen/SystemZ/asm-20.ll
index da336cf45d0b..7f6c0d1c27d4 100644
--- a/llvm/test/CodeGen/SystemZ/asm-20.ll
+++ b/llvm/test/CodeGen/SystemZ/asm-20.ll
@@ -4,7 +4,7 @@
 
 define i32 @c() {
 entry:
-  callbr void asm sideeffect "j d", "i"(i8* blockaddress(@c, %d))
+  callbr void asm sideeffect "j d", "!i"()
           to label %asm.fallthrough [label %d]
 
 asm.fallthrough:               ; preds = %entry
diff --git a/llvm/test/CodeGen/X86/callbr-asm-bb-exports.ll b/llvm/test/CodeGen/X86/callbr-asm-bb-exports.ll
index 9b7a69f19aff..61e712f2024a 100644
--- a/llvm/test/CodeGen/X86/callbr-asm-bb-exports.ll
+++ b/llvm/test/CodeGen/X86/callbr-asm-bb-exports.ll
@@ -17,14 +17,14 @@
 ; CHECK-NEXT: t2: i32,ch = CopyFromReg t0, Register:i32 %2
 ; CHECK-NEXT: t8: i32 = add t2, Constant:i32<4>
 ; CHECK-NEXT: t22: ch,glue = CopyToReg t17, Register:i32 %5, t8
-; CHECK-NEXT: t30: ch,glue = inlineasm_br t22, TargetExternalSymbol:i64'xorl $0, $0; jmp ${1:l}', MDNode:ch<null>, TargetConstant:i64<8>, TargetConstant:i32<2359305>, Register:i32 %5, TargetConstant:i64<13>, TargetBlockAddress:i64<@test, %fail> 0, TargetConstant:i32<12>, Register:i32 $df, TargetConstant:i32<12>, Register:i16 $fpsw, TargetConstant:i32<12>, Register:i32 $eflags, t22:1
+; CHECK-NEXT: t30: ch,glue = inlineasm_br t22, TargetExternalSymbol:i64'xorl $0, $0; jmp ${1:l}', MDNode:ch<null>, TargetConstant:i64<0>, TargetConstant:i32<2359305>, Register:i32 %5, TargetConstant:i64<13>, TargetBlockAddress:i64<@test, %fail> 0, TargetConstant:i32<12>, Register:i32 $df, TargetConstant:i32<12>, Register:i16 $fpsw, TargetConstant:i32<12>, Register:i32 $eflags, t22:1
 
 define i32 @test(i32 %a, i32 %b, i32 %c) {
 entry:
   %0 = add i32 %a, 4
   %1 = add i32 %b, 1
   %2 = add i32 %c, 1
-  callbr void asm "xorl $0, $0; jmp ${1:l}", "r,i,~{dirflag},~{fpsr},~{flags}"(i32 %0, ptr blockaddress(@test, %fail)) to label %normal [label %fail]
+  callbr void asm "xorl $0, $0; jmp ${1:l}", "r,!i,~{dirflag},~{fpsr},~{flags}"(i32 %0) to label %normal [label %fail]
 
 normal:
   ret i32 %1
diff --git a/llvm/test/CodeGen/X86/callbr-asm-blockplacement.ll b/llvm/test/CodeGen/X86/callbr-asm-blockplacement.ll
index b54db0256d4f..41fb8b57ae61 100644
--- a/llvm/test/CodeGen/X86/callbr-asm-blockplacement.ll
+++ b/llvm/test/CodeGen/X86/callbr-asm-blockplacement.ll
@@ -85,7 +85,7 @@ bb8:                                              ; preds = %bb8, %bb5
 bb15:                                             ; preds = %bb8
   %tmp16 = getelementptr [0 x %struct.wibble], ptr @global, i64 0, i64 %tmp4, i32 2
   store ptr %tmp9, ptr %tmp16
-  callbr void asm sideeffect "", "i"(ptr blockaddress(@foo, %bb18))
+  callbr void asm sideeffect "", "!i"()
           to label %bb17 [label %bb18]
 
 bb17:                                             ; preds = %bb15
diff --git a/llvm/test/CodeGen/X86/callbr-asm-branch-folding.ll b/llvm/test/CodeGen/X86/callbr-asm-branch-folding.ll
index dad0564398f8..d1b17e423808 100644
--- a/llvm/test/CodeGen/X86/callbr-asm-branch-folding.ll
+++ b/llvm/test/CodeGen/X86/callbr-asm-branch-folding.ll
@@ -116,7 +116,7 @@ if.end12:                                         ; preds = %if.end8
   br i1 %tobool13, label %if.else, label %if.then14
 
 if.then14:                                        ; preds = %if.end12
-  callbr void asm sideeffect "", "i,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@n, %if.then20.critedge))
+  callbr void asm sideeffect "", "!i,~{dirflag},~{fpsr},~{flags}"()
           to label %cleanup [label %if.then20.critedge]
 
 if.then20.critedge:                               ; preds = %if.then14
diff --git a/llvm/test/CodeGen/X86/callbr-asm-destinations.ll b/llvm/test/CodeGen/X86/callbr-asm-destinations.ll
index e4ebcbd27902..c84847a0cdde 100644
--- a/llvm/test/CodeGen/X86/callbr-asm-destinations.ll
+++ b/llvm/test/CodeGen/X86/callbr-asm-destinations.ll
@@ -1,14 +1,49 @@
-; RUN: not llc -mtriple=i686-- < %s 2> %t
-; RUN: FileCheck %s < %t
+; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
+; RUN: llc -mtriple=i686-- -verify-machineinstrs < %s | FileCheck %s
 
-; CHECK: Duplicate callbr destination
+define i32 @duplicate_normal_and_indirect_dest(i32 %a) {
+; CHECK-LABEL: duplicate_normal_and_indirect_dest:
+; CHECK:       # %bb.0: # %entry
+; CHECK-NEXT:    movl {{[0-9]+}}(%esp), %eax
+; CHECK-NEXT:    addl $4, %eax
+; CHECK-NEXT:    #APP
+; CHECK-NEXT:    xorl %eax, %eax
+; CHECK-NEXT:    jmp .Ltmp0
+; CHECK-NEXT:    #NO_APP
+; CHECK-NEXT:  .Ltmp0: # Block address taken
+; CHECK-NEXT:  # %bb.1: # %fail
+; CHECK-NEXT:    movl $1, %eax
+; CHECK-NEXT:    retl
+entry:
+  %0 = add i32 %a, 4
+  callbr void asm "xorl $0, $0; jmp ${1:l}", "r,!i,~{dirflag},~{fpsr},~{flags}"(i32 %0) to label %fail [label %fail]
 
-; A test for asm-goto duplicate labels limitation
+fail:
+  ret i32 1
+}
 
-define i32 @test(i32 %a) {
+define i32 @duplicate_indirect_dest(i32 %a) {
+; CHECK-LABEL: duplicate_indirect_dest:
+; CHECK:       # %bb.0: # %entry
+; CHECK-NEXT:    movl {{[0-9]+}}(%esp), %eax
+; CHECK-NEXT:    addl $4, %eax
+; CHECK-NEXT:    #APP
+; CHECK-NEXT:    xorl %eax, %eax
+; CHECK-NEXT:    jmp .Ltmp1
+; CHECK-NEXT:    jmp .Ltmp1
+; CHECK-NEXT:    #NO_APP
+; CHECK-NEXT:  # %bb.1: # %normal
+; CHECK-NEXT:    retl
+; CHECK-NEXT:  .Ltmp1: # Block address taken
+; CHECK-NEXT:  .LBB1_2: # %fail
+; CHECK-NEXT:    movl $1, %eax
+; CHECK-NEXT:    retl
 entry:
   %0 = add i32 %a, 4
-  callbr void asm "xorl $0, $0; jmp ${1:l}", "r,i,~{dirflag},~{fpsr},~{flags}"(i32 %0, ptr blockaddress(@test, %fail)) to label %fail [label %fail]
+  callbr void asm "xorl $0, $0; jmp ${1:l}; jmp ${2:l}", "r,!i,!i,~{dirflag},~{fpsr},~{flags}"(i32 %0) to label %normal [label %fail, label %fail]
+
+normal:
+  ret i32 %0
 
 fail:
   ret i32 1
diff --git a/llvm/test/CodeGen/X86/callbr-asm-errors.ll b/llvm/test/CodeGen/X86/callbr-asm-errors.ll
deleted file mode 100644
index e10283edc8c5..000000000000
--- a/llvm/test/CodeGen/X86/callbr-asm-errors.ll
</cut>
------=_Part_2121_1541632140.1658442773323--
