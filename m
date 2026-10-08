Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FA3BB102
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 05:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437886; cv=none; b=T4bzTAhdnnpx+z2UzauO4Wf7JV+AcbuZWeDzpHLouT7zWwvEeY1FHeNozCmP51skYnU3Ghlyb5O7Yy6KQ3c/wIIPLf5zcEP+toR58RlvBUqrq3gqHC6/3FwUNTqU1fg+TJcfzdUFgAapKfiEaRJjYKpbIvQqOlDdbebyJjhtxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437886; c=relaxed/simple;
	bh=JEQbn+ax2E/aRdIc5y9IDts//zVzmXP9z5ZCd4sUttY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h+FXF1i1TyVg8KQMQwSnT/yot2JlV2aLrVegmnPyIJ4GfNj7ZoLl4rNdr55u9XH/jxtYXGy+zPkiCQh094yEW/ZKMh5chhAau6KA1HUZguAWJLlmps7ClYpiy59fVm5FKkTHS4dtZuhglYshKWDLjj1O5pagcqJTwSNl1CoBYRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNOMk2cS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNOMk2cS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1657836f8f.2
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 22:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437882; x=1792042682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWLFTt24RYDJvEJDwU+vEARTDOg0wmnK2jYoZBai8H0=;
        b=YNOMk2cSyJlDq58XIEn4CT8FTK179IxveljwFdwMbC/GERvcNXQOdxtTZONoJ0Li+s
         OZ5AO4yg5AvymRwQVJWYEsh/QPAfaD4hZg6KAbSdYUznxCZMB4nxEi8DhsJIzREZ3LSU
         Qy7HbVOC8lKChzwYLVsY7n4tPWfuqeR0gUrQXiJl6VF75V6VNVMK4szwUWMTs/Q8+5e2
         VlGODjraYfLAbfrhlUXj3LUqOD+8FLre/jDG7h93mIGrcV27PaktOsFT34KxufSCIbMf
         /+AlWi//eLKMD/cJUEu4Fs8yV/F4UOMnRSlzdyufrEphSQD/5rswR5lG2gpsAvx0kUlr
         20iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437882; x=1792042682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWLFTt24RYDJvEJDwU+vEARTDOg0wmnK2jYoZBai8H0=;
        b=CioSIgONjk4ocFSPvPAC2AC47A4hceZrGfa1HRhabxcnBIdriHEmrsDSbBlwkUY+16
         YMtCLrzHWLEzng/5JnQ+xgynOL+1KKMjl+BUM9LxWEtzaamKfoWBKHPU2B4HVlLMiwaE
         It2RbVgm+pQhibrALV9utvsm+W5m+KwxDM3yswMyFqM5gPXS/NnfeRhICFvjznkukHdE
         KJxVTAZWzLtMhosGhsLFUyq0A09fWlKumie4ETxj9Skki7c9SraDjmdASn7B+6VVPXni
         wXO+QSATSvIp2mwsm9EbwUfj2gtYEtAGHV6ZQcD4ZrIQ25OsjkBbX5B+VDyUmrNYKm23
         12Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzz/JEl16iKbLRzReN7PFpQJ34Bew3KZKCD3IQ2EKzvveKxaKULxpLpGB/jgwFExYroSCUr@lists.linux.dev
X-Gm-Message-State: AFq9FYIRPi9o6g1Nb2AcZMQW4qIYtHJDfpCjqMnyWZpwqf4xyP5bSmNF
	Eelm7M2xhxzMyHwdCNSKGiBzss5jRLz2ewQ7NkxtyyOZFpVazWujvsli
X-Gm-Gg: AYBFou2u8q+Yi/dOAF+bsU4EvEw4z7ZHpeKMeLgw20I1TLXVTyT+EbklA1KZhZjrW9d
	qnZYLSNBR0QzbCJ397ht7PXBFtN9Rj6DW+HS1RU34sBv1xTT513lFy4erGKZaW4+5ncvyP0YuTE
	Z9tnc5GnumWPjGSDaFQ0rrG/bgEQ0lM9Yz2rdD0aLWwj/W95FCwME7puljqleQBRmmvGLrMymb5
	BL7h83QOEz+G12JOxjkGlg8DIPEBAfaXCQoBZL8uDft7PRzHMkQIPw2bG44+Ark2f46ooJbn+Fr
	F/zMP+xJlxUMUNqNH5qbb7oGdbh7mgXcvBkz0AsvYniROvBoVlTDUwhSSZ3XXC1mslTL+bgT7pq
	CSKy9OsjngCXq1sDDkHJ1u2jJjR4DQ6LH7L+XzZnrJpUY65UF7nnN+zVIoNx3A8sAFZ9Ze0coPh
	eKyIIDVGV04TmtEBBWczQ+sq0i2H7XavrLz3OJ5MEbmsKhhZYvLWVFqtIi3gIpnkmFgvOgP0Iq4
	T3jpblba9WcX+jfE4swthbHOIimCr1TOaPXJQHuXQfm3c0Zjzfq/5yTqIc0hC8eM1s100+obz4L
	jkHmdptcpvHm2s/YXcftYqFBqOV1b2HHBbjUb2Z2dWa/BrJa/RnZoXfFb0AKQnxFZOM5OfpOI+v
	1eMHXVX4=
X-Received: by 2002:adf:e19c:0:b0:48c:4e9e:dc7 with SMTP id ffacd0b85a97d-48c727871f9mr7979486f8f.42.1791437881355;
        Wed, 07 Oct 2026 22:38:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:00 -0700 (PDT)
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
Subject: [PATCH v2 3/6] ARM: rust: Enable Rust support for ARMv6K-only kernels
Date: Thu,  8 Oct 2026 07:37:43 +0200
Message-Id: <20261008053746.49631-4-kmehltretter@gmail.com>
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

HAVE_RUST is selected for CPU_32v7 only. A combined ARMv6K and ARMv7
kernel has CPU_32v7 and can use Rust today. A kernel built for ARMv6K
alone cannot. There is no technical reason for that.

No CPU flags are passed to rustc on ARM. The arm-unknown-linux-gnueabi
target has +v6 in its feature list, so Rust code is built as ARMv6 on
all of these kernels already.

Select HAVE_RUST for CPU_32v6K instead. CPU_V7 selects CPU_32v6K, so
ARMv7 stays covered.

Plain ARMv6 (CPU_V6, ARM1136r0) is excluded. It has no 1- and 2-byte
xchg() and no 2-byte cmpxchg(), which the Rust atomic helpers need. A
kernel that combines CPU_V6 with ARMv7 can enable Rust today and does
not link.

Tested in QEMU raspi0 (ARM1176) with bcm2835_defconfig without
ARCH_MULTI_V7. The Rust samples, all Rust KUnit suites and the
doctests pass with the current and with the minimum tool versions.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
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

