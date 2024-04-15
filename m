Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADAA73500
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188628; cv=none; b=MASfedj+1eYeIDX6Soa4vws39Hd5RzkZJ+BKU7g/f3qIsrM1m4cLmfIQpL7s075dU0fHrX/zdMvODtaIAwWL9mAN4JG/zT5ubILq3/RxNbx24NlrLnlwtEWywGd+js9yPlhrq2ViMMMe+IapxUd/ghdu0VCNhJ9zBE/NLkcQybU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188628; c=relaxed/simple;
	bh=DjhqN6uLLmaO0gK4cFxXLWasuDQpZ92MoMZriVngnew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUMkkB0xNTsj7IMRNCF4WUi4sFO2iL3oaRsi7osgGEf5hBvIhMOpZtKCEyuLPROB2KeL/i7JNSRBhRRezvjtANKixJjkfwUvBexDr/9nfdmOkevaajRaDli7bbWuhK/FG5Q/aXUywMHHxhz44CxjQBHzj1frc7r8Pto58FVkJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AV5+iyOI; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AV5+iyOI"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d895138ce6so37883291fa.0
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 06:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713188624; x=1713793424; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwkkSUi1b63q//pF6FQeQvdmd+qn9ODc8sgiig3GYAI=;
        b=AV5+iyOIR3iSqVnD1xNIQ0+mAFfpAPLchaGO7tlBgvg+frsniOHeTVBl2Vl8Wrwwja
         FgqDnuCoZZoxxB11HeirXlx361//7UVgoECBarzvG/xalIVkNIyZcJlEA9SWU9xDUyD6
         SoDwbGC7LoRoCnXIlCGsTm+eVi8yIGhRx+3qBf/fFtoNs8fsO69itilevD9XJraC0db2
         cly8AL7Eu/iO2nVRNImsE9PtI3RjhxcE7Q/wE8O5lYiI/iVaE//2ey+Po7ihsAo8NR0J
         /D2FwGKVKmIV+z7+Q7700pzJyKDUpYFKmNh/UbK+4wRgNrE3jwvSELO7lKOeoWI3C3vF
         MjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188624; x=1713793424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwkkSUi1b63q//pF6FQeQvdmd+qn9ODc8sgiig3GYAI=;
        b=umKK132ra4JIFR29+aAlsVyCGfRLF3TxD60VmuyqTIREfswHMe+LAcWLyfJEIBtZlM
         sGh+7UFZt0iYp52oGwCkN5y5EtjOoYY/fn0czxevzELwO9geOzJ9k1mdYaIbBMdesK1J
         8F2boCnwT8afq8MkNLNq6LqlGiyLwqY2jTObAkU8e9E9IJkATAkqZro/Lf9x17WNMCUh
         ht+TUea2EuAFcOEBDtjphWz/21L25y6HbfcSCgZtN0RNEpP8sMAAycQyNwTjMaBII2aT
         ZILAmBmT40AT36pmaZrwJQS/aiym80fj/vN5er/D1zdEpY0/f3Lk+jofwAfddqaasrF/
         pNEg==
X-Forwarded-Encrypted: i=1; AJvYcCWQkdpZq0tSOR3L3Mnte9CnNPg71tZQNspIpdKvrySX1o841xaUcC/dGEEV/TjLBh//ICGg2RHrXNYxWDHN1qXIqlQ/Hw==
X-Gm-Message-State: AOJu0YxgEiXO1JHYgp5QX4HTV+DxgpfSspYC3WQDbgIXP8+ZQH1vdJUq
	ZkApqIYH42N4oKY1G+2VuzQ/XqR/wQcC4Tulx6JL6UdutdYIvaXAk+tPDH8xF5c=
X-Google-Smtp-Source: AGHT+IHCajOj0FuGEo04PJviti82GD44O7FVKp5cCtY8Jd4x5CQ6Bg6wQtmRbFu2KIZ47oJzjEbhUA==
X-Received: by 2002:a05:651c:231:b0:2d8:36ee:350d with SMTP id z17-20020a05651c023100b002d836ee350dmr6285867ljn.16.1713188624523;
        Mon, 15 Apr 2024 06:43:44 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p11-20020a2eb98b000000b002d43737e2d7sm1297988ljp.30.2024.04.15.06.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Apr 2024 15:43:28 +0200
Subject: [PATCH v5 09/10] ARM: hw_breakpoint: Handle CFI breakpoints
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-arm32-cfi-v5-9-ff11093eeccc@linaro.org>
References: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
In-Reply-To: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
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
index dc0fb7a81371..ce7c152dd6e9 100644
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
2.44.0

