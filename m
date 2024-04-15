Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E395A108
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 13:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188616; cv=none; b=oVC3y66zeWF1pUvkAk7g6AwtowEk+eOKtBe5XaEEjVpoprYJmqCSFB2yF2xkOsjx17sbfATY56uwVfKP7Fn1VQyJ/JabXpidk4p7gUUPwIsWnr2vsvWPn7qF/HUFK0rV4sK4xER+1SJ1okw24/vnxr1sGolfS2XDPQR39MyoOJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188616; c=relaxed/simple;
	bh=/zZ5J0klUq3J0koJsMRj6ibeh/6Dz4lCBgIAoW/trIs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ki6suPozkB9Bk/w4QL3aUfaWo5g7Czz4+a6kr7ePlN/soHfPNm+AS6pIe4q1TbZrzj2gOQgGYzhFTiO5Im0U/SjlPSey2mkC/8rcCDbipH3dREyiwZZX4/D2a6+OL5RPDxsvLAuM1V4HJzVzcyFVzoKoZShjSsrlbDxVEG0Pk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XbI+S0lO; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XbI+S0lO"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so28650171fa.0
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 06:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713188612; x=1713793412; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4t1Ya7U4PIOxTugO2wR7OUmFXO0mNdioXZKNSh+xxSI=;
        b=XbI+S0lOl8Qx3i405d3f8GQNzZIw+2ZFMalsA4ty0H8PP/ulSf/AfgLeCQ31avLkDB
         zk7HaQ/Br+9Y9n4NM4EbdfqQ/adShuYR0E1LFdXoiJkmyiuWJUR0rdfq1qwT1CrW6PEQ
         p2XL+QfxScdze28/BztjsKl3kx9cXDPzop1FNNvVQKHK6t8hoJshjDCCMo5d/6uuiHDU
         uYz3gw+vEIPnM3DK73l/4+SFfnv4WrWEo99rE6wQirCQffDrmjJZUXGksdTIAQGyvUqV
         ix3v49HuZfxrmYRtDyhs9dEarvdTlUAt6sTxharhCsxl9a1uP03xJY9s4zZg+KE8JNga
         TmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188612; x=1713793412;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4t1Ya7U4PIOxTugO2wR7OUmFXO0mNdioXZKNSh+xxSI=;
        b=SI58vYYIwZ8UnflMK10lEz9D2E7olAHPtuir5FzLvun+6hiRoNP641wkXi6yNQO49g
         tSvVkK+HW24b53rTQc5L5rjfNu0dIJf6Xa357zOftw8MpNjSVdHMlIqOW6W3o+fcBdu8
         w7TRCLvEf+xahRpHdNG0vpUrRflR1xIt3NwZFpeusi1hjGRbg1XbIle6B6XWiOQk9Uoa
         8ND6LYzHzob1KwT0aQHz7psaC92Kg0EeOJiJAjWqlHLh4XrFS4K1VdNrf3gv+MQQ4DHu
         jWivqG2/TkRc3z9XNs5ssl4QAVeghyUvC4B94grEeRiOWc418pTmJWgaB4m/t1Bxq8pK
         Kh2w==
X-Forwarded-Encrypted: i=1; AJvYcCVQQVM2zQxRMRWi6KS7R0mOc9JzdBqwTrlle1yqwRJUZzw4dQczTFonkZU2YPOqstJm4y21GEEOZEuzoiVtQZcqxJLKyQ==
X-Gm-Message-State: AOJu0YwWTdFl5d6n+X5J3zGBMIc6VVz8hhbhoDD/Whuu8mb5l3UFoF9b
	D8JkNg1IRaoL+5cbFavuGsrnRwXHoDozl/dmv9QTw6DBIrSHTbQYP384LMw4BybXTFKtXF+WgQg
	s
X-Google-Smtp-Source: AGHT+IHn/NNt2ymv8+0fGiNGYOpotEuf2vZCPpdp93l4jofNI/23GYBzJGrEugbgh5uL2PTjgezmfw==
X-Received: by 2002:a2e:be06:0:b0:2d6:f8d7:ab95 with SMTP id z6-20020a2ebe06000000b002d6f8d7ab95mr3939155ljq.21.1713188612344;
        Mon, 15 Apr 2024 06:43:32 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p11-20020a2eb98b000000b002d43737e2d7sm1297988ljp.30.2024.04.15.06.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v5 00/10] CFI for ARM32 using LLVM
Date: Mon, 15 Apr 2024 15:43:19 +0200
Message-Id: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPguHWYC/2XPTQ7CIBAF4Ks0rMUMw4/WlfcwLigFJdHWgCGap
 nd31IWYLt/MfC+ZiWWfos9s10ws+RJzHAcKetUwd7bDyfPYU2YIqEAIzW26SuQuRG50byAgTWH
 L6P6WfIiPT9fhSPkc831Mz091Ee/ptwWxbimCAzetkhJMAKO7/SUONo3rMZ3Yu6bgj0rY1BSJO
 rdR3tLGdHJBZUWFqKkkiqgsBLBKO1xQVVHc1lQRtfS0MkK2AvUfnef5Bew56E5UAQAA
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

Linus Walleij (9):
      ARM: bugs: Check in the vtable instead of defined aliases
      ARM: ftrace: Define ftrace_stub_graph
      ARM: mm: Type-annotate all cache assembly routines
      ARM: mm: Rewrite cacheflush vtables in CFI safe C
      ARM: mm Type-annotate all per-processor assembly routines
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

