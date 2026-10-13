Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA2E54DAD1
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923514; cv=none; b=hHuH+PMB2VNjq3FQggE4WymEj3esqFr98me2Huk09vycrADIfukpv5wuY6ZdFzHomPrdFxkl9YJdMOB2yeiE8yerssjF1I6QG4gSK07tazdlR6273xNNoGpz2jeJ8FCdC/uJ5e3O8FdfbBgRn9Ex0O/FvS7fZyp92oy+jp1unuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923514; c=relaxed/simple;
	bh=UgCffj0MEie889xroaqiA8aXOWlwDBGx7+dYNbaIx5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gWF5sN2lH1SWKRt5x7B5pgWzR3/uAYGPqHIdWp3+UEkmNMp9JDeBtLBzWNjSngDeLXdv2gl5VUcdddPXPRK8WpzDizhNB+9DMvF6GaLCWdp6mTKw4ortYT59iFs7YDVJPBhGLbak+IbCsM4jOdldjheU+cLho7l0850veFZgpIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdcuaF1k; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdcuaF1k"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1977172f8f.3
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923510; x=1792528310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjey8+ePw07beGDxIotk+YQHKQUDDDkCGlBqCSvi89Y=;
        b=JdcuaF1kff4QjBdSJZ+63VKwVmiv1t4TS+jdbr9eTO9d22qsTVROmLlQgxoim+lPnJ
         TsTp+BJFSqIc/OlYbzgGoqKPLvQJChyefMwbsLMT517jrmVT+XLQ9hpJzSrVd/Lq6VE8
         duz6PsyCxBEHehior2tpeye7j0a47LVDhbf68XcvOQewBz0bnM4oolTVC/cGCatP+0oG
         gTHSQsChw6jYomFYPb+pGelhPEaBjzRqbraHYuv+Vsr04SbytBWyLo8kLVt4EGj898d2
         SJ/Y9Z9e6zkhVQU8ZUxosprVTmYvXwWclg96Br7uYhbsL6pCvSl2vk6WclDxlDhDgBPi
         UhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923510; x=1792528310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjey8+ePw07beGDxIotk+YQHKQUDDDkCGlBqCSvi89Y=;
        b=wO1Hefo5Vdmuv5MMuQrgblnlYoXEqtM3qISW+ZEsRXzYseCXcXE34+Oo3QbKdK+9iG
         TDJzW7bfKqdzQyyrfUAbMkwlpQ7qKEV52A/xTlk/dSyCIKZ6yFNO15CMc5SvAP2R9mOC
         KC5utl9NcH3vZ2vAt6eGXBjgfOZeltZDQxNnmQ4oiPXH26AGO5dd5+xaJyBVuNlqwJqU
         AwlO3rFLPttCXnXStmwr9hgNx5ho8w1BuIaDR2Fb6HP4hDAAlRKxkrjgjgY9/LUIdJi0
         tt3bq37ULJOrP8e+pkLTOz/Fgm04kEc6ylHHq3UuH9ZaLsqZfhzJnL5Htof0ja08/eaP
         Fjeg==
X-Forwarded-Encrypted: i=1; AKwUvBwJArFLtm95M/ueTRl5FTRFe4UkZgTGq+QUvJWaBFarqZJnj058wFqhiorgxNcLqImIeX6X@lists.linux.dev
X-Gm-Message-State: AFq9FYI5U1CScABWiY+lGjxRpZv8zO+GJzswJP4MyzgeWvlcVxzUcFDu
	Vp/hNSaTk0/68j3QJnQua+AY9m9aRHV/93CFrlpHd8t9eMAgwae+erLl
