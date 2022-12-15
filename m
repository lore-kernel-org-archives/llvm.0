Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137F190
	for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 16:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FC1C433D2;
	Thu, 15 Dec 2022 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671120475;
	bh=rjTRsba5uD4q7QllFe7RT5FYqITsWk8COGttM+gBAc4=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=bYLLWymp+OLkuBhPpRe3fTAadPuaYzpoeAtUjEY86rlHv8cx/GdwaizFJx/kaYzKt
	 UFeqhvy1L9xlb2Iz28MZUk3Bzrv3/HWbHP+hKa57Di99qC5Rveg9p724BZULBCbB/4
	 g/K1eKixykvguWJ9Iwh708G9rW4hlJHRer9TyEt7fw7hJUphXINbqtGdsg9a1mx2/W
	 5mBeIBRZt4WcRQBLfZUnmSOQsN5KHOmdr774hNg4U4V12Kx5C/OWa55KxKUjfGONlh
	 VQYn16VvKf86TyBckrKKbMdzaJSahMv80DpdLSfrlnj8taj47lvDb8t9uO84Lvz/l+
	 UGADPLqcPInUA==
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ARM: pxa: fix building with clang
Date: Thu, 15 Dec 2022 17:07:28 +0100
Message-Id: <20221215160747.2173998-1-arnd@kernel.org>
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
 arch/arm/mach-pxa/pxa27x.c |  8 ++++++++
 arch/arm/mach-pxa/pxa3xx.c | 16 +++++++++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

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
index 4637c54dd6a1..b26f00fc75d5 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -108,11 +108,12 @@ static void pxa3xx_cpu_pm_suspend(void)
 #ifndef CONFIG_IWMMXT
 	u64 acc0;
 
-	asm volatile(
 #ifdef CONFIG_CC_IS_GCC
-		     ".arch_extension xscale\n\t"
-#endif
+	asm volatile(".arch_extension xscale\n\t"
 		     "mra %Q0, %R0, acc0" : "=r" (acc0));
+#else
+	asm volatile("mrrc p0, 0, %Q0, %R0, c0" : "=r" (acc0));
+#endif
 #endif
 
 	/* resuming from D2 requires the HSIO2/BOOT/TPM clocks enabled */
@@ -140,11 +141,12 @@ static void pxa3xx_cpu_pm_suspend(void)
 	AD3ER = 0;
 
 #ifndef CONFIG_IWMMXT
-	asm volatile(
-#ifdef CONFIG_CC_IS_GCC
-		     ".arch_extension xscale\n\t"
-#endif
+#ifndef CONFIG_AS_IS_LLVM
+	asm volatile(".arch_extension xscale\n\t"
 		     "mar acc0, %Q0, %R0" : "=r" (acc0));
+#else
+	asm volatile("mcrr p0, 0, %Q0, %R0, c0" :: "r" (acc0));
+#endif
 #endif
 }
 
-- 
2.35.1

