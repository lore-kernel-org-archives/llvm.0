Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C74345736
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 05:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009756; cv=none; b=UddRKv5aIHlBym4HJwdunSQSiiXZ/umQihXzIg+2B4Bnx8y5dy6Klpu9soDV3U6VbAUYe7ZaOs5fUko4ICIGaXZq0jfK74RRrJEsDIGTKz6De7YrO8aWcDcdEYp/HO7kNYlheWF1t+I22r3xH6Pm29QDwjYeu/E+iOvmZCZAEOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009756; c=relaxed/simple;
	bh=Ln7XoFFRgbpVTzwb9HPAuoSFU75gRiPCvs2/RLkCEsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OcEc9gE9dbcRTznhRWrCVkzGO588JkC4jGShcgAifeXcXRTdnFXIcp48w5AJ0DzQjr7mxwEgx9zuSdOEOxoGezcGjYLqgl+rjhpgWBW1raeTAl0/zogLfFsIeqooB3at4+cDVnlgmHZL83ZF9EsDerF8AdpqPe1P9E2lR1+1NyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQ6yXoPl; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQ6yXoPl"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so4859257a91.1
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 22:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009754; x=1777614554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoXnYHhu5OJq+pQQ/T7jeG1ntNKoLYxlZRpY7d5kjto=;
        b=PQ6yXoPlj64njl7NnvZqz9dRPd5GBIF5wHTIQDQ7JA8kCZXOyAmcYUsgrx7Qq8/hJi
         s4tifnv6sawdGDFgyCKU6Bq38r6JIriqQQIcaBAoDZtfGCmSuKrd9urmMa+4NuVivMnK
         hMFbUCgsw2X84Ux33qpEsOD1/kQTMc6y0r5Rpm1QtOOpXkMvNOU8F0slSxdnwyuOE0fD
         ZQ4iZB+CJTayPCUEcCAoewaNjBHMCnGpw8uhtoXtqZyNeaVIBmGwotsXRjWsvs5+1j9b
         APH66vw2z0snuhtTvTKUwOZ4qf1o2gH5ugs/oY8ETboQkYIQJhU/k2KTkTdtoAwFTX8Z
         HuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009754; x=1777614554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RoXnYHhu5OJq+pQQ/T7jeG1ntNKoLYxlZRpY7d5kjto=;
        b=jLxvprtEIKBkMW/UBnnQnNboX6aTHQM52gxCi5HH2Zm78XI+d420zyDp8JXiMMXPXy
         6WYFrwP4jusHuaC44o8QbmVM1+wcJisToKC5TGw/wRCAEc9LJXwYE3skrCbQIXwAb/D9
         ZudnZmxCoBMSUXki8dB7LIr286krISojhRh6ixGj90dYgq2PpbwJ9yKyWMPmJiGfHml2
         Uo6iOhSGOSR+0kBoiwZ0EZsChvA8dYgeLNXTAYBZymJ3pcAk+mLgc3mL2+ql0JzslXLq
         WOyAoDGH4WzX4+bpwZcy+pKfTPCknSazaVb35zqjLY+EBKE8So9RCKULnBiDZIc6BqmS
         bb4g==
X-Forwarded-Encrypted: i=1; AFNElJ9MJIImUgYVtfSD4p/dLRPzP9ByLYIn0U+OJt0QeHb6bmnwqfKqVTpiumzwhTRFyB7Pz9zP@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb4WGg8UTMkLDmpm5Jm8cmwhvMhpgF481fHY7RAOg6pCqTYSNB
	SoS5O9b0HrXBFBX9GL3UmiB4iMnQ1wZxLMA7x5k+vccVMOruA2Si6eEz
X-Gm-Gg: AeBDietSc5oEaXN4VBSlN0g17lTliQ3GcLY+eHghKCwaWRYN16u0gZPA0bsQyA/+kTV
	t4NclnMZw1pKKVPd9vUWhM7gGhCe0yKWm+Z10pbcWBEIUacbicECUDjoAIhxoYmN61N1lBTaVUg
	Jq9rMbhEeqJbtCgDZiRhElDYaptlrNqH72G08TWkS+rSzc43Rs7NGk/FJLlfbuqWuyzs5LUGkbN
	ifRfQnllhEO2ZtwExVdVJ5IZMKQqvrAZC4aHcGfDl2LuWXfGV/VXNLptdJI58F5hcr1IV/j2HU9
	A04Uxxbzz9oTawOGTlL7+0HYmNUeA0khVT6CkZzienDMP/XcZN6vzfAn3ISpWBPpb5h5mdt6fOR
	jexEbxY06QZsdfMrYo1LEWeCG4UERptjHhr/uYatMmDF7qiQiWdC5P/Q4biBoY1VR27HtmhlMTc
	sFAb8EZjY8c08i1QZhrZIFJl/CDmtxr4Mrhck/i/766WO+27Zfo8rCUvzqnscvVOHubXFt6jHux
	saDnqLAIHONc64=
X-Received: by 2002:a17:903:1446:b0:2b2:42b1:ad95 with SMTP id d9443c01a7336-2b5f9ee2835mr352292775ad.16.1777009754030;
        Thu, 23 Apr 2026 22:49:14 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:49:13 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V13 7/7] powerpc: Enable Rust for ppc64le
Date: Fri, 24 Apr 2026 11:17:42 +0530
Message-ID: <20260424054742.45832-8-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
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
Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 7 ++++++-
 rust/Makefile         | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4ac897b650d4..2e3065bce9cd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -286,6 +286,7 @@ config PPC
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
index fd9c1bf026ca..d7b74b209a33 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -408,7 +408,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

