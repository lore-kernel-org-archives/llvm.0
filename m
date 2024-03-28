Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A002033E
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613973; cv=none; b=dAydwr2eqCF7Mecci7SlKxSd+a/OIZ92cjSyigw7REfk9UFlvVInJW8HXjmGd4KrwzM8A3mbEpvKrRVtm1D3fUfHdytUDEBecUFmhJo5xxdW3lVFd8Ml6ccznDnfXv6YO1tlbIhz+CnsqFiiQb0nWlLB0wt3U8ofURygCId2E0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613973; c=relaxed/simple;
	bh=mnauF/BHJfNWiq4JvRxOzebifXXnQu6kwbPELpCHFjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UKFKvgOLLmIRu7sudthboH3rJTTHU7FhwBC8oe+tVEk+/EcI8krh5yuEw2ReyjCyyDjQW9efu/a6UYfnJGXsEOkiDdj6caWTCbl33k9w5GbfcM6W2YwqUeDfuZUoVoSn/X71GN/r31m5ErdI+QaV1/MhFDovyvFchrxAEIH9dGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AkLJAKrY; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AkLJAKrY"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56829f41f81so760236a12.2
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711613969; x=1712218769; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfIN1MzXThe1rBpZb5u/eNS+0QSCH8ZMd5pV/D4hiQg=;
        b=AkLJAKrYhwisrOHy2OKa9uLrnIAgBl4wdFFwCvAnzVClzKTvvqjeKnLTyNLSVLXXXy
         6Jj7jcZvuW4/gYzJ+YuAg+VfSjB9yKyOh/GNqjBqqlzDtTBRW8X4hEPJ/f/1XQP59OoJ
         07MYzgPTMjCrCzgdUOauZZyN6qyOlBBJbAI9cOiAhLOteLApp5116RD+tdcXEM7DJaI7
         Iuv03pldc6bkmg+qFicDByXHwAZMI2jF/VjTtnIwhDaWSEGeZvT4IZNvIDU53JLwFSDr
         JGRlTxjZ5WCJDddHVxVBQgDJ6dAL8w2TB8Yy9LJigqZO+wCzpn45E3KvSNZOlvvYgzGn
         6i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613969; x=1712218769;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfIN1MzXThe1rBpZb5u/eNS+0QSCH8ZMd5pV/D4hiQg=;
        b=MnfLB1JVWkNmOktdJIji77HDYKoQiBW3FKDGLH5WeXMzIXUJqIeGlfkMfLAuSOx+86
         ij47uKWQ7x2NbgCyKUXLY5BpKu0i7XNZbSzsaS4dYKL2yZIQLK3u14V0QDxp147kgaPI
         LWx1hR1j7zgRPkjgNdX9d0/d/ada2Of/jQimqQbVq22DW4iKwwQdBcUdnXSv6qRvZF7x
         jGJlCh5SieHbdoNsOVyUQMbWLAoXfTRz7+xx0H8MdveSmdj1g0StnAF7JkNGcfYbtHw0
         Lg1W//3jNvhZXb32ehVKJ1EX5ANn1tCu6TggVp7ao4un4tH2BWcLa+ynlxIA3p0QgoSZ
         ONcg==
X-Forwarded-Encrypted: i=1; AJvYcCVrXfdr9OCdF4U4DLdWIWWj/FZFU9BtvZK+A1UpPvYfiI/adPrskeyg+jW2t+Bpp8axzVakWwelYnoZq6vIobXIA6lEnw==
X-Gm-Message-State: AOJu0YxM4kDJxg9YMBg2YHTkYz1elC2wLXi4vtJXy6i3pBy9n4oLlqqi
	kwR3Ib15EyFCJcobrRBSN2kxWnOH1o6jCbCRwV3vzd6VUYPZ1DG2lEvTaXeJsEo=
