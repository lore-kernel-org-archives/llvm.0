Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7466C2109
	for <llvm@lists.linux.dev>; Sat, 24 Dec 2022 23:36:02 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id bs20so5408839wrb.3
        for <llvm@lists.linux.dev>; Sat, 24 Dec 2022 15:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfRBzlpDLgU+TkSrAP8sWSKGXS88ILlLVcvLtHxZzP8=;
        b=kz55I8loxye7dz+mFX58Yq9kkMk0m6Kv+hW++rFLInagR+GNFmDAYUYu9gkQGPwYC6
         wswMQ3JQvw3hO1PdZWYUuCAqEmDRavn8VgdQyBHWr+DFNenxEZ+IQ8c1jV0Tqn7X4C9E
         x0DRdAvIJyLI2zXfhHHMuwR9yM9vRB9IebFDo/E6tovSs6D61ap/5SusYKP7bFLlQWz/
         ZIcURTrIrKJKXQskUWXHlcAt2uQvmg+HK73P7uNuDn0Ad60/yXCpYSOn0ND1fV0sCuQm
         zdOMxiWan8tDF+6gsZl8sejBY2VGKmpPBKBGLMvyojoCZ0XXU3ZhEC/ngGUt3O40g93D
         BGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfRBzlpDLgU+TkSrAP8sWSKGXS88ILlLVcvLtHxZzP8=;
        b=eYfL0Ba5JZyPTRGsWXw2czWhliEw4jXhDa7cNXe4AJ5XQQdGS8Ys+BfTHmFHJ4nGG3
         Ybd1+6Vn9384s15SARsZdirDDGSQiZH1HjwQESIh4VPpjoitfahOv/rzNSzV0vYsKZlD
         60po9R3TOpJCzOaNHxPSbThUYxLpAU9qaqRBHcbPybsQobYvv/cjvMykdiZl89rQiehm
         0+mriLhdllF0U8EpV+m/cRHz5vFjvAI8lIlr3e8eDACdXAgU+8h5PRtUsGvptOUSwlMf
         C4h8RG4vUtRmu/BUHOIVP47127QzVr/W23XIsaNIoDGM6XwY863sPCtpBPGGHZoUjus2
         8kww==
X-Gm-Message-State: AFqh2kqDxNWbc1EEgDehfVYNB69e1XzJArzQy0Ow7eOc3vOMGOnPnGIg
	/wJu7oS2ZWM59M4mVlQHQmQWlw==
X-Google-Smtp-Source: AMrXdXtNiRWAuIeu5Udyvq4+Hx/PVw3p3Sv4rfMoHD2T+Jkol6K03WIK0R4fKHvL9lmH/TlKgNS5NQ==
X-Received: by 2002:adf:de8a:0:b0:266:3709:5ce3 with SMTP id w10-20020adfde8a000000b0026637095ce3mr8560244wrl.0.1671924960733;
        Sat, 24 Dec 2022 15:36:00 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id r14-20020a5d4e4e000000b002549b649b62sm6403421wrt.50.2022.12.24.15.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 15:36:00 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 24 Dec 2022 23:35:59 +0000 (UTC)
To: Roman Lebedev <lebedev.ri@gmail.com>
Cc: llvm@lists.linux.dev
Message-ID: <2060291605.5976.1671924960373@jenkins.jenkins>
Subject: [TCWG CI] Failure after working-8684-g114cc45a095e:
 [NFC][DAGCombiner] `visitFREEZE()`: use early return
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5975_1492713981.1671924959864"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-defconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_5975_1492713981.1671924959864
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after working-8684-g114cc45a095e: [NFC][DAGCombiner] `visitFREEZE()`: use early return:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
7630
# First few build errors in logs:
# 00:20:25 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
# 00:20:25 make[6]: *** [scripts/Makefile.build:252: drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.o] Error 1
# 00:20:26 make[5]: *** [scripts/Makefile.build:504: drivers/gpu/drm/hisilicon/kirin] Error 2
# 00:20:26 make[4]: *** [scripts/Makefile.build:504: drivers/gpu/drm/hisilicon] Error 2
# 00:30:56 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/drm] Error 2
# 00:30:56 make[2]: *** [scripts/Makefile.build:504: drivers/gpu] Error 2
# 00:30:56 make[1]: *** [scripts/Makefile.build:504: drivers] Error 2
# 00:30:56 make: *** [Makefile:2008: .] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
8688
# linux build successful:
all
# linux boot successful:
boot

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-646 .
Status of working-8684-g114cc45a095e commit for tcwg_kernel:
commit 114cc45a095eaeed1efe62a47cd298bd7cad85de
Author: Roman Lebedev <lebedev.ri@gmail.com>
Date:   Fri Dec 23 00:40:43 2022 +0300

    [NFC][DAGCombiner] `visitFREEZE()`: use early return
* llvm-master-aarch64-next-defconfig
** Failure after working-8684-g114cc45a095e: [NFC][DAGCombiner] `visitFREEZE()`: use early return:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-defconfig/506/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-defconfig/506/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-defconfig/505/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-llvm-114cc45a095eaeed1efe62a47cd298bd7cad85de
cd investigate-llvm-114cc45a095eaeed1efe62a47cd298bd7cad85de

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-defconfig/506/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-defconfig/505/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 114cc45a095eaeed1efe62a47cd298bd7cad85de
Author: Roman Lebedev <lebedev.ri@gmail.com>
Date:   Fri Dec 23 00:40:43 2022 +0300

    [NFC][DAGCombiner] `visitFREEZE()`: use early return
