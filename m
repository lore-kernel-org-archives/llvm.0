Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466DD10EC
	for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 23:38:57 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id ja17so7547466wmb.3
        for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 15:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v5BDb7CsjJTu1P6eIoYUva4fcW8d1i5laQ4kYHSRGs=;
        b=A8TyUZH1hWQGD/uPdDTgL84ImRqkSyxCoZWWt/9fck4WpwPx/Vm3Q9LuWx9h5hOlan
         w8HDyUrSZ99jOddvSrc7JQq/KCh7B/B1oS31Dro5gekAMEhVJ3Y7yI2k6X9cZqcSjuCM
         V7RqEXKCZk15WHbutiXFBi1rwywYbu2gGeqgibiQmR1ZE/t3kP+cz1tRKpSEckUfNact
         bTmDywe3SEt7NwzHsXaW0fk1HP8Mf+TAMVjIZXYvi/GNKnu3yLxymlm9LAQHa5bVOkUb
         PX2UWxcB7tdy/ryLHNl0z5CZ5yS3g0Qqe6refsvEC6mwx59UWY2uas30XuOzXFe72339
         U6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2v5BDb7CsjJTu1P6eIoYUva4fcW8d1i5laQ4kYHSRGs=;
        b=luS8MLqi6QFqZTHQbTGalgqnqZystrKmqKul3oqkjxIto/3uXRdXypTHL+13giJyNo
         tc0Act0AbV8RVXBcCLxJ3YPlDDKOOr7hiFuH6ch3Go0x70xpy9sQc7eh9/t5WbNuqPWD
         fXi/RbG5e0GVjda/EQQEeHOIod6FJItI5qt8iHdbqxdnyzrTkVwz5rBMmMhdOdG8W+sk
         U6l+8ibMaV2vb8iZGZtVJ71jeHtPuwsq1IwMEPKXmFxGDBNUO1Ntz/xxSN8xN80XlQmB
         PztfAkLhIwvQZiBeiJ2ZokKOWX474xKHdHizUtq1V5qGvMtFGbke4eTsRTjsijKHDVP+
         RsGg==
X-Gm-Message-State: AFqh2kr3OA+Z5FTP0pzZ+2LGZXFPxQEg4JvHAyKBwGjChDghi/KhjrZP
	R1G9YS3AMle4Xo3t6sjvOT20HtYKbwbzYtWl
X-Google-Smtp-Source: AMrXdXu37y3SKcbfnmAn8lJpq8VIMHx+WoFGw0L0S+2M5PyWqP51WtXHc8V/W/pTvsUF0yitXygIrw==
X-Received: by 2002:a05:600c:1d91:b0:3d1:caf1:3f58 with SMTP id p17-20020a05600c1d9100b003d1caf13f58mr73288wms.32.1671493135348;
        Mon, 19 Dec 2022 15:38:55 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c2cd400b003c70191f267sm20902178wmc.39.2022.12.19.15.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 15:38:55 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 19 Dec 2022 23:38:54 +0000 (UTC)
To: Roman Lebedev <lebedev.ri@gmail.com>
Cc: llvm@lists.linux.dev
Message-ID: <1017122029.3605.1671493134993@jenkins.jenkins>
Subject: [TCWG CI] Failure after llvmorg-16-init-14942-g6adeec881a83:
 [InstCombine] `sinkNotIntoOtherHandOfLogicalOp()`: allow extra invertible
 uses of hand-to-invert
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3604_1143884190.1671493134495"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-mainline-defconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_3604_1143884190.1671493134495
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after llvmorg-16-init-14942-g6adeec881a83: [InstCombine] `sinkNotIntoOtherHandOfLogicalOp()`: allow extra invertible uses of hand-to-invert:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
7391
# First few build errors in logs:
# 00:13:26 fatal error: error in backend: Broken function found, compilation aborted!
# 00:13:29 fatal error: error in backend: Broken function found, compilation aborted!
# 00:13:30 clang-16: error: clang frontend command failed with exit code 70 (use -v to see invocation)
# 00:13:30 clang-16: error: clang frontend command failed with exit code 70 (use -v to see invocation)
# 00:13:30 make[3]: *** [scripts/Makefile.build:250: fs/nfs_common/grace.o] Error 1
# 00:13:30 make[3]: *** [scripts/Makefile.build:250: kernel/sched/core.o] Error 1
# 00:13:33 make[2]: *** [scripts/Makefile.build:502: fs/nfs_common] Error 2
# 00:13:37 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:13:37 make[3]: *** [scripts/Makefile.build:250: kernel/sched/build_policy.o] Error 1
# 00:13:37 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
8686
# linux build successful:
all
# linux boot successful:
boot

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-646 .
Status of llvmorg-16-init-14942-g6adeec881a83 commit for tcwg_kernel:
commit 6adeec881a830c91d42077b9f4665531003143b1
Author: Roman Lebedev <lebedev.ri@gmail.com>
Date:   Mon Dec 19 04:21:51 2022 +0300

    [InstCombine] `sinkNotIntoOtherHandOfLogicalOp()`: allow extra invertible uses of hand-to-invert
