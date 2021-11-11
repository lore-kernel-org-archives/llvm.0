Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDB268
	for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 11:24:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d24so9293503wra.0
        for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 03:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version;
        bh=6HshHP6jva3EZM6Uq+7fWdRUYe/GUK6CzjWC7j5icQo=;
        b=Bif29042LSz1oVyiXzG9RzfJTXclbbjBEuJ6kgOXuj1ViembzI78j5bLkbYncTffBr
         iTm1f0K0OyTi3zhKNEXiYHgAjNl+bjN/JITklY+48hfDF0Gx6wuyoswiF3ISQpeSvDoL
         vXFjwtflNlZ0MoJFSHq76czedo6JSGCcJWqEgz2aJJyQAk93xGepQxZaGYlJyM/JWJiO
         Hpk+RXwGoDw0P4y7NiJfz1OTPXX823tyT8/NO83nR/rPYg6AIz7GxfPsK7qI4LxzQ2+y
         uzdbuPbdvN5bvkAOJswAdRTpnmw2pSc1GnekV/MSIx5WEgtB/7LieKiqm9iJBbsb1j4e
         uHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version;
        bh=6HshHP6jva3EZM6Uq+7fWdRUYe/GUK6CzjWC7j5icQo=;
        b=FhKQKfzZ1BWHH3axS7bffpR93wqd9z229aNS2OsfHUTcFS+27jjLB3F83VgxhOPtTV
         QeSUEHhRV7Tvw6OLrIHsOER6lKoCHlLuqof8IRRLQKMndQTWIcx904Ij/N5PtxvTRNU1
         4n1Nnc1Sy/ryeM6+mE5g3PbZ26seHSxoN/dcrz78frAqJVD5BVri1ki1rlMf2u0yOo9C
         qSdb5bC2uDWFpyW1mjzsr0jScqKLX1rEPyhNL8JokvYgn8wEb10F+hgX66PfM+04XzQg
         86Aam4MJcoTEYRYxAB89VfX1PlfdeRijKc0v+rsWH4etBtjPVYCni3QHk2xD7GDGCaxL
         dRBw==
X-Gm-Message-State: AOAM531AGV6EmR1cJYULL7qWdR1JITl3Q62Q62QLsvOWiA2DKhdvECed
	U3FpJkvkMcxP8cPMCVHvLWcx4g==
X-Google-Smtp-Source: ABdhPJzcl6CpkOUTgOSEhnMAshMOdnBRmPEWnOax4D299qYCbO8EIoasi4vQMjYwyKKPhbwD9k2T2g==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr8073924wrc.417.1636629847476;
        Thu, 11 Nov 2021 03:24:07 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id o63sm2733342wme.2.2021.11.11.03.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 03:24:06 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 11 Nov 2021 11:24:06 +0000 (UTC)
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev
Message-ID: <814585495.6773.1636629846970@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [ARM] reject -mtp=cp15 if
 target subarch does not support it
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6772_1113752958.1636629846137"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-next-defconfig
X-Jenkins-Result: SUCCESS

