Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1265372
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 19:08:19 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id s6-20020a254506000000b005b6b6434cd6so4759855yba.9
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=2eiaoE39I+Y5USofHF5+1Zs2VxE4hHgvlRkoEd7CIRQ=;
        b=KSrPbkIQ6OQGiDM2rTJO7WdVzBUK3NiB43o6MbpAOmawS88BI7uRZbvF09yVFmUVEw
         sXrdN3mntfbhYB0B0+/K6vSiFcCAG344fHVF40bec51rOa8zjFMohnD/v9QX+0PJ7LHF
         pcr8/D4aCOrRFW82MBxn6JYULwgovVEP8p1t+vvdNZWfc3TFR4QcaQSUla6ZePTCg8jN
         cjWhE817yZzuI247eWhRvJ4VU6sPDapng4w1FpxenIXS8pRbAPMedOXmSCFmBjbVgpz+
         str6GLmP5ERAFqtmzpWPPpmq6bkzbAdIxjoS3SfqzWWE0Wyi26CAVbkK7oCIaZJbc0A3
         GDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=2eiaoE39I+Y5USofHF5+1Zs2VxE4hHgvlRkoEd7CIRQ=;
        b=WsVWRnpVjnDwbCCdLX4Zkw1ucJJKExAahmjBYyiPIhE5nyVpHnMBVMcv8uyv3C3Hj3
         MA7g2hZl1xuYjDMmceGOjryyiv2frJt7sZdPTA/AuGhrHf5yFD249/zh3ltaknkAgko8
         b+Wps89ViH5UcQDCf5FKXzKgwcMa2SAUSBTBqq3NVxSy/qJidsSXSkr4XQkC3EQqHRRk
         tNCb+/jGWzMt2AGF2iTcbk3tEN3SQdW/joqunXWcI9sAJpsC/VnJwHkdCU+AOxqBl578
         HlcBKvdnS3a3NgtLWganOfuUBmDB2GYNKOY3nNOWwAXpzQHqCAfWGJwUbgbaDJn4wCrd
         0zwg==
X-Gm-Message-State: AOAM531p/g8tgFBz1oG/g6AcnRKnSW9Zv3aAn7ktwDW/NxG049fAVOTV
	z4ZpVra7m6etyvq1vUf9Jb88ZsSlVHlvXZ83TdM=
X-Google-Smtp-Source: ABdhPJzcZTbQ1Oy3tQ3gFxSCJf3+SQLANXJ4xpBT1sdUk08dMyKduiPDL8QbtxfJsMs80UeqyJZwcukRQ+r1mgO51Zs=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:da31:1dfd:2e69:dc82])
 (user=ndesaulniers job=sendgmr) by 2002:a25:1285:: with SMTP id
 127mr1846238ybs.299.1632942498030; Wed, 29 Sep 2021 12:08:18 -0700 (PDT)
Date: Wed, 29 Sep 2021 12:08:05 -0700
Message-Id: <20210929190810.1597399-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH] ARM: mm: proc-macros: ensure *_tlb_fns are 4B aligned
From: Nick Desaulniers <ndesaulniers@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Fangrui Song <maskray@google.com>, Peter Smith <peter.smith@arm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Mike Rapoport <rppt@kernel.org>, YiFei Zhu <yifeifz2@illinois.edu>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@pengutronix.de>, Dave Martin <dave.martin@linaro.org>, 
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

QEMU 6.1.0 is more correct about trapping on misaligned accesses. A
kernel built with CONFIG_THUMB2_KERNEL=y and using clang as the
assembler could generate non-naturally-aligned v7wbi_tlb_fns which
results in a boot failure. The original commit adding the macro missed
the .align directive on this data.

Fixes: 66a625a88174 ("ARM: mm: proc-macros: Add generic proc/cache/tlb struct definition macros")
Link: https://github.com/ClangBuiltLinux/linux/issues/1447
Link: https://lore.kernel.org/all/0699da7b-354f-aecc-a62f-e25693209af4@linaro.org/
Debugged-by: Ard Biesheuvel <ardb@kernel.org>
Debugged-by: Nathan Chancellor <nathan@kernel.org>
Debugged-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/Kconfig          | 1 +
 arch/arm/mm/proc-macros.S | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fc196421b2ce..b760dd45b734 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -92,6 +92,7 @@ config ARM
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER if !THUMB2_KERNEL && !CC_IS_CLANG
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
+	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index e2c743aa2eb2..d9f7dfe2a7ed 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -340,6 +340,7 @@ ENTRY(\name\()_cache_fns)
 
 .macro define_tlb_functions name:req, flags_up:req, flags_smp
 	.type	\name\()_tlb_fns, #object
+	.align 2
 ENTRY(\name\()_tlb_fns)
 	.long	\name\()_flush_user_tlb_range
 	.long	\name\()_flush_kern_tlb_range
-- 
2.33.0.685.g46640cef36-goog

