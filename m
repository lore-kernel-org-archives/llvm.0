Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3410440C
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 20:14:15 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3562f0fb5a7so55354087b3.1
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 13:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1u5FCYn8RsWrm4xJEN7PdURIEcHyxJb/9pj2n8isAA=;
        b=fhvrXFoWhZpC391txksgdYNhBWOVQCBl52aYSUmgLmhInb9/MtPSZeYIGNH/ys8YWI
         mQSvZiXV1v5iLGTGKg3WLOnb1cFS0+Th+kedZ2Q3zmcpiIRzT5RaNzsSxxtcaNVbbxQo
         6C/ki/P9jwc6ECEEO3qyZ7BhL6tV27cjhxD/VeL/TfQ+p/pKemcqLqpJM6t6JMdBSclB
         h82uZmMBfbIJIfgs+0ai9YWmfThqceTYpj/4W8VtdRmM96JMViT3MmTw9mDdKQfv3xvt
         kEinfPe2PO+UwyaMeL2LurLmXdFoE/9L88IDkDSdt7gWv/6RRC+AabmHqrVrKTq57VGh
         UuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1u5FCYn8RsWrm4xJEN7PdURIEcHyxJb/9pj2n8isAA=;
        b=rh4LfDUEGcbdip+iO6pbzcXCB2O+V9xatSgEyPuZLcQz7dOt/5h05DUhPVF7Voxjfg
         IrnFMMkg0MkBO9p8HHoSTm0zbfKx3n3+f8smfMzGClGQyut/kPZZXd0N3WQbFxNsj3Ei
         jIQvpIIUMpftTeNDJtY4+ksyKTeQkb4qr5cf5BahhVpEHXbN0TkbZpVZLU2jETO8dj/T
         mhDWEDIAjwOY7svwpObYsflQAO8KThDDwFVcUkzsyIJoiNumWnMl21cBGp2/9tkiSjhY
         UoaldumrkMXTuEVEEvKcRkimo/RDGVklAcBMTysS6w1xeITyu7wqZSNZLVmSroD5syI2
         omTw==
X-Gm-Message-State: ACrzQf1H3doQgLCRN/2W6BD+Wv8xoMFplVI0aD6JNxcBGrDSxBO/N1+k
	nhDbnvAcBsd1fJ91jmO81wp+uoQ+1kbBfpToJ04=
X-Google-Smtp-Source: AMsMyM5LJchL6EFofTHHxs4MNR5XzLntxu/R6NAv2OzNylDOZxQp85yFrPbs85r8ne1/8BZAIoLHNBBM5axsYtLlCVM=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:2ba5:63af:4077:4515])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:eb0d:0:b0:356:67be:73ca with SMTP
 id u13-20020a0deb0d000000b0035667be73camr6144943ywe.108.1665778454896; Fri,
 14 Oct 2022 13:14:14 -0700 (PDT)
Date: Fri, 14 Oct 2022 13:13:54 -0700
In-Reply-To: <20221014201354.3190007-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221014201354.3190007-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665778434; l=4916;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=VxwVKVoT72n36JM/fgC34SDckwipa3adGbKwxRiCt2I=;
 b=rr6SNqvjfUP45yOE+YAm3SR9cD5RDQnj3V+GfQQxH8pSx9VoCaj7uytjS9DlnvEkq4VZJ0hzDBme
 Yv8fiIbkB02j4cJV0iSKr9y6pV5x0SIUrX0N5J9BqTNYul2wwy6r
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Message-ID: <20221014201354.3190007-5-ndesaulniers@google.com>
Subject: [PATCH v4 4/4] ARM: pass -march= only to compiler
From: Nick Desaulniers <ndesaulniers@google.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
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

Clang is trying to warn that it doesn't support different values for
-march= and -Wa,-march= (like GCC does, but the kernel doesn't need this)
though the value of the preprocessor define __thumb2__ is based on
-march=. Make sure to re-set __thumb2__ via -D flag for assembler
sources now that we're no longer passing -march= to the assembler. Set
it to a different value than the preprocessor would for -march= in case
-march= gets accidentally re-added to KBUILD_AFLAGS in the future.
Thanks to Ard and Nathan for this suggestion.

Link: https://github.com/ClangBuiltLinux/linux/issues/1315
Link: https://github.com/ClangBuiltLinux/linux/issues/1587
Link: https://github.com/llvm/llvm-project/issues/55656
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v3 -> v4:
* Add -D__thumb2__=2 to KBUILD_AFLAGS as per in-person discussion with
  Ard and Nathan, and their SB tags.
* Reword commit message.

 arch/arm/Makefile | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index ee888070b2ff..b58998749ead 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -60,21 +60,34 @@ endif
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
@@ -119,15 +132,16 @@ AFLAGS_NOWARN	:=$(call as-option,-Wa$(comma)-mno-warn-deprecated,-Wa$(comma)-W)
 
 ifeq ($(CONFIG_THUMB2_KERNEL),y)
 CFLAGS_ISA	:=-mthumb -Wa,-mimplicit-it=always $(AFLAGS_NOWARN)
-AFLAGS_ISA	:=$(CFLAGS_ISA) -Wa$(comma)-mthumb
+AFLAGS_ISA	:=$(CFLAGS_ISA) -Wa$(comma)-mthumb -D__thumb2__=2
 else
 CFLAGS_ISA	:=$(call cc-option,-marm,) $(AFLAGS_NOWARN)
 AFLAGS_ISA	:=$(CFLAGS_ISA)
 endif
 
 # Need -Uarm for gcc < 3.x
+KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
-KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) $(arch-y) $(tune-y) -include asm/unified.h -msoft-float
+KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include asm/unified.h -msoft-float
 
 CHECKFLAGS	+= -D__arm__
 
-- 
2.38.0.413.g74048e4d9e-goog

