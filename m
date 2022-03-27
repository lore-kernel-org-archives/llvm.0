Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF157E
	for <llvm@lists.linux.dev>; Sun, 27 Mar 2022 11:52:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p189so6828116wmp.3
        for <llvm@lists.linux.dev>; Sun, 27 Mar 2022 04:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=TBkMEJNzSxEuGSfrPj3JHcbqqeXtWasXAqtzWyWHc2c=;
        b=PVIYEvyb1dkmzfAEIeWUYlV9WQruTxAb34jrar0/WYabXKMWXxKMkq/R23UCIMm3xg
         HUwjk+vNRsnPXDyW6qfQIGDS59JWjHmtveOdzAOYcDwxhJ1H8ikHmLmrMvsMsWRIHCTJ
         1f8nfXHqPKYcRnh9u80uKOaMAwKqv+oxVzawAS6Df23DG6PVmJfzrjbaUu1YGp2EiPGz
         8Pyd7DIBWqoJFEqT6DpNxtgdb01HN5jZedypANmwHKEFF8sGc+jG2LNNIU9JM50TkGQM
         OST7gGv9jvEBbUyV/qHAHhV7Y9a1Il8WuyrPiVZ5BlUsisBfEYrpkXJq0bJsW78tYBFA
         3snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=TBkMEJNzSxEuGSfrPj3JHcbqqeXtWasXAqtzWyWHc2c=;
        b=71qam8Jj0w2iuBeE4Ay7/5jncOfrIK/xbdpqZFbxsVwMU7vLqH73Ck3hkE2KeH6W5W
         bbMlDLMPrR7sp6mg8kDNPBIS6UbuFZkrdnehegO/Xw+wCkRj2xfE4oZSB+5wiYAAoS8S
         FQrXqhfUYBrL8ccGtcYsDBRtvAX6rDWQQ2jCk4fvx206pQNAdvZ4X47TUOKSGWug+kvc
         6EgvgBlxpvePhBb6WgE0kfJCmFT9tG2Db80ZxxwugcnNXE5mryJg9djlbQgBYkAI0M6f
         UzQUl0HmnJd+5Ia1SPJhWRu7EykdEvAZwGZ0aGQyk0yAanpzsw+ujC83bNdkhDMn/Rk7
         evcA==
X-Gm-Message-State: AOAM531zvErU0MD3HftUdneLNcUsGW2Gi7MmUNB8jNV6OT0lHdP7O2RY
	YbZqrJD3Giy2XbN5Eu7lencUHw==
X-Google-Smtp-Source: ABdhPJxBoRAy9GkEB6+pTSOV9ClSVfYULNbiojni85FIEN8d5m2p/cfUDea86l02/Vgv1ZvZ2p2J0g==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id c11-20020a05600c0a4b00b0037bea2b5583mr29196303wmq.139.1648381973079;
        Sun, 27 Mar 2022 04:52:53 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id n124-20020a1ca482000000b0038c9cf6e296sm13429549wme.14.2022.03.27.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 04:52:52 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 27 Mar 2022 11:52:51 +0000 (UTC)
