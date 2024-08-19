Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118701DB45C
	for <llvm@lists.linux.dev>; Mon, 19 Aug 2024 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103348; cv=none; b=D9rXgvdIXSQTHDTxj+Loow++KhsV/L8D/g0in9uBaQdrEJSkR0amY+TtPzed/2jbdBOv8yyPHciwuRc4wqB+kKaYdmA6OMU/4ceHN7Euzf48zhAQcoP7B/ZhuVxB1KOSu8hzq/MiUbIBTxmYi7qCFIKTzo7I08snI36Z4HxfiX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103348; c=relaxed/simple;
	bh=atblaYVjzmd5nzvgdp3enhMJfBjfEELlRe2/Ce0zq2I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qh09C8M1bU/gzBQh/07btoykxGby8v8NYSA7j0SMXS1fABXAFQD9t7GyLlJbNEB4NJCNAcJa+24tKyi6FIRK2DmItbDDWsr8imbKvlSvl9cqlt+VqS4mRNHK9jDYPBb1quUKk5XhBLy8CuISK2oplr/LyWE04qxR/8uzmk4UjK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RhF1+Wq5; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RhF1+Wq5"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0353b731b8so7763962276.2
        for <llvm@lists.linux.dev>; Mon, 19 Aug 2024 14:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724103346; x=1724708146; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFJ5TYFEs+yR5IdjkZAHXbLg1gl48k9ppZEG1vmVjrs=;
        b=RhF1+Wq5PYV+dSxp9ugquQvj0+QJetTH6uGH/j1RVbi+0jNz4NafYM9Wva9unvmJz6
         thJweqZTsvWCLivdEXbrPz5kIP/mSAyKenss9fp5xSVh2sv5XmrAuAAxX4E8GnjC6pyQ
         6DPok1uX3dKyi/Qzrd0FQFnpxVQQyuCNJf7xWvhiIZADgq7KFXEBbnyDhs72cwVGC6nG
         fajGD6M6CTw5xQwrc9ogD02yVGDPI4p3KTgEwSMd9wB8vg6ZX2z+8KkjOa39Ek4He+eu
         ++1wm4OCpRweJiHeoo4hV+1f2wRRL+c0wWLCQCq8YOg/xjAmrmueURad3AcNR2x3dMe6
         JrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724103346; x=1724708146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFJ5TYFEs+yR5IdjkZAHXbLg1gl48k9ppZEG1vmVjrs=;
        b=o3JDG1inmAksZ2iDNSgr7lU4+07oSdV3lz3jIEQbsNcT0FNaV/m3hWh0o08TT6d7i0
         udJsDnDyiURFT0O1dEk9LYwNbUFMtmVxyGAi9N+eOyoXAJJM54PBbppSMcbEuKx8RbuP
         xs9vZ6J9vUszsIdcoozK4r03y5m8LmfP2EJgcsqj9DB62k6g/iBmRcYkXjY2l8f7557q
         y5lzsE+HcdxiNTGUufqkqOk/LP4ewqa+VMHaUP8Z5aMBb6bS9p0Mt9xnbWdtQWJnbFSA
         oVA2RP9ADkMskT764dgtpAqanRbpjofZsXDkxmZTTwxD0Wayf/01LMeYrQSZSb/jRjiW
         abQg==
X-Forwarded-Encrypted: i=1; AJvYcCUabtSRAcnrRRqyq7gjFbJDCovVGA+BCQ9sAKP0YJp9o+wTCg9LKqQfbe9a2EVYr9eblTCa@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7xgbBNcx7EyGPup841PowSpQO7JV9mg4Jk7N7w8OxSDnB0J/z
	eSaSKRFFpo3WWL2aJVFMXYzhcdFxtRq+0vQTD5we5qRDuTC3QS2XgcOCxL29iSgrUbYeFyr3hXy
	0j3oPkg==
X-Google-Smtp-Source: AGHT+IG2tKNbtNYlkOTrRuz31J4vbeiBAaW0c0yUYXPPm8A2joe/19hudxJlIbHojlpceaLwmhCZjbn/6/KR
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a5b:4cb:0:b0:e11:7a38:8883 with SMTP id
 3f1490d57ef6-e1180f71f9dmr21204276.7.1724103345780; Mon, 19 Aug 2024 14:35:45
 -0700 (PDT)
Date: Mon, 19 Aug 2024 21:35:20 +0000
In-Reply-To: <20240819213534.4080408-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240819213534.4080408-3-mmaurer@google.com>
Subject: [PATCH v3 2/4] kbuild: rust: Enable KASAN support
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, Matthew Maurer <mmaurer@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
set properly.

