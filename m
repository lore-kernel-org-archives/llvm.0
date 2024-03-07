Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D8C12E1DF
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821326; cv=none; b=jzrIs0gSgxeLGDkWghWCk6b6tKQmtmymJc6hxR8r6zbjQCAbHJrWLhhxLXAbEZmWyJmXidbiQTWYa5U15mMuRq7K2+y7R5Po6i7n1jwSkpMKyCiYP66r7IH3JLIgZLbVrV6ygR6ZV1rRzYTk5GUKgsow2J5YLKFSO/xcjvSLv2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821326; c=relaxed/simple;
	bh=jWbGNhR37CRTt30kA440EgtSz4WSH6RujSP+QTY2kB0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NWE7QEnQnaubKTIFycSAeDWu100cCvfi9ZKn3ec/Mho6kySE577Jw+7r9QyC/ho9LO43LIs39Paq60KskrJ+I2s+kAAklomIAKqWsZSK30jK+rsn6OB+i39X3piludF6T2EEjkuSlzHv2bJFDp57bx2Wa/uYnWOjljN7grjNMkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oooSPNLx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oooSPNLx"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51325c38d10so1984009e87.1
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821322; x=1710426122; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jx4pJnE0OFqhByQQjkjVyUA5Mjqu+E6fiE//RYk7/k8=;
        b=oooSPNLxukb3IKwHdSiXc4KSVBwZZ5FPiYAGVbKBtQ6TA1nqkeWT+vH9hJmMrzPJDT
         XXbyX0XjGY/NaPW+ILWBJN9fNjGtnBuoDjohuBj5ujIx/XLQKtEtQbGKEcgVT+fnwPTK
         45kG2waKzmumQ3j1+0US9MvPEjpmHh4h01vmlSyOerJ19gkyI1UAP8/0XIGCPnTtB+cN
         PX73m5ab9FA+qod5ocvJ23Tj/Rt9T5TuDeKPC8xjETzeOoK7USiLFHrMpNOINODN9HQW
         cQrp8qwrgzUL/4d6ulbfcQ5YDza5eNj67n7urGz3juni8vEvKTCeRLNO4fausSrXzD1f
         e59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821322; x=1710426122;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jx4pJnE0OFqhByQQjkjVyUA5Mjqu+E6fiE//RYk7/k8=;
        b=Iq3PeyQPjThWIqE/HXZJXXUiXndLpN3XVWagDzw55UIMBZUotqqV0a+Wrfy9b9nk0F
         vBrypmnfX8eKTC3tErDrsNRA77EiN1+um09L02BqBSvZBtTNO4rWeRXdI39Opb8t0xu0
         cYjB6jfd849mgtpMWD8FPmF3TiY6mAeLC1aQsl4aKGrY/31XuzytbffkzU/umVhOQZtw
         oTCqKUR3SNJRwZx+H+9WVMKk8zfmltRIiGHEgOXI7iWaG1bQu7OxSp5CNdWTXBm0L4kT
         P+PXePeONuTIR0/0rXZT3mqJ80qw6fJrrtRnD6JmJwWp5E2+yeAPlkoF/hiYFT6kn/hJ
         SCeA==
X-Forwarded-Encrypted: i=1; AJvYcCUQF0rRDeR8hTYcr04nLHufQ7KKbXcCFQi+3LDBj9r5Vp3Hyog93ugcjbefxywHmmI7LUiH29NIz/lH1Hu4liBBqdB0hA==
X-Gm-Message-State: AOJu0Yy+wLCrOJltOIuRHvNsTGOPllIGv55Tr4e8egSQWYdT2GYRRT1s
	65r4zTgATXufBC6qOdL5QWWkSsrrB+dwxBdo9j+1/pUMp2FVAsiPmu7C/oH49j4=
X-Google-Smtp-Source: AGHT+IGRUd41bzjeQSbyrn9M4BvN7pY2mlXcHVsGjPReNPbksblrD6trgj0XMRlKH/iXwXT+9OxXEg==
X-Received: by 2002:a05:6512:605:b0:513:19ce:cbde with SMTP id b5-20020a056512060500b0051319cecbdemr151003lfe.22.1709821321983;
        Thu, 07 Mar 2024 06:22:01 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:01 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/9] CFI for ARM32 using LLVM