To: Sanjay Patel <spatel@rotateright.com>
Cc: llvm@lists.linux.dev
Message-ID: <2054217178.4291.1648381972597@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [InstCombine] try to
 canonicalize logical shift after bswap
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4290_97758513.1648381971661"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-lts-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_4290_97758513.1648381971661
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [InstCombine] try to canonicalize logical shift after bswap:
commit 60820e53ec9d3be028ce315f9b630b55c670b32e
Author: Sanjay Patel <spatel@rotateright.com>

    [InstCombine] try to canonicalize logical shift after bswap

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
19899
# First few build errors in logs:
# 00:10:26 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:10:26 make[1]: *** [scripts/Makefile.build:277: crypto/wp512.o] Error 1
# 00:11:33 arch/arm/lib/xor-neon.c:30:2: error: This code requires at least version 4.6 of GCC [-Werror,-W#warnings]
# 00:11:33 make[1]: *** [scripts/Makefile.build:277: arch/arm/lib/xor-neon.o] Error 1
# 00:11:33 make: *** [Makefile:1868: arch/arm/lib] Error 2
# 00:12:50 make: *** [Makefile:1868: crypto] Error 2
# 00:13:29 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:13:29 make[4]: *** [scripts/Makefile.build:277: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:13:44 make[3]: *** [scripts/Makefile.build:540: drivers/gpu/drm/selftests] Error 2
# 00:15:56 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame size (1104) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wframe-larger-than]

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
19901

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-lts-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/12/artifact/artifacts/build-60820e53ec9d3be028ce315f9b630b55c670b32e/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/12/artifact/artifacts/build-91ea247039dbcc756107616d39baecbb3a4bfb7e/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/12/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/12/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-60820e53ec9d3be028ce315f9b630b55c670b32e
cd investigate-llvm-60820e53ec9d3be028ce315f9b630b55c670b32e

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/12/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/12/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/12/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 60820e53ec9d3be028ce315f9b630b55c670b32e
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 91ea247039dbcc756107616d39baecbb3a4bfb7e
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 60820e53ec9d3be028ce315f9b630b55c670b32e
Author: Sanjay Patel <spatel@rotateright.com>
Date:   Tue Mar 22 09:02:28 2022 -0400

    [InstCombine] try to canonicalize logical shift after bswap
    
    When shifting by a byte-multiple:
    bswap (shl X, C) --> lshr (bswap X), C
    bswap (lshr X, C) --> shl (bswap X), C
    
    This is an IR implementation of a transform suggested in D120648.
    The "swaps cancel" test models the motivating optimization from
    that proposal.
    
    Alive2 checks (as noted in the other review, we could use
    knownbits to handle shift-by-variable-amount, but that can be an
    enhancement patch):
    https://alive2.llvm.org/ce/z/pXUaRf
    https://alive2.llvm.org/ce/z/ZnaMLf
    
    Differential Revision: https://reviews.llvm.org/D122010
---
 .../Transforms/InstCombine/InstCombineCalls.cpp    | 18 +++++++++
 llvm/test/Transforms/InstCombine/bswap-fold.ll     | 46 +++++++++++++---------
 2 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/llvm/lib/Transforms/InstCombine/InstCombineCalls.cpp b/llvm/lib/Transforms/InstCombine/InstCombineCalls.cpp
