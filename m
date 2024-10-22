Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5C61E51D
	for <llvm@lists.linux.dev>; Tue, 22 Oct 2024 01:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562359; cv=none; b=CmsEekUvSYb3iXC2UZTY+3jPN7LmTC6/lYvP+8Jk6yxqNVO66fDE2lBZZXkq4Kmz3BfVmmUYEesLvwuqQh89H3SbA/au+RrqgHgJyFQCMPnk2OKHmWughTd21mO7lFu1fHB2POAnMfaLS0B1Ki7SA+sBGMwS1CyfGMSaDWOD73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562359; c=relaxed/simple;
	bh=TzyrsFCUyH+ZbEjiW+A6aFlvAuuT7k2jZ3jHgMSI0a4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H5iB0eX9BxLRhZYeejI6qrgLdh1AOgA4jMEHSd54+G7cmZ5a5ErqfSVJ/XlN0X1+MIIsoq5RuAwUkAq4K0e3X+e92bO2CFCCarjVmCLhiwv+QvBKGTUm4KEjSz5ujqp6rO9IucbXkqMVDSuzwbNNgpdIhlJ1QfXkYDuUNZNbL5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=jYnK4619; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jYnK4619"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso3352207a12.0
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 18:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562356; x=1730167156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e65ANAnizaofFjgpIDXOaUasil0HVOGTLixFGnIEx4s=;
        b=jYnK4619osD9VuwIJ70F+kDlLMntOusQ147h8F0SN7WsWSVkcrwf55akSMsJIxUiek
         2Q9txtLqEHHSGIzLMzg53sj4U9BQgJhdA8O6K0wVohki5+FEwwWqz1ZtfoJO1Y51Falb
         SrMt1vveSxrK9JCVVXFXdoykSwDhFlfCd7pK4R0JcgKwT3yow4XohPdOFy9WRnnHocco
         OSJYkKA5Loc1xC+d8BL+A9hosxu7MTMYgnirFL8jZnxfpK7qThfPzAU15Z1qKK1+6hoH
         8V1Hph770dz9ysx/Damz1EBDlZG7AJDcY4MZpm7nvoIrSTdqze3zgS8mhsTwUoDU/ytY
         07sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562356; x=1730167156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e65ANAnizaofFjgpIDXOaUasil0HVOGTLixFGnIEx4s=;
        b=TUKvKUfeoe9UkKGYmFaAbbJjgakntIwbwSh/ZPGn6wZbtN4/zCh/kSDckjCmznUJtf
         WrywJd5KbKMYkUQDTOciabEaB+3RAGF5NLfdvoXqPiEQEutKuIhAsW2L60rEPcK+FBEQ
         joKa8dUvw/l2ylKl5bA4I5XC5ZkjfxcOB5K+/mr9NhaILV9v6N4rumzRL3ErlKvnLJ03
         SBQ/CEtMZXPogw44Hk7vap8xGdoH2toZhVqjECt1x71PN7e5C1YfUMb6QQUSsWMuq8H0
         TB11t7u0WjGaE5EgcQTxKFB5Te1zwJaWJaE0OuSQgMcZgwZkN2mnhTZdhgP2Cp2MdXFn
         fjeA==
X-Gm-Message-State: AOJu0YxwqHENMU6hVQsLF5Uzg8Lkyl2XXTZUCCoBjAz2sxs7hRGCzulV
	KTJOI7aDWDovUGkiObHn1r46LyFp+zEAX1BU8cWza5tzWGnQLpNzAUZhZ5o448k=
X-Google-Smtp-Source: AGHT+IEXsyYj+KgjHmYUKoNKrCcxY4nPfOvA/Yp1hV7DCU8lwbKfMca2QJF0T6KgMVKIPzFYrhGr9A==
X-Received: by 2002:a05:6a20:d81b:b0:1d9:20cf:2c24 with SMTP id adf61e73a8af0-1d96b71566fmr2363833637.29.1729562356331;
        Mon, 21 Oct 2024 18:59:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:15 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 0/9] kasan: RISC-V support for KASAN_SW_TAGS using pointer masking
Date: Mon, 21 Oct 2024 18:57:08 -0700
Message-ID: <20241022015913.3524425-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series implements support for software tag-based KASAN using the
RISC-V pointer masking extension[1], which supports 7 and/or 16-bit
tags. This implementation uses 7-bit tags, so it is compatible with
either hardware mode. Patch 4 adds supports for KASAN_SW_TAGS with tag
widths other than 8 bits.

Pointer masking is an optional ISA extension, and it must be enabled
using an SBI call to firmware on each CPU. If the SBI call fails on the
boot CPU, KASAN is globally disabled. Patch 2 adds support for boot-time
disabling of KASAN_SW_TAGS, and patch 3 adds support for runtime control
of stack tagging.

Patch 1 is an optimization that could be applied separately. It is
included here because it affects the selection of KASAN_SHADOW_OFFSET.

