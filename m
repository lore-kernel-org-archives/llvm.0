Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B824FC8F7
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 20:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923532; cv=none; b=ddFVjoDIFO+TlQMbpeQzRNWJR1Po+gukGEKowW1EXeelpWP0TASX5K6iOxwtxxK+pQAdOGWOcwnDjMbi10QeQwCiGn+8ccIVZl2VEALfw2vPGXTvSgMHuk2wuPE424dNG57PS2+ArknCz6MT2g4sF//8r2EMAlnMSo6E4eP9ovk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923532; c=relaxed/simple;
	bh=6jzevAkptcRlNrutookFDiIxJyIEnbNFeuEECc13Y58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DMDtneRiJITi2xJuYbqPB61Yl9aUgqkqwh5zaSjhPMO+c2BmgbgM4cPD0rvV8NNHTHfESqia3iW0N7w57RGoSJB/P9ZvxERw+0GhXKIXPdKnG10MvHVD7H8DlW/WHSzmahI1/fijjXU/P/06I4nnP6UcGJ14nleMpI8MEYdpXZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELXrrqxh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELXrrqxh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so29460695e9.2
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923529; x=1792528329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTwlneqj3qr3pDNWamOjPtbvpbl/6xcVvo91j7W6eTk=;
        b=ELXrrqxhiYVTHd1IyhDBByggNdEZvndtkHR7uAYsiPjKNwl7RblMdKf5XVsr9JLJYT
         63K+7n9j5LaH//LkdA5K5zZmnuZJAHgyjVSJQL2h+8rDBkUEpBI7saujn8FJBw9wyKgN
         S9+6Gejb+7Wz11oja1E7O2k1FbutM8ksIYuTorCm6pxaUo/gtt/92Jrlg9lGifRA8VP+
         UpNDO55wQXiP5nLgNDCxbYNA77yLVGZP7CfkN3vDkXtWxg6VWL/bNiLaDNiBZQlxXBJp
         huTlWxcG9kEd40mjK26zx4b5JKrvRNZvMlZtiZlCJkWMTEF14c/dOl/0tJodY3A4yQTY
         1zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923529; x=1792528329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTwlneqj3qr3pDNWamOjPtbvpbl/6xcVvo91j7W6eTk=;
        b=hA2gFh59mmL+4Zw6wiIjdfPcXgf4FnwjkBR7KhroGaveAmQKA+wiMj2N0AQsh2iysN
         EO+AqvQPYrlGcnCDSJ2Gxrr2CcBYVtP4m0eMi8+AxL/xRX/2KRGnh7MTL7YiiHDTm1Jm
         Qy6nFtrx5KZ1YjmkM670rIylblqnk+Wt3pmQjPFoyfOsURg77guMxxHbirXlbvHFLD6N
         vpkE6oQMG9zTZ1P42dBiYoCh04Cn14rUokN+uBKKiJJy43L5RniduFCspHhh7rgq6m5A
         zdIUSVAwAq3SS8XNklp1MhXGPWXV0mcvjP31ClsY0IHnQvmjDPW+QMmh/Vjf05MONjc3
         6SGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnP24mhvdnCDNzeB/pQfo/hfLry4iOhfqDWxg/vvPisYAyk5GbwiNf1GtYipNMlpZ4lWOY@lists.linux.dev
X-Gm-Message-State: AFq9FYIXtVtgwF1q3RmuTpcQrGU86BvLUOGWFuQqxWPVaM727lvMkPV3
	o7FQxyCQ/05TePso/02bYPZXOlb1cm6ClGhDDC6ylUOR2xP5DKH89K0I
X-Gm-Gg: AYBFou3kB+9QWZFQJgWUqgHuKsvUg5+zarkZs4uZha/vHwgpFGJWf76fej8XEl3N7J6
	as8ZozLpA0Hjyx1j81EAjx6XUt94JUNYqBrjfZKDY9+IB96kI2wbj/EJf+ZMsr76LQlxGsktaTz
	dqy2R/37Tc2MbeEGV2uWu12XKiow9XzY2xuMaedLhZMcPYYejmBfFfemlwQyJcb2S1eQ5jxoPn4
	0Qt5+syJhrODUqMLrtFx9mXTJeoyn1MqZzWhGsFw+mT9Rwmk+raEuZinPpnSzG6mAJUWLdP4P5R
	C9dld45VT4gs5+HJ7eRzKqkCDfi0Yrvv+AU6rvGg4K74j2aBqpPa/GYdEvxIwaHW3y+lwoQr60C
	NLa6PMy91l9ljJH+x049mucG0bOuIO5585CG0dejqZBlbYz5VC7ljnFA0Ao1Ma5WDFN71k07h73
	EdmcMSlGM8QDxs/3nYS0JwsjBL0vRTbHPuQIBAh2U7aztVhcV9m7DBiyNLcQV/96UXWZG/UTm0V
	vnb4EbdYix3bq/E0cV50yYNo6Kb9nmh1lNFw6xK0URGG8V/TA9Dp9URu+u0S2LKlxUDIW3xET8v
	sDAw/9NGqZupUqDMqKthIP1pmIZ13uZKW56LYmxFeGC0YEKRzmMIp/Qgzd75bLveTWjVVFXnPrB
	rf3+cJw==
X-Received: by 2002:a05:600c:3111:b0:4a0:1e87:910 with SMTP id 5b1f17b1804b1-4a18e4cb7a9mr279439145e9.20.1791923528844;
        Tue, 13 Oct 2026 13:32:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:04 -0700 (PDT)
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
Subject: [PATCH v3 4/6] ARM: rust: Enable Rust support for ARMv5TE
Date: Tue, 13 Oct 2026 22:31:38 +0200
Message-Id: <20261013203140.31741-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm-unknown-linux-gnueabi target enables +v6 and emits instructions
that ARMv5 does not support. -Ctarget-cpu=arm926ej-s does not remove
+v6, while -Ctarget-feature=-v6 produces an unstable-feature warning.

Use armv5te-unknown-linux-gnueabi for CPU_32v5. It uses the Linux
soft-float EABI, requires strict alignment and declares 32-bit atomics.
Select it alongside -march so Rust and C follow the same CPU selection.
Kernels containing ARMv4 or ARMv4T CPUs remain excluded. CPU_32v5 also
covers ARM1020, for which C already uses -march=armv5te.

The kernel crate implements atomics through C helpers. The preceding
patch supplies the missing 2-byte xchg() on pre-ARMv6 CPUs.
core::sync::atomic remains unusable because LLVM lowers its operations
to __sync_* libcalls that the kernel does not provide. No in-tree code
uses them.

Tested the Rust samples, KUnit suites and doctests in QEMU versatilepb
with versatile_defconfig and on a Microchip SAM9X75 Curiosity board.

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

