Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEA43FC1
	for <llvm@lists.linux.dev>; Mon, 30 Aug 2021 21:38:52 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id p69-20020a254248000000b00598282d96ceso4105205yba.3
        for <llvm@lists.linux.dev>; Mon, 30 Aug 2021 14:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=HL0bHPC7fRhw8NveiezJuSyRlf1c6pLI+gcpO0vq9Sg=;
        b=Vw0YkpLrhfKJfwJ/o+LiWW8iYhrqyu75s/mnuCG5dXhDSWakhU7/UrE0jtlsGXxnwG
         iXFjlGLD5voK5KlOSCK4ZCoSlj7CQb/vgAiUU20YSaLD1eCtY9Y8Y0MV1Z0BvQUN7ARe
         1m4VWFO7TQ32kIW91EXtJG1/9i6D5BtObjDDH1vqFc97HUye4X8oEo977sE3ieasNCwJ
         h1AY4zPaCQQkAR1W8AtIL1AFSHIAYEmD6Uu8sZREtW+Na0a/uHt6bCxqGuxezMU9dONu
         ZA6yM9sdwleWHTm1cx4DQmqGcwuFbjnHsanXtMOk5PE79GHtMzBcZl/wlo19kVyeUtGD
         eUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=HL0bHPC7fRhw8NveiezJuSyRlf1c6pLI+gcpO0vq9Sg=;
        b=D2bQ9HxjaAvLljQCa22Wpw5abyh2b3/khNi7Gy9AXPg61MRpr35rz3u9NBysIXnUy/
         czbFG2yk4SVwCmETrGSikpd3x/dZ7tuIfVY9sHdhrneFiNVAahNjmR7IiGBWzhMlY2GU
         OJ91JyKByJkrTjA3iEpNB5RL1/OQ4NzpvpX/qqOsDKhUXkoLF9V4EXqudkqUKS7N75SC
         J+8ZzRIRWcF6ss6u64HaBryFHUb9vKkhrnsIC7bVaLETbBnAJoX2B0/dED3SJzykQfH0
         aeEClfTtQ/zh0VK5Z85X1QMu7kLwPtXcvdWkl6ZDN47wNrCragW+bxiyhriYEh0S3pnZ
         NWhQ==
X-Gm-Message-State: AOAM531jlxN/gqCURpR3AGUdMcgH3qmRJF6IgU/0KX9+FVlfKphqC4ln
	Y6V4+bWd/fYv2SInPEBPCvHQTh+C0uXxYivUoak=
X-Google-Smtp-Source: ABdhPJwIA5lJ67dNvJNzo05E+2L82lp32fjkWAPFbwD9w2A4+dtklq/RlB9I1vIcCowqPvM40IWGjkRYSiC3hSZi58c=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:266b:6ef5:38a3:394c])
 (user=ndesaulniers job=sendgmr) by 2002:a25:74cd:: with SMTP id
 p196mr15254588ybc.454.1630359531173; Mon, 30 Aug 2021 14:38:51 -0700 (PDT)
Date: Mon, 30 Aug 2021 14:38:43 -0700
Message-Id: <20210830213846.2609349-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH] ARM: select HAVE_FUTEX_CMPXCHG
From: Nick Desaulniers <ndesaulniers@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	YiFei Zhu <yifeifz2@illinois.edu>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@pengutronix.de>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

tglx notes:
  This function [futex_detect_cmpxchg] is only needed when an
  architecture has to runtime discover whether the CPU supports it or
  not.  ARM has unconditional support for this, so the obvious thing to
  do is the below.

Fixes linkage failure from Clang randconfigs:
kernel/futex.o:(.text.fixup+0x5c): relocation truncated to fit: R_ARM_JUMP24 against `.init.text'
and boot failures for CONFIG_THUMB2_KERNEL.

Link: https://github.com/ClangBuiltLinux/linux/issues/325
Reported-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.33.0.259.gc128427fd7-goog