X-Gm-Gg: AYBFou0itInTud8hH+3xUZIj8ZDIaLrqe8BCRCw1yagon+m5gR66WgOaQvM50KXUCT0
	i4cqMYwypkyb21r4CpxOKX5ELqVoHflwDta3Q4flavCRyURoBaHupTqjV9n/AP2K6tfrXjKJlUq
	yss3bBIoPGMiriyaSzyNQfoZkkrrbkoWQcRbr1oYj6aKUtuxqIdyhhY3Jf+iTpma4Jdc23ZEoXa
	oL9mWkyfc1BEjkU18Wxg6NYtv6PJrExplwHsCJl5wLgZnCyitPjEwHcrZt7CSkzIqMU7pzDKTQH
	/0QLQppIjgixo7yFpG4os5YSGOdGlPms54wdRVaobDTnjzDvRGjkWzOwyB/R6pETDUGnn1l8rQ+
	XWoaw6TTx8PLxnK/kxsJ1h+RSmWqsT9pTuSJ1jjoG/zZagWotcDMuuZPbNAfRvsbwu/H0WYM/8C
	b7Swa7Mo2MBKGsJ9NSU/bNdL8e/N5I3P732YV63m5p9qomHvWgrWWeC7Z/orgcyZRDWvFHkcId6
	oDQOCeX3PHCy7RbXeHbkSBH86yHnaNcnkZjwT54AMruVWiCit4V4MWyoJOP4U1u+xkqgzPrmNIV
	G7+XIRZttvmWWPOTxYbn2ODnt59y/bFUxy/G2lYzRJL/Y22MPHM+7lZcLw9xy7o3aWOwebVI26T
	PBW9xLA==
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr246871355e9.23.1791923509703;
        Tue, 13 Oct 2026 13:31:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] ARM: rust: Enable Rust for ARMv4T/v5TE/v6K and change ARMv7 codegen
Date: Tue, 13 Oct 2026 22:31:34 +0200
Message-Id: <20261013203140.31741-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust on 32-bit ARM is limited to kernels that contain an ARMv7 CPU.
This series extends it to ARMv6K-only, ARMv5TE and ARMv4T kernels,
and gives ARMv7 kernels their own Rust target.
Based on v7.3-rc1.

Linus Walleij asked for older ARM cores during review of the ARMv7
support [1]. Christian Schrefl's earlier ARMv5 attempt [2] hit atomic
and ABI problems. The kernel crate now uses C atomic helpers, and the
*-linux-gnueabi targets used here keep the Linux EABI.

Patch 1 fixes a Rust build failure with gcc 8.1.0 and
CC_OPTIMIZE_FOR_SIZE on ARMv7, without the rest of this series. It can
be merged separately and is tagged for stable.

Patches 4 and 5 depend on patch 2 for 16-bit xchg() on pre-ARMv6 CPUs.
Patch 6 switches ARMv7 kernels to the ARMv7 Rust target and can be left
out. Combined ARMv6K and ARMv7 kernels keep the generic ARMv6 target.

Arnd suggested -Ctarget-cpu with arm-unknown-linux-gnueabi. Its explicit
+v6 remains in effect with -Ctarget-cpu=arm926ej-s, so libcore contains
ARMv6 instructions. Disabling +v6 produces ARMv5TE code but warns about
an unstable target feature. The ARMv4T and ARMv5TE targets also declare
32-bit atomics rather than 64-bit. The series selects the target next
to -march.

ARMv4 without Thumb, ARMv7-M and plain ARMv6 (ARM1136r0) stay excluded.

The Rust samples, Rust KUnit suites and doctests passed in the following
ARM-mode kernels on v7.3-rc1.

QEMU:

- ARMv4T: sx1 (OMAP310, ARM925T), omap1_defconfig, 360 doctests.
  CPU_DCACHE_WRITETHROUGH was disabled because QEMU does not implement
  the CP15 register it writes.
- ARMv5TE: versatilepb (ARM926EJ-S), versatile_defconfig, 355 doctests.
- ARMv6K: raspi0 (ARM1176), bcm2835_defconfig without ARCH_MULTI_V7,
  368 doctests.
- ARMv7: virt (Cortex-A15), 371 doctests. With clang 22.1.8, Rust
  modules also loaded, including the PCI and DMA samples on pci-testdev.

The ARMv4T, ARMv5TE and ARMv6K QEMU runs used these toolchains:

- clang 22.1.8, rustc 1.99.0, bindgen 0.73.2
- gcc 15.2.0, rustc 1.98.0, bindgen 0.72.1
- minimum LLVM 17.0.1, rustc 1.85.0, bindgen 0.71.1
- minimum gcc 8.1.0, binutils 2.30, rustc 1.85.0, bindgen 0.71.1

