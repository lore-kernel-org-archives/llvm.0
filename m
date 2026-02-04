Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E2D35028C
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 05:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770184336; cv=none; b=gmo1w5A6NKG/dI9nPs0geh/NbAR3vNaENRVV6JIpm/u82Dg1BSW1a6SP9cUR5yVgicXccihIYXl5X3sQnrRZVk2TJSc6HZiNee5zzSb5gPj+Joyo8Z/DXnjTbHtzvFrJyHrTbv6pE2XcDbsI/qeqdIpz8R0lja5kxG1EykUGTs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770184336; c=relaxed/simple;
	bh=Nu0j7/QTMwXNybcCccfMDqePArqp9NasPFKFagIBk5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivXO3OjEZS0Uakx451uEyc9GX20QllgdIJfvWyyAGhK1pjbXX/6Im30fXAvD+zHJ6q/cYlFURzHeLGQvIop6MF5XAPf6tmlo6zDiMUneGtLUOYUtmK+wo/HGdXgGB4OShRIeKYrUGC6S3F/JOS2A8nZTMAumK6QoVoNyVi+cGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUGBU29C; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUGBU29C"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b785801c93so4565955eec.0
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 21:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770184336; x=1770789136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL5of/f5KyDAfjTDwdEWFiFC2+YlHapoLTi3UvRqx5s=;
        b=lUGBU29CE2Wk2pRBpYDjweYdBFduMbUsRAxcgEPXVJV8WUpOR+LoUuHomioe9z+QeV
         13UZGU5NlKKXB8hQbtKCNvedjluL9ydH4u548MyOb1ugyA8qqIgBo29eIbhKanKjsle4
         HN8XhCaWcbV1sVaKRtYit6ZlE1T6FrYn1KuGMUfbaR0c1taH5y6baNEMUHdlOl0SU3kT
         GwE01WL3QIN+3YeC/1WEDsRUYv1OiJVezjzQWrW1PJFLQ2RmUJTjrg0MTz4jGeoSc82a
         foMxcBUDo4YxwNch33YMvwdzeV1r5xOHzb/G5e5ewq9SZxTUnhA/+uNOOvvG3BoNaebS
         42nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770184336; x=1770789136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL5of/f5KyDAfjTDwdEWFiFC2+YlHapoLTi3UvRqx5s=;
        b=X2lI9QX/iMTaJAzHed7+vyay6IFkaPOa9AnLSjmuLysTsoLwfKvCR2W6durbsgoEzW
         NtWsIhViFP9+1AV8phgC1k1NmUvaZJBtJanwALuMKT9aWfnKIcwfoRWiCi7tlXGRMphc
         bAaIxNTmTyhOyK3w+GVN8IK+GwOC6WM4K6xnxAd9IvUps7yjjb9d0TU3ilxUfBktQ2yv
         sHa7F0bD5spmUqfDkuBxBaEI9+S8cmtpSRmXUNLDciUs8vqbICEhMTJr0KRSM10L1sUA
         mrDTnegoU9Ho9xv8SGt5GIbMwc6CoWUPMD1zt8qSooYVduz1kjgubjgtmFBvzJzclktm
         k1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUyxo7RVkcctMGG4K+ryNgYx79mcylFwMDqSbwkFJthL/uURiMWjlL/hAmO64dEOsOXhCxz@lists.linux.dev
X-Gm-Message-State: AOJu0YxaJH1y2I3Ri07V9wyOx330RglLV+4sKtpz4LE82Pbd7IH4vWAr
	VVXIy4BYQ92lI7FpvRkK+y9+/Ae6LUfS9G6UGZgabxB+NGnaD6jQRSot0HiBHQ==
X-Gm-Gg: AZuq6aJ0SxPwKaOkOfIl+9cFzwLFxO3fcODiybghpb5lNzHm8eBhhparRRFedzmk95U
	i8WDW/bdn5r5RU60UAapVhY2I6Aa4ONYOn4jDGy988ZGHGa1SGTyuty0YQiWyXu/KntNhv9+RtF
	fgy7TBX2Ykop1ke1NHQXkXM68FAMTxzc7ZGTWFVpd7qwUIdlB33wlF2cthLkvo/NVXypew0zaIS
	xeB5seZH9y+djzAui4zs3Fps2wpW7A55W0JM6F4nyoicx5HJTM1nQI+XbzptffdWDmZUKRQwnUg
	CcSvYNYXXG98M9zxqlbLl00MMEd6z3dTphoQCYNZhOjyyTqKLkbXBarIW3o8MNiS17h8zFRx9jp
	rdhG29tCURIxDk+q37lZc+gtxaTxvKDITBpD43jI3W+2Fc2706jPT4lN9nCR/MRovS0TuSu1dV6
	aTYozORoAzgLo+I0HGdWuetQasjL+kDWeBh0Agvj4OyBGP2r/XtnJH2RcHUtW/mOC5gjXyyw==
