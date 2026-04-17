Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C762C9D
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439447; cv=none; b=Jvhvn1F36HCLboZ85YJ/e080+rHtZGANTXCs7U6R38WvqCX1kDZatWG3KeiuQWhu0BD4M58Sd0MEGUaeuDfIvXwGtsu4T7Z944KiBJw5LrTcznn3FaBknmiMB5mYLO1ccVwGwUm29yVqwlIeuNGTkGXCBBWyawgleokxbZUO9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439447; c=relaxed/simple;
	bh=KGTavH2N2h74JlTQWyY6Aj3TbwX/gCXKETtAzErZUN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Du29frsfaxsAHfHyAIdx4kS74BzjCQn1hAUdi0fsglW/SsybnHCw6vxU4Jdrhlajv0Zo1r5C4MU24ByzA4gL9OhIz6FSeerL6i9noFEp4DQP9bfnwIyjshQe/mTwrv7Q1OsiaPujYE524C7PCED7cZ/qCQ9+Wg7jIBTMCkxQhnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcurxEK/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcurxEK/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f1f6103afso398107b3a.1
        for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439445; x=1777044245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B58d6JHjS7h5Y5vjFZ6dbGJt4nx8a8vTRSygt806S6s=;
        b=qcurxEK/6Srx++UShTs+Ne0ERuxaiCedmWoyiAUkOQ26QVCNTYqKhNdBNEoSs+amE6
         oUSa74XsJHFsdoG/+zVBIT4lT8S3uOqGV5g6IGPN1XELn2H5g/9JYll7hpTd1ypa+spG
         oRpuGexwfn4eM1GY9pjI71NO4Xe6rU2ybqjzupvs60s4MCtM9w8qyQSu9rM48dIcMELy
         53AHu2dtnkQChzaZB9Dq7A1X9Y2StkcS/FXyrVT2zJUFZU8ZG5Xj37Wa4VhNUtb19ZjV
         bHmVrtcZDqgrchW7DHX5JaQ4yWhHc5C1Xh4YU0KtlNpEQc+NhwdFN8q4QYyBzwFnTQQc
         58fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439445; x=1777044245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B58d6JHjS7h5Y5vjFZ6dbGJt4nx8a8vTRSygt806S6s=;
        b=GcDiqpiHdU6+ax9IdXdjwthm6kkzDYzaG7oVKF8Enz8/6EL2pX0qhibSNmdBfu0LDK
         PaG9ZBuhCuS+KY0AAPEavfri61nTdKnXsP+/Mk59l5LpXtZuN/yZduRI9AJYGZmomwKQ
         XEIzEav0sTQs+gle5o4TPq1PViFOA4p5n7LUtBq057JQ7b5ZapC1IFAC/QGqJ1UHmZMv
         klGIvL59p5Y1qxQlDK1mFn8dR4B/j6R45fUE1oGXUpUl+uzBJWPZ1hyKiQxs85jb0MmS
         ukONEPGatBWJGc6W2yhfK3hBEVkGM6l970KlGZaq8GZgs/V69plo5Irn6BPPfFHur9oV
         2sTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bLSeliWR+UFczXVTL9Hkbom3FE1YquXpfBMauEDBnO8ojsBv74PxzV4HGQTmUzfAzQIYj@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0VVZAvw3gbps64YanUUv5GA7QigQVwWIs+XSCkCwvBBxIqvcm
	Fu6HRWze+Ngv4pYGPMDCyWtpDViLj/RE2/pNqBOyshQ1SDRjBS6pOJAJ
X-Gm-Gg: AeBDieuuZ4kSXA+fiN4o2XgiEoLQovh+woPwURJUU3k03Nw/akP3y7YNS1d8tdxLaMX
	BjiO7Oa+pyChA+kUw2POVp4U8u3phZInTtX4CJvjRv8sHZN/o3Flf4TCtdoAuckfR8hytSq71Vo
	iUsWGGs9zpTBAn86XTezFNObghiLN480rMVAyqeiJXJ3ZM+GCWnvOhQ6DcfsaiPxUxlqu1JPrCG
	P7FEOqQIe3DJp0SlpVdSb/hDZOjBX2yN0xCYWNJWRQPA75yIuZtstjuV2alQvibq8/9THe06vnq
	SWEV5NqrqYttboJBR08KoinLlIz8X8G1V1qYdCQZjP83uoaePPKIS644PvM6X7KQxKNMiH9M9kp
	Ppcb7MmvlkD2VYgK93ODXjfv9EPERVeC3CB0XEv0Jn9DWwparcWSnZXazzt5b9hD3uZ8WcY+R75
	jb1M/ive+IjrMXBERdy3mmaiokhsGJpXssuSQqmDGnH9oY9LTPqczPLF0rCPwMkOauuMPiicXXj
	t/zXxGjqT87cMPiGg/Jr1wVpg==
X-Received: by 2002:a05:6a00:984:b0:82f:6cd5:1ead with SMTP id d2e1a72fcca58-82f8c86b573mr3320740b3a.16.1776439445297;
        Fri, 17 Apr 2026 08:24:05 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm2384373b3a.31.2026.04.17.08.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:24:05 -0700 (PDT)
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
Subject: [PATCH V11 4/4] powerpc: Enable Rust for ppc64le
Date: Fri, 17 Apr 2026 20:52:53 +0530
Message-ID: <20260417152253.2312961-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417152253.2312961-1-mkchauras@gmail.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
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
index af0c8ab2e5b6..99537c2c55ee 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -414,7 +414,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

