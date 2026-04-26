Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745C5165F16
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201284; cv=none; b=pjgZOijvfzRGtDbaKMTlmNnYxRLjBX3BBi3bmUHC3XoCYCrQLJbcS/DlPeryWGSfsSdkVY0JWVO7TRV2ygMZjyabMjhcesjTpW6cAPtVtqI0b+0Z75iuaHYtQpnOpWy42cbdCvDzT0ACY2++CQM/4u/ptqlO5iCamDCPxirPWPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201284; c=relaxed/simple;
	bh=i3RttQ1cYF3IxPlZI1nEf9BZfxoTrhwbrGi91/khSWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGx1fOW+B/gjKf7bdvfSjg3aoAXMWwyWa9IZQLIRo2FSifc9cSzKO8ehP7dxiB8PWFaeBoMzafWVGu6rjWqTVsZBUTBxeGXbEEbB5K1gLLcj9GqAiIjyMcS5QObnrGC7gW4G/l2YrG7jgCqwwsaRrq9C2L/ShVLpmAJNZGcgD90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5nr9GQx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5nr9GQx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2adbfab4501so44033175ad.2
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201283; x=1777806083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVCy+fRcM1H3k57gN4SHcc3eo5iNGuSvVrAbRBe/Co8=;
        b=H5nr9GQxMBOIe/mjRoiFWMe2Drh0fuHG50ljJnShQRHCqEJdFpHSdTIErVp9dKxbu3
         DHTG1fpSjOOmdyP2zFSgLzGkM05h7sPIoutoVa+aOkoFJ87q2X0aA9PU4kWHtFd4sHGY
         30koeNwuLaGb+fnqB9WCJRjlfhoZrJK8SsklaPh0QUDna5r37T9DvSjqf/RodsHOKhlF
         g3orogs5t/RtCrSzWTb5I+aZbLLEBNUFXTWiDuOYIHINE1HLSuD3L3jQTvCTPMkWqUnK
         HHrPuAW8AHzLVx1PzKisZ9nHVbxC+2rqttchfrTBEb2HtwQ2WmnShofIL7F5gEaHCcFx
         301Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201283; x=1777806083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVCy+fRcM1H3k57gN4SHcc3eo5iNGuSvVrAbRBe/Co8=;
        b=P+S8Sidl64K01uxP/SogE8nFxnc21SNFpC7gcirArtFJolOD56Oeyi6KAc5/4NrsMh
         EIBx6aNjARTGS0rmtD/PrUgautneOr7Wyd3Wu+jSAcuMieoyHL9flxp09ihnTEjdtLaW
         POpIcgrPLSqO54Fb/tXSKjGitaFVoGM3SJRRRV+spOmDl0+iPhCowFMC3UC+4uZPwoe0
         t+25dLHLldDCXpNNB8qAVBMfp8C7KcYBwX1A/Y/ZbMRAz/L3YRCY50VRjFS8RL1KcKVZ
         7AnSBNORjhStCmh/yZNGDQrlHkSi8qiRQ3c35N/uBd/kxtWGjOKfivBcZ0m1PXy4z+PW
         A/JQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YdEReJwTS4hieRO86VNH8e10+sAd//MVmuFcMlrAJpKxx+DKIZbE2ULWAJ48ol4DnI74d@lists.linux.dev
X-Gm-Message-State: AOJu0YzwBnK8JSXhdgViSCTaU6xKvPME9hRRDyzpooYXe8+NtMkuQdFU
	IsqwLNHQkfUnyO+IU0TzFy4bN3erK86g0iqkBU0UgWbsXuEAX5bcIOza
X-Gm-Gg: AeBDietnF9F6Jm3nO6956k4LYv6et2dh1zYJ0P/p+SClNG9OjGck5csmDsMC066k4QE
	bK2My5nOShhKTziYrUslJ9NeHevK/rbRaTterScsJ/SX3/zllKtYjzxp4SNj4HZom2CSc27nqi4
	afGsMQqRLMzO/AFS8Y7DqhCwDJcgZwO5Rg2UfvPeLFl+rxQhZT/FmRKDeIFiYOYrPWFmQUW+zzA
	vwqRpLVPNUrNHoMrjf+YDO/cBjXMa0psxdS+bZ5ShPpjJiRaktmHSvyWZIJqIPvnVmiT/XEujmu
	E+Zl8HweBOUoveikwbRkI+S6YOgOGhfuqjaKRlpvS8m+IlfSMjXUOkhp4qP/XUJkyacjT61k75P
	fDDucw5N0V/TVFmsiyH/p/gZGXqQf2hUn3PcF0N684LySEnrp4srozg5P4FagHP1XJF6JODTFN+
	yEO5zZRvBnqXnLEQFvzx0883sS/sFOPFHJTRJWGuCAtnnTiB5hWAE6VqcCDQeKO5FkaTdtRUaxf
	7ydH4DJKM91JPA=
X-Received: by 2002:a17:903:1ac6:b0:2b2:5840:808e with SMTP id d9443c01a7336-2b5f9ee9487mr384368245ad.10.1777201282662;
        Sun, 26 Apr 2026 04:01:22 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:01:22 -0700 (PDT)
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
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V15 7/7] powerpc: Enable Rust for ppc64le
Date: Sun, 26 Apr 2026 16:29:32 +0530
Message-ID: <20260426105932.2270364-8-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
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
index 54096ce8a675..068b6fc3e0aa 100644
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

