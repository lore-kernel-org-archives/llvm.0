Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9813AEF50
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 22:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787352363; cv=none; b=A6GiIYq7Q0c8Jl82utpbsDa9efuKGj9MNACM+DC+Ls1GcLIEHp7jT1RMIxsUMtM18vt/KEdSxgV9fvkTHx5hl7C6al2ZHIWngNxWAetvOsu9G10gXKISwGVgNVBDh6BctaPm95O9glMIRbHCzZoc22H4iYxqrPxCW+F4wICbqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787352363; c=relaxed/simple;
	bh=OEJp5z39oCqCpxH9dM2BpNCfiPMMeGugZKo1K/SEU98=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nNJcdGRCVfPSyQeWqP6J2wLePJRTbxMmd/rNcng6VUHtAyfuIg02xstK6PzdQU5HjDIZb35FOxr1bYHhZIOPtNpVJ2PbTCHr5TV06hpfw81KPLHzB5A4FiXbMo0FECl7Gsr7FPfqWgfMoI89JihnlikUAEOoH3+hT7glNIJcVH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMawYeUk; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMawYeUk"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so3294221a91.3
        for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 15:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787352361; x=1787957161; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PoawpruQ26UxgXhGoUDM/P7VzQ79Tma0wyLntYv3M/I=;
        b=oMawYeUk0DqhKLhBTdx1NxM0nv5a41wPCo5+jom8O8ffTKO4CxyQWpQfr2LKPeGDx7
         1N79A/rXvbaGq097KUWkC18Ak4b0La7kcNzBrhmFTDV1jiv5W9/FNJxSHGJXBa4BEgj/
         76rrjIt2jAH0zr9ZorbL4YgVCtO8wc9T1+kOy0RPQOgXdyEqqIXZA6OsyPPAX3unsRaX
         s/7neIRBLTLbGSg6JQjx/K0QGDNzN2m6EHca/Qit9o4CVaisGcHum8pA02zmzRt7p1oL
         eOdaXIP0ZTfI1fso4LmQw3ehWMeCXlKQzAlpzqhpSp9gDxfYcOuONJZtdiPnSoWS/84a
         yA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787352361; x=1787957161;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoawpruQ26UxgXhGoUDM/P7VzQ79Tma0wyLntYv3M/I=;
        b=gZSnSvtgnPJQnuifcdXF88lZVXlcTwr15II95IyM/qUsnVkkiXJLdStU3SitzzHo8t
         X3ATDtJ03DAcKsdanaHEUJABZBGoaCrDQjmmgaTIUK/LXSB7M/+dLSJCbcknjX4qqzt7
         D8IhkyLgbWJByt7RcUE1/2OnkUqM/DDzaHmIQBVSKAgPTeVvqVxFs30TPGehLBGAW5yb
         IoX7iyplWvO766OcB8UF7GnYcejnIh3vcNVh9+rO988/vAmtwIfZ9CGe7E/XOLn5QuMu
         JdG9vTwNMMiRsAxkxPwf0BZ0484sGe6joKubuR7KlmIcz6hBpLGiQLroiAsRwaUAb57m
         yEvw==
X-Forwarded-Encrypted: i=1; AHgh+RqyakzOAOKn3el9vFGBuBrE5G1T6zcYM4ZfgrjiSvMrbc8IvgaNAkjmP17q6IfxubuFfX16@lists.linux.dev
X-Gm-Message-State: AFuF++lcQt2bEs0VwlT6dyi6XUj4p7PqEEGfLAO4fA2JKv3ipRdkg+eR
	xMVsgjVnsjijYx1usHIw7DpkmuLP//NoKWK2gMr8aQY4N2W0j/2dfrEDGWoM8wkL5d9YnHlI9eM
	jMEsUAAecWILcGKpcAG7DeB7/hCRjnw==