Rust hasn't yet enabled software-tagged KWHASAN (only regular HWASAN),
so explicitly prevent Rust from being selected when it is enabled.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Makefile.kasan          | 54 +++++++++++++++++++++++----------
 scripts/Makefile.lib            |  3 ++
 scripts/generate_rust_target.rs |  1 +
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index aab4154af00a..163640fdefa0 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -12,6 +12,11 @@ endif
 KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
 
 cc-param = $(call cc-option, -mllvm -$(1), $(call cc-option, --param $(1)))
+rustc-param = $(call rustc-option, -Cllvm-args=-$(1),)
+
+check-args = $(foreach arg,$(2),$(call $(1),$(arg)))
+
+kasan_params :=
 
 ifdef CONFIG_KASAN_STACK
 	stack_enable := 1
@@ -41,39 +46,56 @@ CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
 		$(call cc-option, -fsanitize=kernel-address \
 		-mllvm -asan-mapping-offset=$(KASAN_SHADOW_OFFSET)))
 
-# Now, add other parameters enabled similarly in both GCC and Clang.
-# As some of them are not supported by older compilers, use cc-param.
-CFLAGS_KASAN += $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
-		$(call cc-param,asan-stack=$(stack_enable)) \
-		$(call cc-param,asan-instrument-allocas=1) \
-		$(call cc-param,asan-globals=1)
+# The minimum supported `rustc` version has a minimum supported LLVM
+# version late enough that we can assume support for -asan-mapping-offset
+RUSTFLAGS_KASAN := -Zsanitizer=kernel-address \
+		   -Zsanitizer-recover=kernel-address \
+		   -Cllvm-args=-asan-mapping-offset=$(KASAN_SHADOW_OFFSET)
+
+# Now, add other parameters enabled similarly in GCC, Clang, and rustc.
+# As some of them are not supported by older compilers, these will be filtered
+# through `cc-param` or `rust-param` as applicable.
+kasan_params += asan-instrumentation-with-call-threshold=$(call_threshold) \
+		asan-stack=$(stack_enable) \
+		asan-instrument-allocas=1 \
+		asan-globals=1
 
 # Instrument memcpy/memset/memmove calls by using instrumented __asan_mem*()
 # instead. With compilers that don't support this option, compiler-inserted
 # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures.
-CFLAGS_KASAN += $(call cc-param,asan-kernel-mem-intrinsic-prefix=1)
+kasan_params += asan-kernel-mem-intrinsic-prefix=1
 
 endif # CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_SW_TAGS
 
 ifdef CONFIG_KASAN_INLINE
-	instrumentation_flags := $(call cc-param,hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET))
+	kasan_params += hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET)
 else
-	instrumentation_flags := $(call cc-param,hwasan-instrument-with-calls=1)
+	kasan_params += hwasan-instrument-with-calls=1
 endif
 
-CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
-		$(call cc-param,hwasan-instrument-stack=$(stack_enable)) \
-		$(call cc-param,hwasan-use-short-granules=0) \
-		$(call cc-param,hwasan-inline-all-checks=0) \
-		$(instrumentation_flags)
+kasan_params += hwasan-instrument-stack=$(stack_enable) \
+		hwasan-use-short-granules=0 \
+		hwasan-inline-all-checks=0
+
+CFLAGS_KASAN := -fsanitize=kernel-hwaddress
+RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress \
+		   -Zsanitizer-recover=kernel-hwaddress
 
 # Instrument memcpy/memset/memmove calls by using instrumented __hwasan_mem*().
 ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y)
-	CFLAGS_KASAN += $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=1)
+	kasan_params += hwasan-kernel-mem-intrinsic-prefix=1
 endif
 
 endif # CONFIG_KASAN_SW_TAGS
 
-export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
+# Add all as-supported KASAN LLVM parameters requested by the configuration
+CFLAGS_KASAN += $(call check-args, cc-param, $(kasan_params))
+
+ifdef CONFIG_RUST
+	# Avoid calling `rustc-param` unless Rust is enabled.
+	RUSTFLAGS_KASAN += $(call check-args, rustc-param, $(kasan_params))
+endif # CONFIG_RUST
+
+export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE RUSTFLAGS_KASAN
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 9f06f6aaf7fc..4a58636705e0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -167,6 +167,9 @@ ifneq ($(CONFIG_KASAN_HW_TAGS),y)
 _c_flags += $(if $(patsubst n%,, \
 		$(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-kernel-object)), \
 		$(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
+_rust_flags += $(if $(patsubst n%,, \
+		$(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-kernel-object)), \
+		$(RUSTFLAGS_KASAN))
 endif
 endif
 
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index ced405d35c5d..c24c2abd67db 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -192,6 +192,7 @@ fn main() {
         }
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
+        ts.push("supported-sanitizers", ["kernel-address"]);
         ts.push("target-pointer-width", "64");
     } else if cfg.has("LOONGARCH") {
         panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
-- 
2.46.0.184.g6999bdac58-goog

