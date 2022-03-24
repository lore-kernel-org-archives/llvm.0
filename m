Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F971FC0
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 13:53:44 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so2611113wmp.5
        for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=fkap+xoLZ1YdoaWJuiDJoJBsTjje9cQ4mhLF6sIWwOo=;
        b=tjMCcL1L4s28NEhi1ZFeKcnKXmAlODCT4tvkOIc2Erd4tBdrzQXyD1jzkUHzmZNo3h
         EU1hV5DXNKDb7oigJJDfY5hi/PXAL5Sut5yimRYLa21zMUOmJkb50CXmMbE6q5anqVXd
         RBM/tqL5A9qMipovMxwXnWdo2dcn1OejP+zHgp70EC2YmsQFJws7S1gpSX5gH9DE64ic
         8YyLNffBgypp2dOxPbkcll1Vi3Q0xqyXfJVlvTsvdWBUF9KERgAUPRVy5xi5BJaw70ye
         dZdm616gNuyGiTay9I/pe/UpNlfX62QrsJZMiJzOzHOCdXbdfyO4LhN08Yae3i5fSC6x
         hgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=fkap+xoLZ1YdoaWJuiDJoJBsTjje9cQ4mhLF6sIWwOo=;
        b=c3sl0PqIClTDF3DC9+L/b1JaHz9v+CxIvSbbLLsPnltQbPUKE55bd3WsZL2Ic2TSGc
         yx5j91/E5v1CaV6lrPWf106VggPcxCCCo8KUgLe/B2jFbGBgNKHS5GRC1n7/Ac26FlRL
         9dN9RUCUwK3ZghNreFulFzNVlITZFUZs1DNxheuzJMJZUt0QPPwcxLnppq1TYER9uW+l
         UddLQiQF/LQq6IJEpXCNKhsPCCQfKGWHokAVr5VlovFp82srWHWQeEpZ1jCv0uMGTpB0
         NBGeAZDBqdBj74Wy4V5hHToZQmO9p0uJWTfu7IJ3Z1o/NMrsYG1Fw9upQ6/HQYIgb8OD
         MRCQ==
X-Gm-Message-State: AOAM532sMO8sN+jwQZWEg/lahP5Y67cqOGInD7RaZFvG1k7FdW54TQPu
	fYE+w4oWng6J2pg78R0dY+nAc4GuziVUp6ft
X-Google-Smtp-Source: ABdhPJxzb6ebzMIyZhGGJWMnIU6cZ34t3MEdpM+ei0R4lwa2QRIrBtZ2iVtKxntYmV2oM36esQxkFw==
X-Received: by 2002:a05:600c:1c20:b0:38c:ae37:c1ae with SMTP id j32-20020a05600c1c2000b0038cae37c1aemr4768628wms.203.1648130022402;
        Thu, 24 Mar 2022 06:53:42 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id i10-20020a0560001aca00b00203daf3759asm2924622wry.68.2022.03.24.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 06:53:41 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 24 Mar 2022 13:53:40 +0000 (UTC)
To: Sanjay Patel <spatel@rotateright.com>
Cc: llvm@lists.linux.dev
Message-ID: <1683551351.3080.1648130021654@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [InstCombine] try to narrow
 shifted bswap-of-zext
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3079_903138791.1648130020493"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-lts-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_3079_903138791.1648130020493
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [InstCombine] try to narrow shifted bswap-of-zext:
commit 9e9bda2e8f5b88715bad767a4b7740df32b040d2
Author: Sanjay Patel <spatel@rotateright.com>

    [InstCombine] try to narrow shifted bswap-of-zext

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
19901
# First few build errors in logs:
# 00:03:41 arch/arm/lib/xor-neon.c:30:2: error: This code requires at least version 4.6 of GCC [-Werror,-W#warnings]
# 00:03:41 make[1]: *** [scripts/Makefile.build:277: arch/arm/lib/xor-neon.o] Error 1
# 00:03:42 make: *** [Makefile:1868: arch/arm/lib] Error 2
# 00:04:49 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:04:49 make[1]: *** [scripts/Makefile.build:277: crypto/wp512.o] Error 1
# 00:06:52 make: *** [Makefile:1868: crypto] Error 2
# 00:10:52 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:10:53 make[4]: *** [scripts/Makefile.build:277: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:11:05 make[3]: *** [scripts/Makefile.build:540: drivers/gpu/drm/selftests] Error 2
# 00:13:32 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame size (1104) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wframe-larger-than]

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
19902

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-lts-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/11/artifact/artifacts/build-9e9bda2e8f5b88715bad767a4b7740df32b040d2/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/11/artifact/artifacts/build-c4f31d1da582232d206756b7246858f66ccdbd0c/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/11/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/11/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-9e9bda2e8f5b88715bad767a4b7740df32b040d2
cd investigate-llvm-9e9bda2e8f5b88715bad767a4b7740df32b040d2

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/11/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/11/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-lts-allyesconfig/11/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 9e9bda2e8f5b88715bad767a4b7740df32b040d2
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach c4f31d1da582232d206756b7246858f66ccdbd0c
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 9e9bda2e8f5b88715bad767a4b7740df32b040d2
Author: Sanjay Patel <spatel@rotateright.com>
Date:   Tue Mar 22 07:52:39 2022 -0400

    [InstCombine] try to narrow shifted bswap-of-zext
    
    This is the IR counterpart to 370ebc9d9a573d6
    which provided a bswap narrowing fix for issue #53867.
    
    Here we can be more general (although I'm not sure yet
    what would happen for illegal types in codegen - too
    rare to worry about?):
    https://alive2.llvm.org/ce/z/3-CPfo
    
    This will be more effective if we have moved the shift
    after the bswap as proposed in D122010, but it is
    independent of that patch.
    
    Differential Revision: https://reviews.llvm.org/D122166
