Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7EF3B14C9
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 05:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437877; cv=none; b=pk4k0OCxIg4OVZ7/mYpRRdUB4UW+JJZCTOATkDhqunudqEnartegGRd3SAgu6E48PtPjjiAd1Qf1pIZms9AGllUyWKN8jVL9anFiZZfuJIBR9Zg00IM5+apZFCxRKITlR51X9fXc/Fkac7qYUnd3LlSZY6s1IkSJIYZR86+3TCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437877; c=relaxed/simple;
	bh=E+Z6phyE5KtVT1dh0BRUp8GniqmY3N7HTAQ1ZDrVxXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JskqIKjQ4O7JSbKUlcFa7XxsSCAcqcOpmGDKee++gRR1uTcwyTzilJE/SPtqK85YgoXI/rVkBV+9EjgAFCs9REGwUGavMIz2s7c2w701VPMrr+qo4TT4X8DW5Zy9onf7HW96shVmUW+q3PNVBnyXXPzQ6TtUAQm4c4fACHLA0M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzc45gaA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzc45gaA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso3903010f8f.3
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 22:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437875; x=1792042675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zY5H8Ld+yTEStTJ845AFIVQiXLDAAM2/XkAD8HwKJ8I=;
        b=kzc45gaA2Br/xT1IPLFO1mZXSm65uQ6L+MJ2WSn4+xDvdUSSW1ClYs+wN90dvoRus3
         6qZkVncfzWmNg+OXv7izvp6/Vo8/GLhShyO2hDLmZhLSciCu4Lq1KWjUFpho8b9lZLz9
         h+4RB0XCvio+YP+m2pXEDYmd8hg1EW5Ms4sis9K38/Q/IXdB1+VjX95H/d2tFcSMpUqT
         /pfN+WICTOZNHEVK9rh7VuHYlBxk1ffgakH+OiMCyYIDXUlzsZObL4pIsVqwh5ugYpzA
         dT4xIbCoAAyMV1RlQMiqbgUlJxTKz8ooWdu4EkekPgACMyvK2fr4pp1uzrLMD2F/Ds1I
         oZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437875; x=1792042675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zY5H8Ld+yTEStTJ845AFIVQiXLDAAM2/XkAD8HwKJ8I=;
        b=YrulQCE7kGWkh1pDnRTd+p6xbz8JpYl9oe5DAMJ9T4QB+jmZe5i1zEtwuRg4rgR1fN
         +kOOMhD/wo2x/1g4tkP7MWHdf1g/ST6OBx9cMGIydb7AOOJVrCLUG9KQUg36o8Je427w
         oFKtJX6Gf1l3wmFC1sf8K1G5r301rWJRUEcAMM6gEDgyF3TSmWXrhll0wN9iBgC0lkV+
         Y6H1+jYkwwExzho9E+lmFm6u/OgH4YDKTX0uGwwDQnsl27RBMv7IFhen00g/dU0cSdbo
         uCSIHgcCZHzuGS9jASvrJ1Q6aLpUn0RO2kuQkaTOhFYkeb3BKLdPzqwNrvseZUYt56Fg
         EnXA==
X-Forwarded-Encrypted: i=1; AKwUvBw5dX44VUGH3cBusICdRC8IUGv2tKy8fgJDz1xGH5cyFAhE4IrEZH5bBJYuPL8WPiNSL4u3@lists.linux.dev
X-Gm-Message-State: AFq9FYKt2+LrJL7bFg8nprVa9Qth01I0gI5sRgQtbuXYxtJvixG2Ba24
	MmTLCTAOC+Kd2t4+WxFalqZAx/fzGBkVv6OO0TCbB1eCfzgiQ4Gq9+P+
X-Gm-Gg: AYBFou2SloDNAW32or+Kna6S2N65Uk11GMgc3JVcmdvdJ4hJcSeDQlaJOV2C91Q6M3p
	yBaYT4ddEmrJIzdytsEENhgqSqFvG5Ins/DF0ga+2YGgy4LU+h0I7fTbxPTnptC/ByqEC3SGQ2g
	bYeqlL9kCQL+Lx2xh306Qb6piONZUqqBi1Ik8POZ+Z6nAxszDHXFiTFWcWSqvfSVeH9yvLJX47O
	b7pGZdP2Xu3PPzDJ0+YSHQqj5i1kHnhMBQ33VAtzPiPzp+xGajIqBa7OImKir9YUAjh7Y3ifaiH
	gMqYDnKABtrKRu8EI+XUFqOby1mVf/i1E0eLXWVJnJRNiConDzwz6MUHdp/c25Vt1vVyLxn9W23
	wM86h+hi1oBPuNRg2Jm4AHRXzOcwObCL8UEJtnMGqvUS1rIKFS9aJwJorT51h2t+gbJVsIa7O+B
	2J7h4EVzFq7jg9yCv9A31r6rOs8JbFHYvK4CCNtK6/T3m6Tqco81Utao5/b81Yw58GVgFboNdRj
	N0MUcvSFijwmpOzbUz9ys2jTdy/m1vybvNLtRl+2hJTxbMWid/bZmJmRk3sljUd1CQEU1Mwbi87
	ndhE1BF1VYKa7kmcBU+GWV6SnAmg7Tx1R17F4fjW8niiB97E6blPk5MJI+7ihco+odN9qXVTl+X
	b/et2Kxk=
X-Received: by 2002:adf:f001:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48c72897157mr6171337f8f.54.1791437874320;
        Wed, 07 Oct 2026 22:37:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:37:53 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] ARM: rust: Enable Rust support for ARMv4T, ARMv5TE and ARMv6K
Date: Thu,  8 Oct 2026 07:37:40 +0200
Message-Id: <20261008053746.49631-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust on 32-bit ARM is limited to kernels that contain an ARMv7 CPU.
This series extends it to ARMv6K-only, ARMv5TE and ARMv4T kernels.
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

ARMv6K has been tested in QEMU only.

Built-in Rust code ran on Thumb-2 kernels on the Pi 400 and in QEMU,
with both ARMv6 and ARMv7 Rust targets. Tested Rust modules failed with
"unsupported interworking call (ARM -> Thumb)", also on unpatched
v7.3-rc1. One open question is whether HAVE_RUST should exclude
THUMB2_KERNEL && MODULES or leave module loading to a follow-up.

I plan to submit the enablement patches through Russell's patch system
unless the ARM and Rust maintainers agree on another route.

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

