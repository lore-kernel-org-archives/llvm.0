Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89415ADA8
	for <llvm@lists.linux.dev>; Wed, 29 May 2024 02:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716949248; cv=none; b=IHdCnuW+6ZyecadHIvQ+hmHgGm6u6fjecYY/aEYL5+CDpufpz1u517NhIChSwr3SWW+8It/uDStJo1jTH4SZs/wOYbde1nyNhJHhPLrmC9tDe0bJjJOxak0nzr9j7sx7orZl0RFlE9I76V6e1MpKCXN43zxYMMYP/qwSHPt5gxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716949248; c=relaxed/simple;
	bh=U+W//EVdx0UAbUQqkIfAMe/SGhPbRP7U+NdtplK/RrA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=iE9nRB+0DmHzNZgVFm/SEqyOIhxWnQm9P6fPZY/jko7vknEaEzlgYdJYa7UP5RSHzQaa4MDhXYjndKp7a6rusdcvSnXiymVbz8F5QF4efGO77qE/+pU9bXUkB0DV95DFfYSuq/y35FEjQdQQGnwICUDs9tmu80NIqm7nZGV9kY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1MUMbbS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1MUMbbS"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6818811ef2dso997073a12.0
        for <llvm@lists.linux.dev>; Tue, 28 May 2024 19:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716949246; x=1717554046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=347Tv+L36ItrUa9DcwFsT5YsIM2weBtvDOWbMcJm1vI=;
        b=W1MUMbbS0CsOkv7WPXZ8uZxTjTLCq4iCJnTGrb0M+tUdE9D0/OGtJ+swY0K3N/ieSn
         bMi1uXlZEbS+p4HxUHx6PFHlgLlg3+3Bh64H0BFu+3YkV+uFfJ6ssMLxO05GHguG7w+U
         RaVAqZxBEeI9oiAJObHjxk9rLqr83L5REjucFH57nTdMGEZVFqKjV8PhYbvA2XhsuiCe
         evPmaaVvbM8d58coN4XltTgwGTwkYg/hW1ES2moHRrfvF3ak1sm+onJiV3Hf7wmGJVza
         XxwcoXBaVsZAWKZQNNe2fJpQiuOR9yu+F3mbchbqtVCXN7D8S6ubPw4u/nMdEQgyeKfZ
         yBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716949246; x=1717554046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=347Tv+L36ItrUa9DcwFsT5YsIM2weBtvDOWbMcJm1vI=;
        b=SVgR+41E4Ke7dDrjLujxaMNyX3n0RWvNMKdx1/tkJ2FkXxwgYxOFQeiPOwVKHPnDin
         ocupjdeqzPHxHbtuc9m6KgNFr8szkTvurbwuAIehYoo70GvrFNbTe7Hwz0F3GXKoK9tY
         9E43W9bO70xDkbOuL15/0Xwqpw27JVLDhhYoC3vr6bMDZpPZEUC6ZNHs7iVqr0M59Fr8
         O+Hs39v2MU6rGMu7ChXg8DhV/w9eonwdMC/RdJkrYGVETHw/PxLy5Jg5XBbMJ9Vh9gEW
         b2Rdun9ZN4NZ4ZoEiC0MVyh2P/ZNy7xaTfS2y10MZbM1rB2ppELW6lOC7wG4dguNY1Q3
         azUA==
X-Forwarded-Encrypted: i=1; AJvYcCWq/Rw6sRISBhSC4dYuMoeZMGSV7dCMfxinUIu7SuvLoDR7gd6+YXeQcd2nYkHQLrPkoSmrulomG/mz/AkWpQMeLyBhsQ==
X-Gm-Message-State: AOJu0YyHR53xPgBTGDtYQxYtKruDl/eG83k0IiVhFoUrtK99r0cJB24h
	78hEmMmeWxwSg4cNPIs8FqAC2k971+EOolZ/CMd/d78AgJknXuwm
