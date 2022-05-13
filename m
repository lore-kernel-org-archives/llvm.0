Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E63F7A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 20:22:26 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2f4e28ae604so81705127b3.8
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Md6wwFDvMB4PVLqDkhfp9mTXd6QYVPx7Z8FPR5f9BSc=;
        b=KiVS3O4bekcxB7zRZoUJHFZJC7pmj9et4ExYBMRQtrZU8uDdsD3u+yuBe2bpvHaboU
         icZWw3PUM7spsGQu8RtA1aBOVIb1TYAejdog7cMCVttwD9GBxAh1mMFoUmkbc8g6LhE6
         7VkGoEPn54yf0UcOMBF+yOqdXQNuzX/wnmG40puQlxRB6ekpOaaFEp0ZczuHMwwQpq4o
         3x3klsFe0NGwLywlH8fDArVTUG5ZKzuXuhX1Ua2NneiDnzgkNTJPR3JX0InVVnr7olCT
         ha0Lzz9IjicA8KUwWf24IYVSSBiuTB6Kr4ntbh/fI76NbITvA/+8xWXIGKUZjKbOmq8I
         Q3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Md6wwFDvMB4PVLqDkhfp9mTXd6QYVPx7Z8FPR5f9BSc=;
        b=IT5XOBHb/QCzB+q2Ns4wGzf8gfYyUKQs+q2+H37YYGecjkND8V8LfxxaYCiBalMGwQ
         CfsywYkIFrsjUn2BYMDJwj6HSmgokQrgaTlOzr4kPiw+UvYp6xhE1nYdECs1kHTTXfTQ
         UBDYorQua7j59ZsF3bgoa+Lz1KFSSKyOBMToPSYDQ6mtjvm2PMoqcv1+PLJYPylw17hK
         oCWDvuvPBsRqy37VVJL2wiNnn4reevGZ3zYNRyv5jBM05gh1BBHnJqyGcc6VlZvvZ8rw
         kpFOd5BAK5Q0g3nQZcXqPKLRrMdmNmVgLL4XYqrQ4ffA9qM5muklJzh/UNMryaHB+FoT
         ocLQ==
X-Gm-Message-State: AOAM5323nExSl1UqpN3b+ida8kijFIm8YHKYM6gKHn8VZJlE4Q5rOIHw
	2vpFiK5mhPDSIAD3MMqTbA+e2qhHEk4xdKd2RC4=
X-Google-Smtp-Source: ABdhPJzzS+hgrDXkIQ78C1jkwVYeeiqi5zDv7GpOH8HTs/OQpJlVpQOvxTx5coGiuLkilLM7qnBvEsaxCyb0BC1W874=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e0:c17e:c2dc:13eb])
 (user=samitolvanen job=sendgmr) by 2002:a0d:f545:0:b0:2fe:abb3:7c with SMTP
 id e66-20020a0df545000000b002feabb3007cmr6167664ywf.442.1652473345464; Fri,
 13 May 2022 13:22:25 -0700 (PDT)
Date: Fri, 13 May 2022 13:21:48 -0700
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>
Message-Id: <20220513202159.1550547-11-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086; h=from:subject;
 bh=cZE++FYxgA229q0aEVyJMl4ketApj5AOcD5nAVOWycA=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBifr3kd278w3J1O0/fEBAHIfTms9eoTg4xVty1x+fK
 sxtAHyaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYn695AAKCRBMtfaEi7xW7oQyC/
 9MK5AaJuJ0icIag21s1ACQae/rcQ41SWh1Ec8GZwcMOoJRNqBhJHgFoOgs6sXcBcAb/evxOT6/I4Yt
 PoLSoTUYzU/wrJ67vPbLcuVppH1i8JDgV902A1wsjtaNLZEfqjtMFOlNsx2qlwJb/m3jqyReATfZUl
 Di7bvD/X8nPduu+wx+FYK6yN1CbB2MyanTnqytQDgBJG+ekfG3qwYZU6caWhHxli8mW3Aaol4qf5Ez
 uzXpaVu1FeVEw57NTqcwwSB5qIuMm3Ex1TGjLW/M0aeSUEcW0GiG6fr2EiWsdQILSlGG5zlaBW5GUR
 2qnQXy5m1b/upu1i1lHM+rRuqMQ63eAn4tOoVvsQbRb5wh3z4+xRPiR6WYV9JtWCDN/aXKegiDKzZY
 Ddi/6Azc4I2/hxVQoB2KvshJfM3hpkm+Y1RPwZwmJY+h7v4eucWpyQEKru0C9hp3vvSQ1tK31t9kMV
 KOiO4NAvTjGTUhPLwehD8ina98kge2npOGXqie6Wf/i2A=
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC PATCH v2 10/21] arm64: Add CFI error handling
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With -fsanitize=kcfi, CFI always traps. Add arm64 support for handling
CFI failures. The registers containing the target address and the
expected type are encoded in the first ten bits of the ESR as follows:

 - 0-4: n, where the register Xn contains the target address
 - 5-9: m, where the register Wm contains the type hash

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/include/asm/brk-imm.h |  6 +++++
 arch/arm64/kernel/traps.c        | 46 +++++++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/brk-imm.h b/arch/arm64/include/asm/brk-imm.h
