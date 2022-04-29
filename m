Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33971869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:37:38 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b6-20020a5b0b46000000b006457d921729so8368410ybr.23
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=CBFSOSCWmXZdYTn8wlTZ3Rj5NSKYEySXgB9hFZpDWcQ=;
        b=ZMe9V/MSuwf8udmciH8lqoba83OKO8v0g4K1vzIlxr2talii7K7Ys0ordrrMAHe+pp
         DaqLObTTros84C3FoilHwVOlv/STu0KhGjugyeK349pAgMRnv4wFfKGXK66cTNEK/E/2
         9CS4D6qXyibLUANPFQftw9xg5fy6QMtOA2/GCKenixGS3WyJxUkAAE2Fomn5XE4N6+Fu
         MH4isN9/BTjRcs0gsnSNZkRVTC/M1BBUGL5BQ+8ljr9lJua+F/PodDy+y3v9FvpxQypS
         cIBtMTLJxrS2yefnyXe+cpHCAo5gcyjEL1MfDZsZasLEWiGX5qs2r02D/2wLWwBVNFNQ
         E5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=CBFSOSCWmXZdYTn8wlTZ3Rj5NSKYEySXgB9hFZpDWcQ=;
        b=57sQpOammaU46zBdC0rg6T246UY8+leJIHw8BUjjdKm44Ns3VvQS6soWA6dcvrc3Js
         5kYOYZpUHFJfbFIzeQ6YgiKCrcA8OnXntCA3XaqzXas4pZt3O/LaivIwBkF8os4SSCai
         tpdZRpm/J1ZE+O0uDM3fEhKAB2wtl/vqrTr+RLVPJaAnI458AJCj0sCSFgk8wJ+xy0Te
         i1bHFtPABKbChgvL+v0fEVnlwZ6Tmd31fZTO61TQ6CKUF5TC4PuSPKuk67IzogwUtMM5
         QBz3zt3++WjjUS6JhFef50Swo+3QimOTkwjRMYIN6Q9ka9hnqQ7qOt3QCbmj7nLSaYii
         reMw==
X-Gm-Message-State: AOAM530tDos2Simqn4CiPIqbmP4xpmtMn6swLkOFflNyPPpwAzz+AzKT
	fDdoH7kyw0rtYClhCU+XfqlTr+t3f5JXoYXpRaE=
X-Google-Smtp-Source: ABdhPJz3PRZnRDaYveY8PEOrWLh5TwRRZFIgz/hxn66OLDYa/VrKRiT3aho8JsA1WKfUtkL1urGOjyBFCiYVRzF+Yvc=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a25:e0d3:0:b0:645:77c9:4e31 with SMTP
 id x202-20020a25e0d3000000b0064577c94e31mr1243653ybg.97.1651264657838; Fri,
 29 Apr 2022 13:37:37 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:44 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169; h=from:subject;
 bh=uFL18k3KC4iCKF4AXgGD1Mq4jj5gai1wigbzvC9PP/o=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExY2LifXNevk1TsxQ0IeoobF4r0E0uMXfS+2IhA
 yLd8T56JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMWAAKCRBMtfaEi7xW7ou7DA
 CVtuVd3sKEK3z2ChoeiIcGcU8iukBN8OM/HXmzh3pZq6yVg67wrrJiJ5oCCKPR2sRaYP0t6MSn772K
 l5U4p82O/prDh9AK0kKeyaSy4kvxVMyegTBCTiWzEC3tN48aXVcmI3dMp98RL7LGQzu9v4CLIEVaAa
 ZyLplEa810jUrIxOZER6sZfDmqUN7V/0ZKKzwsynPVXj76wvte6NCWe3NJ/ZxHTKwz2evdYtezNBOs
 w5UmruzJ3X4BM+NXqEmVZVfauFH9okVc4aHyl3C0tSJ4hQddWslVlW6jiD7FczG0DVtfhYaktcY3yZ
 335Ly2E9sGHsooiWLotHkG2PgPaJ+Jhfa2cw8T3990e55MXFQKaNXNTCRXA+Qq5C7qXBuPFrmbgIz1
 isZNNgIYvj+7LUjbO4NBInJYbyLkQMpgNLLqoZq/7hfv1xoJcIZg4CS+1iAmr+3dOxn1GAj/d/7CTi
 jKj9QZzAlA88rYhDAQ3LbORG2j6VAUCtSo+oWCun3pPF8=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 21/21] x86: Add support for CONFIG_CFI_CLANG
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
Content-Transfer-Encoding: quoted-printable

