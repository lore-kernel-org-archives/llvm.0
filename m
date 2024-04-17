Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208C139F
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342675; cv=none; b=vC9DL9S34YUFWTsJ5wor1rVoozhXxfZYrN02c0YnpTzWzTumwnFFdTT4DX1DF9evUVc3uktKYmXi4i13+AsIMCn0NDTTfsfyqxU3cMvdT/uYpkvrlPtxDzdUxo8T9GrGQG5Z3wAPzxIQYQID1B1tNQOALFX1ZVxJci6YgIMk6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342675; c=relaxed/simple;
	bh=DjhqN6uLLmaO0gK4cFxXLWasuDQpZ92MoMZriVngnew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmX5SXNaCYkBLqZfeHLIgnsfrUJXDTePeUuNnbSFfs3WhVN89DDDIJn+xTHxBdQZBj54lE1X5RX0KM95uFj2YN3aFQqJAGX0Sae2i8hbCoQ6Wfp3iY+G+1ObwxxAMSQXWQGI93/Ns6GJ0SLsZjF/ZRRY/GwH9xevrekxd7QYIyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yOA3lvI/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yOA3lvI/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso6348613e87.2
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342671; x=1713947471; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwkkSUi1b63q//pF6FQeQvdmd+qn9ODc8sgiig3GYAI=;
        b=yOA3lvI/kxkG2XRXFqu8DtKqpdHnovXE+jxPqaGiqdB+WVPvt5PhtITZaJnkdBza5v
         +RGyRBz50DewkjT93IBD1XRruXDVkK/SsDxD/Zn8eCt3xovmY0DP/5ToPrIA9Gtf6/oQ
         i1f9oVFTwHhQR8Y4Of9j16NmvamWxYRYAHPscg13USIxL7zg8lJOGjDPy68a9sEsNXFo
         qifnG8+VxD787AjeOPU0CjhB97LpmdB0n6jgzg8zw6cUCfPg8HmXw8GKplTXu3MDwlvy
         oKfm4tyxvwrOmzj1mMQ5hlN1FAFkV//PO1p++RRuhfKKvXT0pcoj+C4kJdVOpjB7ecIW
         armw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342671; x=1713947471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwkkSUi1b63q//pF6FQeQvdmd+qn9ODc8sgiig3GYAI=;
        b=kA6OJBBX65zBMwcSZLH5MMuCFDk0zGt6zT08slZ615dfoc85Y1Hal58uWPI+Pqvkrf
         CSLx3tPIjSDLbykzV96olILZ7WA+unQTNa1+5t7J6sbZ4gs6e+3cB9Vkud5Ioef/O+U2
         G/eHQt/HR2A3GphhwlXBxaooXTItnNw1o3Y9KM5vwzPKhmYR6B3LJxOY/BNDaG9HR6uj
         gA/gQtOFkV8GLFtqbgkd3WrUZIZxmK8JBeWvu2AmO6d2eedm54rzFhyVdcwBBXUtd8Ek
         RVF+mA9YSwmdU/Zq8akFloOetFZxMEbNCMugXDQX9KhjkmqH2e8OzZ3/0VBQhvo1CKwu
         s9mw==
X-Forwarded-Encrypted: i=1; AJvYcCXys6vprZXUj1vYlHE1d5JhhNUMapDIAQLYMePTSFydzkb8ZXszR2XCq1hYv09qmYV0o/ZM9tIuiZjr1pvxD621DTfMHQ==
X-Gm-Message-State: AOJu0YxdOZEqsLNn1Xp2ihzSBZLELe+N4pSiniD825zU5L77exEwvNaI
	UXENjDJpkyvr0xsBFuepyrqyMQuzvBbp0yRweENFtF3TYFPgaCvOLv6qkyBA2EQ=
X-Google-Smtp-Source: AGHT+IGr9O5BADfALuCrm8PgEkRaX6wyHRxFeFfamSkMxNmouBFAbLin2v4slwtR3yl475frxdmYYQ==
X-Received: by 2002:a19:5f1e:0:b0:516:a686:8ae1 with SMTP id t30-20020a195f1e000000b00516a6868ae1mr11893073lfb.62.1713342671638;
        Wed, 17 Apr 2024 01:31:11 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:31:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:30:59 +0200
Subject: [PATCH v6 10/11] ARM: hw_breakpoint: Handle CFI breakpoints
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-10-6486385eb136@linaro.org>
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
In-Reply-To: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
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

