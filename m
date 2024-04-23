Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3FC3F8ED
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856794; cv=none; b=jMPHNuGz6ZfpEghdfYJACKnsK6yXeCcQX04q13yvPjjJA47B35pZfagVWlXOXVaU1dScrPMs2e/St7Ec52hAn625ZHRGOzkwL32AXuEpE2JjtY8KdrQw0mXDn0xZfQw2YQS3Y2QhVsmThkbBOwxnL5pzyBuLSshB2F42TD7ROWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856794; c=relaxed/simple;
	bh=1UD27NJ793n3sx7Hivw1UkLh2t7/VNuyf9HbzTWUtvE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gi9yt3j5bEf1ipy+i7TPRpr0FN5WevjuEBf1l/aHFziNtNNjJWN2g3AimeXC8s6VaWeUqxA3uSbfMW5DjnRWA7tM4ZhyvcbsNVl/GMLtJMWA8WG3P41WIAGBQwZwYIbw6OGptvbxckiR17Vnbz09FZ7uedmvP883OUBAN1F7mSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lotu67BF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lotu67BF"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so6890602e87.2
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713856790; x=1714461590; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/646WGmYqvnzTZ+SBFV2qL4kBK/A/ZS4BPL/z5No1A=;
        b=lotu67BFsM76TNs2GR0PJHwzZMFRBJ+47qlfeG1baM0HfdHLHxStWi81up4yUAtmYo
         0E2aVTvnlnf9Vxt+hT9X/UD+Ryoc2ZOoUq2BPrpqxnd8Qqr8iv3X6WH2e5TC1oBkBcU+
         E9/WFpqWFcEOq+ChjvhA4KwiFvpJzvRqkL0o860wXkxpKP5Y6v1fYIpqG5FFwZcZ+cV6
         +hLrJj6PwSTMcsoKs5zaN9F+n5/+Ck+g42qKxKq7+j35+P74Irpsu6chOJ7QSt6xyTlw
         En1bWQIjJPr6jymqOrfxBwE1JEwBrC4MThQuXLXKmFS/Z0n0JqPRYmeg7IqcOxFvc/dB
         ++HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713856790; x=1714461590;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/646WGmYqvnzTZ+SBFV2qL4kBK/A/ZS4BPL/z5No1A=;
        b=OdavrpQWI1O/GqQZ7sy8nStWFh1aR/FqyWVi2cHXAEub2LAWTI4nr7I9P81L3apeWP
         SSYRRHIaWi+JCrCNrUsbXRuUORuHng6USDs+PMV6EixlQfPKLGrqhXeFTNbM1lKQnjYL
         dppRRVw5tb0wKlxY3tATjpPbs/PqonGaH1bLxj4mTgF+C4bU7FkEZSaD4iIR2yo/Zrsm
         Kcqalvfzhla5ddg5dFO38rWTAl67lp5jo6wGYqdIJ/zEBOmBeC1EljRTkhlSMbohMIwm
         JBERpz46odtYdSUB9RDQWhF5LdNlBIdqjkn0N0R4hjQKX6/CQxht0VQuuYnwGrapkogZ
         eUAw==
X-Forwarded-Encrypted: i=1; AJvYcCV7JjFAfBZ/3TaZWaD2rO6qD/4PxBrPV+YnoYbvz0jPikywyTIJ9IeYM1ITrW6fgASIntn0DFQlzbNyTQDKKeMa6WRX/Q==
X-Gm-Message-State: AOJu0YwTS12DSx6qBLZ2p5eFUtrr7CkdaXPPCRHtJTO2j1R4IDhBQXCA
	5RckHS5YdohVE8atquSFopTN3SN/tsgjUiDrmlIO5o9ycJqhJbM2/dkW/LM8Vjg=
X-Google-Smtp-Source: AGHT+IGop1wZC6m0k77EbfmuVBJhLZNPt4/i7V+4In+oX0MOWd2bWAsffJWM30AD7pSAlZzhAfnH4Q==
X-Received: by 2002:a05:6512:3f03:b0:51b:4204:2f53 with SMTP id y3-20020a0565123f0300b0051b42042f53mr3984809lfa.62.1713856790007;
        Tue, 23 Apr 2024 00:19:50 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f13-20020a056512360d00b0051ad4552454sm1307588lfs.148.2024.04.23.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:19:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v8 0/9] CFI for ARM32 using LLVM
Date: Tue, 23 Apr 2024 09:19:46 +0200
Message-Id: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJhJ2YC/2XQwW7DIAwG4FepOI8JbOOQnfYe0w6EQou0JROZo
 k1V3n1OdyhRjjZ8v/T7puZUS5rVy+mmalrKXKZRBv90UvEaxkvS5SyzAgNkrHU61E8EHXPR7M5
 sMsjWeCX/v2rK5eee9fYu87XM31P9vUcvdtv+pwC0KYvVRnNPiIazYTe8fpQx1Ol5qhe1xSzwo
 Gi6loLQGDtKQV54wAPFhlrbUhQKQMFkE8hFOFBqKPiWktAgpYkt9hbcgboHpd3FFic0Z7E9phR
 jPFBu6a4rb2ciz+hdGizygXYNhV3XbqPJIoSefIx+R9d1/QMtkX8LBQIAAA==
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
Changes in v8:
- Drop aliases for the coherent cache maintenance functions, this
  will not work because these have different return types, despite
  the resturn valued is mostly ignored.
