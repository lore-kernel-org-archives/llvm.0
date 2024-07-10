Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DAD19149A
	for <llvm@lists.linux.dev>; Wed, 10 Jul 2024 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720643581; cv=none; b=oeyV2vvfDq/gQWxhFIMzDZXiYhqUo+CCfXLRl8AuM7Y7fXOQi7kWLRs3wnZqq1/mq+HhprJpchJdpGxt3zpnhXGbIhd2RV6wa4FR1WkpY4JmlNcslCV8qfnSGdt34C3RW7FVKGRWwl1cpNv8XRHXJvMTJQDqwP02x8BQb0J9D44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720643581; c=relaxed/simple;
	bh=u1EaGdzdZhazkExoELLOUh5xVpslqzZXG1v3WYXqMLc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=APNET8fWJa2OhbUNuLHsVnoavyChTS1uPIC+tF19ciFlIu0DxwpisyROGw6P+T4mU2aiQfvRx8CiBJuLVxBpB87sWEtzbP/E3Cyr3npUwIXwRXXGivcptUNv9mmj0YE5jtX9zlobe5rMr/Buxa/mFYzXuRC5T9QVDURZbBFoDT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbEP5S3X; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbEP5S3X"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70af5fbf0d5so149618b3a.1
        for <llvm@lists.linux.dev>; Wed, 10 Jul 2024 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720643579; x=1721248379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq3JIg1oATa3NdJjOk623LvywPQZdgGRBXTXdShRg5I=;
        b=bbEP5S3X7LN2VsjoJGRQ2tY/Sh0NKQ7si2FfJd/qgwIXeB9eQDfTuE1Fa3K5TaGNe6
         0JJPe53L8EpUXFFU5H21l5/QtyXh7ZV7ztAa9ZdA6XrQi0Iy3GtMd/r65bUPOMddMQPg
         sJYO/fk7spxZY0gJ9sWnlxlZRiSnPINSUDe8KhvjChLBHyBsSlV5eNPRFgIPUTnNasvP
         FSG5AUO10ZLeXyLav7fChOaxDjP8HpDykNZTiB7EEmKGZyMngJOV35R7eOnaZf/M4F8E
         6kYPUA5k5+OBQLaVg6xlRcCGO9jzcaAaNyouOpzQjfsCw9mBOHNnysCPVdn9JrAArcPz
         dKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720643579; x=1721248379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq3JIg1oATa3NdJjOk623LvywPQZdgGRBXTXdShRg5I=;
        b=wKbznqXiYsCf+/AKfX4TS2U6gGiGkM2esnLOidKiNlu/UllnS/MVr+de/AiQxHdA4T
         wSvptmIa5iZjzsstVuweEIoXBTI5LqFxKSfO3zp5SyKwoEUqbAcv8sMWeJETIGT9kjl5
         2cwAUs48EW1uAcA3DVjDyrhqp+Fhr3TqzLQH0bs5jHgrOyJfC/+aNP2Jz1tswz8JOUSB
         AzGzht4cwfXuZGyi3FRt+rehvciPhuAXuWAhIVKbvsfuAv/5nUykx/l+VI/co5hHYG8w
         OsVg+xD1ZPfy0Io8dsO0KqMysQRDS7LFwbyZlrxFrYoqpwA5m/3MdOR2spU4dKQlF56+
         hWUw==
X-Forwarded-Encrypted: i=1; AJvYcCUrGQ64qvR7Yc9HCYxsAibNvDAWO8B5I+bgexRMFiqDg1Ca9gDZ++UybETWDMmp4LFIOU+RZoIYiCs/g+1Evm+ayY4bKQ==
X-Gm-Message-State: AOJu0YymJ6ZxdEBXVy6anzJI/BhLb8JQVXpCYVxjukMdaU+LvFo50odC
	9wkNtnLgF6xwPxSq0Ilm8rLo484vdsHhGw5HSItpAlRCKrMe4y1T