---
 .../Transforms/InstCombine/InstCombineShifts.cpp   | 15 +++++++++++
 llvm/test/Transforms/InstCombine/lshr.ll           | 31 +++++++++++-----------
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/llvm/lib/Transforms/InstCombine/InstCombineShifts.cpp b/llvm/lib/Transforms/InstCombine/InstCombineShifts.cpp
index 03214118a2cf..403979b4a6a3 100644
--- a/llvm/lib/Transforms/InstCombine/InstCombineShifts.cpp
+++ b/llvm/lib/Transforms/InstCombine/InstCombineShifts.cpp
@@ -1173,6 +1173,21 @@ Instruction *InstCombinerImpl::visitLShr(BinaryOperator &I) {
         MulC->logBase2() == ShAmtC)
       return BinaryOperator::CreateAnd(X, ConstantInt::get(Ty, *MulC - 2));
 
+    // Try to narrow a bswap:
+    // (bswap (zext X)) >> C --> zext (bswap X >> C')
+    // In the case where the shift amount equals the bitwidth difference, the
+    // shift is eliminated.
+    if (match(Op0, m_OneUse(m_Intrinsic<Intrinsic::bswap>(
+                       m_OneUse(m_ZExt(m_Value(X))))))) {
+      // TODO: If the shift amount is less than the zext, we could shift left.
+      unsigned WidthDiff = BitWidth - X->getType()->getScalarSizeInBits();
+      if (ShAmtC >= WidthDiff) {
+        Value *NarrowSwap = Builder.CreateUnaryIntrinsic(Intrinsic::bswap, X);
+        Value *NewShift = Builder.CreateLShr(NarrowSwap, ShAmtC - WidthDiff);
+        return new ZExtInst(NewShift, Ty);
+      }
+    }
+
     // If the shifted-out value is known-zero, then this is an exact shift.
     if (!I.isExact() &&
         MaskedValueIsZero(Op0, APInt::getLowBitsSet(BitWidth, ShAmtC), 0, &I)) {
diff --git a/llvm/test/Transforms/InstCombine/lshr.ll b/llvm/test/Transforms/InstCombine/lshr.ll
index 175430189ce1..a46f3f460f5e 100644
--- a/llvm/test/Transforms/InstCombine/lshr.ll
+++ b/llvm/test/Transforms/InstCombine/lshr.ll
@@ -831,9 +831,8 @@ define i1 @icmp_sge(i32 %x, i32 %y) {
 
 define i32 @narrow_bswap(i16 %x) {
 ; CHECK-LABEL: @narrow_bswap(
-; CHECK-NEXT:    [[Z:%.*]] = zext i16 [[X:%.*]] to i32
-; CHECK-NEXT:    [[B:%.*]] = call i32 @llvm.bswap.i32(i32 [[Z]])
-; CHECK-NEXT:    [[S:%.*]] = lshr exact i32 [[B]], 16
+; CHECK-NEXT:    [[TMP1:%.*]] = call i16 @llvm.bswap.i16(i16 [[X:%.*]])
+; CHECK-NEXT:    [[S:%.*]] = zext i16 [[TMP1]] to i32
 ; CHECK-NEXT:    ret i32 [[S]]
 ;
   %z = zext i16 %x to i32
@@ -844,9 +843,8 @@ define i32 @narrow_bswap(i16 %x) {
 
 define i128 @narrow_bswap_extra_wide(i16 %x) {
 ; CHECK-LABEL: @narrow_bswap_extra_wide(
-; CHECK-NEXT:    [[Z:%.*]] = zext i16 [[X:%.*]] to i128
-; CHECK-NEXT:    [[B:%.*]] = call i128 @llvm.bswap.i128(i128 [[Z]])
-; CHECK-NEXT:    [[S:%.*]] = lshr exact i128 [[B]], 112
+; CHECK-NEXT:    [[TMP1:%.*]] = call i16 @llvm.bswap.i16(i16 [[X:%.*]])
+; CHECK-NEXT:    [[S:%.*]] = zext i16 [[TMP1]] to i128
 ; CHECK-NEXT:    ret i128 [[S]]
 ;
   %z = zext i16 %x to i128
@@ -855,6 +853,8 @@ define i128 @narrow_bswap_extra_wide(i16 %x) {
   ret i128 %s
 }
 
+; TODO: The bswap can be narrowed followed by shl.
+
 define i32 @narrow_bswap_undershift(i16 %x) {
 ; CHECK-LABEL: @narrow_bswap_undershift(
 ; CHECK-NEXT:    [[Z:%.*]] = zext i16 [[X:%.*]] to i32
@@ -870,9 +870,8 @@ define i32 @narrow_bswap_undershift(i16 %x) {
 
 define <2 x i64> @narrow_bswap_splat(<2 x i16> %x) {
 ; CHECK-LABEL: @narrow_bswap_splat(
-; CHECK-NEXT:    [[Z:%.*]] = zext <2 x i16> [[X:%.*]] to <2 x i64>
-; CHECK-NEXT:    [[B:%.*]] = call <2 x i64> @llvm.bswap.v2i64(<2 x i64> [[Z]])
-; CHECK-NEXT:    [[S:%.*]] = lshr exact <2 x i64> [[B]], <i64 48, i64 48>
+; CHECK-NEXT:    [[TMP1:%.*]] = call <2 x i16> @llvm.bswap.v2i16(<2 x i16> [[X:%.*]])
+; CHECK-NEXT:    [[S:%.*]] = zext <2 x i16> [[TMP1]] to <2 x i64>
 ; CHECK-NEXT:    ret <2 x i64> [[S]]
 ;
   %z = zext <2 x i16> %x to <2 x i64>
@@ -881,6 +880,8 @@ define <2 x i64> @narrow_bswap_splat(<2 x i16> %x) {
   ret <2 x i64> %s
 }
 
+; TODO: poison/undef in the shift amount is ok to propagate.
+
 define <2 x i64> @narrow_bswap_splat_poison_elt(<2 x i16> %x) {
 ; CHECK-LABEL: @narrow_bswap_splat_poison_elt(
 ; CHECK-NEXT:    [[Z:%.*]] = zext <2 x i16> [[X:%.*]] to <2 x i64>
@@ -896,9 +897,9 @@ define <2 x i64> @narrow_bswap_splat_poison_elt(<2 x i16> %x) {
 
 define <2 x i64> @narrow_bswap_overshift(<2 x i32> %x) {
 ; CHECK-LABEL: @narrow_bswap_overshift(
-; CHECK-NEXT:    [[Z:%.*]] = zext <2 x i32> [[X:%.*]] to <2 x i64>
-; CHECK-NEXT:    [[B:%.*]] = call <2 x i64> @llvm.bswap.v2i64(<2 x i64> [[Z]])
-; CHECK-NEXT:    [[S:%.*]] = lshr <2 x i64> [[B]], <i64 48, i64 48>
+; CHECK-NEXT:    [[TMP1:%.*]] = call <2 x i32> @llvm.bswap.v2i32(<2 x i32> [[X:%.*]])
+; CHECK-NEXT:    [[TMP2:%.*]] = lshr <2 x i32> [[TMP1]], <i32 16, i32 16>
+; CHECK-NEXT:    [[S:%.*]] = zext <2 x i32> [[TMP2]] to <2 x i64>
 ; CHECK-NEXT:    ret <2 x i64> [[S]]
 ;
   %z = zext <2 x i32> %x to <2 x i64>
@@ -909,9 +910,9 @@ define <2 x i64> @narrow_bswap_overshift(<2 x i32> %x) {
 
 define i128 @narrow_bswap_overshift2(i96 %x) {
 ; CHECK-LABEL: @narrow_bswap_overshift2(
-; CHECK-NEXT:    [[Z:%.*]] = zext i96 [[X:%.*]] to i128
-; CHECK-NEXT:    [[B:%.*]] = call i128 @llvm.bswap.i128(i128 [[Z]])
-; CHECK-NEXT:    [[S:%.*]] = lshr i128 [[B]], 61
+; CHECK-NEXT:    [[TMP1:%.*]] = call i96 @llvm.bswap.i96(i96 [[X:%.*]])
+; CHECK-NEXT:    [[TMP2:%.*]] = lshr i96 [[TMP1]], 29
+; CHECK-NEXT:    [[S:%.*]] = zext i96 [[TMP2]] to i128
 ; CHECK-NEXT:    ret i128 [[S]]
 ;
   %z = zext i96 %x to i128
</cut>
------=_Part_3079_903138791.1648130020493--