- Picked up Sami's Reviewed-by
- Drop the already applied ftrace functions patch.
- Drop the first patch in the series (checking calls using vtable
  instead of function) it is not needed anymore after doing the
  deeper fix with tagged symbols.
- I will update the patches in the patch tracker to this version
  and they will become the /2 versions.
- Link to v7: https://lore.kernel.org/r/20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org

Changes in v7:
- Use report_cfi_failure_noaddr() when reporting CFI faults.
- Leave a better comment on what needs to be done to get better
  target reporting.
- Link to v6: https://lore.kernel.org/r/20240417-arm32-cfi-v6-0-6486385eb136@linaro.org

Changes in v6:
- Add a separate patch adding aliases for some cache functions
  that were just branches to another function.
- Link to v5: https://lore.kernel.org/r/20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org

Changes in v5:
- I started to put the patches into the patch tracker and it
  rightfully complained that the patches tagging all assembly
  with CFI symbol type macros and adding C prototypes were
  too large.
- Split the two patches annotating assembly into one patch
  doing the annotation and one patch adding the C prototypes.
  This is a good split anyway.
- The first patches from the series are unchanged and in the
  patch tracker, I resend them anyway and will soon populate
  the patch tracker with the split patches from this
  series unless there are more comments.
- Link to v4: https://lore.kernel.org/r/20240328-arm32-cfi-v4-0-a11046139125@linaro.org

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

Linus Walleij (8):
      ARM: mm: Type-annotate all cache assembly routines
      ARM: mm: Use symbol alias for two cache functions
      ARM: mm: Rewrite cacheflush vtables in CFI safe C
      ARM: mm: Type-annotate all per-processor assembly routines
      ARM: mm: Define prototypes for all per-processor calls
      ARM: lib: Annotate loop delay instructions for CFI
      ARM: hw_breakpoint: Handle CFI breakpoints
      ARM: Support CLANG CFI

 arch/arm/Kconfig                     |   1 +
 arch/arm/include/asm/glue-cache.h    |  28 +-
 arch/arm/include/asm/hw_breakpoint.h |   1 +
 arch/arm/kernel/hw_breakpoint.c      |  35 ++
 arch/arm/lib/delay-loop.S            |  16 +-
 arch/arm/mm/Makefile                 |   3 +
 arch/arm/mm/cache-b15-rac.c          |   1 +
 arch/arm/mm/cache-fa.S               |  45 ++-
 arch/arm/mm/cache-nop.S              |  61 ++--
 arch/arm/mm/cache-v4.S               |  53 ++-
 arch/arm/mm/cache-v4wb.S             |  45 ++-
 arch/arm/mm/cache-v4wt.S             |  53 ++-
 arch/arm/mm/cache-v6.S               |  49 ++-
 arch/arm/mm/cache-v7.S               |  74 ++--
 arch/arm/mm/cache-v7m.S              |  53 ++-
 arch/arm/mm/cache.c                  | 663 +++++++++++++++++++++++++++++++++++
 arch/arm/mm/proc-arm1020.S           |  67 ++--
 arch/arm/mm/proc-arm1020e.S          |  68 ++--
 arch/arm/mm/proc-arm1022.S           |  67 ++--
 arch/arm/mm/proc-arm1026.S           |  68 ++--
 arch/arm/mm/proc-arm720.S            |  25 +-
 arch/arm/mm/proc-arm740.S            |  26 +-
 arch/arm/mm/proc-arm7tdmi.S          |  34 +-
 arch/arm/mm/proc-arm920.S            |  74 ++--
 arch/arm/mm/proc-arm922.S            |  67 ++--
 arch/arm/mm/proc-arm925.S            |  64 ++--
 arch/arm/mm/proc-arm926.S            |  73 ++--
 arch/arm/mm/proc-arm940.S            |  67 ++--
 arch/arm/mm/proc-arm946.S            |  63 ++--
 arch/arm/mm/proc-arm9tdmi.S          |  26 +-
 arch/arm/mm/proc-fa526.S             |  24 +-
 arch/arm/mm/proc-feroceon.S          | 103 +++---
 arch/arm/mm/proc-macros.S            |  33 --
 arch/arm/mm/proc-mohawk.S            |  72 ++--
 arch/arm/mm/proc-sa110.S             |  23 +-
 arch/arm/mm/proc-sa1100.S            |  31 +-
 arch/arm/mm/proc-v6.S                |  31 +-
 arch/arm/mm/proc-v7-2level.S         |   8 +-
 arch/arm/mm/proc-v7-3level.S         |   8 +-
 arch/arm/mm/proc-v7.S                |  66 ++--
 arch/arm/mm/proc-v7m.S               |  41 +--
 arch/arm/mm/proc-xsc3.S              |  73 ++--
 arch/arm/mm/proc-xscale.S            | 125 +++----
 arch/arm/mm/proc.c                   | 500 ++++++++++++++++++++++++++
 arch/arm/mm/tlb-fa.S                 |  12 +-
 arch/arm/mm/tlb-v4.S                 |  15 +-
 arch/arm/mm/tlb-v4wb.S               |  12 +-
 arch/arm/mm/tlb-v4wbi.S              |  12 +-
 arch/arm/mm/tlb-v6.S                 |  12 +-
 arch/arm/mm/tlb-v7.S                 |  14 +-
 arch/arm/mm/tlb.c                    |  84 +++++
 51 files changed, 2300 insertions(+), 969 deletions(-)
---
base-commit: 43426466485392d6eedc422fdeddd43eb394d8aa
change-id: 20240115-arm32-cfi-65d60f201108

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

