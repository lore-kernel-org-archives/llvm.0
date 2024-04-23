Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E7045BE1
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856804; cv=none; b=PGq8kRvV7UfQMTG+9hHEoDFgwqfu0I7jERiVC9xOC6vgCUayZgfn5Ldstu40ssV8PbDzVlYpyRPCaR0DaVCqBBXe5IRj6Ks27dXXZx0fjhL95vkHq1i4y7n4PPctk/U9jAmAAvNfJO8sVgNX2AEhoXDvJCC7RXAwY4fOhEPmWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856804; c=relaxed/simple;
	bh=L54i9nfv5SUn84gXIhqXpKaKYkDMUeeo33DdXw22gE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0TfNjhnV2h2ypEKHe8Bmg9jcAGADCwp8cghyhsOUA3qen/ymBhSL++QOaLbxi0XJEpBHZU3lu0z/BMb4sCWon38jBDqVG6VTcHI1QgMjFSxCgXyEyKq8xVf6hiyPeJCwihClaMBJB6gmSDrkj8d6oVjgFyn+oNxuzyKSvL0SWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ql4c2c2X; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ql4c2c2X"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51acc258075so4270444e87.2
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713856801; x=1714461601; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEaq9SGzxbPplR8nEICVbUXm/NCQhT37jHOvTkselIQ=;
        b=Ql4c2c2XOB4Ixa5CizVCOsaH6ceCwFm3srRlkGhrOVrP8H5Mws5yvzOwU5V/ZeQIbp
         8UNHCYDDQfsf8SNuB8sitFFzwtWaUKAKk6+pk4HsJrSwQ3PRexCHsdFBFbbbFJDHgQ0E
         2PqTXhD3gkKS2NcGBVHZztv460r21TiiNYz+p15A8il99+jWp6ZKGVQpE8LL0XLQpjiG
         3hQaJJOiGOhOsc0/ZT8Po5gxCpeNprv8hvqPW8qQXU4gO8qYrR0hnkvGGikghf3VyoEq
         Y3nedzUQG6Xa/tB6q0gVeNDg71+yudocUHpWZEf96deptKtaOQSFnhtRbsY6kCbE8BDo
         JZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713856801; x=1714461601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEaq9SGzxbPplR8nEICVbUXm/NCQhT37jHOvTkselIQ=;
        b=cDs3yL3XrILnNjZV1YPQtitM/Z5kYpUPQ4BxaJbVm7lHQ/DZ1fwTqR4YXv9XcnVqAy
         oGnFCRFfyjvFh0+L/pTrPXKrz9Py3n04bmd7pJDDDWgKRDHb+PYqajw2qWN812+dYyj/
         HwWO+6vh5ApnKikvsP/mKJciQEyz16RXrwXEkTv6FFLrzvSyx1uPHrQod4s9deYWqj6y
         pxbl7GqiCO49bpz3GT2zSVT0puuwJw4S6aqmMIfaf9ahrxJpJrd3fuu7Jj3q8aYVtH1Q
         YKFhpN0a6fomtq5UAWKQqo3BVVFPaCnROVIn8oLnpnLCttompZlKJijJDjNq6TngUBLL
         uTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrl9OpKj/2QCu0PAHfnWugKsajmjtXaa5MLa77MnuUwGWQETttiwvEPAnVdghiMKXaPKpLub/r3TbXUiE4msYgGsgZJQ==
X-Gm-Message-State: AOJu0YymmtZaFeTXdvOGbQIDU7E2S9QMPzEaJhDXKKDsyc2NoV7ESaVg
	qYNHG8iOywjkHKUXh9iwWOeK8jaFH+F1kf9j2X1KvSu/jz9Y/Nm/WzEze6pB+xs=
X-Google-Smtp-Source: AGHT+IEUT+y9DuLk4pU+d37dLDAv3/RRXytsF5kt3AAIQjybHNrAiKtVUdBNMLUMWoEDrQM7FDt6hQ==
X-Received: by 2002:ac2:4ed0:0:b0:518:9950:9079 with SMTP id p16-20020ac24ed0000000b0051899509079mr6814997lfr.2.1713856801479;
        Tue, 23 Apr 2024 00:20:01 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f13-20020a056512360d00b0051ad4552454sm1307588lfs.148.2024.04.23.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:19:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 09:19:54 +0200
Subject: [PATCH v8 8/9] ARM: hw_breakpoint: Handle CFI breakpoints
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-arm32-cfi-v8-8-08f10f5d9297@linaro.org>
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
In-Reply-To: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

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

CPUs without breakpoint support cannot handle breakpoints naturally,
in these cases the permissive mode will not work, CFI will fall over
on an undefined instruction:

Internal error: Oops - undefined instruction: 0 [#1] PREEMPT ARM
CPU: 0 PID: 186 Comm: ash Tainted: G        W          6.9.0-rc1+ #7
Hardware name: Gemini (Device Tree)
PC is at lkdtm_indirect_call+0x38/0x4c
LR is at lkdtm_CFI_FORWARD_PROTO+0x30/0x6c

This is reasonable I think: it's the best CFI can do to ascertain
the the control flow is not broken on these CPUs.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/hw_breakpoint.h |  1 +
 arch/arm/kernel/hw_breakpoint.c      | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

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
index dc0fb7a81371..93f9034e4e72 100644
--- a/arch/arm/kernel/hw_breakpoint.c
+++ b/arch/arm/kernel/hw_breakpoint.c
@@ -17,6 +17,7 @@
 #include <linux/perf_event.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/smp.h>
+#include <linux/cfi.h>
 #include <linux/cpu_pm.h>
 #include <linux/coresight.h>
 
@@ -903,6 +904,37 @@ static void breakpoint_handler(unsigned long unknown, struct pt_regs *regs)
 	watchpoint_single_step_handler(addr);
 }
 
+#ifdef CONFIG_CFI_CLANG
+static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
+{
+	/*
+	 * TODO: implementing target and type to pass to CFI using the more
+	 * elaborate report_cfi_failure() requires compiler work. To be able
+	 * to properly extract target information the compiler needs to
+	 * emit a stable instructions sequence for the CFI checks so we can
+	 * decode the instructions preceding the trap and figure out which
+	 * registers were used.
+	 */
+
+	switch (report_cfi_failure_noaddr(regs, instruction_pointer(regs))) {
+	case BUG_TRAP_TYPE_BUG:
+		die("Oops - CFI", regs, 0);
+		break;
+	case BUG_TRAP_TYPE_WARN:
+		/* Skip the breaking instruction */
+		instruction_pointer(regs) += 4;
+		break;
+	default:
+		die("Unknown CFI error", regs, 0);
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
@@ -932,6 +964,9 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
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
2.44.0

