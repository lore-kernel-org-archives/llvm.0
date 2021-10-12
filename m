Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFE32C81
	for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 23:46:45 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id v70-20020a256149000000b005ba4d61ea0fso1153365ybb.22
        for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 16:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hfiy0QufwKlZXZoYyiK7jO6+5BlktvV9a4QK+YsxTx0=;
        b=P5Kv4XRzDuovgemzwzFDEbF2CapwNumuLtyGpo9nYCVcOcDOuFAm04NHV6EDPcNKoE
         kfQkzVrspYepYC/bjDdzPpXeHWd+OUcwCvxz1yWEVlGzC7u6FO8EXGPZ07b+1gSPti6L
         bcbg9qEl/VPw1CPZhDvmecfDFtpKKhYlHQrioZ1LyewqEnvWUU8agYqExzKmmGHasVdm
         vNfR3xCfSaQ6b4abY9o9hY1cDY+DMHeVGcd94ZbVzqoYEG9dMlO89lWGsnKZ3e2LE8Oq
         0yCs8X3+V5I8JK1t+GFhB2HzftTVf5g83fSzGlcYPbJZencfTlXjEmMFyCty+OCTJ7Ls
         QCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hfiy0QufwKlZXZoYyiK7jO6+5BlktvV9a4QK+YsxTx0=;
        b=4coJA44pkuNwHPzLb0wJlV4+jkPbZbNbxDUZh8WwXSEGfze8ld5ngArwvJSzmI7ZDC
         2zm8QVDj9nqBpEH74n1woSwDmSoIp+Azs6gxgaPPfXayDfSA+p4mh1Er5qsyYIA8G7Ys
         BXqYyG2TpEE4Msm/HZjKByotDLtnqV3lmYhPtPjWabOjPHeLa/yGjW7ebbOjy6q2sshV
         QwUEwjjyB1X5cK8nUB5JiMdmgp11ywi2fvsbYxkRoLehW12bIWUh8xca7N+jVJ3sGT5e
         FCFn45sk3b9arKKd2eyYOJTpVFh3qQA2ziXtdSbSnM/VRhPfeAN4yFHbwVh1RwA2RNev
         vVeg==
X-Gm-Message-State: AOAM531MbfZ7ZoHDD7KOj2zAY8p6ulzh+I/a2LCqR+LEUpt2/lkCP5xx
	1sgleIyT9XlpvREo/Be+j5uHsIPFXu1E3aS3pkM=
X-Google-Smtp-Source: ABdhPJzqJ+E+oSOLkej8TGqrH10ec7ZUj9JYPKz4YsOMxhOsBrZihoow2n6bwIjVHLjng8ovw3DFgWfRX8Hoos5I++M=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:9b44:962:5897:17c0])
 (user=ndesaulniers job=sendgmr) by 2002:a25:2202:: with SMTP id
 i2mr31320160ybi.223.1634082404879; Tue, 12 Oct 2021 16:46:44 -0700 (PDT)
Date: Tue, 12 Oct 2021 16:46:05 -0700
In-Reply-To: <20211012234606.91717-1-ndesaulniers@google.com>
Message-Id: <20211012234606.91717-3-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211012234606.91717-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634082366; l=2372;
 s=20211004; h=from:subject; bh=hiyKEKl9KNUln0vdBegNdaMtjSqTKA9iKbxjt+QhW7o=;
 b=7aj4L6HQ17bDqsHnReZofAfQuwPdPnNcErtr1xRO8mhYy74vVRcWes0SugNBY5Cix+5yQo5urUvo
 1y5nRpMbAhoSK7FxdeCTIF3kLFjP7t8xQzU1pkdXmgLfMtYazSW1
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH 2/3] arm64: vdso32: lazily invoke COMPAT_CC
From: Nick Desaulniers <ndesaulniers@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Lucas Henneman <henneman@google.com>
Content-Type: text/plain; charset="UTF-8"

When running the following command without arm-linux-gnueabi-gcc in
one's $PATH, the following warning is observed:

$ ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make -j72 LLVM=1 mrproper
make[1]: arm-linux-gnueabi-gcc: No such file or directory

This is because KCONFIG is not run for mrproper, so CONFIG_CC_IS_CLANG
is not set, and we end up eagerly evaluating various variables that try
to invoke CC_COMPAT.

This is a similar problem to what was observed in
commit 3ec8a5b33dea ("kbuild: do not export LDFLAGS_vmlinux")

Cc: Masahiro Yamada <masahiroy@kernel.org>
Reported-by: Lucas Henneman <henneman@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm64/kernel/vdso32/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 89299a26638b..d24b12318f4c 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -38,12 +38,12 @@ cc32-disable-warning = $(call try-run,\
 # As a result we set our own flags here.
 
 # KBUILD_CPPFLAGS and NOSTDINC_FLAGS from top-level Makefile
-VDSO_CPPFLAGS := -DBUILD_VDSO -D__KERNEL__ -nostdinc -isystem $(shell $(CC_COMPAT) -print-file-name=include)
+VDSO_CPPFLAGS = -DBUILD_VDSO -D__KERNEL__ -nostdinc -isystem $(shell $(CC_COMPAT) -print-file-name=include)
 VDSO_CPPFLAGS += $(LINUXINCLUDE)
 
 # Common C and assembly flags
 # From top-level Makefile
-VDSO_CAFLAGS := $(VDSO_CPPFLAGS)
+VDSO_CAFLAGS = $(VDSO_CPPFLAGS)
 ifneq ($(shell $(CC_COMPAT) --version 2>&1 | head -n 1 | grep clang),)
 VDSO_CAFLAGS += --target=$(notdir $(CROSS_COMPILE_COMPAT:%-=%))
 endif
@@ -73,7 +73,7 @@ VDSO_CAFLAGS += -DDISABLE_BRANCH_PROFILING
 VDSO_CAFLAGS += $(call cc32-option,-march=armv8-a -D__LINUX_ARM_ARCH__=8,\
                                    -march=armv7-a -D__LINUX_ARM_ARCH__=7)
 
-VDSO_CFLAGS := $(VDSO_CAFLAGS)
+VDSO_CFLAGS = $(VDSO_CAFLAGS)
 VDSO_CFLAGS += -DENABLE_COMPAT_VDSO=1
 # KBUILD_CFLAGS from top-level Makefile
 VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
@@ -108,7 +108,7 @@ else
 VDSO_CFLAGS += -marm
 endif
 
-VDSO_AFLAGS := $(VDSO_CAFLAGS)
+VDSO_AFLAGS = $(VDSO_CAFLAGS)
 VDSO_AFLAGS += -D__ASSEMBLY__
 
 # From arm vDSO Makefile
-- 
2.33.0.882.g93a45727a2-goog