This implementation currently passes the KASAN KUnit test suite:

  # kasan: pass:64 fail:0 skip:9 total:73
  # Totals: pass:64 fail:0 skip:9 total:73
  ok 1 kasan

One workaround is required to pass the vmalloc_percpu test. I have to
shrink the initial percpu area to force the use of a KASAN-tagged percpu
area in the test (depending on .config, this workaround is also needed
on arm64 without this series applied, so it is not a new issue):

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index b6321fc49159..26b97c79ad7c 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -43,7 +43,7 @@
 #ifdef CONFIG_RANDOM_KMALLOC_CACHES
 #define PERCPU_DYNAMIC_SIZE_SHIFT      12
 #else
-#define PERCPU_DYNAMIC_SIZE_SHIFT      10
+#define PERCPU_DYNAMIC_SIZE_SHIFT      8
 #endif

When running with hardware or firmware that doesn't support pointer
masking, the kernel still boots successfully:

  kasan: test: Can't run KASAN tests with KASAN disabled
      # kasan:     # failed to initialize (-1)
  not ok 1 kasan

This series can be tested by applying patch series to LLVM[2] and
QEMU[3], and using the master branch of OpenSBI[4].

[1]: https://github.com/riscv/riscv-j-extension/raw/d70011dde6c2/zjpm-spec.pdf
[2]: https://github.com/SiFiveHolland/llvm-project/commits/up/riscv64-kernel-hwasan
[3]: https://lore.kernel.org/qemu-devel/20240511101053.1875596-1-me@deliversmonkey.space/
[4]: https://github.com/riscv-software-src/opensbi/commit/1cb234b1c9ed

Changes in v2:
 - Improve the explanation for how KASAN_SHADOW_END is derived
 - Update the range check in kasan_non_canonical_hook()
 - Split the generic and RISC-V parts of stack tag generation control
   to avoid breaking bisectability
 - Add a patch to call kasan_non_canonical_hook() on riscv
 - Fix build error with KASAN_GENERIC
 - Use symbolic definitons for SBI firmware features call
 - Update indentation in scripts/Makefile.kasan
 - Use kasan_params to set hwasan-generate-tags-with-calls=1

Clément Léger (1):
  riscv: Add SBI Firmware Features extension definitions

Samuel Holland (8):
  kasan: sw_tags: Use arithmetic shift for shadow computation
  kasan: sw_tags: Check kasan_flag_enabled at runtime
  kasan: sw_tags: Support outline stack tag generation
  kasan: sw_tags: Support tag widths less than 8 bits
  riscv: mm: Log potential KASAN shadow alias
  riscv: Do not rely on KASAN to define the memory layout
  riscv: Align the sv39 linear map to 16 GiB
  riscv: Implement KASAN_SW_TAGS

 Documentation/arch/riscv/vm-layout.rst | 10 ++---
 Documentation/dev-tools/kasan.rst      | 14 +++---
 arch/arm64/Kconfig                     | 10 ++---
 arch/arm64/include/asm/kasan.h         |  6 ++-
 arch/arm64/include/asm/memory.h        | 17 ++++++-
 arch/arm64/include/asm/uaccess.h       |  1 +
 arch/arm64/mm/kasan_init.c             |  7 ++-
 arch/riscv/Kconfig                     |  4 +-
 arch/riscv/include/asm/cache.h         |  4 ++
 arch/riscv/include/asm/kasan.h         | 29 +++++++++++-
 arch/riscv/include/asm/page.h          | 21 +++++++--
 arch/riscv/include/asm/pgtable.h       |  6 +++
 arch/riscv/include/asm/sbi.h           | 28 ++++++++++++
 arch/riscv/include/asm/tlbflush.h      |  4 +-
 arch/riscv/kernel/setup.c              |  6 +++
 arch/riscv/kernel/smpboot.c            |  8 +++-
 arch/riscv/lib/Makefile                |  2 +
 arch/riscv/lib/kasan_sw_tags.S         | 61 ++++++++++++++++++++++++++
 arch/riscv/mm/fault.c                  |  3 ++
 arch/riscv/mm/init.c                   |  2 +-
 arch/riscv/mm/kasan_init.c             | 32 +++++++++++++-
 arch/riscv/mm/physaddr.c               |  4 ++
 include/linux/kasan-enabled.h          | 15 +++----
 include/linux/kasan-tags.h             | 13 +++---
 include/linux/kasan.h                  | 10 ++++-
 mm/kasan/hw_tags.c                     | 10 -----
 mm/kasan/kasan.h                       |  2 +
 mm/kasan/report.c                      | 22 ++++++++--
 mm/kasan/sw_tags.c                     |  9 ++++
 mm/kasan/tags.c                        | 10 +++++
 scripts/Makefile.kasan                 |  5 +++
 scripts/gdb/linux/mm.py                |  5 ++-
 32 files changed, 313 insertions(+), 67 deletions(-)
 create mode 100644 arch/riscv/lib/kasan_sw_tags.S

-- 
2.45.1