* llvm-master-aarch64-mainline-defconfig
** Failure after llvmorg-16-init-14942-g6adeec881a83: [InstCombine] `sinkNotIntoOtherHandOfLogicalOp()`: allow extra invertible uses of hand-to-invert:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-defconfig/500/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-defconfig/500/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-defconfig/499/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-llvm-6adeec881a830c91d42077b9f4665531003143b1
cd investigate-llvm-6adeec881a830c91d42077b9f4665531003143b1

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-defconfig/500/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-mainline-defconfig/499/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 6adeec881a830c91d42077b9f4665531003143b1
Author: Roman Lebedev <lebedev.ri@gmail.com>
Date:   Mon Dec 19 04:21:51 2022 +0300

    [InstCombine] `sinkNotIntoOtherHandOfLogicalOp()`: allow extra invertible uses of hand-to-invert
---
 .../Transforms/InstCombine/InstCombineAndOrXor.cpp | 16 +++++++++++++---
 .../sink-not-into-another-hand-of-and.ll           | 20 +++++++++-----------
 .../sink-not-into-another-hand-of-logical-and.ll   | 22 ++++++++++------------
 .../sink-not-into-another-hand-of-logical-or.ll    | 22 ++++++++++------------
 .../sink-not-into-another-hand-of-or.ll            | 20 +++++++++-----------
 5 files changed, 51 insertions(+), 49 deletions(-)

diff --git a/llvm/lib/Transforms/InstCombine/InstCombineAndOrXor.cpp b/llvm/lib/Transforms/InstCombine/InstCombineAndOrXor.cpp
index f7fda4b9aa41..5bbeb42b4465 100644
--- a/llvm/lib/Transforms/InstCombine/InstCombineAndOrXor.cpp
+++ b/llvm/lib/Transforms/InstCombine/InstCombineAndOrXor.cpp
@@ -3675,11 +3675,13 @@ bool InstCombinerImpl::sinkNotIntoOtherHandOfLogicalOp(Instruction &I) {
   Value *NotOp1 = nullptr;
   Value **OpToInvert = nullptr;
   if (match(Op0, m_Not(m_Value(NotOp0))) &&
-      InstCombiner::isFreeToInvert(Op1, Op1->hasOneUse())) {
+      InstCombiner::isFreeToInvert(Op1, /*WillInvertAllUses=*/true) &&
+      InstCombiner::canFreelyInvertAllUsersOf(Op1, /*IgnoredUser=*/&I)) {
     Op0 = NotOp0;
     OpToInvert = &Op1;
   } else if (match(Op1, m_Not(m_Value(NotOp1))) &&
-             InstCombiner::isFreeToInvert(Op0, Op0->hasOneUse())) {
+             InstCombiner::isFreeToInvert(Op0, /*WillInvertAllUses=*/true) &&
+             InstCombiner::canFreelyInvertAllUsersOf(Op0, /*IgnoredUser=*/&I)) {
     Op1 = NotOp1;
     OpToInvert = &Op0;
   } else
@@ -3689,8 +3691,16 @@ bool InstCombinerImpl::sinkNotIntoOtherHandOfLogicalOp(Instruction &I) {
   if (!InstCombiner::canFreelyInvertAllUsersOf(&I, /*IgnoredUser=*/nullptr))
     return false;
 
-  *OpToInvert =
+  Builder.SetInsertPoint(
+      &*cast<Instruction>(*OpToInvert)->getInsertionPointAfterDef());
+  Value *NotOpToInvert =
       Builder.CreateNot(*OpToInvert, (*OpToInvert)->getName() + ".not");
+  (*OpToInvert)->replaceUsesWithIf(NotOpToInvert, [NotOpToInvert](Use &U) {
+    return U.getUser() != NotOpToInvert;
+  });
+  freelyInvertAllUsersOf(NotOpToInvert, /*IgnoredUser=*/&I);
+  *OpToInvert = NotOpToInvert;
+
   Value *NewBinOp;
   if (IsBinaryOp)
     NewBinOp = Builder.CreateBinOp(NewOpc, Op0, Op1, I.getName() + ".not");
diff --git a/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-and.ll b/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-and.ll
index 090e832d8f43..71537cdd2a72 100644
--- a/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-and.ll
+++ b/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-and.ll
@@ -28,8 +28,8 @@ define i8 @t1(i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t1(
 ; CHECK-NEXT:    [[I0:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
 ; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V2:%.*]], [[V3:%.*]]
-; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I3_NOT:%.*]] = or i1 [[I1]], [[I0]]
+; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I3_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I4]]
 ;