X-Google-Smtp-Source: AGHT+IE9TuBFXjREoKsBh0G0aHT26DqQ90JHzqJd/5KbGHIun9eti3YCqMKqUCzeKlMzN86W6uMUWw==
X-Received: by 2002:a05:6a00:986:b0:706:5c4c:1390 with SMTP id d2e1a72fcca58-70b5de18917mr903207b3a.7.1720643578437;
        Wed, 10 Jul 2024 13:32:58 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:4:1d0::427:6000])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-70b439b5676sm4222180b3a.184.2024.07.10.13.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 13:32:57 -0700 (PDT)
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
	Pengfei Xu <pengfei.xu@intel.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Changbin Du <changbin.du@huawei.com>,
	Xin Li <xin3.li@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arnd Bergmann <arnd@arndb.de>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v4] x86/traps: Enable UBSAN traps on x86
Date: Wed, 10 Jul 2024 20:32:38 +0000
Message-Id: <20240710203250.238782-1-gatlin.newhouse@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Currently ARM architectures extract which specific sanitizer
has caused a trap via encoded data in the trap instruction.
Clang on x86 currently encodes the same data in ud1 instructions
but the x86 handle_bug() and is_valid_bugaddr() functions
currently only look at ud2s.

Bring x86 to parity with arm64, similar to commit 25b84002afb9
("arm64: Support Clang UBSAN trap codes for better reporting").
Enable the reporting of UBSAN sanitizer detail on x86 architectures
compiled with clang when CONFIG_UBSAN_TRAP=y.

Signed-off-by: Gatlin Newhouse <gatlin.newhouse@gmail.com>
---
Changes in v4:
  - Implement Peter's suggestions for decode_bug(), and fix
    inconsistent capitalization in hex values.

Changes in v3:
  - Address Thomas's remarks about: change log structure,
    get_ud_type() instead of is_valid_bugaddr(), handle_bug()
    changes, and handle_ubsan_failure().

Changes in v2:
  - Name the new constants 'LEN_ASOP' and 'INSN_ASOP' instead of
    'LEN_REX' and 'INSN_REX'
  - Change handle_ubsan_failure() from enum bug_trap_type to void
    function

v1: https://lore.kernel.org/linux-hardening/20240529022043.3661757-1-gatlin.newhouse@gmail.com/
v2: https://lore.kernel.org/linux-hardening/20240601031019.3708758-1-gatlin.newhouse@gmail.com/
v3: https://lore.kernel.org/linux-hardening/20240625032509.4155839-1-gatlin.newhouse@gmail.com/
---
 MAINTAINERS                  |  2 ++
 arch/x86/include/asm/bug.h   | 11 +++++++
 arch/x86/include/asm/ubsan.h | 23 +++++++++++++++
 arch/x86/kernel/Makefile     |  1 +
 arch/x86/kernel/traps.c      | 57 ++++++++++++++++++++++++++++++++----
 arch/x86/kernel/ubsan.c      | 21 +++++++++++++
 6 files changed, 110 insertions(+), 5 deletions(-)
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
index a3ec87d198ac..ccd573d58edb 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -13,6 +13,17 @@
 #define INSN_UD2	0x0b0f
 #define LEN_UD2		2
 
+/*
+ * In clang we have UD1s reporting UBSAN failures on X86, 64 and 32bit.
+ */
+#define INSN_ASOP	0x67
+#define OPCODE_PREFIX	0x0f
+#define OPCODE_UD1	0xb9
+#define OPCODE_UD2	0x0b
+#define BUG_NONE	0xffff
+#define BUG_UD1		0xfffe
+#define BUG_UD2		0xfffd
+
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
diff --git a/arch/x86/include/asm/ubsan.h b/arch/x86/include/asm/ubsan.h
new file mode 100644
index 000000000000..ac2080984e83
--- /dev/null
+++ b/arch/x86/include/asm/ubsan.h
@@ -0,0 +1,23 @@
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
+/*
+ * UBSAN uses the EAX register to encode its type in the ModRM byte.
+ */
+#define UBSAN_REG	0x40
+
+#ifdef CONFIG_UBSAN_TRAP
+void handle_ubsan_failure(struct pt_regs *regs, u16 insn);
+#else
+static inline void handle_ubsan_failure(struct pt_regs *regs, u16 insn) { return; }
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
index 4fa0b17e5043..b6664016622a 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -67,6 +67,7 @@
 #include <asm/vdso.h>
 #include <asm/tdx.h>
 #include <asm/cfi.h>
