Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2BC3C4568
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228044; cv=none; b=eYTBOi0BNK7jE2rLtZB7MiJiw3F68Fl91QFDJMX7HE9doBjczDJNa17giRaEP9mCJzPgYsjLtNu3SiFy05aQtSbg6dxKG2kzqay63pdpPPGkzl5+YxN6PH2a8j6UMWvKbnUMRL8mCBUIKCFyCTXu0gp5lMgCfG1IPHjlG9lkG4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228044; c=relaxed/simple;
	bh=NGYv3H0EXTwhJvQQa1DncgXYejzSc622oLZjrI5r7nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PVZzDSgQY8eRF7MLjCKRXmKkx+YNhqJCQqh0ykI1OrHS5Dpo2nT5jwM6WXq60nNkjO2B/JOm6Zn2rUvVLvsBTVOFIxhOeMnVxz1h51o8pqGO+rTCz553uepF1S5ebSG54t74YzSozIflciCCXsdYU3dpoHLzNVtoTceoLmkiu50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaS7Lzip; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaS7Lzip"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c70c112cb61so1095883a12.0
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228042; x=1775832842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5MnNEuF4jTrufZ1xjxpgz9Hp8B6c1d2sPYeGOGoVeo=;
        b=IaS7Lzipi7l27+QPBnFnM4X3+ajytOXgf39+ndBZHfSJ3HrOteKGLhXm/T6KhTsWRL
         t1SIKNTM91bKR+ZjdtDUZ0XIryf78nfyTuPJKVChQzx3+cZ82ZWG8J1PWlVqMGP7gSAv
         AEYmG13tUW2g/aY91Bs+zjrwhgXWpz8ERnyNSf3Dc6GqaRIqcFJFCYpP2ziA18B+DECh
         V6HcCr+Uv/2m7Uc8rDmfooVnG3pwsIxMXjUw61Wn0w2MfNO89X4wODeElymrFT2AOY4Z
         nYmZYnMW7WTsrLY3hDkv+r4CIGqO1//8Uo7ujkkHUbrAmZpDeJ+WwECWxL23s39qyzuJ
         yx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228042; x=1775832842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5MnNEuF4jTrufZ1xjxpgz9Hp8B6c1d2sPYeGOGoVeo=;
        b=SVMvux13Imf/84GLbU/mYgL0BJOcylOJq5mKIs92NJXrG4zCpXKqvoN6VENGkTRm65
         NnJrKqDdX9v7Nv5UwLyPJ3uauHHBg9bKuACDUSs8qjkX4bGf0uLzd4z1BypFyzXcIanr
         xKVWItZ85NkJcF0rEekv+tux6jKoG+g7YeP78p0WFPrxhqlfswWDQpUBp/bOLUKuHGDj
         G3C2lpWEOmpVNkNvVzlph7c+1n481iE+DREYYAmmm8rGc+cNFjRlS87BNKUggLZo+yyN
         DOxs5MlOB7rF1Kg4PV56Mp19bx2RpSN/VBZ2N2q7XYlx1b6lVzqRA3ghAGBOyURoOvyc
         78GA==
X-Forwarded-Encrypted: i=1; AJvYcCXr8viCzUAgMJRSsU4bL3N2naz5vz0kXjojvNWhoMI2VozIEH/P8jwWDLL70KM1jJ+rdvu3@lists.linux.dev
X-Gm-Message-State: AOJu0YwzvUtKRB4ddtrZCYD0KP39N1ip7UopXT58VEQXC7AHXRCswsHE
	TsCbWaOsyzne3aofWBUh0dt4o0rD2s8Vo8wQjixZ4NscFeDlckWYkqFr
