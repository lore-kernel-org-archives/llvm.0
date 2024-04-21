Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B553CF65
	for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 18:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724122; cv=none; b=cBt4GhsSPTePNzcIpDlpVAoPR3zxUl8UsPApsKXP9dJOKf7g2z9uvdUigjR2Tb4V4oImGMAv3QMR30bO68DvXBZDBMF3Nk5Lr5Jp5U3k5xJa81RC6VUbfT6gDQL+h/4pwctyQViTulSs0HKdkr1ypcNjyxL80mQDZQp6X6wVV3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724122; c=relaxed/simple;
	bh=80D3SGRHu2UTmEwekFyvQYhGjk7Bf/Rx+tznY/8NjNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StYRp7VqCVJyAxpukfOgDQj7MYCp0Q0ZmrguDGQPzGZWXNWg2nEKEQsvZPl0U/EZDz4kYccHBXAUnrcZyBtPI2/1TNGhtEMPug4pZ0pXkRqRUMQIpiOYmHLxOfzpnOPssQE5kePAW16CLp4QZ/wB1kyJuavw7czj5BN40HDIs40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nu7EPSXM; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nu7EPSXM"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2dd6c1657d9so5201361fa.1
        for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 11:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713724119; x=1714328919; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecw0uWRNm3i8fpJCtFnOl72Sdbbv98c8IiHQj1PGVlc=;
        b=Nu7EPSXMGZjYzObW9wkM6OwU7gWRjw8JMvGXkMZeX0LIEs4cQZbO2ZBpZJuITOMSo6
         QrruRMKn147fJX5pCRzWzDE8LQt4/WuHFSpajgDnEHdc2bCpxsUiactLDKGJWzKLdk+n
         28T4eQ0s33z7R3o14q+krbYaAp3qUi38+pY5WVgmqpaIRE31BD9d7KlrBP1qv7SAqSUb
         wDvI5QcqeFgcYbA2mFj8vugLMJZVYkzF5yVTOeL8uS/AYDHDlgkZ+rWRcWuZUlueRXKx
         szrhJlTlFmteLJyaDEq0rx96NY11lZ4evuBDz/qCDGCBUY5EjVv384XP+9TRPOoI5nsR
         bEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724119; x=1714328919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecw0uWRNm3i8fpJCtFnOl72Sdbbv98c8IiHQj1PGVlc=;
        b=eSu9foki8QWQh84feTSCyfELS52RduI+m0grfnzJYw5P7R9JLThCtVDWt2aCZzP+6H
         1j3KTwMtsRJR13gOfhmjfylGvQae467AKjYYh9HxXOxChOtCon6UPOHnuB0W6YAf2huN
         jErk5RFBSKl29bnd4KMaHHUqOIXuwxJd7riWyjJl65Tx2DOJdgC7jD3mqoP3CJQpn6ap
         qDis3Yb6dlyoET9AjKQaLu/4oeSYlHn4PYWtuNvglTufwniblrSvCe6H8QCd65/+YDQg
         y/K7ifzlGhFS0/cwl6FmKjm7Fq2pKO8t3IkPRF8gE3LflP2bWx0TEUIN6+WRKjAT4xLK
         J52Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlJg+AOOrUkCNNcuSLj/GOU2Yil4tNDJYiV/Oops7WwlfZqioXS8pluG50/g4TsL5X5LHEmsLx1d5im6nOyFNCP4tO5g==
X-Gm-Message-State: AOJu0Yw8BzqypQHs1xI+o4DSDvs+uVHTGkRNbKVUV4oHbvnCMrL9KzOH
	o+LOuJGUtmoOhOuU6JLOI/6fhY7SQLjOBMQTWfcSls4ow+KYwtl3U+qYTQOc8/k=
X-Google-Smtp-Source: AGHT+IFQEQOCTGYb+sj338RlX5DuJLbp/3EO6h8z6/lx8OWssMUSvRxd4tjvA+IzpvfzYdtFnvy/vw==
X-Received: by 2002:ac2:41d6:0:b0:515:a417:334 with SMTP id d22-20020ac241d6000000b00515a4170334mr4597907lfi.46.1713724118796;
        Sun, 21 Apr 2024 11:28:38 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b005188ea5d2b5sm1549641lfc.303.2024.04.21.11.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 11:28:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Apr 2024 20:28:36 +0200
Subject: [PATCH v7 10/11] ARM: hw_breakpoint: Handle CFI breakpoints
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240421-arm32-cfi-v7-10-6e132a948cc8@linaro.org>
References: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
In-Reply-To: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
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

