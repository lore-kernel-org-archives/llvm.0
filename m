Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7099B138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:10:06 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id y6-20020a25a086000000b0064d8822f94bso4082701ybh.22
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 14:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=uR8fBj5xEbHbPpF6kOnzURYdm0/ut31Y0IfMxJWffDM=;
        b=k3uVMrQMx5KY7DTaJyGFyhujDhf5HLPHQg/0aCxqS5oo2mQY5FHDkhTUSQjPxxqybO
         kA/eQp81aO1qWo63Rh73bC+/TXjut98EQmmed89OALR85ZitiQnON9b7oc58EMGYgku1
         90LqX5fl79FFgb5Zhz4DGBafUSczGI1yeesAfc5hnZJj3Jn3PKcI4vSa5lt5WLwgLO8C
         GyKwHTNF/HqZI4jumboVr5RUJjvtEF0wpVvrrDUqNQvOkfqS4zBnC6NfHjcpkYo/1OuH
         MhQXZSbmFUwBuKjuNzO+TDMalriyAofGKhozeDmkqKAjOGUdp85Vc8Xs8Qgwu1nLrcji
         nUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uR8fBj5xEbHbPpF6kOnzURYdm0/ut31Y0IfMxJWffDM=;
        b=glSy0HZ0OhTjaMJg0ZXor05Ut6THa4Mi7Ss6aPvScMkS6pAj0uCEdsLIfengDRx2wQ
         zuzIOo6bXA3IDcNgLH+zTJILdmQ+6V0gMM/P/HzyrjIxxTXz2bZvpXrGZ0GZ59cmRh/T
         y5t8wnUj4tZUr9eRyHtLryCLVlzB53zi8h80maA0/Ouj3nFuMt8ocoRJ9TRxggV7CKO+
         2O7n04r//TX6/hj1Au5qha9z1zQczxOGK4WYFleb6lYduYMadRNgP4AAwvYquvMGorxe
         /IhdweXyb8+K/5kjTImHWzJM6gVpyhoxjmEzqrQm8lKOegXhZqZ5j0Ayr1rZVOePTprl
         2dpA==
X-Gm-Message-State: AOAM530X8cfjhwxc8QM4UqCgxuwubtJHemfX9YVtd2eX4Wt+GNyGUJig
	OpowPp28JSNdmQhIcCwi0htOppnRGb0CCcpiOaw=
X-Google-Smtp-Source: ABdhPJyDi6K2oWYXlyWCJ5XKcQVc/+zo2gwZ5YIL/COpbALJXAIL4i9mZKX4jcpzEcnqt2DJGWV03Fw4pOgixa+NJU8=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2ef0:b8de:b9c8:da45])
 (user=ndesaulniers job=sendgmr) by 2002:a25:fe12:0:b0:64b:473f:cb79 with SMTP
 id k18-20020a25fe12000000b0064b473fcb79mr20805404ybe.82.1652735405447; Mon,
 16 May 2022 14:10:05 -0700 (PDT)
Date: Mon, 16 May 2022 14:09:51 -0700
In-Reply-To: <20220516210954.1660716-1-ndesaulniers@google.com>
Message-Id: <20220516210954.1660716-2-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220516210954.1660716-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652735394; l=3985;
 s=20211004; h=from:subject; bh=gVoVkYKp2fU88mTtUugTh71wg9G6f/KfwhDgJ87QUd8=;
 b=arxbscZTEvpEke55vwBYjBhK3a5JbxBkFo8AE5K5jAu1hTI0EVf0NjdTojY3MekesE1ui17QOmUi
 IxK7fHIzB0nn38yIJRfegglWQwYT22lzKrGDP3dLQfSyZokvCrVV
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v3 1/4] ARM: remove lazy evaluation in Makefile
From: Nick Desaulniers <ndesaulniers@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Ard@google.com, Biesheuvel@google.com
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

arch-y and tune-y used lazy evaluation since they used to contain
cc-option checks. They don't any longer, so just eagerly evaluate these
command line flags.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/Makefile | 60 +++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a2391b8de5a5..99a7ed7e9f09 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -60,44 +60,38 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-ipa-sra)
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
 # testing for a specific architecture or later rather impossible.
-arch-$(CONFIG_CPU_32v7M)	=-D__LINUX_ARM_ARCH__=7 -march=armv7-m
-arch-$(CONFIG_CPU_32v7)		=-D__LINUX_ARM_ARCH__=7 -march=armv7-a
-arch-$(CONFIG_CPU_32v6)		=-D__LINUX_ARM_ARCH__=6 -march=armv6
-# Only override the compiler option if ARMv6. The ARMv6K extensions are
+arch-$(CONFIG_CPU_32v7M)	:=-D__LINUX_ARM_ARCH__=7 -march=armv7-m
+arch-$(CONFIG_CPU_32v7)		:=-D__LINUX_ARM_ARCH__=7 -march=armv7-a
+arch-$(CONFIG_CPU_32v6)		:=-D__LINUX_ARM_ARCH__=6 -march=armv6
+# Only override the compiler opt:ion if ARMv6. The ARMv6K extensions are
 # always available in ARMv7
 ifeq ($(CONFIG_CPU_32v6),y)
