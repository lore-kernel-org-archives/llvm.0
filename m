Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25F2166F04
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183367; cv=none; b=CViDeOV9fnQWm59S/m8XkgbfVS0W3c4pjbv46v70GZ5peALxq98BdVbqnAeSTvV+OXCCg1kLZbAPfI2UqZ/7epeK0ZSEg2ebRdysW6aOmbMHwUdTZ2EPLvW/bozOzsGJ7jdM/5BsJVsmT6wF80+MlVFWSiyGs6fRdwdKv5zTIek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183367; c=relaxed/simple;
	bh=loHNQjiKZWgc0j8bk3IVjHK0khQghAWR4+gS4550mSc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BA7aZE+RUicgUvI6RxP5wOSvI0aeAtkPoLxW+ae3L4VjvC5tdUHzp3qbqSpu5VdqAvbvq87ZNf4gawV34d58hAKN7OUoeLd8JvQg0+VEzpvwaS9bKk2kH0sa/inZBbGN28GBYMJCh/+WADQSmEalV1DpEP4exWuDAPSa3yRVt0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQG97G+G; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQG97G+G"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6b46d8bc153so55395707b3.2
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724183365; x=1724788165; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYOQ4ic50oYuK2FpEcKGnGi9zqTDnUtCD7+2BoOkpco=;
        b=bQG97G+G4bUroRZ1xW/7ITGFSxy4TyV5Io43n6x4pW2xHYeGtpVkbvsPtjBiN0NK3L
         ONRLYF1IdV4RJGSGUx9e7zqrdM6Lw19gzOeuDFvFsrmxkL45CHWob5pSnSzlOtRVBJPP
         tVVkansDe1W8YHGCdreW86y7wgjeGC9QDJ1tKyqdpeCewtPyv1WKkzbtNceU9Li3JB8d
         8xOiZWZP+dUTUT74In3uvDX4W1Dou4lw4xtj/tHvkRjZqC8IaSIPUW/7nuZ9OvmclPjs
         LqtyOJ5iPNSKjcwvUB5LNlOOsP+e7IZeAUwbZ7jbdufH69i9aSHv/oZrshQj8VeHf4mg
         oWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183365; x=1724788165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jYOQ4ic50oYuK2FpEcKGnGi9zqTDnUtCD7+2BoOkpco=;
        b=JbyZFPFl3qtjRojR2RpJiieEyBWse1QHpW5nXDEg1OOyIPtJUSk89GqvpkIWr3/ewO
         nvHPpnATpYW/zHDZDDfzNfVMHf7n2mOzfsULksjhH0L7VzSt2eseOfA2azs++C68JWqj
         NFQIJP7RObZ/kX3GJ+ygq3712w/PAzIbalDbaU3o0qufH7GBB93ev0RO5bi48cEqkyvw
         5KUMqEyc2WNvCc1wGfTkUFQu0opw4ZEOBXg1SI/GnE7igAqPL5E2DRAVEafeanRCBg4g
         xBf6OuCYMfZQbaf3tKIQP7gOhb5azt+Vo20Aj5U77JiGA8eLqZiujEpLwirh1o4+IpZI
         FNrA==
X-Forwarded-Encrypted: i=1; AJvYcCVpEkSg6WsxL2CXDBk7w396dANJAb470E0rRTscc9Cv7TBfrvXJ3VRqbIp/4mkJkNCYvBWk@lists.linux.dev
X-Gm-Message-State: AOJu0YwSSOCoTCNFp5a0caTOo0DuG9PUq0Koca6cdokCDcDhsDMIo98R
	LprFQEf7G0cWnOA4WoO+ib3sZ0odsArnju0y+NcwU781DEolRRFW8wx+K9v5PU9sEzRfxOHW6Dd
	Ah5mAxw==
X-Google-Smtp-Source: AGHT+IE7sGIPkJ+edoqGJ+fIEw1QkDsz00XLJirRhxEYq6ET/0uf39KsW1PUXkwOfVWsCP5G1VWLg50n5WDX
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:340a:b0:6ad:351e:a9d0 with SMTP
 id 00721157ae682-6c09c5982aamr6117b3.3.1724183364571; Tue, 20 Aug 2024
 12:49:24 -0700 (PDT)
Date: Tue, 20 Aug 2024 19:48:58 +0000
In-Reply-To: <20240820194910.187826-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240820194910.187826-4-mmaurer@google.com>
Subject: [PATCH v4 3/4] kbuild: rust: Enable KASAN support
From: Matthew Maurer <mmaurer@google.com>
To: andreyknvl@gmail.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: dvyukov@google.com, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	Matthew Maurer <mmaurer@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
set properly.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Makefile.kasan          | 57 ++++++++++++++++++++++++---------
 scripts/Makefile.lib            |  3 ++
 scripts/generate_rust_target.rs |  1 +
 3 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index aab4154af00a..97570df40a98 100644
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
@@ -41,39 +46,59 @@ CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
 		$(call cc-option, -fsanitize=kernel-address \
 		-mllvm -asan-mapping-offset=$(KASAN_SHADOW_OFFSET)))
 
-# Now, add other parameters enabled similarly in both GCC and Clang.
-# As some of them are not supported by older compilers, use cc-param.
-CFLAGS_KASAN += $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
-		$(call cc-param,asan-stack=$(stack_enable)) \
-		$(call cc-param,asan-instrument-allocas=1) \
-		$(call cc-param,asan-globals=1)
+# The minimum supported `rustc` version has a minimum supported LLVM
+# version late enough that we can assume support for -asan-mapping-offset.
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
 
+CFLAGS_KASAN := -fsanitize=kernel-hwaddress
+
+# This sets flags that will enable KHWASAN once enabled in Rust. These will
+# not work today, and is guarded against in dependencies for CONFIG_RUST.
+RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress \
+		   -Zsanitizer-recover=kernel-hwaddress
+
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
 
 # Instrument memcpy/memset/memmove calls by using instrumented __hwasan_mem*().
 ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y)
-	CFLAGS_KASAN += $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=1)
+	kasan_params += hwasan-kernel-mem-intrinsic-prefix=1
 endif
 
 endif # CONFIG_KASAN_SW_TAGS
 
-export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
+# Add all as-supported KASAN LLVM parameters requested by the configuration.
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

