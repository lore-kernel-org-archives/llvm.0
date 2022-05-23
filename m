Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F4F36E
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 01:10:21 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r23so19181500wrr.2
        for <llvm@lists.linux.dev>; Sun, 22 May 2022 18:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=efdrnxM9rWPWgR6bK2DFGgeAP+PNmxm8kTD8+gFixGQ=;
        b=UlH7h3Y1mx7BUdxM1APBwD3t57SD8O6WbmtyGdvJ/TsIJoHyHdv+y3X/6rpfhs0ghX
         rQvhWHhvDu3N/TdiO37iinS/UXN9TtgTlA53rP5pbOsqNYHj3SoOlf4d+fwwFZqRFweL
         eOa1077drSJm4WG+Z5y8ThwXxgn/U3Wnjru1ERX5CAasfJ9rG1XN40NW30sOn+IUHUhF
         tb7vGHmz0ta9hJYe9lapgeWbryjN0iI4g7/m7fv291U+e1Zm61D021dPlL7VRTlinsDL
         meyTwSr8HPF1pPKPE4joLROMSK2XCEzpf+UVKOmYWgAYxqOLSr9i9m+S/tQjrLmwp0OB
         +eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=efdrnxM9rWPWgR6bK2DFGgeAP+PNmxm8kTD8+gFixGQ=;
        b=W+5Bk7Ddh1ptEWhcOh27ah58DoK7V6uojuUT10kErTjC8Va3jEmgONp94XeVe4pCBK
         fUD4OmEgwAbO2/Ecan5gSV0QF+GybqzQbe1kKPTTpb6nZii2RiXATiK6xROHfIghV/DI
         v8+UCRnijEgTYFPmJiOcU2OeAXM56Sb6P7AwSBnGevsa8Do+gg76Mf9uv/NkLsyIHpml
         O/zKd5NgNIJkg4R4MXei3F8/pXgqoX8yINmtaWrrUvnw1RE+KIDMh46a5kAcFJNGJrza
         e1hNt5HwFRoqlwDHOi+nbDCtc6V0/Yz+gDTIK0Ob7eJXqDh3G0CzeRpJ6RTIbs2H7eRX
         sv1Q==
X-Gm-Message-State: AOAM530mbcmAZ8AivtIHpsl7L+oOHcFwoAh/CuuAxUHYSir7PzlEPd8l
	7miI/rbiPAPsZjoAMTCvEvaCLQ==
X-Google-Smtp-Source: ABdhPJxfz9APpMOFZy+Xe4M4/Na+devyJbFMg/NmZy2JjQH8HfmYSXOEOKFCE8MVMlTkp22gwzNc1w==
X-Received: by 2002:a5d:52ce:0:b0:20c:e030:b05a with SMTP id r14-20020a5d52ce000000b0020ce030b05amr16515836wrv.174.1653268219305;
        Sun, 22 May 2022 18:10:19 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c40c700b003973c54bd69sm6413656wmh.1.2022.05.22.18.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 18:10:18 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 23 May 2022 01:10:17 +0000 (UTC)
To: Sanjay Patel <spatel@rotateright.com>
Cc: llvm@lists.linux.dev
Message-ID: <913191959.251.1653268218351@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [InstCombine] fold icmp with
 sub and bool
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_250_1958050134.1653268217605"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-next-allnoconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_250_1958050134.1653268217605
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [InstCombine] fold icmp with sub and bool:
commit 4069cccf3b4ff4afb743d3d371ead9e2d5491e3a
Author: Sanjay Patel <spatel@rotateright.com>

    [InstCombine] fold icmp with sub and bool

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
546
# First few build errors in logs:
# 00:01:23 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:01:23 make[1]: *** [scripts/Makefile.build:295: block/bio.o] Error 134
# 00:01:32 make: *** [Makefile:2000: block] Error 2

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
563
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-next-allnoconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/build-4069cccf3b4ff4afb743d3d371ead9e2d5491e3a/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/build-aa9acb51f69a862547699c5f7fa5c6f6c1353253/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-4069cccf3b4ff4afb743d3d371ead9e2d5491e3a
cd investigate-llvm-4069cccf3b4ff4afb743d3d371ead9e2d5491e3a

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 4069cccf3b4ff4afb743d3d371ead9e2d5491e3a
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach aa9acb51f69a862547699c5f7fa5c6f6c1353253
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 4069cccf3b4ff4afb743d3d371ead9e2d5491e3a
Author: Sanjay Patel <spatel@rotateright.com>
Date:   Sun May 22 11:02:28 2022 -0400

    [InstCombine] fold icmp with sub and bool
    
    This is the specific pattern seen in #53432, but it can be extended
    in multiple ways:
    1. The 'zext' could be an 'and'
    2. The 'sub' could be some other binop with a similar ==0 property (udiv).
    
    There might be some way to generalize using knownbits, but that
    would require checking that the 'bool' value is created with
    some instruction that can be replaced with new icmp+logic.
    
    https://alive2.llvm.org/ce/z/-KCfpa
