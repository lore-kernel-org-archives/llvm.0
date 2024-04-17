Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27751EB40
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342661; cv=none; b=i+d+Q7V10fK9+Zt+q1ySTXWEiVB5DvLMmPkeuy4MWUL9OHtPKcyERJJ83nz9cnvHfhpO0c2i0EVi8LzG98QipRREtw8/wihYQLLLglU3v7ggVYd27A5qqK9+F2Ja5s+tqVe/g2y/oDEKbiPRycp5TyFJPIe65zPIGTle7/6c9wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342661; c=relaxed/simple;
	bh=657+HspgAeSjZibG9gNVczCWNMsRPqB7WlQm0HfwiH4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E7iNl4YXr5DX3wuWy5b+qATXuiV79Ayh2WKGdi8HJehID+Ez0lKgykjqzIUplNqhd/76muO9+q2Qtl6Ftyc3ZF3p1ZA+2ZrNz2phYr48u5SEts1EM/+n5joCbczoeqbQMKpYDrn9La+RW6+it2Yk7aPEHzCncSLSWEky44M5884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nd4z6AIc; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nd4z6AIc"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d6c1e238so6272401e87.2
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342658; x=1713947458; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WOQpdKzoM3UGkFAGWzEr+4psNOjz9xFXVKr4aA38ZC0=;
        b=nd4z6AIcZvp2otQG2oJzWisIl4nUvYEPFSTpX7YMemsIZcY2/d684yHti+9LfIoPYy
         CdHOEUTmgmK+MHv5wkt9DJHY7Z2NMt8+NVrCGCXUuuipwPXqyDRuxiOl1Fud+YZaV1CZ
         E6K/ZZbCpBrlm4FrDpxnm+2cQQq8lJsGnIXMVRdO5KwJPTI+5opsdCxjNkBbKZrE8z5+
         ExXKh3cNf0p2Ps6PmI7Nv9/GsyWCdWk37KGQhzDOrPxXlTU7tzLm4ROJpvKtjhr3br98
         0Q4gDD3hetT1GrHwvRv+61xQFe9qMJgIIasTnK1/bz2MVU25RlhZGEj0NTqXTZ0GnmR0
         USuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342658; x=1713947458;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOQpdKzoM3UGkFAGWzEr+4psNOjz9xFXVKr4aA38ZC0=;
        b=UR8BgOnnjwxfXtFZBEHYjcUdw3zS1t1LL+p9BZ78TnguwdGrxG0vfa6wAG/Wu2HQ4O
         6QukA7NvrBBJU7nT5eQbiHAusnMxaPyrQTDq7oMjRfZaO3IClhRc1dYMiRfPhiYmtCs1
         MZ8kW0G7NlFijbo+K9kGdeAvP9NRQHhEfwJQErRTGAfjuifXMo7zI4FNx3zDWJoYcAYf
         TwLkoE9vg60kozRRLEAduagV9BQfLR+oKfX7twYp5lkJ2Qhbf/v1GmXwPfWCZF+sr+Xh
         KP+QZriqp2ddGF8E7j56vu8tz7yznucJWm0mLhJNF/Qes62DUh88hzWXGeD2m506FYvy
         32MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt7PdVHKisx0rJ94C6KM1XH2AiIqOfN2m9ODiJoLaEIQ4cMpB61k5zBz5gul3nuxf8JHltBds1jaLqGSBnfzoWLibhWA==
X-Gm-Message-State: AOJu0YzxkMvj+2iQWP+JF9jqSOGSugUCXFnUFbO51/2Pyb64U2a6VB7u
	3lJNJ8WPw0Q+P0JOwxRvhuhNtFdakCW/BKy0AMNRMB8oHv75p0bu3i53Fv5ti/k=
X-Google-Smtp-Source: AGHT+IHHCGhCXtMnPPLbwsqP6gsQnw3GSYaZgh9NX1F3Tf1Wb/gzdMB4R9FzFIwJvlrqA5NBOwrXNw==
X-Received: by 2002:a05:6512:280c:b0:519:2f77:5074 with SMTP id cf12-20020a056512280c00b005192f775074mr3116468lfb.35.1713342657738;
        Wed, 17 Apr 2024 01:30:57 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:30:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v6 00/11] CFI for ARM32 using LLVM
