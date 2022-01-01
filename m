Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE4173
	for <llvm@lists.linux.dev>; Sat,  1 Jan 2022 18:45:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so18969381wmj.5
        for <llvm@lists.linux.dev>; Sat, 01 Jan 2022 10:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=KtQ6gV09wMzRnt0qjAalCczrS1n5SxgQ3gwefxZB1q0=;
        b=Qjst/aHDLqxjxlzvIaQYhFPVGsL+RlBdntZj7SnCGULrAI/D/XACfetAsD0Tg2PC5E
         /bdeZWHAwO69ad0HbOGaf+7m5HU8eulvhSbE21QDa7F2KYGP5q/tGIrRJYfh+20h2f6I
         tKYe4S6GhtWJqA0yTIDEecFBMqKGsYNqZH7dxYZMCLV4RKfT8qBVu9ylmwLE7Peh8qx8
         mrP3Ai9tuYhxZyB0OCAi4iv3+TZ40iq4lpNa9O1KyVvrLH1Zv8ovPvZZ6Wuo9XKUE/hB
         nM44ovz4DvK84SvygivaDujYwhrgy9iex6n9NIoLsQ13EWOirj8bGrO/viIBbcENrPTO
         eFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=KtQ6gV09wMzRnt0qjAalCczrS1n5SxgQ3gwefxZB1q0=;
        b=6VxLLB7AiJhVS6xtHEQSLdJy5eP3aZgo3djMeNiedLzCX3Pm2YHLmcHxSbV0MF/Yqh
         2jMbcngGCZO+G2W5/+9MscRorayafSZta40feN0GSCZB8dyI6hOelOI0yXxyRa8FAIww
         LbqmaubwaAid1CImOu0t1T0yEcZqHVuEA/+XwVQ2nJp57V+mPMuI8YXzJGobTTCpwhlC
         Q50Hrbg9lg1bcpL+ASPDY3oSi1DvF6EDYE8SVPUD0nvs7jBa0WAlFbwC+EnJHnTnf3QJ
         aeHkbEKyP0Og4tcuPNbYtWmIESSAx/4nBxSRCI7AUBOK0fDZTolpulgKbcNsbWanvnyp
         4QGA==
X-Gm-Message-State: AOAM5333DFJpb2G8j/Q69dRAkf3RJLSHL0yNwXXi5WukTTQmFqM8/0M1
	FvV5/Jr8bmcFu+lECYcCp911TA==