@@ -77,12 +77,11 @@ define i8 @n3(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3) {
 ; Extra uses are invertible
 define i8 @t4(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t4(
-; CHECK-NEXT:    [[I1:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
-; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V2:%.*]], i8 [[V3:%.*]]
+; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V0:%.*]], [[V1:%.*]]
+; CHECK-NEXT:    [[I4_NOT:%.*]] = or i1 [[I1]], [[I0:%.*]]
+; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V3:%.*]], i8 [[V2:%.*]]
 ; CHECK-NEXT:    call void @use8(i8 [[I2]])
-; CHECK-NEXT:    [[I3:%.*]] = xor i1 [[I0:%.*]], true
-; CHECK-NEXT:    [[I4:%.*]] = and i1 [[I1]], [[I3]]
-; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4]], i8 [[V4:%.*]], i8 [[V5:%.*]]
+; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I5]]
 ;
   %i1 = icmp eq i8 %v0, %v1 ; has extra invertible use
@@ -95,12 +94,11 @@ define i8 @t4(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 }
 define i8 @t4_commutative(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t4_commutative(
-; CHECK-NEXT:    [[I1:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
-; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V2:%.*]], i8 [[V3:%.*]]
+; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V0:%.*]], [[V1:%.*]]
+; CHECK-NEXT:    [[I4_NOT:%.*]] = or i1 [[I1]], [[I0:%.*]]
+; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V3:%.*]], i8 [[V2:%.*]]
 ; CHECK-NEXT:    call void @use8(i8 [[I2]])
-; CHECK-NEXT:    [[I3:%.*]] = xor i1 [[I0:%.*]], true
-; CHECK-NEXT:    [[I4:%.*]] = and i1 [[I1]], [[I3]]
-; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4]], i8 [[V4:%.*]], i8 [[V5:%.*]]
+; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I5]]
 ;
   %i1 = icmp eq i8 %v0, %v1 ; has extra invertible use
diff --git a/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-logical-and.ll b/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-logical-and.ll
index 9fea168e3b8a..0866fc2c81f9 100644
--- a/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-logical-and.ll
+++ b/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-logical-and.ll
@@ -41,8 +41,8 @@ define i8 @t1(i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t1(
 ; CHECK-NEXT:    [[I0:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
 ; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V2:%.*]], [[V3:%.*]]
-; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I3_NOT:%.*]] = select i1 [[I0]], i1 true, i1 [[I1]]
+; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I3_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I4]]
 ;