X-Received: by 2002:a17:90b:2889:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-3548720a3eamr1376264a91.32.1770179086053;
        Tue, 03 Feb 2026 20:24:46 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35485eb8d4csm1017430a91.10.2026.02.03.20.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 20:24:45 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH] powerpc: Enable Rust for ppc64le
Date: Wed,  4 Feb 2026 09:54:17 +0530
Message-ID: <20260204042417.83903-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling rust support for ppc64 only.

To support rust a new macro ARCH_STATIC_BRANCH_ASM in powerpc
is added to avoid duplication of inline asm between C and Rust.
This is inline with commit
aecaf181651c '("jump_label: adjust inline asm to be consistent")'

Tested on powernv9:

$ uname -rm
6.19.0-rc8+ ppc64le

$ sudo modprobe rust_minimal
[  632.890850] rust_minimal: Rust minimal sample (init)
[  632.890881] rust_minimal: Am I built-in? false
[  632.890898] rust_minimal: test_parameter: 1

$ sudo rmmod rust_minimal
[  648.272832] rust_minimal: My numbers are [72, 108, 200]
[  648.272873] rust_minimal: Rust minimal sample (exit)

$ sudo modprobe rust_print
[  843.410391] rust_print: Rust printing macros sample (init)
[  843.410424] rust_print: Emergency message (level 0) without args
[  843.410451] rust_print: Alert message (level 1) without args
[  843.410477] rust_print: Critical message (level 2) without args
[  843.410503] rust_print: Error message (level 3) without args
[  843.410530] rust_print: Warning message (level 4) without args
[  843.410557] rust_print: Notice message (level 5) without args
[  843.410594] rust_print: Info message (level 6) without args
[  843.410617] rust_print: A line that is continued without args
[  843.410646] rust_print: Emergency message (level 0) with args
[  843.410675] rust_print: Alert message (level 1) with args
[  843.410691] rust_print: Critical message (level 2) with args
[  843.410727] rust_print: Error message (level 3) with args
[  843.410761] rust_print: Warning message (level 4) with args
[  843.410796] rust_print: Notice message (level 5) with args
[  843.410821] rust_print: Info message (level 6) with args
[  843.410854] rust_print: A line that is continued with args
[  843.410892] rust_print: 1
[  843.410895] rust_print: "hello, world"
[  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[  843.410977] rust_print: Arc<dyn Display> says 42
[  843.410979] rust_print: Arc<dyn Display> says hello, world

$ sudo rmmod rust_print
[  843.411003] rust_print: "hello, world"
[  888.499935] rust_print: Rust printing macros sample (exit)

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/Makefile                 |  9 +++++----
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         |  1 +
 scripts/generate_rust_target.rs       | 24 ++++++++++++++++++++++++
 5 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..e9b8d761ed52 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
 	select HAVE_RSEQ
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	select HAVE_RUST			if PPC64
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..7ad28cf0fd35 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -172,10 +172,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
-KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
-KBUILD_AFLAGS	+= $(AFLAGS-y)
-KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
-KBUILD_CFLAGS	+= $(CFLAGS-y)
+KBUILD_CPPFLAGS		+= -I $(srctree)/arch/powerpc $(asinstr)
+KBUILD_AFLAGS		+= $(AFLAGS-y)
+KBUILD_CFLAGS		+= $(CC_FLAGS_NO_FPU)
+KBUILD_CFLAGS		+= $(CFLAGS-y)
+KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..a6b211502bfe 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -15,14 +15,20 @@
 #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
 #define JUMP_LABEL_NOP_SIZE	4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection __jump_table,  \"aw\"	\n\t"	\
+	".long 1b - ., " label " - .		\n\t"	\
+	JUMP_ENTRY_TYPE key " - .		\n\t"	\
+	".popsection 				\n\t"
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key,label)
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 "nop # arch_static_branch\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+	asm goto(
+		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
@@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 {
 	asm goto("1:\n\t"
 		 "b %l[l_yes] # arch_static_branch_jump\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..7a6daa822cbc 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -390,6 +390,7 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 38b3416bb979..875579b37424 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -256,6 +256,30 @@ fn main() {
         }
     } else if cfg.has("LOONGARCH") {
         panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
+    } else if cfg.has("PPC64") {
+        ts.push("arch", "powerpc64");
+        ts.push(
+            "data-layout",
+            if cfg.has("CPU_LITTLE_ENDIAN") {
+                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+            } else {
+                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+            },
+        );
+        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
+        ts.push(
+            "llvm-target",
+            if cfg.has("CPU_LITTLE_ENDIAN") {
+                "powerpc64le-linux-gnu"
+            } else {
+                "powerpc64-linux-gnu"
+            },
+        );
+        if cfg.rustc_version_atleast(1, 91, 0) {
+            ts.push("target-pointer-width", 64);
+        } else {
+            ts.push("target-pointer-width", "64");
+        }
     } else {
         panic!("Unsupported architecture");
     }
-- 
2.52.0