X-Google-Smtp-Source: ABdhPJyM6lj8XHzWjNitVDtnMWQnAcf0jmA+2Ust7p9yax0IpdHzLd8mbNaosn3SCYuPFUGBb+gghw==
X-Received: by 2002:a05:600c:2902:: with SMTP id i2mr33927942wmd.97.1641062709401;
        Sat, 01 Jan 2022 10:45:09 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id m17sm33526470wmq.31.2022.01.01.10.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 10:45:08 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 1 Jan 2022 18:45:07 +0000 (UTC)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <955016936.8500.1641062708921@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by linux: arm64: vdso32: require
 CROSS_COMPILE_COMPAT for gcc+bfd
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8499_1709739931.1641062707914"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-aarch64-lts-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_8499_1709739931.1641062707914
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd:
commit 1d1c25233a29cd6c9b7c19ea725461f9dc180e63
Author: Nick Desaulniers <ndesaulniers@google.com>

    arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd

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
40
# First few build errors in logs:
# 00:00:35 error: unable to create target: 'No available targets are compatible with triple '
# 00:00:35 make[1]: *** [arch/arm64/kernel/vdso32/Makefile:167: arch/arm64/kernel/vdso32/note.o] Error 1
# 00:00:35 error: unable to create target: 'No available targets are compatible with triple '
# 00:00:35 make[1]: *** [arch/arm64/kernel/vdso32/Makefile:169: arch/arm64/kernel/vdso32/vgettimeofday.o] Error 1
# 00:00:35 make: *** [arch/arm64/Makefile:202: vdso_prepare] Error 2

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
22047

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-aarch64-lts-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-allmodconfig/11/artifact/artifacts/build-1d1c25233a29cd6c9b7c19ea725461f9dc180e63/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-allmodconfig/11/artifact/artifacts/build-fb6ad5cb3b6745e7bffc5fe19b130f3594375634/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-allmodconfig/11/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-allmodconfig/11/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-1d1c25233a29cd6c9b7c19ea725461f9dc180e63
cd investigate-linux-1d1c25233a29cd6c9b7c19ea725461f9dc180e63

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-allmodconfig/11/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-allmodconfig/11/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-allmodconfig/11/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach 1d1c25233a29cd6c9b7c19ea725461f9dc180e63
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach fb6ad5cb3b6745e7bffc5fe19b130f3594375634
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 1d1c25233a29cd6c9b7c19ea725461f9dc180e63
Author: Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue Oct 19 15:36:46 2021 -0700

    arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
    
    commit 3e6f8d1fa18457d54b20917bd9174d27daf09ab9 upstream.
    
    Similar to
    commit 231ad7f409f1 ("Makefile: infer --target from ARCH for CC=clang")
    There really is no point in setting --target based on
    $CROSS_COMPILE_COMPAT for clang when the integrated assembler is being
    used, since
    commit ef94340583ee ("arm64: vdso32: drop -no-integrated-as flag").
    
    Allows COMPAT_VDSO to be selected without setting $CROSS_COMPILE_COMPAT
    when using clang and lld together.
    
    Before:
    $ ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make -j72 LLVM=1 defconfig
    $ grep CONFIG_COMPAT_VDSO .config
    CONFIG_COMPAT_VDSO=y
    $ ARCH=arm64 make -j72 LLVM=1 defconfig
    $ grep CONFIG_COMPAT_VDSO .config
    $
    
    After:
    $ ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make -j72 LLVM=1 defconfig
    $ grep CONFIG_COMPAT_VDSO .config
    CONFIG_COMPAT_VDSO=y
    $ ARCH=arm64 make -j72 LLVM=1 defconfig
    $ grep CONFIG_COMPAT_VDSO .config
    CONFIG_COMPAT_VDSO=y
    
    Reviewed-by: Nathan Chancellor <nathan@kernel.org>
    Suggested-by: Nathan Chancellor <nathan@kernel.org>
    Tested-by: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
    Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
    Link: https://lore.kernel.org/r/20211019223646.1146945-5-ndesaulniers@google.com
    Signed-off-by: Will Deacon <will@kernel.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/Kconfig                |  3 ++-
 arch/arm64/kernel/vdso32/Makefile | 17 +++++------------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fee914c716aa..0758ea0717f9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1264,7 +1264,8 @@ config KUSER_HELPERS
 
 config COMPAT_VDSO
 	bool "Enable vDSO for 32-bit applications"
-	depends on !CPU_BIG_ENDIAN && "$(CROSS_COMPILE_COMPAT)" != ""
+	depends on !CPU_BIG_ENDIAN
+	depends on (CC_IS_CLANG && LD_IS_LLD) || "$(CROSS_COMPILE_COMPAT)" != ""
 	select GENERIC_COMPAT_VDSO
 	default y
 	help
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 764d1900d5aa..3514269ac75f 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -10,18 +10,15 @@ include $(srctree)/lib/vdso/Makefile
 
 # Same as cc-*option, but using CC_COMPAT instead of CC
 ifeq ($(CONFIG_CC_IS_CLANG), y)
-CC_COMPAT_CLANG_FLAGS := --target=$(notdir $(CROSS_COMPILE_COMPAT:%-=%))
-
 CC_COMPAT ?= $(CC)
-CC_COMPAT += $(CC_COMPAT_CLANG_FLAGS)
-
-ifneq ($(LLVM),)
-LD_COMPAT ?= $(LD)
+CC_COMPAT += --target=arm-linux-gnueabi
 else
-LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
+CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
 endif
+
+ifeq ($(CONFIG_LD_IS_LLD), y)
+LD_COMPAT ?= $(LD)
 else
-CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
 LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
 endif
 
@@ -47,10 +44,6 @@ VDSO_CPPFLAGS += $(LINUXINCLUDE)
 # Common C and assembly flags
 # From top-level Makefile
 VDSO_CAFLAGS := $(VDSO_CPPFLAGS)
-ifneq ($(shell $(CC_COMPAT) --version 2>&1 | head -n 1 | grep clang),)
-VDSO_CAFLAGS += --target=$(notdir $(CROSS_COMPILE_COMPAT:%-=%))
-endif
-
 VDSO_CAFLAGS += $(call cc32-option,-fno-PIE)
 ifdef CONFIG_DEBUG_INFO
 VDSO_CAFLAGS += -g
</cut>
------=_Part_8499_1709739931.1641062707914--
