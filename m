Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07963A1680
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773447; cv=none; b=ApAIouVPpSr5HL+2Wo35rlpwSwZcBN3iokStSccc2X+W3f8kz/FBG5SUcd3CnRqPMp3tju/VgaXY8Y0u3WB+0ZkFLNVTXnlgXeEyv3YaEfzOhkBtvvYA/JJmuz5jtovhBi3n+b5vjydRqbTc87OcmEAVgyYpo1SSvRltMEhniXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773447; c=relaxed/simple;
	bh=/H5PcSrC2tQdEl6SKLI73OsGEYqK/u2LFa7CaU6S+YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZzHCDWsQWb39VBjoE0D4eCDwRJJyVMdlC5pOztIX9tXyGIZIUkTbUR9dysPJDY1+ch5oNVcawAqVEutzg/6xwL6a0gLbUlRtI4vyeOJ5Tarh1HFFWEw518sdcfOXeoi6n9lb4nyM3A/s/0202PjqHIGEhNYmBvOIklkdEwFLh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d//CxOi2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d//CxOi2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c79467f128cso1505632a12.3
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773446; x=1777378246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFBtEobc7yIaM1eVkOtXcJsieQCaSzPZbTXZ7JIsJxk=;
        b=d//CxOi2bafP45CrpvgIAtStq7bBeQ6VvwBmLzRTH2CQUe+k/gtEOdcMoqjQcUlAlQ
         niMyHa4KS5CqlSdp2/rsgcDoRdoRBHh81Jb4BHvelF6s4kcDOTgcirvEsJp/dqf6EnsY
         MAi3/5rXN4YZxf6wEO/lJrwGwWKovZzgZupxPHwCXQASEuQGxahMS4X7WekxGlIwK75X
         saBcmJpIFjUzOMLKNT7crhdsQflBeyGsyYaZ9mgwALR1HW+5YmCQxqnRXsYbcBTPQyN3
         sSIwUYyNDYHv9jTe5xdKKxVQyaRHq2NbNyVZGZGNWkLqlOxloKmtUYTEBaJjfBwXSe2t
         tCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773446; x=1777378246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFBtEobc7yIaM1eVkOtXcJsieQCaSzPZbTXZ7JIsJxk=;
        b=KgtPCeyoRNyGBFFif04Gv/zp8kzPghHE3RbEreyIhlmg7ZFOsvaJytlIvXq57YMfe7
         TuCYU9/MjTHb2I34/aVBUN194rfyiFh4fJgfrWRfK53nEHbOSoBSmRZ0KYwYYbNr+MsA
         3fWNZ00y6hEwPAfPbqzu3mN8PVYJ1t7ENMNRRt0FkHzmfSfuObKDiXZZWOUIyio8ztNm
         rhZkw1AIzaKqES2SxzGAyxtkU9zNEWJYDmvzmO4zRoSMif9tXmByfPFg3EkPpwr1sjqm
         ZFAsfnB/sTELlL7Vozi04YbEU/xbhGiXchXohrclUvU59TZ3DHATzjzyJceJaY21bhHw
         T6Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8i5QteQCKcCpvGphCQAqzZVCTxaUw6W4odsqE/mv4AKJgOJ/+I26VGf7WdiWCk60BBEdxp@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+5V2/niqHJgbws7aWc40B0oYnpg9Si6uskP1HcL2SaMeEswOn
	LE5mNOxMc/PkI2W+iw2hPGMb9FnN30GxyMNBSHAfbbshLN1Sh7ewa8br
X-Gm-Gg: AeBDies8muePOUSjBW5x6uinPf2X48n9MtO3ps4xKs1zi1/cnkAIxYDRKFHu8OCnpes
	Cw0D4aZ82ny+nstNKxkYcWNQgQ4JUcVFSWw5Z5eh9vH344U+lO43XUCwA8O297kMLFzZfDMYUd/
	wNkMlsBxjP/KNZ6JcAPUwh7I5qYltMpgC7gLkdh0r6kWaI/Jm/ZRxAJHRTR1JZlC2iCPouutlZc
	A6NE4BmAYhgOOKRqW2hu1EE0DzPWvs8tzfw3h/CsK9MvfJ8LzmDMo4HRWbcaC88u7j09VGJT7Xw
	vSVumCIRjHWDV6o9YDsk6xZoVkrKX/GdNcUxUYl5P7CWOVKv1Q833lZ9p6k6t1sS3+AO28iuvqY
	gF/+FZeoUdpCUT/Q/dl22sSAiSFxwTSJl7BSQLJQmPyioUVBBwi6YqhFn3x83zNWQYAKVXuUL4a
	gPXxMtTJTGQrPedyoODqDqsp+BT6mRcUqLwMTw831t61PPNbBInEUGv08vfgrSkIjixKM8GRruK
	iU+ZWub2lYye8TsEFu3ioduxA==
X-Received: by 2002:a05:6a20:918b:b0:3a0:b9d8:966 with SMTP id adf61e73a8af0-3a0b9d83334mr11249808637.55.1776773445911;
        Tue, 21 Apr 2026 05:10:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm10045274a12.16.2026.04.21.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:45 -0700 (PDT)
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
Subject: [PATCH V12 4/4] powerpc: Enable Rust for ppc64le
Date: Tue, 21 Apr 2026 17:39:58 +0530
Message-ID: <20260421120958.190430-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421120958.190430-1-mkchauras@gmail.com>
References: <20260421120958.190430-1-mkchauras@gmail.com>
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
index c90811a2f564..846fe1a45056 100644
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