+#include <asm/ubsan.h>
 
 #ifdef CONFIG_X86_64
 #include <asm/x86_init.h>
@@ -91,6 +92,45 @@ __always_inline int is_valid_bugaddr(unsigned long addr)
 	return *(unsigned short *)addr == INSN_UD2;
 }
 
+/*
+ * Check for UD1 or UD2, accounting for Address Size Override Prefixes.
+ * If it's a UD1, get the ModRM byte to pass along to UBSan.
+ */
+__always_inline int decode_bug(unsigned long addr, u32 *imm)
+{
+	u8 v;
+
+	if (addr < TASK_SIZE_MAX)
+		return BUG_NONE;
+
+	v = *(u8 *)(addr++);
+	if (v == INSN_ASOP)
+		v = *(u8 *)(addr++);
+	if (v != OPCODE_PREFIX)
+		return BUG_NONE;
+
+	v = *(u8 *)(addr++);
+	if (v == OPCODE_UD2)
+		return BUG_UD2;
+	if (v != OPCODE_UD1)
+		return BUG_NONE;
+
+	v = *(u8 *)(addr++);
+	if (X86_MODRM_RM(v) == 4)
+		addr++;
+
+	*imm = 0;
+	if (X86_MODRM_MOD(v) == 1)
+		*imm = *(u8 *)addr;
+	else if (X86_MODRM_MOD(v) == 2)
+		*imm = *(u32 *)addr;
+	else
+		WARN_ONCE(1, "Unexpected MODRM_MOD: %u\n", X86_MODRM_MOD(v));
+
+	return BUG_UD1;
+}
+
+
 static nokprobe_inline int
 do_trap_no_signal(struct task_struct *tsk, int trapnr, const char *str,
 		  struct pt_regs *regs,	long error_code)
@@ -216,6 +256,8 @@ static inline void handle_invalid_op(struct pt_regs *regs)
 static noinstr bool handle_bug(struct pt_regs *regs)
 {
 	bool handled = false;
+	int ud_type;
+	u32 imm;
 
 	/*
 	 * Normally @regs are unpoisoned by irqentry_enter(), but handle_bug()
@@ -223,7 +265,8 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 	 * irqentry_enter().
 	 */
 	kmsan_unpoison_entry_regs(regs);
-	if (!is_valid_bugaddr(regs->ip))
+	ud_type = decode_bug(regs->ip, &imm);
+	if (ud_type == BUG_NONE)
 		return handled;
 
 	/*
@@ -236,10 +279,14 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 	 */
 	if (regs->flags & X86_EFLAGS_IF)
 		raw_local_irq_enable();
-	if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
-	    handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
-		regs->ip += LEN_UD2;
-		handled = true;
+	if (ud_type == BUG_UD2) {
+		if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
+		    handle_cfi_failure(regs) == BUG_TRAP_TYPE_WARN) {
+			regs->ip += LEN_UD2;
+			handled = true;
+		}
+	} else {
+		handle_ubsan_failure(regs, imm);
 	}
 	if (regs->flags & X86_EFLAGS_IF)
 		raw_local_irq_disable();
diff --git a/arch/x86/kernel/ubsan.c b/arch/x86/kernel/ubsan.c
new file mode 100644
index 000000000000..c90e337a1b6a
--- /dev/null
+++ b/arch/x86/kernel/ubsan.c
@@ -0,0 +1,21 @@
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
+void handle_ubsan_failure(struct pt_regs *regs, u16 type)
+{
+	if ((type & 0xFF) == UBSAN_REG)
+		type >>= 8;
+	pr_crit("%s at %pS\n", report_ubsan_failure(regs, type), (void *)regs->ip);
+}
-- 
2.25.1