@@ -58,8 +58,8 @@ define i8 @t1_commutative(i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t1_commutative(
 ; CHECK-NEXT:    [[I0:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
 ; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V2:%.*]], [[V3:%.*]]
-; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I3_NOT:%.*]] = select i1 [[I1]], i1 true, i1 [[I0]]
+; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I3_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I4]]
 ;
@@ -107,12 +107,11 @@ define i8 @n3(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3) {
 ; Extra uses are invertible
 define i8 @t4(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t4(
-; CHECK-NEXT:    [[I1:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
-; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V2:%.*]], i8 [[V3:%.*]]
+; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V0:%.*]], [[V1:%.*]]
+; CHECK-NEXT:    [[I4_NOT:%.*]] = select i1 [[I0:%.*]], i1 true, i1 [[I1]]
+; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V3:%.*]], i8 [[V2:%.*]]
 ; CHECK-NEXT:    call void @use8(i8 [[I2]])
-; CHECK-NEXT:    [[I3:%.*]] = xor i1 [[I0:%.*]], true
-; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I3]], i1 [[I1]], i1 false
-; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4]], i8 [[V4:%.*]], i8 [[V5:%.*]]
+; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I5]]
 ;
   %i1 = icmp eq i8 %v0, %v1 ; has extra invertible use
@@ -125,12 +124,11 @@ define i8 @t4(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 }
 define i8 @t4_commutative(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t4_commutative(
-; CHECK-NEXT:    [[I1:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
-; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V2:%.*]], i8 [[V3:%.*]]
+; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V0:%.*]], [[V1:%.*]]
+; CHECK-NEXT:    [[I4_NOT:%.*]] = select i1 [[I1]], i1 true, i1 [[I0:%.*]]
+; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V3:%.*]], i8 [[V2:%.*]]
 ; CHECK-NEXT:    call void @use8(i8 [[I2]])
-; CHECK-NEXT:    [[I3:%.*]] = xor i1 [[I0:%.*]], true
-; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I1]], i1 [[I3]], i1 false
-; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4]], i8 [[V4:%.*]], i8 [[V5:%.*]]
+; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I5]]
 ;
   %i1 = icmp eq i8 %v0, %v1 ; has extra invertible use
diff --git a/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-logical-or.ll b/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-logical-or.ll
index d49b13aad7d7..b6c9d24a1695 100644
--- a/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-logical-or.ll
+++ b/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-logical-or.ll
@@ -41,8 +41,8 @@ define i8 @t1(i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t1(
 ; CHECK-NEXT:    [[I0:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
 ; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V2:%.*]], [[V3:%.*]]
-; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I3_NOT:%.*]] = select i1 [[I0]], i1 [[I1]], i1 false
+; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I3_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I4]]
 ;
@@ -58,8 +58,8 @@ define i8 @t1_commutative(i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t1_commutative(
 ; CHECK-NEXT:    [[I0:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
 ; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V2:%.*]], [[V3:%.*]]
-; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I3_NOT:%.*]] = select i1 [[I1]], i1 [[I0]], i1 false
+; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I3_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I4]]
 ;
@@ -107,12 +107,11 @@ define i8 @n3(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3) {
 ; Extra uses are invertible
 define i8 @t4(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t4(
-; CHECK-NEXT:    [[I1:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
-; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V2:%.*]], i8 [[V3:%.*]]
+; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V0:%.*]], [[V1:%.*]]
+; CHECK-NEXT:    [[I4_NOT:%.*]] = select i1 [[I0:%.*]], i1 [[I1]], i1 false
+; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V3:%.*]], i8 [[V2:%.*]]
 ; CHECK-NEXT:    call void @use8(i8 [[I2]])
-; CHECK-NEXT:    [[I3:%.*]] = xor i1 [[I0:%.*]], true
-; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I3]], i1 true, i1 [[I1]]
-; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4]], i8 [[V4:%.*]], i8 [[V5:%.*]]
+; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I5]]
 ;
   %i1 = icmp eq i8 %v0, %v1 ; has extra invertible use
