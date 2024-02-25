Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18671B7FB
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891695; cv=none; b=C/p+Aa7c1b54h1vm2Tx406BwL9bcW98fhcTnytqegpIRV/y8Wi87inrs44YLTjTERpj9uisiAhrHMKiUZC8c7VvdO3vwmcTLo0FEanKy7JjemVhd3mrG+T2lsNqRhwuGoQw3vuYbyIosUKMvteOXPiftVFlL5WJH4vJFbgcn57M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891695; c=relaxed/simple;
	bh=fIbzcta32PYcSqlrM8buG4mfSyCj10HqAjx7rg7yJTc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=idLycYLXqQxJPvkeK+3Onu0PpeKSdHbJOUT2FXBVeoFjyPoug+tdFP7//t5YUpjJDfdG4wayep0QokNVe3wDJujCKlin26bauphGUTKjfVUttp35g6az6fHxH6IhVI0zLi5MkSx+KJIacvd/c4rrVlNp51t8lP1i2jicjFCfPYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B7lGxAvW; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B7lGxAvW"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512fce83ab5so331358e87.1
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708891692; x=1709496492; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kdgswNINe8D7UhAB4MlI11h/GUVjtAIO48m75I1MuQU=;
        b=B7lGxAvWFenuovi7vLU7pEQg612HHyMHyxR71UewYjlCar9HjW/CTXPYTAD0Vb8XAY
         Me1e1itiGXEJye55mcLoJSoCfW/W3DYQfCo4PYU4lhteWUJmY2A2R79ofZZU9wVgChw4
         av9xMppAlcobujGEd5J8OYrkYZQU8RFgnIaC1R9DrutZaIxGIWo5YtGMlb5URr2CCwMe
         CY78+Qu16iCW5p9kgFcMs89cfKeTz6qrq8dIGNcXtFHDrsZlMk+O29wLny1c6uc+Dr5l
         9FeMUy+DLzqw3Git558DiotMBBKtUkrxipGJdKDF7N5tCGgkiBFjf3EvcQljEWYhGNXT
         fOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708891692; x=1709496492;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdgswNINe8D7UhAB4MlI11h/GUVjtAIO48m75I1MuQU=;
        b=aZON3yhiiUAApiBn7kXHfnkANtw9r8KlUbid7hroMLidKnPvOyvf8PzE95WpU+e1xZ
         3g3i5G7o49BkERtY9CPOcFltp4Ol8ckq4aPl8wsXOjSkGL7WDaDt8MNDnjt/VGAqegGV
         fR9SGPRC5s/2SjGHc4YC7dqkgB2Y/uHCeeDkQ7nCzJ2X3wGldNjuteG7UbH18GBEDTC9
         EdeDd1oWPIZ6USQOQVYNpoaqKTZQtNNjPrVN9gtbUqV45DYCakC5q+7wGTJ81Bt5Dzch
         MLOxCVMGAqfqYJs0GOn1xoaa1nncl7Ik3/aBeDBV5pyA4bLAsmRWXwIvxHqF3EpSHNFT
         zeTw==
X-Forwarded-Encrypted: i=1; AJvYcCUcfvTYrYIiJnxz3PWXLMLzUro67X+83cvz1Y6Aj75FN9iO0ABsDD7fGSOupr4nEFwpJciVt0AzNOTlnaeiyZgF/Wx2jw==
X-Gm-Message-State: AOJu0YzxaGqHRWjTI9nz6Fw2nCTZglLrLDLAhcmpJOus/OoFDkjvh8gK
	WvdAVjjXJBX16jqmYnOXX8RXWa9l6zaUg8/5hfp7LTLit2+WQNjb5dxD9dEEoNU=
X-Google-Smtp-Source: AGHT+IFI3WQVDHHOsdSKqLYvBkXxkauqFmQkLx+wLi8iF8mvFCixCLIou+n2msNKnvcPc0Rb1WlCCg==
X-Received: by 2002:a05:6512:2314:b0:512:e394:bfb1 with SMTP id o20-20020a056512231400b00512e394bfb1mr3814866lfu.43.1708891691565;
        Sun, 25 Feb 2024 12:08:11 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b00a4340138ab5sm504621ejc.5.2024.02.25.12.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:08:11 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/7] CFI for ARM32 using LLVM
Date: Sun, 25 Feb 2024 21:08:09 +0100
Message-Id: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACme22UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQ0NT3cSiXGMj3eS0TF0z0xQzgzQjoKiBhRJQfUFRalpmBdis6NjaWgC
 sQ/S3WwAAAA==
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
Linus Walleij (7):
      ARM: Support CLANG CFI
      ARM: tlbflush: Make TLB flushes into static inlines
      ARM: bugs: Check in the vtable instead of defined aliases
      ARM: proc: Use inlines instead of defines
      ARM: delay: Turn delay functions into static inlines
      ARM: turn CPU cache flush functions into static inlines
      ARM: page: Turn highpage accesses into static inlines

 arch/arm/Kconfig                  |  1 +
 arch/arm/common/mcpm_entry.c      | 10 ++-----
 arch/arm/include/asm/cacheflush.h | 45 ++++++++++++++++++++++++-------
 arch/arm/include/asm/delay.h      | 16 ++++++++---
 arch/arm/include/asm/page.h       | 36 ++++++++++++++++++++-----
 arch/arm/include/asm/proc-fns.h   | 57 ++++++++++++++++++++++++++++++++-------
 arch/arm/include/asm/tlbflush.h   | 18 ++++++++-----
 arch/arm/kernel/bugs.c            |  2 +-
 arch/arm/mach-sunxi/mc_smp.c      |  7 +----
 arch/arm/mm/dma.h                 | 28 ++++++++++++++-----
 arch/arm/mm/proc-syms.c           |  7 +----
 arch/arm/mm/proc-v7-bugs.c        |  4 +--
 12 files changed, 167 insertions(+), 64 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240115-arm32-cfi-65d60f201108

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