Add CONFIG_CFI_CLANG error handling and allow the config to be selected
on x86_64.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/Kconfig               |  1 +
 arch/x86/include/asm/linkage.h |  7 ++++++
 arch/x86/kernel/traps.c        | 39 +++++++++++++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index b0142e01002e..01db5c5c4dde 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -108,6 +108,7 @@ config X86
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK	if X86_64
 	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <=3D 4096
+	select ARCH_SUPPORTS_CFI_CLANG		if X86_64
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_USE_BUILTIN_BSWAP
diff --git a/arch/x86/include/asm/linkage.h b/arch/x86/include/asm/linkage.=
h
index 85865f1645bd..d20acf5ebae3 100644
--- a/arch/x86/include/asm/linkage.h
+++ b/arch/x86/include/asm/linkage.h
@@ -25,6 +25,13 @@
 #define RET	ret
 #endif
=20
+#ifdef CONFIG_CFI_CLANG
+#define __CFI_TYPE(name)			\
+	.fill 10, 1, 0x90 ASM_NL		\
+	.4byte __kcfi_typeid_##name ASM_NL	\
+	.fill 2, 1, 0xcc
+#endif
+
 #else /* __ASSEMBLY__ */
=20
 #ifdef CONFIG_SLS
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 1563fb995005..b9e46e6ed83b 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -40,6 +40,7 @@
 #include <linux/hardirq.h>
 #include <linux/atomic.h>
 #include <linux/ioasid.h>
+#include <linux/cfi.h>
=20
 #include <asm/stacktrace.h>
 #include <asm/processor.h>
@@ -295,6 +296,41 @@ static inline void handle_invalid_op(struct pt_regs *r=
egs)
 		      ILL_ILLOPN, error_get_trap_addr(regs));
 }
=20
+#ifdef CONFIG_CFI_CLANG
+void *arch_get_cfi_target(unsigned long addr, struct pt_regs *regs)
+{
+	char buffer[MAX_INSN_SIZE];
+	int offset;
+	struct insn insn;
+	unsigned long *target;
+
+	/*
+	 * The expected CFI check instruction sequence:
+	 * =C2=A0 cmpl=C2=A0 =C2=A0 <id>, -6(%reg)	; 7 bytes
+	 *   je      .Ltmp1		; 2 bytes
+	 *   ud2			; <- addr
+	 *   .Ltmp1:
+	 *
+	 * Therefore, the target address is in a register that we can
+	 * decode from the cmpl instruction.
+	 */
+	if (copy_from_kernel_nofault(buffer, (void *)addr - 9, MAX_INSN_SIZE))
+		return NULL;
+	if (insn_decode(&insn, buffer, MAX_INSN_SIZE, INSN_MODE_64))
+		return NULL;
+	if (insn.opcode.value !=3D 0x81)
+		return NULL;
+
+	offset =3D insn_get_modrm_rm_off(&insn, regs);
+	if (offset < 0)
+		return NULL;
+
+	target =3D (void *)regs + offset;
+
+	return (void *)*target;
+}
+#endif
+
 static noinstr bool handle_bug(struct pt_regs *regs)
 {
 	bool handled =3D false;
@@ -312,7 +348,8 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 	 */
 	if (regs->flags & X86_EFLAGS_IF)
 		raw_local_irq_enable();
-	if (report_bug(regs->ip, regs) =3D=3D BUG_TRAP_TYPE_WARN) {
+	if (report_bug(regs->ip, regs) =3D=3D BUG_TRAP_TYPE_WARN ||
+	    report_cfi(regs->ip, regs) =3D=3D BUG_TRAP_TYPE_WARN) {
 		regs->ip +=3D LEN_UD2;
 		handled =3D true;
 	}
--=20
2.36.0.464.gb9c8b46e94-goog