ARMv7 virt also passed with both minimum toolchains. No additional
toolchain requirement was found.

Hardware:

- Microchip SAM9X75 Curiosity (ARM926EJ-S), clang 22.1.8, 356 doctests.
  Tested with an ARMv5-only config and with at91_dt_defconfig, which is
  built for ARMv4T. Rust sample modules loaded and unloaded.
- Raspberry Pi 1 Model B+ Rev 1.2 (ARM1176JZF-S), bcm2835_defconfig
  without ARCH_MULTI_V7, clang 22.1.8, 368 doctests. Ten Rust modules
  loaded and unloaded. Misc ioctls, configfs, scoped debugfs and rnull
  I/O checks passed. The always-disabled KUnit selftest was skipped.
  No warnings or oopses in the test kernel.
- Raspberry Pi 400 (Cortex-A72), 32-bit LPAE kernel, 371 doctests.
  Both ARMv6 and ARMv7 Rust targets were tested with clang 22.1.8 and
  with gcc 8.1.0 at CC_OPTIMIZE_FOR_SIZE. With the ARMv7 target and both
  compilers, Rust sample modules loaded and unloaded. rnull read and
  write tests passed, and Rust cpufreq-dt switched between 600 MHz and
  1.8 GHz.

The optional panic QR renderer was disabled for the GCC build with the
ARMv7 Rust target. With rustc 1.85.0 and size optimization, its object
references __aeabi_uldivmod, which the ARM kernel does not provide.
An unpatched v7.3-rc1 QR object has the same reference.

Built-in Rust code ran on Thumb-2 kernels on the Pi 400 and in QEMU,
with both ARMv6 and ARMv7 Rust targets. Tested Rust modules failed with
"unsupported interworking call (ARM -> Thumb)", also on unpatched
v7.3-rc1. One open question is whether HAVE_RUST should exclude
THUMB2_KERNEL && MODULES or leave module loading to a follow-up.

I plan to submit the enablement patches through Russell's patch system
unless the ARM and Rust maintainers agree on another route.

Changes in v3:
- Shorten patch 1's commit message as requested by Gary and collect
  Gary's and Bradley's Reviewed-by tags. No code changes.
- Tighten the commit messages for patches 3-6. No code changes.
- Add Raspberry Pi 1 Model B+ hardware results for the full series.

Changes in v2:
- Select the rustc target next to -march and explain why -Ctarget-cpu
  on the generic target is not enough (Arnd).
- Add ARMv4T and ARMv6K-only support (Arnd).
- Add optional patch 6 for the ARMv7 Rust target (Arnd).
- Keep ARMv7-M and plain ARMv6 excluded (Arnd, Bradley).
- Test Thumb-2 kernels and document the Rust module failure (Arnd).
- Test gcc and the minimum tool versions (Miguel).
- Add patch 1 for the build failure found with gcc 8.1.0.
- Patch 2: unchanged code, collected Arnd's Acked-by and Reviewed-by
  tags from Linus Walleij and Bradley Morgan, and explained the plain
  ARMv6 exclusion (Arnd).
- Update the atomic-helper architecture lists and architecture table.

v2: https://lore.kernel.org/rust-for-linux/20261008053746.49631-1-kmehltretter@gmail.com/

v1: https://lore.kernel.org/rust-for-linux/20261003093827.77857-1-kmehltretter@gmail.com/

[1] https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
[2] https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/

Karl Mehltretter (6):
  ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
  ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
  ARM: rust: Enable Rust support for ARMv6K-only kernels
  ARM: rust: Enable Rust support for ARMv5TE
  ARM: rust: Enable Rust support for ARMv4T
  ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels

 Documentation/rust/arch-support.rst |  8 ++++----
 arch/arm/Kconfig                    |  8 +++++++-
 arch/arm/Makefile                   | 10 +++++++++-
 arch/arm/include/asm/cmpxchg.h      | 26 +++++++++++++++++---------
 rust/helpers/atomic_ext.c           |  4 ++--
 5 files changed, 39 insertions(+), 17 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5 (Apple Git-154)

