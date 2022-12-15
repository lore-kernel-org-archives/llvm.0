Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2EA190
	for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 16:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F76FC433EF;
	Thu, 15 Dec 2022 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671121536;
	bh=PGA+ic9jPYfLEX1HOAFtdxJIjRz+LHkKF4oeHjlUx3E=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=CY9xXp99k9koM+vouwcbCSE2IbqItSkFRzo4jBNK8nertnAA+Ubn0c66yJ/g2q5no
	 Ma5uBnjEfOcGvSU4EfAXNOpCpg86Wj0BDIIFbgmdZSU/NWM/DdRQ5bIzJw0ilKL+4G
	 gp3RAGNRMcXB/PapAZqV8A3VTIj3/mWFdUCoIwC/x/qPeG157t05b8KD1B8P0ncevm
	 JnauIodncKuCQufjYCUBBcdaHfB19IvSEfzikIkbrhJGDz6h7howXTehOX74V7pVc2
	 xxFbzFUkQfuyG7Nah+EgjDRUQbeR7Lmg7LFPuna2/7I/zbwffN3/EVKogHuokGeYOb
	 Fmf64VKC3mArQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [v2] ARM: pxa: fix building with clang
Date: Thu, 15 Dec 2022 17:25:14 +0100
Message-Id: <20221215162529.3659187-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The integrated assembler in clang does not understand the xscale
specific mra/mar instructions:

arch/arm/mach-pxa/pxa27x.c:136:15: error: unsupported architectural extension: xscale
        asm volatile(".arch_extension xscale\n\t"
arch/arm/mach-pxa/pxa27x.c:136:40: error: invalid instruction, did you mean: mcr, mla, mrc, mrs, msr?
        mra r2, r3, acc0

Since these are coprocessor features, the same can be expressed using
mrrc/mcrr, so use that for builds with IAS.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: this version should actually apply
---
 arch/arm/mach-pxa/pxa27x.c | 8 ++++++++
 arch/arm/mach-pxa/pxa3xx.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index afbf6ace954f..eea507fd5095 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -133,8 +133,12 @@ void pxa27x_cpu_pm_enter(suspend_state_t state)
 #ifndef CONFIG_IWMMXT
 	u64 acc0;
 
+#ifndef CONFIG_AS_IS_LLVM
 	asm volatile(".arch_extension xscale\n\t"
 		     "mra %Q0, %R0, acc0" : "=r" (acc0));
+#else
+	asm volatile("mrrc p0, 0, %Q0, %R0, c0" : "=r" (acc0));
+#endif
 #endif
 
 	/* ensure voltage-change sequencer not initiated, which hangs */
@@ -153,8 +157,12 @@ void pxa27x_cpu_pm_enter(suspend_state_t state)
 	case PM_SUSPEND_MEM:
 		cpu_suspend(pwrmode, pxa27x_finish_suspend);
 #ifndef CONFIG_IWMMXT
+#ifndef CONFIG_AS_IS_LLVM
 		asm volatile(".arch_extension xscale\n\t"
 			     "mar acc0, %Q0, %R0" : "=r" (acc0));
+#else
+		asm volatile("mcrr p0, 0, %Q0, %R0, c0" :: "r" (acc0));
+#endif
 #endif
 		break;
 	}
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index 979642aa7ffe..b26f00fc75d5 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -108,8 +108,12 @@ static void pxa3xx_cpu_pm_suspend(void)
 #ifndef CONFIG_IWMMXT
 	u64 acc0;
 
+#ifdef CONFIG_CC_IS_GCC
 	asm volatile(".arch_extension xscale\n\t"
 		     "mra %Q0, %R0, acc0" : "=r" (acc0));
+#else
+	asm volatile("mrrc p0, 0, %Q0, %R0, c0" : "=r" (acc0));
+#endif
 #endif
 
 	/* resuming from D2 requires the HSIO2/BOOT/TPM clocks enabled */
@@ -137,8 +141,12 @@ static void pxa3xx_cpu_pm_suspend(void)
 	AD3ER = 0;
 
 #ifndef CONFIG_IWMMXT
+#ifndef CONFIG_AS_IS_LLVM
 	asm volatile(".arch_extension xscale\n\t"
 		     "mar acc0, %Q0, %R0" : "=r" (acc0));
+#else
+	asm volatile("mcrr p0, 0, %Q0, %R0, c0" :: "r" (acc0));
+#endif
 #endif
 }
 
-- 
2.35.1