index ec7720dbe2c8..6e000113e508 100644
--- a/arch/arm64/include/asm/brk-imm.h
+++ b/arch/arm64/include/asm/brk-imm.h
@@ -17,6 +17,7 @@
  * 0x401: for compile time BRK instruction
  * 0x800: kernel-mode BUG() and WARN() traps
  * 0x9xx: tag-based KASAN trap (allowed values 0x900 - 0x9ff)
+ * 0x8xxx: Control-Flow Integrity traps
  */
 #define KPROBES_BRK_IMM			0x004
 #define UPROBES_BRK_IMM			0x005
@@ -28,4 +29,9 @@
 #define KASAN_BRK_IMM			0x900
 #define KASAN_BRK_MASK			0x0ff
 
+#define CFI_BRK_IMM_TARGET		GENMASK(4, 0)
+#define CFI_BRK_IMM_TYPE		GENMASK(9, 5)
+#define CFI_BRK_IMM_BASE		0x8000
+#define CFI_BRK_IMM_MASK		(CFI_BRK_IMM_TARGET | CFI_BRK_IMM_TYPE)
+
 #endif
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 0529fd57567e..17b083b683f4 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -26,6 +26,7 @@
 #include <linux/syscalls.h>
 #include <linux/mm_types.h>
 #include <linux/kasan.h>
+#include <linux/cfi.h>
 
 #include <asm/atomic.h>
 #include <asm/bug.h>
@@ -990,6 +991,37 @@ static struct break_hook bug_break_hook = {
 	.imm = BUG_BRK_IMM,
 };
 
+#ifdef CONFIG_CFI_CLANG
+static int cfi_handler(struct pt_regs *regs, unsigned int esr)
+{
+	unsigned long target, type;
+
+	target = pt_regs_read_reg(regs, FIELD_GET(CFI_BRK_IMM_TARGET, esr));
+	type = pt_regs_read_reg(regs, FIELD_GET(CFI_BRK_IMM_TYPE, esr));
+
+	switch (report_cfi_failure(regs, regs->pc, target, type)) {
+	case BUG_TRAP_TYPE_BUG:
+		die("Oops - CFI", regs, 0);
+		break;
+
+	case BUG_TRAP_TYPE_WARN:
+		break;
+
+	default:
+		return DBG_HOOK_ERROR;
+	}
+
+	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
+	return DBG_HOOK_HANDLED;
+}
+
+static struct break_hook cfi_break_hook = {
+	.fn = cfi_handler,
+	.imm = CFI_BRK_IMM_BASE,
+	.mask = CFI_BRK_IMM_MASK,
+};
+#endif /* CONFIG_CFI_CLANG */
+
 static int reserved_fault_handler(struct pt_regs *regs, unsigned int esr)
 {
 	pr_err("%s generated an invalid instruction at %pS!\n",
@@ -1051,6 +1083,9 @@ static struct break_hook kasan_break_hook = {
 };
 #endif
 
+
+#define esr_comment(esr) ((esr) & ESR_ELx_BRK64_ISS_COMMENT_MASK)
+
 /*
  * Initial handler for AArch64 BRK exceptions
  * This handler only used until debug_traps_init().
@@ -1058,10 +1093,12 @@ static struct break_hook kasan_break_hook = {
 int __init early_brk64(unsigned long addr, unsigned int esr,
 		struct pt_regs *regs)
 {
+#ifdef CONFIG_CFI_CLANG
+	if ((esr_comment(esr) & ~CFI_BRK_IMM_MASK) == CFI_BRK_IMM_BASE)
+		return cfi_handler(regs, esr) != DBG_HOOK_HANDLED;
+#endif
 #ifdef CONFIG_KASAN_SW_TAGS
-	unsigned int comment = esr & ESR_ELx_BRK64_ISS_COMMENT_MASK;
-
-	if ((comment & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
+	if ((esr_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
 		return kasan_handler(regs, esr) != DBG_HOOK_HANDLED;
 #endif
 	return bug_handler(regs, esr) != DBG_HOOK_HANDLED;
@@ -1070,6 +1107,9 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
 void __init trap_init(void)
 {
 	register_kernel_break_hook(&bug_break_hook);
+#ifdef CONFIG_CFI_CLANG
+	register_kernel_break_hook(&cfi_break_hook);
+#endif
 	register_kernel_break_hook(&fault_break_hook);
 #ifdef CONFIG_KASAN_SW_TAGS
 	register_kernel_break_hook(&kasan_break_hook);
-- 
2.36.0.550.gb090851708-goog

