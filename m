Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942C954BDE
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613982; cv=none; b=Gk7BYp6Qg/QtTR7MJpbtwRfUcA7VpJkZpDAy6SqJq4mjdLbplgxsqbjyWMqTB/lYpVDn2e5+19l9Egg0dXumf78vjeu3mX0pAi4W1f8UW05UWibGN8RvYKplL21vebwqVASibk8q0SyrcKQoqitS2py0wDqurv+ERDZojsOdeBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613982; c=relaxed/simple;
	bh=AL/QCBYWKJGY7XP5PfdyARYdf97ROc4rHsNV59u/o0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Auhb4OxN1+0zXah7FaTWxrOjeAM0swz0BNq9OwXTDlXSgm9VURZ9jewa3Oae22K3xQaskXs/tqxKHMwJU8V0wkzR8uz2hSRnyMIrjwDRQiVPiNKmPDQS7mkfCU9v7YNa27VL7qPCYmM6yqSgQ/b5wxgDEEM82dW02OJMPAph7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ou2OAKno; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ou2OAKno"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56c441e66a5so813996a12.0
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711613977; x=1712218777; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dL1PAu5oBmwIibkhRxksxjOxcUl4/h9Sp4T5IgFq6UI=;
        b=ou2OAKnodyrdKd/T7xsJ6s2uKaX9n76FrXMSqHSkaO6vU4cgM4PcWJeF0TyWCCABk9
         HlRDuas4pbXbX/z9+bhTqs6m8IFHjBohKe6XyfQ3Vi0yQOSv91Irsc2p7yz+Uk2EVrcw
         QHs+GzlbU2vHiN2byOJ94sGDyA8XeLuus7AvYqjjALJA+JWTuzZPQYhcHed/IFPIAu9g
         lyKV9khsKKN7+UQNb4O2zE3SNIpw1yml0TJHtEDqFXwr24QtNk0uC0dTwc2FsbHvXsUJ
         pb8UIBPKZRdnXlKIAOPkvItOmPHkaDK8X4ESpdy309Jrxvr5yQMKVzhaOTPEm7ZTyf/5
         djoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613977; x=1712218777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dL1PAu5oBmwIibkhRxksxjOxcUl4/h9Sp4T5IgFq6UI=;
        b=q6hvNDChetU+GIH3mjhMMkYsN9lo8Aea7lz4xJV3ocU6kQYsLGEGzzCSmkpQj65Dcc
         j2BTATTeDndUcT43pJVx7jGNDqCFl6ebFE7RIOyBRX+d6SkjEgCNugZzZqwDU0WLh6zV
         76MNGWJxbj/kVvYjTMtHZebkwxdK2rd6rS6lmBxwo5hi59S5Fg268hO+GKncfWRZ8occ
         MPfYD7jC242wkBbf068EJ/C7r7I+lmyGcOGjTvRH+fkUs/+9byjDEIMYsWo1wTbcx8k1
         HFz/YpFAEdnbCg6TiE38OHbhkBZ6f/yOTyuq6C2Kx2mR5vjU97v1TdyJ+F/IuLhCbEiP
         j/iA==
X-Forwarded-Encrypted: i=1; AJvYcCXTwcy7dojRVz5RTHW3Djd3/Uc3yrMPeFxP+MNXOAOmTa7CqYxWpS8EBOYv+piQaRYq4jR465AUljaNojS1hLURu/ZlMQ==
X-Gm-Message-State: AOJu0Yw6JCYHThzVYE+Uc+bhblQqaFSZE2TGA6Cnrv8F+yX2ESsqkfRA
	XT42UeiHktFuxJsPFmmKmiizS4RTAO7p7T3pQn7jzBJBZY8yVNQ4bNGlPSCcQ0M=
X-Google-Smtp-Source: AGHT+IEgIIeBpOAlEcp0lkFmRLIsdQ22UaTMh5mg6w1wr8y00mRjEjewYrsdslcH95qybKFwSmKZrA==
X-Received: by 2002:a50:f697:0:b0:566:44ca:9f5c with SMTP id d23-20020a50f697000000b0056644ca9f5cmr1650320edn.8.1711613977544;
        Thu, 28 Mar 2024 01:19:37 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b0056c24df7a78sm566397eda.5.2024.03.28.01.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 01:19:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:19:30 +0100
Subject: [PATCH v4 7/8] ARM: hw_breakpoint: Handle CFI breakpoints
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-arm32-cfi-v4-7-a11046139125@linaro.org>
References: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
In-Reply-To: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
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

