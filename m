Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D36138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:10:13 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-2fed274f3fbso53103647b3.17
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=BmTyv5Df5nSkvL+7PwI+QdbCtOf+cNe9vmiXu33ntQI=;
        b=gptOuy544f1/kWDiF/3OwcmGk6scE1yCINr+MYB1fM6wQOI6FyysBHER/hQTOSK0b+
         MaV+lyiNd6H08pwzyCgMNFopwYNwi/ySdFT99VpNmwgQEw0rEy19FI8sloRnORfz9EV4
         YuA8+Csdh3kYQlEkStrZ0CpdJcbK+x+1D+bsBF5GlIIousYpIEVQAE3MkbbjAsA60HDM
         jP9FqLob+qAOGNb6Ycu0ImKBZ1mi+hSyanggzGdQSkDubEMBbMo3sfYBAr0LDXQzZdaR
         JkwFLL7wq3O3irglenxPj5cF750M8ZXPb/t3wKR9aCD4OZO67kD9v4JgQWVu/llWeVVm
         8ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=BmTyv5Df5nSkvL+7PwI+QdbCtOf+cNe9vmiXu33ntQI=;
        b=hpDHxLhOq9WxBlnNjz8jnyHxqOilz3UFMlckh1tGtWPSKknfsKJq7HtflMOpXoQDQp
         qytU20JHNJX90ysj3gJatyuwTqd25JOuTpP4DgLV6MFfd8FkWON2qFICoap9rb1B/uFy
         DaTxF/CeHLjX3TPezH/HA0NiJjNEcMslYRHMoQ6KlYpvDfZ9Mx9elpAMaDUnuDG0rDcC
         fZinrGpEzkVGHlXTD0BX/fJb9aHjmdOupNBb8QBFKZpE5cZshqicoXUmLpIa5sDK+VwS
         jWjz1KL1ehBXhGtbpolSUu0qVji+Ixt7yfocPEsnRBuRJDfrs1WJsTf68sm2Mlz1XMH1
         zJYw==
X-Gm-Message-State: AOAM5315tiA0fISmXeTq3pnB694P/gLlTRHlWxAgsNfdXI0TrPbxoeop
	pfUIVOdmcozK3um7tSPWGVoedMwW9YGxCEOij7I=
X-Google-Smtp-Source: ABdhPJyMla5qPnmYHt216sR4ibgSN7vwxmKWbie1i9N4867KZ+Hc7TO27zSrR5W1Qkojj5JAsQSKdVVdoFJA+sTbuZw=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2ef0:b8de:b9c8:da45])
 (user=ndesaulniers job=sendgmr) by 2002:a25:d116:0:b0:64d:6fe1:4dc5 with SMTP
 id i22-20020a25d116000000b0064d6fe14dc5mr11663959ybg.576.1652735412883; Mon,
 16 May 2022 14:10:12 -0700 (PDT)
Date: Mon, 16 May 2022 14:09:54 -0700
In-Reply-To: <20220516210954.1660716-1-ndesaulniers@google.com>
Message-Id: <20220516210954.1660716-5-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220516210954.1660716-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652735394; l=3775;
 s=20211004; h=from:subject; bh=+s618NXBymdAo9VdYorCW3hWAXdQktAqz3laN51+p0c=;
 b=OVKnwODfYq9bHW9OJKqrl5qkJCDSXoxeW3Uqh+U1PMMqzJNX8xSLFGLaDqfYUfRMRaRK9PaeLrVs
 k97zmrYECFqtsXsQ5YEhv3E7FzsuxYTtWcX5oD9dXLdHurNhF4CA
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v3 4/4] ARM: pass -march= only to compiler
From: Nick Desaulniers <ndesaulniers@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Ard@google.com, Biesheuvel@google.com
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

When both -march= and -Wa,-march= are specified for assembler or
assembler-with-cpp sources, GCC and Clang will prefer the -Wa,-march=
value but Clang will warn that -march= is unused.

warning: argument unused during compilation: '-march=armv6k'
[-Wunused-command-line-argument]

This is the top group of warnings we observe when using clang to
assemble the kernel via `ARCH=arm make LLVM=1`.

