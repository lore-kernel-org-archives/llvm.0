Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254112C80A
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821338; cv=none; b=DqzuRw8+jp7IoCvzUGvigeiKYd6OHZLkSBKdlVaJzuq2LCC4ScKef/b7LW/HKeKSVOmqr+rT/VX5eZP65/mGfGqtKmuXkamwYXZx5JqkQh2q7RR4SlSNRCPYfvfO20HxBAdVkQiUUbV9zRhG3a0E5LLaSs+Hskyxz3Zb791Oo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821338; c=relaxed/simple;
	bh=F66H3GtO1vPo4dQ+jNE2W9m971kNiLoxFo7yvvrYRxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTJhjYkm1gRETCaKzfkexSctUND6entE26xckZL00ej3YGBKsynFv1e7BMJGExOHA1IehoBDnS5xTHafPCrnlDvEhkwqSl0cmXnSjuQvh15k9/rtvga0GagCTBmOF2qzQQfZCycpANUZtk8UHpCeuqxGIkxvnUPSFibN/csyEa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+8HhZxF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+8HhZxF"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51320ca689aso972411e87.2
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821335; x=1710426135; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gA8ZxFrx9Z5SRPo+jVn81u04sn9IDPwgcfATkPUWIfU=;
        b=K+8HhZxFl8BQgWlMD716YVT3Yvlm83nysO4Lz7u1xBnh8CEfh/ASCxEkzkayxl+994
         cK6IgjEyoHQ4NxeI5Fl5YZbI/Nkq0t3xS0aSKT9yB5Eetw12w0gsJ76ltj4oxcZYId1F
         cnzVsouILCVyFX1BpP4MFwA4SHNll8vdt/sLEDbS202OJNpyTdWhjvc6WgMVZSf8q77X
         y751SCiESPyg7YYzdAAxt/Vkmws6MoMXMtqVTen0eVcIm+61s3Uf16JnUTsWzekIrHNm
         iplquv/ghNrT6AGRJ330XjN7OP/0UDOK272w6t2PvWZXXR5fS65kDlziaf++zDo4E6XC
         yazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821335; x=1710426135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gA8ZxFrx9Z5SRPo+jVn81u04sn9IDPwgcfATkPUWIfU=;
        b=e7+QgVN9JJtC9X+9BqgbAt4LaY+p4t8vRLzT6G0j4dw8VnNAJu56S19wm5XuR9CpEm
         iGG3rrNnHQAXE3aTnOBf2Mkh5jO7fQQGeEfvgdvnnGfAkloP3vRTnqfC9vQCUlD1liMt
         yduYIsWP30kvRijmj3EABqNJB/9kLEbcgk9bRIssiUvgi4DPJaXGU9BuA+eGeCDJne+N
         XxHz2KD4VQh5/gLWcuR6kMvT1OEXuULM7O8+4eYSE7jh2+/GTkgxR+oHwZ2+E0YgWXPj
         NFXU9lIs1P4MntoArNdGf4z1wERZDBzR0QQyHsab63zOSnmIYG7zOxCeUOYSnX/REzot
         06Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVL3eJXCgD2F5GfUVfErbLmSw4HQIw4HqyRji+Wlu4s1VPGlqKCJIypi3LdXXYw5k9AYgxVjhtXdXtcA0yYmoobI7pVDw==
X-Gm-Message-State: AOJu0YxjKiZ5FSMiWLBTFWL6ipbifpsVk2oXoiPmSqkChCKP3wliJKdj
	Tq2QGiFDZwkldFGdCK2pjDmmZ2MW0iXQ/+Fz6lMUYQ0Qv8MRNLfONZgEacExktQ=
X-Google-Smtp-Source: AGHT+IFJ0RWu6nZugPa5qOJDHSREvOJkqmv9RWJNmGCystSvavUS9gLkmUCT0/awji5M89TB64nTNw==
X-Received: by 2002:a05:6512:2216:b0:513:4a0c:b83d with SMTP id h22-20020a056512221600b005134a0cb83dmr1652946lfu.46.1709821335171;
        Thu, 07 Mar 2024 06:22:15 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:08 +0100
Subject: [PATCH v2 9/9] ARM: KCFI: Allow permissive CFI mode
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-9-cc74ea0306b3@linaro.org>
References: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
In-Reply-To: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
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

root@Vexpress:/ echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
lkdtm: Performing direct entry CFI_FORWARD_PROTO
lkdtm: Calling matched prototype ...
lkdtm: Calling mismatched prototype ...
hw-breakpoint: Permissive CFI breakpoint
CPU: 0 PID: 114 Comm: sh Not tainted 6.8.0-rc1+ #111
Hardware name: ARM-Versatile Express
 unwind_backtrace from show_stack+0x28/0x30
 (...)
lkdtm: FAIL: survived mismatched prototype function call!
lkdtm: Unexpected! This kernel (6.8.0-rc1+ armv7l) was
       built with CONFIG_CFI_CLANG=y

As you can see the LKDTM test fails, but I expect that this would be
expected behaviour in the permissive mode.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/hw_breakpoint.h |  1 +
 arch/arm/kernel/hw_breakpoint.c      | 10 ++++++++++
 2 files changed, 11 insertions(+)

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
index dc0fb7a81371..256146684813 100644
--- a/arch/arm/kernel/hw_breakpoint.c
+++ b/arch/arm/kernel/hw_breakpoint.c
@@ -932,6 +932,16 @@ static int hw_breakpoint_pending(unsigned long addr, unsigned int fsr,
 	case ARM_ENTRY_SYNC_WATCHPOINT:
 		watchpoint_handler(addr, fsr, regs);
 		break;
+	case ARM_ENTRY_CFI_BREAKPOINT:
+		if (IS_ENABLED(CONFIG_CFI_PERMISSIVE)) {
+			pr_err("Permissive CFI breakpoint\n");
+			dump_stack();
+			/* Skip the breaking instruction */
+			instruction_pointer(regs) += 4;
+		} else {
+			die("Oops - CFI", regs, 0);
+		}
+		break;
 	default:
 		ret = 1; /* Unhandled fault. */
 	}

-- 
2.34.1

