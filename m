Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32E3ACEF9
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 05:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437892; cv=none; b=aYU7XMZSFM+QfsVAy0yKXiNFqZl69tUAnjS/2sgu6gvxjsFKboLrvozwav0G6ZzXpiLU3Xzc2+wjyhmawDQiLB8ZQVKoSxkTsqAf24GGWBChiYUY++NjlS6MLZcHcZ2TJS0qE9nhH+yOxLLaO6esODijkraLPBGZMIb0p8kza9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437892; c=relaxed/simple;
	bh=BvggPv4kZfzbeu1jtryiItpml/YYYx6+O0UApBbSUnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mUqt6CistrzS+ibpjYkaoF8QPhmGbiPwH/KoMRESYDr56tUQT1K+FeKlQCZBDenlmFzdBONmZspgdWJV5mLZbYwDzQvygBDTecOB3O0CRzIjfi1o22OimE/9K7FmGct0MkmulXO2XuOvJiCVDh2+F3Z2xvE+Pw7JYFkEIVEMctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C43ZK5Bn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C43ZK5Bn"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2965476f8f.0
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437883; x=1792042683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMKKbcz+29LcMEVBUnKydYLylxMe84zHBke0K0F7tBw=;
        b=C43ZK5Bn63KHG3WTfDgGdJsT7nryULaOrLWdV6J5OpAOkUJ3/BWloeXfhJgF2qkoEQ
         eH4sDc84FhkXKipM2SP2Pe2IOIK2HK5tJY18Lkl5e8kpDGfppSq4Wb0vtkou3/wIyCn1
         9SA9ie8ruWTa2r0ZEcuq+GiqCCZ+dNZgmC1plnOTXs7VfpWW7JDIoIuvKM8zEUUHVFiO
         5CU3cE1A+fj+qQpCoX6wtZ7HtWTigNBUjKCZmkXHiSW5dDEotVTvkuhUEKeUwCsSbssd
         wlgXVvYBX3w7sk0gz2ZnHP48xPGyey3jcUkLU3ga5t4a+DFAQ9vuZA74uRqkOBQp+2Zm
         a8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437883; x=1792042683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMKKbcz+29LcMEVBUnKydYLylxMe84zHBke0K0F7tBw=;
        b=GAAaboQPPJxlHDkqljWbGqOJjH40nybb4A2jcoSDwmx2owEg8uKLqhMFaLsjvWYKs1
         +RpRMvzPDvYCLi4ECpH6sYumSdhtCuqM3P64XjxRwQLDfeoiYxqtuD5QEvVgiN4gdnfN
         NwmVgtVk38sEff7ywQBwdiABPIdpLiMJSA+5N0xGGh/2Ykt8w8UfdcyI8Bx5j1L+h1p2
         Ne2mnaSKvluImUGGFqUQ+jOT7Q8O0UYgi8IDPyGej0Au0n4CtQws5qzWYf5xdCUcdLDO
         5ACaenE0L8I8pCzWnUOUCfjSh2XOSScUJB0k1nRFJ72CJUHO84JRxs5tr9UZV1Z9O47Y
         vnIg==
X-Forwarded-Encrypted: i=1; AKwUvByr0pINWHjMpag2tWwGSuDCUC32DREMEco/mwbCzr4x2KLhVHmGcIs19mpiQnknffLhpI3R@lists.linux.dev
X-Gm-Message-State: AFq9FYK3WmnNEv//SCy11VwmAzvlMV4Xi0jAqW5TpPTTcBMio3gIA8BS
	74KdsWL/azmN1Yzj5WBKG4TlWA/2HWe4UBtwyfYJQbzs5tFmxxAmaai1