Split the arch-y make variable into two, so that -march= flags only get
passed to the compiler, not the assembler. -D flags are added to
KBUILD_CPPFLAGS which is used for both C and assembler-with-cpp sources.

Link: https://github.com/ClangBuiltLinux/linux/issues/1315
Link: https://github.com/ClangBuiltLinux/linux/issues/1587
Link: https://lore.kernel.org/llvm/628249e8.1c69fb81.d20fd.02ea@mx.google.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/Makefile | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 1029c2503aef..47a300f6f99c 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -57,21 +57,34 @@ endif
 KBUILD_CFLAGS	+= $(call cc-option,-fno-ipa-sra)
 
 # This selects which instruction set is used.
+arch-$(CONFIG_CPU_32v7M)	:=-march=armv7-m
+arch-$(CONFIG_CPU_32v7)		:=-march=armv7-a
+arch-$(CONFIG_CPU_32v6)		:=-march=armv6
+# Only override the compiler option if ARMv6. The ARMv6K extensions are
+# always available in ARMv7
+ifeq ($(CONFIG_CPU_32v6),y)
+arch-$(CONFIG_CPU_32v6K)	:=-march=armv6k
+endif
+arch-$(CONFIG_CPU_32v5)		:=-march=armv5te
+arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
+arch-$(CONFIG_CPU_32v4)		:=-march=armv4
+arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
+
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
 # testing for a specific architecture or later rather impossible.
-arch-$(CONFIG_CPU_32v7M)	:=-D__LINUX_ARM_ARCH__=7 -march=armv7-m
-arch-$(CONFIG_CPU_32v7)		:=-D__LINUX_ARM_ARCH__=7 -march=armv7-a
-arch-$(CONFIG_CPU_32v6)		:=-D__LINUX_ARM_ARCH__=6 -march=armv6
-# Only override the compiler opt:ion if ARMv6. The ARMv6K extensions are
+cpp-$(CONFIG_CPU_32v7M)		:=-D__LINUX_ARM_ARCH__=7
+cpp-$(CONFIG_CPU_32v7)		:=-D__LINUX_ARM_ARCH__=7
+cpp-$(CONFIG_CPU_32v6)		:=-D__LINUX_ARM_ARCH__=6
+# Only override the compiler option if ARMv6. The ARMv6K extensions are
 # always available in ARMv7
 ifeq ($(CONFIG_CPU_32v6),y)
-arch-$(CONFIG_CPU_32v6K)	:=-D__LINUX_ARM_ARCH__=6 -march=armv6k
+cpp-$(CONFIG_CPU_32v6K)		:=-D__LINUX_ARM_ARCH__=6
 endif
-arch-$(CONFIG_CPU_32v5)		:=-D__LINUX_ARM_ARCH__=5 -march=armv5te
-arch-$(CONFIG_CPU_32v4T)	:=-D__LINUX_ARM_ARCH__=4 -march=armv4t
-arch-$(CONFIG_CPU_32v4)		:=-D__LINUX_ARM_ARCH__=4 -march=armv4
-arch-$(CONFIG_CPU_32v3)		:=-D__LINUX_ARM_ARCH__=3 -march=armv3m
+cpp-$(CONFIG_CPU_32v5)		:=-D__LINUX_ARM_ARCH__=5
+cpp-$(CONFIG_CPU_32v4T)		:=-D__LINUX_ARM_ARCH__=4
+cpp-$(CONFIG_CPU_32v4)		:=-D__LINUX_ARM_ARCH__=4
+cpp-$(CONFIG_CPU_32v3)		:=-D__LINUX_ARM_ARCH__=3
 
 # This selects how we optimise for the processor.
 tune-$(CONFIG_CPU_ARM7TDMI)	:=-mtune=arm7tdmi
@@ -123,8 +136,9 @@ AFLAGS_ISA	:=$(CFLAGS_ISA)
 endif
 
 # Need -Uarm for gcc < 3.x
+KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
-KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) $(arch-y) $(tune-y) -include asm/unified.h -msoft-float
+KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include asm/unified.h -msoft-float
 
 CHECKFLAGS	+= -D__arm__
 
-- 
2.36.0.550.gb090851708-goog

