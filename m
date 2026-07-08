Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B35403150
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499204; cv=none; b=mZlqS3Q8fymdm5lub9bzeVtW1u9x2KvfN+/ylccBHtER1LgvnbXOFmqfMqqoz2a9LyRkZ2Ms1lE10pmpWHHiDtWPclLVsZRqLuE73gEQv4anI4BJOLiaq2pOnNsvyHC0DVvTg6OCMvXr8IGsQW6WhdStKCeMUvVXQI57x2mvyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499204; c=relaxed/simple;
	bh=uMmA27PKZBuFU8atDbfUEF7pZEJKPZBZu66v/vfinpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdNFuel3I8FIcA57OWcAnhR/UtYkgwBIy3BC6Lw3G6KShGYXIRfI/ERye7g26UqLyH4taKLsBGWKE9srMYDRJn3rJn6rf3m5DNlyy+WpI3gb1xC3wxHUwckoEICnz30t/msW3M+5twKVFLnyCx9kyVFFR5oxWCoOt5hIKOPb2QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQSxEXNr; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQSxEXNr"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso268673a12.0
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499202; x=1784104002; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Uzn/NdDPosTQtig+uiLwEMPj/JQxR6heV7Be4pIXTc=;
        b=cQSxEXNrz6GxU+ogriMUDOj66JL1P0zD3aR/AAsh28Wj5xuWtiOM+tBrtTpKJ9kJRy
         K76OHHubGdOu4ROSAto1BVLkP4AV+pXI5OEEg4pn2QP0eqr1Jz6+tm6EkYyqaxvATfUv
         CEgzisnAJe18E1SnnbRxRzBvKCMai4NIPYIYm4dGUz0gp4mq4GVn7C0uy45ilVRlp8S2
         k76mo4Xt4Pu0z2BTVv3H6++d3oH+VHnFawlcf0K6xLqrU1ksF2isNWY6PjzlZI44yXPc
         fg4L7re2CV+K5LO2InWjzRVJ5VXgW4lxW8mS4sPB+jG9m6s2mxvba11387poYHaUHdeI
         osig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499202; x=1784104002;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Uzn/NdDPosTQtig+uiLwEMPj/JQxR6heV7Be4pIXTc=;
        b=eLMH+IZkcVeXTy3bKlkhyV1yeFPWLHMLMk3p5QAYotS9zSUw+XAiDg1mqiFnpsk0uM
         a2yIou6IDL1xHSGx3H+Aez2ay/Q+W19t0qMSjLqGWvVaI1DOiAK2rU+vi3NzOe4rJzDI
         cCYbn0+G1gp35i+ll2bUOIZ5olAziA9BVux3G/pLLRL/tQKLTw1lnt9NMcjUF9GlHdLv
         VzE3bXp4XiEHOBywIozcJitlhfzXF3AqRsKM0xLnOgnSSRzA+US2xvEqlMG8tvPRvT3r
         36mMT7ZUNKyepQjJA/kNDVIJrH/tTnuIlcRsC0vRDWILVKSLlM6Phi7AHzsV7J+xA69f
         Ptow==
X-Forwarded-Encrypted: i=1; AHgh+RqvUZC2DAFvUJR6ZiooyyFTVrn6OfNT8loPxpfxC2JJf66G+ulwEwH0td5PQSAHyXE5GTgi@lists.linux.dev
X-Gm-Message-State: AOJu0YxG3Ljp/eRN/ewCXYVAwUPDhaxDZyy9DEBQTJlul8HoGV+Yd5rf
	zBUhK97LNc3MJ+Dz5vkLrHMnkODOESUe45kt3/hXm/VcNBT/L+fhXVyu
X-Gm-Gg: AfdE7cmb/7cRTA4QqUUyKz+6ABfQ4t2PWFPyUnP0hui7gZhEvOhSTZSmS5KPiCUi+qv
	5udYcMAFXF/V+y6i8lFPwivqEZb1EICglPQM8lFR4NQScGzGJSIA9AJCh+RIdahqxMQgZus7qkL
	VB78mjMAcwjbyKHcgyHz7ItBovG1gH2KQ/7dqDD/K6BF6DFwNU0Rpx0HC9AKdpNjG6n+1LcxpLj
	EskVkJuZrAG8AVmiEjbnZxtltpBIgybU6rEymJtqgWy7ZN3RD7DIMegdqB7L19oNu21Dv9k3s4S
	i72azRwy2ZK+garlSnUBUMWwiTXazYzwKyXIGYsqcs0yg+0O0qwEyjdAlnZ1KgQdrFUW69w8ZWa
	Tj5CAcBuBlEa5Y+7Qyb3HS4P7/dQb6ZF4ApUlM5M6mIi+NMxJgkMKZvefQTABBL4OxOgRMrUw2N
	u0lU89lwWD/OV6ND6K4B00Wz0xDaqHCNAvxcdBNeHjkfSPLfu8LsZy7gZXz6W5tZ2K82Qc0lpJT
	Nlx
X-Received: by 2002:a05:6a20:7288:b0:3bf:a1e5:ff62 with SMTP id adf61e73a8af0-3c0bd0fa2e2mr1854023637.47.1783499199822;
        Wed, 08 Jul 2026 01:26:39 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:26:39 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V17 7/7] powerpc: Enable Rust for ppc64le
Date: Wed,  8 Jul 2026 13:54:54 +0530
Message-ID: <20260708082454.1254320-8-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
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
Link: https://github.com/rust-lang/compiler-team/issues/987
Link: https://github.com/rust-lang/compiler-team/issues/988
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 7 ++++++-
 rust/Makefile         | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index badd7c99b87f..650283107b92 100644
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
index 61e7dc496fe4..d2f74998d3c1 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -459,7 +459,13 @@ BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 BINDGEN_TARGET_s390	:= s390x-linux-gnu
 # This is only for i386 UM builds, which need the 32-bit target not -m32
 BINDGEN_TARGET_i386	:= i386-linux-gnu
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
2.55.0

