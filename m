Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD73D2EFD95
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193952; cv=none; b=tt/ezMJOPA3uSM7cx+1qdR8XS3AA4/EGaCMkjD8FPStWfEZtJP23fvqXsDmpEyBNNDamW0n4CO5mH3F0j7jk2XwzyebPtM//JKQLmlUwZb0JFQDHBhip9TeD8rPSG7+3DJjuczLeFSEnuideo0kxbxBg/pcKXj9evHOhtK5fYyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193952; c=relaxed/simple;
	bh=Tc8sOod0krNItOJV2MA2sQK3bhEDWu/YmKLDcz4nh/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMOXYJA0BG2Ryiia21laUMujYG3jKcC/vPbZeK5UAxFGHfi28wxpFiJ0BZU4HPdWA9ginqKBTvujCPILor62RC5GT9Ir1i4B9KivtxAnH4R6XE4bIhbV7UAdwLFAl+nB+ohXcmXMYQ95nqt3bJGNAxek5yvQNzHf4oc/TisheG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTnrxmTd; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTnrxmTd"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3614826eca4so8192417a91.1
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193950; x=1777798750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55+b7l5F3zlZQ0yMZrz5rEYbg5vrZhPlJC+KY+nm9CU=;
        b=TTnrxmTdEYZhDkOL0LXo4SFz2bIpGydSVyiir4ep8iPCTidNQGmA0KzA6jtBTkxUS+
         VvnLpqv8/Sk+KLRqWgEe99eTme9M+Lru+QITFNlVYfMmQIPIYjaKz/M+R+XDGWynsJqw
         pjBNOOx/AGVlgSeTkcMSnlLAvYbFiSlXo3dr0R6Bf5pOv47E6iR7DzOlK9WnCWEJrHiO
         XIMQIdZXIiLZaynlPhytNiHV03Jhs9tZm2eY4bi8cxuEJ7i8aIJIQQfwnNPQOXUorRNp
         hqasTHdTmO1f+dBukWWgM3PSBLHrE88eiqRYZ5EaEVaRJOTFKAxS1Mphi8W2UogbfDbf
         tVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193950; x=1777798750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55+b7l5F3zlZQ0yMZrz5rEYbg5vrZhPlJC+KY+nm9CU=;
        b=jw/1ZOwHNLLw+ik78tl1VhD9/xDB3YD9OSBRK/pcQ6HWcxTBwklYYcneVG61WcwH0E
         YltIXHwbjUHVvVRQPghIiSYzlhCiQlXg/ro4t6Z3ji2DUb1XsykH7H+2gqJdQB3uylg9
         GyCDt5QsAPBX0V7qHWrTBDaMw862g5sX0jrEP6oFLQIuZ++EKiqxurFNOe4QeR4n2D3l
         se6KxTVP4q1n1ek1plnlu9+WZzBPYX/0VV3WIKNT6x+GR4cwUcxhni9VrUDC5pfNxRX+
         UJN9ebnmY/ZSNbrqEVmHy2JULukDVxzmzihLq0Tl/bKQFJeLGoPLl7gzxJwIAdHRaZKD
         /qPg==
X-Forwarded-Encrypted: i=1; AFNElJ9XLpcaKqPy/pWWI5MCpcrhxPOJxXu7H8LYMwg38oPqEvBF09NItrxb0OZTZGNUQUorIajP@lists.linux.dev
X-Gm-Message-State: AOJu0YwaZYdvRLO6X/ZiDRGwBv1nu0Gf/jH8Be0EcTht00jRNjjI9K0K
	H1L6Gbz7uqpv62MdsjbFL798iYVNu1rXG6WeS0YnkQOfIZR+E7gfPzQR
X-Gm-Gg: AeBDiesfs2hHpUqOGlPCq0MGlBAV7vcxj+R3H2zS3U8P/Pqj1pXrgQJDb3nVDVMiIOE
	E3O0twUqdtZUoJeu+rDvgTGBrLz5dg2aWTgtyPXLci0Gx0t/0NmOVHca/1Qia2z4NrKdfxuDZ1U
	nSwENDGr/bR8lP0Bmi96xdijkFNb8jabSn+qedBN7osWwIfhbnT/IiAxgV0PWXy9/Tt/Bb92Zx/
	OjLronUMfyay0SFMc0fjcAgfuOrdcQFmma47wd5Rwj9OW0xq5+V4uwJcy/fmY1F8YlXDEFbUo4z
	YYyJUYVwtBhM9nfnsatNf3LjGEn4xU6bcmpZbEgHrujJVC5kUJD7pkhDnuED99e1G4kVPzRbM59
	/68faSu/9fe1NMOQRYY4wgz1lGD73mjqcq+h97gjQfgIUdfVSBmeW9+tgrMkn1K6yNYQRnQ5a4y
	hDIpIGxsqPX41+12pnO+QF+L7Orz93FIsgeNQArCTrL+6zBrAEkQGahW5siHhw2yAI/s1v8dfbY
	4AwluG2M/06cfM=
X-Received: by 2002:a17:90a:e704:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-36140478a16mr39086684a91.20.1777193950059;
        Sun, 26 Apr 2026 01:59:10 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:59:09 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V14 7/7] powerpc: Enable Rust for ppc64le
Date: Sun, 26 Apr 2026 14:27:25 +0530
Message-ID: <20260426085725.2090827-8-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
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
index 03926a451bac..8e5891563777 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -407,7 +407,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