X-Gm-Gg: AYBFou0I+KYuvvYkclzhf0e/mPyXHUkRCHUgEoOuw0WgvkRKTnRHwumpT7xISR7TCyA
	LGzsAKanGKDUBPPjtznhMt9mgV2m94gQtKscrIuGKiOBErGnCHNgOmn5acdxpR13jdubmmaz5O9
	u1KWWORRndrioYecnkDOqnDGPZM2Qs6QBMlqXMgRo/frhtcB3NiD9WpgVJsrdoJvTxVVi82gDPj
	DoFru7CpJ/DK5em4iF26N6x727z2172X+6MRKiKIERJ8Bo1NR52CyVsYyWv+5D+Ot0TQh76R8ZO
	Wk9jusdTXpR4IUXclIoAH2ehuogF3SIjN8/y4CUwI4O5acF0sVZynVjXvLVT9KT1lEkkV6csOiK
	mPRSEVxr6lIKcRIHIAW8Hpn9QnNSgWAvwW8N30ZjFEEU/sDk9fPcyKwOKzEtVPIzDdpKtdRzLPq
	hxbBMJdJD33/pxdcjiJve1j8uplYqgrg74EWrimUhWXejb2fgCKEXGDgzQJeT3Mj4jK+nPSUQLa
	Tozj5ANKgjjJ68Lbc4B8FBpSOtRM3+WAFbcXUA05QYBmII/enYu1+jgsLsOOo2SpWFBNWECzbGK
	XmA+tWCDd5rjBnnbheR9SR9Q5oToCGtxEti3wP1mjQiWOMcq0uGxJZpDs0FVTnFHREY6iMuvwTc
	GhyVpAok=
X-Received: by 2002:a05:6000:46d9:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-48c7276a71amr5394670f8f.10.1791437883101;
        Wed, 07 Oct 2026 22:38:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:02 -0700 (PDT)
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
Subject: [PATCH v2 4/6] ARM: rust: Enable Rust support for ARMv5TE
Date: Thu,  8 Oct 2026 07:37:44 +0200
Message-Id: <20261008053746.49631-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm-unknown-linux-gnueabi target used so far has +v6 in its
feature list and emits ARMv6 instructions such as uxtb, uxth and rev.
It cannot be used for ARMv5.

-Ctarget-cpu does not help. It can add features but it does not remove
the +v6 of the target. libcore built with -Ctarget-cpu=arm926ej-s is
still ARMv6. Adding -Ctarget-feature=-v6 gives ARMv5TE code, but rustc
warns about an unstable feature on every invocation. The generic target
also declares 64-bit atomics, where the ARMv5 one declares 32 bit.

Use rustc's armv5te-unknown-linux-gnueabi target for CPU_32v5. It keeps
the Linux EABI (no short enums, unlike the -none-eabi targets) and is
soft-float and strict-align. The target is chosen next to the -march
option so that both follow the same CPU selection.

Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
lowest architecture and stay excluded here. CPU_32v5 also covers the
ARMv5T ARM1020. C code is already built with -march=armv5te there, so
Rust matches.

The kernel crate implements atomics through the C helpers rather than
core::sync::atomic, so the missing atomic instructions on ARMv5 do not
matter. The only gap was the 2-byte xchg() added by "ARM: cmpxchg:
support 2-byte xchg() on pre-ARMv6 CPUs".

core::sync::atomic types up to 32 bits still compile on this target,
but LLVM lowers them to __sync_* libcalls which the kernel does not
provide. Nothing in the tree uses them. Such code would fail to link
on ARMv5 while it links on ARMv7.

Tested in QEMU versatilepb (ARM926EJ-S) with versatile_defconfig. The
Rust samples, all Rust KUnit suites and the doctests pass with the
current and with the minimum tool versions. They also pass on a
Microchip SAM9X75 Curiosity board (ARM926EJ-S).

Link: https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
Link: https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 8 +++++++-
 arch/arm/Makefile                   | 7 ++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index bdc42a24bf30..d6d1bef44c8f 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
+``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b5816f28783a..9275a85f95e9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && ARM_RUST_TARGET && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
@@ -172,6 +172,12 @@ config ARM
 	  Europe.  There is an ARM Linux project with a web page at
 	  <http://www.arm.linux.org.uk/>.
 
+# The CPU selections for which rustc has a matching target
+config ARM_RUST_TARGET
+	def_bool y
+	depends on (CPU_32v6K && !CPU_V6) || \
+		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
 	help
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77..168779e9e93d 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,6 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
+# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
+# the +v6 of the generic target, so older CPUs need their own target.
+rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
 # testing for a specific architecture or later rather impossible.
@@ -150,7 +155,7 @@ endif
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
 KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
-KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
+KBUILD_RUSTFLAGS += --target=$(rust-target-y)
 
 CHECKFLAGS	+= -D__arm__
 
-- 
2.39.5 (Apple Git-154)