------=_Part_6772_1113752958.1636629846137
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [ARM] reject -mtp=cp15 if target subarch does not support it:
commit 24772720c54500714e2d48b9109bb62d5867ad95
Author: Ard Biesheuvel <ardb@kernel.org>

    [ARM] reject -mtp=cp15 if target subarch does not support it

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
6359
# First few build errors in logs:
# 00:01:18 clang-14: error: hardware TLS register is not supported for the arm sub-architecture
# 00:01:18 make[2]: *** [scripts/Makefile.build:410: arch/arm/kernel/iwmmxt.o] Error 1
# 00:01:21 make[1]: *** [scripts/Makefile.build:571: arch/arm/kernel] Error 2
# 00:01:24 make: *** [Makefile:1996: arch/arm] Error 2

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
7115
# linux build successful:
all
# linux boot successful:
boot

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-next-defconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/4/artifact/artifacts/build-24772720c54500714e2d48b9109bb62d5867ad95/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/4/artifact/artifacts/build-22a1aa5a43cbdaf9dde014ba1f120e0f7ca1788b/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/4/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/4/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-24772720c54500714e2d48b9109bb62d5867ad95
cd investigate-llvm-24772720c54500714e2d48b9109bb62d5867ad95

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/4/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/4/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-defconfig/4/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 24772720c54500714e2d48b9109bb62d5867ad95
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 22a1aa5a43cbdaf9dde014ba1f120e0f7ca1788b
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 24772720c54500714e2d48b9109bb62d5867ad95
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Tue Nov 9 18:26:29 2021 +0100

    [ARM] reject -mtp=cp15 if target subarch does not support it
    
    Currently, we permit -mtp=cp15 even for targets that don't implement the
    TLS register. When building for ARMv6 or earlier, this means we emit
    instructions that will UNDEF at runtime. For Thumb1, passing -mtp=cp15
    will trigger an assert in the backend.
    
    So let's add some diagnostics to ensure that -mtp=cp15 is only accepted
    for ARMv6T2 or newer.
    
    Reviewed By: nickdesaulniers
    
    Differential Revision: https://reviews.llvm.org/D113026
---
 clang/lib/Driver/ToolChains/Arch/ARM.cpp | 12 ++++++++++--
 clang/lib/Driver/ToolChains/Arch/ARM.h   |  3 ++-
 clang/test/Driver/clang-translation.c    | 18 +++++++++++++++---
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/clang/lib/Driver/ToolChains/Arch/ARM.cpp b/clang/lib/Driver/ToolChains/Arch/ARM.cpp
index 05d83c91ba0e..21c091e1a0ba 100644
--- a/clang/lib/Driver/ToolChains/Arch/ARM.cpp
+++ b/clang/lib/Driver/ToolChains/Arch/ARM.cpp
@@ -148,13 +148,21 @@ bool arm::useAAPCSForMachO(const llvm::Triple &T) {
 }
 
 // Select mode for reading thread pointer (-mtp=soft/cp15).
