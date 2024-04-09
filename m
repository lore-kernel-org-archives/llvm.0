Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE47EEF3
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643142; cv=none; b=JVgW4LGbATJp35YXz0AcfDPfCMJNBCPt7/MasYUGdKMWY2nQfcmCWchGfO6v1tRDj7CgsIN417NG3aRiCBP6HK5fPiFqNUuy3b4g/OpjV8xx6jUP7NUfacjjPGyxmB8Jkrnl+KW7lDcydcA37bl2csIXC9XilKytmrnXWPusUK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643142; c=relaxed/simple;
	bh=dTY/GwwtQQn+cv6gzN7QoMkNpekzSb9lOmQZaapsMdI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sU9NiByRgpeoSuX2mWrurTJD551pu3ktB+n6/8EYymWIQ3LUww2j2iwI8CrYSTUZ2xmYNGmWQaGFxHvlSxzSUCeYHAbpN2U2PVFheNO8qWdsGd5XlqtPDjh0k3+GQ7xhhlXKGZW/zu9KReOCePoHulFucOc3E8F0a3FZi0pFxS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TsZC4c5X; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TsZC4c5X"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ed32341906so1389489b3a.1
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643139; x=1713247939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uNeXG8cnKNkHDs5z+HyiJ2ZiLa62BNigh2TpBUq9FE=;
        b=TsZC4c5XjjwqU80kAMOaHjrThXD/IiPqAkYGMQSSuwZx8uTud8ZW5+HwA5tMbd4dVa
         IrDAUzoAC3tDAk50DSsCcQEm8c9YPEt2Vizx9qtwwd6CUIRIZyHIcmMRKNk0akXhAWmE
         YVbo/OgxblMgzdmo/KYy61K+MyZ8ABuLs1fw/y8Iimdxf+QGF2g1PtIUY4EhWX6qCao0
         TjLb79zNodz1yJ8nUCLt72CDdaPTwf8J/akhVAtMN59/CERnMD538DABcX+rQFk82ShD
         ICeqxeE8NDMVk38rIKP7BA69tekcdE0lmkwwA0/HNdYXeNT72XdIDY0rAGcWvM6fQQSX
         EvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643139; x=1713247939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uNeXG8cnKNkHDs5z+HyiJ2ZiLa62BNigh2TpBUq9FE=;
        b=vzy2jF59Smi2meZW3OrTVpRyCKS8qBhe1iIpPuDKwBSy9PBTS8VQsJumwPoqAuHKXY
         UkLQ46WNjLGF3JdqC4dhR3IY3RFqAY6IYNVojyRFF842xnGgNLUe8yu57neF5lgqwn/U
         uuguNuTNiAHNKDsKCiGx0FYpo9t65RQwcIs8M94tzMb4EjhlALNdqKOzkfN+ZfRidaNr
         BiYoAg3+Hm/YmCEa2vo/5CtqNPjq9O1w3IGrD3Fz/d2W6eBG1Eqq+MkKymfsTJYyvHwT
         AAv8hRoSqT77pXigPD+qQ77eil5Ik3aFrot4DLFA8SO+GqephDltoQplKPyY93yRJ5ay
         GZWw==
X-Forwarded-Encrypted: i=1; AJvYcCWRZJT72RqiLMnjEzx/0jZ7Ct88q0QEDMc2De3w1KjoABV0hHqFAAn+nu8x8oWoQ4IVJs8IjohE1EjN6wcytLSZsUqHsA==
X-Gm-Message-State: AOJu0YxxJsfVukzwdf3TazZQ1FW+S8fjM9wluD0gSVVsGGHzWq4hO28J
	cnE7w7LmW0cMLsoRAxepMpj5GxusM+irRCDfiqdgO52tR4+sn1V8VcOo1HT9IvA=
X-Google-Smtp-Source: AGHT+IGfw5gGVpfgehYAjws0Ix22Cm1DN/qW9eRm+J9+S7AHD87B900xvYwa0hBVxmABGwIoWI7SCg==
X-Received: by 2002:a05:6a20:2d28:b0:1a3:57b4:ed1c with SMTP id g40-20020a056a202d2800b001a357b4ed1cmr12934235pzl.25.1712643139603;
        Mon, 08 Apr 2024 23:12:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 11/12] riscv: Kconfig & Makefile for riscv kernel control flow integrity
Date: Mon,  8 Apr 2024 23:10:42 -0700
Message-Id: <20240409061043.3269676-12-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defines `CONFIG_RISCV_KERNEL_CFI` and selects SHADOW_CALL_STACK
and DYNAMIC_SCS both so that zicfiss can be wired up.

Makefile checks if CONFIG_RISCV_KERNEL_CFI is enabled, then light
up zicfiss and zicfilp compiler flags.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig  | 36 +++++++++++++++++++++++++++++++++++-
 arch/riscv/Makefile |  6 ++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..5276598bb773 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -193,7 +193,7 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
 	depends on $(cc-option,-fpatchable-function-entry=8)
 
 config HAVE_SHADOW_CALL_STACK
-	def_bool $(cc-option,-fsanitize=shadow-call-stack)
+	def_bool $(cc-option,-fsanitize=shadow-call-stack) || $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
 	depends on $(ld-option,--no-relax-gp)
 
@@ -211,6 +211,30 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_KERNEL_CFI
+	def_bool n
+	bool "hw assisted riscv kernel control flow integrity (kcfi)"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
+	select ARCH_SUPPORTS_SHADOW_CALL_STACK
+	select SHADOW_CALL_STACK
+	select DYNAMIC_SCS
+	help
+	  Provides CPU assisted control flow integrity to for riscv kernel.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge. Shadow
+	  stack protection is a hardware feature that detects function return
+	  address corruption. This helps mitigate ROP attacks. RISCV_KERNEL_CFI
+	  selects CONFIG_SHADOW_CALL_STACK which uses software based shadow
+	  stack but is unprotected against stray writes. Selecting RISCV_KERNEL_CFI
+	  will select CONFIG_DYNAMIC_SCS and will enable hardware assisted shadow
+	  stack protection against stray writes.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This enables forward
+	  control flow (call/jmp) protection in kernel and restricts all indirect
+	  call or jump in kernel to a landing pad instruction which mostly likely
+	  will be start of the function.
+	  default n
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
@@ -639,6 +663,16 @@ config RISCV_ISA_ZICBOZ
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZICFILP
+	bool
+	default y
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp)
+
+config TOOLCHAIN_HAS_ZICFISS
+	bool
+	default y
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+
 config TOOLCHAIN_HAS_ZIHINTPAUSE
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 5b3115a19852..ae156e37e886 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -58,8 +58,10 @@ else ifeq ($(CONFIG_LTO_CLANG),y)
 endif
 
 ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
+ifndef CONFIG_DYNAMIC_SCS
 	KBUILD_LDFLAGS += --no-relax-gp
 endif
+endif
 
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
@@ -78,6 +80,10 @@ endif
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
+ifeq ($(CONFIG_RISCV_KERNEL_CFI),y)
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFILP) := $(riscv-march-y)_zicfilp
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFISS) := $(riscv-march-y)_zicfiss
+endif
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
-- 
2.43.2