X-Google-Smtp-Source: AGHT+IHoETe02pTx/zsmIpmRrV07oYeWjfDTOvDLsnucWpNSSmY9ikIEOi0eCyGo/VAVReoqmSQpdw==
X-Received: by 2002:a05:6a20:da8f:b0:1af:aec3:2841 with SMTP id adf61e73a8af0-1b212e5bddbmr15754764637.56.1716949245970;
        Tue, 28 May 2024 19:20:45 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:4:1d0::427:6000])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2bf5f6155b6sm9410812a91.29.2024.05.28.19.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 19:20:45 -0700 (PDT)
From: Gatlin Newhouse <gatlin.newhouse@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gatlin Newhouse <gatlin.newhouse@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Changbin Du <changbin.du@huawei.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Xin Li <xin3.li@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] x86/traps: Enable UBSAN traps on x86
Date: Wed, 29 May 2024 02:20:30 +0000
Message-Id: <20240529022043.3661757-1-gatlin.newhouse@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Bring x86 to parity with arm64, similar to commit 25b84002afb9
("arm64: Support Clang UBSAN trap codes for better reporting").
Enable the output of UBSAN type information on x86 architectures
compiled with clang when CONFIG_UBSAN_TRAP=y. Currently ARM
architectures output which specific sanitizer caused the trap,
via the encoded data in the trap instruction. Clang on x86
currently encodes the same data in ud1 instructions but the x86
handle_bug() and is_valid_bugaddr() functions currently only look
at ud2s.

Signed-off-by: Gatlin Newhouse <gatlin.newhouse@gmail.com>
---
 MAINTAINERS                  |  2 ++
 arch/x86/include/asm/bug.h   |  8 ++++++++
 arch/x86/include/asm/ubsan.h | 21 +++++++++++++++++++++
 arch/x86/kernel/Makefile     |  1 +
 arch/x86/kernel/traps.c      | 34 ++++++++++++++++++++++++++++------
 arch/x86/kernel/ubsan.c      | 32 ++++++++++++++++++++++++++++++++
 6 files changed, 92 insertions(+), 6 deletions(-)
 create mode 100644 arch/x86/include/asm/ubsan.h
 create mode 100644 arch/x86/kernel/ubsan.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 28e20975c26f..b8512887ffb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22635,6 +22635,8 @@ L:	kasan-dev@googlegroups.com
 L:	linux-hardening@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
+F:	arch/x86/include/asm/ubsan.h
+F:	arch/x86/kernel/ubsan.c
 F:	Documentation/dev-tools/ubsan.rst
 F:	include/linux/ubsan.h
 F:	lib/Kconfig.ubsan
diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3ec87d198ac..e3fbed9073f8 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -13,6 +13,14 @@
 #define INSN_UD2	0x0b0f
 #define LEN_UD2		2
 
+/*
+ * In clang we have UD1s reporting UBSAN failures on X86, 64 and 32bit.
+ */
+#define INSN_UD1	0xb90f
+#define LEN_UD1		2
+#define INSN_REX	0x67
+#define LEN_REX		1
+
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
diff --git a/arch/x86/include/asm/ubsan.h b/arch/x86/include/asm/ubsan.h
new file mode 100644
index 000000000000..5235822eb4ae
--- /dev/null
+++ b/arch/x86/include/asm/ubsan.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_UBSAN_H
+#define _ASM_X86_UBSAN_H
+
+/*
+ * Clang Undefined Behavior Sanitizer trap mode support.
+ */
+#include <linux/bug.h>
+#include <linux/ubsan.h>
+#include <asm/ptrace.h>
+
+#ifdef CONFIG_UBSAN_TRAP
+enum bug_trap_type handle_ubsan_failure(struct pt_regs *regs, int insn);
+#else
+static inline enum bug_trap_type handle_ubsan_failure(struct pt_regs *regs, int insn)
+{
+	return BUG_TRAP_TYPE_NONE;
+}
+#endif /* CONFIG_UBSAN_TRAP */
+
+#endif /* _ASM_X86_UBSAN_H */
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 74077694da7d..fe1d9db27500 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_UNWINDER_GUESS)		+= unwind_guess.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)		+= sev.o
 
 obj-$(CONFIG_CFI_CLANG)			+= cfi.o
