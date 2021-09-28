Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9C3FCC
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 15:42:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11AB061354;
	Tue, 28 Sep 2021 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632843748;
	bh=Kjod7Dg1Idecfo4RpcY/AygTGl3Rik7I7C/y/vFeIAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TnEhddhDpbfT/qGh4mtxDa35mWR0KNstAx/Tk7QCXEL3tXbJ5M6tj3cCGu7g4qU2b
	 t218VqoaMedlmVE49FLfg0Wd/f59Jyc7RF2zYT2kw0er+0btGRV8r5LsQqLHGKgd4X
	 iUDIAo3muUgv2mnHi/hG8bGek5du5hZF0UjuIgvSQQnFB6bC9/TDGcDBVIW4B+7XgH
	 8EMSrKFsC9GpSqLsSCv6/I2Cc1zk3EDC0KCZYXxWT+fKulgSioc5jtgLyiKUsfikjg
	 eVf6Bt5LcduS1IGmb0bcdkpPN3DSXhiI234za3TutW2EfApV99fvH/U03+G0LqWSwC
	 DTI5FVY5du/8g==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH 14/14] [RFC] ARM: forbid ftrace with clang and thumb2_kernel
Date: Tue, 28 Sep 2021 17:41:43 +0200
Message-Id: <20210928154143.2106903-15-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210928154143.2106903-1-arnd@kernel.org>
References: <20210928154143.2106903-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang fails to build kernels with THUMB2 and FUNCTION_TRACER
enabled when there is any inline asm statement containing
the frame pointer register r7:

arch/arm/mach-versatile/dcscb.c:95:2: error: inline asm clobber list contains reserved registers: R7 [-Werror,-Winline-asm]
arch/arm/mach-exynos/mcpm-exynos.c:154:2: error: inline asm clobber list contains reserved registers: R7 [-Werror,-Winline-asm]
arch/arm/probes/kprobes/actions-thumb.c:449:3: error: inline asm clobber list contains reserved registers: R7 [-Werror,-Winline-asm]

Apparently gcc should also have warned about this, and the
configuration is actually invalid, though there is some
disagreement on the bug trackers about this.

Link: https://bugs.llvm.org/show_bug.cgi?id=45826
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94986
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0d4f3e2d50ad..7ea95bb40004 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -91,7 +91,7 @@ config ARM
 	select HAVE_FAST_GUP if ARM_LPAE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !(THUMB2_KERNEL && CC_IS_CLANG)
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)
 	select HAVE_IRQ_TIME_ACCOUNTING
-- 
2.29.2