Date: Wed, 17 Apr 2024 10:30:49 +0200
Message-Id: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqIH2YC/2XQwW7CMAwG4FdBOZPJsZ1AOe090A4hJBBptCidI
 ibUd5/LDg3q8bfz/ZLzVGMsOY7qsHmqEmse89BLcNuNClffX6LOZ8kKARmMsdqXG6EOKWtnzw4
 SyhT2St7fS0z58eo6fkm+5vFnKL+v6mrm6X8LYttSjQbtOiYCl8DZ0+d37n0ZPoZyUXNNxYUS7
 FqKQkPYcfSycSdaUWqoMS0loYjsIYFnG3BFuaG4bykL9XI0O0OdQbuidqH89mPVCk1JbEcxhhD
 e6DRNf/VPmBaPAQAA
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

Linus Walleij (10):
      ARM: bugs: Check in the vtable instead of defined aliases
      ARM: ftrace: Define ftrace_stub_graph
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
 arch/arm/kernel/bugs.c               |   2 +-
 arch/arm/kernel/entry-ftrace.S       |   4 +
 arch/arm/kernel/hw_breakpoint.c      |  30 ++
 arch/arm/lib/delay-loop.S            |  16 +-
 arch/arm/mm/Makefile                 |   3 +
 arch/arm/mm/cache-b15-rac.c          |   1 +
 arch/arm/mm/cache-fa.S               |  43 ++-
 arch/arm/mm/cache-nop.S              |  61 ++--
 arch/arm/mm/cache-v4.S               |  53 ++-
 arch/arm/mm/cache-v4wb.S             |  43 +--
 arch/arm/mm/cache-v4wt.S             |  51 ++-
 arch/arm/mm/cache-v6.S               |  47 ++-
 arch/arm/mm/cache-v7.S               |  72 ++--
 arch/arm/mm/cache-v7m.S              |  53 ++-
 arch/arm/mm/cache.c                  | 663 +++++++++++++++++++++++++++++++++++
 arch/arm/mm/proc-arm1020.S           |  65 ++--
 arch/arm/mm/proc-arm1020e.S          |  66 ++--
 arch/arm/mm/proc-arm1022.S           |  65 ++--
 arch/arm/mm/proc-arm1026.S           |  66 ++--
 arch/arm/mm/proc-arm720.S            |  25 +-
 arch/arm/mm/proc-arm740.S            |  26 +-
 arch/arm/mm/proc-arm7tdmi.S          |  34 +-
 arch/arm/mm/proc-arm920.S            |  72 ++--
 arch/arm/mm/proc-arm922.S            |  65 ++--
 arch/arm/mm/proc-arm925.S            |  62 ++--
 arch/arm/mm/proc-arm926.S            |  71 ++--
 arch/arm/mm/proc-arm940.S            |  65 ++--
 arch/arm/mm/proc-arm946.S            |  61 ++--
 arch/arm/mm/proc-arm9tdmi.S          |  26 +-
 arch/arm/mm/proc-fa526.S             |  24 +-
 arch/arm/mm/proc-feroceon.S          | 101 +++---
 arch/arm/mm/proc-macros.S            |  33 --
 arch/arm/mm/proc-mohawk.S            |  70 ++--
 arch/arm/mm/proc-sa110.S             |  23 +-
 arch/arm/mm/proc-sa1100.S            |  31 +-
 arch/arm/mm/proc-v6.S                |  31 +-
 arch/arm/mm/proc-v7-2level.S         |   8 +-
 arch/arm/mm/proc-v7-3level.S         |   8 +-
 arch/arm/mm/proc-v7-bugs.c           |   4 +-
 arch/arm/mm/proc-v7.S                |  66 ++--
 arch/arm/mm/proc-v7m.S               |  41 +--
 arch/arm/mm/proc-xsc3.S              |  71 ++--
 arch/arm/mm/proc-xscale.S            | 125 +++----
 arch/arm/mm/proc.c                   | 500 ++++++++++++++++++++++++++
 arch/arm/mm/tlb-fa.S                 |  12 +-
 arch/arm/mm/tlb-v4.S                 |  15 +-
 arch/arm/mm/tlb-v4wb.S               |  12 +-
 arch/arm/mm/tlb-v4wbi.S              |  12 +-
 arch/arm/mm/tlb-v6.S                 |  12 +-
 arch/arm/mm/tlb-v7.S                 |  14 +-
 arch/arm/mm/tlb.c                    |  84 +++++
 54 files changed, 2266 insertions(+), 972 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240115-arm32-cfi-65d60f201108

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