-arch-$(CONFIG_CPU_32v6K)	=-D__LINUX_ARM_ARCH__=6 -march=armv6k
+arch-$(CONFIG_CPU_32v6K)	:=-D__LINUX_ARM_ARCH__=6 -march=armv6k
 endif
-arch-$(CONFIG_CPU_32v5)		=-D__LINUX_ARM_ARCH__=5 -march=armv5te
-arch-$(CONFIG_CPU_32v4T)	=-D__LINUX_ARM_ARCH__=4 -march=armv4t
-arch-$(CONFIG_CPU_32v4)		=-D__LINUX_ARM_ARCH__=4 -march=armv4
-arch-$(CONFIG_CPU_32v3)		=-D__LINUX_ARM_ARCH__=3 -march=armv3m
-
-# Evaluate arch cc-option calls now
-arch-y := $(arch-y)
+arch-$(CONFIG_CPU_32v5)		:=-D__LINUX_ARM_ARCH__=5 -march=armv5te
+arch-$(CONFIG_CPU_32v4T)	:=-D__LINUX_ARM_ARCH__=4 -march=armv4t
+arch-$(CONFIG_CPU_32v4)		:=-D__LINUX_ARM_ARCH__=4 -march=armv4
+arch-$(CONFIG_CPU_32v3)		:=-D__LINUX_ARM_ARCH__=3 -march=armv3m
 
 # This selects how we optimise for the processor.
-tune-$(CONFIG_CPU_ARM7TDMI)	=-mtune=arm7tdmi
-tune-$(CONFIG_CPU_ARM720T)	=-mtune=arm7tdmi
-tune-$(CONFIG_CPU_ARM740T)	=-mtune=arm7tdmi
-tune-$(CONFIG_CPU_ARM9TDMI)	=-mtune=arm9tdmi
-tune-$(CONFIG_CPU_ARM940T)	=-mtune=arm9tdmi
-tune-$(CONFIG_CPU_ARM946E)	=-mtune=arm9e
-tune-$(CONFIG_CPU_ARM920T)	=-mtune=arm9tdmi
-tune-$(CONFIG_CPU_ARM922T)	=-mtune=arm9tdmi
-tune-$(CONFIG_CPU_ARM925T)	=-mtune=arm9tdmi
-tune-$(CONFIG_CPU_ARM926T)	=-mtune=arm9tdmi
-tune-$(CONFIG_CPU_FA526)	=-mtune=arm9tdmi
-tune-$(CONFIG_CPU_SA110)	=-mtune=strongarm110
-tune-$(CONFIG_CPU_SA1100)	=-mtune=strongarm1100
-tune-$(CONFIG_CPU_XSCALE)	=-mtune=xscale
-tune-$(CONFIG_CPU_XSC3)		=-mtune=xscale
-tune-$(CONFIG_CPU_FEROCEON)	=-mtune=xscale
-tune-$(CONFIG_CPU_V6)		=-mtune=arm1136j-s
-tune-$(CONFIG_CPU_V6K)		=-mtune=arm1136j-s
-
-# Evaluate tune cc-option calls now
-tune-y := $(tune-y)
+tune-$(CONFIG_CPU_ARM7TDMI)	:=-mtune=arm7tdmi
+tune-$(CONFIG_CPU_ARM720T)	:=-mtune=arm7tdmi
+tune-$(CONFIG_CPU_ARM740T)	:=-mtune=arm7tdmi
+tune-$(CONFIG_CPU_ARM9TDMI)	:=-mtune=arm9tdmi
+tune-$(CONFIG_CPU_ARM940T)	:=-mtune=arm9tdmi
+tune-$(CONFIG_CPU_ARM946E)	:=-mtune=arm9e
+tune-$(CONFIG_CPU_ARM920T)	:=-mtune=arm9tdmi
+tune-$(CONFIG_CPU_ARM922T)	:=-mtune=arm9tdmi
+tune-$(CONFIG_CPU_ARM925T)	:=-mtune=arm9tdmi
+tune-$(CONFIG_CPU_ARM926T)	:=-mtune=arm9tdmi
+tune-$(CONFIG_CPU_FA526)	:=-mtune=arm9tdmi
+tune-$(CONFIG_CPU_SA110)	:=-mtune=strongarm110
+tune-$(CONFIG_CPU_SA1100)	:=-mtune=strongarm1100
+tune-$(CONFIG_CPU_XSCALE)	:=-mtune=xscale
+tune-$(CONFIG_CPU_XSC3)		:=-mtune=xscale
+tune-$(CONFIG_CPU_FEROCEON)	:=-mtune=xscale
+tune-$(CONFIG_CPU_V6)		:=-mtune=arm1136j-s
+tune-$(CONFIG_CPU_V6K)		:=-mtune=arm1136j-s
 
 ifeq ($(CONFIG_AEABI),y)
 CFLAGS_ABI	:=-mabi=aapcs-linux -mfpu=vfp
-- 
2.36.0.550.gb090851708-goog

