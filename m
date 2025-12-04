Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4830B30DD19
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834929; cv=none; b=TZCUBDBmm5xcA2c1z9z3cRdjsY60s629BnBoyQR2B9h8gX0iV2ovXN1GzySfWo0OJltUNLF5gsFBMTocSnBKMIpgbGMgVDwstlYdQPWELwlXu8363clvzRXAVbWPh33lDW9OkUoleG5GGA6q1Cq0S9L6sQpFnmE6zHs8WFGf2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834929; c=relaxed/simple;
	bh=4okMZpRD6wIoEgayUCzJK//NuknOM3zeJimcoyL1Et0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NBSA3Y3dGmQk7xeeehLgop4ERUjPIOteAQJ3Sobu2adobvVf8u2qZN11F7RK+GEun9gDzjahuf6qoOIqMQTiIXi6hB8695XMQRX58R5OenQO+FrhOfZ/G5YOBz/eu2Mw3n8QiDHBpprcmgL7V/u9WkBO5cJ5IbSANPItvmuHTsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRysDMcv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRysDMcv"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59581e32163so675161e87.1
        for <llvm@lists.linux.dev>; Wed, 03 Dec 2025 23:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834922; x=1765439722; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFpDiwl5QELAGSjHLYwP943u+3dPXQammgNgy7agEDk=;
        b=aRysDMcv1imbZSt6SNa1iPgTC28Fd5k2C3v5aW/ZFM5Kr5VJtIHEqUb0kOUnWQJzoK
         gQAhbIlQhjzSXmNcBCdne3EDIfymL5N3sQdaHdkEIpp1T3OxzmFc6iHmiyB6IVy92SzD
         UvzD8z2bjTouoDP5YVcEmp25DhaM2HslN4+h94Ptc0J+uXKiz2IbSEU1zqq85d4XY9ho
         YhVYQe7iIjSkEYVxVz8BO+Z7WXgrJT78yu8pWxXG1xlpit4QqljjAlSRYh+QrwZFJ6EZ
         Z0mUeRV/mkEh4+Cpwmoj8X6XWghM1rDDNe65YKeJyWM1fH8l65XmCuuYXeIMx1eqAGLB
         hHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834922; x=1765439722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFpDiwl5QELAGSjHLYwP943u+3dPXQammgNgy7agEDk=;
        b=HqGp+/JSaUR9qoYLzfPCJ4qppt00nQ0gl6dXgbz6xzkTHjZqyeAmKmBmwp4TcKj2sv
         kpviVuQnmOEj811WGw1IVLkb3ozaxHdPUt3DJLDqkPyet1b5RoKgUKqJEIxuuoJcXxWT
         0SSoVCpIPBlFOVPqmtyCxwLBdCVNbGp5zybrmKE0JvBTArBxHY18ic1tYA9uKe02g+kR
         znVbq1UzBQi0nMFJSFyO4Fu+f6iH3Dne5L4KXtF49TX8JKYxCeG5tUGRafU5LI2NtcKj
         5Ch2ju4ZYc1INCtMVPQbxY1I8anLqC0+Qap5y/2lg9oDYq4fBbHcTOZQFUuIP1xFcM6T
         fujA==
X-Forwarded-Encrypted: i=1; AJvYcCUzidwE0RLJZiHTXvLEDaDTFUndLo6/5Tfb0LnE/b1M+e4qf0vSxSP5nD+878SKfev2cfwq@lists.linux.dev
X-Gm-Message-State: AOJu0YxeOSopFGi3ANL+kzr/ou9L3BqfwNQ6FTRm+aybaaMXy6wlUJVt
	ao+dmirPRWS8XRpaz6L6e/YHabc8mivJhxRv3xw3L7BJwVNw/AS+BQE6
X-Gm-Gg: ASbGncsCiSkkv1I7kOy8vXPUBVbMhF/BIKJkItFSIdzeP6tkWrb3aExbwzieEuQKLXz
	/VVilhjAqngjhoVV2uqNcd03K7SEpxU+vuG9RAV30nF9OJsRnq2lf5ooFVMniY3v4FHs7XHqnLF
	Nj7HmXalX8rj6JF3bH/deEV84b9CnlJKhaGVvfZJEmPGBG9mblFVXxduOLmzcfQ1MU+hH96V9NE
	sndGdEYRKp2uL2EY1RdzdQMkTCEeNBp6BHs0k3z0WfnTDc6wNjfQZFe+Ud3eTjt8Naa6gRSk7iS
	T9wtITpSEFpXhNUdO7Dp6qH6NGd2RMLS/tq4QJH3zJNyertleILcq8X+LBN0nkBiwrqeJoUvef8
	vigLW853aFEpNljyrFbdIaVgJRMGhpl7AguzNzD8jJZeKAYeYi+hLQAVBDAS7AKyoWdBW7g==