X-Google-Smtp-Source: AGHT+IHWrj2D5MLNF8Z1XXL0AQJm+LgqWkB5W15NNjGu/fwpRKamPdgHbFHU4PgENska/CwdbgdRsw==
X-Received: by 2002:a50:bac4:0:b0:568:180a:284b with SMTP id x62-20020a50bac4000000b00568180a284bmr1457635ede.37.1711613969361;
        Thu, 28 Mar 2024 01:19:29 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id n7-20020a509347000000b0056c24df7a78sm566397eda.5.2024.03.28.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 01:19:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 0/8] CFI for ARM32 using LLVM
Date: Thu, 28 Mar 2024 09:19:23 +0100
Message-Id: <20240328-arm32-cfi-v4-0-a11046139125@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsoBWYC/2XMTQ7CIBCG4asY1mKG4afqynsYF5RCS6LFgCGap
 neX1oUYl9/A804k2ehtIsfNRKLNPvkwliG2G2IGPfaW+q5sgoACGJNUxxtHapynSnYKHJYr7En
 5f4/W+efaOl/KHnx6hPha05kt108Fsa5kRoGqg+AclAMl29PVjzqGXYg9WTIZv5RDU1Ms1JhGW
 F1eVMv/KK8oYzXlhSIKDQ60kAZ/6DzPb0/WpKwZAQAA
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

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

We annotate all assembly calls that are called directly from
C with SYM_TYPED_FUNC_START()/SYM_FUNC_END() so it is easy
to see while reading the assembly that these functions are
called from C and can have CFI prototype information prefixed
to them.

As protype prefix information is just some random bytes, it is
not possible to "fall through" into an assembly function that
is tagged with SYM_TYPED_FUNC_START(): there will be some
binary noise in front of the function so this design pattern
needs to be explicitly avoided at each site where it occurred.

The approach to binding the calls to C is two-fold:

- Either convert the affected vtable struct to C and provide
  per-CPU prototypes for all the calls (done for TLB, cache)
  or:

- Provide prototypes in a special files just for CFI and tag
  all these functions addressable.

The permissive mode handles the new breakpoint type (0x03) that
LLVM CLANG is emitting.

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
- Gemini (FA526)

I am not saying there will not be corner cases that we need
to fix in addition to this, but it is enough to get started.
Looking at what was fixed for arm64 I am a bit weary that
e.g. BPF might need something to trampoline properly.

But hopefullt people can get to testing it and help me fix
remaining issues before the final version, or we can fix it
in-tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v4:
- Rebase on v6.9-rc1
- Use Ard's patch for converting TLB operation vtables to C
- Rewrite the cache vtables in C and use SYM_SYM_TYPED_FUNC in the
  assembly to make CFI work all the way down.
- Instead of tagging all the delay functions as __nocfi get to the
  root cause and annotate the loop delay code with SYM_TYPED_FUNC_START()
  and rewrite it using explicit branches so we get CFI all the way
  down.
- Drop the patch turning highmem page accesses into static inlines:
  this was probably a development artifact since this code does
  a lot of cache and TLB flusing, and that assembly is now properly
  annotated.
- Do not define static inlines tagged __nocfi for all the proc functions,
  instead provide proper C prototypes in a separate CFI-only file
  and make these explicitly addressable.
- Link to v3: https://lore.kernel.org/r/20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org

Changes in v3:
- Use report_cfi_failure() like everyone else in the breakpoint
  handler.
- I think we cannot implement target and type for the report callback
  without operand bundling compiler extensions, so just leaving these as zero.
- Link to v2: https://lore.kernel.org/r/20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org

Changes in v2:
- Add the missing ftrace graph tracer stub.
- Enable permissive mode using a breakpoint handler.
- Link to v1: https://lore.kernel.org/r/20240225-arm32-cfi-v1-0-6943306f065b@linaro.org

---
Ard Biesheuvel (1):
      ARM: mm: Make tlbflush routines CFI safe