X-Received: from dlbcm37.prod.google.com ([2002:a05:7022:68a5:b0:139:d9c7:3cf4])
 (user=ndesaulniers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3812:b0:380:fead:448d with SMTP id 98e67ed59e1d1-395c3a09bfemr15847665a91.13.1787352360541;
 Fri, 21 Aug 2026 15:46:00 -0700 (PDT)
Date: Fri, 21 Aug 2026 15:45:42 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABXViGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyND3YKSosTk1PjSxIJMXRMzI2NTAwNjs+SkFCWgjoKi1LTMCrBp0bG 1tQCyeUaBXQAAAA==
X-Change-Id: 20260821-ptrace_uapi-462350036cbd
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=O0COsmvrvggwIeEq7bAuRbULbXScoJmbNMYaRi6RFIw=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787352358; l=3055;
 i=ndesaulniers@google.com; s=20260611; h=from:subject:message-id;
 bh=OEJp5z39oCqCpxH9dM2BpNCfiPMMeGugZKo1K/SEU98=; b=nXfOMSQEPii8YVDQy8UrkSfJXgJBGvGNfX6ksH6fZLOSUyCwFn0P3gcNXWaQcup2Iz0vj26Ya
 yMecgjBxvjSACYXvNTyBVGj/Mgas2lC8pRpkXstr0/gtjcTYlKP9EOD
X-Mailer: b4 0.14.3
Message-ID: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
Subject: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
From: Nick Desaulniers <ndesaulniers@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Oleg Nesterov <oleg@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

The register offset macros in <asm/ptrace-abi.h> are guarded by
`defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
were left unguarded for 32-bit. This causes havoc for userspace that
happens to use identifiers colliding with these short macro names
(e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
userspace is forced to be super extra careful with include ordering to
minimize the chance of collision.

Wrap both the 32-bit and 64-bit register definitions under
`#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.

Assisted-by: Gemini
Link: https://github.com/llvm/llvm-project/issues/217413
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/x86/include/uapi/asm/ptrace-abi.h | 4 ++--
 arch/x86/um/asm/ptrace.h               | 4 +---
 arch/x86/um/ptrace_32.c                | 1 +
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/uapi/asm/ptrace-abi.h b/arch/x86/include/uapi/asm/ptrace-abi.h
index 5823584dea13..3656955c6faa 100644
--- a/arch/x86/include/uapi/asm/ptrace-abi.h
+++ b/arch/x86/include/uapi/asm/ptrace-abi.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_X86_PTRACE_ABI_H
 #define _ASM_X86_PTRACE_ABI_H
 
+#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
 #ifdef __i386__
 
 #define EBX 0
@@ -25,7 +26,6 @@
 
 #else /* __i386__ */
 
-#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
 /*
  * C ABI says these regs are callee-preserved. They aren't saved on kernel entry
  * unless syscall needs a complete, fully filled "struct pt_regs".
@@ -57,12 +57,12 @@
 #define EFLAGS 144
 #define RSP 152
 #define SS 160
-#endif /* __ASSEMBLER__ */
 
 /* top of stack page */
 #define FRAME_SIZE 168
 
 #endif /* !__i386__ */
+#endif /* defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS) */
 
 /* Arbitrarily choose the same ptrace numbers as used by the Sparc code. */
 #define PTRACE_GETREGS            12
diff --git a/arch/x86/um/asm/ptrace.h b/arch/x86/um/asm/ptrace.h
index 2641d28d115c..439c4151f6b7 100644
--- a/arch/x86/um/asm/ptrace.h
+++ b/arch/x86/um/asm/ptrace.h
@@ -13,9 +13,7 @@ enum {
 };
 
 #include <linux/compiler.h>
-#ifndef CONFIG_X86_32
-#define __FRAME_OFFSETS /* Needed to get the R* macros */
-#endif
+#define __FRAME_OFFSETS /* Needed to get the register macros */
 #include <asm/ptrace-generic.h>
 
 #define user_mode(r) UPT_IS_USER(&(r)->regs)
diff --git a/arch/x86/um/ptrace_32.c b/arch/x86/um/ptrace_32.c
index 3af3cb821524..9e9155b0e918 100644
--- a/arch/x86/um/ptrace_32.c
+++ b/arch/x86/um/ptrace_32.c
@@ -7,6 +7,7 @@
 #include <linux/sched.h>
 #include <linux/uaccess.h>
 #include <linux/regset.h>
+#define __FRAME_OFFSETS
 #include <asm/ptrace-abi.h>
 #include <registers.h>
 #include <skas.h>

---
base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
change-id: 20260821-ptrace_uapi-462350036cbd

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