Date: Thu, 07 Mar 2024 15:21:59 +0100
Message-Id: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfN6WUC/03MQQ6CMBCF4auQWTtmOkCjrryHYYHQwiTamqkhG
 tK7W3Hj8n95+VZITsUlOFUrqFskSQwleFfBMPdhcihjaWDihoxpsdd7zTh4QduOljyXlQ5Q/g9
 1Xl6bdelKz5KeUd8bvZjv+lOY/5XFIKE9NnVN1pNtr+ebhF7jPuoEXc75AzkAT6ijAAAA
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This is a first patch set to support CLANG CFI (Control Flow
Integrity) on ARM32.

For information about what CFI is, see:
https://clang.llvm.org/docs/ControlFlowIntegrity.html

For the kernel KCFI flavor, see:
https://lwn.net/Articles/898040/

The base changes required to bring up KCFI on ARM32 was mostly
related to the use of custom vtables in the kernel, combined
with defines to call into these vtable members directly from
sites where they are used.

The approach to all of these vtable+define issues has been
the same: instead of a define, wrap the call in a static inline
function that explicitly calls the vtable member.

The permissive mode handles the new breakpoint type (0x03) that
LLVM CLANG is defining.

To runtime-test the patches:
- Enable CONFIG_LKDTM
- echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT

The patch set has been booted to userspace on the following
test platforms:

- Arm Versatile (QEMU)
- Arm Versatile Express (QEMU)
- multi_v7 booted on Versatile Express (QEMU)
- Footbridge Netwinder (SA110 ARMv4)
- Ux500 (ARMv7 SMP)

I am not saying there will not be corner cases that we need
to fix in addition to this, but it is enough to get started.
Looking at what was fixed for arm64 I am a bit weary that
e.g. BPF might need something to trampoline properly.

But hopefullt people can get to testing it and help me fix
remaining issues before the final version, or we can fix it
in-tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Add the missing ftrace graph tracer stub.
- Enable permissive mode using a breakpoint handler.
- Link to v1: https://lore.kernel.org/r/20240225-arm32-cfi-v1-0-6943306f065b@linaro.org

---
Linus Walleij (9):
      ARM: Support CLANG CFI
      ARM: tlbflush: Make TLB flushes into static inlines
      ARM: bugs: Check in the vtable instead of defined aliases
      ARM: proc: Use inlines instead of defines
      ARM: delay: Turn delay functions into static inlines
      ARM: turn CPU cache flush functions into static inlines
      ARM: page: Turn highpage accesses into static inlines
      ARM: ftrace: Define ftrace_stub_graph
      ARM: KCFI: Allow permissive CFI mode

 arch/arm/Kconfig                     |  1 +
 arch/arm/common/mcpm_entry.c         | 10 ++-----
 arch/arm/include/asm/cacheflush.h    | 45 ++++++++++++++++++++++------
 arch/arm/include/asm/delay.h         | 16 ++++++++--
 arch/arm/include/asm/hw_breakpoint.h |  1 +
 arch/arm/include/asm/page.h          | 36 ++++++++++++++++++-----
 arch/arm/include/asm/proc-fns.h      | 57 +++++++++++++++++++++++++++++-------
 arch/arm/include/asm/tlbflush.h      | 18 ++++++++----
 arch/arm/kernel/bugs.c               |  2 +-
 arch/arm/kernel/entry-ftrace.S       |  4 +++
 arch/arm/kernel/hw_breakpoint.c      | 10 +++++++
 arch/arm/mach-sunxi/mc_smp.c         |  7 +----
 arch/arm/mm/dma.h                    | 28 ++++++++++++++----
 arch/arm/mm/proc-syms.c              |  7 +----
 arch/arm/mm/proc-v7-bugs.c           |  4 +--
 15 files changed, 182 insertions(+), 64 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240115-arm32-cfi-65d60f201108

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