@@ -125,12 +124,11 @@ define i8 @t4(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 }
 define i8 @t4_commutative(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t4_commutative(
-; CHECK-NEXT:    [[I1:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
-; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V2:%.*]], i8 [[V3:%.*]]
+; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V0:%.*]], [[V1:%.*]]
+; CHECK-NEXT:    [[I4_NOT:%.*]] = select i1 [[I1]], i1 [[I0:%.*]], i1 false
+; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V3:%.*]], i8 [[V2:%.*]]
 ; CHECK-NEXT:    call void @use8(i8 [[I2]])
-; CHECK-NEXT:    [[I3:%.*]] = xor i1 [[I0:%.*]], true
-; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I1]], i1 true, i1 [[I3]]
-; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4]], i8 [[V4:%.*]], i8 [[V5:%.*]]
+; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I5]]
 ;
   %i1 = icmp eq i8 %v0, %v1 ; has extra invertible use
diff --git a/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-or.ll b/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-or.ll
index ce7f4b545a20..6777720605f5 100644
--- a/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-or.ll
+++ b/llvm/test/Transforms/InstCombine/sink-not-into-another-hand-of-or.ll
@@ -28,8 +28,8 @@ define i8 @t1(i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t1(
 ; CHECK-NEXT:    [[I0:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
 ; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V2:%.*]], [[V3:%.*]]
-; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I3_NOT:%.*]] = and i1 [[I1]], [[I0]]
+; CHECK-NEXT:    call void @use1(i1 [[I0]])
 ; CHECK-NEXT:    [[I4:%.*]] = select i1 [[I3_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I4]]
 ;
@@ -77,12 +77,11 @@ define i8 @n3(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3) {
 ; Extra uses are invertible
 define i8 @t4(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t4(
-; CHECK-NEXT:    [[I1:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
-; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V2:%.*]], i8 [[V3:%.*]]
+; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V0:%.*]], [[V1:%.*]]
+; CHECK-NEXT:    [[I4_NOT:%.*]] = and i1 [[I1]], [[I0:%.*]]
+; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V3:%.*]], i8 [[V2:%.*]]
 ; CHECK-NEXT:    call void @use8(i8 [[I2]])
-; CHECK-NEXT:    [[I3:%.*]] = xor i1 [[I0:%.*]], true
-; CHECK-NEXT:    [[I4:%.*]] = or i1 [[I1]], [[I3]]
-; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4]], i8 [[V4:%.*]], i8 [[V5:%.*]]
+; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I5]]
 ;
   %i1 = icmp eq i8 %v0, %v1 ; has extra invertible use
@@ -95,12 +94,11 @@ define i8 @t4(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 }
 define i8 @t4_commutative(i1 %i0, i8 %v0, i8 %v1, i8 %v2, i8 %v3, i8 %v4, i8 %v5) {
 ; CHECK-LABEL: @t4_commutative(
-; CHECK-NEXT:    [[I1:%.*]] = icmp eq i8 [[V0:%.*]], [[V1:%.*]]
-; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V2:%.*]], i8 [[V3:%.*]]
+; CHECK-NEXT:    [[I1:%.*]] = icmp ne i8 [[V0:%.*]], [[V1:%.*]]
+; CHECK-NEXT:    [[I4_NOT:%.*]] = and i1 [[I1]], [[I0:%.*]]
+; CHECK-NEXT:    [[I2:%.*]] = select i1 [[I1]], i8 [[V3:%.*]], i8 [[V2:%.*]]
 ; CHECK-NEXT:    call void @use8(i8 [[I2]])
-; CHECK-NEXT:    [[I3:%.*]] = xor i1 [[I0:%.*]], true
-; CHECK-NEXT:    [[I4:%.*]] = or i1 [[I1]], [[I3]]
-; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4]], i8 [[V4:%.*]], i8 [[V5:%.*]]
+; CHECK-NEXT:    [[I5:%.*]] = select i1 [[I4_NOT]], i8 [[V5:%.*]], i8 [[V4:%.*]]
 ; CHECK-NEXT:    ret i8 [[I5]]
 ;
   %i1 = icmp eq i8 %v0, %v1 ; has extra invertible use
</cut>
------=_Part_3604_1143884190.1671493134495--