-arm::ReadTPMode arm::getReadTPMode(const Driver &D, const ArgList &Args) {
+arm::ReadTPMode arm::getReadTPMode(const Driver &D, const ArgList &Args,
+                                   const llvm::Triple &Triple) {
   if (Arg *A = Args.getLastArg(options::OPT_mtp_mode_EQ)) {
     arm::ReadTPMode ThreadPointer =
         llvm::StringSwitch<arm::ReadTPMode>(A->getValue())
             .Case("cp15", ReadTPMode::Cp15)
             .Case("soft", ReadTPMode::Soft)
             .Default(ReadTPMode::Invalid);
+    if (ThreadPointer == ReadTPMode::Cp15 &&
+        getARMSubArchVersionNumber(Triple) < 7 &&
+        llvm::ARM::parseArch(Triple.getArchName()) !=
+            llvm::ARM::ArchKind::ARMV6T2) {
+      D.Diag(diag::err_target_unsupported_tp_hard) << Triple.getArchName();
+      return ReadTPMode::Invalid;
+    }
     if (ThreadPointer != ReadTPMode::Invalid)
       return ThreadPointer;
     if (StringRef(A->getValue()).empty())
@@ -422,7 +430,7 @@ void arm::getARMTargetFeatures(const Driver &D, const llvm::Triple &Triple,
   bool KernelOrKext =
       Args.hasArg(options::OPT_mkernel, options::OPT_fapple_kext);
   arm::FloatABI ABI = arm::getARMFloatABI(D, Triple, Args);
-  arm::ReadTPMode ThreadPointer = arm::getReadTPMode(D, Args);
+  arm::ReadTPMode ThreadPointer = arm::getReadTPMode(D, Args, Triple);
   llvm::Optional<std::pair<const Arg *, StringRef>> WaCPU, WaFPU, WaHDiv,
       WaArch;
 
diff --git a/clang/lib/Driver/ToolChains/Arch/ARM.h b/clang/lib/Driver/ToolChains/Arch/ARM.h
index 0ab0d6c281f8..b6fd68fbb9c6 100644
--- a/clang/lib/Driver/ToolChains/Arch/ARM.h
+++ b/clang/lib/Driver/ToolChains/Arch/ARM.h
@@ -53,7 +53,8 @@ FloatABI getARMFloatABI(const Driver &D, const llvm::Triple &Triple,
                         const llvm::opt::ArgList &Args);
 void setFloatABIInTriple(const Driver &D, const llvm::opt::ArgList &Args,
                          llvm::Triple &triple);
-ReadTPMode getReadTPMode(const Driver &D, const llvm::opt::ArgList &Args);
+ReadTPMode getReadTPMode(const Driver &D, const llvm::opt::ArgList &Args,
+                         const llvm::Triple &Triple);
 void setArchNameInTriple(const Driver &D, const llvm::opt::ArgList &Args,
                          types::ID InputType, llvm::Triple &Triple);
 
diff --git a/clang/test/Driver/clang-translation.c b/clang/test/Driver/clang-translation.c
index 9802ee3da239..230ea8e30202 100644
--- a/clang/test/Driver/clang-translation.c
+++ b/clang/test/Driver/clang-translation.c
@@ -110,15 +110,27 @@
 // ARMV5E: "-cc1"
 // ARMV5E: "-target-cpu" "arm1022e"
 
-// RUN: %clang -target arm-linux -mtp=cp15 -### -S %s -arch armv7 2>&1 | \
+// RUN: %clang -target armv7-linux -mtp=cp15 -### -S %s 2>&1 | \
 // RUN: FileCheck -check-prefix=ARMv7_THREAD_POINTER-HARD %s
 // ARMv7_THREAD_POINTER-HARD: "-target-feature" "+read-tp-hard"
 
-// RUN: %clang -target arm-linux -mtp=soft -### -S %s -arch armv7 2>&1 | \
+// RUN: %clang -target armv6t2-linux -mtp=cp15 -### -S %s 2>&1 | \
+// RUN: FileCheck -check-prefix=ARMv6T2_THREAD_POINTER-HARD %s
+// ARMv6T2_THREAD_POINTER-HARD: "-target-feature" "+read-tp-hard"
+
+// RUN: %clang -target armv5t-linux -mtp=cp15 -### -S %s 2>&1 | \
+// RUN: FileCheck -check-prefix=ARMv5_THREAD_POINTER_UNSUPP %s
+// ARMv5_THREAD_POINTER_UNSUPP: hardware TLS register is not supported for the armv5 sub-architecture
+
+// RUN: %clang -target thumbv6-linux -mtp=cp15 -### -S %s 2>&1 | \
+// RUN: FileCheck -check-prefix=ARMv6_THREAD_POINTER_UNSUPP %s
+// ARMv6_THREAD_POINTER_UNSUPP: hardware TLS register is not supported for the armv6 sub-architecture
+
+// RUN: %clang -target armv7-linux -mtp=soft -### -S %s 2>&1 | \
 // RUN: FileCheck -check-prefix=ARMv7_THREAD_POINTER_SOFT %s
 // ARMv7_THREAD_POINTER_SOFT-NOT: "-target-feature" "+read-tp-hard"
 
-// RUN: %clang -target arm-linux -### -S %s -arch armv7 2>&1 | \
+// RUN: %clang -target armv7-linux -### -S %s 2>&1 | \
 // RUN: FileCheck -check-prefix=ARMv7_THREAD_POINTER_NON %s
 // ARMv7_THREAD_POINTER_NON-NOT: "-target-feature" "+read-tp-hard"
 
</cut>
------=_Part_6772_1113752958.1636629846137--
