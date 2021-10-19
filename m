Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB242C85
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 22:37:02 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id q193-20020a252aca000000b005ba63482993so27394076ybq.0
        for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 15:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ieJkUq9AzcpIj4LQBtK/SuYHkz864IVu4L+C9FeReNk=;
        b=ERko7aMyEefMKRlvV+YD2HoE6JCeR02DxC3cDmrCS0O1UiBj+RN2tSODvIWcna78Cw
         EJR33ISjdTzmwBPptFpZbGhcPvP4wQ/wlvy/jh/F5JfsfiG7Nwaoy7dsONTwHvPP7YJo
         wqdihZee+7b7qp3N9lLeJUXPikSzPfCkK3O3jppmlVpy+p4/D5m9KVmWBTdOjIttqqBb
         XNcKhpveeawTx3cJCTsN50vbXBF+S91p2IOyqhdMBcjThvW8iAGo6nckvEmibPnHUbzb
         tMG1bFm6Th+iIzS+zYG23S7K9UTJDw4wBFJ8/VIMGzm8Y4T/9FiaFppZ3vbDfkAsU2cG
         cE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ieJkUq9AzcpIj4LQBtK/SuYHkz864IVu4L+C9FeReNk=;
        b=oq9OunCSiCuAK03tMHpp16/0UIvd6HDeRZ4ZvDLPsVn8TIih0wjczVqh1Bm8wH6v4r
         ukiN/6IiCw9Dcq/Kzg2JuYulXm4IcGasnOWB6Ra2+5vIJpzWwd0DTGS/CMsLYWNINZt7
         EU1GHKScclZeJZ+eTRixP9V6UtPV6YyQO8r3eT9TjQSSGD8kEFDFyp0J4DgNF865BOHp
         lRQjT2NKqOUg/ieT1vYrwKuKMOQh+m1QyFek8jjuF33wXO59mY01MDLaapMVzL9gyak1
         BVpUw96XZRlBROSjSE5txvNnInwviGYd/3RdKMVfI0ImppHVn54P2N8jjGuW+IJcRRsx
         0DIg==
X-Gm-Message-State: AOAM532g/iMwK+qFt8F+Soq7fkcljxOfvr97k9bKgR5cmyJhS6hFJevB
	Jleo/ck7kdjpqn3UtQQQIay+9qI0UAlubOZ3UNQ=
X-Google-Smtp-Source: ABdhPJw8tBLJuOZSF61b7iRwYY/fKQtMy2X99637/nO9cOgSqDLJbdat9U2v0D48/Z7up8cj+LueXImtfbNoMWSaySs=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:de0:247b:5157:7c15])
 (user=ndesaulniers job=sendgmr) by 2002:a25:1a46:: with SMTP id
 a67mr42666171yba.21.1634683021220; Tue, 19 Oct 2021 15:37:01 -0700 (PDT)
Date: Tue, 19 Oct 2021 15:36:46 -0700
In-Reply-To: <20211019223646.1146945-1-ndesaulniers@google.com>
Message-Id: <20211019223646.1146945-5-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211019223646.1146945-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634683006; l=3156;
 s=20211004; h=from:subject; bh=bnFBQ6SFPtVAkwcilKxCNvOoVbtexwjszCO7lK1gTak=;
 b=WK0kuoDuvYBKOWtOBxZiPPiBoN9HIqJyfM6EDsHV+1PUewJNi21HNTTWWfH7V5NZcKxfR4UBSAPi
 L3H7+RH4BlB/mChnNglFhRxhTz73LV4hNQDAa3YHRyCtVpW1JNKe
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 4/4] arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
From: Nick Desaulniers <ndesaulniers@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

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
---
Changes v1 -> v2:
* Cite ef94340583ee as per Nathan.
* Add parens to Kconfig expression as per Nathan.
* Pick up Nathan's RB, TB, and SB tags.

 arch/arm64/Kconfig                |  3 ++-
 arch/arm64/kernel/vdso32/Makefile | 17 +++++------------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5c7ae4c3954b..f0f2c95aa4c8 100644
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
index e478cebb9891..c8fec493a450 100644
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
 
@@ -45,10 +42,6 @@ VDSO_CPPFLAGS += $(LINUXINCLUDE)
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
-- 
2.33.0.1079.g6e70778dc9-goog

