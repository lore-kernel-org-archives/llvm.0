Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274CB335BB4
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505763; cv=none; b=dIpkelRodXKGk9gApIPOvgfXLIwSNp1zUlK/69PFcsTsgTQblA6iZYFFz7VET+qwxjO5iOXKw8gyP/xC2wPzYGT+wXScxMn15glLralNHBAdtQMNqTZ5vDAn0/Z2wbUQegCU8OW11+wV7Y7XnxhzyvhZkVJM8MT40DHE6Fk4DsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505763; c=relaxed/simple;
	bh=pZYgWqinwCi2XlavtGMuYp6nbKIMJVmgtA/tr2/njSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RCn1k9h1Qtz/UXCjndaTR6H2CnnxMW+Icli0hVEAa8TEqaSkAakvwzz1zU4FRlcbvZIwzxT5Svhn66yv7zq2KrRpzbUZgTW0qwCL1kCIlcKWKvXjFZPPvqy+PMFkUbMFlCDcOGiozwmsq7qGgYVbch2iJv901D4sH8s8xPG+Gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QysLhXm6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QysLhXm6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b256a4c6b5so25508165ad.0
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 13:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775505761; x=1776110561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2r7y3l0YoAacVN6N8CSzvUk5PKNLzqAsC5O2toHlyY=;
        b=QysLhXm6BhpjLn/Iqs/YPHLBurOPxFVBPs7BovrYrfY1HSNWy04qrYKMQ+O+XN/4HX
         NPKEpD2bBlyMP9iMBGC3apEeF3qunDdHDkjgVYv+6wHc3HKe+w7rzezc1Pvcc1iUa03P
         6qK4kXAhyJh8s/Tq5oYjIVpS7Oe3tu5Ex3HjjzHlAM+rkjWuSYz5wTaTMU13l2BTMxWa
         BLUaVUj2JhEgKSjwzA1ueQiZiRzq/fYEI211UVRX8n3gkSdI/55tlHcNtkUl4+Rqq0vn
         GBchFp+f2QMISn99QqftoSMbXiYpJEWYjch+f3JvXN2DbDXEGf1h2vqB5woW6OHOeVjC
         /egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775505761; x=1776110561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2r7y3l0YoAacVN6N8CSzvUk5PKNLzqAsC5O2toHlyY=;
        b=XO8Yk5M/4N9OXUUz3RdpvHa3MDTuMC582msWeuIAAIrLXA1hlgNsyvFJgSeTQ9tXG+
         5zqSYSYxhOw2odCx8PSzxrGBxbYfv5UU4C8opDq6q76UCm6cWUdCvx5JTEWQOjQWdVUl
         SCSjEisjyBXVzOatwt4t+rUUN9drjX1mifsCAGThrGF011lC1S8QgMSrGzQ4pvRjJY1b
         I2eVf/oJA1eZCvpgK08nmhnplak7QCzCHjA/vBgyRe8fSBKDItuBCR1NXnD+G/9FjDRv
         OZXs7E3vC5/Hi8yK1OnoTOtJDfcTk1yKAQprhNnWdgwClCrz+fWWHsezRiNSgTk5tFQl
         YXcA==
X-Forwarded-Encrypted: i=1; AJvYcCXrA3K7hFEFx3s8OlCN2sXenet9HQlkVvyI3ML/5LlKDdYcSXjWfBbEjd090ndfS6wv7Y8D@lists.linux.dev
X-Gm-Message-State: AOJu0YxnBRqYrAn4Ozp8RcIpRmq+0yEzfSlSWlsyzjSrr6lfelXX6WTF
	MnQAwZTPtZRUzdiV/gUCEoYKokCKiJqnFhrnltbem6n7I9pWU8zWWPpE
X-Gm-Gg: AeBDiessG8Kn+yuNVJtjdOMc/lRii4oQOUB0bsyIXPKnU//qhzCH+9x2pEk/++HfntN
	CjPucbrDO8NE72VbmWdMt1lmx5+eqAavKd3CoQ0hIj1PnoI6HtB0uhR5b1JetjR8JF/znmWIgap
	NAABkxl6maSkjRc/1p5VlHtOdZoVivD9cmRXnPRj0LB6WRdALbBEuuf+FwtfAAyuKp+oijTQqKc
	/C4D3ZatzfcgLS4y2ohX50QmVUPlbfj8fUqTgJAPb+qMNEym8jXa7jSpAnLFSTuZ/t6rIDDvO39
	GCnlfuk4OwwoJ5cIf58gDAhLQ9yiReo5/aSpQL15+HxezVdsaGsJqyQWzs5plC15OILzvlHdMmb
	LprvLXFp5sCYHTytBnLqZijJ97OTE79c7TPqbhoO8YBvOT/bEm4H+7XxQSFWpmkwEdoPKczjjT0
	a4Havl3ltdsd4chR7UQKc20onQRF5okBHEJx0PMOolD/Mu92N8dNPyfC4pzq/yzLq6hJy2yeBuO
	2M=
X-Received: by 2002:a17:903:2ac5:b0:2b2:42da:25cc with SMTP id d9443c01a7336-2b28163ad55mr150030455ad.1.1775505761363;
        Mon, 06 Apr 2026 13:02:41 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af26sm151098205ad.49.2026.04.06.13.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:02:41 -0700 (PDT)
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
Subject: [PATCH V10 4/4] powerpc: Enable Rust for ppc64le
Date: Tue,  7 Apr 2026 01:31:49 +0530
Message-ID: <20260406200149.3727922-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406200149.3727922-1-mkchauras@gmail.com>
References: <20260406200149.3727922-1-mkchauras@gmail.com>
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
index e53cb16c06c1..e106d6feb8da 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -413,7 +413,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
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