index eedc79f43cd4..9327dda3924d 100644
--- a/llvm/lib/Transforms/InstCombine/InstCombineCalls.cpp
+++ b/llvm/lib/Transforms/InstCombine/InstCombineCalls.cpp
@@ -1349,6 +1349,24 @@ Instruction *InstCombinerImpl::visitCallInst(CallInst &CI) {
     Value *IIOperand = II->getArgOperand(0);
     Value *X = nullptr;
 
+    // Try to canonicalize bswap-of-logical-shift-by-8-bit-multiple as
+    // inverse-shift-of-bswap:
+    // bswap (shl X, C) --> lshr (bswap X), C
+    // bswap (lshr X, C) --> shl (bswap X), C
+    // TODO: Use knownbits to allow variable shift and non-splat vector match.
+    BinaryOperator *BO;
+    if (match(IIOperand, m_OneUse(m_BinOp(BO)))) {
+      const APInt *C;
+      if (match(BO, m_LogicalShift(m_Value(X), m_APIntAllowUndef(C))) &&
+          (*C & 7) == 0) {
+        Value *NewSwap = Builder.CreateUnaryIntrinsic(Intrinsic::bswap, X);
+        BinaryOperator::BinaryOps InverseShift =
+            BO->getOpcode() == Instruction::Shl ? Instruction::LShr
+                                                : Instruction::Shl;
+        return BinaryOperator::Create(InverseShift, NewSwap, BO->getOperand(1));
+      }
+    }
+
     KnownBits Known = computeKnownBits(IIOperand, 0, II);
     uint64_t LZ = alignDown(Known.countMinLeadingZeros(), 8);
     uint64_t TZ = alignDown(Known.countMinTrailingZeros(), 8);
diff --git a/llvm/test/Transforms/InstCombine/bswap-fold.ll b/llvm/test/Transforms/InstCombine/bswap-fold.ll
index 4e709e5e7239..5da928e97757 100644
--- a/llvm/test/Transforms/InstCombine/bswap-fold.ll
+++ b/llvm/test/Transforms/InstCombine/bswap-fold.ll
@@ -26,8 +26,8 @@ define i32 @test6(i32 %a) {
 
 define i32 @lshr8_i32(i32 %x) {
 ; CHECK-LABEL: @lshr8_i32(
-; CHECK-NEXT:    [[S:%.*]] = lshr i32 [[X:%.*]], 8
-; CHECK-NEXT:    [[R:%.*]] = call i32 @llvm.bswap.i32(i32 [[S]])
+; CHECK-NEXT:    [[TMP1:%.*]] = call i32 @llvm.bswap.i32(i32 [[X:%.*]])
+; CHECK-NEXT:    [[R:%.*]] = shl i32 [[TMP1]], 8
 ; CHECK-NEXT:    ret i32 [[R]]
 ;
   %s = lshr i32 %x, 8
@@ -37,8 +37,8 @@ define i32 @lshr8_i32(i32 %x) {
 
 define <2 x i32> @lshr16_v2i32(<2 x i32> %x) {
 ; CHECK-LABEL: @lshr16_v2i32(
-; CHECK-NEXT:    [[S:%.*]] = lshr <2 x i32> [[X:%.*]], <i32 16, i32 16>
-; CHECK-NEXT:    [[R:%.*]] = call <2 x i32> @llvm.bswap.v2i32(<2 x i32> [[S]])
+; CHECK-NEXT:    [[TMP1:%.*]] = call <2 x i32> @llvm.bswap.v2i32(<2 x i32> [[X:%.*]])
+; CHECK-NEXT:    [[R:%.*]] = shl <2 x i32> [[TMP1]], <i32 16, i32 16>
 ; CHECK-NEXT:    ret <2 x i32> [[R]]
 ;
   %s = lshr <2 x i32> %x, <i32 16, i32 16>
@@ -48,14 +48,16 @@ define <2 x i32> @lshr16_v2i32(<2 x i32> %x) {
 
 define i32 @lshr24_i32(i32 %x) {
 ; CHECK-LABEL: @lshr24_i32(
-; CHECK-NEXT:    [[S:%.*]] = and i32 [[X:%.*]], -16777216
-; CHECK-NEXT:    ret i32 [[S]]
+; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[X:%.*]], -16777216
+; CHECK-NEXT:    ret i32 [[TMP1]]
 ;
   %s = lshr i32 %x, 24
   %r = call i32 @llvm.bswap.i32(i32 %s)
   ret i32 %r
 }
 
+; negative test - need shift-by-8-bit-multiple
+
 define i32 @lshr12_i32(i32 %x) {
 ; CHECK-LABEL: @lshr12_i32(
 ; CHECK-NEXT:    [[S:%.*]] = lshr i32 [[X:%.*]], 12
@@ -67,6 +69,8 @@ define i32 @lshr12_i32(i32 %x) {
   ret i32 %r
 }
 
+; negative test - uses
+
 define i32 @lshr8_i32_use(i32 %x, i32* %p) {
 ; CHECK-LABEL: @lshr8_i32_use(
 ; CHECK-NEXT:    [[S:%.*]] = lshr i32 [[X:%.*]], 12
@@ -82,8 +86,8 @@ define i32 @lshr8_i32_use(i32 %x, i32* %p) {
 
 define i64 @shl16_i64(i64 %x) {
 ; CHECK-LABEL: @shl16_i64(
-; CHECK-NEXT:    [[S:%.*]] = shl i64 [[X:%.*]], 16
-; CHECK-NEXT:    [[R:%.*]] = call i64 @llvm.bswap.i64(i64 [[S]])
+; CHECK-NEXT:    [[TMP1:%.*]] = call i64 @llvm.bswap.i64(i64 [[X:%.*]])
+; CHECK-NEXT:    [[R:%.*]] = lshr i64 [[TMP1]], 16
 ; CHECK-NEXT:    ret i64 [[R]]
 ;
   %s = shl i64 %x, 16
@@ -91,10 +95,12 @@ define i64 @shl16_i64(i64 %x) {
   ret i64 %r
 }
 
+; poison vector element propagates
+
 define <2 x i64> @shl16_v2i64(<2 x i64> %x) {
 ; CHECK-LABEL: @shl16_v2i64(
-; CHECK-NEXT:    [[S:%.*]] = shl <2 x i64> [[X:%.*]], <i64 poison, i64 24>
-; CHECK-NEXT:    [[R:%.*]] = call <2 x i64> @llvm.bswap.v2i64(<2 x i64> [[S]])
+; CHECK-NEXT:    [[TMP1:%.*]] = call <2 x i64> @llvm.bswap.v2i64(<2 x i64> [[X:%.*]])
+; CHECK-NEXT:    [[R:%.*]] = lshr <2 x i64> [[TMP1]], <i64 poison, i64 24>
 ; CHECK-NEXT:    ret <2 x i64> [[R]]
 ;
   %s = shl <2 x i64> %x, <i64 poison, i64 24>
@@ -104,14 +110,16 @@ define <2 x i64> @shl16_v2i64(<2 x i64> %x) {
 
 define i64 @shl56_i64(i64 %x) {
 ; CHECK-LABEL: @shl56_i64(
-; CHECK-NEXT:    [[S:%.*]] = and i64 [[X:%.*]], 255
-; CHECK-NEXT:    ret i64 [[S]]
+; CHECK-NEXT:    [[TMP1:%.*]] = and i64 [[X:%.*]], 255
+; CHECK-NEXT:    ret i64 [[TMP1]]
 ;
   %s = shl i64 %x, 56
   %r = call i64 @llvm.bswap.i64(i64 %s)
   ret i64 %r
 }
 
+; negative test - need shift-by-8-bit-multiple
+
 define i64 @shl42_i64(i64 %x) {
 ; CHECK-LABEL: @shl42_i64(
 ; CHECK-NEXT:    [[S:%.*]] = shl i64 [[X:%.*]], 42
@@ -123,6 +131,8 @@ define i64 @shl42_i64(i64 %x) {
   ret i64 %r
 }
 
+; negative test - uses
+
 define i32 @shl8_i32_use(i32 %x, i32* %p) {
 ; CHECK-LABEL: @shl8_i32_use(
 ; CHECK-NEXT:    [[S:%.*]] = shl i32 [[X:%.*]], 8
@@ -136,11 +146,11 @@ define i32 @shl8_i32_use(i32 %x, i32* %p) {
   ret i32 %r
 }
 
+; swaps cancel
+
 define i64 @swap_shl16_i64(i64 %x) {
 ; CHECK-LABEL: @swap_shl16_i64(
-; CHECK-NEXT:    [[B:%.*]] = call i64 @llvm.bswap.i64(i64 [[X:%.*]])
-; CHECK-NEXT:    [[S:%.*]] = shl i64 [[B]], 16
-; CHECK-NEXT:    [[R:%.*]] = call i64 @llvm.bswap.i64(i64 [[S]])
+; CHECK-NEXT:    [[R:%.*]] = lshr i64 [[X:%.*]], 16
 ; CHECK-NEXT:    ret i64 [[R]]
 ;
   %b = call i64 @llvm.bswap.i64(i64 %x)
@@ -536,11 +546,11 @@ define <2 x i64> @bs_active_high_different_negative(<2 x i64> %0) {
   ret <2 x i64> %3
 }
 
-; negative test
+; TODO: This should fold to 'and'.
 define <2 x i64> @bs_active_high_undef(<2 x i64> %0) {
 ; CHECK-LABEL: @bs_active_high_undef(
-; CHECK-NEXT:    [[TMP2:%.*]] = shl <2 x i64> [[TMP0:%.*]], <i64 56, i64 undef>
-; CHECK-NEXT:    [[TMP3:%.*]] = call <2 x i64> @llvm.bswap.v2i64(<2 x i64> [[TMP2]])
+; CHECK-NEXT:    [[TMP2:%.*]] = call <2 x i64> @llvm.bswap.v2i64(<2 x i64> [[TMP0:%.*]])
+; CHECK-NEXT:    [[TMP3:%.*]] = lshr <2 x i64> [[TMP2]], <i64 56, i64 undef>
 ; CHECK-NEXT:    ret <2 x i64> [[TMP3]]
 ;
   %2 = shl <2 x i64> %0, <i64 56, i64 undef>
</cut>
------=_Part_4290_97758513.1648381971661--
