Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B714298
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148554; cv=none; b=pbv/PBqy1x6ppt895SFSV7AUhMRevLCMMfi5aqQZA8HOgFJrUXrI9oBUPDA/4PjE41aa14GengAHLxLGk7qkMi5ObOoF0UK3udJMDQC7L9v4RfkJ79GFZeOoYT27yTDIn9mN5VrDbQ05qazgNIFqEh8kave+rG6c4JAPBESEhQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148554; c=relaxed/simple;
	bh=b88Ssa443mAX3mQ1WGdorbMIihYqVOYrpVLgvmXRuFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+xkUT0Dj5k3nGIL3DXPcGLOfxWePJWNDQAYTYPorX4WmpGeNWLGergV1OHPBEirMiEqKVTBdObLYoIo5SVbsIj1g9B6DbK92tjyuHf/XMN1ToyIs7EyV37gLMj5XoM9mfXw2j9wKydMvE6E7YV+FFJUNyGAKbv4gpAd+m9EKQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVFiJB1m; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVFiJB1m"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56840d872aeso1937259a12.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148551; x=1710753351; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/Pzv9BlBySoLr2F+FaLoJ1pkqaX4HzA6mcaHcCOXaw=;
        b=QVFiJB1mFOQ8lW6oo0Iabuu6jjSOPGihVLk3ZQQVEkGenkGRNxDRr4tFf1OuC/EEXP
         sIPG4aBSjQSMJ64TI6VxqM920GBDqjAPT9u4Qm9KXXqktO6eDkxwWvfeP3AkIcMsecef
         Lksde6C3+64i1iNELLoNyRqRuL0mdPO3ws7v8hqjfYaffanjXrpCe4Yu9BI1UYnsIbic
         0oZhEK5fiHWSfTIuKDLOxh1abfWcZmWzcWsjMxzD5mAFqiDUg3jWbgnRaLCPLini709n
         EMnoaZ+rMqauCz7RfTlqufWCXy3ezTKC6A3CzsR6jSOquGDFbUYM6k4IsjplKZTYeEls
         sm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148551; x=1710753351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/Pzv9BlBySoLr2F+FaLoJ1pkqaX4HzA6mcaHcCOXaw=;
        b=knWYm6zJ4d1JlM1K4OqE/K4+14WkxLWSTgJKPt5tfYdP1bAbNEQon8apuEy3y/f00R
         kFXRqvAI9vPwsnMuGaBHPTOerei9BLddeD4pWYReicQeOf03uJSKjpAUCGTeqZPgPYHg
         /3GkjGYxjcRpCvsXURLnVsXJBrLlFysjkXi8pEXSL7WkZxERFV83CJ7m9FJgCQyrlADH
         SJ7OYeAB472disZlG+Ydf0qj3l2iwH/mz7UZOXwlt8Xou0lotjwpFhqBBvmWtNp+EEhY
         xDatAz2LUCDlvXVXkJ03YyQ1kUagTVNBjXQ76NgevQ/WDpQ4sbzCTDEeM4PZw0WgLSU3
         //oA==
X-Forwarded-Encrypted: i=1; AJvYcCWr3vTCI8sB4dkefOfIxazTz2OnOAiliNl2YvJfOOleZAR+IUgzgr4LG0LAXFYDwzUDgs6TEJMUatlUWDX+JoaiCHmZfQ==
X-Gm-Message-State: AOJu0Yz5Ab7FU48YnsiPzpKCgrdFWSENkN+MEkKNCVrcAR8yVtBS8MS2
	rmCbxWgpFYgAzaTJ2eOB4V3mxk59lY9saPsUAto4lq6g+/eBUPzcQ2Sqgxl1j5b4WJ6+tGBvD96
	t
X-Google-Smtp-Source: AGHT+IEGyZagLzVw1J7DJ00cDqj0QWvV6RUMbGYkddWlJVs6be33pGMvZeyV68bqU+LSFVqvXq9Ltg==
X-Received: by 2002:a17:906:16cc:b0:a45:f862:82e7 with SMTP id t12-20020a17090616cc00b00a45f86282e7mr3464084ejd.23.1710148551456;
        Mon, 11 Mar 2024 02:15:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:46 +0100
