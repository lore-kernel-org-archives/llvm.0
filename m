Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34654EECD
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923541; cv=none; b=lMcc2Nh5X8fPZmJ5iQwSsowV2euUzvwTm+uEDHVfAsy+hm+qQj+mVynO7VjFdDMAfXhIvwNFjvWEdLRC9ztXzOtRsOqCk/SXuPfzbIL/HU6XtGo5zTgLFZ3ay7qXxCo1pn3DItf9MRBPxVkPru2jpa6MWFhIpIFWzDnZ1+RrMWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923541; c=relaxed/simple;
	bh=f7ap597eqe9kIeMvfJIQIfj+KMtkVG+gOZihvU7+3hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hDF1V5i47V/f5Y/KY7pPr0ZvM4/XCpJNX2vYA9mR1nMz/F+J7pdto+mGz3MpIuIY4qo32jGHw40c4vtrSYhHrtPSw9LeyAvav78U33s2hZDlQhC6FIYshPROjziAOnoWoAdNGxqQpKPa0QP4GR8VmWJ7Zn86dzTLFDTglYx8h64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xuu2l5VR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xuu2l5VR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so2824005e9.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923537; x=1792528337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=Xuu2l5VRk1cx79FZdCAZPJRszsMBlMox4STFhP8xVpjWKWYuUvVhdAkzzqNZN3cGln
         Q9PFE8I+BVZVpXeBYMTBpiclkaMICMNNZbyen9qxMi00CTmFtfqcy7qaqUeXzkW/Oosq
         WWX7jkYh847X1iNTXKVk+homhSOG1ehN7871l6zOaNhTCaOio//vP+AE+wymMHuFnrT1
         mgop6zmSe3Da5LM0Au9xXelLvgwUl/aZCkf1fL0t2UQ1Mufq8arHsNi3tahBWKeLErJh
         addGuq/v9PMsaVC7UPlXc4NpnXYNtOMvOE7EksbnQO+U8bRy5dd+hbilFI/X3gi8MMbQ
         Kx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923537; x=1792528337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=bD9GGO8WG7ydn3WCuM067kyeTodxZjVR5VsrOxR+LO0AUBIozmkMMQe3neBJ0oI1Zd
         Hdg+rWIsm8FYfk49EHPONAJgL9XMauCxu8xeTkTL4YNk0kusLcb+keVsSoc8EtlMO2UW
         K8Cav5NnwhiX+u4ye6Jlooky9lLK4sZBwwif1qixJPhrc4pRqBlT0Mct8AlSh1RFbqBL
         Pf4nOSpWEz2LiBxleARJ7cQFYPF/EuGhtXQiZMZs8WFyYgljbBuUIatgj0tVYZhh1Gqb
         utrxr7VpeRUoC0cQE9RYQ3zTrdRY0jyNPz2hT51kx3HTccDf/ZMlLVr1CSWfh9H4F3kC
         kOPg==
X-Forwarded-Encrypted: i=1; AKwUvBz2ok5vjtMawUHTYvU0XKmTN+1mRi2oWG6Nn5VWphq9Gk32dR6o7wSw6CXa/7jHEiJJFxo3@lists.linux.dev
X-Gm-Message-State: AFq9FYIvfpKn0/3J4fWPg6Y9TMP+9py95q7omp3Mkp8lOKDEEARqRnej
	7ZDzQLx2oQHqYUhVJ/1UDwxtavHnOUTLAGnd1mTFsSOGEy24IeQoCfRo
X-Gm-Gg: AYBFou3eN1FHjVZjnsZoUlVU8mU7e/FHXzTvFY3adWguW8Dc6HpR9RyS3WB9r1gEZtI
	pw4x2nSJ1NijuBY+34z2EXk97cIc4JIeI/ztQANHeHzn5caIvD5ci4YBglLaGAf133d2rHfUiHE
	ojymgw7/QEpHBp35VbizVtOdcjr/BngC0voGMBuB4QwK854Hy2c1UKRlLvNHVw4PIWQ8ie5oDMB
	NJJ9vOb5Zhc8EstkndxtsqE/3ijlIkLRwStbwDPQLVhesn9U0U6BotlDEOJyuoxNJF/9wcEUXRt
	NSCMDm9X1Y1f5GkSk3RfHlQZgkscVsaDlHilwwUlf8I2pmI9bNHof70rt/h/Io25Lg6hwogqXXv
	4hLSZ3jRLgZ0s82owoZ+tH4C2F/1eYzbX1Y8sVj+RHTXTjZvQKoYqaNvHp2pzb+3QCQgyyADIRH
	9eEln2DZCFD2bvaW7T/GlStyVCH9fjdyZa+4IAmzO8pR/K5Lj5HOlfiUU1DqDp0Hpqr/sTWQeh2
	2JMbQrdjZMrAE1VUYpocuas1GYaU0yWGSrtbElnlbe4USRmj+PMb9ls5RXatjcaSEvcvMc5DjOQ
	ZoXlmcYho0ymsajFDkgeNeeCuKCiliaglvIcn79NO+R84/SEiEKi4QoUUmVorZKLqR+VfTppRpp
	cwZWRNw==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr72732765e9.33.1791923537100;
        Tue, 13 Oct 2026 13:32:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:12 -0700 (PDT)
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
Subject: [PATCH v3 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Tue, 13 Oct 2026 22:31:39 +0200
Message-Id: <20261013203140.31741-6-kmehltretter@gmail.com>
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

The armv5te target emits clz and blx, which ARMv4T lacks. Use rustc's
armv4t-unknown-linux-gnueabi target for CPU_32v4T. A combined ARMv4T and
ARMv5 kernel then uses ARMv4T code for both C and Rust.

Plain ARMv4 remains excluded because rustc has no matching Linux target.
This also depends on the preceding 16-bit xchg() support for pre-ARMv6
CPUs.

Tested the Rust samples, KUnit suites and doctests in QEMU sx1 (ARM925T)
with omap1_defconfig and on a Microchip SAM9X75 Curiosity board with
at91_dt_defconfig.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 8 ++++----
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Makefile                   | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index d6d1bef44c8f..3f39cf55b6f4 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -12,15 +12,15 @@ which uses ``libclang``.
 Below is a general summary of architectures that currently work. Level of
 support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 
-=============  ================  ==============================================
+=============  ================  ======================================================
 Architecture   Level of support  Constraints
-=============  ================  ==============================================
-``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
+=============  ================  ======================================================
+``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``s390``       Maintained        ``CONFIG_EXPOLINE`` must be disabled.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
-=============  ================  ==============================================
+=============  ================  ======================================================
 
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9275a85f95e9..cf782fc04872 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -176,7 +176,7 @@ config ARM
 config ARM_RUST_TARGET
 	def_bool y
 	depends on (CPU_32v6K && !CPU_V6) || \
-		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+		   ((CPU_32v5 || CPU_32v4T) && !CPU_32v4)
 
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 168779e9e93d..a72843890241 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -77,6 +77,7 @@ arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 # the +v6 of the generic target, so older CPUs need their own target.
 rust-target-y				:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
-- 
2.39.5 (Apple Git-154)

