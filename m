Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D3454EED6
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 20:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923525; cv=none; b=KlWCRbmE8+MpAJMhJCdGVVU4uMDRRV5yYjaIbOD4MSiBn8hHm45oBNd7cXTFfLCLnJECV1INPOte9kThXZo/IwgqnvSxZi8iHXBvVE2wqwXf7laghsSEnwD2WZVsSz6Mf4eWbgBidKU8X+gJ8eXswY386pzaNq/L2p6IcgXcJos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923525; c=relaxed/simple;
	bh=Rx7kIxbLHXdF9I2gk45fdOzTLtgLKhJVtVTgxKv7ILs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T9Cb4sZ3+3+EwMJxqtaXV8KPpriLlY3468exZowqaZYbu6pi14WDsVQxInE2VfxTU+4Hv630zbTBdTR29zCaHq48gf+PFiPkBE3SEQwYS4Xmj9mRHoS8zNljcRjysZlpTDrBjs1zIC5/F1MjohAaT8nTmyNK+QSA4yzraj2R9Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQlfF6RC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQlfF6RC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0759so2613742f8f.2
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923521; x=1792528321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsJzxzIv3ovo09qKikb4d108MqzJHNidveoqqS4rQ/k=;
        b=NQlfF6RCg4+vNYi0KPVwlm7viqxza1Cm91xSxFgYNYXapmHVg1LnrHgbLuYDpaD8QH
         TpbLlNQYWMt2pxBUC6ePAsxBAA7I4Zi0sZw/rSuhW5gLUCZpa0Pspy/lE7Sy8NQGWphw
         pfAWrSmYnYnlJcDkdtAgn6VCQOCZH9jxwrMWQMMQWh1G/wGkMyQCgz2KUHtmpCJNarvv
         07yREBUqYwlsQi+6uRijqf6t8DAYzAU2iY+yJIt6Vr9ncGZeFk9Vtz+NICFepDAvZ5Ui
         7xmnLiGcCFJyW4882LSdQALKM3Blu0F21uPsXsw0P53wZKNoXDlrZ7aCvKmdMgZOZRCi
         vD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923521; x=1792528321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsJzxzIv3ovo09qKikb4d108MqzJHNidveoqqS4rQ/k=;
        b=QQUViCuzG+CzBX+PJrB31Mo2gpmlemi9ycn8okNpzpRAWjdG4/jDe119/OF/dla/WK
         cKhp1Gr8GuoKFs8zDjloIAog4bguwO2TIE00eJXuHXpaTlspUwpAsEvtXfd9gLZ54F4z
         ipGXC3Xv2WNgb9UomGXZsPgAFp+Uc4erxhe5I+1Bm2CLRvXTXyEv9171euEX7VbSpGSZ
         xB4k7UQGUHPW0iPvntYtmnyCyyfbvbuOrKouU6jo1EaEAzGeiXepGC9nCMRgfKDnjcvW
         MdoEsK5bkJhPIezQ41Zfz8W9ETPz8O2GwSIBTP/36dcpRE4eASvpn7aVP6ejiXWqLIhT
         Vgfg==
X-Forwarded-Encrypted: i=1; AKwUvBwDYo97ehlNud3C82w1LYjhNhKToKR0DtYW862fWfC3uyg91GKUpXEyBcLv0i3q0irICBr+@lists.linux.dev
X-Gm-Message-State: AFq9FYIhPBT0ORbeu3UPdRcOwp+gzt2ugqEKw1QFp6N7mcYPp7RZsh8V
	2GufqwHnUq3aY7GFRnr377nHSdLgC1UNbA5fDw3qPOI5uPPj9RpIomLF
X-Gm-Gg: AYBFou2PDgdZh4ZkGNtkki7TIB0YPp55+ueUf8H3mrW6t/i9KklRhRts6uhb5P6O9g8
	8xeZfuhU25jEwRmrmN+enhAPcD21f9BKuRy2o6FGGQ5bpQSzstDQMAMfhUziS0Gu3/uZ8hOgNaq
	wAJjAXYrUy9sk6EtoZON9vbfEXGGTTRkyEMLMKrgwzIqU5UrLZsUhLjvjs1o+cB+yFTmN06QrVd
	AwbVYXxIdFyc+eAoKW1jZ4fyNRGD8BvAn9rhIz6OeqgVM/0EMc7l2v5XHtxumXytn0pga9yQmzG
	nKcGAatpG7RG+WBpJMdcm/RybWFoUFg2UXoJovy7wJ+XPoSx1ds7h4/X0rwcpWl0Uur4q/qhMPm
	0jEYpIa8DJ+RydzwbeE/aJbx+d6IcYmFGzr/1Yf7csZtPGsbEfetLCykqbX4EPUWUzdgdEUFUoC
	uRTV2LJkdNa12sae0h32JanS/Ku7w/Gbv74ZbwjPJtQ1WNFHrGt3dSRZDPC/qC/1/nsUiY+bVY2
	blA0yCO+Q+UWAtf7hmCiUHMLb/9lVKj4MRL2j5JVorKkLOBzKmOk1ENIQAIO7vdjXuH4ISBod73
	/Ailu7enJcgTZEjgLxoEvFyyr/xq5qFRC/xbUvS6M609vpGtcx0Lxt0ecw8D1qZN6t2uGjQHYvM
	epdLuuQ==
X-Received: by 2002:a05:600c:524d:b0:4a1:80d8:aeb3 with SMTP id 5b1f17b1804b1-4a18e4a95c2mr270482865e9.12.1791923520806;
        Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
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
Subject: [PATCH v3 3/6] ARM: rust: Enable Rust support for ARMv6K-only kernels
Date: Tue, 13 Oct 2026 22:31:37 +0200
Message-Id: <20261013203140.31741-4-kmehltretter@gmail.com>
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

HAVE_RUST currently requires CPU_32v7, excluding ARMv6K-only kernels
even though arm-unknown-linux-gnueabi already builds ARMv6 code.

Select HAVE_RUST for CPU_32v6K. CPU_V7 selects CPU_32v6K, so ARMv7
remains covered.

Keep plain ARMv6 (CPU_V6, ARM1136r0) excluded. It lacks 1- and 2-byte
xchg() and 2-byte cmpxchg(), which the Rust atomic helpers need. The old
condition exposes Rust on combined CPU_V6 and ARMv7 kernels, which do
not link.

Tested the Rust samples, KUnit suites and doctests in QEMU raspi0
(ARM1176) with bcm2835_defconfig without ARCH_MULTI_V7.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested the full six-patch series on a Raspberry Pi 1 Model B+
Rev 1.2 (ARM1176JZF-S), with bcm2835_defconfig without ARCH_MULTI_V7,
clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2.

All 368 doctests and the Rust KUnit suites passed. The intentionally
disabled KUnit selftest was skipped. Ten Rust modules loaded and
unloaded. Misc ioctls, configfs, scoped debugfs and rnull read/write
checks passed. No warnings or oopses in the test kernel.

 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 2 +-
 rust/helpers/atomic_ext.c           | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 4f980815e92a..bdc42a24bf30 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv7 Little Endian only.
+``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ffbc7f386131..b5816f28783a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index c267d5190529..1d157df29229 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -42,7 +42,7 @@ GEN_READ_SET_HELPERS(ptr, const void *)
  * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding xchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_XCHG_HELPER(tname, type, suffix)					\
@@ -66,7 +66,7 @@ GEN_XCHG_HELPERS(ptr, const void *)
  * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding try_cmpxchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_TRY_CMPXCHG_HELPER(tname, type, suffix)				\
-- 
2.39.5 (Apple Git-154)