Linus Walleij (7):
      ARM: bugs: Check in the vtable instead of defined aliases
      ARM: ftrace: Define ftrace_stub_graph
      ARM: mm: Rewrite cacheflush vtables in CFI safe C
      ARM: mm: Define prototypes for all per-processor calls
      ARM: lib: Annotate loop delay instructions for CFI
      ARM: hw_breakpoint: Handle CFI breakpoints
      ARM: Support CLANG CFI

 arch/arm/Kconfig                     |   1 +
 arch/arm/include/asm/glue-cache.h    |  28 +-
 arch/arm/include/asm/hw_breakpoint.h |   1 +
 arch/arm/kernel/bugs.c               |   2 +-
 arch/arm/kernel/entry-ftrace.S       |   4 +
 arch/arm/kernel/hw_breakpoint.c      |  30 ++
 arch/arm/lib/delay-loop.S            |  16 +-
 arch/arm/mm/Makefile                 |   3 +
 arch/arm/mm/cache-b15-rac.c          |   1 +
 arch/arm/mm/cache-fa.S               |  47 +--
 arch/arm/mm/cache-nop.S              |  57 +--
 arch/arm/mm/cache-v4.S               |  55 +--
 arch/arm/mm/cache-v4wb.S             |  47 ++-
 arch/arm/mm/cache-v4wt.S             |  55 +--
 arch/arm/mm/cache-v6.S               |  49 ++-
 arch/arm/mm/cache-v7.S               |  74 ++--
 arch/arm/mm/cache-v7m.S              |  53 ++-
 arch/arm/mm/cache.c                  | 663 +++++++++++++++++++++++++++++++++++
 arch/arm/mm/proc-arm1020.S           |  69 ++--
 arch/arm/mm/proc-arm1020e.S          |  70 ++--
 arch/arm/mm/proc-arm1022.S           |  69 ++--
 arch/arm/mm/proc-arm1026.S           |  70 ++--
 arch/arm/mm/proc-arm720.S            |  25 +-
 arch/arm/mm/proc-arm740.S            |  26 +-
 arch/arm/mm/proc-arm7tdmi.S          |  34 +-
 arch/arm/mm/proc-arm920.S            |  76 ++--
 arch/arm/mm/proc-arm922.S            |  69 ++--
 arch/arm/mm/proc-arm925.S            |  66 ++--
 arch/arm/mm/proc-arm926.S            |  75 ++--
 arch/arm/mm/proc-arm940.S            |  69 ++--
 arch/arm/mm/proc-arm946.S            |  65 ++--
 arch/arm/mm/proc-arm9tdmi.S          |  26 +-
 arch/arm/mm/proc-fa526.S             |  24 +-
 arch/arm/mm/proc-feroceon.S          | 105 +++---
 arch/arm/mm/proc-macros.S            |  33 --
 arch/arm/mm/proc-mohawk.S            |  74 ++--
 arch/arm/mm/proc-sa110.S             |  23 +-
 arch/arm/mm/proc-sa1100.S            |  31 +-
 arch/arm/mm/proc-v6.S                |  31 +-
 arch/arm/mm/proc-v7-2level.S         |   8 +-
 arch/arm/mm/proc-v7-3level.S         |   8 +-
 arch/arm/mm/proc-v7-bugs.c           |   4 +-
 arch/arm/mm/proc-v7.S                |  66 ++--
 arch/arm/mm/proc-v7m.S               |  41 +--
 arch/arm/mm/proc-xsc3.S              |  75 ++--
 arch/arm/mm/proc-xscale.S            | 127 +++----
 arch/arm/mm/proc.c                   | 500 ++++++++++++++++++++++++++
 arch/arm/mm/tlb-fa.S                 |  12 +-
 arch/arm/mm/tlb-v4.S                 |  15 +-
 arch/arm/mm/tlb-v4wb.S               |  12 +-
 arch/arm/mm/tlb-v4wbi.S              |  12 +-
 arch/arm/mm/tlb-v6.S                 |  12 +-
 arch/arm/mm/tlb-v7.S                 |  14 +-
 arch/arm/mm/tlb.c                    |  84 +++++
 54 files changed, 2334 insertions(+), 972 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240115-arm32-cfi-65d60f201108

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