X-Gm-Gg: ATEYQzwgkjcqGreCrzSMRM3y7KkQKvTyqUNbtatTIGu7qg1hiTL2nVMN+wfmSGTHLXf
	KeD7gGpmXx3lbw446z2hJKZllhn8ctUulTmR7rpu3z5jKjpj/jN3UeKYkIcph0eP8OujcQlFIke
	TTMwUCNCUIpRiU9hiO7QBSdoQGU6GTFUq0/VeZBM9GpIJX2Im5gbLwjc99gYz9Sv0eEDWy+23Os
	0ss4IG/yFsZemApSxpBehrdCmvH7xulwbtFTsbI+jo3ba36p0dw9lQeOQeognIUPxYUsB3VPuNK
	NYHhs3hO+rr/MP5Q+b7RriXFKMiL9LVIeBhs1VhnNBAcSm2pUJs6j3JMMUIwl8eYKhRAuP+TBtc
	8PgMecRYZp2zXgkoW8Qro3T5E5K8GITKsUMo9D2PtusgdA9Gsw5Vg6zf+mNfrsm6UuGuVmVJeh7
	D4h4bsPYyaCBUi1dpcTlCeuR89bzQXRJYVLjpfMhaJ24A95msSTwS9D9pf+uA7/kuq/4+Ss0O6i
	58=
X-Received: by 2002:a05:6a20:12cd:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-39f2f0ff7d9mr3381106637.48.1775228042226;
        Fri, 03 Apr 2026 07:54:02 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:54:01 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
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
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V8 4/4] powerpc: Enable Rust for ppc64le
Date: Fri,  3 Apr 2026 20:23:08 +0530
Message-ID: <20260403145308.1042622-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403145308.1042622-1-mkchauras@gmail.com>
References: <20260403145308.1042622-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enabling rust support for ppc64le.

Tested on pseries Power11:
╰─❯ dmesg | grep rust
[    0.225728] Initialise system trusted keyrings
[    0.270961] rust_minimal: Rust minimal sample (init)
[    0.270968] rust_minimal: Am I built-in? true
[    0.270974] rust_minimal: test_parameter: 1
[    0.270983] rust_misc_device: Initialising Rust Misc Device Sample
[    0.271012] rust_print: Rust printing macros sample (init)
[    0.271019] rust_print: Emergency message (level 0) without args
[    0.271023] rust_print: Alert message (level 1) without args
[    0.271026] rust_print: Critical message (level 2) without args
[    0.271030] rust_print: Error message (level 3) without args
[    0.271033] rust_print: Warning message (level 4) without args
[    0.271037] rust_print: Notice message (level 5) without args
[    0.271040] rust_print: Info message (level 6) without args
[    0.271043] rust_print: A line that is continued without args
[    0.271054] rust_print: Emergency message (level 0) with args
[    0.271064] rust_print: Alert message (level 1) with args
[    0.271072] rust_print: Critical message (level 2) with args
[    0.271077] rust_print: Error message (level 3) with args
[    0.271083] rust_print: Warning message (level 4) with args
[    0.271091] rust_print: Notice message (level 5) with args
[    0.271097] rust_print: Info message (level 6) with args
[    0.271102] rust_print: A line that is continued with args
[    0.271110] rust_print: 1
[    0.271113] rust_print: "hello, world"
[    0.271121] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[    0.271129] rust_print: Arc<dyn Display> says 42
[    0.271130] rust_print: Arc<dyn Display> says hello, world
[    0.271136] rust_print: "hello, world"
[    0.271198] usbcore: registered new interface driver rust_driver_usb
[    0.271207] rust_faux_driver: Initialising Rust Faux Device Sample
[    0.271227] faux_driver rust-faux-sample-device: Hello from faux device!
[    0.271297] rust_configfs: Rust configfs sample (init)

Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 7 ++++++-
 rust/Makefile         | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1246b3add8ff..a5f50434daf3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
 	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 589613eaa5dc..9385db478c59 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,12 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index d05e76df15a8..321b7d0e15c7 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -421,7 +421,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+
+ifdef CONFIG_PPC64
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+else
 BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0