+obj-$(CONFIG_UBSAN_TRAP)		+= ubsan.o
 
 obj-$(CONFIG_CALL_THUNKS)		+= callthunks.o
 
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 4fa0b17e5043..7876449e97a0 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -67,6 +67,7 @@
 #include <asm/vdso.h>
 #include <asm/tdx.h>
 #include <asm/cfi.h>
+#include <asm/ubsan.h>
 
 #ifdef CONFIG_X86_64
 #include <asm/x86_init.h>
@@ -79,6 +80,9 @@
 
 DECLARE_BITMAP(system_vectors, NR_VECTORS);
 
+/*
+ * Check for UD1, UD2, with or without REX instructions.
+ */
 __always_inline int is_valid_bugaddr(unsigned long addr)
 {
 	if (addr < TASK_SIZE_MAX)
@@ -88,7 +92,13 @@ __always_inline int is_valid_bugaddr(unsigned long addr)
 	 * We got #UD, if the text isn't readable we'd have gotten
 	 * a different exception.
 	 */
-	return *(unsigned short *)addr == INSN_UD2;
+	if (*(u16 *)addr == INSN_UD2)
+		return INSN_UD2;
+	if (*(u16 *)addr == INSN_UD1)
+		return INSN_UD1;
+	if (*(u8 *)addr == INSN_REX && *(u16 *)(addr + 1) == INSN_UD1)
+		return INSN_REX;
+	return 0;
 }
 
 static nokprobe_inline int
@@ -216,6 +226,7 @@ static inline void handle_invalid_op(struct pt_regs *regs)
 static noinstr bool handle_bug(struct pt_regs *regs)
 {
 	bool handled = false;
+	int insn;
 
 	/*
 	 * Normally @regs are unpoisoned by irqentry_enter(), but handle_bug()
@@ -223,7 +234,8 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 	 * irqentry_enter().
 	 */
 	kmsan_unpoison_entry_regs(regs);
-	if (!is_valid_bugaddr(regs->ip))
+	insn = is_valid_bugaddr(regs->ip);
+	if (insn == 0)
 		return handled;
 
 	/*
@@ -236,10 +248,20 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 	 */
 	if (regs->flags & X86_EFLAGS_IF)
 		raw_local_irq_enable();
-	if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
-	    handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
-		regs->ip += LEN_UD2;
-		handled = true;
+
+	if (insn == INSN_UD2) {
+		if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
+		handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
+			regs->ip += LEN_UD2;
+			handled = true;
+		}
+	} else {
+		if (handle_ubsan_failure(regs, insn) == BUG_TRAP_TYPE_WARN) {
+			if (insn == INSN_REX)
+				regs->ip += LEN_REX;
+			regs->ip += LEN_UD1;
+			handled = true;
+		}
 	}
 	if (regs->flags & X86_EFLAGS_IF)
 		raw_local_irq_disable();
diff --git a/arch/x86/kernel/ubsan.c b/arch/x86/kernel/ubsan.c
new file mode 100644
index 000000000000..6cae11f4fe23
--- /dev/null
+++ b/arch/x86/kernel/ubsan.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Clang Undefined Behavior Sanitizer trap mode support.
+ */
+#include <linux/bug.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+#include <linux/ubsan.h>
+#include <asm/ptrace.h>
+#include <asm/ubsan.h>
+
+/*
+ * Checks for the information embedded in the UD1 trap instruction
+ * for the UB Sanitizer in order to pass along debugging output.
+ */
+enum bug_trap_type handle_ubsan_failure(struct pt_regs *regs, int insn)
+{
+	u32 type = 0;
+
+	if (insn == INSN_REX) {
+		type = (*(u16 *)(regs->ip + LEN_REX + LEN_UD1));
+		if ((type & 0xFF) == 0x40)
+			type = (type >> 8) & 0xFF;
+	} else {
+		type = (*(u16 *)(regs->ip + LEN_UD1));
+		if ((type & 0xFF) == 0x40)
+			type = (type >> 8) & 0xFF;
+	}
+	pr_crit("%s at %pS\n", report_ubsan_failure(regs, type), (void *)regs->ip);
+
+	return BUG_TRAP_TYPE_NONE;
+}
-- 
2.25.1

