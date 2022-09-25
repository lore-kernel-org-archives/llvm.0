Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE833FE4
	for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 18:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D79C433B5;
	Sun, 25 Sep 2022 18:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664129006;
	bh=yuYN7bd1gIiPT3BTzCfFO4NEhdO0lqD/4wVB1SM5PeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CFlI4ua1yv/8H7MMzh25JoBbiK51TEMNW8iitSIxwku+faDMfUDfLX1tHWdS8Otmn
	 Za7OmTGjcHMe5LfNqteaLDje9VTTVsqbpQ12PkkNsyVLVDtltY9kacyKN1kSbMKUvN
	 zbcJ4V1f7eduOwNg8biHS23cNclRj2Vuz4qd6gp9HBqotbLM368LKk1vv5Ip/MP+SQ
	 oDFx80//ItDXuibLAkHHJQEP7i+q+X5xWl0mr8q3K6VJGjhJBiFMHSbmFLcTI4ZzB+
	 EFom0Vslrm0q8TZUlN4Jyx9oP3T63rALGhsSsLirxEz4vV499ISJicdONPQ7gs22Mv
	 2B1VEmmlina7A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/4] riscv: remove extra level wrappers of trace_hardirqs_{on,off}
Date: Mon, 26 Sep 2022 01:53:53 +0800
Message-Id: <20220925175356.681-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925175356.681-1-jszhang@kernel.org>
References: <20220925175356.681-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since riscv is converted to generic entry, there's no need for the
extra wrappers of trace_hardirqs_{on,off}.

Tested with llvm + irqsoff.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/Makefile    |  2 --
 arch/riscv/kernel/trace_irq.c | 27 ---------------------------
 arch/riscv/kernel/trace_irq.h | 11 -----------
 3 files changed, 40 deletions(-)
 delete mode 100644 arch/riscv/kernel/trace_irq.c
 delete mode 100644 arch/riscv/kernel/trace_irq.h

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 01da14e21019..11ee206cc235 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -69,8 +69,6 @@ obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
 obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace.o
 obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
-obj-$(CONFIG_TRACE_IRQFLAGS)	+= trace_irq.o
-
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o
diff --git a/arch/riscv/kernel/trace_irq.c b/arch/riscv/kernel/trace_irq.c
deleted file mode 100644
index 095ac976d7da..000000000000
--- a/arch/riscv/kernel/trace_irq.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
- */
-
-#include <linux/irqflags.h>
-#include <linux/kprobes.h>
-#include "trace_irq.h"
-
-/*
- * trace_hardirqs_on/off require the caller to setup frame pointer properly.
- * Otherwise, CALLER_ADDR1 might trigger an pagging exception in kernel.
- * Here we add one extra level so they can be safely called by low
- * level entry code which $fp is used for other purpose.
- */
-
-void __trace_hardirqs_on(void)
-{
-	trace_hardirqs_on();
-}
-NOKPROBE_SYMBOL(__trace_hardirqs_on);
-
-void __trace_hardirqs_off(void)
-{
-	trace_hardirqs_off();
-}
-NOKPROBE_SYMBOL(__trace_hardirqs_off);
diff --git a/arch/riscv/kernel/trace_irq.h b/arch/riscv/kernel/trace_irq.h
deleted file mode 100644
index 99fe67377e5e..000000000000
--- a/arch/riscv/kernel/trace_irq.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
- */
-#ifndef __TRACE_IRQ_H
-#define __TRACE_IRQ_H
-
-void __trace_hardirqs_on(void);
-void __trace_hardirqs_off(void);
-
-#endif /* __TRACE_IRQ_H */
-- 
2.34.1