Subject: [PATCH v3 9/9] ARM: KCFI: Allow permissive CFI mode
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-9-224a0f0a45c2@linaro.org>
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This registers a breakpoint handler for the new breakpoint type
(0x03) inserted by LLVM CLANG for CFI breakpoints.

If we are in permissive mode, just print a backtrace and continue.

Example with CONFIG_CFI_PERMISSIVE enabled:

> echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
lkdtm: Performing direct entry CFI_FORWARD_PROTO
lkdtm: Calling matched prototype ...
lkdtm: Calling mismatched prototype ...
CFI failure at lkdtm_indirect_call+0x40/0x4c (target: 0x0; expected type: 0x00000000)
WARNING: CPU: 1 PID: 112 at lkdtm_indirect_call+0x40/0x4c
CPU: 1 PID: 112 Comm: sh Not tainted 6.8.0-rc1+ #150
Hardware name: ARM-Versatile Express
(...)
lkdtm: FAIL: survived mismatched prototype function call!
lkdtm: Unexpected! This kernel (6.8.0-rc1+ armv7l) was built with CONFIG_CFI_CLANG=y

As you can see the LKDTM test fails, but I expect that this would be
expected behaviour in the permissive mode.

We are currently not implementing target and type for the CFI
breakpoint as this requires additional operand bundling compiler
extensions.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/hw_breakpoint.h |  1 +
 arch/arm/kernel/hw_breakpoint.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm/include/asm/hw_breakpoint.h b/arch/arm/include/asm/hw_breakpoint.h
index 62358d3ca0a8..e7f9961c53b2 100644
--- a/arch/arm/include/asm/hw_breakpoint.h
+++ b/arch/arm/include/asm/hw_breakpoint.h
@@ -84,6 +84,7 @@ static inline void decode_ctrl_reg(u32 reg,
 #define ARM_DSCR_MOE(x)			((x >> 2) & 0xf)
 #define ARM_ENTRY_BREAKPOINT		0x1
 #define ARM_ENTRY_ASYNC_WATCHPOINT	0x2
+#define ARM_ENTRY_CFI_BREAKPOINT	0x3
 #define ARM_ENTRY_SYNC_WATCHPOINT	0xa
 
 /* DSCR monitor/halting bits. */
diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpoint.c
index dc0fb7a81371..61a984b83bfe 100644
--- a/arch/arm/kernel/hw_breakpoint.c
+++ b/arch/arm/kernel/hw_breakpoint.c
@@ -17,6 +17,7 @@
 #include <linux/perf_event.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/smp.h>
+#include <linux/cfi.h>
 #include <linux/cpu_pm.h>
 #include <linux/coresight.h>
 
@@ -903,6 +904,32 @@ static void breakpoint_handler(unsigned long unknown, struct pt_regs *regs)
 	watchpoint_single_step_handler(addr);
 }
 
+#ifdef CONFIG_CFI_CLANG
+static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
+{
+	/* TODO: implementing target and type requires compiler work */
+	unsigned long target = 0;
+	u32 type = 0;
+
+	switch (report_cfi_failure(regs, instruction_pointer(regs), &target, type)) {
+	case BUG_TRAP_TYPE_BUG:
+		die("Oops - CFI", regs, 0);
+		break;
+	case BUG_TRAP_TYPE_WARN:
+		/* Skip the breaking instruction */
+		instruction_pointer(regs) += 4;
+		break;
+	default:
+		pr_crit("Unknown CFI error\n");
+		break;
+	}
+}
+#else
+static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
+{
+}
+#endif
+
 /*
  * Called from either the Data Abort Handler [watchpoint] or the
  * Prefetch Abort Handler [breakpoint] with interrupts disabled.
@@ -932,6 +959,9 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
 	case ARM_ENTRY_SYNC_WATCHPOINT:
 		watchpoint_handler(addr, fsr, regs);
 		break;
+	case ARM_ENTRY_CFI_BREAKPOINT:
+		hw_breakpoint_cfi_handler(regs);
+		break;
 	default:
 		ret = 1; /* Unhandled fault. */
 	}

-- 
2.34.1