---
 llvm/lib/CodeGen/SelectionDAG/DAGCombiner.cpp | 70 +++++++++++++--------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/llvm/lib/CodeGen/SelectionDAG/DAGCombiner.cpp b/llvm/lib/CodeGen/SelectionDAG/DAGCombiner.cpp
index 5c074c84f195..71341f058b10 100644
--- a/llvm/lib/CodeGen/SelectionDAG/DAGCombiner.cpp
+++ b/llvm/lib/CodeGen/SelectionDAG/DAGCombiner.cpp
@@ -14252,44 +14252,40 @@ SDValue DAGCombiner::visitFREEZE(SDNode *N) {
   // conditions 1) one-use, 2) does not produce poison, and 3) has all but one
   // guaranteed-non-poison operands then push the freeze through to the one
   // operand that is not guaranteed non-poison.
-  if (!DAG.canCreateUndefOrPoison(N0, /*PoisonOnly*/ false,
-                                  /*ConsiderFlags*/ false) &&
-      N0->getNumValues() == 1 && N0->hasOneUse()) {
-    SDValue MaybePoisonOperand;
-    SmallVector<SDValue> Ops(N0->op_begin(), N0->op_end());
-    for (SDValue Op : Ops) {
-      if (DAG.isGuaranteedNotToBeUndefOrPoison(Op, /*PoisonOnly*/ false,
-                                               /*Depth*/ 1))
-        continue;
-      if (!MaybePoisonOperand || MaybePoisonOperand == Op) {
-        MaybePoisonOperand = Op;
-        continue;
-      }
-      // Multiple maybe-poison ops - bail out.
-      MaybePoisonOperand = SDValue();
-      break;
-    }
-    if (MaybePoisonOperand) {
-      // First, freeze the offending operand.
-      SDValue FrozenMaybePoisonOperand = DAG.getFreeze(MaybePoisonOperand);
-      // Then, change all other uses of unfrozen operand to use frozen operand.
-      DAG.ReplaceAllUsesOfValueWith(MaybePoisonOperand,
-                                    FrozenMaybePoisonOperand);
-      // But, that also updated the use in the freeze we just created, thus
-      // creating a cycle in a DAG. Let's undo that by mutating the freeze.
-      DAG.UpdateNodeOperands(FrozenMaybePoisonOperand.getNode(),
-                             MaybePoisonOperand);
-      // Finally, recreate the node with the frozen maybe-poison operand.
-      SmallVector<SDValue> Ops(N0->op_begin(), N0->op_end());
-      // TODO: Just strip poison generating flags?
-      SDValue R = DAG.getNode(N0.getOpcode(), SDLoc(N0), N0->getVTList(), Ops);
-      assert(DAG.isGuaranteedNotToBeUndefOrPoison(R, /*PoisonOnly*/ false) &&
-             "Can't create node that may be undef/poison!");
-      return R;
-    }
-  }
+  if (DAG.canCreateUndefOrPoison(N0, /*PoisonOnly*/ false,
+                                 /*ConsiderFlags*/ false) ||
+      N0->getNumValues() != 1 || !N0->hasOneUse())
+    return SDValue();
 
-  return SDValue();
+  SDValue MaybePoisonOperand;
+  for (SDValue Op : N0->ops()) {
+    if (DAG.isGuaranteedNotToBeUndefOrPoison(Op, /*PoisonOnly*/ false,
+                                             /*Depth*/ 1))
+      continue;
+    if (!MaybePoisonOperand || MaybePoisonOperand == Op) {
+      MaybePoisonOperand = Op;
+      continue;
+    }
+    // Multiple maybe-poison ops - bail out.
+    return SDValue();
+  }
+  assert(MaybePoisonOperand && "Should have found maybe-poison operand.");
+
+  // First, freeze the offending operand.
+  SDValue FrozenMaybePoisonOperand = DAG.getFreeze(MaybePoisonOperand);
+  // Then, change all other uses of unfrozen operand to use frozen operand.
+  DAG.ReplaceAllUsesOfValueWith(MaybePoisonOperand, FrozenMaybePoisonOperand);
+  // But, that also updated the use in the freeze we just created, thus
+  // creating a cycle in a DAG. Let's undo that by mutating the freeze.
+  DAG.UpdateNodeOperands(FrozenMaybePoisonOperand.getNode(),
+                         MaybePoisonOperand);
+  // Finally, recreate the node with the frozen maybe-poison operand.
+  SmallVector<SDValue> Ops(N0->op_begin(), N0->op_end());
+  // TODO: Just strip poison generating flags?
+  SDValue R = DAG.getNode(N0.getOpcode(), SDLoc(N0), N0->getVTList(), Ops);
+  assert(DAG.isGuaranteedNotToBeUndefOrPoison(R, /*PoisonOnly*/ false) &&
+         "Can't create node that may be undef/poison!");
+  return R;
 }
 
 /// We know that BV is a build_vector node with Constant, ConstantFP or Undef
</cut>
------=_Part_5975_1492713981.1671924959864--