X-Google-Smtp-Source: AGHT+IEhDlWE8of6FKJZTBdolMkdIJwrQS5sBkMxqZRx1jm7mgw1ED3Gz3nsCefElmIVs2UoNwo5Dg==
X-Received: by 2002:a05:6512:3d87:b0:597:cf1d:bc77 with SMTP id 2adb3069b0e04-597d66c8085mr614377e87.29.1764834921676;
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:54 +0100
Subject: [PATCH v5 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-4-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3

From: Asuna Yang <spriteovo@gmail.com>

Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
+ Rust builds for RISC-V due to differences in extension handling
compared to LLVM. This commit enables GCC + Rust builds again.

Add `bindgen-option` conditions for the availability of libclang to the
RISC-V extension Kconfig symbols that depend on the `cc-option`
function.

For Zicsr/Zifencei special handling, since LLVM/Clang always enables
these two extensions, either don't pass them to `-march`, or pass them
explicitly and Rust bindgen libclang must recognize them.

Clang does not support `-mno-riscv-attribute` flag, filter it out to
resolve error: unknown argument: '-mno-riscv-attribute'.

Define `BINDGEN_TARGET_riscv` to pass the target triplet to Rust bindgen
libclang for RISC-V to resolve error: unsupported argument 'medany' to
option '-mcmodel=' for target 'unknown'.

Update the documentation, GCC + Rust builds for RISC-V are now
maintained.

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Documentation/rust/arch-support.rst |  2 +-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       |  3 ++-
 scripts/Makefile.rust               |  1 +
 4 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d0899..5282e0e174e8 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
+``riscv``      Maintained        ``riscv64`` only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fadec20b87a8..9a5606396646 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -193,7 +193,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
@@ -617,6 +617,8 @@ config TOOLCHAIN_HAS_V
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
 	depends on LD_IS_LLD || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64imv)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32imv)
 
 config RISCV_ISA_V
 	bool "Vector extension support"
@@ -681,6 +683,8 @@ config TOOLCHAIN_HAS_ZABHA
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zabha)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zabha)
 
 config RISCV_ISA_ZABHA
 	bool "Zabha extension support for atomic byte/halfword operations"
@@ -699,6 +703,8 @@ config TOOLCHAIN_HAS_ZACAS
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zacas)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zacas)
 
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
@@ -717,6 +723,8 @@ config TOOLCHAIN_HAS_ZBB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbb)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbb)
 
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
 # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
@@ -732,6 +740,8 @@ config TOOLCHAIN_HAS_ZBA
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zba)
 
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
@@ -767,6 +777,8 @@ config TOOLCHAIN_HAS_ZBC
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbc)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbc)
 
 config RISCV_ISA_ZBC
 	bool "Zbc extension support for carry-less multiplication instructions"
@@ -790,6 +802,8 @@ config TOOLCHAIN_HAS_ZBKB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbkb)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbkb)
 
 config RISCV_ISA_ZBKB
 	bool "Zbkb extension support for bit manipulation instructions"
@@ -877,6 +891,25 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+config RUST_BINDGEN_HAS_ZICSR_ZIFENCEI
+	def_bool y
+	depends on !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zicsr_zifencei)
+	depends on !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zicsr_zifencei)
+
+config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
+	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_HAS_ZICSR_ZIFENCEI
+	help
+	  LLVM/Clang >= 17.0.0 starts recognizing Zicsr/Zifencei in -march, passing
+	  them to -march doesn't generate an error anymore, and passing them or not
+	  doesn't have any real difference, it still follows ISA before version
+	  20190608 - Zicsr/Zifencei are included in base ISA.
+
+	  The current latest version of LLVM/Clang still does not require explicit
+	  Zicsr/Zifencei to enable these two extensions, Clang just accepts them in
+	  -march and then silently ignores them.
+
 config FPU
 	bool "FPU support"
 	default y
diff --git a/rust/Makefile b/rust/Makefile
index 2603b34f9833..079af058ddde 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,7 +383,8 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-mno-riscv-attribute
 
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index b219244cd051..cee28a604830 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -3,6 +3,7 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 

-- 
2.51.1