---
 .../Transforms/InstCombine/InstCombineCompares.cpp | 26 ++++++++++++++++++++++
 llvm/test/Transforms/InstCombine/icmp-range.ll     | 17 ++++++++------
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/llvm/lib/Transforms/InstCombine/InstCombineCompares.cpp b/llvm/lib/Transforms/InstCombine/InstCombineCompares.cpp
index 4f20a0699ec5..e2a6b6b1495b 100644
--- a/llvm/lib/Transforms/InstCombine/InstCombineCompares.cpp
+++ b/llvm/lib/Transforms/InstCombine/InstCombineCompares.cpp
@@ -5631,6 +5631,29 @@ Instruction *InstCombinerImpl::foldICmpUsingKnownBits(ICmpInst &I) {
   return nullptr;
 }
 
+/// If one operand of an icmp is effectively a bool (value range of {0,1}),
+/// then try to reduce patterns based on that limit.
+static Instruction *foldICmpUsingBoolRange(ICmpInst &I,
+                                           InstCombiner::BuilderTy &Builder) {
+  Value *Op0 = I.getOperand(0), *Op1 = I.getOperand(1);
+  const ICmpInst::Predicate Pred = I.getPredicate();
+
+  Value *X, *Y, *Z;
+  if (Pred != ICmpInst::ICMP_ULT || !match(Op0, m_Sub(m_Value(X), m_Value(Y))))
+    return nullptr;
+
+  unsigned ExtraUses = !Op0->hasOneUse() + !Op1->hasOneUse();
+
+  // Sub must be 0 and bool must be true for "ULT":
+  // (sub X, Y) <u (zext i1 Z) --> (X == Y) && Z
+  if (match(Op1, m_ZExt(m_Value(Z))) && ExtraUses < 2) {
+    Value *EqXY = Builder.CreateICmpEQ(X, Y);
+    return BinaryOperator::CreateAnd(EqXY, Z);
+  }
+
+  return nullptr;
+}
+
 llvm::Optional<std::pair<CmpInst::Predicate, Constant *>>
 InstCombiner::getFlippedStrictnessPredicateAndConstant(CmpInst::Predicate Pred,
                                                        Constant *C) {
@@ -6058,6 +6081,9 @@ Instruction *InstCombinerImpl::visitICmpInst(ICmpInst &I) {
   if (Instruction *Res = foldICmpWithDominatingICmp(I))
     return Res;
 
+  if (Instruction *Res = foldICmpUsingBoolRange(I, Builder))
+    return Res;
+
   if (Instruction *Res = foldICmpUsingKnownBits(I))
     return Res;
 
diff --git a/llvm/test/Transforms/InstCombine/icmp-range.ll b/llvm/test/Transforms/InstCombine/icmp-range.ll
index b67356675eba..a29d4cd81b9d 100644
--- a/llvm/test/Transforms/InstCombine/icmp-range.ll
+++ b/llvm/test/Transforms/InstCombine/icmp-range.ll
@@ -173,9 +173,8 @@ define i1 @test_two_ranges3(i32* nocapture readonly %arg1, i32* nocapture readon
 
 define i1 @sub_ult_zext(i1 %b, i8 %x, i8 %y) {
 ; CHECK-LABEL: @sub_ult_zext(
-; CHECK-NEXT:    [[Z:%.*]] = zext i1 [[B:%.*]] to i8
-; CHECK-NEXT:    [[S:%.*]] = sub i8 [[X:%.*]], [[Y:%.*]]
-; CHECK-NEXT:    [[R:%.*]] = icmp ult i8 [[S]], [[Z]]
+; CHECK-NEXT:    [[TMP1:%.*]] = icmp eq i8 [[X:%.*]], [[Y:%.*]]
+; CHECK-NEXT:    [[R:%.*]] = and i1 [[TMP1]], [[B:%.*]]
 ; CHECK-NEXT:    ret i1 [[R]]
 ;
   %z = zext i1 %b to i8
@@ -188,8 +187,8 @@ define i1 @sub_ult_zext_use1(i1 %b, i8 %x, i8 %y) {
 ; CHECK-LABEL: @sub_ult_zext_use1(
 ; CHECK-NEXT:    [[Z:%.*]] = zext i1 [[B:%.*]] to i8
 ; CHECK-NEXT:    call void @use(i8 [[Z]])
-; CHECK-NEXT:    [[S:%.*]] = sub i8 [[X:%.*]], [[Y:%.*]]
-; CHECK-NEXT:    [[R:%.*]] = icmp ult i8 [[S]], [[Z]]
+; CHECK-NEXT:    [[TMP1:%.*]] = icmp eq i8 [[X:%.*]], [[Y:%.*]]
+; CHECK-NEXT:    [[R:%.*]] = and i1 [[TMP1]], [[B]]
 ; CHECK-NEXT:    ret i1 [[R]]
 ;
   %z = zext i1 %b to i8
@@ -201,10 +200,10 @@ define i1 @sub_ult_zext_use1(i1 %b, i8 %x, i8 %y) {
 
 define <2 x i1> @zext_ugt_sub_use2(<2 x i1> %b, <2 x i8> %x, <2 x i8> %y) {
 ; CHECK-LABEL: @zext_ugt_sub_use2(
-; CHECK-NEXT:    [[Z:%.*]] = zext <2 x i1> [[B:%.*]] to <2 x i8>
 ; CHECK-NEXT:    [[S:%.*]] = sub <2 x i8> [[X:%.*]], [[Y:%.*]]
 ; CHECK-NEXT:    call void @use_vec(<2 x i8> [[S]])
-; CHECK-NEXT:    [[R:%.*]] = icmp ult <2 x i8> [[S]], [[Z]]
+; CHECK-NEXT:    [[TMP1:%.*]] = icmp eq <2 x i8> [[X]], [[Y]]
+; CHECK-NEXT:    [[R:%.*]] = and <2 x i1> [[TMP1]], [[B:%.*]]
 ; CHECK-NEXT:    ret <2 x i1> [[R]]
 ;
   %z = zext <2 x i1> %b to <2 x i8>
@@ -214,6 +213,8 @@ define <2 x i1> @zext_ugt_sub_use2(<2 x i1> %b, <2 x i8> %x, <2 x i8> %y) {
   ret <2 x i1> %r
 }
 
+; negative test - too many extra uses
+
 define i1 @sub_ult_zext_use3(i1 %b, i8 %x, i8 %y) {
 ; CHECK-LABEL: @sub_ult_zext_use3(
 ; CHECK-NEXT:    [[Z:%.*]] = zext i1 [[B:%.*]] to i8
@@ -231,6 +232,8 @@ define i1 @sub_ult_zext_use3(i1 %b, i8 %x, i8 %y) {
   ret i1 %r
 }
 
+; negative test - wrong predicate
+
 define i1 @sub_ule_zext(i1 %b, i8 %x, i8 %y) {
 ; CHECK-LABEL: @sub_ule_zext(
 ; CHECK-NEXT:    [[Z:%.*]] = zext i1 [[B:%.*]] to i8
</cut>
------=_Part_250_1958050134.1653268217605--
